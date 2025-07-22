document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("choices_container");
  const addButton = document.getElementById("add_choice_button");
  if (!container || !addButton) return;

  // インデックスを詰める関数
  const reindexChoices = () => {
    const choiceItems = container.querySelectorAll("p.choice-item");
    choiceItems.forEach((p, i) => {
      // ラベルのテキストを更新
      const label = p.querySelector("label");
      label.textContent = `選択肢${i + 1}`;

      // inputのnameとidを連番で更新
      const input = p.querySelector("input[type=text]");
      const newIndex = i;
      input.name = `poll[choices_attributes][${newIndex}][option_text]`;
      input.id = `poll_choices_attributes_${newIndex}_option_text`;

      // ラベルのfor属性も更新
      label.setAttribute("for", input.id);
    });
  };

  // 追加ボタンの動作
  addButton.addEventListener("click", () => {
    const currentCount = container.querySelectorAll("p.choice-item").length;
    const nextNum = currentCount + 1;

    const newChoiceHTML = `
      <p class="choice-item">
        <label for="poll_choices_attributes_${currentCount}_option_text">選択肢${nextNum}</label><br>
        <input type="text" name="poll[choices_attributes][${currentCount}][option_text]" id="poll_choices_attributes_${currentCount}_option_text" />
        <button type="button" class="remove-choice-button">削除</button>
      </p>
    `;

    container.insertAdjacentHTML('beforeend', newChoiceHTML);
  });

  // 削除ボタンの動作
  container.addEventListener("click", (event) => {
    if (event.target.classList.contains("remove-choice-button")) {
      const p = event.target.closest("p.choice-item");
      if (p) {
        p.remove();
        reindexChoices(); // 削除後に再インデックス
      }
    }
  });

  // ページロード時にもインデックスを正す（既にある選択肢に対して）
  reindexChoices();
});
