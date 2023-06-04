using ShoppingCart.DataAccess.Data;
using ShoppingCart.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.DataAccess.Repositories
{
    public class ProductRepository : Repository<Product>, IProductRepository
    {
        private ApplicationDbContext _context;

        public ProductRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public void Update(Product product)
        {
            var produtcDB = _context.Products.FirstOrDefault(x => x.Id == product.Id);
            if (produtcDB != null)
            {
                produtcDB.Name = product.Name;
                produtcDB.Description = product.Description;
                produtcDB.Price = product.Price;
                if (produtcDB != null)
                {
                    produtcDB.ImageUrl = product.ImageUrl;
                }
            }
        }
    }
}
