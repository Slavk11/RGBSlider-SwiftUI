//
//  ContentView.swift
//  RGBSlider-SwiftUI
//
//  Created by Сазонов Станислав on 12.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 0.0
    @State private var greenSliderValue = 0.0
    @State private var blueSliderValue = 0.0
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                ColorView(red: $redSliderValue, green: $greenSliderValue, blue: $blueSliderValue)
                
                ColorSliderView(value: $redSliderValue, color: .red)
                ColorSliderView(value: $greenSliderValue, color: .green)
                ColorSliderView(value: $blueSliderValue, color: Color("darkBlue"))
                Spacer()
            }
            .padding(.top, 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        Rectangle()
            .fill(Color(red: red/255, green: green/255, blue: blue/255))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5))
            .frame(width: 350, height: 150)
            .cornerRadius(10)
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(color)
                .fontWeight(.bold)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .frame(width: 250)
            Text("\(lround(value))").foregroundColor(color)
                .frame(width: 50)
                .fontWeight(.bold)
        }
    }
}
