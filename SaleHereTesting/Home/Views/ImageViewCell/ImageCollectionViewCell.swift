//
//  ImageCollectionViewCell.swift
//  SaleHereTesting
//
//  Created by admin on 7/2/2567 BE.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUI(imageUrl: String) {
        self.imageView.load(url: URL(string:imageUrl)!)
        
    }

}
