//
//  ViewController.swift
//  Demo_Rule30
//
//  Created by uBack on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var numberOfRows = Int()
    var model = Rule30Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        createDataAndLoadTableView()
    }
    
    //async call to the data model to create data
    //then refresh tableview
    func createDataAndLoadTableView(){
        DispatchQueue.main.async {
            self.numberOfRows = self.model.generateRowsAndReturnCount()
            self.tableView.reloadData()
        }
    }
    
    //turn row of bools into a row of views for use by the tableview
    func arrayOfViews(_ arrayOfBools : [Bool]?) -> [UIView]{
        var array = [UIView]()
        guard let boolArray = arrayOfBools else {return array}
        for bool in boolArray{
            let view = UIView()
            if (bool){
                view.backgroundColor = .white
            }else{
                view.backgroundColor = .black
            }
            array.append(view)
        }
        
        return array
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let stack = cell.stackView as UIStackView
        guard let currentArray = model.getRow(indexPath.row) else {return cell}
        let array = arrayOfViews(currentArray)
        for view in array{
            stack.addArrangedSubview(view)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 15
    }
}

