<template lang="pug">
.w-full.bg-white
  Preview(:campaign="prospect" @btnTrack="track" @intersect="trackView")
  .ask-me-response.fixed.shadow-xl.text-base.text-dark.p-2.bg-light.rounded-lg(v-if="response")
    p {{ response }}
    button.collapse-resp.absolute(@click="response = ''") &times;
  .ask-me.fixed.flex.items-center.h-10.shadow-xl.rounded-lg.bg-light.overflow-hidden(v-else)
    input.text-base.text-dark.h-full.pl-2(v-model="message" placeholder="Ask me")
    button.flex.items-center.justify-center.px-6(@click="sendMessage" :disabled="messagePending")
      .loader.h-5.w-5(v-if="messagePending")
      img(v-else src="/send.png")
</template>
<script setup>
import { onMounted } from 'vue'

const route = useRoute()
const prospect = ref({})
const message = ref('')
const response = ref('')
let messagePending = ref(false)
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

async function sendMessage() {
  messagePending.value = true
  try {
    const {data} = await useFetch(`tracker/${route.query.tid}/chat`, {
      method: 'post',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
      body: { message: message },
    })
    console.log('data', data)
    response.value = data.value.body
  } catch (error) {
    console.log('message Error')
  } finally {
    messagePending.value = false
  }
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
<style>
.ask-me-response,
.ask-me {
  bottom: 10px;
  left: 10px;
}
.ask-me input:focus {
  outline: none;
}
.ask-me-response {
  width: 300px;
}
.collapse-resp {
  top: -5px;
  right: 2px;
}
.loader {
  border: 3px solid #f3f3f3;
  border-top: 3px solid #3498db;
  border-radius: 50%;
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>