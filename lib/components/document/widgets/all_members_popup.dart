import 'package:dart_appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_doc/app/navigation/routes.dart';
import 'package:google_doc/app/providers.dart';
import 'package:google_doc/app/state/state.dart';
import 'package:google_doc/components/document/state/document_state.dart';
import 'package:google_doc/models/models.dart';
import 'package:routemaster/routemaster.dart';
import 'package:google_doc/components/document/state/document_controller.dart';


// final _documentsProvider = Provider.family<String?, String>((ref, id) {
//   return ref.read(DocumentController.provider(id)).documentPageData?.id;
// });

String _id = '0';

final _memberProvider = FutureProvider<User>((ref) async {
  print(_id);
  return ref
      .read(Repository.database)
      .getAllMembers(_id);
});

class AllMembersPopup extends ConsumerStatefulWidget {
  const AllMembersPopup({Key? key, required this.documentId,}) : super(key: key);
  final String documentId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllDocumentsPopopState();
}

class _AllDocumentsPopopState extends ConsumerState<AllMembersPopup> {
  @override
  Widget build(BuildContext context) {
    _id = widget.documentId;
    final documents = ref.watch(_memberProvider);
    return documents.when(
      data: ((data) => _DocumentsGrid(documents: data)),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, st) => Center(
        child: Text('Could not load data $e'),
       
      ),
    );
    }
  
}

class _DocumentsGrid extends StatelessWidget {
  const _DocumentsGrid({
    Key? key,
    required this.documents,
  }) : super(key: key);

  final User documents;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int crossAxisCount = 6;
      double verticalPadding = 32;
      final maxWidth = constraints.maxWidth;

      if (maxWidth < 1400) {
        verticalPadding = 28;
        crossAxisCount = 5;
      }
      if (maxWidth < 1100) {
        verticalPadding = 18;
        crossAxisCount = 4;
      }
      if (maxWidth < 900) {
        verticalPadding = 12;
        crossAxisCount = 3;
      }
      if (maxWidth < 500) {
        verticalPadding = 8;
        crossAxisCount = 2;
      }

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Text(
                'Members',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Scrollbar(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                  ),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final documentPage = documents;

                    final title = (documentPage == null)
                        ? 'No title'
                        : documentPage.name;
                    
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(1, 3),
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.0,
                                    vertical: verticalPadding,
                                  ),
                                  child: Text(
                                    title,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}