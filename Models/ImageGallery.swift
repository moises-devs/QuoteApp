// Generated by quicktype with some modifications.

import Foundation

// MARK: - ImageGallery
struct ImageGallery: Decodable, Identifiable {
    let id: String
    let urls: Urls
}


// MARK: - Urls
struct Urls: Decodable {
    let raw, full, regular, small, thumb: String
}

typealias Images = [ImageGallery]
