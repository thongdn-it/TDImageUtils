//
//  ViewController.swift
//  TDImageUtils
//
//  Created by Thong Dang on 09/24/2019.
//  Copyright (c) 2019 Thong Dang. All rights reserved.
//

import UIKit
import TDImageUtils

class ViewController: UIViewController {
    
    @IBOutlet weak var imgOrigin: UIImageView!
    @IBOutlet weak var lbOrigin: UILabel!
    @IBOutlet weak var imgResize: UIImageView!
    @IBOutlet weak var lbResize: UILabel!
    @IBOutlet weak var imgCompress: UIImageView!
    @IBOutlet weak var lbCompress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let originImage = UIImage(named: "8k")
        
        imgOrigin.image = originImage
        lbOrigin.text = "Origin size: \(getSize(image: originImage)) KB"
       
        let imageResized = originImage?.resize(persent: 50)
        imgResize.image = imageResized
        lbResize.text = "Resize size: \(getSize(image: imageResized)) KB"
        
        let imageCompress = originImage?.compress(maxSize: 3)
        imgCompress.image = imageCompress?.toImage()
        lbCompress.text = "Compress size: \(Double(imageCompress?.count ?? 0)/1024) KB"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getSize(image: UIImage?) -> Double {
        if let imageData = image?.data {
            return Double(imageData.count) / 1024.0
        }
        else {
            return 0.0
        }
    }
}

