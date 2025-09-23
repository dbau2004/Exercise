var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
app.MapGet("/health", () => Results.Ok("OK"));
app.MapGet("/", () => Results.Json(new { msg = "Hello from .NET 9!" }));
app.Run();