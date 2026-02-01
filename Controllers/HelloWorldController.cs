using Microsoft.AspNetCore.Mvc;
using System.Text.Encodings.Web;

namespace MVCMovie2026_1.Controllers;

public class HelloWorldController : Controller
{
    //GET: /Helloworld/
    public IActionResult Index()
    {
        return View();
    }

    //GET: /Hellworld/Welcome/
    public IActionResult Welcome(string name, int numTimes = 1)
    {
        ViewData["message"] = "Hello " + name;
        ViewData["numTimes"] = numTimes;
        return View();
    }
}