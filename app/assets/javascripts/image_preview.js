document.addEventListener('turbolinks:load', function() {
  const input = document.getElementById('image-upload');
  const preview = document.getElementById('image-preview');
    // プロフィール画像アップロード用の要素を取得
  const profileInput = document.getElementById('profile-image-upload');
  const profilePreview = document.getElementById('profile-image-preview');

  if (input) {
    input.addEventListener('change', function(event) {
      const file = event.target.files[0];
      if (file && file.type.startsWith('image/')) {
        const reader = new FileReader();
        reader.onload = function(e) {
          const img = document.createElement('img');
          img.src = e.target.result;
          img.style.maxWidth = '300px';
          img.style.maxHeight = '300px';
          // 新しい画像を既存のプレビューエリアに追加
          preview.appendChild(img);
        };
        reader.readAsDataURL(file);
      } else {
      }
    });
  }

  if (profileInput && profilePreview) {
  profileInput.addEventListener('change', function(event) {

    const file = event.target.files[0];
    if (file && file.type.startsWith('image/')) {

      const reader = new FileReader();
      reader.onload = function(e) {

        const img = document.createElement('img');
        img.src = e.target.result;
        
        // プロフィール画像用のスタイルを適用（円形にする）
        img.style.width = '150px';
        img.style.height = '150px';
        img.style.borderRadius = '50%';
        img.style.objectFit = 'cover';
        
        profilePreview.appendChild(img);
      };
      reader.readAsDataURL(file);
      }
    });
  } 
}); 