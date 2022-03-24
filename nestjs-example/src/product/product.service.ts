import { Injectable, NotFoundException } from '@nestjs/common'

import { Product } from './product.model'

@Injectable()
export class ProductService {
  private products: Product[] = []

  addProduct(title: string, desc: string, price: number) {
    const id = Math.random().toString()
    const newProduct = new Product(id, title, desc, price)
    this.products.push(newProduct)
    return newProduct
  }

  getAllProducts() {
    return [...this.products]
  }

  getProduct(id: string) {
    const product = this.findProduct(id)[0]
    return { ...product }
  }

  updateProduct(id: string, title: string, desc: string, price: number) {
    const [product, index] = this.findProduct(id)
    const updatedProduct = { ...product }
    if (title) {
      updatedProduct.title = title
    }
    if (desc) {
      updatedProduct.description = desc
    }
    if (price) {
      updatedProduct.price = price
    }
    this.products[index] = updatedProduct
    return updatedProduct
  }

  deleteProduct(id: string) {
    const index = this.findProduct(id)[1]
    this.products.splice(index, 1)
    return { id }
  }

  private findProduct(id: string): [Product, number] {
    const index = this.products.findIndex(prod => prod.id === id)
    const product = this.products[index]
    if (!product) {
      throw new NotFoundException('Could not found product.')
    }
    return [product, index]
  }
}
