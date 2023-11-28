import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: 'Botones',
      subTitle: 'Varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button),
  MenuItems(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'Progress Indicator',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItems(
      title: 'Snackbars y dialogs',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItems(
      title: 'Animated container',
      subTitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItems(
      title: 'UI Controls + Title',
      subTitle: 'Una serie de controles',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItems(
      title: 'Introducción a la aplicación',
      subTitle: 'Pequeño tutorial introductorio',
      link: '/tutorial',
      icon: Icons.accessibility_rounded),
  MenuItems(
      title: 'InfiniteScroll y Pull',
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
  MenuItems(
      title: 'Counter',
      subTitle: 'Counter con riverpod',
      link: '/counter',
      icon: Icons.add_circle),
  MenuItems(
      title: 'Cambiar Colores',
      subTitle: 'Cambiar temas de la aplicación',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined),
];
