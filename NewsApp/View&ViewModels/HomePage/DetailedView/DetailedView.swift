//
//  FavouriteView.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

struct DetailedView: View {
    
    let article: Article
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            AsyncImage(url: article.imageURL) { phase in
                switch phase {
                case .empty:
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }

                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)

                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }


                @unknown default:
                    fatalError()
                }
            }
            //.frame(minHeight: 200, maxHeight: 300)
            .background(Color.gray.opacity(0.3))
            .clipped()
            
            VStack {
                NavBarWithBackButtonWithTransparent(title: "") {
                    presentationMode.wrappedValue.dismiss()
                }
                
             
            } //:VStack
            
        } //:ZStack
        .navigationBarHidden(true)
        
        Text(article.descriptionText)
            .padding()
       
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                DetailedView(article: .previewData[0])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
        }
    }
}

//
//
//struct UpdatePlayerView: View {
//    @State var isUpdatePlayerLinkActive = false
//    @State var isRemovePlayerLinkActive = false
//    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
//
//    @StateObject var vm : UpdatePlayerVM
//
//    //MARK: - IMAGE PICKER
//    @State private var showSheet: Bool = false
//    @State private var showImagePicker: Bool = false
//    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
//    @State private var didSelectImage: Bool = false
//
//    //Actions
//    var removeAction: (() -> ())?
//    var updateActoion: ((CustomPlayer) -> ())?
//
//    //MARK: -For keyboard responder
//    @StateObject private var keyboard = KeyboardResponder()
//
//    var body: some View {
//        ZStack {
//            Image("bg_background_with_artwork")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                NavBarWithBackButtonTransparent(title: "Update Player") {
//                    presentationMode.wrappedValue.dismiss()
//                }
//
//                GeometryReader { geometry in
//                    ScrollView(.vertical , showsIndicators: false) {
//                        VStack {
//
//                            WebImage(url: URL(string: vm.imageUrl))
//                                .placeholder {
//                                    Image("ic_upload")
//                                }
//                                .resizable()
//                                .frame(width: Screen.sizeFromWidth(size: 80), height: Screen.sizeFromWidth(size: 80))
//                                .background(Color("customGrayColor2"))
//                                .cornerRadius(8)
//                                .overlay(RoundedRectangle(cornerRadius: 8.0).stroke(Color.gray, lineWidth: 0.5))
//                                .padding(.top, Screen.sizeFromWidth(size: 16))
//                                .padding(.bottom, Screen.sizeFromWidth(size: 24))
//                                .onTapGesture {
//                                    showImagePicker.toggle()
//                                }
//
//                            TextFieldText(title: "Player’s Name", text: "Type player name here", imageOne: "", imageTwo: "", textValue: $vm.name)
//
//                            TextFieldText(title: "Email Address", text: "Select player email here", imageOne: "chevron.up", imageTwo: "", textValue: $vm.email)
//                                .padding(.top, Screen.sizeFromWidth(size: 16))
//
//                            Spacer()
//
//                            ColorChangeButton(buttonName: "Remove This Player", width: Screen.sizeFromWidth(size: 343), height: Screen.sizeFromWidth(size: 49), color: "#EB6150", someAction: {
//
//                                if vm.isFromEditTeam{
//                                    vm.deletePlayer { status in
//                                        presentationMode.wrappedValue.dismiss()
//                                    }
//                                }else{
//                                    removeAction?()
//                                    presentationMode.wrappedValue.dismiss()
//                                }
//                            })
//
//                            ButtonCommonBlack(buttonName: "Update Player", width: Screen.sizeFromWidth(size: 343), height: Screen.sizeFromWidth(size: 49), someAction: {
//
//                                if vm.isFromEditTeam{
//                                    vm.updatePlayer { status in
//                                        if status{
//                                            presentationMode.wrappedValue.dismiss()
//                                        }
//                                    }
//                                }else{
//                                    updateActoion?(CustomPlayer(id: UUID(), name: vm.name, positions: "", image_uuid: vm.file?.uuid ?? "", email: vm.email, imageURL: vm.imageUrl, positionShortName: ""))
//                                    presentationMode.wrappedValue.dismiss()
//                                }
//
//                            })
//                            .padding(.top, Screen.sizeFromWidth(size: 5))
//                            .padding(.bottom, Screen.sizeFromWidth(size: 16))
//
//                        } //:VStack
//                        .frame(minHeight: geometry.size.height)
//                        .padding(Screen.sizeFromWidth(size: 16))
//                        .padding(.bottom, keyboard.currentHeight/5)
//
//                    } //:ScrollView
//                    .frame(width: geometry.size.width)
//                    .background(Color.white
//                        .clipShape(RoundedView(radius: 16, edges: [.topLeft,.topRight]))
//                        .edgesIgnoringSafeArea(.bottom)
//                    )
//                } //:Geo
//            } //:VStack
//        } //:ZStack
//        .sheet(isPresented: self.$showImagePicker)
//        {
//            ImagePickerView(avatarImage: $vm.image, imageSelected: $vm.didSelectImage, sourceType: self.sourceType)
//        }
//        .onChange(of: vm.didSelectImage) { selected in
//            if selected {
//                vm.playerAvatarUpload()
//                vm.didSelectImage = false
//            }
//        }
//        .alert(isPresented: self.$vm.isShowAlert) {
//            Alert(title: Text(vm.alertTitle), message: Text(vm.alertMessage))
//        }
//    }
//}
