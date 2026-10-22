const { allureCypress } = require('allure-cypress/reporter');

module.exports = {
  projectId: "6it47k",
  video: true,
  allowCypressEnv: false,

  e2e: {
    setupNodeEvents(on, config) {
      allureCypress(on, config, {
        resultsDir: 'allure-results',
      });
      return config;
    },
    baseUrl: 'http://localhost:3000/',
  },
};
