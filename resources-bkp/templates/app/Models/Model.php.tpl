<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Semge\Laravel\BaseModel;

class [Model] extends BaseModel
{
    protected $table = '[tablename]';
    
    public $fields = [
		'descricao' => ['label' => 'Descrição', 'type' => 'text']
	];

	protected $fillable = ['descricao', 'ativo'];

	public function getFillable()
	{
		return $this->fillable;
	}
}
