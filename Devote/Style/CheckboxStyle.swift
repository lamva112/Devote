//
//  CheckboxStyle.swift
//  Devote
//
//  Created by bui khac lam on 27/08/2023.
//

import SwiftUI

struct CheckboxStyle:ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30,weight: .semibold,design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    
                    
                    if configuration.isOn {
                        playSound(sound: "sound-rise", type: "mp3")
                    }else{
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                    feedback.notificationOccurred(.success)
                }
            
            configuration.label
        }
    }//: HSTACK
}

struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Place holder",isOn: .constant(true))
            .toggleStyle(CheckboxStyle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
