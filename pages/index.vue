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
        NuxtLink.btn-link.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg(to="/cabinet") Get Started
    .container-publick__title-content.flex.flex-col.items-center.w-full
      .flex.relative
        .circle.absolute
        span.mr-4 Click
        span IT
      div.text-center.my-14
        span.text-white Gain valuable<br>insights into your audience.
      NuxtLink.btn-link.flex.items-center.justify-center.w-full.py-2.text-sm.font-normal.text-lg(to="/cabinet") Sign up
    .container-publick__integrations.px-10
      div CRM Integrations
      .list-integrations.flex.justify-between.w-full.mx-auto
        img(src='~/public/hubspot.png' alt="img")
        img(src='~/public/zoho.png' alt="img")
        img(src='~/public/pipedrive.png' alt="img")
        img(src='~/public/salesforce.png' alt="img")
    .container-publick__middle-block.w-full
    .container-publick__plan.flex.flex-col
      .title.w-full Choose Your Plan
      .flex.justify-between.w-full
        .plans.m-4(
          v-for="(plan, index) in 3"
          :key="index"
        )
    .container-publick__feedback
      .title.w-full What our client say bout us
      .flex.justify-between.w-full.px-10
        .feedbacks__one
        .feedbacks__two.flex.flex-col.items-center.justify-between.w-full.mx-4
          .relative
            .circle__two.absolute
          div
        .feedbacks__three
    .footer
//- NuxtLink(to="cabinet")
//-   img(src="landing.png")
//- .container.flex.items-center.justify-center.gap-x-4.h-screen.mx-auto
  //- NuxtLink.p-3.text-sm.font-medium.text-light.uppercase.bg-firebrick.rounded.text-center(to="https://www.anybiz.io")
    span.default Stay in Matrix
    span.hovered Leave
  //- NuxtLink.p-3.text-sm.font-medium.text-light.uppercase.bg-darkcyan.rounded.text-center(to="cabinet")
    span.default Go to Reality
    span.hovered Ready
</template>

<script setup>
const headerDataLinks = ref(['About', 'Integration', 'Pricing', 'Reviews', 'Contact'])
const integrationsList = ref(['hubspot', 'zoho', 'pipedrive', 'salesforce'])
</script>

<style>
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
.title {
  margin: 100px 0 36px;
  color: #FFF;
  text-align: center;
  font-family: Roboto;
  font-size: 36px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
}
.plans {
  width: 300px;
  height: 550px;
  border-radius: 15px;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.container-publick__middle-block {
  height: 520px;
  margin-top: 100px;
  border-radius: 15px;
  background: rgba(44, 32, 66, 0.30);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.container-publick__integrations div:first-child {
  color: #FFF;
  font-family: Inter;
  font-size: 36px;
  font-style: normal;
  font-weight: 600;
  line-height: normal;
}
.list-integrations {
  margin-top: 61px;
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
  height: 800px;
  padding-top: 200px;
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