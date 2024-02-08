//
//  AchievementRepository.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import Foundation

protocol IAchievementRepository {
    typealias GetAchievementListResult = Result<Int, Error>
    func getAchievementList(completion: @escaping (GetAchievementListResult) -> Void)
  
}

class AchievementRepository: IAchievementRepository {

    init() {
    }

    func getAchievementList(completion: @escaping (GetAchievementListResult) -> Void) {

           completion(.success(8))
    }

}
