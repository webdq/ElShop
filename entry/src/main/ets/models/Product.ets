export class Product {
  id: number = 0
  name: string = ""
  positive_reviews: string = ""
  food_label_list: string[] = []
  price: number = 0
  picture: string = ""
  description: string = ""
  tag: string = ""
  monthly_sales: number = 0
}

export class SelectedProduct extends Product {
  count: number = 0
}

export class Category {
  id: number = 0
  name: string = ""
  foods: Product[] = []
}