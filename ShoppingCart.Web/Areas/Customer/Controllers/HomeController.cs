using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShoppingCart.DB.Model.Models;
using ShoppingCart.DB.Model.Repositories;
using ShoppingCart.Web.ViewModels;
using System.Diagnostics;
using System.Security.Claims;

namespace ShoppingCart.Web.Controllers
{
    [Area("Customer")]
    public class HomeController : Controller
    {
        private IUnitOfWork _unitOfWork;
        public HomeController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        [HttpGet]
        public IActionResult Index()
        {
            IEnumerable<Product> products = _unitOfWork.Product.GetAll(includeProperties: "Category");
            return View(products);
        }

        [HttpGet]
        public IActionResult Details(int? id)
        {
            var productInfo = _unitOfWork.Product.GetT(x => x.Id == id, includeProperties: "Category");
            ProductModel prod = new ProductModel()
            {

                Product = _unitOfWork.Product.GetT(x => x.Id == id, includeProperties: "Category"),
                Count = 1,
                ProductId = (int)id
            };

            return View(prod);
        }

        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
/*
        public IActionResult Details(Cart cart)
        {
            if (ModelState.IsValid)
            {
                var claimsIdentity = (ClaimsIdentity)User.Identity;
                var claims = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);
                cart.ApplicationUserId = claims.Value;

                var cartItem = _unitOfWork.Cart.GetT(x => x.ProductId == cart.ProductId && x.ApplicationUserId == claims.Value);
                if (cartItem != null)
                {
                    _unitOfWork.Cart.Add(cart);
                    _unitOfWork.Save();
                    HttpContext.Session.SetInt32("SessionCart", _unitOfWork.Cart.GetAll(x => x.ApplicationUserId == claims.Value).ToList().Count);

                }
                else
                {
                    _unitOfWork.Cart.incrementCartItem(cartItem, cart.Count);
                    _unitOfWork.Save();
                }
            }
            return RedirectToAction("Index");
        }
*/
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ShoppingCart.Models.ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }




        public IActionResult SignUp()
        {
            return View();
        }

        public IActionResult CreateUser(UserVM vm)
        {
            if (_unitOfWork.User.IsUserExists(vm.User.UserName))
            {
                TempData["name"] = vm.User.Name;
                TempData["email"] = vm.User.Email;
                TempData["username"] = vm.User.UserName;
                TempData["message"] = "This Username already exists!";
                return RedirectToAction("SignUp");
            }
            else
            {
                vm.User.City = "Lahore";
                _unitOfWork.User.Add(vm.User);

                _unitOfWork.Save();
                return RedirectToAction("Index");
            }
        }

        public IActionResult LogIn(string username, string password)
        {
            if(!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password)) 
            {
                User user = _unitOfWork.User.ValidateUser(username, password);
                if(user!= null)
                {
                    TempData["UserName"] = user.Name;
                    TempData["UserId"] = user.UserId;
                    TempData["User"] = JsonConvert.SerializeObject(user);
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.message = "Invalid User Name or Password";
                    
                }
            }
            return View();
        }
        [HttpPost]
        public IActionResult AddToCart(int id, int userId)
        {
            // Logic to add the product with the specified ID to the cart
            // You can use a cart service, session, or database to store the cart items

            // Return an appropriate response (e.g., success message, updated cart data, etc.)
            return Ok();
        }
        [HttpPost]
        public IActionResult CheckOut([FromBody] CartVM vm)
        {
            // Logic to add the product with the specified ID to the cart
            // You can use a cart service, session, or database to store the cart items

            // Return an appropriate response (e.g., success message, updated cart data, etc.)
            return Ok();
        }

        public IActionResult About()
        {
            return View();
        }

        public IActionResult ContactUs()
        {
            return View();
        }

    }
}