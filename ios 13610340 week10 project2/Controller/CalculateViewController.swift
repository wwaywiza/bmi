//
//  ViewController.swift
//  ios 13610340 week10 project2
//
//  Created by Sasiwimon Wangdan on 19/10/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //global variable คือ ตัวแปรสาธารณะที่ใช้ร่วมกันได้ใน class ฟังก์ชันอื่นสามารถเรียกใช้ได้
    var bmivalueCal = "0"
    //เรียกใช้ struct #1 ประกาศตัวแปรชนิด struct
    var CalculatorBrain = CalculateBrain()
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var sliderHeight: UISlider!
    
    @IBOutlet weak var sliderWeight: UISlider!
    
    @IBOutlet weak var weightText: UILabel!
    
    @IBOutlet weak var heightText: UILabel!
    

    @IBAction func heightSliderPressed(_ sender: UISlider) {
        print(sender.value)
        print(String(format: "%.2f", sender.value))
        
        let height = String(format: "%.2f", sender.value)
              heightText.text = "\(height) M."
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {        print(sender.value)
    
        
        print(String(format: "%.0f", sender.value))
        
        
        let weight = String(format: "%.0f", sender.value)
        weightText.text = "\(weight) Kg."
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func calculatePressed(_ sender: Any) {
        
        let heightFromUser = sliderHeight.value
        let weightFromUser = sliderWeight.value
        
        //local variacle
        //let bmi = weight / pow(height , 2)
        //print(bmi)
        //Label.text = "\(bmi)"
        
        //bmivalueCal = String(format: "%.1f", weight / pow(height , 2))
        
        //เรียกใช้ struct #2 เรียกฟังก์ชัน struct โดยการส่งค่าที่ต้องการไป
        CalculatorBrain.calculateBMI(height: heightFromUser, weight: weightFromUser)
        
        //self.performSegue(withIdentifier: "goToResult", sender: self)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    @IBAction func heartPressed(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "goToCredit", sender: self)
        performSegue(withIdentifier: "goToCredit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
           // destinationVC.bmiValue = bmivalueCal
            //เรียกใช้ struct #3 เรียกใช้ function getBMIValue()
              //ส่งกลับมาเป็น string ซึ่งเป็นชนิดเดียวกับที่ .bmiValue ต้องการ
            //รู้ว่าตัวเดียวกันด้วยชื่อ calculatorBrain
            destinationVC.bmiValue = CalculatorBrain.getBMIValue()
            //ชื่อ ocject.ขื่อตัวแปร = ค่าที่ต้องการ set ให้
            destinationVC.advice = CalculatorBrain.getAdvice()
            
            destinationVC.color = CalculatorBrain.getColor()
        }//end if
        
        if segue.identifier == "goToCredit" {
            let CreditVC = segue.destination as! CreditViewController
            CreditVC.fullname = "sasiwimon is smart"
        }
    }//end func
    
}//end class

