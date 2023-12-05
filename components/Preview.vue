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
          :to="`https://${btn.url}`"
          target="_blank"
          rel="noopener"
          @click.native="btnClick(btn)"
        ) {{ btn.title }}
      .flex(class="w-2/3")
        .w-full.p-4.no-tailwind(v-html="campaign.page_body")
  footer.w-full.h-60.relative(ref="foot")
</template>
<script setup>
import { onMounted } from 'vue'

const foot = ref(null)
let observer = null
const {campaign} = defineProps(['campaign'])
const emit = defineEmits(['btnTrack', 'intersect', 'unintersect'])
function btnClick(btn) {
  emit('btnTrack', {
	  type: 'click',
	  url: btn.url,
  })
}

onMounted(() => {
  observer = new IntersectionObserver(
    ([entry]) => {
      emit(entry && entry.isIntersecting ? 'intersect' : 'unintersect')
    },
    {
      threshold: 0.75,
    }
  )
  observer.observe(foot.value)
})

onBeforeUnmount(() => {
  observer.disconnect()
})

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
  background: linear-gradient(150deg, #ccc, transparent);
}
.border-r {
  border-right: 1px solid #ccc; 
}
.no-tailwind * {
  all: revert;
}

</style>