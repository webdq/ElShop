import { ElShopCategory } from './ElShopCategory'
import { ElShopProduct } from './ElShopProduct'

@Component
export struct ElShopBody {
  build() {
    Row() {
      ElShopCategory()
      ElShopProduct()
    }
    .width('100%')
    .layoutWeight(1)
    .alignItems(VerticalAlign.Top)
  }
}