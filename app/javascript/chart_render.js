document.addEventListener("turbo:load", function () {
  const container = document.querySelector('.chart-container');
  const canvas = document.getElementById('votePieChart');
  if (!container || !canvas) return;

  let chart;

  const renderChart = () => {
    const ctx = canvas.getContext('2d');

    const labels = JSON.parse(document.getElementById('votePieChart').dataset.labels);
    const data = JSON.parse(document.getElementById('votePieChart').dataset.data);

    if (chart) {
      chart.destroy();
    }

    chart = new Chart(ctx, {
      type: 'pie',
      data: {
        labels: labels,
        datasets: [{
          data: data,
          backgroundColor: [
            'rgba(255, 99, 132, 0.7)',
            'rgba(54, 162, 235, 0.7)',
            'rgba(255, 206, 86, 0.7)',
            'rgba(75, 192, 192, 0.7)',
            'rgba(153, 102, 255, 0.7)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'bottom'
          }
        }
      }
    });
  };

  const waitUntilVisible = () => {
    if (
      container.offsetWidth > 0 &&
      container.offsetHeight > 0 &&
      getComputedStyle(container).display !== 'none'
    ) {
      renderChart();
    } else {
      requestAnimationFrame(waitUntilVisible);
    }
  };

  waitUntilVisible();
});
