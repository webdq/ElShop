import { ElShop } from '../components/ElShop'
import { ElShoppingCart } from '../components/ElShoppingCart'
import { ElSubtotal } from '../components/ElSubtotal'
import { Category, SelectedProduct } from '../models/Product'
import axios from '@ohos/axios'
import { SHOPPING_CART_KEY } from '../utils/productUtil'

PersistentStorage.PersistProp(SHOPPING_CART_KEY,"[]")

@Entry
@Component
struct Index {
  @State showShoppingCart: boolean = false
  @Provide categoryList: Category[] = []
  @Provide categoryIndex: number = 0
  @StorageLink(SHOPPING_CART_KEY)
  @Watch("update")
  productListJson: string = "[]"
  @Provide selectedProductList: SelectedProduct[] = []

  update() {
    this.selectedProductList = JSON.parse(this.productListJson)
  }

  aboutToAppear() {
    this.getData()
  }

  async getData() {
    const res = await axios.get("http://127.0.0.1:8080/elshop.json")
    const category = res.data.category.map(item => {
      const foods = item.foods.map(food => {
        return { ...food, count: 0 }
      })
      return { ...item, foods }
    })
    this.categoryList = category
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        ElShop()
        if (this.showShoppingCart) {
          ElShoppingCart()
        }
        ElSubtotal({ showShoppingCart: $showShoppingCart })
      }
    }
    .width("100%")
    .height("100%")
  }
}
