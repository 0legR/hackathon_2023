<template lang="pug">
.container.pt-6
  .flex.w-fit.justify-center.items-center.mx-auto
    button.w-40.h-10.btn-tab(:class="{ 'btn-tab--active': activeTab === mainTab }" @click="activeTab = mainTab") Main Settings
    button.w-40.h-10.btn-tab(:class="{ 'btn-tab--active': activeTab === prospectsTab }" @click="activeTab = prospectsTab") Prospects
  .flex.flex-col.gap-y-4.items-center.w-full.min-h-screen.mt-6(v-if="activeTab === mainTab")
    input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(v-model="form.name" class="w-1/2" placeholder="Company name")
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
    button.p-3.text-sm.font-medium.text-light.uppercase.bg-primary.rounded.text-center(@click="generate") Generate
    .w-full.shadow-xl.rounded-md.overflow-hidden
      Preview(:campaign="form")
  .flex.flex-col.w-full.overflow-auto(v-if="activeTab === prospectsTab")
    .flex.justify-between.w-full.mt-10
      button.w-40.h-10.border.border-dark.h-10.rounded-md.text-base.text-dark(@click="importProspect") Import
      button.w-40.h-10.border.border-dark.h-10.rounded-md.text-base.text-dark(@click="exportProspect") Export
    .flex.mt-10
      input.border.border-dark.h-10.rounded-md.text-base.text-dark.p-2(class="w-1/2" placeholder="Search" disabled)
    .prospect-tab__list-table.flex.flex-col.w-full.space-y-4.mt-10
      .prospect-tab__list-header.flex.border.border-dark.h-10.rounded-md
        .flex.items-center.justify-center(
          v-for="item in prospectsListHeader"
          :key="item"
        ) {{ item }}
      .prospect-tab__list-content.flex.w-full.border.border-dark.h-20.rounded-md.text-base.text-dark.p-2(
        v-for="(prospect, index) in prospectsList"
      )
        .flex.items-center.justify-center
          .truncate {{ prospect.id || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.name || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.url || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.opens || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.time || 'N/A' }}
        .flex.items-center.justify-center
          .truncate {{ prospect.clicks || 'N/A' }}
</template>

<script setup>
import defaultPageBody from '@/public/ipsum'
definePageMeta({
  layout: 'cabinet',
})

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

const mainTab = 'main'
const prospectsTab = 'prospects'

const prospectsListHeader = ref(['Id', 'Name', 'Links', 'Opens', 'Times', 'Click'])
const prospectsList = ref([
	{
		id: "234234234",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "232434234",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "23322234234",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "23423465465434",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "2334",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "24",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "23465434",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	},
  {
		id: "434",
		key: "email or linkedin",
		name: "John",
		url: "http://domain/home?tid=234234",
		clicks: 100500,
		opens: 100500,
		time: 100500,
		last_activity: "datetime",
	}
])
const goals = [
  'Collect Emails',
  'Get Contacted',
  'Schedule Appointments',
  'Link to Site',
]

// ----------methods--------
async function getProspects(id) {
  try {
    const { data } = await useFetch(`campaigns/${id}/prospects`, {
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
async function generate() {
  try {
    const { data } = await useFetch(`campaigns/${form?.value?.id}/gen-page`, {
      method: 'post',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
      body: {
        name: form.value.name,
        description: form.value.description,
        goal: form.value.goal,
      },
    })
    form.page_body.value = data.value.page_body
  } catch (error) {
    console.log('generate Error')
  }
}

async function getCampaigns() {
  try {
    const { data } = await useFetch(`campaigns`, {
      method: 'get',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
    })
    campaigns.value = data.value
    getCampaign(campaigns?.value[0]?.id)
  } catch (error) {
    console.log('getCampaigns Error')
  }
}
async function getCampaign(id) {
  try {
    const { data } = await useFetch(`campaigns/${id}/settings`, {
      method: 'get',
      baseURL: 'https://clickit.anybiz.co/api/v1/',
    })
    form.value = data.value
    getProspects(id)
  } catch (error) {
    console.log('getCampaign Error')
  }
}

await getCampaigns()
// --------lifecycle hooks-----
// onMounted(async () => {
// await getProspects()
// })

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
.vs__dropdown-toggle {
  color: rgb(9, 29, 37);
  padding: 0.5rem;
  border: 1px solid rgb(9, 29, 37);
  border-radius: 0.375rem;
  width: 100%;
  height: 2.5rem;
}
.btn-tab {
  background-color: azure;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}
.btn-tab--active {
  background-color: aquamarine;
}
.overflow-hidden {
  overflow: hidden;
}
</style>
