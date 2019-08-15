package ru.nikolaev.partlist.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;
import org.apache.log4j.Logger;
import ru.nikolaev.partlist.model.SearchFilter;

/**
 * Объект-обёртка для прямого доступа к данным таблицы part
 *
 * @author alexander
 */
public class PartDao {

    final static Logger LOGGER = Logger.getLogger(PartDao.class);

    /**
     * Получение набора данных из БД по заданному фильтру
     *
     * @param filter
     * @param sortField
     * @param descendingSort
     * @return ResultSet|null
     * @throws SQLException
     */
    public ResultSet find(SearchFilter filter, String sortField, boolean descendingSort) throws SQLException {
        Connection connection = Connector.getConnection();
        if (connection == null) {
            return null;
        }

        StringBuilder sql = new StringBuilder();

        // WHERE условие
        ArrayList<String> stringValues = new ArrayList<>();
        ArrayList<Integer> intValues = new ArrayList<>();
        ArrayList<Date> dateValues = new ArrayList<>();
        // строки и числа
        this.addWhereCondition(sql, stringValues, intValues, "part_number", filter.getPartNumber(), Optional.empty());
        this.addWhereCondition(sql, stringValues, intValues, "part_name", filter.getPartName(), Optional.empty());
        this.addWhereCondition(sql, stringValues, intValues, "vendor", filter.getVendor(), Optional.empty());
        this.addWhereCondition(sql, stringValues, intValues, "quantity", Optional.empty(), filter.getQuantity());
        // даты
        this.addDateCondition(filter, sql, dateValues);

        // сам запрос
        sql.insert(0, "SELECT id, part_number, part_name, vendor, quantity, shipped, received FROM part ");

        // сортировка
        sql.append(" ORDER BY ").append(sortField).append(descendingSort ? " DESC NULLS FIRST " : " ASC NULLS LAST ");

        PreparedStatement findStatement = connection.prepareStatement(sql.toString());

        // заполнение PreparedStatement
        // сначала строковые параметры
        int stringIdx = 0;
        for (; stringIdx < stringValues.size(); stringIdx++) {
            findStatement.setString(1 + stringIdx, stringValues.get(stringIdx));
        }
        //числовые параметры
        int intIdx = 0;
        for (; intIdx < intValues.size(); intIdx++) {
            findStatement.setInt(1 + stringIdx + intIdx, intValues.get(intIdx));
        }
        // даты
        int dateIdx = 0;
        for (; dateIdx < dateValues.size(); dateIdx++) {
            findStatement.setDate(1 + stringIdx + intIdx + dateIdx, dateValues.get(dateIdx));
        }

        // результат
        return findStatement.executeQuery();
    }

    /**
     * Добавление условия к запросу по заполненности полей фильтра, строковых
     * или числовых
     *
     * @param sql <code>StringBuilder</code> запроса, к которому добавляются
     * условия
     * @param stringValues упорядоченный список строковых значений условий
     * @param intValues упорядоченный список числовых значений условий
     * @param fieldName имя поля таблицы
     * @param stringFieldValue строковое значение, если задано - условие будет
     * добавлено как строка через LIKE
     * @param intFieldValue числовое значение, если задано - условие будет
     * добавлено как число через >=
     */
    private void addWhereCondition(StringBuilder sql,
            ArrayList<String> stringValues,
            ArrayList<Integer> intValues,
            String fieldName,
            Optional<String> stringFieldValue,
            Optional<Integer> intFieldValue) {
        if (stringFieldValue.isPresent() || intFieldValue.isPresent()) {
            if (stringFieldValue.isPresent()) {
                // Text fields are filtered using “like” criteria
                // Не строим условия на пустые строки
                if (stringFieldValue.get().length() > 0) {
                    prefixSqlCondition(sql);
                    sql.append(fieldName).append(" ILIKE ?");
                    stringValues.add("%" + stringFieldValue.get() + "%");
                }
            } else {
                // Integer fields are filtered using “not less” criteria
                prefixSqlCondition(sql);
                sql.append(fieldName).append(" >= ?");
                intValues.add(intFieldValue.get());
            }
        }
    }

