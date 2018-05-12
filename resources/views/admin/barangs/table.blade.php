@section('css')
    @include('layouts.datatables_css')
@endsection
<div class="table-responsive">
  <table class="table">

{!! $dataTable->table(['width' => '100%','class'=>'table cell-border display dataTable no-footer']) !!}
	</table>
</div>
@section('scripts')
    @include('layouts.datatables_js')
    {!! $dataTable->scripts() !!}
@endsection