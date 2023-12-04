<template lang="pug">
.container.create-section.pt-16.min-w-full
  .btn-section__wrapper.mb-2
    .btn-section.w-full.flex.w-full.justify-center.items-center.mx-auto
      button.h-10.btn-tab(:class="{ 'btn-tab--active': activeTab === mainTab }" @click="activeTab = mainTab") Campaign
      button.h-10.btn-tab(:class="{ 'btn-tab--active': activeTab === prospectsTab }" @click="activeTab = prospectsTab") Prospects
  .container-form.pb-6(v-if="activeTab === mainTab")
    .container-form__content.flex.flex-col.gap-y-4.items-center.w-full.mt-6.px-4
      input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2.mt-20(v-model="form.name" class="w-1/2" placeholder="Company name")
      input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.domain" class="w-1/2" placeholder="Domain name")
      select.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.goal" class="w-1/2" placeholder="Select your goal")
        option.text-light(:disabled="true") Select your goal
        option(v-for="goal of goals" :key="goal") {{ goal }}
      textarea.border.border-dark.h-60.rounded-md.text-base.text-dark.p-2(v-model="form.description" class="w-4/5" placeholder="Deepest Insights, Alerts, & Automation Platform to Improve User Experience, real-time, 24×7")
      .flex.flex-col.gap-y-4(class="w-1/2")
        .flex.justify-center.items-center.gap-x-4.f-wull(v-if="form.buttons.length" v-for="(btn, index) of form.buttons" :key="`${btn}-${index}-b`")
          input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="btn.title" class="w-1/2" placeholder="Btn Label")
          input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="btn.url" class="w-1/2" placeholder="Btn Url")
        .flex.justify-center.items-center.gap-x-4.f-wull(v-else)
          input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.buttons[0].title" class="w-1/2" placeholder="Btn Label")
          input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.buttons[0].url" class="w-1/2" placeholder="Btn Url")
      button.p-3.text-sm.font-medium.text-light.bg-primary.rounded.flex.items-center.justify-center(@click="generate")
        .loader.h-5.w-5(v-if="genPending")
        span(v-else) Generate
      .w-full.shadow-xl.rounded-md.overflow-hidden.bg-white
        Preview(:campaign="form")
      button.p-3.text-sm.font-medium.text-light.bg-primary.rounded.flex.items-center.justify-center(@click="store")
        .loader.h-5.w-5(v-if="storePending")
        span(v-else) Save
  .container-prospects.flex.flex-col.w-full.p-7(v-if="activeTab === prospectsTab")
    .flex.justify-between.w-full.mt-10
      button.text-base.text-dark(@click="importProspect") Import
      button.text-base.text-dark(@click="exportProspect") Export
    //- .flex.mt-10
    //-   input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(class="w-1/2" placeholder="Search" disabled)
    .prospect-tab__list.flex.flex-col.w-full.mt-10
      .prospect-tab__list-header.flex.mb-4
        .flex.items-center.justify-center(
          v-for="item in prospectsListHeader"
          :key="item"
        ) {{ item }}
      .prospect-tab__list-table.space-y-4
        .prospect-tab__list-content.flex.w-full.border.border-dark.rounded-md.text-base.text-dark.p-2(
          v-for="(prospect, index) in prospectsList"
        )
          .flex.items-center.justify-center
            .truncate {{ prospect.id || 'N/A' }}
          .flex.items-center.justify-center
            .truncate {{ prospect.name || 'N/A' }}
          .flex.items-center.justify-center
            .truncate.mr-2 {{ prospect.url || 'N/A' }}
            .cursor-pointer.relative.w-7(
              @click="copyUrl(prospect.url)"
            )
              img(src="~/public/copy.png" alt="image")
              .copied-url.text-center.absolute(v-if="isCopied") Copied!
          .flex.items-center.justify-center
            .truncate {{ prospect.opens}}
          .flex.items-center.justify-center
            .truncate {{ prospect.time_sec }}
          .flex.items-center.justify-center
            .truncate {{ prospect.clicks}}
</template>

<script setup>
import defaultPageBody from '@/public/ipsum'
definePageMeta({
  layout: 'cabinet',
})

const route = useRoute()

const activeTab = ref('main')
const form = ref({
  name: '',
  domain: '',
  description: '',
  goal: 'Select your goal',
  page_body: defaultPageBody,
  buttons: [
		{
			title: '',
			url: '',
		},
    {
			title: '',
			url: '',
		},
	],
})

const campaigns = ref([])
const storePending = ref(false)
const genPending = ref(false)
const isCopied = ref(false)
const timeout = ref(null)

const mainTab = 'main'
const prospectsTab = 'prospects'

const prospectsListHeader = ref(['Id', 'Name', 'Links', 'Opens', 'Times', 'Click'])
const prospectsList = ref([])
const goals = [
  'Collect Emails',
  'Get Contacted',
  'Schedule Appointments',
  'Link to Site',
]