    /**
     * Добапвление к SQL условий на даты
     *
     * @param filter объект фильтра
     * @param sql StringBuilder формируемого sql-запроса
     * @param dateValues упорядоченный список значений для условий
     */
    private void addDateCondition(SearchFilter filter, StringBuilder sql, ArrayList<Date> dateValues) {
        DateTimeFormatter htmlDateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if (filter.getShippedDateAfter().isPresent() && filter.getShippedDateBefore().isPresent()) {
            this.prefixSqlCondition(sql);
            sql.append("shipped BETWEEN ? AND ?");
            dateValues.add(Date.valueOf(LocalDate.parse(filter.getShippedDateAfter().get(), htmlDateFormat)));
            dateValues.add(Date.valueOf(LocalDate.parse(filter.getShippedDateBefore().get(), htmlDateFormat)));
        } else {
            if (filter.getShippedDateAfter().isPresent()) {
                // только левая граница
                this.prefixSqlCondition(sql);
                sql.append("shipped >= ?");
                dateValues.add(Date.valueOf(LocalDate.parse(filter.getShippedDateAfter().get(), htmlDateFormat)));
            }
            if (filter.getShippedDateBefore().isPresent()) {
                // только правая граница
                this.prefixSqlCondition(sql);
                sql.append("shipped <= ?");
                dateValues.add(Date.valueOf(LocalDate.parse(filter.getShippedDateBefore().get(), htmlDateFormat)));
            }
        }
        if (filter.getReceivedDateAfter().isPresent() && filter.getReceivedDateBefore().isPresent()) {
            this.prefixSqlCondition(sql);
            sql.append("received BETWEEN ? AND ?");
            dateValues.add(Date.valueOf(LocalDate.parse(filter.getReceivedDateAfter().get(), htmlDateFormat)));
            dateValues.add(Date.valueOf(LocalDate.parse(filter.getReceivedDateBefore().get(), htmlDateFormat)));
        } else {
            if (filter.getReceivedDateAfter().isPresent()) {
                // только левая граница
                this.prefixSqlCondition(sql);
                sql.append("received >= ?");
                dateValues.add(Date.valueOf(LocalDate.parse(filter.getReceivedDateAfter().get(), htmlDateFormat)));
            }
            if (filter.getReceivedDateBefore().isPresent()) {
                // только правая граница
                this.prefixSqlCondition(sql);
                sql.append("received <= ?");
                dateValues.add(Date.valueOf(LocalDate.parse(filter.getReceivedDateBefore().get(), htmlDateFormat)));
            }
        }
    }

    /**
     * Условие либо начинается с WHERE, либо продолжается через AND
     *
     * @param sql StringBuilder выстраиваемого sql-запроса
     */
    private void prefixSqlCondition(StringBuilder sql) {
        if (sql.length() > 0) {
            sql.append(" AND ");
        } else {
            sql.append(" WHERE ");
        }
    }

    public void generateRandomData() throws SQLException {
        Connection connection = Connector.getConnection();
        if (connection == null) {
            return;
        }

        List<String> partnames = Arrays.asList("Processor", "Memory", "HDD", "SSD", "Graphic Card", "Mainboard", "Display", "Case", "Fan", "Keyboard");
        List<String> vendors = Arrays.asList("IBM", "AMD", "Lenovo", "Acer", "HP", "Apple", "Samsung", "MCI", "Эльбрус", "NVIDIA");

        Date d1 = new Date(117, 0, 01);
        Date d2 = new Date(119, 7, 01);

        PreparedStatement insertStatement = connection.prepareStatement("INSERT INTO part (part_number, part_name, vendor, shipped, received, quantity) VALUES (?, ?, ?, ?, ?, ?)");
        for (int i = 0; i < 100; i++) {
            insertStatement.setString(1, UUID.randomUUID().toString().replaceAll("-", ""));
            insertStatement.setString(2, partnames.get((int) (Math.random() * 10)));
            insertStatement.setString(3, vendors.get((int) (Math.random() * 10)));

            Date shippedDate = null;
            int shippedDateSeed = (int) (Math.random() * 10);
            if (shippedDateSeed != 0 && shippedDateSeed != 5) {
                shippedDate = new Date(ThreadLocalRandom.current().nextLong(d1.getTime(), d2.getTime()));
            }
            
            Date receivedDate = null;
            int receivedDateSeed = (int) (Math.random() * 10);
            if (receivedDateSeed != 3 && receivedDateSeed != 7) {
                receivedDate = new Date(ThreadLocalRandom.current().nextLong(d1.getTime(), d2.getTime()));
            }

            insertStatement.setDate(4, shippedDate);
            insertStatement.setDate(5, receivedDate);
            
            insertStatement.setInt(6, (int)(Math.random() * 100));
            
            insertStatement.execute();
        }
    }

}
