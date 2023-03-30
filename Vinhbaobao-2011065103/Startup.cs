using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Vinhbaobao_2011065103.Startup))]
namespace Vinhbaobao_2011065103
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
