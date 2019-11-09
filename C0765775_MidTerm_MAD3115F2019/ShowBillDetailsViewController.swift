//
//  ShowBillDetailsViewController.swift
//  C0765775_MidTerm_MAD3115F2019
//
//  Created by Sai Teja on 2019-11-08.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
        
        var billDetailsArray = [Bill]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
        
        
        func setupUI(){
            tableView.tableFooterView = .init()
        }
        @IBAction func addNewBillTapped(_ sender: Any) {
            if let addbillVC = self.storyboard?.instantiateViewController(identifier: "AddNewBillViewController") as? AddNewBillViewController{
                addbillVC.delegate = self
                self.navigationController?.pushViewController(addbillVC, animated: true)
            }
        }
        
    }

    
    }
