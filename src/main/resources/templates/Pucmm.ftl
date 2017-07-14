<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Practica 2, Ventana Principal</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only"></span>

            </button>
            <a class="navbar-brand" href="#">Practica 2</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<br>
<br>
<br>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="/AgregarEstudiante">Agregar Estudiante nuevo</a></li>
                <li><a href="ModificarEstudiante/0">Modificar Datos de estudiante</a></li>
                <li><a href="">Eliminar datos de estudiante</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-2 col-md-10 col-md-offset-0 main">
            <h1 class="page-header">Datos</h1>

            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Matricula</th>
                        <th>Telefono</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#assign cont = 0>  <#-- create variable x -->

                    <#list StudentList as Student>
                    <tr class="animated fadeInUp">
                        <td>${Student.nombre}</td>
                        <td>${Student.apellido}</td>
                        <td>${Student.matricula?string["0"]}</td>
                        <td>${Student.telefono}</td>
                        <td><a href="/ModificarEstudiante/${cont}" class="btn btn-info" role="button">Modificar<span class="glyphicon glyphicon-folder-open"></span></a></td>
                        <td><a href="/EliminarEstudiante/${cont}"  class="btn btn-danger" role="button">Borrar <span class="glyphicon glyphicon-trash"></span></a></td>
                    </tr>
                        <#assign cont++>  <#-- create variable x -->
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
