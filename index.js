fetch('get_tournaments.php').then(r => r.json()).then(data => {
  const container = document.getElementById('tournaments');
  data.forEach(t => {
    const div = document.createElement('div');
    div.innerHTML = `<strong>${t.name}</strong> <button onclick="location.href='tournament.html?id=${t.id}'">مشاهدة التفاصيل</button>`;
    container.appendChild(div);
  });
});
fetch('get_top_scorers.php').then(r => r.json()).then(data => {
  const container = document.getElementById('topScorers');
  data.forEach(s => {
    const div = document.createElement('div');
    div.textContent = `${s.player_name} (${s.team_name}) - ${s.goals} أهداف`;
    container.appendChild(div);
  });
});