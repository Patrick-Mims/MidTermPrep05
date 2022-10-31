/*
    Patrick Mims
    October 31, 2022
    Midterm #4
 */
import SwiftUI

struct Item {
    var dish: String
    var ImgName: String
    var price: Double
}

struct Order {
    var foodItems: Item
    var unit: Int
}

private let items = [
    Item(dish: "Juicy Cheese Burger", ImgName: "Hamburger", price: 39.99),
    Item(dish: "American Fries", ImgName: "Fries", price: 59.99)
]

struct ContentView: View {
    @State private var INDEX = 0
    @State private var totalAmount = 0.0
    @State private var unitStr = "1"
    
    var body: some View {
        Text("Welcome to Pat's Diner")
            .padding(.leading, 50.0)
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Image(items[INDEX].ImgName)
                    .resizable()
                    .scaledToFit()
                    .padding(20)
                Text("\(items[INDEX].dish)")
                    .padding()
                HStack {
                    Text("Quantity: ")
                        .padding(.leading, 50.0)
                    TextField("1", text:  $unitStr)
                }
                
                Button("Next Item") {
                    if INDEX < items.count - 1 {
                        INDEX = INDEX + 1
                        print(INDEX)
                    } else {
                        INDEX = 0
                    }
                    unitStr = "1"
                }
                .buttonStyle(.borderedProminent)
                .font(.caption)
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
