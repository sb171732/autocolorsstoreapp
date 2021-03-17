<template>
  <div class="about">
    <h1>This is an baza page</h1>
<el-button type="primary" @click="open">Добавить товар</el-button>
 <el-table
    :data="tableData.filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase()))"
    style="width: 100%">
    <el-table-column
      label="Date"
      prop="date">
    </el-table-column>
    <el-table-column
      label="Штрихкод"
      prop="cod">
    </el-table-column>
    <el-table-column
      label="Name"
      prop="name">
    </el-table-column>
    <el-table-column
      label="Цена"
      prop="price">
    </el-table-column>
    <el-table-column
      label="Остаток"
      prop="count">
    </el-table-column>
    <!-- <el-table-column
      align="right">
      <template slot="header" slot-scope="">
        <el-input
          v-model="search"
          size="mini"
          placeholder="Type to search"/>
      </template>
    </el-table-column> -->
  </el-table>

<el-drawer
  title="Добавление товара"
  :visible.sync="drawer"
  size="70%">
  <div id="add-box">
   
<el-input focus class="w3-margin" placeholder="штрихкод" v-model="cod"></el-input>
<el-input class="w3-margin" type="textarea" placeholder="наименование" v-model="name"></el-input>
<el-input class="w3-margin" placeholder="цена" v-model="price"></el-input>
<el-input class="w3-margin" placeholder="количество" v-model="count"></el-input>



   <el-button type="success" @click="append">Добавить</el-button>
  </div>  
</el-drawer>
  </div>  
</template>

<script>

import axios from 'axios';

  export default {
    data() {
      return {
        tableData: [],
        search: '',
        drawer:false,
        cod:'451245',
        name:'Тест',
        price:'150',
        count:'25'

      }
    },
    methods: {
      gettovar(){
         axios.post('http://95.167.178.158/other/rest_hp.php','getTovar=').then((response) => {
      
      
      this.tableData = response.data;
      console.log(response)


}).catch((error) => { console.log(error); });
      },
      open(){
          this.drawer = true
      },
      
      append(){
        console.log(this.cod+','+this.name+','+this.price+','+this.count+',')
        
        axios.post('http://95.167.178.158/other/rest_hp.php','append='+'&cod='+this.cod+'&name='+this.name+'&price='+this.price+'&count='+this.count).then((response) => {
      let res = response.data.trim()
if (res==='error'){  this.$message({
          showClose: true,
          message: 'Данный штрихкод уже присуствует в базе',
          type: 'warning'
        }); }
if (res==='succes'){  this.$message({
          showClose: true,
          message: 'Товар добавлен в базу',
          type: 'success'
        }); 
        this.gettovar();
        }


}).catch((error) => { console.log(error); });




      }
    },
    created(){

      this.gettovar();

    }
  }
</script>
<style>
  #add-box{
    padding: 50px;

  }
</style>