import { SelectedProduct } from '../models/Product'
@Component
export struct ElSubtotal {
  @Link showShoppingCart: boolean
  @Consume selectedProductList: SelectedProduct[]

  getTotalCount() {
    return this.selectedProductList.reduce((count, item) => {
      return count + item.count
    }, 0)
  }

  getTotalPrice() {
    return this.selectedProductList.reduce((price, item) => {
      return price + (item.count * item.price * 100)
    }, 0) / 100
  }

  build() {
    Row() {
      Badge({
        count: this.getTotalCount(),
        position: BadgePosition.RightTop,
        style: { badgeSize: 20 }
      }) {
        Image($r("app.media.shopping_cart_icon"))
      }
      .width(50)
      .height(50)
      .margin({ right: 10 })

      Column() {
        Text() {
          Span('¥')
            .fontSize(14)
          Span(`${this.getTotalPrice()}`)
            .fontSize(24)
        }

        Text('另需配送费约 ¥3.3')
          .fontSize(12)
          .fontColor('#999')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Button('去结算')
        .fontSize(18)
        .backgroundColor('#02B6FD')
        .padding({ left: 30, right: 30 })

    }
    .width('100%')
    .height(80)
    .padding(10)
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.White)
    .border({
      color: "#f5f5f5",
      width: {
        top: "1"
      }
    })
    .onClick(() => {
      this.showShoppingCart = !this.showShoppingCart
    })
  }
}