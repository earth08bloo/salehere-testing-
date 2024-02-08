//
//  AchievementCollectionViewCell.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        cardView.layer.borderWidth = 2
        cardView.layer.borderColor = UIColor.init(red: 181/255, green: 72/255, blue: 31/255, alpha: 100).cgColor
    }

}
