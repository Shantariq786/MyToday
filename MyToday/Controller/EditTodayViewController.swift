//
//  EditTodayViewController.swift
//  MyToday
//
//  Created by Ch. Shan on 12/7/23.
//

import UIKit

class EditTodayViewController: UIViewController {
    
    @IBOutlet weak var editTitleTF: UITextField!
    
    @IBOutlet weak var editDescrriptionTF: UITextField!
    
    @IBOutlet weak var editPriorityTF: UITextField!
    
    @IBOutlet weak var timeTF: UITextField!
    
    @IBOutlet weak var updateButton: UIButton!
    
    var editItem: Todo? = nil
    
    let todoCoreDataManager = TodoCoreDataManager()
    
    var localItems: [Todo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setInitialValue()
        // Do any additional setup after loading the view.
        updateButton.setThemeColor()
    }
    
    func setInitialValue(){
        editTitleTF.text = editItem?.title ?? ""
        timeTF.text = editItem?.time ?? ""
        editPriorityTF.text = editItem?.priority ?? ""
        editDescrriptionTF.text = editItem?.discription ?? ""
    }
    
    @IBAction func editButtonTapped(_ sender: Any){
        
        let newTitle = editTitleTF.text ?? ""
        let newDescription = editDescrriptionTF.text ?? ""
        let newTime = timeTF.text ?? ""
        let newPriority = editPriorityTF.text ?? ""
        
        todoCoreDataManager.editTodo(id: editItem?.id ?? UUID(), newTitle: newTitle, newDescription: newDescription, newPriority: newPriority, newTime: newTime)
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
   
    
}
