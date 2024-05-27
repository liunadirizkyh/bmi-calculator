//
//  SheetView.swift
//  bmi
//
//  Created by Liu on 19/04/24.
//

import SwiftUI

struct SheetView: View {
    
    @Binding var showingSheet: Bool
    @State private var bmi: Double = 0.0
    var height: Double
    var weight: Double
    
    var body: some View {
        ZStack {
            Image("sheetbackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Your Result")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(Color("purpledark"))
                    .bold()
                Text("\(bmi, specifier: "%.2f")")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(Color("purpledark"))
                if (bmi < 18.5) {
                    Text("Eat more pies!")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color("purpledark"))
                } else if (bmi < 25) {
                    Text("Fit as a fiddle!")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color("purpledark"))
                } else {
                    Text("Eat less pies!")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color("purpledark"))
                }
                
                Spacer()
                
                Button {
                    showingSheet = false
                } label: {
                    ButtonView(title: "Recalculate")
                }
                .padding()
                
                Spacer()
            }
            .onAppear {
                bmi = calculateBMI(height: height, weight: weight)
            }
        }
    }
    
    func calculateBMI(height: Double, weight: Double) -> Double {
        return weight / (height * height)
    }
}

#Preview {
    SheetView(showingSheet: .constant(true), height: 1.75, weight: 70)
}

