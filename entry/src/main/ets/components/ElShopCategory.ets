import { Category } from '../models/Product'

@Component
export struct ElShopCategory {
  @Consume categoryIndex: number
  @Consume categoryList: Category[]

  build() {
    Column() {
      ForEach(this.categoryList, (item: Category, index: number) => {
        Text(item.name)
          .width('100%')
          .height(40)
          .textAlign(TextAlign.Center)
          .fontSize(12)
          .backgroundColor(this.categoryIndex === index ? '#fff' : 'transparent')
          .onClick(() => {
            this.categoryIndex = index
          })
      })
    }
    .width(90)
    .height('100%')
    .backgroundColor('#eee')
  }
}