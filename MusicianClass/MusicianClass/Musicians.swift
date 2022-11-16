//
//  Musicians.swift
//  MusicianClass
//
//  Created by mesut alver on 6.11.2022.
//

import Foundation


enum MusicianType {
    case  leadGuitar
    case  Vocalist
    case  Drummer
    case  Bussist
    case  Violenist
}

class Musicians {
    
    //Property
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    //Initilazer
    init(name: String, age: Int, instrument: String, type: MusicianType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.type = type
        
    }
    
     func sing() {
        print("Nothing else matters")
    }
    
    
    

    
}
