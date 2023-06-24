using System;
using System.Collections.Generic;

namespace ShoppingCart.DB.Model.Models
{
    public partial class User
    {
        public int UserId { get; set; }
        public string UserName { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string PhoneNumber { get; set; } = null!;
        public bool IsAdmin { get; set; }
        public string? Email { get; set; }
        public string City { get; set; } = null!;
    }
}
