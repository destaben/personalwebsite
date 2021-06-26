module.exports = {
    siteMetadata: {
        description: "Personal website",
        locale: "en",
        title: "David Estabén",
        formspreeEndpoint: "https://formspree.io/f/mzbygrdp",
        },
    plugins: [
      {
        resolve: "@wkocjan/gatsby-theme-intro",
        options: {
          theme: "bright-red",
          basePath: "/",
          contentPath: "website/",
          showThemeLogo: false
        },
      },
      {
        resolve: `gatsby-plugin-google-analytics`,
        options: {
          trackingId: "YOUR_GOOGLE_ANALYTICS_TRACKING_ID",
          head: false,
          anonymize: true,
          respectDNT: true,
          exclude: ["/preview/**", "/do-not-track/me/too/"],
          pageTransitionDelay: 0,
          optimizeId: "YOUR_GOOGLE_OPTIMIZE_TRACKING_ID",
          experimentId: "YOUR_GOOGLE_EXPERIMENT_ID",
          variationId: "YOUR_GOOGLE_OPTIMIZE_VARIATION_ID",
          defer: false,
          sampleRate: 5,
          siteSpeedSampleRate: 10,
          cookieDomain: "info.destaben.dev",
        },
      }
    ],
  }