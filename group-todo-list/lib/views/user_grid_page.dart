import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/navigation.dart';
import 'package:flutter_app/view_models/all_users_vm.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_app/view_models/todos_of_user_vm.dart';
import 'dart:ui';

class UserGridPage extends StatelessWidget {
  const UserGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              padding: EdgeInsets.only(top: statusBarHeight),
              color: Colors.white.withOpacity(0.2),
              child: AppBar(
                title: const Text(
                  'Group To-do List',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.person_add),
                    onPressed: () =>
                        Provider.of<NavigationService>(context, listen: false)
                            .goAddUserOnUsers(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          // background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: SweepGradient(
                  center: Alignment.center,
                  startAngle: 0.0,
                  endAngle: 6.28319,
                  colors: [
                    Color(0xFF87e7d7),
                    Color(0xFF74e9f0),
                    Color(0xFFa46ddb),
                    Color(0xFFfc73b7),
                    Color(0xFFf1b9a8),
                    Color(0xFFd3d3aa),
                  ],
                ),
              ),
            ),
          ),

          // blur overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                color: Colors.white.withAlpha(50),
              ),
            ),
          ),

          Consumer<AllUsersViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.users.isEmpty) {
                return const Center(child: Text('No users.'));
              }
              // itung grid cols no., pastiin ada stidaknya 1
              double screenWidth = MediaQuery.of(context).size.width;
              double gridTileMinWidth = 170;
              int gridCrossAxisCount =
              max(1, (screenWidth / gridTileMinWidth).floor());
              double safeAreaBottomPadding = MediaQuery.of(context).padding.bottom;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridCrossAxisCount,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                padding:
                EdgeInsets.fromLTRB(16, 16, 16, 16 + safeAreaBottomPadding),
                itemCount: viewModel.users.length,
                itemBuilder: (context, index) =>
                    _buildGridItem(context, viewModel.users[index], viewModel),
              );
            },
          ),
        ],),
    );
  }

  Widget _buildGridItem(
      BuildContext context, User user, AllUsersViewModel viewModel) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => Provider.of<NavigationService>(context, listen: false)
          .goTodosOnUsers(user.id!),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0x33FFFFFF),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withAlpha(80),),
          ),
          child: Stack(
            children: [
              // blur layer
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(color: Colors.transparent),
                ),
              ),

              // content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                //child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => deleteConfirmation(context, user, viewModel),
                        padding: EdgeInsets.zero, // Removes extra padding
                        constraints: const BoxConstraints(), // Removes default size box
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: _buildAvatarImage(context, user),
                    ),
                    //const SizedBox(height: 4),
                    Text(
                      user.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.headlineLarge?.copyWith(color: Colors.white),
                        text: '${user.itemCount} ',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'items to do.',
                            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // delete Button INSIDE the rounded card
              /*Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.cancel, color: Colors.white),
                  onPressed: () => deleteConfirmation(context, user, viewModel),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildAvatarImage(BuildContext context, User user) {
    if (user.avatarSvgData != null) {
      return SvgPicture.string(
        user.avatarSvgData!,
        fit: BoxFit.contain,
        placeholderBuilder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (user.avatarUrl != null) {
      return ClipOval(
        child: Stack(
          children: <Widget>[
            const Center(child: CircularProgressIndicator()),
            Positioned.fill(
              child: Center(
                child: Image.network(
                  user.avatarUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return FittedBox(
      fit: BoxFit.cover,
      child: Icon(
        Icons.account_circle,
        color: Theme.of(context).colorScheme.primary.withAlpha(43),
      ),
    );
  }

  void deleteConfirmation(
      BuildContext context, User user, AllUsersViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User?'),
        content: Text('${user.name}\'s to-dos will be randomly redistributed to other users.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                await viewModel.delUser(user.id!);
                Navigator.of(context).pop();
              } catch (e) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${e.toString()}')),
                );
              }
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
