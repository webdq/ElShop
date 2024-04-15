import { SelectedProduct } from '../models/Product'
import { clearAllProduct } from '../utils/productUtil'
import { ElProductItem } from './ElProductItem'

@Component
export struct ElShoppingCart {
  @Consume selectedProductList: SelectedProduct[]

  build() {
    Column() {
      Column() {
        Row() {
          Text('已选商品')
            .fontSize(13)
            .fontWeight(600)
          Row() {
            Image($r("app.media.delete"))
              .height(14)
              .fillColor('#999')
              .margin({ right: 5 })
            Text('清空')
              .fontSize(13)
              .fontColor('#999')
              .onClick(() => {
                clearAllProduct()
              })
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(15)

        List({ space: 20 }) {
          ForEach(this.selectedProductList, (product: SelectedProduct) => {
            ListItem() {
              ElProductItem({ product })
            }
          })
        }
        .divider({
          strokeWidth: 1,
          color: '#ddd'
        })
        .padding({ left: 15, right: 15, bottom: 100 })
      }
      .backgroundColor('#fff')
      .borderRadius({
        topLeft: 16,
        topRight: 16
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.End)
    .backgroundColor('rgba(0,0,0,0.5)')
  }
}