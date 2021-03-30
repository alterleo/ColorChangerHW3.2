//
//  ContentView.swift
//  ColorChangerHW3.2
//
//  Created by Alexander Konovalov on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textFieldRed = "255"
    @State private var textFieldGreen = "255"
    @State private var textFieldBlue = "255"
    
    @State private var sliderRed = 255.0
    @State private var sliderGreen = 255.0
    @State private var sliderBlue = 255.0
    
    @State private var alertPresented = false
    
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            VStack {
                RoundedRectangleColored(sliderRed: sliderRed, sliderGreen: sliderGreen, sliderBlue: sliderBlue)
                
                SliderColored( valueTF: $textFieldRed, value: $sliderRed, color: .red, alertPresented: $alertPresented)
                SliderColored( valueTF: $textFieldGreen, value: $sliderGreen, color: .green, alertPresented: $alertPresented)
                SliderColored( valueTF: $textFieldBlue, value: $sliderBlue, color: .blue, alertPresented: $alertPresented)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RoundedRectangleColored: View {
    
    var sliderRed: Double
    var sliderGreen: Double
    var sliderBlue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color(red: sliderRed/255, green: sliderGreen/255, blue: sliderBlue/255))
            .frame(height: 150)
            .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white, lineWidth: 4))
    }
}

struct SliderColored: View {
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
                .onChange(of: value, perform: { _ in
                    valueTF = String(lround(value))
                })
                
                
            TextField("", text: $valueTF)
                .multilineTextAlignment(.trailing)
                .foregroundColor(.black)
                .frame(width: 40)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 12))
                .foregroundColor(.white)
                .onChange(of: valueTF, perform: { _ in
                    if let newValue = Double(valueTF), newValue>=0, newValue<=255 {
                        value = newValue
                    } else {
                        alertPresented.toggle()
                        valueTF = String(lround(value))
                    }
                })
                .alert(isPresented: $alertPresented) {
                    Alert(title: Text("Wrong Format"), message: Text("Enter number 0-255"))
                }
                
        }
        .font(.title2)
        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
    }
}
