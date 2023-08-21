// document.addEventListener("DOMContentLoaded", function() {
//   const inputElement = document.querySelector('.filepond');
//   const pond = FilePond.create(inputElement);

//   FilePond.setOptions({
//     server: {
//       url: '/rails/active_storage/direct_uploads',
//       process: {
//         headers: {
//           'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").content
//         }
//       }
//     }
//   });
// });

// import * as Filepond from 'filepond';

// import FilePondPluginImagePreview from 'filepond-plugin-image-preview';

// import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type';

// Filepond.registerPlugin(
//   FilePondPluginFileValidateType,
//   FilePondPluginImagePreview
// );

// const inputElement = document.querySelector('#post-images');

// const pond = Filepond.create(inputElement, {
//   credits: {},
//   storeAsFile: true,
//   allowMultiple: true,
//   allowReorder: true,
//   acceptedFileTypes: ['image/*'],  // it was 'acceptfileType', also ensure the correct format for accepted types
// });
