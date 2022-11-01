/*
    Patrick Mims
    October 31, 2022
    Midterm #4
 */
import SwiftUI

struct Menu{
    var dish: String
    var ImgName: String
    var price: Double
}

struct Order {
    var foodItems: Menu
    var unit: Int
}

private let menu = [
    Menu(dish: "Juicy Cheese Burger", ImgName: "Hamburger", price: 39.99),
    Menu(dish: "American Fries", ImgName: "Fries", price: 59.99)
]

struct ContentView: View {
    @State private var INDEX = 0
    @State private var orders: [Order] = []
    @State private var receipt = "Total Payment: $0.0"
    @State private var totalAmt = 0.0
    @State private var unitStr = "1"
    
    var body: some View {
        Text("Welcome to Pat's Diner")
            .padding(.leading, 50.0)
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Image(menu[INDEX].ImgName)
                    .resizable()
                    .scaledToFit()
                    .padding(20)
                Text("\(menu[INDEX].dish)")
                    .padding()
                HStack {
                    Text("Quantity: ")
                        .padding(.leading, 50.0)
                    TextField("1", text:  $unitStr)
                }
                
                Button("Next Item") {
                    if INDEX < menu.count - 1 {
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
                
                Button("Place Order") {
                    let unit = Int(unitStr)
                    let menu = menu[INDEX]
                    let order = Order(foodItems: menu, unit: unit!)
                    orders.append(order)
                    receipt = ""
                    totalAmt = 0.0
                    
                    for item in orders {
                        totalAmt = totalAmt + item.foodItems.price * Double(item.unit)
                        receipt = receipt + "\n \(item.foodItems.dish) X \(item.unit): $\(item.foodItems.price * Double(item.unit))"
                    }
                    
                    receipt = receipt + "\n Total Amount: $\(totalAmt.formatted())"
                }
                .font(.caption)
                .buttonStyle(.borderedProminent)
                .padding()
            Text(receipt)
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
