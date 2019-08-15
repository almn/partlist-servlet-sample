package ru.nikolaev.partlist.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

/**
 * Модель сущности Part
 *
 * @author alexander
 */
public class Part implements Serializable {

    private Long id;

    private String partName;

    private String partNumber;

    private String vendor;

    private int quantity;

    private LocalDate shippedDate;

    private LocalDate receivedDate;

    public Part(Long id, String partName, String partNumber, String vendor,
            int quantity, LocalDate shippedDate, LocalDate recievedDate) {
        this.id = id;
        this.partName = partName;
        this.partNumber = partNumber;
        this.vendor = vendor;
        this.quantity = quantity;
        this.shippedDate = shippedDate;
        this.receivedDate = recievedDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public String getPartNumber() {
        return partNumber;
    }

    public void setPartNumber(String partNumber) {
        this.partNumber = partNumber;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public LocalDate getShippedDate() {
        return shippedDate;
    }

    public Date getShippedDateAsDate() {
        return shippedDate == null ? null : Date.from(shippedDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
    }

    public void setShippedDate(LocalDate shippedDate) {
        this.shippedDate = shippedDate;
    }

    public LocalDate getReceivedDate() {
        return receivedDate;
    }

    public Date getReceivedDateAsDate() {
        return receivedDate == null ? null : Date.from(receivedDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
    }

    public void setReceivedDate(LocalDate receivedDate) {
        this.receivedDate = receivedDate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Part)) {
            return false;
        }
        Part other = (Part) object;
        if ((this.id == null && other.id != null)
                || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ru.nikolaev.partlist.model.Part[ id=" + id + " ]";
    }

}
