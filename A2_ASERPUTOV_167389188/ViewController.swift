//
//  ViewController.swift
//  A2_ASERPUTOV_167389188
//
//  Created by Anatoliy Serputov on 2021-10-15.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let pizzaList = ["The Original","Spicy Pulled Pork Pizza","Vegetarian Fiesta Pizza"]
    var pizza:String = "";
    var size:String = "";
    var quantity:Double = 0.0 ;
    var check:Int = 0;
    var price:Double = 0;
    @IBOutlet weak var PizzaPicker: UIPickerView!
    @IBOutlet weak var PizzaPizzaDes: UILabel!
    @IBOutlet weak var MySegment: UISegmentedControl!
    @IBOutlet weak var MyStepper: UIStepper!
    @IBOutlet weak var StepperLabel: UILabel!
    @IBOutlet weak var ReceiptLabel: UILabel!
    @IBOutlet weak var PizzaPrice: UILabel!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaList.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
     {
       print("\(pizzaList[row])")
        if(row == 0 ){
            PizzaPizzaDes.text = " Pepperoni, cheese, green onions. Served with extra tomato sauce and three types of cheese."
            pizza = "The Original"
            check = 0;
        }else if(row == 1){
            PizzaPizzaDes.text = " Slow-roasted pulled pork with a special spicy and smoky BBQ pizza sauce."
            pizza = "Spicy Pulled Pork Pizza"
            check = 1;
       }else{
        PizzaPizzaDes.text = "Roasted red peppers, caramelized onions, sundried organic tomatoes, feta, and spinach, on a thin crust with pesto sauce."
        pizza = "Vegetarian Fiesta Pizza"
        check = 2;
       }
      

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pizzaList[row])"
    }
    
  
    @IBAction func SegmentChange(_ sender: Any) {
       print(MySegment.selectedSegmentIndex)
        if(check == 0 ){
            if(MySegment.selectedSegmentIndex == 0){
                price = 17.50;
                PizzaPrice.text = "Pizza Price is \(price)"
            }else if(MySegment.selectedSegmentIndex == 1){
                price = 15.50;
                PizzaPrice.text = "Pizza Price is \(price)"
            }else{
                price = 21.50;
                PizzaPrice.text = "Pizza Price is \(price)"
            }
        }else if(check == 1){
            if(MySegment.selectedSegmentIndex == 0){
                price = 17.50;
                PizzaPrice.text = "Pizza Price is \(price)"
            }else if(MySegment.selectedSegmentIndex == 1){
                price = 15.50;
                PizzaPrice.text = "Pizza Price is \(price)"
            }else{
                price = 21.50;
                PizzaPrice.text = "Pizza Price is \(price)"
            }
        }else{
            if(MySegment.selectedSegmentIndex == 0){
                price = 17.50;
                PizzaPrice.text = "Pizza Price is \(price)"
            }else if(MySegment.selectedSegmentIndex == 1){
                price = 15.50;
                PizzaPrice.text = "Pizza Price is \(price)"
            }else{
                price = 21.50;
                PizzaPrice.text = "Pizza Price is \(price)"
            }
        }
        
        
        if(MySegment.selectedSegmentIndex == 0){
            size = "Medium"
        }else if(MySegment.selectedSegmentIndex == 1){
            size = "Small"
        }else{
            size = "Large"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.PizzaPicker.delegate = self
        self.PizzaPicker.dataSource = self
    }

   
    @IBAction func StepperPizza(_ sender: Int) {
        
        StepperLabel.text = "\(String(format: "%.0f", MyStepper.value))"
        quantity = MyStepper.value;
    }
    
    
    
    @IBAction func CheckOutButtton(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you are ready to place this order?", message: "Message", preferredStyle: .actionSheet)
        self.present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.ReceiptLabel.text = "Pizza: \(self.pizza)\nSize: \(self.size)\nQuantity: \(self.quantity)\nSubtotal: \(self.quantity * self.price)\nTaxes: \((self.quantity * self.price)*0.13)\n-------\nFinal Total: \((self.quantity * self.price)*0.13 + (self.quantity * self.price))\n"
            
        }))
        alert.addAction(UIAlertAction(title: "CANCEL", style: .destructive, handler: nil))
    }
    
}

