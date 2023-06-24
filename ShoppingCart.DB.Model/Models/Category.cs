﻿using System;
using System.Collections.Generic;

namespace ShoppingCart.DB.Model.Models
{
    public partial class Category
    {
        public Category()
        {
            Products = new HashSet<Product>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public int DisplayOrder { get; set; }
        public DateTime CreatedDateTime { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
