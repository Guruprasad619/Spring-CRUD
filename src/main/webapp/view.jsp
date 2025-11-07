<%@page import="movie_crud.entity.Movie"%>
<%@page import="java.util.List"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Page</title>

<style>
    body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #f8f9fa, #e9ecef);
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-top: 30px;
        font-size: 2rem;
        letter-spacing: 1px;
    }

    div {
        margin-top: 30px;
    }

    table {
        border-collapse: collapse;
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        text-align: center;
        padding: 15px;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #343a40;
        color: #fff;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    tr:hover {
        background-color: #f1f3f5;
        transition: background 0.3s ease;
    }

    img {
        border-radius: 8px;
        box-shadow: 0 0 5px rgba(0,0,0,0.15);
    }

    button {
        background-color: #007bff;
        border: none;
        color: white;
        padding: 8px 15px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.3s ease;
    }

    button:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    a button {
        background-color: #dc3545;
    }

    a button:hover {
        background-color: #b02a37;
    }

    td:last-child {
        display: flex;
        justify-content: center;
        gap: 10px;
    }

    @media (max-width: 768px) {
        table {
            width: 95%;
        }

        th, td {
            padding: 10px;
        }

        img {
            width: 80px;
            height: 80px;
        }
    }
</style>
</head>
<body>

<div align="center">
    <h1>Movie Management</h1>

    <table border="1">
        <tr>
            <th>Name</th>
            <th>Genre</th>
            <th>Image</th>
            <th>Rating</th>
            <th>Actions</th>
        </tr>

        <% 
        List<Movie> movies = (List<Movie>) request.getAttribute("movies"); 
        for(Movie movie : movies) { 
        %>
        <tr>
            <td><%= movie.getName() %></td>
            <td><%= movie.getGenre() %></td>
            <td><img height="100px" width="100px" src="<%= movie.getImageLink() %>"></td>
            <td><%= movie.getRating() %></td>
            <td>
                <a href="delete?id=<%= movie.getId() %>"><button>Delete</button></a>
               <a href="edit?id=<%= movie.getId() %>"><button>Edit</button></a>
            </td>
        </tr>
        <% } %>
    </table>
</div>

<% 
if(request.getAttribute("message") != null){ 
%>
<script>
    alert("${message}");
</script>
<% } %>

</body>
</html>
