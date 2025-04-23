//
//  ButtonPrimaryColor.swift
//  GlassUI
//
//  Created by Jiafu Zhang on 4/23/25.
//

import SwiftUI

struct ButtonPrimaryColor<Icon: View>: View {
    @Environment(\.isEnabled) private var isEnabled
    @State private var isHovering = false
    private let titleKey: LocalizedStringKey
    private let icon: Icon
    
    var body: some View {
        HStack(spacing: 8) {
            Text(titleKey)
            icon
        }
        .font(.captionMedium)
        .foregroundStyle(.button(.foreground))
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.button(isEnabled ? isHovering ? .hover : .normal : .inactive))
        }
        .onHover { hovering in
            withAnimation {
                isHovering = hovering
            }
        }
    }
    
    init(_ titleKey: LocalizedStringKey, @ViewBuilder icon: () -> Icon) {
        self.titleKey = titleKey
        self.icon = icon()
    }
}

#Preview {
    VStack(spacing: 16) {
        ButtonPrimaryColor("Primary color") {
            Image(systemName: "chevron.right")
        }
        ButtonPrimaryColor("Primary color") {
            Image(systemName: "chevron.right")
        }
        .disabled(true)
    }
    .padding(.horizontal, 12)
    .padding(.vertical, 16)
    .padding(60)
}
