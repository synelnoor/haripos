@section('css')
    @include('layouts.datatables_css')
@endsection

{!! $dataTable->table(['width' => '100%','class'=>'table cell-border display dataTable no-footer']) !!}

@section('scripts')
    @include('layouts.datatables_js')
    {!! $dataTable->scripts() !!}
@endsection