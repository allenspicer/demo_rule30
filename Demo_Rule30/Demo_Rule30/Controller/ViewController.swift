//
//  ViewController.swift
//  Demo_Rule30
//
//  Created by uBack on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOfRows = Int()
    var model = Rule30Model()

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 15
    }
}

