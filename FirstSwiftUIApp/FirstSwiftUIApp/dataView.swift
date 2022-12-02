//
//  dataView.swift
//  FirstSwiftUIApp
//
//  Created by mesut alver on 28.11.2022.
//

import SwiftUI

struct dataView: View {
    
   @State var myName = "Mesut"
    
    var body: some View {
        VStack{
            Text(myName)
                .font(.title)
                .foregroundColor(.green)
                .padding()
            Button {
                myName = "Mortis"
            } label: {
                Text("Button")
            }

        }
        
    }
}

struct dataView_Previews: PreviewProvider {
    static var previews: some View {
        dataView()
    }
}
