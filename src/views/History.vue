<template>
    <div id="his">
      <h3>История покупок</h3>
<el-button @click="allhis()">Вся история</el-button>
<el-input class="w3-margin" v-model="value5" placeholder="По коду" style="width:250px"></el-input>
<div class="w3-margin-top ">
    <span class="">Выберите дату</span>
    <br>
    <el-date-picker
      type="date"
      format="yyyy/MM/dd"
      value-format="dd-MM-yy"
      v-model="value4"
      placeholder="Выбери одну или более дат">
    </el-date-picker>
  </div>

            <el-table
            class="w3-padding"
            :data="table"
            stripe
            style="width: 100%">
            <el-table-column
            prop="datehis"
            label="Дата"
            width="180">
            </el-table-column>
            <el-table-column
            prop="name"
            label="Наименование"
            >
            </el-table-column>
            <el-table-column
            prop="cod"
            label="Код"
            width="180">
            </el-table-column>
            <el-table-column
            prop="count"
            label="Количество">
            </el-table-column>
        </el-table>
    </div>
</template>
<script>
import axios from 'axios'

export default {
    name:'his',
    data() {
        return{
            table:[],
            products:[],
            history:[],
            value4:'',
            value5:''
        }
    },
    created(){
    axios.post('http://95.167.178.158/other/rest_hp.php','getHis=').then((response) => {
            this.history=response.data
          }).catch((error) => { console.log(error); });  

     axios.post('http://95.167.178.158/other/rest_hp.php','getTovar=').then((response) => {
            this.products=response.data
          }).catch((error) => { console.log(error); });  


    },
    methods:{
        allhis(){
            var mas=[]
            for (let h of this.history){
                    for (let p of this.products){
                        if (h.cod === p.cod){
                            mas.push({cod:h.cod,name:p.name,count:h.count,datehis:h.datehis })
                        }
                    }
                
            }
            this.table=mas

        }   

    },
    watch:{
        value4(to){
            var mas=[]
            for (let h of this.history){
                if (h.datehis===to){
                    for (let p of this.products){
                        if (h.cod === p.cod){
                            mas.push({cod:h.cod,name:p.name,count:h.count,datehis:h.datehis })
                        }
                    }
                }
            }
            this.table=mas
        },
         value5(to){
            var mas=[]
            for (let h of this.history){
                if (h.cod===to){
                    for (let p of this.products){
                        if (h.cod === p.cod){
                            mas.push({cod:h.cod,name:p.name,count:h.count,datehis:h.datehis })
                        }
                    }
                }
            }
            this.table=mas
        }
    }

}
</script>
