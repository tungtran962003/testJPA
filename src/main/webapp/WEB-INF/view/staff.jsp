<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body class="container">
<h1>List Staffs</h1>
<form id="myForm">
    <div class="mb-3">
        <label class="form-label">Name</label>
        <input type="text" class="form-control" name="name" value="${st.name}">
    </div>
    <div class="mb-3">
        <label class="form-label">Gender</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" value="true" checked
            ${st.gender=='true' ? 'checked' : ''}>
            <label class="form-check-label" for="flexRadioDefault1">
                Male
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2" value="false"
            ${st.gender=='false' ? 'checked' : ''}>
            <label class="form-check-label" for="flexRadioDefault2">
                Female
            </label>
        </div>
    </div>
    <div class="mb-3">
        <label class="form-label">Role</label>
        <select class="form-select" aria-label="Default select example" name="role">
            <option value="Staff" ${st.role=='Staff' ? 'selected' : ''}>Staff</option>
            <option value="Manager" ${st.role=='Manager' ? 'selected' : ''}>Manager</option>
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Number</label>
        <input type="text" class="form-control" name="number" value="${st.number}">
    </div>
    <div class="mb-3">
        <label class="form-label">Wage</label>
        <input type="text" class="form-control" name="wage" value="${st.wage}">
    </div>
    <div class="mb-3">
        <label class="form-label">Character</label>
        <input type="text" class="form-control" name="character" value="${st.character}">
    </div>

    <button type="button" onclick="clickAdd()" class="btn btn-success">ADD</button>
    <a href="">
        <button type="button" onclick="clickUpdate('${st.id}')" class="btn btn-warning">UPDATE</button>
    </a>

</form>
<table class="table table-bordered border-primary">
    <tr>
        <th>Name</th>
        <th>Gender</th>
        <th>Role</th>
        <th>Number</th>
        <th>Wage</th>
        <th>Character</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${listStaff}" var="staff">
        <tr>
            <td>${staff.name}</td>
            <td>${staff.gender}</td>
            <td>${staff.role}</td>
            <td>${staff.number}</td>
            <td>${staff.wage}</td>
            <td>${staff.character}</td>
            <td>
                <a class="text-decoration-none" href="/detail/${staff.id}">
                    <button type="button" class="btn btn-info">DETAIL</button>
                </a>
                <a class="text-decoration-none" href="">
                    <button type="button" onclick="clickUpdate('${staff.id}')" class="btn btn-warning">UPDATE</button>
                </a>
                <a class="text-decoration-none" href="/delete/${staff.id}">
                    <button type="button" class="btn btn-danger">DELETE</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<script>
    function clickAdd() {
        document.getElementById('myForm').action = '/add'
        document.getElementById('myForm').method = 'post'
        document.getElementById('myForm').submit()
    }

    function clickUpdate(id) {
        document.getElementById('myForm').action = '/update/' + id
        document.getElementById('myForm').method = 'post'
        document.getElementById('myForm').submit()
    }
</script>
</body>
</html>

