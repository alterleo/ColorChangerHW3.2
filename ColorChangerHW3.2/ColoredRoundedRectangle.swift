//
//  ColoredRoundedRectangle.swift
//  ColorChangerHW3.2
//
//  Created by Alexander Konovalov on 30.03.2021.
//

import SwiftUI

struct ColoredRoundedRectangle: View {
    
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