// ----------methods--------
async function copyUrl(value) {
  clearTimeout(timeout.value)
  await navigator.clipboard.writeText(value)
  isCopied.value = true
  timeout.value = setTimeout(() => {
    isCopied.value = false
  }, 1000)
}
async function getProspects() {
  try {
    const { data } = await useFetch(`campaigns/${route.query.id}/prospects`, {
      method: 'get',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
    })
    prospectsList.value = data.value
  } catch (error) {
    console.log('generate Error')
  }
}

function importProspect() {
  console.log('Import')
}

function exportProspect() {
  console.log('Export')
}

function store() {
  form.value.id ? update() : create()
}

async function create() {
  storePending.value = true
  try {
    const { data } = await useFetch(`campaigns`, {
      method: 'post',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
      body: form,
    })
    form.value.id = data.value.id
  } catch (error) {
    console.log('generate Error')
  } finally {
    storePending.value = false
  }
}

async function update() {
  storePending.value = true
  const payload = { ...form.value }
  delete payload.id
  try {
    const { data } = await useFetch(`campaigns/${form.value.id}/settings`, {
      method: 'put',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
      body: payload,
    })
  } catch (error) {
    console.log('generate Error')
  } finally {
    storePending.value = false
  }
}

async function generate() {
  genPending.value = true
  try {
    const { data } = await useFetch(`campaigns/gen-page`, {
      method: 'post',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
      body: {
        company_name: form.value.name,
        description: form.value.description,
        goal: form.value.goal,
      },
    })
    form.value.page_body = data.value.page_body
  } catch (error) {
    console.log('generate Error')
  } finally {
    genPending.value = false
  }
}

async function getCampaign() {
  try {
    const { data } = await useFetch(`campaigns/${route.query.id}/settings`, {
      method: 'get',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
    })
    form.value = data.value
  } catch (error) {
    console.log('getCampaign Error')
  }
}
if (route.query.id) {
  await getCampaign()
  await getProspects()
}

// ---------life hooks-----
onBeforeUnmount(() => {
  clearTimeout(timeout.value)
})
//------------head---------
useHead({
  title: 'Campaign',
  meta: [
    {
      name: 'description',
      // content: data.value.Plot,
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

<style scoped>
.copied-url {
  width: 100px;
  border: 1px solid rgb(86, 81, 95);
  background: #41207D;
  color: white;
  border-radius: 5px;
  top: -5px;
  right: -110px;
}
.prospect-tab__list {
  height: 73%;
}
.prospect-tab__list-table {
  overflow: auto;
}
.prospect-tab__list-content,
.prospect-tab__list-header {
  color: #CBCBCB;
  border-radius: 10px;
  background: rgba(217, 217, 217, 0.10);
}
.prospect-tab__list-header {
  min-height: 40px;
}
.prospect-tab__list-content {
  min-height: 60px;
}
.prospect-tab__list-header > div:nth-child(1),
.prospect-tab__list-header > div:nth-child(2),
.prospect-tab__list-header > div:nth-child(3) {
  width: 20%;
}
.prospect-tab__list-header > div:nth-child(4),
.prospect-tab__list-header > div:nth-child(5),
.prospect-tab__list-header > div:nth-child(6) {
  width: 13.3%;
}
.prospect-tab__list-content > div:nth-child(1),
.prospect-tab__list-content > div:nth-child(2),
.prospect-tab__list-content > div:nth-child(3) {
  width: 20%;
}
.prospect-tab__list-content > div:nth-child(4),
.prospect-tab__list-content > div:nth-child(5),
.prospect-tab__list-content > div:nth-child(6) {
  width: 13.3%;
}
.btn-section {
  max-width: 600px;
  border-radius: 10px;
  overflow: hidden;
}
.vs__dropdown-toggle {
  color: rgb(9, 29, 37);
  padding: 0.5rem;
  border: 1px solid rgb(9, 29, 37);
  border-radius: 0.375rem;
  width: 100%;
  height: 2.5rem;
}
.btn-tab {
  background-color: #161F50;
  max-width: 300px;
  width: 100%;
  color: white;
  font-size: 24px;
}
.btn-tab--active {
  background-color: #41207D;
}
.overflow-hidden {
  overflow: hidden;
}
.container-prospects,
.container-form {
  border-radius: 15px;
  height: calc(100vh - 160px);
  background: rgb(44, 32, 66, 0.60);
  box-shadow: 0px 1px 8px 2px #415EF7;
}

.container-form {
  overflow: auto;
}
.container-prospects button {
  color: white;
  max-width: 200px;
  width: 100%;
  height: 40px;
  flex-shrink: 0;
  border-radius: 10px;
  background: #4462FF;
}
.container-form__content {
  max-width: 680px;
  width: 100%;
  margin: 0 auto;
}

.container-form__content button {
  width: 200px;
  height: 40px;
  flex-shrink: 0;
  border-radius: 10px;
  background: #4462FF;
}

.container-form__content textarea,
.container-form__content select,
.container-form__content input {
  background: rgba(217, 217, 217, 0.10);
  color: #CBCBCB;
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
