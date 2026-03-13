import SwiftUI

// MARK: - SafeHands Background

struct SafeHandsBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.warmCream.ignoresSafeArea())
    }
}

extension View {
    func safeHandsBackground() -> some View {
        modifier(SafeHandsBackgroundModifier())
    }
}

// MARK: - Card Shadow

/// Every card shadow: warmShadowColor 12% opacity, radius 8, y 4
struct CardShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.warmShadowColor.opacity(0.12), radius: 8, x: 0, y: 4)
    }
}

extension View {
    func cardShadow() -> some View {
        modifier(CardShadowModifier())
    }
}

// MARK: - Standard Card

/// White card, 18pt corner radius, warm shadow
struct StandardCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .cardShadow()
    }
}

extension View {
    func standardCard() -> some View {
        modifier(StandardCardModifier())
    }
}

// MARK: - Sage Left Border Card

/// White card with 5pt sageGreen left border, 18pt radius, warm shadow
struct SageLeftBorderCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .overlay(
                HStack {
                    RoundedRectangle(cornerRadius: 18)
                        .frame(width: 5)
                        .foregroundStyle(Color.sageGreen)
                    Spacer()
                }
            )
            .cardShadow()
    }
}

extension View {
    func sageLeftBorderCard() -> some View {
        modifier(SageLeftBorderCardModifier())
    }
}

// MARK: - Section Label

/// Section labels: medium weight, 11pt, warmGrey, lowercase
struct SectionLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(SHFont.medium(11))
            .foregroundStyle(Color.warmGrey)
            .textCase(.lowercase)
    }
}

extension View {
    func sectionLabel() -> some View {
        modifier(SectionLabelStyle())
    }
}
