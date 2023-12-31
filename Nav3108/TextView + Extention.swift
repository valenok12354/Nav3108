//
//  TextView + Extention.swift
//  Nav3108
//
//  Created by Koiv Igor on 05.09.2023.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString
    
    func makeUIView(context: Context) -> UITextView {
            UITextView()
        }
    func updateUIView(_ uiView: UITextView, context: Context) {
            uiView.attributedText = text
        }
}

