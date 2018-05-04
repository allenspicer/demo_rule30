//
//  ViewController.swift
//  Demo_Rule30
//
//  Created by uBack on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, colorDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var colorPicker: ColorPicker!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var numberOfRows = Int()
    private var model = Rule30Model()
    var cellColor = UIColor.black

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        colorPicker.delegate = self
        createDataAndLoadTableView()
    }
    
    //async call to the data model to create data
    //then refresh tableview
    private func createDataAndLoadTableView(){
        DispatchQueue.main.async {
            self.numberOfRows = self.model.generateRowsAndReturnCount()
            self.tableView.reloadData()
        }
    }
    
    func pickedColor(color: UIColor) {
        cellColor = color
        titleLabel.textColor = colorComplement(color: color)
        self.tableView.reloadData()
    }
    
    //turn row of bools into a row of views for use by the tableview
    private func arrayOfViews(_ arrayOfBools : [Bool]?) -> [UIView]{
        var array = [UIView]()
        guard let boolArray = arrayOfBools else {return array}
        for bool in boolArray{
            let view = UIView()
            
            //set cell color based on bool value
            if (bool){
                view.backgroundColor = .white
            }else{
                view.backgroundColor = cellColor
            }
            array.append(view)
        }
        return array
    }

    //invert colors for complementary title color
    private func colorComplement(color: UIColor) -> UIColor{
        let ciColor = CIColor(color: color)
        return UIColor(red: 1.0 - ciColor.red, green: 1.0 - ciColor.green, blue: 1.0 - ciColor.blue, alpha: 1.0)
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let stack = cell.stackView as UIStackView
        stack.subviews.forEach { $0.removeFromSuperview() }
        if stack.subviews.count == 0 {
            guard let currentArray = model.getRow(indexPath.row) else {return cell}
            let array = arrayOfViews(currentArray)
            for view in array{
                stack.addArrangedSubview(view)
            }
        }
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 15
    }
}

