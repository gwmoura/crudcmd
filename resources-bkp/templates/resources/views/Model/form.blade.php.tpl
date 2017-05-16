{!! Form::model($model, ['route' => $route, 'method' => $method]) !!}

    @foreach($model->fields as $attribute => $value)
        <p>
            {{ Form::label($value['label']) }}
            {{ call_user_func('Form::'.$value['type'], $model->getTable().'['.$attribute.']', $model->$attribute) }}
        </p>
    @endforeach
    <p>
        {{ Form::submit('salvar') }}
    </p>
{!! Form::close() !!}