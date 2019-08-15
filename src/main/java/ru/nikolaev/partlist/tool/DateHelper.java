package ru.nikolaev.partlist.tool;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

/**
 *
 * @author alexander
 */
public class DateHelper {

    final static DateTimeFormatter ISO_DATE_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssx");
    final static DateTimeFormatter PRINT_DATE_FORMAT = DateTimeFormatter.ofPattern("MMM dd, yyyy");
    final static DateTimeFormatter HTML_FORM_DATE_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    /**
     * Получение объекта даты из строкового значения
     *
     * @param inputDate
     * @return объект LocalDate
     */
    public static LocalDate convertDateFromString(String inputDate) {
        if (inputDate == null) {
            return null;
        }

        try {
            return LocalDate.parse(inputDate, ISO_DATE_FORMAT);
        } catch (DateTimeParseException e) {
            return null;
        }
    }

    /**
     * Получение читаемого формата даты в виде строки
     *
     * @param inputDate
     * @return строка в формате MMM dd, yyyy
     */
    public static String formatDate(String inputDate) {
        if (inputDate == null) {
            return "";
        }

        try {
            return LocalDate.parse(inputDate, ISO_DATE_FORMAT).format(PRINT_DATE_FORMAT);
        } catch (DateTimeParseException e) {
            return "";
        }
    }

    /**
     * Преобразование пришедшей с формы даты в корректный формат фильтра
     *
     * @param requestDate
     * @return дату, если с формы пришло что-то распарсиваемое, null в противном
     * случае
     */
    public static String fiterHtmlFormDate(String requestDate) {
        try {
            return requestDate != null ? LocalDate.parse(requestDate, HTML_FORM_DATE_FORMAT).format(HTML_FORM_DATE_FORMAT) : null;
        } catch (DateTimeParseException ex) {
            return null;
        }
    }
}
