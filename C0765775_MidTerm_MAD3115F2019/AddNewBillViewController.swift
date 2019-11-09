//
//  AddNewBillViewController.swift
//  C0765775_MidTerm_MAD3115F2019
//
//  Created by Sai Teja on 2019-11-08.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import UIKit

protocol AddNewBillViewControllerDelegate:NSObject {
    func didSelectSaveBtn(_ bill:Bill)
}


class AddNewBillViewController: UIViewController {

   
        @IBOutlet weak var enterBillIDTextField: UITextField!
        @IBOutlet weak var enterAmountTextField: UITextField!
        @IBOutlet weak var enterBillDateTextField: UITextField!
        @IBOutlet weak var enterBillTypeTextField: UITextField!
        var pickerView = UIPickerView()
        var datePicker = UIDatePicker()
        let toolBar = UIToolbar()
        let billTypesArray = ["Hydro","Internet","Mobile"]
      weak var delegate:AddNewBillViewControllerDelegate?
        var billCopyObj:Bill?
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupToolBar()
            setupPicker()
            setupTextFields()
        }
        
        func setupPicker(){
            pickerView.delegate = self
            enterBillTypeTextField.inputView = pickerView
            enterBillTypeTextField.inputAccessoryView = toolBar
        }
        
        func setupToolBar(){
            datePicker.datePickerMode = .date
            datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
            toolBar.barStyle = UIBarStyle.default
            toolBar.isTranslucent = true
            toolBar.tintColor = UIColor.black
            toolBar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBtnAction))
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let cancelButton =   UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelBtnAction))
            toolBar.setItems([cancelButton, space,doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            toolBar.sizeToFit()
        }
        
        @objc func datePickerValueChanged(_ date:UIDatePicker){
            enterBillDateTextField.text = datePicker.date.dateformatter()
        }
        
        func setupTextFields(){
            enterBillDateTextField.inputAccessoryView = toolBar
            enterBillDateTextField.inputView = datePicker
        }
        
        
       
    }
