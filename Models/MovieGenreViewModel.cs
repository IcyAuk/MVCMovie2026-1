using Microsoft.AspNetCore.Mvc.Rendering;
using MVCMovie2026_1.Models;
using System.Collections.Generic;

namespace MvcMovie.Models;

public class MovieGenreViewModel
{
    public List<Movie>? Movies { get; set; }
    public SelectList? Genres { get; set; }
    public string? MovieGenre { get; set; }
    public string? searchString { get; set; }
}