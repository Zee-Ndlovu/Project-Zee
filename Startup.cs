using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NonkosiBoutique.Startup))]
namespace NonkosiBoutique
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
