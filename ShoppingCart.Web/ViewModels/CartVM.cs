using ShoppingCart.DB.Model.Models;

namespace ShoppingCart.Web.ViewModels
{
    public class CartVM
    {
        public int UserId { get; set; }
        //public List<CartLineVM> CartLines { get; set; }
    }
    public class CartLineVM
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
    }
}
