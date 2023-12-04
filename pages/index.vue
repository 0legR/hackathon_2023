<template lang="pug">
.container-publick__wrapper.w-full.pb-4
  .container-publick.mx-auto.px-6
    .container-publick__header.flex.items-center.justify-between.px-4
      .w-fill
        NuxtLink(to="/cabinet")
          img(src="/logo.png" class="h-16")
      .w-full.flex.justify-between.mr-14
        .text-white.mr-2(v-for="(link, ndex) in headerDataLinks")
          NuxtLink(to="#") {{ link }}
      .w-fill
        NuxtLink.btn-link.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg(to="/cabinet") Sign up
    .container-publick__title-content.flex.flex-col.items-center.w-full
      .flex.relative
        .circle.absolute
        span.mr-4 Click
        span IT
      .flex.flex-col.text-center.my-16
        span.text-white Gain valuable<br>insights into your audience.
        span.container-publick__title-content-subtitle Create a landing page instantly with our AI-powered tool and<br>detailed analytics support.
      NuxtLink.btn-link.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg(to="/cabinet") Get Started
    .container-publick__solution.px-10
      .title-main Our solution:
      img(src="~/public/solution.png")
    .container-publick__integrations.px-10
      .title-main CRM Integrations
      .list-integrations.flex.justify-between.w-full.mx-auto
        img(src='~/public/hubspot.png' alt="img")
        img(src='~/public/zoho.png' alt="img")
        img(src='~/public/pipedrive.png' alt="img")
        img(src='~/public/zapier.png' alt="img")
        img(src='~/public/salesforce.png' alt="img")
    .container-publick__middle-block-wrapper.w-full
      .title-main.px-10 How It works
      .container-publick__middle-block
        .flex
          .middle-block__icon
          span Sign up and log in: Register and log in effortlessly to get started.
        .flex.items-center.mt-12
          .middle-block__icon
          span Create Your Company: Establish your company profile with a short description.
        .flex.items-center.mt-12
          .middle-block__icon
          span Instant AI-Generated landing pages: Click once and let AI craft a compelling, custom landing page<br>for your business effortlessly
        .flex.items-center.mt-12
          .middle-block__icon
          span Import your prospects and AI Generate you unique URLs for each lead: Input prospects, and unique URLs<br>are automatically generated for each.
        .flex.items-center.mt-12
          .middle-block__icon
          span Track Analytics: Stay informed with real-time analytics for effective campaign management.
    .container-publick__plan.flex.flex-col
      .title-main.px-10.w-full Choose Your Plan
      .flex.justify-around.w-full.px-10
        .plans.m-4.p-5(
          v-for="(plan, index) in planList"
          :key="index"
          :class="choosedPlan === plan.slug ? 'plans-active' : ''"
        )
          .title-section-price
            .flex {{ plan.title }}
            .flex.mt-4 {{ plan.price }}
            .flex.mt-2 {{ plan.save }}
            .flex.my-4 {{ plan.subtitle }}
          .main-section-price
            .price-btn__wrapper.border.w-full.flex.justify-center
              button.price-btn.mt-10.mb-6(@click="choosedPlan = plan.slug") Start free trial
            .features.mb-8 Features:
            .features-content.flex.flex-col.pl-4
              span {{ plan?.features?.one }}
              span {{ plan?.features?.two }}
              span {{ plan?.features?.three }}
              span {{ plan?.features?.foure }}
              span {{ plan?.features?.five }}
              span {{ plan?.features?.six }}
    .container-publick__reason
      .title-main.px-10 Why Choose Us?
      .container-publick__reason-content.text-center.flex.flex-col
        span Empowering Agencies with AI-Driven Innovation
        span ClickIT for a seamless integration of cutting-edge AI, deep engagement insights, and innovative marketing solutions. We're not just a platform; we're your partner in redefining digital marketing success.
    .container-publick__feedback
      .title-main.w-full What our client say bout us
      .flex.justify-between.w-full.px-10
        .feedbacks__one
        .feedbacks__two.flex.flex-col.items-center.justify-between.w-full.mx-4
          .relative
            .circle__two.absolute
          div
        .feedbacks__three
    .footer
</template>

<script setup>
const choosedPlan = ref('')
const planList = [
  {
    slug: 'starter',
    title: 'Starter',
    price: '$59/month',
    save: 'Save $212/ year',
    subtitle: 'Conversions |  500',
    features: {
      one: '✓ 3 Custom domain',
      two: '✓ 30 AI landing page templates',
      three: '✓ Free landing page generator',
      foure: '✓ Integration',
      five: '',
      six: '✓ Prospect level personalization',
    }
  },
  {
    slug: 'busines',
    title: 'Business',
    price: '$117/month',
    save: 'Save $421/ year',
    subtitle: 'Conversions |  1000',
    features: {
      one: '✓ 5 Custom domain',
      two: '✓ 50 AI landing page templates',
      three: '✓ Free landing page generator',
      foure: '✓ Integration',
      five: '✓ API',
      six: '✓ Prospect level personalization',
    }
  },
  {
    slug: 'custom',
    title: 'Custom plan',
    price: 'Conntact sales team',
    save: '',
    subtitle: 'Conversions |  (based on specific needs)',
    features: {
      one: '✓ 10 and more',
      two: '✓ Unlimited',
      three: '✓ Free landing page generator',
      foure: '✓ Integration',
      five: '✓ API',
      six: '✓ Prospect level personalization',
    }
  }
]
const headerDataLinks = ref(['About', 'Integration', 'Pricing', 'Reviews', 'Contact'])
</script>

