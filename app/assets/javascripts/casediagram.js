//= require DataTables

// Função ao inicializar o documento.
$(document).ready(function(){

  // Efeito de esconder o modal ao clicar no 'Salvar'
  $('.btn-modal-component').click(function(){
    $('#modalComponent').modal('hide');
  });
  // Efeito de esconder o modal ao clicar no 'Salvar'
  $('.btn-modal-relation').click(function(){
    $('#modalRelation').modal('hide');
  });

  // Configurando o DataTable
  $('.data-table').dataTable( {
    paginate: false,
    scrollY: 500,
    ordering: false
  } );

  // Efeito de ao clicar no Button dá focus para o element inicial.
  $('#btnComponent').click(function(){
    setTimeout(function(){
        $('#targetComponent').focus();
    }, 500);
  });

  // Efeito de ao clicar no Button dá focus para o element inicial.
  $('#btnRelation').click(function(){
    setTimeout(function(){
        $('#targetRelation').focus();
    }, 500);
  });

});
