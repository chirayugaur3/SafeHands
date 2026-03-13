import SwiftUI

// MARK: - Hex Initializer

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - SafeHands Colour Tokens

extension Color {
    /// #F7F3E8 — every screen background
    static let warmCream = Color(hex: "#F7F3E8")

    /// #320A5C — all primary text
    static let deepIndigo = Color(hex: "#320A5C")

    /// #C6855A — ONE primary CTA per screen
    static let terracotta = Color(hex: "#C6855A")

    /// #B2AC88 — active states, left borders
    static let sageGreen = Color(hex: "#B2AC88")

    /// #7EBF8E — completed states
    static let softGreen = Color(hex: "#7EBF8E")

    /// #7A6E62 — supporting copy
    static let warmBrown = Color(hex: "#7A6E62")

    /// #7A7268 — labels, metadata, hard day mood
    static let warmGrey = Color(hex: "#7A7268")

    /// #E5DDD4 — all dividers
    static let warmDivider = Color(hex: "#E5DDD4")

    /// #B5A898 — ALL shadows (never black, never grey)
    static let warmShadowColor = Color(hex: "#B5A898")

    /// #2D4A3E — logging ceremony screen only
    static let loggingBackground = Color(hex: "#2D4A3E")
}
