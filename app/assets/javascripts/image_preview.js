document.addEventListener('turbolinks:load', function() {
  const input = document.getElementById('image-upload');
  const preview = document.getElementById('image-preview');

  if (input) {
    input.addEventListener('change', function(event) {
      preview.innerHTML = ''; // 既存のプレビューをクリア
      const file = event.target.files[0];

      if (file && file.type.startsWith('image/')) {
        const reader = new FileReader();
        reader.onload = function(e) {
          const img = document.createElement('img');
          img.src = e.target.result;
          img.style.maxWidth = '300px';
          img.style.maxHeight = '300px';
          preview.appendChild(img);
        };
        reader.readAsDataURL(file);
      } else {
        preview.innerHTML = '<p>画像ファイルを選択してください</p>';
      }
    });
  }
});