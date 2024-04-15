import { Category, SelectedProduct } from '../models/Product'
import { ElProductItem } from './ElProductItem'

@Component
export struct ElShopProduct {
  @Consume categoryIndex: number
  @Consume categoryList: Category[]

  build() {
    List({ space: 20 }) {
      ForEach(this.categoryList[this.categoryIndex]?.foods ?? [], (product: SelectedProduct) => {
        ListItem() {
          ElProductItem({ product })
        }
      })
    }
    .layoutWeight(1)
    .backgroundColor('#fff')
    .padding({ left: 10, right: 10 })
  }
}