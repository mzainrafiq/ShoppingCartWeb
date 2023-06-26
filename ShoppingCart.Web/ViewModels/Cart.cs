using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using ShoppingCart.DB.Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.Web.ViewModels
{
    public class ProductModel
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public Product Product { get; set; }
        [ValidateNever]
        public string ApplicationUserId { get; set; }
        [ValidateNever]
        //public ApplicationUser ApplicationUser { get; set; }
        public int Count { get; set; }
    }
}
