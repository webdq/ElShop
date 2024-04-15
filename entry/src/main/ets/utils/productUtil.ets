import { Product, SelectedProduct } from '../models/Product'

export const SHOPPING_CART_KEY = "SHOPPING_CART"

// 添加商品
export const addProduct = (product: Product) => {
  const products = JSON.parse(AppStorage.Get<string>(SHOPPING_CART_KEY) || '[]') as SelectedProduct[]
  const selectedProduct = products.find(item => item.id === product.id)
  if (selectedProduct) {
    selectedProduct.count++
  } else {
    products.push({ ...product, count: 1 })
  }
  AppStorage.Set<string>(SHOPPING_CART_KEY, JSON.stringify(products))
}

// 删除商品
export const removeProduct = (id: number) => {
  const products = JSON.parse(AppStorage.Get<string>(SHOPPING_CART_KEY) || '[]') as SelectedProduct[]
  const index = products.findIndex(item => item.id === id)
  const selectedProduct = products[index]
  if (selectedProduct && selectedProduct.count > 0) {
    selectedProduct.count--
    if (selectedProduct.count <= 0) {
      products.splice(index, 1)
    }
  }
  AppStorage.Set<string>(SHOPPING_CART_KEY, JSON.stringify(products))
}

// 清空商品
export const clearAllProduct = () => {
  AppStorage.Set<string>(SHOPPING_CART_KEY, "[]")
}