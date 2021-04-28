

import SwiftUI

struct NutritionView: View {
var scannedCode: String = ""
    var body: some View {
        Text(scannedCode)
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
