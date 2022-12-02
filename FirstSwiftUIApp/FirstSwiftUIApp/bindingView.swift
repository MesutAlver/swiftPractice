//
//  bindingView.swift
//  FirstSwiftUIApp
//
//  Created by mesut alver on 28.11.2022.
//

import SwiftUI

struct bindingView: View {
    
    @State var myName = "Mesut"
    
    var body: some View {
        VStack{
            Text(myName)
                .font(.largeTitle)
                .padding()
            TextField("placeholder", text: $myName)
                
            }
        }
    }

struct bindingView_Previews: PreviewProvider {
    static var previews: some View {
        bindingView()
    }
}

