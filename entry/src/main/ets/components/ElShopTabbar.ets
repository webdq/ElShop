@Component
export struct ElShopTabbar {
  @Builder
  TabItem(active: boolean, title: string, subtitle?: string) {
    Column() {
      Text() {
        Span(title)
        if (subtitle) {
          Span(' ' + subtitle)
            .fontSize(10)
            .fontColor(active ? '#000' : '#666')
        }
      }
      .layoutWeight(1)
      .fontColor(active ? '#000' : '#666')
      .fontWeight(active ? FontWeight.Bold : FontWeight.Normal)

      Column()
        .width(20)
        .height(3)
        .borderRadius(5)
        .backgroundColor(active ? '#02B6FD' : 'transparent')
    }
    .alignItems(HorizontalAlign.Center)
    .padding({ left: 15, right: 15 })
  }

  build() {
    Row() {
      this.TabItem(true, '点餐')
      this.TabItem(false, '评价', '196')
      this.TabItem(false, '商家')
    }
    .width("100%")
    .height(40)
    .justifyContent(FlexAlign.Start)
    .backgroundColor('#fbfbfb')
  }
}