//
//  FrameworkDetailView.swift
//  Apple-Frameworksd
//
//  Created by Dhanunjay Kumar on 19/01/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    @Binding var isShowingDetailView: Bool
    
    @State private var isShowingSafariView = false
    
    var body: some View {
        
        VStack {
            XDismissButton(isShowingDetailView: $isShowingDetailView)
            
            Spacer()
            FrameworkTitleView(framework: framework)

            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}



#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false)).preferredColorScheme(.dark)
}