<style>
.container-publick__reason-content {
  color: #FFF;
  font-family: Roboto;
  font-size: 24px;
  font-style: normal;
  font-weight: 400;
  line-height: 128.906%;
  margin: 0 auto;
  width: 100%;
  max-width: 900px;
}
.container-publick__reason-content > span:nth-child(1) {
  font-size: 36px;
}
.plans-active .title-section-price > div:nth-child(1) {
  color: #415EF7;
}
.plans-active .price-btn {
  background: #415EF7;
}
.features {
  color: #9C9C9C;
  font-size: 24px;
}
.features-content {
  color: white;
}
.title-section-price {
  height: 163px;
  color: white;
  font-family: Roboto;
  font-size: 32px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
  border-bottom: 1px solid #415EF7;
}
.title-section-price > div:nth-child(1) {
  color: #8D8D8D;
  font-weight: 700;
}
.title-section-price > div:nth-child(3) {
  color: #415EF7;
  font-size: 14px;
  font-weight: 700;
}
.title-section-price > div:nth-child(4) {
  font-size: 14px;
}
.price-btn {
  color: white;
  width: 200px;
  height: 40px;
  flex-shrink: 0;
  border-radius: 10px;
  border: 1px solid #1F2D78;
  background: rgba(68, 98, 255, 0.00);
}
.price-btn:hover {
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.title-main {
  color: #FFF;
  font-family: Tahoma;
  font-size: 36px;
  font-style: normal;
  font-weight: 700;
  line-height: normal;
  margin-top: 100px;
  margin-bottom: 50px;
}
.container-publick__solution img {
  width: 100%;
  max-width: 916px;
  margin: 0 auto;
}
.footer {
  border-radius: 10px;
  margin-top: 112px;
  width: 100%;
  height: 196px;
  flex-shrink: 0;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.feedbacks__two > div {
  max-width: 454px;
  width: 100%;
  height: 192px;
  flex-shrink: 0;
  border-radius: 15px;
  background: rgba(44, 32, 66, 0.50);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.feedbacks__one,
.feedbacks__three {
  width: 100%;
  max-width: 250px;
  height: 410px;
  flex-shrink: 0;
  border-radius: 15px;
  background: rgba(44, 32, 66, 0.50);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.plans {
  width: 300px;
  min-height: 550px;
  border-radius: 15px;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.container-publick__middle-block {
  padding: 70px;
  border-radius: 15px;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.middle-block__icon {
  width: 25px;
  height: 25px;
  margin-right: 60px;
  flex-shrink: 0;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.container-publick__middle-block span {
  color: #FFF;
  font-family: Roboto;
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
}

.list-integrations {
  margin-top: 100px;
  max-width: 90%;
}
.list-integrations img {
  max-width: 25%;
  height: 55px;
}
.circle__two {
  bottom: -50%;
  left: -25%;
  width: 140%;
  box-shadow: 2px -44px 200px 22px rgba(68,98,255,1);
}
.circle {
  bottom: -50%;
  left: -25%;
  width: 140%;
  box-shadow: 2px -44px 292px 62px rgba(68,98,255,1);
}
.container-publick__wrapper {
  background: #000;
  box-shadow: 0px 4px 25px 2px #000A40 inset;
}
.container-publick {
  max-width: 1220px;
}
.container-publick__header > div:nth-child(1) {
  min-width: fit-content;
}
.container-publick__header > div:nth-child(2) {
  width: 100%;
  max-width: 630px;
  min-width: fit-content;
}
.btn-link {
  color: white;
  font-size: 18px;
  width: 200px;
  height: 40px;
  border-radius: 10px;
  background: #4462FF;
}
.container-publick__title-content {
  padding: 200px 0 0;
}
.container-publick__title-content-subtitle {
  margin-top: 70px;
  color: rgba(141, 141, 141, 0.85);
  text-align: center;
  font-family: Tahoma;
  font-size: 24px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
}
.container-publick__title-content > div:nth-child(1) span {
  font-size: 70px;
}
.container-publick__title-content > div:nth-child(2),
.container-publick__title-content > div:nth-child(1) span {
  color: #4462FF;
  text-align: center;
  text-shadow: 0px 6px 6px rgba(0, 0, 0, 0.25);
  font-family: Tahoma;
  font-size: 70px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
}
.container-publick__title-content > div:nth-child(1) span:nth-child(2) {
  color: white;
}
.container-publick__title-content > div:nth-child(2) {
  font-size: 40px;
}
/*
.bg-firebrick {
  background-color: firebrick;
  min-width: 132px;
}
.bg-darkcyan {
  background-color: darkcyan;
  min-width: 132px;
}
.bg-darkcyan:hover .default,
.bg-firebrick:hover .default {
  display: none;
}
.bg-darkcyan:hover .hovered,
.bg-firebrick:hover .hovered {
  display: block;
}
.hovered {
  display: none;
}
.default {
  display: block;
}
.mx-auto {
  margin: 0 auto; */
/* } */
</style>