//
//  OtpFormFieldView.swift
//  OTP
//
//  Created by prakhar.unofficial on 18/08/24.
//

import SwiftUI

public struct OtpFormFieldView: View {
    @Binding var otpCode: String
    var numberOfFields: Int
    var otpFieldType: OtpFieldType
    var activeBorderColor: Color
    var inactiveBorderColor: Color
    var backgroundColor: Color
    
    @FocusState private var focusedField: Int?
    @State private var fieldTexts: [String]
    
    public init(
        otpCode: Binding<String>,
        numberOfFields: Int = 4,
        otpFieldType: OtpFieldType = .roundedWithBackground,
        activeBorderColor: Color = .blue,
        inactiveBorderColor: Color = .gray,
        backgroundColor: Color = .white
    ) {
        self._otpCode = otpCode
        self.numberOfFields = numberOfFields
        self.otpFieldType = otpFieldType
        self.activeBorderColor = activeBorderColor
        self.inactiveBorderColor = inactiveBorderColor
        self.backgroundColor = backgroundColor
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
                        backgroundColor: backgroundColor
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
    }
}
