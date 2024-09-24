package bean;

import java.sql.Date;
import java.sql.Timestamp;

public class BookingBean {
    private int serviceId;
    private String serviceName;
    private int amountFrom;
    private int amountTo;
    private String appointmentDate;
    private String appointmentTime;
    private String userEmail;
    private String paymentId;

    // Getters and setters
    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getAmountFrom() {
        return amountFrom;
    }

    public void setAmountFrom(int amountFrom) {
        this.amountFrom = amountFrom;
    }

    public int getAmountTo() {
        return amountTo;
    }

    public void setAmountTo(int amountTo) {
        this.amountTo = amountTo;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }
}
