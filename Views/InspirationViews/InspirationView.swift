import SwiftUI

// TODO: Stage 1.1 - Create your enum here

enum InspirationType: String, CaseIterable {
    case quotes
    case images
    var name:String {
            return self.rawValue.capitalized
    }
}


struct InspirationView: View {
    @Binding var isShow: Bool
    @State var showMore: Bool = false
    
    @State var pickerType: InspirationType = .quotes
    // TODO: Stage 1.2 - You may need one or more @State variable (an enum type variable) for the Picker to bind.
    
    var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
    
    var topBar: some View {
        HStack {
            Button {
                showMore.toggle()
            } label: {
                Image(systemName: showMore ? "chevron.down" : "chevron.up")
            }
            .font(.body)
            
            Spacer()
            
            Text("Inspiration")
                .font(.title)
                .foregroundColor(.blue)
            
            Spacer()
            
            Button {
                withAnimation(.bouncyAnimation) {
                    isShow = false
                }
            } label: {
                Image(systemName: "xmark.circle")
            }
            .font(.body)
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 5)
    }
    
    var backdropLayer: some View {
        Color.black
            .opacity(0.2)
            .ignoresSafeArea()
            .transition(.opacity)
            .onTapGesture {
                withAnimation(.bouncyAnimation) {
                    isShow = false
                }
            }
    }
    
    var body: some View {
        ZStack {
            if isShow {
                backdropLayer
                
                GeometryReader { geoProxy in
                    VStack {
                        Spacer()
                        
                        VStack {
                            topBar
                            
                            // TODO: Stage 1.2 - Create the Picker.
                            Picker("choose picker", selection: $pickerType) {
                                ForEach(InspirationType.allCases, id: \.self) {
                                    Text($0.name)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                            
                            // TODO: Stage 1.3 - Let's switch between two views.
                            switch pickerType {
                            case .images:
                                    ImageGalleryView()
                            case .quotes:
                                QuoteView()
                            }
                            
                            
                            Spacer()
                                .frame(height: geoProxy.safeAreaInsets.bottom)
                        }
                        .background(.ultraThinMaterial)
                        .frame(height: showMore ? nil : screenSize.height / 2)
                        .cornerRadius(15)
                        .animation(.bouncyAnimation, value: showMore)
                    }
                    .ignoresSafeArea(edges: .bottom)
                }
                .transition(.drawViewOutTransition)
                .zIndex(1)
            }
        }
    }

}
