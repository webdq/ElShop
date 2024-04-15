import { SelectedProduct } from '../models/Product'
import { addProduct, removeProduct } from '../utils/productUtil'

@Component
export struct ElProductCount {
  @Consume selectedProductList: SelectedProduct[]
  product: SelectedProduct

  getCount() {
    const selectedProduct = this.selectedProductList.find(item => item.id === this.product.id)
    return selectedProduct?.count || 0
  }

  build() {
    Row({ space: 8 }) {
      Image($r('app.media.minus_circle'))
        .width(14)
        .aspectRatio(1)
        .fillColor("#02B6FD")
        .onClick(() => {
          removeProduct(this.product.id)
        })

      Text(`${this.getCount()}`).fontSize(14)

      Image($r('app.media.plus_circle'))
        .width(14)
        .aspectRatio(1)
        .fillColor("#02B6FD")
        .onClick(() => {
          addProduct(this.product)
        })
    }
  }
}
