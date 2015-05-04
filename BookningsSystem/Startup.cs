using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BookningsSystem.Startup))]
namespace BookningsSystem
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
