using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;


namespace MK.Test.Web.Controllers
{
    public class HomeController : Controller
    {
    
        public async Task<IActionResult> Index()
        {    
            await Task.Delay(5000);      

            return View();
        }
  
        
    
    }
}
