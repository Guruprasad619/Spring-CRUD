<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>

<style>
    body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #f8f9fa, #e9ecef);
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    div {
        background-color: #ffffff;
        padding: 40px 60px;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0,0,0,0.1);
        text-align: center;
        width: 400px;
    }

    h1 {
        color: #333;
        margin-bottom: 30px;
        font-size: 2rem;
        letter-spacing: 1px;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    label {
        font-weight: 500;
        color: #333;
        align-self: flex-start;
        margin-left: 10%;
        margin-bottom: 5px;
    }

    input[type="text"] {
        width: 80%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        margin-bottom: 20px;
        font-size: 15px;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus {
        outline: none;
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0,123,255,0.3);
    }

    button {
        background-color: #007bff;
        border: none;
        color: white;
        padding: 12px 25px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        transition: all 0.3s ease;
        width: 80%;
    }

    button:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    @media (max-width: 480px) {
        div {
            width: 90%;
            padding: 30px 20px;
        }

        h1 {
            font-size: 1.6rem;
        }

        input[type="text"], button {
            width: 100%;
        }
    }
</style>

</head>
<body>

<div align="center">
    <h1>Edit Movie</h1>

    <form action="update" method="post">
        <input type="hidden" name="id" value="${movie.id}">
        
        <input type="text" name="name" value="${movie.name}" placeholder="Enter movie name">
        <input type="text" name="genre" value="${movie.genre}" placeholder="Enter genre">
        <input type="text" name="rating" value="${movie.rating}" placeholder="Enter rating">
        <input type="text" name="imageLink" value="${movie.imageLink}" placeholder="Enter image URL">
        
        <button>Update</button>
    </form>
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
