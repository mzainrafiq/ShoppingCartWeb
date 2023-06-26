using ShoppingCart.DB.Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingCart.DB.Model.Repositories
{
    public class UserRepository : Repository<User> ,IUserRepository
    {
        private ApplicationDbContext _context;

        public UserRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public User ValidateUser(string userName, String password)
        {
            var usr = _context.Users.Where(x => x.UserName.Equals(userName) && x.Password.Equals(password)).FirstOrDefault();
            return usr;
        }
        public bool IsUserExists(string userName)
        {
            return _context.Users.Any(x => x.UserName.Equals(userName));
        }
    }
}
