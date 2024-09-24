<%@ page import="java.sql.*, bean.*, dao.*" %>
<%@ page import="java.util.List" %>

<%
    String query = request.getParameter("query");
    List<ServiceVelvetvibeBean> services = null;

    if (query != null && !query.trim().isEmpty()) {
        ServiceVelvetvibeDAO serviceDAO = new ServiceVelvetvibeDAO();
        services = serviceDAO.searchServices(query.trim());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f8f9fa; /* Light background */
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: white; /* White background for each service */
            transition: box-shadow 0.3s;
        }
        li:hover {
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Shadow on hover */
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
        }
        .price {
            font-weight: bold;
            color: #28a745; /* Green for price */
        }
        .description {
            color: #555; /* Darker gray for description */
        }
        .no-results {
            color: #dc3545; /* Red for no results message */
        }
    </style>
</head>
<body>

<h2>Search Results for "<%= query %>"</h2>

<% if (services != null && !services.isEmpty()) { %>
    <ul>
        <% for (ServiceVelvetvibeBean service : services) { %>
            <li>
                <h5><%= service.getService_name() %> <small>(Category: <%= service.getCategoryName() %>)</small></h5>
                <p class="price">Price:  &#x20B9 <%= service.getAmount_from() %> -  &#x20B9 <%= service.getAmount_to() %></p>
                <p class="description">Description: <%= service.getDescription() %></p>
            </li>
        <% } %>
    </ul>
<% } else { %>
    <p class="no-results">No services found matching your search.</p>
<% } %>

</body>
</html>
