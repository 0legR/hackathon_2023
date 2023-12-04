<template lang="pug">
.w-full.bg-white
  Preview(:campaign="prospect" @btnTrack="track" @intersect="trackView")
</template>
<script setup>
import { onMounted } from 'vue'

const route = useRoute()
const prospect = ref({})
let isObserved = false
let timeTimer = null
async function getProspect() {
  try {
    const { data } = await useFetch(`tracker/${route.query.tid}/page`, {
      method: 'get',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
    })
    prospect.value = data.value
  } catch (error) {
    console.log('getpProspect Error')
  }
}

if (route.query.tid) {
  await getProspect()
}

async function track(payload) {
  try {
    await useFetch(`tracker/${route.query.tid}`, {
      method: 'post',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
      body: payload,
    })
  } catch (error) {
    console.log('track Error')
  }
}
function trackView() {
  if (isObserved) return
  isObserved = true
  track({ type: 'view' })
}

onMounted(() => {
  setTimeTrack()
  document.addEventListener('visibilitychange', function (event) {
    document.hidden ? unsetTimeTrack() : setTimeTrack()
  })
})

function setTimeTrack() {
  timeTimer = setInterval(() => track({ type: 'time', period_sec: 5 }), 5000)
}

function unsetTimeTrack() {
  clearInterval(timeTimer)
}

onBeforeUnmount(() => {
  clearInterval(timeTimer)
})

//------------head---------
useHead({
  title: prospect.value.name || 'Landing',
  link: {
    rel: 'icon',
    href: '/logo.png',
  },
  meta: [
    {
      name: 'description',
      content: prospect.value.name,
    },
    {
      property: 'og:description',
      content: prospect.value.name,
    },
    {
      property: 'og:image',
      // content: data.value.Poster,
    },
    {
      name: 'twitter:card',
      content: 'summary_large_image',
    },
  ],
})
</script>