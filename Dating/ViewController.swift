//
//  ViewController.swift
//  Dating
//
//  Created by John Whisker on 6/27/16.
//  Copyright © 2016 John Whisker. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    let API_URL = "https://fancy-raptor.hyperdev.space"
    var data: [AnyObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// --MARK: Alamofire 

extension ViewController {
    func loadData() {
        Alamofire.request(.GET, API_URL, parameters: nil )
            .responseJSON { response in
                if let results = response.result.value as! Array<Dictionary<String, AnyObject>>? {
                    for result in results {
                        self.data.append(result)
                    }
                }
            self.tableView.reloadData()
        }
    }
}

//MARK: TableView delegate

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    // TODO: Fix, add custom cell. 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = item["name"] as? String
        let URL = NSURL(string: item["picture"] as! String)!
        cell.imageView?.af_setImageWithURL(URL)
        return cell
    }
}

