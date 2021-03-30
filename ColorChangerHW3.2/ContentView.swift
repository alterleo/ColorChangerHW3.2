//
//  ContentView.swift
//  ColorChangerHW3.2
//
//  Created by Alexander Konovalov on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    // states of slider's elements
    @State private var textFieldRed = "255"
    @State private var textFieldGreen = "255"
    @State private var textFieldBlue = "255"
    
    @State private var sliderRed = 255.0
    @State private var sliderGreen = 255.0
    @State private var sliderBlue = 255.0
    
    // state of alert
    @State private var alertPresented = false
    
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            VStack {
                ColoredRoundedRectangle(sliderRed: sliderRed, sliderGreen: sliderGreen, sliderBlue: sliderBlue)
                
                ColoredSlider( valueTF: $textFieldRed, value: $sliderRed, color: .red, alertPresented: $alertPresented)
                ColoredSlider( valueTF: $textFieldGreen, value: $sliderGreen, color: .green, alertPresented: $alertPresented)
                ColoredSlider( valueTF: $textFieldBlue, value: $sliderBlue, color: .blue, alertPresented: $alertPresented)
                
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
