//
//  DestinationSearchView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var guestNum = 0
    
    let collapsedPickerViewHeight: CGFloat = 65
    let expanderPickerViewHeight: CGFloat = 120
    let ios17BugFixValue: Int = 99
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy){
                        viewModel.updateListingForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(Color(.black))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destination", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle()
                            }
                    }
                    .frame(width: .infinity)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 0.5)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                
            }
            .modifier(collapsableDestinationViewModifier())
            .frame(height: selectedOption == .location ? expanderPickerViewHeight : collapsedPickerViewHeight)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                            .onTapGesture(count: ios17BugFixValue) { }
                        Divider()
                            .padding([.top, .bottom], 5)
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                            .onTapGesture(count: ios17BugFixValue) { }
                    }
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(collapsableDestinationViewModifier())
            .frame(height: selectedOption == .dates ? expanderPickerViewHeight + 60 : collapsedPickerViewHeight)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .dates }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack {
                        Stepper {
                            Text("\(guestNum) guest (Above age 5)")
                        } onIncrement: {
                            guestNum += 1
                        } onDecrement: {
                            guard guestNum > 0 else { return }
                            guestNum -= 1
                        }
                        .onTapGesture(count: ios17BugFixValue, perform: { })
                    }
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(collapsableDestinationViewModifier())
            .frame(height: selectedOption == .guests ? expanderPickerViewHeight : collapsedPickerViewHeight)
            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .guests }
            }
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct collapsableDestinationViewModifier: ViewModifier {
    let radiusValue: CGFloat = 5
    let cornerRadiusValue: CGFloat = 12
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadiusValue))
            .shadow(radius: radiusValue)
            .padding()
    }
}
