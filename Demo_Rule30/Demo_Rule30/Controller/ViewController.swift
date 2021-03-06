//
//  ViewController.swift
//  Demo_Rule30
//
//  Created by Allen Spicer on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var colorPickerView: ColorPickerView!
    @IBOutlet var titleLabel: UILabel!
    
    var numberOfRows = Int()
    var model = Rule30Model()
    var cellColor = UIColor.black

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        colorPickerView.delegate = self
        createDataAndLoadTableView()
    }
    
    //async call to the data model to create data
    //then refresh tableview
    func createDataAndLoadTableView(){
        DispatchQueue.main.async {
            self.numberOfRows = self.model.createModelAndDisplayDataAndReturnColumns()
            self.tableView.reloadData()
        }
    }
    
    //turn row of bools into a row of views for use by the tableview
    func arrayOfViews(_ arrayOfBools : [Bool]?) -> [UIView]{
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

    //invert color components for complementary title color
    func colorComplement(color: UIColor) -> UIColor{
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


extension ViewController: colorDelegate {
    
    func setColors(color: UIColor) {
        cellColor = color
        view.backgroundColor = color
        titleLabel.textColor = colorComplement(color: color)
        self.tableView.reloadData()
    }
}

