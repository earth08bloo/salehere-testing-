//
//  HomeViewModel.swift
//  SaleHereTesting
//
//  Created by admin on 7/2/2567 BE.
//

protocol IHomeViewModel {
    func fetchGoals()
}

protocol HomeViewModelDelegate: AnyObject {
    func didUpdateHome()
}

class HomeViewModel: IHomeViewModel {
    private let homeUseCase: HomeUseCase
    weak var delegate: HomeViewModelDelegate?

      var goals: [Goal] = [] {
          didSet {
              self.delegate?.didUpdateHome()
          }
      }
    


      var updateView: (() -> Void)?

      init(homeUseCase: HomeUseCase) {
          self.homeUseCase = homeUseCase
      }

      func fetchGoals() {
          homeUseCase.getGoal { [weak self] result in
              switch result {
              case .success(let goals):
                
                  self?.goals = goals
                
              case .failure(let error):
                  print("Error fetching coins: \(error)")
              }
          }
      }
    
   
}
