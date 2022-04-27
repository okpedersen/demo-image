var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
 
app.MapGet("/", () => "Hello GitOps-world!");
 
app.Run();
