const ctx = document.getElementById('graficoProdutividade').getContext('2d');
const graficoTrabalho = document.getElementById('graficoTrabalho').getContext('2d');
const totalTarefas = 100;
const concluidas = 15;
const pendentes = totalTarefas - concluidas;
document.getElementById("quantidadeTarefas").innerText = concluidas;

document.getElementById("quantidadeFalta").innerText = totalTarefas;

new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'],
        datasets: [{
            label: 'Produtividade (%)',
            data: [10, 100, 70, 25, 60, 88, 95],
            borderColor: '#10b981',
            backgroundColor: 'rgba(53, 143, 88, 0.4)',
            fill: true,
            tension: 0.4
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                display: true
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                max: 100
            }
        }
    }
});

new Chart(graficoTrabalho, {
    type: 'doughnut',
    data: {
        labels: ['Concluído', 'Pendente'],
        datasets: [{
            data: [concluidas, pendentes],
            backgroundColor: [
                '#10b981',
                '#a1a1aa'
            ],
            borderWidth: 0
        }]
    },
    options: {
        cutout: '75%',
        plugins: {
            legend: {
                position: 'bottom'
            }
        }
    }
});