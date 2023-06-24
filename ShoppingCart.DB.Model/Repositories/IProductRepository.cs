using ShoppingCart.DB.Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.DB.Model.Repositories
{
    public interface IProductRepository : IRepository<Product>
    {
        void Update(Product product);
    }
}
