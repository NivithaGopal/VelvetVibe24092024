<%@page import="dao.BookingDAO"%>
<%@page import="bean.BookingBean"%>
<%@page import="bean.UserRegistration"%>
<%@page import="dao.UserRegistrationDAO"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Book Service</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
            color: #333;
            padding-top: 5rem;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            border: none;
            margin-bottom: 20px;
        }
        .card-header {
            background: #343a40;
            color: #fff;
            text-align: center;
            padding: 20px;
            font-size: 1.5rem;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%
    // Retrieve the user session
    HttpSession httpsession = request.getSession(false);
    String email = null;
    UserRegistration user = null;

    // Validate session
    if (httpsession != null) {
        email = (String) httpsession.getAttribute("email");

        if (email != null) {
            UserRegistrationDAO userDAO = new UserRegistrationDAO();
            user = userDAO.getUserByEmail(email);
        }
    }

    // Redirect to login if session does not exist or user is not found
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Retrieve booking details from the request
    String servicevvIdStr = request.getParameter("servicevvId");
    String userIdStr = String.valueOf(user.getUser_id());
    
    if (servicevvIdStr == null) {
        response.sendRedirect("error.jsp?message=Service ID not provided.");
        return;
    }

    int servicevvId;
    try {
        servicevvId = Integer.parseInt(servicevvIdStr);
    } catch (NumberFormatException e) {
        response.sendRedirect("error.jsp?message=Invalid Service ID format.");
        return;
    }
%>

<div class="container">
    <div class="card">
        <div class="card-header">Book Service</div>
        <div class="card-body">
            <form action="confirmBooking.jsp" method="post">
                <input type="hidden" name="userId" value="<%= userIdStr %>">
                <input type="hidden" name="servicevvId" value="<%= servicevvId %>">

                <div class="form-group">
                    <label for="date">Booking Date:</label>
                    <input type="date" class="form-control" id="date" name="bookingDate" required>
                </div>

                <div class="form-group">
                    <label for="time">Booking Time:</label>
                    <input type="time" class="form-control" id="time" name="bookingTime" required>
                </div>

                <div class="form-group">
                    <label for="comments">Comments:</label>
                    <textarea class="form-control" id="comments" name="comments" rows="3"></textarea>
                </div>

                <button type="submit" class="btn btn-success">Confirm Booking</button>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
