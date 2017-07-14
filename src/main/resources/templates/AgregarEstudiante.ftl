<html>
<head>
    <title>Practica 2, Agregar</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container">

    <div class="MyContainer">
        <h1>Agregar Estudiante</h1>
        <hr>
        <form method="post" action="/AddEstudiante">

            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control"  id="nombre" name="nombre" placeholder="Nombre" required>
            </div>

            <div class="form-group">
                <label for="apellido">Apellido</label>
                <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" required>
            </div>

            <div class="form-group">
                <label for="matricula">Matricula</label>
                <input type="text" class="form-control" id="matricula" name="matricula" placeholder="Matricula" required>
            </div>

            <div class="form-group">
                <label for="telefono">Telefono</label>
                <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Telefono" required>
            </div>

            <input type="submit" class="btn btn-primary" value="Agregar">

        </form>
    </div>

</div>

<body>
</html>
