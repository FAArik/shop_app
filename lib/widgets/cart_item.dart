import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
  });

  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      background: Container(
        color: Theme.of(context).colorScheme.error,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(child: Text("\$$price")),
              ),
            ),
            title: Text(title),
            subtitle: Text("Total \$${price * quantity}"),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
