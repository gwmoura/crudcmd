
@extends('layouts.app')

@section('content')
    <h4>[Model]</h4>
    {{ link_to_route('[tablename].create', 'Cadastrar Novo', null, ['class' => 'btn btn-default']) }}
    <hr/>


    <div class="container">
        <table class="table table-bordered table-striped" id="[tablename]-table">
            <thead>
                <tr>
                    <th>Descrição</th>
                    <th>Status</th>
                    <th>Ações</th>
                </tr>
            </thead>
        </table>
    </div>
@endsection

@section('js')
<script>

    $('#[tablename]-table').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Portuguese-Brasil.json"
        },
        processing: true,
        serverSide: true,
        ajax: '{!! route('[tablename].data') !!}',
        columns: [
            { data: 'descricao', name: 'descricao' },
            { data: 'ativo', name: 'ativo'},
            { data: 'acoes', name: 'acoes', orderable: false, searchable: false},
        ]
    });

</script>
@endsection

