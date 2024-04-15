@Component
export struct ElShopHeader {
  build() {
    Row() {
      Image($r("app.media.left"))
        .width(20)
        .height(20)
        .fillColor("#191919")

      Row() {
        Image($r('app.media.search'))
          .width(14)
          .aspectRatio(1)
          .fillColor('#555')
          .margin({ right: 5 })
        Text('搜一搜')
          .fontSize(12)
          .fontColor('#555')
      }
      .width(150)
      .height(30)
      .backgroundColor('#eee')
      .borderRadius(15)
      .padding({ left: 5, right: 5 })

      Image($r('app.media.message'))
        .width(20)
        .fillColor("#191919")

      Image($r('app.media.favor'))
        .width(20)
        .fillColor("#191919")

      Image($r("app.media.add"))
        .width(20)
        .fillColor("#191919")

    }
    .width('100%')
    .height(60)
    .backgroundColor('#fbfbfb')
    .padding(10)
    .justifyContent(FlexAlign.SpaceAround)
  }
}