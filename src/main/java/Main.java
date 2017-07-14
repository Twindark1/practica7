/**
 * Created by cesarjose on 5/31/17.
 */

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import spark.Spark;

import static spark.Spark.get;
import static spark.Spark.port;
import static spark.Spark.staticFiles;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.Version;

public class Main {

    public static void main(String[] args) {

        //staticFiles.location("/public"); // Static files

        int a = getHerokuAssignedPort();
        System.out.println(a);
        port(getHerokuAssignedPort());

        final Configuration configuration = new Configuration(new Version(2, 3, 0));
        configuration.setClassForTemplateLoading(Main.class, "/");

        ArrayList<Student> StudentList = new ArrayList<Student>();

        Spark.get("/", (request, response) -> {

            StringWriter writer = new StringWriter();
            response.redirect("templates/Pucmm.ftl");
            return writer;
        });

        Spark.get("/Pucmm", (request, response) ->
        {
            Template resultTemplate = configuration.getTemplate("templates/Pucmm.ftl");
            StringWriter writer = new StringWriter();

            Map<String, Object> attributes = new HashMap<>();
            attributes.put("StudentList", StudentList);
            resultTemplate.process(attributes, writer);
            return writer;
        });


        Spark.get("/AgregarEstudiante", (request, response) ->
        {
            Template resultTemplate = configuration.getTemplate("templates/AgregarEstudiante.ftl");
            StringWriter writer = new StringWriter();

            Map<String, Object> attributes = new HashMap<>();
            resultTemplate.process(attributes, writer);
            return writer;
        });

        Spark.get("/EliminarEstudiante/:id", (request, response) -> {
            StringWriter writer = new StringWriter();
            int id=Integer.parseInt(request.params("id"));

            StudentList.remove(id);
            response.redirect("/Pucmm");
            return writer;
        });

        Spark.get("/ModificarEstudiante/:id", (request, response) -> {
            Template resultTemplate = configuration.getTemplate("templates/ModificarEstudiante.ftl");
            StringWriter writer = new StringWriter();

            int id = Integer.parseInt(request.params("id"));

            Map<String, Object> attributes = new HashMap<>();
            attributes.put("Student", StudentList.get(id));

            resultTemplate.process(attributes, writer);
            return writer;
        });

        Spark.post("/AddEstudiante", (request, response) -> {
            StringWriter writer = new StringWriter();

            try {
                String Nombre = request.queryParams("nombre");
                String Apellido = request.queryParams("apellido");
                String Matricula = request.queryParams("matricula");
                String Telefono = request.queryParams("telefono");
                StudentList.add(new Student(Integer.parseInt(Matricula), Nombre, Apellido, Telefono));
                response.redirect("/Pucmm");
            }catch (Exception e){
                System.out.println(e);
                response.redirect("/AgregarEstudiante");

            }
            return writer;
        });

        Spark.post("/ModificEstudiante", (request, response) -> {
            StringWriter writer = new StringWriter();

            try {
                String Nombre = request.queryParams("nombre");
                String Apellido = request.queryParams("apellido");
                String Matricula = request.queryParams("matricula");
                String Telefono = request.queryParams("telefono");

                Student e = new Student(Integer.parseInt(Matricula), Nombre, Apellido, Telefono);
                for (Student x: StudentList)
                {
                    if(x.getMatricula() == e.getMatricula())
                    {
                        x.setNombre(e.getNombre());
                        x.setApellido(e.getApellido());
                        x.setMatricula(e.getMatricula());
                        x.setTelefono(e.getTelefono());
                        break;
                    }
                }
                response.redirect("/Pucmm");
            }catch (Exception e){
                System.out.println(e);
                response.redirect("/Pucmm");

            }
            return writer;
        });
    }

    private static int getHerokuAssignedPort() {
        ProcessBuilder processBuilder = new ProcessBuilder();
        if (processBuilder.environment().get("PORT") != null) {
            return Integer.parseInt(processBuilder.environment().get("PORT"));
        }
        return 4567; //return default port if heroku-port isn't set (i.e. on localhost)
    }
}
