import Foundation

class ImageGalleryViewModel: ObservableObject {
    @Published var editorialImages: Images = []
    @Published var randomImages: Images = []
    
    func loadImages(
        with getImages: () async -> Images?,
        _ onCompletion: (Images) -> Void
    ) async {
        guard let result = await getImages() else {
            return
        }
        
        if !Task.isCancelled {
            await MainActor.run {
                onCompletion(result)
            }
        }
    }
    
    func loadEditorialImages() async {
        if Task.isCancelled || !editorialImages.isEmpty { return }
        
        await loadImages(with: ImageGalleryAPIService.getEditorialImages) { images in
            editorialImages = images
        }
    }
    
    func loadRandomImages() async {
        if Task.isCancelled || !editorialImages.isEmpty { return }
        
        await loadImages(with: ImageGalleryAPIService.getRandomImages) { images in
            randomImages = images
        }
    }
}
