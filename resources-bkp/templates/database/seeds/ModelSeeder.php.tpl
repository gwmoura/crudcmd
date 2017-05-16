<?php

use Illuminate\Database\Seeder;

class [Model]Seeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if(\App\Models\[Model]::count() == 0){
            $[Model] = [
                //['descricao' => 'Exemplo', 'ativo' => 's']
            ];

            foreach($[Model] as $value){
                \App\Models\[Model]::create($value);
            }
        }
    }
}
