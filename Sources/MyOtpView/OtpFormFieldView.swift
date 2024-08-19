//
//  OtpFormFieldView.swift
//  OTP
//
//  Created by prakhar.unofficial on 18/08/24.
//

import SwiftUI

@available(iOS 15.0, *)
public struct OtpFormFieldView: View {
    @Binding var otpCode: String
    var numberOfFields: Int
    var otpFieldType: OtpFieldType
    var activeBorderColor: Color
    var inactiveBorderColor: Color
    var backgroundColor: Color
    let height: CGFloat
    let width: CGFloat
    let cornerRadius: CGFloat
    
    @FocusState private var focusedField: Int?
    @State private var fieldTexts: [String]
    @Binding var isClearField: Bool
    
    public init(
        otpCode: Binding<String>,
        numberOfFields: Int = 4,
        otpFieldType: OtpFieldType = .roundedWithBackground,
        activeBorderColor: Color = .blue,
        inactiveBorderColor: Color = .gray,
        backgroundColor: Color = .white,
        height: CGFloat = 45,
        width: CGFloat = 45,
        cornerRadius: CGFloat = 5,
        isClearField:Binding<Bool>
    ) {
        self._otpCode = otpCode
        self.numberOfFields = numberOfFields
        self.otpFieldType = otpFieldType
        self.activeBorderColor = activeBorderColor
        self.inactiveBorderColor = inactiveBorderColor
        self.backgroundColor = backgroundColor
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
        self._isClearField = isClearField
        self._fieldTexts = State(initialValue: Array(repeating: "", count: numberOfFields))
    }
    
    public var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $fieldTexts[index])
                    .modifier(OtpModifier(
                        text: $fieldTexts[index],
                        otpFieldType: otpFieldType,
                        textLimit: 1,
                        activeBorderColor: activeBorderColor,
                        inactiveBorderColor: inactiveBorderColor,
                        backgroundColor: backgroundColor,
                        height: height,
                        width: width,
                        cornerRadius: cornerRadius
                    ))
                    .focused($focusedField, equals: index)
                    .onChange(of: fieldTexts[index]) { _ in
                        otpCode = fieldTexts.joined()
                        if fieldTexts[index].count == 1, index < numberOfFields - 1 {
                            focusedField = index + 1
                        } else if fieldTexts[index].isEmpty, index > 0 {
                            focusedField = index - 1
                        }
                    }
            }
        }
        .onAppear {
            focusedField = 0
        }
        .onChange(of: isClearField) { newValue in
            if newValue {
                clearFields()
                isClearField = false // Reset isClearField after clearing
            }
        }
    }
    
    private func clearFields() {
        fieldTexts = Array(repeating: "", count: numberOfFields)
        otpCode = ""
        focusedField = 0
    }
}
