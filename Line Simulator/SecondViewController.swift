//
//  SecondViewController.swift
//  Line Simulator
//
//  Created by Admin on 09.07.2018.
//  Copyright © 2018 Komitex. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tf1.delegate = self
        self.tf2.delegate = self
        self.tf3.delegate = self
        self.tf4.delegate = self
        self.tf5.delegate = self
        self.tf6.delegate = self
        self.tf7.delegate = self
        self.tf9.delegate = self
        self.tf10.delegate = self
        self.tf11.delegate = self
        self.tf12.delegate = self
        self.tf13.delegate = self
        self.tf14.delegate = self
        self.tf15.delegate = self
        self.tf17.delegate = self
        self.tf18.delegate = self
        self.tf19.delegate = self
        self.tf20.delegate = self
        self.tf21.delegate = self
        self.tf22.delegate = self
        self.tf23.delegate = self
        self.tf24.delegate = self
        self.tf25.delegate = self
        self.tf26.delegate = self
        self.tf27.delegate = self
        self.tf28.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
     //=========================================================================Button go
    @IBAction func buttonGo(_ sender: UIButton) {
        
        carding = CardingMachine (max: Double (tf1.text!) ?? 1, speed: Double (tf2.text!) ?? 1, mass: Double (tf3.text!) ?? 1, width: Double (tf4.text!) ?? 1)
        cross = CrossLapper (carding: carding, max: Double (tf5.text!) ?? 1, owidth: Double (tf6.text!) ?? 1, count: Double (tf7.text!) ?? 1)
        drafter = Drafter (draft: Double (tf9.text!) ?? 1, shrink: Double (tf10.text!) ?? 1, cross: cross)
        needle = NeedleLoom (max: Double (tf11.text!) ?? 1, puncture: Double (tf12.text!) ?? 1, projection: Double (tf13.text!) ?? 1, draft: Double (tf14.text!) ?? 1, shrink: Double (tf15.text!) ?? 1, drafter: drafter)
        drafter2 = Drafter (draft: Double (tf17.text!) ?? 1, shrink: Double (tf18.text!) ?? 1, needle: needle)
        needle2 = NeedleLoom (max: Double (tf19.text!) ?? 1, puncture: Double (tf20.text!) ?? 1, projection: Double (tf21.text!) ?? 1, draft: Double (tf22.text!) ?? 1, shrink: Double (tf23.text!) ?? 1, drafter: drafter2)
        needle3 = NeedleLoom (max: Double (tf24.text!) ?? 1, puncture: Double (tf25.text!) ?? 1, projection: Double (tf26.text!) ?? 1, draft: Double (tf27.text!) ?? 1, shrink: Double (tf28.text!) ?? 1, needle : needle2)
        performSegue(withIdentifier: "showResult2", sender: line)
        UserDefaults.standard.set(tf1.text, forKey: "value1")
        UserDefaults.standard.set(tf5.text, forKey: "value5")
        UserDefaults.standard.set(tf4.text, forKey: "value4")
        UserDefaults.standard.set(tf11.text, forKey: "value11")
        UserDefaults.standard.set(tf19.text, forKey: "value19")
        UserDefaults.standard.set(tf24.text, forKey: "value24")
    }
    
    
    
     //=========================================================================Save values
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "value1") as? String
        {
            tf1.text = x
        }
        if let x = UserDefaults.standard.object(forKey: "value5") as? String
        {
            tf5.text = x
        }
        if let x = UserDefaults.standard.object(forKey: "value4") as? String
        {
            tf4.text = x
        }
        if let x = UserDefaults.standard.object(forKey: "value11") as? String
        {
            tf11.text = x
        }
        if let x = UserDefaults.standard.object(forKey: "value19") as? String
        {
            tf19.text = x
        }
        if let x = UserDefaults.standard.object(forKey: "value24") as? String
        {
            tf24.text = x
        }
    }
    
    
    
     //=========================================================================Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showResult2") {
            let secondViewController = segue.destination as! ResultSecondViewController
            let line = sender as! (CardingMachine, CrossLapper, Drafter, NeedleLoom, Drafter, NeedleLoom,NeedleLoom)
            secondViewController.line = line
        }
    }
    
    
    
    
     //=========================================================================Scroll keyboard
    @IBOutlet weak var scroll: UIScrollView!
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1...6:
            print ("Do nothing")
        case 7...9:
            scroll.setContentOffset(CGPoint (x:0, y:100), animated: true)
        case 10:
            scroll.setContentOffset(CGPoint (x:0, y:150), animated: true)
        case 11...13:
            scroll.setContentOffset(CGPoint (x:0, y:200), animated: true)
        case 14...16:
            scroll.setContentOffset(CGPoint (x:0, y:250), animated: true)
        default:
            scroll.setContentOffset(CGPoint (x:0, y:400), animated: true)
            
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        scroll.setContentOffset(CGPoint (x:0, y:0), animated: true)
    }
    
    
    
     //=========================================================================Settings of keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    lazy var carding: CardingMachine  = CardingMachine (max: 0, speed: 0, mass: 0, width: 0)
    lazy var cross = CrossLapper (carding: carding, max: 0, owidth: 0, count: 0)
    lazy var drafter = Drafter (draft: 0, shrink: 0, cross: cross)
    lazy var needle = NeedleLoom (max: 0, puncture: 0, projection: 0, draft: 0, shrink: 0, drafter: drafter)
    lazy var drafter2 = Drafter (draft: 0, shrink: 0, needle: needle)
    lazy var needle2 = NeedleLoom (max: 0, puncture: 0, projection: 0, draft: 0, shrink: 0, drafter: drafter2)
    lazy var needle3 = NeedleLoom (max: 0, puncture: 0, projection: 0, draft: 0, shrink: 0, needle: needle2)
    lazy var line : (CardingMachine, CrossLapper, Drafter, NeedleLoom, Drafter, NeedleLoom, NeedleLoom) = (carding,cross,drafter,needle,drafter2,needle2,needle3)
    
    
    
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf6: UITextField!
    @IBOutlet weak var tf7: UITextField!
    
    
    @IBOutlet weak var tf9: UITextField!
    @IBOutlet weak var tf10: UITextField!
    
    @IBOutlet weak var tf11: UITextField!
    @IBOutlet weak var tf12: UITextField!
    @IBOutlet weak var tf13: UITextField!
    @IBOutlet weak var tf14: UITextField!
    @IBOutlet weak var tf15: UITextField!
    
    
    @IBOutlet weak var tf17: UITextField!
    @IBOutlet weak var tf18: UITextField!
    
    @IBOutlet weak var tf19: UITextField!
    @IBOutlet weak var tf20: UITextField!
    @IBOutlet weak var tf21: UITextField!
    @IBOutlet weak var tf22: UITextField!
    @IBOutlet weak var tf23: UITextField!
    
    @IBOutlet weak var tf24: UITextField!
    @IBOutlet weak var tf25: UITextField!
    @IBOutlet weak var tf26: UITextField!
    @IBOutlet weak var tf27: UITextField!
    @IBOutlet weak var tf28: UITextField!
    
    
}
    


