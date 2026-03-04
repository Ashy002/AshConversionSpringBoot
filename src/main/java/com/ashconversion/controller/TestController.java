@RestController
public class TestController {
    @GetMapping("/test-api")
    public String test() {
        return "L'application fonctionne, le probleme vient des JSP !";
    }
}