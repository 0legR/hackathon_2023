<template lang="pug">
.w-full.preview-bg
  .container.mx-auto
    .hero.w-full.h-60.flex.justify-center.items-center
      h1.text-light.text-6xl.font-bold {{ campaign.name }}
    .w-full.flex.min-h-screen
      .flex.flex-col.gap-y-4.border-r.p-4.my-2(class="w-1/3")
        NuxtLink.p-3.text-sm.font-medium.text-dark.uppercase.bg-light.text-center.shadow-xl.rounded-lg(
          v-for="(btn, index) of campaign.buttons"
          :class="{ 'hidden': !btn.title || !btn.url }"
          :key="`${btn.title}_${index}`"
          :to="btn.url"
        ) {{ btn.title }}
      .flex(class="w-2/3")
        .w-full.p-4(v-html="campaign.page_body")
  footer.w-full.h-60.relative
</template>
<script setup>
const {campaign} = defineProps(['campaign'])
</script>
<style>
.hero {
  background-image: url('@/hero-bg.jpeg');
}
footer::before {
  content: "";
  position: absolute;
  width: 100%;
  height: 15rem;
  background-image: url('@/hero-bg.jpeg');
  transform: rotate(180deg);
}
.preview-bg {
  background: linear-gradient(150deg, #d0f8e2, transparent);
}
.border-r {
  border-right: 1px solid #ccc; 
}
</style>