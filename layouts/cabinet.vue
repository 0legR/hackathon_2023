<template>
  <div class="cabinet-wrapper px-6 py-8">
    <div class="cabinet flex">
      <SideNav
        v-if="toggleOpen"
        :tabs="tabs"
        :currentRoute="currentRoute"
        @toggleOpen="toggleOpen = $event"
      />
      <div v-else class="absolute top-14 left-14">
        <img @click="toggleOpen = true" src="/open-menu.png" class="h-6 cursor-pointer" />
      </div>
      <div
        class="main-block w-full overflow-y-auto h-screen"
        :class="toggleOpen ? '' : 'show-sidebar'"
      >
        <slot />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      toggleOpen: true,
      tabs: [
        {
          title: 'Home',
          path: '/cabinet',
        },
        {
          title: 'Profile',
          path: '/cabinet/profile',
        },
        {
          title: 'Exit',
          path: '/',
        },
      ],
    };
  },
  computed: {
    currentRoute() {
      return this.$route.path;
    },
    currentTab() {
      return this.tabs.find((tab) => {
        return tab.path === this.currentRoute;
      });
    },
  },
};
</script>

<style>
.cabinet-wrapper {
  background: #000;
  overflow: hidden;
}
.cabinet {
  border-radius: 15px;
  background: rgb(44, 32, 66, 0.60);
}
.cabinet:has(.create-section) {
  background: #000;
}
::-webkit-scrollbar { 
    display: none;
}
.show-sidebar .campaign-list__wrapper {
  margin-left: 80px;
  margin-top: 10px;
}
</style>
