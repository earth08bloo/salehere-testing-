//
//  UIImageview.swift
//  
//
//  Created by admin on 22/8/2566 BE.
//

import Foundation
import UIKit
    extension UIImageView {
        func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
