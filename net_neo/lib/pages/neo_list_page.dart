import 'package:flutter/material.dart';
import 'package:net_neo/models/neo.dart';
import 'package:net_neo/services/neo_service.dart';

class NeoListPage extends StatefulWidget {
  NeoListPage({Key? key}) : super(key: key);

  @override
  State<NeoListPage> createState() => _NeoListPageState();
}

class _NeoListPageState extends State<NeoListPage> {
  final NeoService neoService = NeoService();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  List<Neo>? _neos;

  Future<void> loadData() async {
    final neos = await neoService.getNeo();
    List<Neo> neoList = [];
    neos?.neos.forEach((key, value) {
      neoList.addAll(value);
    });
    setState(() {
      _neos = neoList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neo List'),
      ),
      body: ListView.builder(
          itemBuilder: _buildItem, itemCount: _neos?.length ?? 0),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final neo = _neos![index];
    return Card(
      child: ListTile(
        title: Text(neo.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('id: ${neo.id}'),
            Text('size: ${neo.sizeMax}x${neo.sizeMax}'),
            Text('velocity: ${neo.velocity}'),
            Text('missDistance ${neo.missDistance}'),
          ],
        ),
      ),
    );
  }
}
