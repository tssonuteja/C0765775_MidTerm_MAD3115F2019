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

    extension ShowBillDetailsViewController:UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return billDetailsArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BillDetailsTableViewCell") as? BillDetailsTableViewCell else{return .init()}
            cell.setupCell(billDetailsArray[indexPath.row])
            return cell
        }
    }

    extension ShowBillDetailsViewController:UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 300
        }
    }

    extension ShowBillDetailsViewController:AddNewBillViewControllerDelegate{
        func didSelectSaveBtn(_ bill: Bill) {
            self.billDetailsArray.append(bill)
            self.tableView.reloadData()
        }
    }
