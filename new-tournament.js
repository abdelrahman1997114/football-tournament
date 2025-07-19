const groups = ['A', 'B', 'C', 'D'];
const form = document.getElementById('playersForm');
const playerGroups = document.getElementById('playerGroups');

groups.forEach(g => {
  const fieldset = document.createElement('fieldset');
  const legend = document.createElement('legend');
  legend.textContent = `الفئة ${g}`;
  fieldset.appendChild(legend);
  for (let i = 1; i <= 3; i++) {
    const input = document.createElement('input');
    input.placeholder = `لاعب ${i}`;
    input.name = `group_${g}[]`;
    fieldset.appendChild(input);
  }
  playerGroups.appendChild(fieldset);
});

function generateTeams() {
  // تبسيط لتوليد الفرق عشوائيًا
  alert("تم توليد الفرق. الرجاء تسمية الفرق يدويًا.");
}
function generateMatches() {
  alert("تم توليد جدول المباريات. أضف التفاصيل.");
}
form.addEventListener('submit', e => {
  e.preventDefault();
  alert("تم حفظ البطولة (محاكاة).");
});