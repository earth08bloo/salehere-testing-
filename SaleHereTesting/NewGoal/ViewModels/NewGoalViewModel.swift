//
//  NewGoalViewModel.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//


protocol INewGoalViewModel {
    func fetchGoalTypes()
}

protocol NewGoalViewModelDelegate: AnyObject {
    func didUpdateGoalTypes()
}

class NewGoalViewModel: INewGoalViewModel {
    private let newGoalUseCase: NewGoalUseCase
    weak var delegate: NewGoalViewModelDelegate?

      var goalType: [GoalType] = [] {
          didSet {
              self.delegate?.didUpdateGoalTypes()
          }
      }
    


      var updateView: (() -> Void)?

      init(newGoalUseCase: NewGoalUseCase) {
          self.newGoalUseCase = newGoalUseCase
      }

      func fetchGoalTypes() {
          newGoalUseCase.getTypeGoal { [weak self] result in
              switch result {
              case .success(let goalType):
                
                  self?.goalType = goalType
                
              case .failure(let error):
                  print("Error fetching coins: \(error)")
              }
          }
      }
    
   
}


