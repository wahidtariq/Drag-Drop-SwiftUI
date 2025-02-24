//
//  DragAndDropHeaderSection.swift
//  DragandDrop
//
//  Created by wahid tariq on 24/02/25.
//

import SwiftUI

struct DragAndDropHeaderSection: View {
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text("Job Board")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
                .padding(.leading,290)
            Spacer()
            Button(action: action) {
                Text("Add Task")
                    .font(.headline)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 5)
            }
        }
    }
}

#Preview {
    DragAndDropHeaderSection(action: { })
}
