//
//  ViewController.swift
//  Dating
//
//  Created by John Whisker on 6/27/16.
//  Copyright © 2016 John Whisker. All rights reserved.
//

import UIKit
//import Alamofire

class ViewController: UIViewController {
    let API_URL = "https://fancy-raptor.hyperdev.space"
    var data = ["Hello", "Something"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// --MARK: Alamofire 

extension ViewController {
//    func loadData() {
//        Alamofire.request(.GET, API_URL, parameters: nil )
//            .responseJSON { response in
//                print(response.result)   // result of response serialization
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//            }
//        }
//    }
}

//MARK: TableView delegant

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = item
        return cell
    }
}

