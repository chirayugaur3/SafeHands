import SwiftUI
import UIKit

struct SHBackButton: View {
    let action: () -> Void
    var showLabel: Bool = false
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            action()
        }) {
            HStack(spacing: 4) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .semibold))
                
                if showLabel {
                    Text("Back")
                        .font(SHFont.medium(15))
                }
            }
            .foregroundColor(Color.deepIndigo)
            .frame(width: showLabel ? nil : 36, height: 36)
            .background(
                Circle()
                    .fill(Color.white)
                    .shadow(
                        color: Color.warmShadowColor.opacity(isPressed ? 0.06 : 0.12),
                        radius: isPressed ? 4 : 8,
                        x: 0,
                        y: isPressed ? 2 : 4
                    )
            )
            .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }
}

#Preview {
    ZStack {
        Color.warmCream.ignoresSafeArea()
        VStack(spacing: 20) {
            SHBackButton(action: {})
            SHBackButton(action: {}, showLabel: true)
        }
    }
}
