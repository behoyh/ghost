// # Ghost Configuration
// Setup your Ghost install for deployment to Zeit Now.sh.

// This is a stripped down version of the default `config-example.js`
// file with only a single ("production") environment for simplicity.

// Full documentation can be found at http://support.ghost.org/config/

var path = require('path');

exports.production = {
    // The url to use when providing links to the site, E.g. in RSS and email.
    // Change this to your Ghost blog's published URL.
    url: 'https://stminapopekyrillos6.org',

    // Example refferer policy
    // Visit https://www.w3.org/TR/referrer-policy/ for instructions
    // default 'origin-when-cross-origin',
    // referrerPolicy: 'origin-when-cross-origin',

    // Example mail config
    // Visit http://support.ghost.org/mail for instructions
    // ```
    //  mail: {
    //      transport: 'SMTP',
    //      options: {
    //          service: 'Mailgun',
    //          auth: {
    //              user: '', // mailgun username
    //              pass: ''  // mailgun password
    //          }
    //      }
    //  },
    // ```

    // #### Database
    // Ghost supports sqlite3 (default), MySQL & PostgreSQL
    // For deployment to Now.sh, a remote/persistent storage should be used
    // (i.e mysql or postgres), so that your content is persisted throughout
    // multiple deployments / instances / upgrades.
    // http://www.fastcomet.com/tutorials/ghost/configure-mysql-database
    "database": {
      "client": "sqlite3",
      "connection": {
          "filename": "content/data/ghost-test.db"
      },
      "useNullAsDefault": true,
      "debug": false
    },

    // #### Use persistent file storage? (No, for Now.sh)
    // http://support.ghost.org/config/#file-storage
    //
    // Now.sh fires up multiple instances of your Ghost server globally,
    // so if we were to upload an image for a blog post on one of the
    // instances then the file would be missing on the other instances.
    // So by default disable local file storage, which forces you to use
    // external image URLs for all blog post and profile images.
    //
    // I recommend using https://cloudup.com/ for image hosting
    // with Direct URL (hotlinking) access.
    fileStorage: true,

    // #### Server
    // http://support.ghost.org/config/#server
    //
    // The server host and port are the IP address and port number that Ghost
    // should listen on.
    // (Probably don't touch this)
    server: {
        host: '0.0.0.0',
        port: '2368'
    },

    // #### Paths
    // http://support.ghost.org/config/#paths
    //
    // Specify where your content directory lives.
    // (Probably don't touch this)
    paths: {
        contentPath: path.join(process.env.GHOST_CONTENT, '/')
    }
};
