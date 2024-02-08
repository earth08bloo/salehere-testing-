//
//  GoalCollectionViewCell.swift
//  SaleHereTesting
//
//  Created by admin on 7/2/2567 BE.
//

import UIKit

class GoalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var goalIcon: UIImageView!
    @IBOutlet weak var savingBathLabel: UILabel!
    @IBOutlet weak var goalBathLabel: UILabel!
    @IBOutlet weak var dayLeftLabel: UILabel!
    @IBOutlet weak var savingStatusLabel: UILabel!
    @IBOutlet weak var goalNameLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        cardView.layer.cornerRadius = 16

        progressBar.layer.cornerRadius = 8
//        // Add constraints to set the height
//        NSLayoutConstraint.activate([
//            progressBar.heightAnchor.constraint(equalToConstant: 10) // Set your desired height
//        ])
        
    }
    
    func setupLabel(goalNameStr: String, savingBathStr: String, goalBathStr: String, goalIconStr: String, savingStatus: Bool, dayLeftStr: Int) {
        
        savingBathLabel.text = "\(savingBathStr) THB"
        goalBathLabel.text = "\(goalBathStr) THB"
        goalNameLabel.text = goalNameStr
        dayLeftLabel.text = "\(dayLeftStr) days left"
        if let image = UIImage(named: goalIconStr) {
            goalIcon.image = image
        }
        if(savingStatus) {
            feelingLabel.text = "Good"
            feelingLabel.textColor = UIColor.init(red: 71/255, green: 115/255, blue: 49/255, alpha: 100)
            cardView.layer.borderWidth = 2
            cardView.layer.borderColor = UIColor.init(red: 71/255, green: 115/255, blue: 49/255, alpha: 100).cgColor
            
            //happy
        } else {
            feelingLabel.text = "Unhappy"
            feelingLabel.textColor = UIColor.init(red: 181/255, green: 72/255, blue: 31/255, alpha: 100)
            cardView.layer.borderWidth = 2
            cardView.layer.borderColor = UIColor.init(red: 181/255, green: 72/255, blue: 31/255, alpha: 100).cgColor
            //unhappy
        }
        
    }

}
