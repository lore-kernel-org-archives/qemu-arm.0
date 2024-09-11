Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp121407nji;
        Wed, 11 Sep 2024 04:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvcqbOaUKE8NKsV7lmLjLzL3se3+LK/1Xkn4X7ib+NIX13YBmIB1lTj4ZQ+0HOt1Qbq8fK66Wf7YF01A==@linaro.org
X-Google-Smtp-Source: AGHT+IHW42/sH2bD06zuOVRBnf+MlDN67clveo/AkNv/DtYRJXJO8Nwc4SO8IRzf6z5MZLdQThQY
X-Received: by 2002:a05:600c:54c6:b0:42c:b22e:fbfa with SMTP id 5b1f17b1804b1-42cb22effb5mr94434555e9.21.1726054514588;
        Wed, 11 Sep 2024 04:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726054514; cv=none;
        d=google.com; s=arc-20240605;
        b=LEfXwJPoPN0Twwp4rYtxL0VNnKHRhElJjxqADQYETGZmAQdou6ihCulak2MXYT5ZIp
         lnetPaw5PotJfGETYQi9coBAlIbMrVOacp4fA+EGW9V2dSJwKVr+PqPuZPTMAtXPllNE
         xwASOkDItYgkFBtF2H83iB+b2ULw09+X1pVoff1k6z7rlupJFbdre60IM4YpmtUwGzPD
         Dl0rdWa2bjeo3jnQELpaLDT4yOYi2DkmMu6UFg07UffHL8hm7BGSHT6UVoJFPtnUEyFi
         ukcR0k/X/gghcwZQz3IbN7fW4ogxmw+V/D+67d/lUwz3Wfwyuec1Zq//2ZkTsQVE7+eW
         Pe3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=Lt5cLad+vy+8ZSxWxYV9vogzuDhGaE3jqH6m4qvuPhk=;
        fh=XBBJTrvtIfjFRm5H8+uLj2VA4L0zsaIUSwfJuuF1WHg=;
        b=BmLQbJbAGiX/TFfc+1Tl5FxzQ3OrXxbYynrXAs4726lDPJEwG4k9tbDL3Uc2Wk+V12
         bCUJH2DF0/5z3PGIhZ011ra6IZVmko5klCRqthzs5e2xgro/HT4x4gBOYG4KaceQOUJm
         jnDeK6BWvZYuflWZEoWjxWE6nHGhTVXaJ5vkuTmnggvzIUUJGxPFY4cpNKJkXBzWnOY8
         G9hX5IznvrNNDkYZCNBseu6XeCm9ozWYPop3IFu/aNlw/lXpBE0QHgMelAP1guvMHtsq
         QHeJ5PmlQVfQXfjUfRyRFLJW5UyQmqyEhS1tkVdeiza0kFB33cLmBvjWncyp08Nn4ey+
         gxhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-378956b9f12si3889085f8f.711.2024.09.11.04.35.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2024 04:35:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X3dgq6XQSz6L7Fb;
	Wed, 11 Sep 2024 19:31:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E5B6A1400C9;
	Wed, 11 Sep 2024 19:35:12 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Sep
 2024 13:35:11 +0200
Date: Wed, 11 Sep 2024 12:35:10 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: Zhao Liu <zhao1.liu@intel.com>, Gavin Shan <gshan@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>, "maz@kernel.org"
	<maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	"shahuang@redhat.com" <shahuang@redhat.com>, Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
Message-ID: <20240911123510.00004557@Huawei.com>
In-Reply-To: <cff9b8f407044deb8ed4b1aa5acea5f4@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<20240613233639.202896-2-salil.mehta@huawei.com>
	<11e627ef-d75e-4114-9b93-14d80ec0526b@redhat.com>
	<c889781d3eb048d19bae4ceff8646a4e@huawei.com>
	<Zthx3dQInrcgly6+@intel.com>
	<9376341923d94a2bbd8d24f4f6844585@huawei.com>
	<Zt8UGd9YRANnBPVT@intel.com>
	<cff9b8f407044deb8ed4b1aa5acea5f4@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: ocD/N2F9bx3V

On Tue, 10 Sep 2024 12:01:05 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> HI Zhao,

A few trivial comments inline.

