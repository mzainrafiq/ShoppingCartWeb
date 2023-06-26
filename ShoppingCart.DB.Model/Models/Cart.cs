using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ShoppingCart.DB.Model.Models
{
    [Table("Cart")]
    public partial class Cart
    {
        public Cart()
        {
            CartLines = new HashSet<CartLine>();
        }

        [Key]
        public int CartId { get; set; }
        public int UserId { get; set; }
        public int TotalPrice { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime CreatedDate { get; set; }
        public bool IsActive { get; set; }

        [ForeignKey(nameof(UserId))]
        [InverseProperty("Carts")]
        public virtual User User { get; set; } = null!;
        [InverseProperty(nameof(CartLine.Cart))]
        public virtual ICollection<CartLine> CartLines { get; set; }
    }
}
