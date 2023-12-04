<template lang="pug">
.w-full
  Preview(:campaign="prospect")
</template>
<script setup>
const route = useRoute()
const prospect = ref({})
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

//------------head---------
useHead({
  title: 'Landing',
  meta: [
    {
      name: 'description',
      // content: prospect.value.Plot,
    },
    {
      property: 'og:description',
      // content: data.value.Plot,
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