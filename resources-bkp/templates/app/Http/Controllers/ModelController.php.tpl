<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Semge\Laravel\BaseControllerTrait;
use App\Http\Requests\[Model]Request;

use Datatables;

class [Model]Controller extends Controller
{
    use BaseControllerTrait;

    protected $repositoryClass = \App\Repositories\[Model]Repository::class;

    /**
    * Process datatables ajax request.
    *
    * @return \Illuminate\Http\JsonResponse
    */
    public function anyData()
    {
    	$[Model] = $this->repository->getDataForDataTable();

    	return Datatables::of($[Model])
        ->addColumn('acoes', function($[Model]) {
            return '<a  style="float:left"  href="'.route('[tablename].edit', [$[Model]->id]).'" class="btn btn-default">Editar</a>
            
                <form style="float:left" method="POST"
                    action="/[tablename]/'. $[Model]->id .'"
                    data-message="Delete this Thing?" >'. csrf_field() .'
                    <input type="hidden" name="_method" value="PUT">
                    <input type="hidden" name="[tablename][ativo]" value="'.(($[Model]->ativo) ? 0 : 1).'">
                    <input type="submit" class="btn btn-default" value="'.(($[Model]->ativo) ? "Desativar" : "Ativar").'" >
                </form>';
        })
        ->editColumn('ativo', function($[Model]) {
            return (($[Model]->ativo) ? "Ativo" : "Inativo");
        })
        ->rawColumns(['acoes'])
        ->removeColumn('id')
        ->make(true);
    }
}
