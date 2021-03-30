//
//  ColoredSlider.swift
//  ColorChangerHW3.2
//
//  Created by Alexander Konovalov on 30.03.2021.
//

import SwiftUI

struct ColoredSlider: View {
    @Binding var valueTF: String
    @Binding var value: Double
    let color: Color
    
    @Binding var alertPresented: Bool
    
    var body: some View {
        
        HStack {
            Text("\(lround(value))")
                .frame(width: 40, alignment: .leading)
                .foregroundColor(.white)
            Slider(value: $value, in:0...255, step: 1)
                .accentColor(color)
                .onChange(of: value) { _ in
                    valueTF = String(lround(value))
                }
            
            TextField("", text: $valueTF)
                .trailingTextField()
                .onChange(of: valueTF, perform: actionOnChangeTF)
                .alert(isPresented: $alertPresented) {
                    Alert(title: Text("Wrong Format"),
                          message: Text("Enter number 0-255"))
                }
        }
        .font(.title3)
        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
    }
}

// MARK: onChange event of TextField

extension ColoredSlider {
    
    func actionOnChangeTF(_:String) {
        if let newValue = Double(valueTF), newValue>=0, newValue<=255 {
            value = newValue
        } else {
            if valueTF.count == 0 {
                valueTF="0"
            } else {
                valueTF = String(lround(value))
                alertPresented.toggle()
            }
        }
    }
}

// MARK: modificator of TextField

extension TextField {
    
    func trailingTextField() -> some View {
        ModifiedContent(content: self, modifier: TextFieldModifier())
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.trailing)
            .foregroundColor(.black)
            .frame(width: 40)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 12))
            .foregroundColor(.white)
    }
}
