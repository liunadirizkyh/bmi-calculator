//
//  HomeView.swift
//  bmi
//
//  Created by Liu on 19/04/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var height: Double = 1.5
    @State private var weight: Double = 100
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            Image("homebackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Calculate your BMI")
                    .font(.system(size: 30))
                    .foregroundColor(Color("purpledark"))
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack {
                    Text("Height")
                        .foregroundColor(Color("purpledark"))
                        .bold()
                    
                    Spacer()
                    
                    Text("\(height, specifier: "%.2f")m")
                        .foregroundColor(Color("purpledark"))
                        .bold()
                }
                
                Slider(value: $height, in: 0...3, step: 0.01)
                    .tint(Color("purplelight"))
                    .padding(.bottom, 20)
                
                HStack {
                    Text("Weight")
                        .foregroundColor(Color("purpledark"))
                        .bold()
                    
                    Spacer()
                    
                    Text("\(weight, specifier: "%.0f")kg")
                        .foregroundColor(Color("purpledark"))
                        .bold()
                    
                }
                
                Slider(value: $weight, in: 0...200, step: 1)
                    .tint(Color("purplelight"))
                
                Spacer()
                
                Button {
                    showingSheet.toggle()
                } label: {
                    ButtonView(title: "Calculate")
                }
                .padding(.bottom, 20)
                .sheet(isPresented: $showingSheet) {
                    SheetView(showingSheet: $showingSheet, height: height, weight: weight)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
