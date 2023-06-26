using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ShoppingCart.DB.Model.Models
{
    public partial class User
    {
        public User()
        {
            Carts = new HashSet<Cart>();
        }

        [Key]
        public int UserId { get; set; }
        [StringLength(50)]
        public string Name { get; set; } = null!;
        [StringLength(50)]
        public string UserName { get; set; } = null!;
        [StringLength(50)]
        public string Password { get; set; } = null!;
        public bool IsAdmin { get; set; }
        [StringLength(50)]
        public string? Email { get; set; }
        [StringLength(50)]
        public string City { get; set; } = null!;

        [InverseProperty(nameof(Cart.User))]
        public virtual ICollection<Cart> Carts { get; set; }
    }
}
