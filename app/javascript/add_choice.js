document.addEventListener("turbo:load", () => {
  const container = document.getElementById("choices_container");
  const addButton = document.getElementById("add_choice_button");
  if (!container || !addButton) return;

  // インデックス更新関数
  function reindexChoices() {
    const choiceItems = container.querySelectorAll("p.choice-item");
    choiceItems.forEach((p, i) => {
      const label = p.querySelector("label");
      const input = p.querySelector("input[type=text]");
      label.textContent = `選択肢${i + 1}`;
      const newId = `poll_choices_attributes_${i}_option_text`;
      input.name = `poll[choices_attributes][${i}][option_text]`;
      input.id = newId;
      label.setAttribute("for", newId);
    });
  }

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
    reindexChoices();
  });

  container.addEventListener("click", (event) => {
    if (event.target.classList.contains("remove-choice-button")) {
      const p = event.target.closest("p.choice-item");
      if (p) {
        p.remove();
        reindexChoices();
      }
    }
  });

  // ページ読み込み時に既存の選択肢のインデックスを正す
  reindexChoices();
});
