// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import Chart from 'chart.js/auto'

(async function() {
  const data = [
    { year: 2010, count: 10 },
    { year: 2011, count: 20 },
    { year: 2012, count: 15 },
    { year: 2013, count: 25 },
    { year: 2014, count: 22 },
    { year: 2015, count: 30 },
    { year: 2016, count: 28 },
  ];

  new Chart(
    document.getElementById('clients'),
    {
      type: 'bar',
      options: {
        aspectRatio: 1,
      },
      data: {
        labels: data.map(row => row.year),
        datasets: [
          {
            label: 'Clients by year',
            data: data.map(row => row.count)
          }
        ]
      }
    }
  );
})();

(async function() {
  const data = [
    { year: 2010, count: 10 },
    { year: 2011, count: 20 },
    { year: 2012, count: 15 },
    { year: 2013, count: 25 },
    { year: 2014, count: 22 },
    { year: 2015, count: 30 },
    { year: 2016, count: 28 },
  ];

  new Chart(
    document.getElementById('products'),
    {
      type: 'doughnut',
      options: {
        aspectRatio: 1,
      },
      data: {
        labels: data.map(x => x.year),
        datasets: [
          {
            label: 'Products',
            data: data.map(row => row.count)
          }
        ]
      }
    }
  );
})();

(async function() {
  const data = [
    { year: 2010, count: 10 },
    { year: 2011, count: 20 },
    { year: 2012, count: 15 },
    { year: 2013, count: 25 },
    { year: 2014, count: 22 },
    { year: 2015, count: 30 },
    { year: 2016, count: 28 },
  ];

  new Chart(
    document.getElementById('sales'),
    {
      type: 'line',
      options: {
        aspectRatio: 1,
      },
      data: {
        labels: data.map(x => x.year),
        datasets: [
          {
            label: 'Sales',
            data: data.map(row => ({
              x: row.count,
              y: row.count,
              r: row.count
            }))
          }
        ]
      }
    }
  );
})();

