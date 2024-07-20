import Foundation
// Film.swift
struct Film {
    var name: String
    var category: String
    var rating: Double
}

// FilmManager.swift
class FilmManager {
    private var films: [Film] = []

    // Add a new film
    func addFilm(_ film: Film) {
        films.append(film)
    }

    // Update an existing film
    func updateFilm(_ index: Int, with film: Film) {
        films[index] = film
    }

    // Remove a film
    func removeFilm(at index: Int) {
        films.remove(at: index)
    }

    // Get film information by name
    func getFilmInfo(byName name: String) -> Film? {
        return films.first(where: { $0.name == name })
    }

    // Get films by category
    func getFilms(inCategory category: String) -> [Film] {
        return films.filter { $0.category == category }
    }

    // Get films by rating range
    func getFilms(withRatingBetween min: Double, and max: Double) -> [Film] {
        return films.filter { $0.rating >= min && $0.rating <= max }
    }
}

// Usage example
let filmManager = FilmManager()

// Add some films
filmManager.addFilm(Film(name: "The Shawshank Redemption", category: "Drama", rating: 9.3))
filmManager.addFilm(Film(name: "The Godfather", category: "Drama", rating: 9.2))
filmManager.addFilm(Film(name: "Inception", category: "Science Fiction", rating: 8.8))
filmManager.addFilm(Film(name: "Avengers: Endgame", category: "Action", rating: 8.4))

// Get film information by name
if let film = filmManager.getFilmInfo(byName: "The Godfather") {
    print("Film name: \(film.name), Category: \(film.category), Rating: \(film.rating)")
}

// Get films by category
let dramaFilms = filmManager.getFilms(inCategory: "Drama")
print("Drama films: \(dramaFilms.map { $0.name })")

// Get films by rating range
let highRatedFilms = filmManager.getFilms(withRatingBetween: 8.5, and: 10.0)
print("High-rated films: \(highRatedFilms.map { $0.name })")
