<template>
  <div id="app">
   
    <el-menu v-if="$route.path==='/baza'"
  default-active="2"
  class="el-menu-demo"
  mode="horizontal"
  @select="handleSelect"
  background-color="#545c64"
  text-color="#fff" router
  active-text-color="#ffd04b">
  <el-menu-item index="1" route="/">Продажа</el-menu-item>
  <el-menu-item index="2" route="/baza">База товаров</el-menu-item>
</el-menu>
 <el-menu v-if="$route.path==='/'"
  :default-active="activeIndex2"
  class="el-menu-demo"
  mode="horizontal"
  @select="handleSelect"
  background-color="#545c64"
  text-color="#fff" router
  active-text-color="#ffd04b">
  <el-menu-item index="1" route="/">Продажа</el-menu-item>
  <el-menu-item index="2" route="/baza">База товаров</el-menu-item>
</el-menu>
<router-view></router-view>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        activeIndex: '1',
        activeIndex2: '1'
      };
    },
    methods: {
      handleSelect(key, keyPath) {
        console.log(key, keyPath);
      }
    }
  }
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
