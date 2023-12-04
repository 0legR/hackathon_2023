<template>
  <div class="cabinet-container relative">
    <div v-if="toggleOpen" class="blur-block z-50" @click.stop="toggleOpen = false"></div>
    <div class="cabinet-wrapper relative p-4">
      <div class="cabinet flex">
        <SideNav
          v-if="toggleOpen"
          :tabs="tabs"
          :currentRoute="currentRoute"
          @toggleOpen="toggleOpen = $event"
        />
        <div v-else class="absolute top-10 left-8">
          <img @click="toggleOpen = true" src="/open-menu.png" class="h-6 cursor-pointer" />
        </div>
        <div v-if="!toggleOpen" class="absolute top-4 right-14">
          <NuxtLink to="/cabinet">
            <img src="/logo.png" class="h-16" />
          </NuxtLink>
        </div>
        <div
          class="main-block w-full"
          :class="toggleOpen ? '' : 'show-sidebar'"
        >
          <slot />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      toggleOpen: false,
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
.cabinet-container {
  background: #000;
}
.cabinet-wrapper {
  margin: 0 auto;
  max-width: 1220px;
  overflow: unset;
  height: 100vh;
}
.cabinet-container:has(.left-sidenav) .blur-block {
  width: 100%;
  min-height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  background: rgba(115, 112, 119, 0.8);
}
.cabinet {
  height: 100%;
  border-radius: 15px;
  background: rgb(44, 32, 66, 0.60);
  box-shadow: 0px 1px 8px 2px #415EF7;
}
.cabinet:has(.create-section) {
  background: #000;
  box-shadow: none;
}
::-webkit-scrollbar { 
    display: none;
}
.show-sidebar .campaign-list__wrapper {
  margin-left: 80px;
  margin-top: 10px;
}
</style>
