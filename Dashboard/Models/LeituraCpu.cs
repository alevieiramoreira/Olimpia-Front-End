using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Dashboard.Models
{
    public class LeituraCpu
    {
        DateTime momento;
        double valor;

        public LeituraCpu(DateTime momento, double valor)
        {
            this.momento = momento;
            this.valor = valor;
        }

        public DateTime Momento { get => momento; set => momento = value; }
        public double Valor { get => valor; set => valor = value; }


    }
}