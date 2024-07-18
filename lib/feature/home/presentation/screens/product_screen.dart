import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/feature/home/presentation/cubits/product_cubit.dart';
import 'package:flutter_task/feature/home/presentation/cubits/product_state.dart';
import 'package:flutter_task/feature/home/presentation/widgets/product_widget.dart';
import 'package:iconly/iconly.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<ProductCubit>(context);
            return state is GetAllProductLoadingState
                ? const Center(child: CircularProgressIndicator())
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Image.asset(
                  'assets/images/logo_app.png',
                  width: 70.w,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 9,
                      child: SizedBox(
                        height: 55.h,
                        child:TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search_sharp,color: AppColors.primary,size: 40,),
                            hintText: 'Search...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(color:AppColors.primary, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(color: AppColors.primary, width: 2.0),
                            ),
                          ),
                          onChanged: (query) {
                            // logic here
                          },
                        ),

                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyLight.buy,
                          size: 35.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),

                      // Products View
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: cubit.products.length,
                    itemBuilder: (context, index) {
                      final product = cubit.products[index];
                      return ProductWidgets(
                        product: product,
                      );
                    },
                  ),
                ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}