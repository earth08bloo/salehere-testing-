//
//  NewGoalViewController.swift
//  SaleHereTesting
//
//  Created by admin on 8/2/2567 BE.
//

import UIKit

class NewGoalViewController: UIViewController, NewGoalViewModelDelegate {
    @IBOutlet weak var amountMonthTF: UIView!
    @IBOutlet weak var amountTF: UIView!
    @IBOutlet weak var datePickerTF: UITextField!
    @IBOutlet weak var dateTF: UIView!
    @IBOutlet weak var accountTF: UIView!
    var datePicker: UIDatePicker?
    
    @IBOutlet weak var goalTypeCollectionView: UICollectionView!
    var newGoalViewModel: NewGoalViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newGoalRepository = NewGoalRepository()
        let newGoaltUseCase = NewGoalUseCase(newGoalRepository: newGoalRepository)
        newGoalViewModel = NewGoalViewModel(newGoalUseCase: newGoaltUseCase)
        newGoalViewModel.delegate = self
        newGoalViewModel.fetchGoalTypes()
        setupUI()
    }
    
    func setupUI() {
        amountMonthTF.layer.borderColor = UIColor(red: 181/255, green: 72/255, blue: 31/255, alpha: 1).cgColor
        amountMonthTF.layer.borderWidth = 1
        
        amountTF.layer.borderColor = UIColor(red: 181/255, green: 72/255, blue: 31/255, alpha: 1).cgColor
        amountTF.layer.borderWidth = 1
        
        dateTF.layer.borderColor = UIColor(red: 181/255, green: 72/255, blue: 31/255, alpha: 1).cgColor
        dateTF.layer.borderWidth = 1
        
        accountTF.layer.borderColor = UIColor(red: 181/255, green: 72/255, blue: 31/255, alpha: 1).cgColor
        accountTF.layer.borderWidth = 1
        
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        datePicker = UIDatePicker()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
           toolbar.setItems([doneButton], animated: false)
        toolbar.setItems([doneButton], animated: false)
        self.datePicker?.datePickerMode = .date
        self.datePicker?.preferredDatePickerStyle = .wheels
        datePickerTF.inputView = self.datePicker
        datePickerTF.inputAccessoryView = toolbar
        
        
        
        goalTypeCollectionView.delegate = self
        goalTypeCollectionView.dataSource = self
        goalTypeCollectionView.register(UINib(nibName: "GoalTypeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GoalTypeCollectionViewCell")
        
        if let layout = goalTypeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 10 // Adjust this value as needed
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
        }
        
    }
    
    func didUpdateGoalTypes() {
        goalTypeCollectionView.reloadData()
    }
    
    @objc func doneButtonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        if let dPicker =  self.datePicker {
            datePickerTF.text = dateFormatter.string(from: dPicker.date)
            datePickerTF.resignFirstResponder()
        }
        
    }

    @IBAction func didClickSave(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension NewGoalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return achievementViewModel.acheivemetList.count
        return newGoalViewModel.goalType.count
    

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoalTypeCollectionViewCell", for: indexPath) as? GoalTypeCollectionViewCell else {
                fatalError("Unable to dequeue GoalTypeCollectionViewCell")
            }
            
        let goalType = newGoalViewModel.goalType[indexPath.row]
        cell.setupCell(iconName: goalType.iconName, goalTypeStr: goalType.typeName)
        return cell
    }
    
}


