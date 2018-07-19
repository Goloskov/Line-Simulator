//
//  Machine.swift
//  Line Simulator
//
//  Created by Admin on 09.07.2018.
//  Copyright © 2018 Komitex. All rights reserved.
//

import Foundation

protocol Productivity {
    func countProductivity (x: Double, y: Double) -> Int
}

class Machine {
    var maximum:Double
    var defaultMax:Double  = -1
    init (max:Double)
    {
        self.maximum = max
    }
    func view () -> Void {
        print ("All values of that macine")
    }
    
}

//============================================================Питатель
class Feeder : Machine {
    
    override init (max:Double)
    {
        super.init(max: max)
    }
    
    override func view () {
        print ("============FEEDER=================")
        print ("The maximum = \(super.maximum ) \n")
    }
}

//============================================================Чесальная машина
class CardingMachine : Machine, Productivity {
    
    func countProductivity(x: Double, y: Double) -> Int {
        _ = " speed / max"
        return  Int ((x/y)*100)
    }
    
    var outputSpeed : Double
    var outputMass : Double
    var outputWidth: Double
    init (max: Double, speed: Double, mass: Double, width: Double)
    {
        self.outputSpeed = speed
        self.outputMass = mass
        self.outputWidth = width
        super.init(max: max)
    }
    
    override func view () {
        print ("============CARDING MACHINE=================")
        print ("The maximum = \(super.maximum )")
        print ("The outputSpeed = \(self.outputSpeed)")
        print ("The outputMass = \(self.outputMass)")
        print ("The outputWidth = \(self.outputWidth)")
        print ("The productivity = \(self.countProductivity(x: outputSpeed, y: super.maximum)) \n")
    }
    
}

//============================================================Раскладчик
class CrossLapper : Machine, Productivity{
    
    func countProductivity(x: Double, y: Double) -> Int {
        _ = " speed / max"
        return Int ((x/y)*100)
    }
    
    var inputSpeed : Double
    var inputMass : Double
    var inputWidth: Double
    
    var outputWidth: Double
    var countDoubleLayers: Double
    
    init (carding: CardingMachine, max: Double, owidth: Double, count: Double)
    {
        outputWidth = owidth
        countDoubleLayers = count
        
        inputSpeed = carding.outputSpeed
        inputMass = carding.outputMass
        inputWidth = carding.outputWidth
        
        super.init(max: max)
    }
    
    func getOutputSpeed () -> Double {
        return (inputSpeed * inputWidth) / (Double (2 * countDoubleLayers * (outputWidth)))
    }
    
    func getOutputMass () -> Double {
        return 2 * inputMass *  countDoubleLayers
    }
    
    func view (carding : CardingMachine) {
        print ("============CrossLapper=================")
        print ("The maximum = \(super.maximum )")
        print ("The inputSpeed = \(self.inputSpeed)")
        print ("The outputSpeed = \(self.getOutputSpeed())")
        print ("The inputMass = \(self.inputMass)")
        print ("The outputMass = \(self.getOutputMass())")
        print ("The inputWidth = \(self.inputWidth)")
        print ("The outputWidth = \(self.outputWidth)")
        print ("The count of double layers = \(self.countDoubleLayers)")
        print ("The productivity = \(self.countProductivity(x: carding.outputSpeed, y: super.maximum)) \n")
    }
}

//============================================================Холстовытяжная машина
class Drafter : Machine, Productivity {
    
    func countProductivity(x: Double, y: Double) -> Int {
        _ = " draft / max"
        return Int ((x/y)*100)
    }
    
    var inputSpeed : Double
    var inputMass : Double
    var inputWidth: Double
    
    var inputDraft: Double = 0
    var outputDraft: Double = 0
    var draft: Double
    var shrink: Double
    init (draft: Double, shrink: Double,cross: CrossLapper)
    {
        inputSpeed = cross.getOutputSpeed()
        inputMass = cross.getOutputMass()
        inputWidth = cross.outputWidth
        
        self.draft = draft
        self.shrink = shrink
        super.init (max: 1 )
    }
    init (draft: Double, shrink: Double, needle: NeedleLoom)
    {
        inputSpeed = needle.getOutputSpeed()
        inputMass = needle.getOutputMass()
        inputWidth = needle.getOutputWidth()
        
        self.draft = draft
        self.shrink = shrink
        super.init (max: 1)
    }
    
