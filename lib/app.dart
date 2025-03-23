import 'package:create_base/app/routers/app_router.dart';
import 'package:create_base/core/di/locator.dart';
import 'package:create_base/core/local/hive_storage.dart';
import 'package:create_base/core/theme/bloc/theme_bloc.dart';
import 'package:create_base/utils/device/web_material_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  final GlobalStorage storage;
  const App({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(getIt<GlobalStorage>()),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return MaterialApp.router(
                    title: 'Flutter Demo',
                    // locale: context.locale,
                    // supportedLocales: context.supportedLocales,
                    // localizationsDelegates: context.localizationDelegates,
                    theme: state.appTheme,
                    themeMode: ThemeMode.light,
                    debugShowCheckedModeBanner: false,
                    scrollBehavior: MyCustomScrollBehavior(),
                    routerDelegate: AppRouter.router.routerDelegate,
                    routeInformationParser:
                        AppRouter.router.routeInformationParser,
                    routeInformationProvider:
                        AppRouter.router.routeInformationProvider,
                  );
                },
              );
            }));
  }
}
