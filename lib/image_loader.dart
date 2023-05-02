import 'dart:async';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'lazy_loader.dart';

loadImageExample(yearCentury) {
  Map yearsToImages = {
    1000: ['images/thanjavur_brihadeeshwara.jpg', 'images/chinese_scroll.jpg'],
    1100: ['images/islamic_golden.jpg', 'images/byzantine_art.jpg'],
    1200: ['images/genghis_khan.jpg', 'images/vikings.jpg'],
    1300: ['images/berry-septembre.jpg', 'images/black_plague.jpg'],
    1400: ['images/ottomans_constantinople.jpg', 'images/da_vinci.jpg'],
    1500: ['images/school_athens.jpg', 'images/spanish_conquistadors.jpg'],
    1600: ['images/dutch_fleet.jpg', 'images/galileo_telescope.jpg'],
    1700: ['images/slaves_ruvuma.jpg', 'images/execution_robespierre.jpg'],
    1800: ['images/steam_engine.jpg', 'images/french_revolution.jpg'],
    1900: ['images/churchill_roosevelt_stalin.jpg', 'images/moon_landing.jpg'],
  };

  return yearsToImages[yearCentury];
}
