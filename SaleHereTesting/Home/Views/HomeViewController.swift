//
//  HomeViewController.swift
//  SaleHereTesting
//
//  Created by admin on 7/2/2567 BE.
//

import UIKit

class HomeViewController: UIViewController, HomeViewModelDelegate {
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var bestOfferCollectionView: UICollectionView!
    @IBOutlet weak var suggestCollectionView: UICollectionView!
    var homeViewModel: HomeViewModel!
    var notificationViewModel: NotificationViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let homeRepository = HomeRepository()
        let homeUseCase = HomeUseCase(homeRepository: homeRepository)
        homeViewModel = HomeViewModel(homeUseCase: homeUseCase)
        homeViewModel.delegate = self
        homeViewModel.fetchGoals()
        setupUI()
        setupSocket()

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        
        if let tabBarItem1 = self.tabBarController?.tabBar.items?[0] {
                  tabBarItem1.image = UIImage(named: "home")
                  tabBarItem1.selectedImage = UIImage(named: "home")
                  tabBarItem1.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0) // Adjust as needed
        }
        if let tabBarItem2 = self.tabBarController?.tabBar.items?[1] {
                  tabBarItem2.image = UIImage(named: "wallet")
                  tabBarItem2.selectedImage = UIImage(named: "wallet")
                  tabBarItem2.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0) // Adjust as needed
        }
        if let tabBarItem3 = self.tabBarController?.tabBar.items?[2] {
                tabBarItem3.image = UIImage(named: "reward")
                tabBarItem3.selectedImage = UIImage(named: "reward")
                tabBarItem3.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0) // Adjust as needed
        }
        if let tabBarItem4 = self.tabBarController?.tabBar.items?[3] {
                tabBarItem4.image = UIImage(named: "profile")
                tabBarItem4.selectedImage = UIImage(named: "profile")
                tabBarItem4.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0) // Adjust as needed
        }
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(UINib(nibName: "GoalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GoalCollectionViewCell")
        
        bestOfferCollectionView.delegate = self
        bestOfferCollectionView.dataSource = self
        bestOfferCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        
        
        
        suggestCollectionView.delegate = self
        suggestCollectionView.dataSource = self
        suggestCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
    }
    
    func setupSocket() {
   
        let notificationUseCase = NotificationUseCase(notificationRepository: NotificationRepository.shared)
        notificationViewModel = NotificationViewModel(notificationsUseCase: notificationUseCase)
        notificationViewModel?.startListeningForNotifications(notificationHandler: { count in

            print("Received new notification count: \(count)")
            if let tabBarItem4 = self.tabBarController?.tabBar.items?[3] {
                tabBarItem4.badgeValue = "\(count)"
            }
        })
    }
    

    func didUpdateHome() {
        homeCollectionView.reloadData()
    }
    
    func formatDoubleToStringWithComma(_ value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    func daysLeftUntilDate(_ dateString: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let targetDate = dateFormatter.date(from: dateString) else {
            // Invalid date format
            return nil
        }
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.day], from: currentDate, to: targetDate)
        
        return components.day
    }
    
    @IBAction func didClickNewGoal(_ sender: Any) {
        let viewController = NewGoalViewController(nibName: "NewGoalViewController", bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == homeCollectionView) {
            return homeViewModel.goals.count
        }
        
        if(collectionView == bestOfferCollectionView) {
            return 3
        }
        
        if(collectionView == suggestCollectionView) {
            return 3
        }
        
        return 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == homeCollectionView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoalCollectionViewCell", for: indexPath) as? GoalCollectionViewCell else {
                fatalError("Unable to dequeue GoalCollectionViewCell")
            }
            
            let goal = homeViewModel.goals[indexPath.row]
            cell.setupLabel(goalNameStr: goal.GoalName, savingBathStr: formatDoubleToStringWithComma(goal.savingBath), goalBathStr: formatDoubleToStringWithComma(goal.goalBath), goalIconStr: "travel", savingStatus: goal.savingStatus, dayLeftStr: daysLeftUntilDate(goal.dueDate) ?? 0)
            
            return cell
        }
        
        if(collectionView == bestOfferCollectionView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else {
                fatalError("Unable to dequeue ImageCollectionViewCell")
            }
            cell.imageView.layoutIfNeeded()
            cell.setupUI(imageUrl: "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_640.jpg")
            
            return cell
        }
        
        if(collectionView == suggestCollectionView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else {
                fatalError("Unable to dequeue ImageCollectionViewCell")
            }
            cell.setupUI(imageUrl: "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_640.jpg")
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == bestOfferCollectionView) {
            let cellWidth: CGFloat = 320 // Set your desired width
            let cellHeight: CGFloat = 187 // Set your desired height
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
        if(collectionView == suggestCollectionView) {
            let cellWidth: CGFloat = 320 // Set your desired width
            let cellHeight: CGFloat = 187 // Set your desired height
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
        
        if(collectionView == homeCollectionView) {
            return CGSize(width: 190, height: 180)
        }
        return CGSize(width: 0, height: 0)
    }
    
    
    
    
 
}
