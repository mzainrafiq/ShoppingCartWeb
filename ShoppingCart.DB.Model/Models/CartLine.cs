using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ShoppingCart.DB.Model.Models
{
    [Table("CartLine")]
    public partial class CartLine
    {
        [Key]
        public int CartLineId { get; set; }
        public int CartId { get; set; }
        public int ProductId { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime CreatedDate { get; set; }
        public int Quantity { get; set; }
        [Column("price")]
        public int Price { get; set; }
        public bool IsActive { get; set; }

        [ForeignKey(nameof(CartId))]
        [InverseProperty("CartLines")]
        public virtual Cart Cart { get; set; } = null!;
        [ForeignKey(nameof(ProductId))]
        [InverseProperty("CartLines")]
        public virtual Product Product { get; set; } = null!;
    }
}
