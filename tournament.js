const params = new URLSearchParams(location.search);
fetch(`get_tournament_details.php?id=${params.get('id')}`).then(r => r.json()).then(data => {
  const container = document.getElementById('tournamentDetails');
  container.innerHTML = `<h1>${data.name}</h1>`;
  // عرض بقية تفاصيل البطولة
});