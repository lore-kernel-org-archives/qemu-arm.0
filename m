Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp146958njb;
        Wed, 4 Sep 2024 07:26:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1Lzi3xhooOH4JlIx0n/t5A30U4+S1ggnIFOMr2HtogCEvPPKwkyBx4cINUMzdPoetOSu8NViKesnSfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEeISzvKpvgeMe+IkiUtbk3proqkggEZ89o1fMf5GonpRJaBtFbiYwYJAvTHWtU8We26pVg
X-Received: by 2002:a05:6214:4498:b0:6c5:1666:e43 with SMTP id 6a1803df08f44-6c516660e61mr34687526d6.21.1725460008398;
        Wed, 04 Sep 2024 07:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725460008; cv=none;
        d=google.com; s=arc-20160816;
        b=f6rIInO6zfKdn0pIRrKrUITPZNl+goO3al386K2ylqbSxwYOeb89PKKn0GwTQC7ekQ
         sHKoPSQ5Yj5AzyGmtAXE0mFP4FbdI0/JEHmj+8KJGm/LLuBi7WLd9X8FFttGGCkqiGiX
         g6BTGSfQi81fmtRri5TlnqpTCm1GZY77mXRJYhsnNbX0RxXl7Py9fWwOpYKWXDnH0tup
         jQI1djstX+HQBKPvy5eBtdcdAjlkvuApHeF2zSM+dshk/CEIABUA37iEN7TYMW05CXUK
         ULEh/NueoFOIswCkmsnRwpT03c42NddGIObXuH2zIH+ccAh2XPDsIUpcRdo/0I/Nsu1b
         AQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zhH1JQtb6GZiEh4v6/v7jO4Y2uoHEDGgiCdEveTOXNI=;
        fh=mIR4h+MeeAVffyD/dkjXm4B+LSd2PEd07cWUa3fidLY=;
        b=QCj05dWn2Fj+0DGGFSPgtzYiDpbG/SeDWNSo6iYB3ivxw1pvQNKu3napjpE0SPJvdF
         8gktAbtHtF6SbYWMbk+pBO0IPeSHuCusG/mpDr9R+bYmaOI1+KGEKPo8HPxzNrVwe4PQ
         24Tuyx1cr8gSkMcdKzab21UgbiHBKMppVBuH2HgzByjL0TRIisAewfXQfahhGwLeL9Tz
         Ho7D+oDj9NzuVsjH+qvc5VqJRd78qqDiQUMXijMOGlBJ2/sNlDGGRr47x0VAphyo5ddJ
         bsDLVfCBUX3Aug2n8s0ydb6+6hF1vQQw6ET1PE1p1buow6Nbo102impZCu/NRUQBh3Ba
         ry5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mAyxzJy2;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.16])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340dc10absi154771906d6.562.2024.09.04.07.26.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 07:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) client-ip=192.198.163.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mAyxzJy2;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725460008; x=1756996008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J/O7jPR+9LMp4leGzo9biNFU02/Xi7Y+x90LmMp/+oQ=;
  b=mAyxzJy2/xCR70jABAJShveri1k4K0cl2L9jUYAmHbBu0r2nALjk+hs7
   JCdQutsQd+chHouGAT9g/AKqreLBy6nRxpbNLJRjQ1obA12e47vna/EC8
   6yhvEQdBqaALFcdScYQ0d47FWrRngtJTW0J7uKRGu/gafZhMUUi9W5Cjl
   JzmdyhIbIJPpvSsiihhcN0Dj+65yaDgJ+D8a15AwHR2RG0gZ6LqYF3wTN
   +Jb9o1gFQ3+i263CcKGoXECE4Q/lNB47CIWzI4q+X/J8qnlHazS47/52A
   dyyXOM7n2/fl95As1ELHVUPSiHNvlhcB9c7bp1N9ezNjW4ZbTAJZx902F
   A==;
X-CSE-ConnectionGUID: Nxsl0z8OS2yGrmKC3tS0BA==
X-CSE-MsgGUID: +Du8gjFKS5GIAy0ETldxTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="13369163"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="13369163"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:26:46 -0700
X-CSE-ConnectionGUID: RUJj5sxSTWmFraLN1vMKgw==
X-CSE-MsgGUID: g0AsuLfnSkSb7p1sEfRpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65626630"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 04 Sep 2024 07:26:37 -0700
Date: Wed, 4 Sep 2024 22:42:37 +0800
From: "zhao1.liu@intel.com" <zhao1.liu@intel.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: Gavin Shan <gshan@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"mst@redhat.com" <mst@redhat.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>,
	"david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"will@kernel.org" <will@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
	"miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>,
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
Message-ID: <Zthx3dQInrcgly6+@intel.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-2-salil.mehta@huawei.com>
 <11e627ef-d75e-4114-9b93-14d80ec0526b@redhat.com>
 <c889781d3eb048d19bae4ceff8646a4e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c889781d3eb048d19bae4ceff8646a4e@huawei.com>
X-TUID: qY0qGf8BLQTi

Hi Salil,

On Mon, Aug 19, 2024 at 11:53:52AM +0000, Salil Mehta wrote:
> Date: Mon, 19 Aug 2024 11:53:52 +0000
> From: Salil Mehta <salil.mehta@huawei.com>
> Subject: RE: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
>  {socket,cluster,core,thread}-id property

[snip]

> >  > NULL); @@ -2708,6 +2716,7 @@ static const CPUArchIdList
> >  *virt_possible_cpu_arch_ids(MachineState *ms)
> >  >   {
> >  >       int n;
> >  >       unsigned int max_cpus = ms->smp.max_cpus;
> >  > +    unsigned int smp_threads = ms->smp.threads;
> >  >       VirtMachineState *vms = VIRT_MACHINE(ms);
> >  >       MachineClass *mc = MACHINE_GET_CLASS(vms);
> >  >
> >  > @@ -2721,6 +2730,7 @@ static const CPUArchIdList
> >  *virt_possible_cpu_arch_ids(MachineState *ms)
> >  >       ms->possible_cpus->len = max_cpus;
> >  >       for (n = 0; n < ms->possible_cpus->len; n++) {
> >  >           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> >  > +        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
> >  >           ms->possible_cpus->cpus[n].arch_id =
> >  >               virt_cpu_mp_affinity(vms, n);
> >  >
> >  
> >  Why @vcpus_count is initialized to @smp_threads? it needs to be
> >  documented in the commit log.
> 
> 
> Because every thread internally amounts to a vCPU in QOM and which
> is in 1:1 relationship with KVM vCPU. AFAIK, QOM does not strictly follows
> any architecture. Once you start to get into details of threads there
> are many aspects of shared resources one will have to consider and
> these can vary across different implementations of architecture.

For SPAPR CPU, the granularity of >possible_cpus->cpus[] is "core", and
for x86, it's "thread" granularity.

And smp.threads means how many threads in one core, so for x86, the
vcpus_count of a "thread" is 1, and for spapr, the vcpus_count of a
"core" equals to smp.threads.

IIUC, your granularity is still "thread", so that this filed should be 1.

-Zhao

> It is a bigger problem than you think, which I've touched at very nascent
> stages while doing POC of vCPU hotplug but tried to avoid till now. 
> 
> 
> But I would like to hear other community members views on this.
> 
> Hi Igor/Peter,
> 
> What is your take on this?
> 
> Thanks
> Salil.
