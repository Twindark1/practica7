<html>
<head>
    <title>Practica 2, Modificar</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container">

    <div class="MyContainer">
        <h1>Modificar Estudiante</h1>

        <form method="post" action="/ModificEstudiante">

            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre"  placeholder="nombre" value="${Student.nombre}" required>
            </div>

            <div class="form-group">
                <label for="apellido">Apellido</label>
                <input type="text" class="form-control" id="apellido" name="apellido" placeholder="apellido" value="${Student.apellido}" required>
            </div>

            <div class="form-group">
                <label for="matricula">Matricula</label>
                <input type="text" class="form-control" id="matricula" name="matricula" placeholder="matricula" value="${Student.matricula?string["0"]}" required>
            </div>

            <div class="form-group">
                <label for="telefono">Telefono</label>
                <input type="text" class="form-control" id="telefono" name="telefono" placeholder="telefono" value="${Student.telefono}" required>
            </div>

            <input type="submit" class="btn btn-primary" value="Agregar">

        </form>
    </div>
</div>

<body>
</html>
