import 'package:flutter/material.dart';

import 'package:fluffychat/config/app_config.dart';
import 'package:fluffychat/config/themes.dart';
import 'package:fluffychat/utils/platform_infos.dart';

Future<T?> showAdaptiveBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool isDismissible = true,
}) =>
    showModalBottomSheet(
      context: context,
      builder: builder,
      useRootNavigator: !PlatformInfos.isMobile,
      isDismissible: isDismissible,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 128,
        maxWidth: FluffyThemes.columnWidth * 1.5,
      ),
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConfig.borderRadius),
          topRight: Radius.circular(AppConfig.borderRadius),
        ),
      ),
    );