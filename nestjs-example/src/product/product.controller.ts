import { Controller, Post, Get, Patch, Delete, Body, Param } from '@nestjs/common'

import { ProductService } from './product.service'

@Controller('product')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Post()
  addProduct(
    @Body('title') title: string,
    @Body('description') desc: string,
    @Body('price') price: number
  ) {
    return this.productService.addProduct(title, desc, price)
  }

  @Get()
  getAllProducts() {
    return this.productService.getAllProducts()
  }

  @Get(':id')
  getProduct(@Param('id') id: string) {
    return this.productService.getProduct(id)
  }

  @Patch(':id')
  updateProduct(
    @Param('id') id: string,
    @Body('title') title: string,
    @Body('description') desc: string,
    @Body('price') price: number
  ) {
    return this.productService.updateProduct(id, title, desc, price)
  }

  @Delete(':id')
  deleteProduct(@Param('id') id: string) {
    return this.productService.deleteProduct(id)
  }
}
