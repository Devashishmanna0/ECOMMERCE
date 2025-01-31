import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/cupertino.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: title!.text.color(darkFontGrey).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                )),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //swiper section

                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    //title and detail section
                    title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                    10.heightBox,
                    //rating
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30,000".text.color(blueColor).fontFamily(bold).size(18).make(),

                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brands".text.fontFamily(semibold).color(darkFontGrey).size(16).make(),
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.message_rounded, color: darkFontGrey),
                        ),
                      ],
                    ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),

                    //color section
                    10.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomColor)
                                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                                    .make(),
                              ),
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //quantity row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                                "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                                10.widthBox,
                                "(0 available)".text.color(textfieldGrey).make(),
                              ],
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //total row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(textfieldGrey).make(),
                            ),
                            "\$0.00".text.color(blueColor).size(16).fontFamily(bold).make()
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),

                    //description section
                    10.heightBox,
                    "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                    10.heightBox,
                    "This is a dummy item and dummy description here..".text.color(darkFontGrey).make(),

                    //buttons section
                    10.heightBox,
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        itemDetailButtonList.length,
                        (index) => ListTile(
                          title: itemDetailButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                    10.heightBox,
                    //products may like section

                    productsyoumaylike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
                    10.heightBox,
                    //
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            6,
                            (index) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Image.asset(imgP1, width: 130, fit: BoxFit.cover),
                                  10.heightBox,
                                  "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                  10.heightBox,
                                  "\$600".text.color(blueColor).fontFamily(bold).size(16).make()
                                ])
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                                    .roundedSM
                                    .padding(const EdgeInsets.all(8))
                                    .make()),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                color: blueColor,
                onPress: () {},
                textColor: whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                ),
                title: "Add to Cart",
              ),
            ),
          ],
        ));
  }
}
