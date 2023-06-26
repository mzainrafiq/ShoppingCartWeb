using Microsoft.EntityFrameworkCore;
using ShoppingCart.DB.Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.DB.Model.Repositories
{
    public interface IUserRepository : IRepository<User>
    {
        public User ValidateUser(string userName, String password);
        public bool IsUserExists(string userName);
    }
}
