using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ShoppingCart.DB.Model.Models
{
    public partial class Product
    {
        public Product()
        {
            CartLines = new HashSet<CartLine>();
        }

        [Key]
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Description { get; set; } = null!;
        public double Price { get; set; }
        public string ImageUrl { get; set; } = null!;
        public int CategoryId { get; set; }

        [ForeignKey(nameof(CategoryId))]
        [InverseProperty("Products")]
        public virtual Category Category { get; set; } = null!;
        [InverseProperty(nameof(CartLine.Product))]
        public virtual ICollection<CartLine> CartLines { get; set; }
    }
}
