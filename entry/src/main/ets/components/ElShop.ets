import { ElShopHeader } from './ElShopHeader'
import { ElShopTabbar } from './ElShopTabbar'
import { ElShopBody } from './ElShopBody'

@Component
export struct ElShop {
  build() {
    Column() {
      ElShopHeader()
      ElShopTabbar()
      ElShopBody()
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.White)
  }
}