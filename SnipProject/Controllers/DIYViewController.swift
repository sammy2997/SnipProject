//
//  DIYViewController.swift
//  SnipProject
//
//  Created by King on 28/07/2021.
//

import Foundation
import UIKit
//import YBTextPicker


class DIYViewController: UIViewController {
    
    // attach textfield for PickerView
    @IBOutlet weak var itemsTextField: UITextField!
    @IBOutlet weak var categoriesTxt: UITextField!
    
    // make array to use in picker
    var diyItems = ["-", "Skirt", "Shirts", "Pants", "Scarfs", "Shoes", "Hats"]
    
    var categories = ["-","Garden","Outdoor","Knitting","Art", "Home Decor"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        
    }
    
    func setUp(){
        title = "DIY options".uppercased()
        
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

        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        /// assign picker view as input to the textfield
        itemsTextField.inputView = pickerView
        itemsTextField.textAlignment = .center
        itemsTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePicker(){
        itemsTextField.resignFirstResponder()
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

