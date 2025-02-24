//
//  CustomPopUpView.swift
//  DragandDrop
//
//  Created by wahid tariq on 24/02/25.
//

import SwiftUI

struct CustomPopUpView: View {
    
    @Binding var taskName: String
    var showPopup: Bool
    var action: () -> Void
    
    var body: some View {
        if showPopup {
            ZStack {
                Color.black.opacity(0.3) // Dim background
                    .ignoresSafeArea()
                    .onTapGesture(perform: action)
                
                VStack(spacing: 15) {
                    Text("Create Task")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    TextField("Task Name", text: $taskName)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .frame(width: 250)
                    
                    HStack {
                        Button("Cancel", action: action)
                        .padding()
                        .frame(width: 100)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("Save", action: action)
                            .padding()
                            .frame(width: 100)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .frame(width: 300)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 10)
            }
        }
    }
}

#Preview {
    CustomPopUpView(taskName: .constant(""), showPopup: false) {
        print("Action")
    }
}