    func getOutputSpeed () -> Double {
        return (inputSpeed * Double(draft/100 + 1))
    }
    
    func getOutputMass () -> Double {
        return (inputMass / Double(draft/100 + 1) * (shrink/100 + 1))
    }
    
    func getOutputWidth () -> Double {
        return (inputWidth / ((shrink/100) + 1))
    }
    
    override func view () {
        print ("============Drafter=================")
        print ("The maximum = \(super.maximum )")
        print ("The inputSpeed = \(self.inputSpeed)")
        print ("The outputSpeed = \(self.getOutputSpeed())")
        print ("The inputMass = \(self.inputMass)")
        print ("The outputMass = \(self.getOutputMass())")
        print ("The inputWidth = \(self.inputWidth)")
        print ("The outputWidth = \(self.getOutputWidth())")
        print ("The draft = \(self.draft)")
        print ("The shrink = \(self.shrink)")
        print ("The productivity = \(self.countProductivity(x: draft, y: super.maximum ))")
        print ("\n")
    }
}

//============================================================Иглопробивная машина
class NeedleLoom: Machine, Productivity {
    
    func countProductivity(x: Double, y: Double) -> Int {
        _ = " frequency / max"
        return Int ((x/y)*100)
    }
    var inputSpeed : Double
    var inputMass : Double
    var inputWidth: Double
    
    var densityPuncture : Double
    var densityProjection : Double
    var inputDraft: Double = 0
    var outputDraft: Double = 0
    var draft: Double
    var shrink: Double
    
    init (max: Double, puncture: Double, projection: Double, draft: Double, shrink: Double, drafter: Drafter)
    {
        inputSpeed = drafter.getOutputSpeed()
        inputMass = drafter.getOutputMass()
        inputWidth = drafter.getOutputWidth()
        
        densityProjection = projection
        densityPuncture = puncture
        self.draft = draft
        self.shrink = shrink
        super.init(max:max)
    }
    
    init (max: Double, puncture: Double, projection: Double, draft: Double, shrink: Double, needle: NeedleLoom)
    {
        inputSpeed = needle.getOutputSpeed()
        inputMass = needle.getOutputMass()
        inputWidth = needle.getOutputWidth()
        
        densityProjection = projection
        densityPuncture = puncture
        self.draft = draft
        self.shrink = shrink
        super.init(max:max)
    }
    
    init (max: Double, puncture: Double, projection: Double, draft: Double, shrink: Double, cross: CrossLapper)
    {
        inputSpeed = cross.getOutputSpeed()
        inputMass = cross.getOutputMass()
        inputWidth = cross.outputWidth
        
        densityProjection = projection
        densityPuncture = puncture
        self.draft = draft
        self.shrink = shrink
        super.init(max:max)
    }
    
    
    func getOutputSpeed () -> Double {
        return (inputSpeed * ((draft/100) + 1))
    }
    
    func getOutputMass () -> Double {
        return (inputMass / ((draft/100) + 1) * (shrink/100 + 1))
    }
    
    func getOutputWidth () -> Double {
        return (inputWidth / ((shrink/100) + 1))
    }
    
    func getStep () -> Double {
        return (densityProjection / densityPuncture / 10)
    }
    
    func getFrequency (speed: Double) -> Double {
        return (densityPuncture) * speed * 10000 / (densityProjection)
    }
    
    override func view () {
        print ("============Needle Loom=================")
        print ("The maximum = \(super.maximum )")
        print ("The inputSpeed = \(self.inputSpeed)")
        print ("The outputSpeed = \(self.getOutputSpeed())")
        print ("The inputMass = \(self.inputMass)")
        print ("The outputMass = \(self.getOutputMass())")
        print ("The inputWidth = \(self.inputWidth)")
        print ("The outputWidth = \(self.getOutputWidth())")
        print ("The density of puncture = \(self.densityPuncture)")
        print ("The step = \(self.getStep())")
        print ("The frequency = \(self.getFrequency(speed: self.getOutputSpeed()))")
        print ("The projected density = \(self.densityProjection)")
        print ("The draft = \(self.draft)")
        print ("The shrink = \(self.shrink)")
        print ("The productivity = \(self.countProductivity(x: self.getFrequency(speed: self.getOutputSpeed()), y: super.maximum) ) \n")
    }
    
    
}
