import { SelectedProduct } from '../models/Product'
import { ElProductCount } from './ElProductCount'

@Component
export struct ElProductItem {
  product: SelectedProduct

  build() {
    Row() {
      Image(this.product.picture)
        .width(60)
        .aspectRatio(1)
        .borderRadius(8)

      Column({ space: 5 }) {
        Text(this.product.name)
          .fontSize(14)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(1)

        Text(this.product.description)
          .fontSize(12)
          .fontColor('#999')
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(1)

        Row() {
          Text() {
            Span('¥ ')
              .fontColor('#FF4B33')
              .fontSize(10)
            Span(this.product.price.toString())
              .fontColor('#FF4B33')
              .fontWeight(FontWeight.Bold)
          }
          // 商品数量操作
          ElProductCount({ product: this.product })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 10, right: 10 })
      .height(60)
    }
    .alignItems(VerticalAlign.Top)
  }
}