> 
> >  From: Zhao Liu <zhao1.liu@intel.com>
> >  Sent: Monday, September 9, 2024 4:28 PM
> >  To: Salil Mehta <salil.mehta@huawei.com>
> >  
> >  On Wed, Sep 04, 2024 at 05:37:21PM +0000, Salil Mehta wrote:  
> >  > Date: Wed, 4 Sep 2024 17:37:21 +0000
> >  > From: Salil Mehta <salil.mehta@huawei.com>
> >  > Subject: RE: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
> >  > {socket,cluster,core,thread}-id property
> >  >
> >  > Hi Zhao,
> >  >  
> >  > >  From: zhao1.liu@intel.com <zhao1.liu@intel.com>
> >  > >  Sent: Wednesday, September 4, 2024 3:43 PM
> >  > >  To: Salil Mehta <salil.mehta@huawei.com>
> >  > >
> >  > >  Hi Salil,
> >  > >
> >  > >  On Mon, Aug 19, 2024 at 11:53:52AM +0000, Salil Mehta wrote:  
> >  > >  > Date: Mon, 19 Aug 2024 11:53:52 +0000  > From: Salil Mehta  
> >  > > <salil.mehta@huawei.com>  > Subject: RE: [PATCH RFC V3 01/29]
> >  > > arm/virt,target/arm: Add new ARMCPU  >
> >  > > {socket,cluster,core,thread}-id property
> >  > >
> >  > >  [snip]
> >  > >  
> >  > >  > >  > NULL); @@ -2708,6 +2716,7 @@ static const CPUArchIdList  > >  
> >  > > *virt_possible_cpu_arch_ids(MachineState *ms)  
> >  > >  > >  >   {
> >  > >  > >  >       int n;
> >  > >  > >  >       unsigned int max_cpus = ms->smp.max_cpus;
> >  > >  > >  > +    unsigned int smp_threads = ms->smp.threads;
> >  > >  > >  >       VirtMachineState *vms = VIRT_MACHINE(ms);
> >  > >  > >  >       MachineClass *mc = MACHINE_GET_CLASS(vms);
> >  > >  > >  >
> >  > >  > >  > @@ -2721,6 +2730,7 @@ static const CPUArchIdList  > >  
> >  > > *virt_possible_cpu_arch_ids(MachineState *ms)  
> >  > >  > >  >       ms->possible_cpus->len = max_cpus;
> >  > >  > >  >       for (n = 0; n < ms->possible_cpus->len; n++) {
> >  > >  > >  >           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> >  > >  > >  > +        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
> >  > >  > >  >           ms->possible_cpus->cpus[n].arch_id =
> >  > >  > >  >               virt_cpu_mp_affinity(vms, n);
> >  > >  > >  >  
> >  > >  > >
> >  > >  > >  Why @vcpus_count is initialized to @smp_threads? it needs to  
> >  > > be  > > documented in the commit log.  
> >  > >  >
> >  > >  >
> >  > >  > Because every thread internally amounts to a vCPU in QOM and  
> >  > > which is  > in 1:1 relationship with KVM vCPU. AFAIK, QOM does not
> >  > > strictly  > follows any architecture. Once you start to get into
> >  > > details of  > threads there are many aspects of shared resources one
> >  > > will have to  > consider and these can vary across different
> >  > > implementations of  architecture.
> >  > >
> >  > >  For SPAPR CPU, the granularity of >possible_cpus->cpus[] is "core",
> >  > > and for  x86, it's "thread" granularity.  
> >  >
> >  >
> >  > We have threads per-core at microarchitecture level in ARM as well.
> >  > But each thread appears like a vCPU to OS and AFAICS there are no
> >  > special attributes attached to it. SMT can be enabled/disabled at
> >  > firmware and should get reflected in the configuration accordingly
> >  > i.e. value of *threads-per-core* changes between 1 and 'N'.  This
> >  > means 'vcpus_count' has to reflect the correct configuration. But I
> >  > think threads lack proper representation in Qemu QOM.  
> >  
> >  In topology related part, SMT (of x86) usually represents the logical
> >  processor level. And thread has the same meaning.  
> 
> 
> Agreed. It is same in ARM as well. The difference could be in how hardware
> threads are implemented at microarchitecture level.  Nevertheless, we do
> have such virtual configurations, and the meaning of *threads* as-in QOM
> topology (socket,cluster,core,thread) is virtualized similar to the hardware
> threads in host. And One should be able to configure threads support in the
> virtual environment,  regardless whether or not underlying hardware
> supports threads. That's my take.
> 
> Other aspect is how we then expose these threads to the guest. The guest
> kernel (just like host kernel) should gather topology information using
> ACPI PPTT Table (This is ARM specific?). 

Not ARM specific, but not used by x86 in practice (I believe some risc-v boards
use it).
https://lore.kernel.org/linux-riscv/20240617131425.7526-3-cuiyunhui@bytedance.com/

> Later is populated by the Qemu
> (just like by firmware for the host kernel) by making use of the virtual
> topology. ARM guest kernel, in absence of PPTT support can detect
> presence of hardware threads by reading MT Bit within the MPIDR_EL1
> register.

Sadly no it can't.  Lots of CPUs cores that are single thread set that
bit anyway (so it's garbage and PPTT / DT is the only source of truth)
https://lore.kernel.org/all/CAFfO_h7vUEhqV15epf+_zVrbDhc3JrejkkOVsHzHgCXNk+nDdg@mail.gmail.com/T/

Jonathan
