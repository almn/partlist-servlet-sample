package ru.nikolaev.partlist.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.apache.log4j.Priority;
import ru.nikolaev.partlist.model.Part;
import ru.nikolaev.partlist.tool.DateHelper;

/**
 * Класс маппинга сырых данных из БД в модели
 *
 * @author alexander
 */
public class PartMapper {

    final static Logger LOGGER = Logger.getLogger(PartMapper.class);

    /**
     * Маппинг сырых данных
     *
     * @param rs рекордлсет ответа БД
     * @return List с объектами типа Part
     */
    public static List<Part> map(ResultSet rs) {
        ArrayList<Part> result = new ArrayList<>();
        if (rs == null) {
            return result;
        }
        try {
            while (rs.next()) {
                result.add(new Part(
                        rs.getLong("id"),
                        rs.getString("part_name"),
                        rs.getString("part_number"),
                        rs.getString("vendor"),
                        rs.getInt("quantity"),
                        DateHelper.convertDateFromString(rs.getString("shipped")),
                        DateHelper.convertDateFromString(rs.getString("received"))
                ));
            }
        } catch (SQLException ex) {
            LOGGER.log(Priority.ERROR, "Result iteration error", ex);
        }
        return result;
    }

}
