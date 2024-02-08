//
//  AchievementViewModel.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import Foundation
protocol IAchievementViewModel {
    func fetchAchievementList()
}

protocol AchievementViewModelDelegate: AnyObject {
    func didUpdateAchievementList()
}

class AchievementViewModel: IAchievementViewModel {
    private let achievementUseCase: AchievementUseCase
    weak var delegate: AchievementViewModelDelegate?
    
      var acheivemetList: [Int] = [] {
          didSet {
              self.delegate?.didUpdateAchievementList()
          }
      }
    


      var updateView: (() -> Void)?

      init(achievementUseCase: AchievementUseCase) {
          self.achievementUseCase = achievementUseCase
      }

      func fetchAchievementList() {
          achievementUseCase.getAchievementList { [weak self] result in
              switch result {
              case .success(let list):
                    print("")
//                  self?.acheivemetList = list
                
              case .failure(let error):
                  print("Error fetching coins: \(error)")
              }
          }
      }
    
   
}
