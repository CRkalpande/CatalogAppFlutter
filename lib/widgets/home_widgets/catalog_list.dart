import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/pages/home%20_detail_page.dart';
import 'package:flutter/material.dart';
import '../../models/catalog.dart';
import '../themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: catalog),
                )),
            child: CatalogItem(Catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item Catalog;

  const CatalogItem({super.key, required this.Catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(Catalog.id.toString()),
              child: CatalogImage(image: Catalog.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Catalog.name.text.bold.color(context.accentColor).make(),
                Catalog.desc.text.textStyle(context.captionStyle).make(),
                8.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${Catalog.price}".text.bold.make(),
                    _AddtoCart(
                      catalog: Catalog,
                    ),
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddtoCart extends StatefulWidget {
  final Item catalog;
  const _AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<_AddtoCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
