//
//  CardView.swift
//  developers
//
//  Created by Carlos Amaral on 20/11/21.
//

import SwiftUI

struct CardView: View {
    
    var card : Card
    @State private var fadeIn : Bool = false
    @State private var moveDownward : Bool = false
    @State private var moveUp : Bool = false
    
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }
            .offset(y: moveDownward ? -218 : -300)
            
            Button(action: {
                playSound(sound: "sound-chine", type: "mp3")
            }) {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                
                .background(LinearGradient(colors: card.gradientColors, startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y: moveUp ? 210 : 300)
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(colors: card.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 0.4)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.2)) {
                self.moveDownward.toggle()
                self.moveUp.toggle()
            }
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[0])
            .previewLayout(.sizeThatFits)
    }
}
