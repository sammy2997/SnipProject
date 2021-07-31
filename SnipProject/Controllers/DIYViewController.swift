//
//  DIYViewController.swift
//  SnipProject
//
//  Created by King on 28/07/2021.
//

import Foundation
import UIKit

/// to register tableView cell programmatically
class CellClass: UITableViewCell { }

class DIYViewController: UIViewController {
    
    /// attach textfield for PickerView
    @IBOutlet weak var itemsTextField: UITextField!
    @IBOutlet weak var catBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    
    /// for select action
    var selectedButton = UIButton()
    var dataSource = [String]()
    
    /// create an UITableView and Transparent view which will show when the user taps on any of the UIButton.
    let transparentView = UIView()
    let tableView = UITableView()
    
    /// make array to use in picker
    var diyItems = ["-", "Skirt", "Shirts", "Pants", "Scarfs", "Shoes", "Hats"]

    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        
//        self.tableView.allowsMultipleSelection = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        
    }
    
    func setUp(){
        title = "DIY options".uppercased()
        
        borderBottom(txtField: itemsTextField)
        
        ///assign delegate and data source for pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        
        ///done button on picker view
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        /// assign picker view as input to the textfield
        itemsTextField.inputView = pickerView
        itemsTextField.textAlignment = .center
        itemsTextField.inputAccessoryView = toolBar
        
    }
    
    @IBAction func onClickSkip(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "ExperienceViewController") as! ExperienceViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func donePicker(){
        itemsTextField.resignFirstResponder()
    }
    
    /// button action for categories
    @IBAction func onclickcatBtn(_ sender: Any) {
        /// update datasource and button reference
        dataSource = ["Garden","Outdoor","Knitting","Art", "Home Decor"]
        selectedButton = catBtn
        
        /// add transparent table view
        addTransparentView(frames: catBtn.frame)
    }
    
    /// function to add transparent and table view
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            //UIApplication.shared.keyWindow
             transparentView.frame = window?.frame ?? self.view.frame
             self.view.addSubview(transparentView)
             
             tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
             self.view.addSubview(tableView)
             tableView.layer.cornerRadius = 5
             
             transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
             tableView.reloadData()
             let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
             transparentView.addGestureRecognizer(tapgesture)
             transparentView.alpha = 0
             UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                 self.transparentView.alpha = 0.5
                 self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
             }, completion: nil)
         }
    
    /// function to remove transparent and table view
    @objc func removeTransparentView() {
             let frames = selectedButton.frame
             UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                 self.transparentView.alpha = 0
                 self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
             }, completion: nil)
         }
    

}

extension DIYViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // number of rows in component/ number of countries.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return diyItems.count
    }
    
    // uses countries for title of row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // i used built in sort to sort array alphabetically before returning. changed from let to var to allow this.
        diyItems.sort()
        return diyItems[row]
       
    }
        
    
    // did select row to allow you select and input info into textfield
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        
        let diySelected = diyItems[pickerView.selectedRow(inComponent: 0)]
        let diy2 = diyItems[pickerView.selectedRow(inComponent: 1)]
        let diy3 = diyItems[pickerView.selectedRow(inComponent: 2)]
        itemsTextField.text = "\(diySelected) , \(diy2) , \(diy3) "
        
    }
        
}


extension DIYViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       
        cell.textLabel?.text = dataSource[indexPath.row]
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        var data: [String] = []
//        var new: String = ""
        /// add checkmark for multiple selection
        if let cell = tableView.cellForRow(at: indexPath) {
                    if cell.accessoryType == .checkmark {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
//                        data.append(dataSource[indexPath.row])
//                        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
                    }
                }
        tableView.deselectRow(at: indexPath, animated: true)
      
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)

        /// single selection
//        self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        tableView.deselectRow(at: indexPath, animated: true)
        
//        let selectedRows = tableView.indexPathsForSelectedRows
    
//        data.append(new)
//        print(data)
        
//        selectedButton.setTitle("\(data)", for: .normal)
//        removeTransparentView()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        self.tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
