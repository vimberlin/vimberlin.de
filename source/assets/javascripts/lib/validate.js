$(function () {
  // Setup Defaults
  var validationDefaults = {
    highlight: function (label) { $(label).closest('.form-group').addClass('has-error'); },
    success:   function (label) { $(label).addClass('valid').closest('.form-group').removeClass('has-error'); }
  }

  $('form.validate').each(function(){
    // Use $.extend to merge associative arrays if you want to overwrite defaults
    // var options = $.extend({}, validationDefaults, newOptions);
    $(this).validate(validationDefaults);
  });

  $('form.mark-required').each(function(){
    $('.required').closest('.form-group').find('.control-label').append(' <span class="text-danger">*</span>');
  });
});