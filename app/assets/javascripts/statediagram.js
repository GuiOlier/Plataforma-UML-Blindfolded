//= require DataTables

// Função ao inicializar o documento.
$(document).ready(function(){

  // Efeito de esconder o modal ao clicar no 'Salvar'
  $('.btn-modal-element').click(function(){
    $('#modalElement').modal('hide');
  });
  // Efeito de esconder o modal ao clicar no 'Salvar'
  $('.btn-modal-transition').click(function(){
    $('#modalTransition').modal('hide');
  });

  // Configurando o DataTable
  $('.data-table').dataTable( {
    paginate: false,
    scrollY: 500,
    ordering: false
  } );

  // Efeito de ao clicar no Button dá focus para o element inicial.
  $('#btnElemen').click(function(){
    setTimeout(function(){
        $('#targetElement').focus();
    }, 500);
  });

  // Efeito de ao clicar no Button dá focus para o element inicial.
  $('#btnTransition').click(function(){
    setTimeout(function(){
        $('#targetTransition').focus();
    }, 500);
  });

});
