//
//  UIImageViewHelper.swift
//  NikeTest
//
//  Created by Ashish Patel on 1/27/20.
//  Copyright © 2020 Ashish. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func loadImageUsingCache(withUrl urlString: String) {
        
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        self.image = UIImage(named: "Placeholder")
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let myError = error {
                print(myError)
                return
            }
            
            DispatchQueue.main.async {
                if let imgData = data, let image = UIImage(data: imgData) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
            
        }).resume()
    }
}
