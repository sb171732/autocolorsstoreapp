<template>
  <div class="home">
     Страница продаж
    <el-row>
  <el-col :span="12">

 <div class="w3-padding">
     <el-input type="input" v-model="shop" placeholder="кликни и пикни"></el-input>
   </div>
   <el-table
    :data="tableData2"
    style="width: 100%">
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
        <el-button type="text" size="small" @click="buy(scope)"><i class="el-icon-shopping-cart-2 w3-large"></i></el-button>
        <el-button class="w3-margin-left" @click="del(scope)" type="text" size="small"><i class="el-icon-delete w3-text-red w3-large"></i></el-button>
        
      </template>
    </el-table-column>
  </el-table>

  </el-col>
  <el-col :span="12" class="w3-border-left" style="min-height:500px">
     Корзина   Сумма: {{ summ }}
 <el-table
    :data="tableData3"
    style="width: 100%">
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
      label="Кол-во"
      prop="col">
    </el-table-column>
     <el-table-column
      label="Сумма"
      prop="sum">
    </el-table-column>
    <el-table-column
      
      label="Operations"
      width="120">
      <template slot-scope="scope">
        <el-button type="text" size="small" @click="plus(scope)"><i class="el-icon-circle-plus-outline w3-large"></i></el-button>
        <el-button class="w3-margin-left" @click="del(scope)" type="text" size="small"><i class="el-icon-remove-outline w3-text-red w3-large"></i></el-button>
        
      </template>
    </el-table-column>
  </el-table>
        <el-button class="w3-margin" type="success" @click="endshop">Продать</el-button>  
  </el-col>
</el-row>






   
   
  


  </div>
</template>

<script>
// @ is an alias to /src
import axios from 'axios'
export default {
  name: 'Home',
  data(){
    return{
      shop:'',
      tableData:[],
      tableData3:[], // корзина
      summ:''
    }
  },
  
  computed:{
    tableData2:function() {
        return this.tableData.filter(n=>{ return n.cod===this.shop })   
    }
  },
  methods:{
    endshop(){

        for (let t of this.tableData3){
          axios.post('http://95.167.178.158/other/rest_hp.php','shopTovar_id='+t.id+'&count='+t.count).then((response) => {
            this.tableData = response.data; this.tableData3=[];
          }).catch((error) => { console.log(error); });
        }
        
    },
    buy(s){
       let exst_s=0
       for (let t of this.tableData3){ if (t ===s) { exst_s=t.id }  }
       if (exst_s!=0){ 
          for (let t of this.tableData3){ if (t.id ===exst_s) { t.col=t.col+1 }  }
       } else {

           this.tableData3.push({ id:s.row.id,name:s.row.name,price:s.row.price,count:s.row.count-1,cod:s.row.cod,col:1,sum:s.row.price})   
       }  

      this.sumupd();
      


    },
    plus(s){
       for (let t of this.tableData3){ if ((t.id ===s.row.id) && (t.count!=0)) { t.col=t.col+1;t.sum=parseInt(t.sum)+parseInt(t.price);t.count=t.count-1; }  }
       this.sumupd();
    },
    del(s){
       for (let t of this.tableData3){ if ((t.id ===s.row.id) && (t.col!=0)) { t.col=t.col-1;t.sum=parseInt(t.sum)-parseInt(t.price); t.count=t.count+1; }  }
        this.sumupd();
    },
    sumupd(){
       let sum2=0
       for (let t of this.tableData3){ 
         sum2=sum2+parseInt(t.sum)
       }
       this.summ=sum2
    },
     gettovar(){
         axios.post('http://95.167.178.158/other/rest_hp.php','getTovar=').then((response) => {
            this.tableData = response.data;
          }).catch((error) => { console.log(error); });
      },
  },
  created(){
    this.gettovar();
  },
}
</script>
