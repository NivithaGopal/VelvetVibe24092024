package dao;

import bean.BookingBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import dbconnection.DBConnection; // Assume you have a DBConnection class for getting the connection.

public class BookingDAO {

    private static final String INSERT_BOOKING_SQL = "INSERT INTO bookings (service_id, service_name, amount_from, amount_to, appointment_date, appointment_time, user_email, payment_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    public boolean saveBooking(BookingBean booking) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO bookings (service_id, service_name, amount_from, amount_to, appointment_date, appointment_time, user_email, payment_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, booking.getServiceId());
            stmt.setString(2, booking.getServiceName());
            stmt.setInt(3, booking.getAmountFrom());
            stmt.setInt(4, booking.getAmountTo());
            stmt.setDate(5, java.sql.Date.valueOf(booking.getAppointmentDate())); // Ensure the format is correct
            stmt.setString(6, booking.getAppointmentTime());
            stmt.setString(7, booking.getUserEmail());
            stmt.setString(8, booking.getPaymentId());
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Close resources
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

}
