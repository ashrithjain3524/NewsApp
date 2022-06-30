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
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
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
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
