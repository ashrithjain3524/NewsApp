//
//  UIImageView+Extension.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation
import UIKit

extension UIImageView{
    func addImage(_ url:String?,_ placeHolder: UIImage){
        if let unwrap = url{
            downloaded(from: unwrap)
        }else{
            self.image = placeHolder
        }
    }
}

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill,urlString:String = "") {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                ImageCache.getImageCache().set(forKey: urlString, image: image)
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        if let image = ImageCache.getImageCache().get(forKey: link){
            self.image = image
        }else{
            downloaded(from: url, contentMode: mode,urlString: link)
        }
        
    }
}


class ImageCache {
    private static var imageCache = ImageCache()
    
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
    
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
