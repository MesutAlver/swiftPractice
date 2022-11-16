//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by mesut alver on 6.11.2022.
//

import Foundation

class SuperMusician : Musicians {
    
    func sign2() {
        print("enter night")
    }
    
    override func sing() {
        super .sing()
        print("exit light")
    }
    
}

