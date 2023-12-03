<template>
  <div class="left-sidenav__wrapper z-50 m-4 absolute z-30 flex-none w-64 md:relative">
    <div
      class="left-sidenav w-full h-full p-4 bg-white rounded-md shadow-lg border-light"
    >
      <div class="logo-wrapper flex justify-between mb-6">
        <div></div>
        <div class="flex items-center">
          <img src="/logo.png" class="h-16" />
        </div>
        <img
          src="/close.png"
          class="h-6 cursor-pointer"
          @click="$emit('toggleOpen', false)"
        />
      </div>
      <div
        v-for="tab in tabs"
        :key="tab.path"
        :class="`${
          currentRoute === tab.path ? 'text-secondary font-bold' : ''
        } py-1 side-nav-item flex flex-col items-center justify-center text-white`"
      >
        <NuxtLink :to="`${tab.path}`"> {{ tab.title }} </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['tabs', 'currentRoute'],
};
</script>

<style>
.left-sidenav__wrapper {
  height: calc(100% - 32px);
}
.left-sidenav {
  border-radius: 10px;
  background: rgba(22, 31, 80, 0.50);
}
.logo-wrapper {
  border-bottom: 1px solid white;
}
.side-nav-item {
  border-radius: 10px;
  background: #2C2042;
}
.side-nav-item:nth-child(3) {
  margin: 20px 0;
}
.side-nav-item:nth-child(4) {
  margin-top: 140px;
}
</style>
