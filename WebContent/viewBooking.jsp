<%@ page import="dao.BookingDAO, bean.BookingBean, java.util.List, javax.servlet.http.HttpSession" %>
<%
    // Retrieve the user's email from the session
    HttpSession httpsession = request.getSession(false);
    String email = null;
    if (httpsession != null) {
        email = (String) httpsession.getAttribute("email");
    }

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Retrieve the booking details from the DAO
    BookingDAO bookingDAO = new BookingDAO();
    List<BookingBean> bookings = bookingDAO.getBookingsByUserEmail(email);

    if (bookings == null || bookings.isEmpty()) {
        out.println("<div class='alert alert-warning'>No bookings found.</div>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Bookings</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style type="text/css">
        body {
            background-color: #e9ecef; /* Light gray background */
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 1200px;
            padding: 30px;
        }

        .card {
            border: none; /* Remove border */
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            background-color: #fff; /* White background */
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px); /* Lift effect on hover */
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            color: #333; /* Dark gray text */
            margin-bottom: 0.5rem;
        }

        .card-text {
            font-size: 1rem;
            color: #555; /* Slightly lighter gray */
            margin-bottom: 0.5rem;
        }

        .alert {
            text-align: center;
            color: #333; /* Dark gray text */
        }

        h3 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #212529;
            text-align: center;
            margin-bottom: 20px;
        }

        h4 {
            color: #333; /* Dark gray */
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>VELVETVIBE</h3>
        <h4 class="text-center">Your Booking Details</h4>
        <div class="row">
            <%
                for (BookingBean booking : bookings) {
            %>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Booking ID: <%= booking.getBooking_id() %></h5>
                            <p class="card-text"><strong>Service Name:</strong> <%= booking.getService_name() %></p>
                            <p class="card-text"><strong>Amount Range:</strong> &#x20B9; <%= booking.getAmount_from() %> - &#x20B9; <%= booking.getAmount_to() %></p>
                            <p class="card-text"><strong>Appointment Date:</strong> <%= booking.getAppointment_date() %></p>
                            <p class="card-text"><strong>Appointment Time:</strong> <%= booking.getAppointment_time() %></p>
                            <p class="card-text"><strong>Payment Status:</strong> <%= booking.getPayment_status() != null ? booking.getPayment_status() : "Pending" %></p>
                        </div>
                    </div>
                </div>
            <%
                }
            %>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
