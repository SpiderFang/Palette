//
//  Page2.swift
//  Palette
//
//  Created by Spider on 2020/7/6.
//  Copyright © 2020 SpiderWeb. All rights reserved.
//

import UIKit

class Page2: UIViewController {

    weak var previousVC: ViewController?
    
    var colorHolder: UIColor? //placeholder to receive color from previous VC
    let pageColorLayer = CALayer()
    
    @IBOutlet weak var colorShowView: UIView!
    
    //Button回上一頁
    @IBAction func backToPreviousVC(_ sender: UIButton) {
        let vc1 = (self.storyboard?.instantiateViewController(withIdentifier: "VC1"))! as! ViewController
        vc1.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true, completion: nil)
//        self.show(vc1, sender: self)
//        self.showDetailViewController(vc1, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageColorLayer.frame = colorShowView.bounds
        /*
        //Workaround:
        //Painting color which received from previous VC
        if let colorHere = self.colorHolder {
            self.pageColorLayer.backgroundColor = colorHere.cgColor
            self.colorShowView.layer.addSublayer(self.pageColorLayer)
        }

        //Color animation mode
        UIView.animate(withDuration: 0, animations: {
            self.colorShowView.alpha = 0
        }) { (finished) in
            UIView.animate(withDuration: 0, delay: 3.5, options: .allowAnimatedContent, animations: {
                self.colorShowView.alpha = 1
            }) { (finished) in
                UIView.animate(withDuration: 0) {
                    self.colorShowView.alpha = 1
                }
            }
        }
        */
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Check book page.171, View的可動畫屬性有限定種類
        //Wrong! addSublayer not animatable
//        UIView.animate(withDuration: 3.5, animations: {
//            self.pageColorLayer.backgroundColor = self.colorHolder?.cgColor
//            self.colorShowView.layer.addSublayer(self.pageColorLayer)
//        }, completion: nil)
        
        //Correct
        //Apple建議iOS 10以上使用新API: UIViewPropertyAnimator,不要使用UIView.animate
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3.5, delay: 0, animations: {
            self.colorShowView.backgroundColor = self.colorHolder }, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
