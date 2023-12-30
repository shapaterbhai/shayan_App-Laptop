import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../controllers/product_details_controller.dart';
import 'widgets/rounded_button.dart';
import 'widgets/size_item.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 600.h, // Increased the height for the image
                    child: Image.asset(
                      controller.product.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 20.w,
                    right: 20.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Button
                        RoundedButton(
                          onPressed: () => Get.back(),
                          child: SvgPicture.asset(
                            Constants.backArrowIcon,
                            fit: BoxFit.none,
                          ),
                        ),
                        // Favorite Button
                        GetBuilder<ProductDetailsController>(
                          id: 'FavoriteButton',
                          builder: (_) => RoundedButton(
                            onPressed: () =>
                                controller.onFavoriteButtonPressed(),
                            child: Align(
                              child: SvgPicture.asset(
                                controller.product.isFavorite!
                                    ? Constants.favFilledIcon
                                    : Constants.favOutlinedIcon,
                                width: 16.w,
                                height: 15.h,
                                color: controller.product.isFavorite!
                                    ? null
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  controller.product.name!,
                  style: theme.textTheme.bodyLarge,
                ).animate().fade().slideX(
                  duration: const Duration(milliseconds: 300),
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      '\$${controller.product.price}',
                      style: theme.textTheme.displayMedium,
                    ),
                    30.horizontalSpace,
                    const Icon(Icons.star_rounded, color: Color(0xFFFFC542)),
                    5.horizontalSpace,
                    Text(
                      controller.product.rating!.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      '(${controller.product.reviews!})',
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ).animate().fade().slideX(
                  duration: const Duration(milliseconds: 300),
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'what size you choose:',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold
                  ),
                ).animate().fade().slideX(
                  duration: const Duration(milliseconds: 300),
                  begin: -1,
                  curve: Curves.easeInSine,
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GetBuilder<ProductDetailsController>(
                  id: 'Size',
                  builder: (_) => Row(
                    children: [
                      SizeItem(
                        onPressed: () => controller.changeSelectedSize('2.5'),
                        label: '2.5',
                        selected: controller.selectedSize == '2.5',
                      ),
                      10.horizontalSpace,
                      SizeItem(
                        onPressed: () => controller.changeSelectedSize('4.5'),
                        label: '4.5',
                        selected: controller.selectedSize == '4.5',
                      ),
                      10.horizontalSpace,
                      SizeItem(
                        onPressed: () => controller.changeSelectedSize('9.5'),
                        label: '9.5',
                        selected: controller.selectedSize == '9.5',
                      ),
                      10.horizontalSpace,
                      SizeItem(
                        onPressed: () => controller.changeSelectedSize('12'),
                        label: '12',
                        selected: controller.selectedSize == '12',
                      ),
                    ],
                  ).animate().fade().slideX(
                    duration: const Duration(milliseconds: 300),
                    begin: -1,
                    curve: Curves.easeInSine,
                  ),
                ),              
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomButton(
                  text: 'Add to Cart',
                  onPressed: () => controller.onAddToCartPressed(),
                  disabled: controller.product.quantity! > 0,
                  fontSize: 16.sp,
                  radius: 12.r,
                  verticalPadding: 12.h,
                  hasShadow: true,
                  shadowColor: theme.primaryColor,
                  shadowOpacity: 0.3,
                  shadowBlurRadius: 4,
                  shadowSpreadRadius: 0,
                ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 300),
                  begin: 1,
                  curve: Curves.easeInSine,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
