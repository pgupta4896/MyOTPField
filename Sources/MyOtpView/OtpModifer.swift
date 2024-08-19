//
//  OTPTextView.swift
//  OTP
//
//  Created by prakhar.unofficial on 18/08/24.
//

public enum OtpFieldType {
    case roundedWithBackground
    case bottomUnderline
}


import SwiftUI
import Combine

@available(iOS 15.0, *)
public struct OtpModifier: ViewModifier {
    @Binding var text: String
    var otpFieldType: OtpFieldType
    var textLimit: Int
    var activeBorderColor: Color
    var inactiveBorderColor: Color
    var backgroundColor: Color
    
    public func body(content: Content) -> some View {

            switch otpFieldType {
            case .roundedWithBackground:
                content
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .onReceive(Just(text)) { _ in limitText(textLimit) }
                    .frame(width: 45, height: 45)
                    .background(Color.red.cornerRadius(5))
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(text.isEmpty ? inactiveBorderColor : activeBorderColor, lineWidth: 2)
                    )
            case .bottomUnderline:
                content
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .onReceive(Just(text)) { _ in limitText(textLimit) }
                    .frame(width: 45, height: 45)
                    .background(
                        VStack {
                            Spacer()
                            Rectangle()
                                .frame(width: 45, height: 2)
                                .background(Color.red)
                        }
                    )
            }
        }
    
    private func limitText(_ upper: Int) {
        if text.count > upper {
            text = String(text.prefix(upper))
        }
    }
}
