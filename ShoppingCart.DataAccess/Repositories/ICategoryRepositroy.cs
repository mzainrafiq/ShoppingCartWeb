using ShoppingCart.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.DataAccess.Repositories
{
    public interface ICategoryRepository : IRepository<Category>
    {
        void Add(Category category);
        void Delete(Category category);
        void Update(Category category);
    }
}
