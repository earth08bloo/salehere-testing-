//
//  AchievementViewController.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import UIKit

class AchievementViewController: UIViewController, AchievementViewModelDelegate {

    @IBOutlet weak var achievementCollectionView: UICollectionView!
    var achievementViewModel: AchievementViewModel!
    let numberOfItemsPerRow: CGFloat = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let achievementRepository = AchievementRepository()
        let achievementUseCase = AchievementUseCase(achievementRepository: achievementRepository)
        achievementViewModel = AchievementViewModel(achievementUseCase: achievementUseCase)
        achievementViewModel.delegate = self
        achievementViewModel.fetchAchievementList()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
    
        achievementCollectionView.delegate = self
        achievementCollectionView.dataSource = self
        achievementCollectionView.register(UINib(nibName: "AchievementCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AchievementCollectionViewCell")
        
        if let layout = achievementCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 10 // Adjust this value as needed
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
        }
        
        
    }

    func didUpdateAchievementList() {
        
    }

}

extension AchievementViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return achievementViewModel.acheivemetList.count
        return 8
    

    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//          let width = (collectionView.frame.width - (numberOfItemsPerRow - 1) * 10) / numberOfItemsPerRow
//          return CGSize(width: width, height: width)
//      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AchievementCollectionViewCell", for: indexPath) as? AchievementCollectionViewCell else {
                fatalError("Unable to dequeue AchievementCollectionViewCell")
            }
            
//            let goal = achievementViewModel.acheivemetList[indexPath.row]
           
            return cell
    }
    
}

