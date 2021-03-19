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
    <el-table-column
      
      label="Operations"
      width="120">
      <template slot-scope="scope">
        <el-button type="text" size="small" @click="edit(scope)">Edit</el-button>
        <el-button class="w3-red w3-margin-left" @click="del(scope)" type="text" size="small">Delete</el-button>
        
      </template>
    </el-table-column>
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
<!-- -------------------- -->
<el-drawer
  title="Редактирование товара"
  :visible.sync="drawer2"
  size="70%">
  <div v-for="(t,index) of tableData"  :key="index">
     <div v-if="t.id===edit_id">
        <el-input focus class="w3-margin" placeholder="штрихкод" @change="upd('cod',t.cod)" v-model="t.cod"></el-input>
        <el-input class="w3-margin" type="textarea" placeholder="наименование" @change="upd('name',t.name)" v-model="t.name"></el-input>
        <el-input class="w3-margin" placeholder="цена" @change="upd('price',t.price)" v-model="t.price"></el-input>
        <el-input class="w3-margin" placeholder="количество" @change="upd('count',t.count)" v-model="t.count"></el-input>
   <el-button type="success" @click="upd(t)">Закрыть</el-button>
     </div>

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
        drawer2:false,
        cod:'451245',
        name:'Тест',
        price:'150',
        count:'25',
        edit_id:''

      }
    },
    methods: {
      upd(f,v){
          
          axios.post('http://95.167.178.158/other/rest_hp.php','upd_id='+this.edit_id+'&field='+f+'&value='+v).then((response) => {
            this.tableData = response.data;
            console.log(response)
          }).catch((error) => { console.log(error); });
      },
      del(s){
            axios.post('http://95.167.178.158/other/rest_hp.php','del_id='+s.row.id).then((response) => {
            this.tableData = response.data;
            console.log(response)
          }).catch((error) => { console.log(error); });
      },
      edit(s){
        console.log(s.row.id)
        this.edit_id=s.row.id
        this.drawer2=true
      },
      gettovar(){
        //
         axios.post('http://95.167.178.158/other/rest_hp.php','getTovar=').then((response) => {
            this.tableData = response.data;
            // console.log(response)
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