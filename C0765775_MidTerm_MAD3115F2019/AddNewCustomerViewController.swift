//
//  CustomerListTableViewController.swift
//  C0765775_MidTerm_MAD3115F2019
//
//  Created by Sai Teja on 2019-11-08.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import UIKit

protocol AddNewCustomerViewControllerDelegate:NSObject {
    func didSelectSaveBtn(_ name:String)
}

class AddNewCustomerViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate:AddNewCustomerViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveBtntapped(_ sender: Any) {
        if nameTextField.text == ""{
            showAlert(withMessage: "Please add new customer name",viewController: self)
        }else{
            delegate?.didSelectSaveBtn(nameTextField.text ?? "")
            navigationController?.popViewController(animated: true)
        }
    }
}
