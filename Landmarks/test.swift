import SwiftUI

class DataSource: ObservableObject {
  @Published var counter = 0
}

struct Counter: View {
//  @StateObject var dataSource = DataSource() // this doesn't reset when view reloads
    @ObservedObject var dataSource = DataSource() // this resets every time view reloads


  var body: some View {
    VStack {
      Button("Increment counter") {
        dataSource.counter += 1
      }

      Text("Count is \(dataSource.counter)")
    }
  }
}

struct ItemList: View {
  @State private var items = ["hello", "world"]

  var body: some View {
    VStack {
      Button("Append item to list") {
        items.append("test")
      }

      List(items, id: \.self) { name in
        Text(name)
      }

      Counter()
    }
  }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()

    }
}

