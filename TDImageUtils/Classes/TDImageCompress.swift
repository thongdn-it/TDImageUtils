//
//  TDImageCompress.swift
//  TDImageUtils
//
//  Created by Thong Dang on 24/9/19.
//

import Foundation

public extension UIImage {
    
    var data: Data? {
        return self.jpegData(quality: .highest)
    }
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpegData(quality: JPEGQuality) -> Data? {
        return self.jpegData(quality: quality.rawValue)
    }
    
    func jpegData(quality: CGFloat) -> Data? {
        return self.jpegData(compressionQuality: quality)
    }
    
    /**
     define maximum image file size use upload to server (MB).
     default no limit - CGFloat.greatestFiniteMagnitude
     */
    static var UPLOAD_MAX_SIZE: CGFloat = CGFloat.greatestFiniteMagnitude
    
    /**
     compress image to data with max file upload size (MB) Default no limit.
     - parameters:
        - maxSize: maximum file size
     */
    func compress(maxSize: CGFloat = UPLOAD_MAX_SIZE) -> Data? {
        
        let MIN_STEP: CGFloat = 0.2
        var quality: CGFloat = 1.0
        var data: Data? = self.jpegData(quality: quality)
        
        while data != nil && quality > 0 && CGFloat(data!.count)/(1024*1024) > maxSize {
            
            let step = quality / 2
            if step > MIN_STEP {
                quality -= step
            }
            else {
                quality -= MIN_STEP
            }
            
            if quality < 0 {
                quality = 0
            }
            
            data = self.jpegData(quality: quality)
        }
        
        return data
    }
}

public extension Data {
    func toImage() -> UIImage? {
        return UIImage(data: self)
    }
}
