package ru.nikolaev.partlist.model;

import java.util.Optional;

/**
 * Объект-обертка для передачи данных фильтра
 *
 * @author alexander
 */
public class SearchFilter {

    private Optional<String> partName;
    private Optional<String> partNumber;
    private Optional<String> vendor;
    private Optional<Integer> quantity;
    private Optional<String> shippedDateAfter;
    private Optional<String> shippedDateBefore;
    private Optional<String> receivedDateAfter;
    private Optional<String> receivedDateBefore;

    public SearchFilter(Optional<String> partName,
            Optional<String> partNumber,
            Optional<String> vendor,
            Optional<Integer> quantity,
            Optional<String> shippedDateAfter,
            Optional<String> shippedDateBefore,
            Optional<String> receivedDateAfter,
            Optional<String> receivedDateBefore) {
        this.partName = partName;
        this.partNumber = partNumber;
        this.vendor = vendor;
        this.quantity = quantity;
        this.shippedDateAfter = shippedDateAfter;
        this.shippedDateBefore = shippedDateBefore;
        this.receivedDateAfter = receivedDateAfter;
        this.receivedDateBefore = receivedDateBefore;
    }

    public Optional<String> getPartName() {
        return partName;
    }

    public void setPartName(Optional<String> partName) {
        this.partName = partName;
    }

    public Optional<String> getPartNumber() {
        return partNumber;
    }

    public void setPartNumber(Optional<String> partNumber) {
        this.partNumber = partNumber;
    }

    public Optional<String> getVendor() {
        return vendor;
    }

    public void setVendor(Optional<String> vendor) {
        this.vendor = vendor;
    }

    public Optional<Integer> getQuantity() {
        return quantity;
    }

    public void setQuantity(Optional<Integer> quantity) {
        this.quantity = quantity;
    }

    public Optional<String> getShippedDateAfter() {
        return shippedDateAfter;
    }

    public void setShippedDateAfter(Optional<String> shippedDateAfter) {
        this.shippedDateAfter = shippedDateAfter;
    }

    public Optional<String> getShippedDateBefore() {
        return shippedDateBefore;
    }

    public void setShippedDateBefore(Optional<String> shippedDateBefore) {
        this.shippedDateBefore = shippedDateBefore;
    }

    public Optional<String> getReceivedDateAfter() {
        return receivedDateAfter;
    }

    public void setReceivedDateAfter(Optional<String> receivedDateAfter) {
        this.receivedDateAfter = receivedDateAfter;
    }

    public Optional<String> getReceivedDateBefore() {
        return receivedDateBefore;
    }

    public void setReceivedDateBefore(Optional<String> receivedDateBefore) {
        this.receivedDateBefore = receivedDateBefore;
    }

    /**
     * Сборка query-строки с заполненными параметрами фильтра
     *
     * @return строка GET-запроса с парамтрами фильтрации
     */
    public String getQueryString() {
        StringBuilder queryStringBuilder = new StringBuilder("?");
        if (this.partNumber.isPresent()) {
            queryStringBuilder.append("part_number=").append(this.partNumber.get()).append("&");
        }
        if (this.partName.isPresent()) {
            queryStringBuilder.append("part_name=").append(this.partName.get()).append("&");
        }
        if (this.vendor.isPresent()) {
            queryStringBuilder.append("vendor=").append(this.vendor.get()).append("&");
        }
        if (this.quantity.isPresent()) {
            queryStringBuilder.append("quantity=").append(this.quantity.get()).append("&");
        }
        if (this.shippedDateAfter.isPresent()) {
            queryStringBuilder.append("shipped_after=").append(this.shippedDateAfter.get()).append("&");
        }
        if (this.shippedDateBefore.isPresent()) {
            queryStringBuilder.append("shipped_before=").append(this.shippedDateBefore.get()).append("&");
        }
        if (this.receivedDateAfter.isPresent()) {
            queryStringBuilder.append("received_after=").append(this.receivedDateAfter.get()).append("&");
        }
        if (this.receivedDateBefore.isPresent()) {
            queryStringBuilder.append("received_before=").append(this.receivedDateBefore.get()).append("&");
        }
        return queryStringBuilder.toString();
    }
}
