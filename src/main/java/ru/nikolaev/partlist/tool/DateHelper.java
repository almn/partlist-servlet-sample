package ru.nikolaev.partlist.tool;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

/**
 *
 * @author alexander
 */
public class DateHelper {

    final static DateTimeFormatter ISO_DATE_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssx");
    final static DateTimeFormatter SERVLET_DATE_FORMAT = DateTimeFormatter.ofPattern("MMM dd, yyyy");

    /**
     * Получение объекта даты из строкового значения
     *
     * @param dateString
     * @return объект LocalDate
     */
    public static LocalDate convertDateFromString(String dateString) {
        if (dateString == null) {
            return null;
        }

        try {
            return LocalDate.parse(dateString, ISO_DATE_FORMAT);
        } catch (DateTimeParseException e) {
            return null;
        }
    }

    /**
     * Получение читаемого формата даты в виде строки
     *
     * @param dateString
     * @return строка в формате MMM dd, yyyy
     */
    public static String formatDate(String dateString) {
        if (dateString == null) {
            return "";
        }

        try {
            return LocalDate.parse(dateString, ISO_DATE_FORMAT).format(SERVLET_DATE_FORMAT);
        } catch (DateTimeParseException e) {
            return "";
        }
    }

    /**
     * Получение даты для SQL-запроса из формата, принятого в сервлете
     * @param dateString
     * @return java.sql.Date или null, когда распрасить строку не удалось
     */
    public static Date formatDateForSql(String dateString) {
        if (dateString == null) {
            return null;
        }

        try {
            return Date.valueOf(LocalDate.parse(dateString, SERVLET_DATE_FORMAT));
        } catch (DateTimeParseException e) {
            return null;
        }
    }

    /**
     * Преобразование пришедшей с формы даты в корректный формат фильтра
     *
     * @param requestDateString
     * @return дату, если с формы пришло что-то распарсиваемое, null в противном
     * случае
     */
    public static String fiterHtmlFormDate(String requestDateString) {
        try {
            return requestDateString != null ? LocalDate.parse(requestDateString, SERVLET_DATE_FORMAT).format(SERVLET_DATE_FORMAT) : null;
        } catch (DateTimeParseException ex) {
            return null;
        }
    }
}
