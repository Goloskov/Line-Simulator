//
//  ResultOneViewController.swift
//  Line Simulator
//
//  Created by Admin on 09.07.2018.
//  Copyright © 2018 Komitex. All rights reserved.
//

import UIKit

extension Double {
    var clean: String {
        return String(format: "%.2f", self)
    }
}
class ResultOneViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    var line : (CardingMachine, CrossLapper, Drafter, NeedleLoom, Drafter, NeedleLoom)?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl1.text = String (line!.5.getOutputSpeed().clean)
        lbl2.text = String (line!.5.getOutputMass().clean)
        lbl3.text = String (line!.5.getOutputWidth().clean)
        lbl4.text = String (line!.5.getFrequency(speed: line!.5.getOutputSpeed()).clean)
        lbl5.text = String (line!.5.getStep().clean)
        
        label1.text = String (line!.0.outputSpeed.clean)
        label2.text = String (line!.0.outputMass.clean)
        label3.text = String (line!.1.outputWidth.clean)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //=========================================================================Button back
    @IBAction func buttonClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    
 
    
    //=========================================================================Sliders
    @IBOutlet weak var label1: UILabel!
    @IBAction func slider1(_ sender: UISlider) {
        label1.text = String (sender.value)
        line!.0.outputSpeed = Double (label1.text!)!
        line!.1 = CrossLapper ( carding: line!.0, max: line!.1.maximum, owidth: line!.1.outputWidth, count: line!.1.countDoubleLayers)
        line!.2 = Drafter (draft: line!.2.draft, shrink: line!.2.shrink, cross: line!.1)
        line!.3 = NeedleLoom (max: line!.3.maximum, puncture: line!.3.densityPuncture, projection: line!.3.densityProjection, draft: line!.3.draft, shrink: line!.3.shrink, drafter: line!.2)
        line!.4 = Drafter (draft: line!.4.draft, shrink: line!.4.shrink, needle: line!.3)
        line!.5 = NeedleLoom (max: line!.5.maximum, puncture: line!.5.densityPuncture, projection: line!.5.densityProjection, draft: line!.5.draft, shrink: line!.5.shrink, drafter: line!.4)
         viewDidLoad()
    }
    
    @IBOutlet weak var label2: UILabel!
    @IBAction func slider2(_ sender: UISlider) {
        label2.text = String (sender.value)
        line!.0.outputMass = Double (label2.text!)!
        line!.1 = CrossLapper ( carding: line!.0, max: line!.1.maximum, owidth: line!.1.outputWidth, count: line!.1.countDoubleLayers)
        line!.2 = Drafter (draft: line!.2.draft, shrink: line!.2.shrink, cross: line!.1)
        line!.3 = NeedleLoom (max: line!.3.maximum, puncture: line!.3.densityPuncture, projection: line!.3.densityProjection, draft: line!.3.draft, shrink: line!.3.shrink, drafter: line!.2)
        line!.4 = Drafter (draft: line!.4.draft, shrink: line!.4.shrink, needle: line!.3)
        line!.5 = NeedleLoom (max: line!.5.maximum, puncture: line!.5.densityPuncture, projection: line!.5.densityProjection, draft: line!.5.draft, shrink: line!.5.shrink, drafter: line!.4)
        viewDidLoad()
      
    }
    
    @IBOutlet weak var label3: UILabel!
    @IBAction func slider3(_ sender: UISlider) {
        label3.text = String (sender.value)
        line!.1.outputWidth = Double (label3.text!)!
        line!.1 = CrossLapper ( carding: line!.0, max: line!.1.maximum, owidth: line!.1.outputWidth, count: line!.1.countDoubleLayers)
        line!.2 = Drafter (draft: line!.2.draft, shrink: line!.2.shrink, cross: line!.1)
        line!.3 = NeedleLoom (max: line!.3.maximum, puncture: line!.3.densityPuncture, projection: line!.3.densityProjection, draft: line!.3.draft, shrink: line!.3.shrink, drafter: line!.2)
        line!.4 = Drafter (draft: line!.4.draft, shrink: line!.4.shrink, needle: line!.3)
        line!.5 = NeedleLoom (max: line!.5.maximum, puncture: line!.5.densityPuncture, projection: line!.5.densityProjection, draft: line!.5.draft, shrink: line!.5.shrink, drafter: line!.4)
        viewDidLoad()
  
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
