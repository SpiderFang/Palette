//
//  ViewController.swift
//  Palette
//
//  Created by Spider on 2020/7/6.
//  Copyright © 2020 SpiderWeb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!

    @IBOutlet weak var colorCode: UILabel!
    
    @IBOutlet weak var colorPreview: UIView!
    
    //Layers
    let colorLayer = CALayer()
    
    var color = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorLayer.frame = colorPreview.bounds
        
        //default RGB values
        redValue.text = "0"
        greenValue.text = "0"
        blueValue.text = "0"
        
        //string to integer convert
        let defaultRed = Int(redValue.text!)
        let defaultGreen = Int(greenValue.text!)
        let defaultBlue = Int(blueValue.text!)
        
        //Draw default color follows default RGB values(0) in the image View
        color = UIColor(red: CGFloat(defaultRed!/255), green: CGFloat(defaultGreen!/255), blue: CGFloat(defaultBlue!/255), alpha: 1.0)
        colorLayer.backgroundColor = color.cgColor
        colorPreview.layer.addSublayer(colorLayer)
        
        //Default color code
        colorCode.text = String(format: "%02X%02X%02X", defaultRed!, defaultGreen!, defaultBlue!)
    }
    
    //MARK: - Target Action
    //RGB color slider value change and label text change
    @IBAction func colorSliderChange(_ sender: UISlider) {
        //Two functions: changeColor and changeText
        changeColor()
        changeText(red: redValue, green: greenValue, blue: blueValue, redSlide: redSlider, greenSlide: greenSlider, blueSlide: blueSlider)
    }
    
    //Button to next page
    @IBAction func checkBtn(_ sender: UIButton) {
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "Page2") as! Page2
        vc2.colorHolder = color
        vc2.previousVC = self
        vc2.modalPresentationStyle = .fullScreen
        self.present(vc2, animated: true, completion: nil)
    }
    
    //MARK: - Custom Helper function
    func changeColor() {
//        colorLayer.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1.0).cgColor
        color = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1.0)
        colorLayer.backgroundColor = color.cgColor
        colorPreview.layer.addSublayer(colorLayer)
    }
    
    func changeText(red: UILabel, green: UILabel, blue: UILabel, redSlide: UISlider, greenSlide: UISlider, blueSlide: UISlider) {
        red.text = String(format: "%3.1f", redSlide.value)
        green.text = String(format: "%3.1f", greenSlide.value)
        blue.text = String(format: "%3.1f", blueSlide.value)
        
        //Color Code
        colorCode.text = String(format: "%02X%02X%02X", Int(redSlide.value),Int(greenSlide.value),Int(blueSlide.value))
    }
        
}

