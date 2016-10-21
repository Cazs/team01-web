﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IcebreakServices
{
    public class Reward
    {
        private long _id=0;
        private string _name;
        private string _description;
        private string _owner;
        private string _code;//code generated by phone to claim reward
        private int _value=0;//cost to claim reward
        private long _event_id=0;
        private long _date=0;//date claimed

        public long Id
        {
            get
            {
                return _id;
            }

            set
            {
                _id = value;
            }
        }

        public string Name
        {
            get
            {
                return _name;
            }

            set
            {
                _name = value;
            }
        }

        public string Description
        {
            get
            {
                return _description;
            }

            set
            {
                _description = value;
            }
        }

        public string Owner
        {
            get
            {
                return _owner;
            }

            set
            {
                _owner = value;
            }
        }

        public int Value
        {
            get
            {
                return _value;
            }

            set
            {
                _value = value;
            }
        }
        public long Event_ID
        {
            get
            {
                return _event_id;
            }

            set
            {
                _event_id = value;
            }
        }

        public long Date
        {
            get
            {
                return _date;
            }

            set
            {
                _date = value;
            }
        }

        public string Code
        {
            get
            {
                return _code;
            }

            set
            {
                _code = value;
            }
        }
    }
}