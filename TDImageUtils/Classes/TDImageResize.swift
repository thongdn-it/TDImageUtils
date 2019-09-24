//
//  TDImageResize.swift
//  TDImageCompress
//
//  Created by Thong Dang on 24/9/19.
//

import Foundation

public extension UIImage {
    
    /**
     resize image with persent
     - parameters:
        - persent: new persent image want resize between 0 and 100
     
     __if persent <= 0 or persent >= 100, return origin__
     */
    func resize(persent: CGFloat) -> UIImage {
        if persent <= 0 || persent >= 100 {
            return self
        }
        return resize(width: self.size.width * persent / 100, height: self.size.height * persent / 100)
    }
    
    /**
     resize image with new width and new height
     - parameters:
        - width: new width image want resize
        - height: new height image want resize
     
     __if width <= 0 or height <= 0, return origin__
     */
    func resize(width: CGFloat, height: CGFloat) -> UIImage {
        if width <= 0 || height <= 0 {
            return self
        }
        return self.resize(size: CGSize(width: width, height: height))
    }
    
    /**
     resize image with new size
     - parameters:
        - size: new size image want resize
     
     __if width <= 0 or height <= 0, return origin__
     */
    func resize(size: CGSize) -> UIImage {
        
        if size.width <= 0 || size.height <= 0 {
            return self
        }
        let newRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        var newImage: UIImage!
        UIGraphicsBeginImageContext(newRect.size)
        newImage = UIImage(cgImage: self.cgImage!, scale: 1, orientation: self.imageOrientation)
        newImage.draw(in: newRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
