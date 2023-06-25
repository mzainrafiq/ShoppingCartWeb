using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.DB.Model.Repositories
{
    public interface IUnitOfWork
    {
        ICategoryRepository Category { get; }
        IProductRepository Product { get; }
        IUserRepository User { get; }
        object Cart { get; }

        //ICartRepository Cart { get; }
        //IApplicationUser ApplicationUser { get; }
        //IOrderHeaderRepository OrderHeader { get; }
        //IOrderDetailRepository OrderDetail { get; }

        void Save();
    }
}
