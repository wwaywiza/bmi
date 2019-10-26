
import  UIKit
//kit คือชุดเครื่องมือ
//UI แปลว่า user interface ส่วนที่เกี่ยวกับการเชื่อมต่อกับผู้ใช้

//struct จะเป็นแบบ pass by value คือ เหมือนก็อปปี้แยกกันคนละอัน แก้กับอันใดกับอันอันหนึ่งไม่มีผลลัพธ์กับอีกอัน
//class จะเป็นแบบ pass by referance คือ เหมือนก็อปปี้แยกกันคนละอัน แก้กับอันใดกับอันอันหนึ่งมีผลลัพธ์กับอีกอัน
struct CalculateBrain {
    //var bmi: Float = 0.0 // 1 value เก็บตัวเดียวนะ
    // ไม่ใช้แล้วบัก... เพราะมีตัวตัวอื่นที่ดีกว่า นั้นคือ bmiStruct แทนย๊ะ
    
    var bmiStruct: BMI? // 3 value เก็บสามตัว เป็นชุด (value, advice, color)
    // เครื่องหมาย ? คือ เป็นตัวแปร Optional คือ ตัวเลือกจะมีหรือไม่มีค่าก็เป็นได้
    // ดังนั้นมันอาจจะไม่มีค่าก็ได้
    
    func getBMIValue() -> String {
        //let bmiTo1DecimalPlace = String(format: "%.1f", bmi)
        
        let bmiTo1DecimalPlace = String(format: "%.1f", bmiStruct?.value ?? 0.0)
        
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmiStruct?.advice ?? "No Advice"
        
        // if แบบย่อ
        // ตัวแปรที่ต้องการดูค่าว่ามีค่าหรือไม่ ?? ถ้าไม่มีค่า ให้ใช้ค่าตรงนี้แทน
        //bmiStruct?.advice ?? "No Advice"
        //
        //
    }
    
    func getColor() -> UIColor {
       return bmiStruct?.color ?? #colorLiteral(red: 0.9303289056, green: 1, blue: 1, alpha: 1)
     }

    mutating func calculateBMI(height:Float, weight:Float){
        //bmi ตัวที่ใช้นี้ ไม่มี var หรือ let นำหน้า คือตัที่เป็น Global var
        //ส่วน weight กับ height คือตัวที่ฟังก์ชันรับค่ามาในชื่อนั้นเป็น local var
       
        //bmi = weight / (height * height)
        
        let bmiValueLocal = weight / (height * height)
        
        if bmiValueLocal < 18.5 {
            bmiStruct = BMI(value: bmiValueLocal, advice: "Eat more pies!", color: #colorLiteral(red: 0, green: 1, blue: 1, alpha: 1))
          }else if bmiValueLocal < 24.9 {
            bmiStruct = BMI(value: bmiValueLocal, advice: "fit as a fiddle!", color: #colorLiteral(red: 0.462002337, green: 1, blue: 0.4813937545, alpha: 1))
          }else{
        bmiStruct = BMI(value: bmiValueLocal, advice: "Eat less pies!", color: #colorLiteral(red: 1, green: 0, blue: 0.08260025829, alpha: 1))
           }//end if
        
    }//end mutating
}//end struct
