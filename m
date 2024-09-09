Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp958023njb;
        Mon, 9 Sep 2024 08:12:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWgvFKzJYsP9QTaberECCWZpkzSx4FlZagGeXB1T4uBIpWBsVBb1pRrlgSfEmMFYv50fgpKTYQ/YGU8A==@linaro.org
X-Google-Smtp-Source: AGHT+IEcHcSJBRI7M7bhDpOkZ+bREPopJaxjR2E4nZJX8BXogLEEunXWjZvCf2MiEhV5nNJzE62o
X-Received: by 2002:a05:620a:2903:b0:7a9:bc1c:10b9 with SMTP id af79cd13be357-7a9bc1c113dmr272739085a.33.1725894755146;
        Mon, 09 Sep 2024 08:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725894755; cv=none;
        d=google.com; s=arc-20240605;
        b=kmWOB9jbTQoh32Kpw4PDEJQ9xcnEI6wzdWR1T/tUqAdUB0x6Px5qxa2yGgj80SJMSc
         sPiuPMQjfd/jNMRT1vhXuxIfR1YidVEp1SiJoOMDW1lRjoRuFH+9ixIGSIXDoJaocQUD
         BbhSAnz8rD5+cYLSnUHtSBFaH1to4YCkEvnNK05HaM+Yq8tIsjrgv/zjeaiERf6ysXrq
         zTr5b5/souevyLQLQjR+lxYyvQpwoh3RJ7d+/gqS3y8PPMjMg6gtkCvWJ+dMb3ceQwIY
         IKYAlAXyTBIP0jj2kjhqRBN9gdDn6EgnHqn8gYzhWK5WWNHB+bhMEMuVEMpNaYUiuj08
         k+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=xqME3WRGuhLpWHTehWG2v+JciYMJkgfei2jRU0uzBTM=;
        fh=g2Mhjm8eSEHhFyv59DK2PcPlcgmjr5ZamRn+1m/NgG0=;
        b=Qi9/7PeWRcf6wWLFHAfVGXEDd2FgYZbQ4z74D5Uiml/Ax9Au1nNn57AYMn+oaelOpM
         HEWH8S2dDL6ojUO/jr52Qd58VRrpWiDHAfYK7gL33yPCn+wg4+s6pvBncnYRNdMpUS5P
         8N58hDyIfqt+rGw023grLXRrgkDUM0qhmOtRRryIJ4qGCldNgx4jhTIHUVZz/8ukOGEu
         83P2XHgkVGoLWLShcAqEIwtHumOCZcQEN4tGyn6Q/B16JHesHcPVZLkbGjyoGP1jzV+a
         zh3KEYDei7fXgHQ1ipGvD/gEt3+SK3Y4LNqr7w+GDpYnLFZp3+NINTaZQbRYxE3MkG6f
         jklQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TYYOvrfJ;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c53432f267si56032706d6.58.2024.09.09.08.12.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 08:12:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TYYOvrfJ;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725894755; x=1757430755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OsmWfy9/jM7Y8SvKhoiJatJA7t9PpOrU8ixthkRiaSA=;
  b=TYYOvrfJgjqkOfG/2HBPzL1i0BhLJtZXAB6v1MhFuukfOGcsxf5bOphl
   VFIV4I89Ka6p9Hi8GY7zx3zwyqqr8fSnGvgN6LxUha9IABr67n0cZO7ul
   QmOfbAtT5vEgUYyVSSql8dMJEynAnBXub3dJo8DVhwxeF0tstp4/l7X3o
   XnYbA4dnNp/bmvnLCl9y8g17yh+v9dH0V2VZuVYnvW7IjH1kZZAFYDC+P
   Yvyrk6EAKP5LTJmEZIQdirnvfmVWH+cfRjnT8euO/P5oRih2fF50m4lN5
   OqDjD+iNpOntmQszUsUDzr0y9Bifg5eF/9Viqrp4Ze1SFUZHKCVMYnlnw
   g==;
X-CSE-ConnectionGUID: aSHFsdG7QTGNLEhBIoRZug==
X-CSE-MsgGUID: oyG12LtNQeKUHQjk7cKhWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="47118324"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="47118324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:12:33 -0700
X-CSE-ConnectionGUID: e4fSfRdoRLOxMd5nb7V/nw==
X-CSE-MsgGUID: JHBQ9hB6SkuuWTp2ZI+N7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66673173"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 09 Sep 2024 08:12:24 -0700
Date: Mon, 9 Sep 2024 23:28:25 +0800
From: Zhao Liu <zhao1.liu@intel.com>
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
	Linuxarm <linuxarm@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
Message-ID: <Zt8UGd9YRANnBPVT@intel.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-2-salil.mehta@huawei.com>
 <11e627ef-d75e-4114-9b93-14d80ec0526b@redhat.com>
 <c889781d3eb048d19bae4ceff8646a4e@huawei.com>
 <Zthx3dQInrcgly6+@intel.com>
 <9376341923d94a2bbd8d24f4f6844585@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9376341923d94a2bbd8d24f4f6844585@huawei.com>
X-TUID: n98z95Jzan0T

On Wed, Sep 04, 2024 at 05:37:21PM +0000, Salil Mehta wrote:
> Date: Wed, 4 Sep 2024 17:37:21 +0000
> From: Salil Mehta <salil.mehta@huawei.com>
> Subject: RE: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
>  {socket,cluster,core,thread}-id property
> 
> Hi Zhao,
> 
> >  From: zhao1.liu@intel.com <zhao1.liu@intel.com>
> >  Sent: Wednesday, September 4, 2024 3:43 PM
> >  To: Salil Mehta <salil.mehta@huawei.com>
> >  
> >  Hi Salil,
> >  
> >  On Mon, Aug 19, 2024 at 11:53:52AM +0000, Salil Mehta wrote:
> >  > Date: Mon, 19 Aug 2024 11:53:52 +0000
> >  > From: Salil Mehta <salil.mehta@huawei.com>
> >  > Subject: RE: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
> >  > {socket,cluster,core,thread}-id property
> >  
> >  [snip]
> >  
> >  > >  > NULL); @@ -2708,6 +2716,7 @@ static const CPUArchIdList
> >  > > *virt_possible_cpu_arch_ids(MachineState *ms)
> >  > >  >   {
> >  > >  >       int n;
> >  > >  >       unsigned int max_cpus = ms->smp.max_cpus;
> >  > >  > +    unsigned int smp_threads = ms->smp.threads;
> >  > >  >       VirtMachineState *vms = VIRT_MACHINE(ms);
> >  > >  >       MachineClass *mc = MACHINE_GET_CLASS(vms);
> >  > >  >
> >  > >  > @@ -2721,6 +2730,7 @@ static const CPUArchIdList
> >  > > *virt_possible_cpu_arch_ids(MachineState *ms)
> >  > >  >       ms->possible_cpus->len = max_cpus;
> >  > >  >       for (n = 0; n < ms->possible_cpus->len; n++) {
> >  > >  >           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> >  > >  > +        ms->possible_cpus->cpus[n].vcpus_count = smp_threads;
> >  > >  >           ms->possible_cpus->cpus[n].arch_id =
> >  > >  >               virt_cpu_mp_affinity(vms, n);
> >  > >  >
> >  > >
> >  > >  Why @vcpus_count is initialized to @smp_threads? it needs to be
> >  > > documented in the commit log.
> >  >
> >  >
> >  > Because every thread internally amounts to a vCPU in QOM and which is
> >  > in 1:1 relationship with KVM vCPU. AFAIK, QOM does not strictly
> >  > follows any architecture. Once you start to get into details of
> >  > threads there are many aspects of shared resources one will have to
> >  > consider and these can vary across different implementations of
> >  architecture.
> >  
> >  For SPAPR CPU, the granularity of >possible_cpus->cpus[] is "core", and for
> >  x86, it's "thread" granularity.
> 
> 
> We have threads per-core at microarchitecture level in ARM as well. But each
> thread appears like a vCPU to OS and AFAICS there are no special attributes
> attached to it. SMT can be enabled/disabled at firmware and should get
> reflected in the configuration accordingly i.e. value of *threads-per-core* 
> changes between 1 and 'N'.  This means 'vcpus_count' has to reflect the
> correct configuration. But I think threads lack proper representation
> in Qemu QOM.

In topology related part, SMT (of x86) usually represents the logical
processor level. And thread has the same meaning. To change these
meanings is also possible, but I think it should be based on the actual
use case. we can consider the complexity of the implementation when
there is a need.

> In Qemu, each vCPU reflects an execution context (which gets uniquely mapped
> to KVM vCPU). AFAICS, we only have *CPUState* (Struct ArchCPU) as a placeholder
> for this execution context and there is no *ThreadState* (derived out of
> Struct CPUState). Hence, we've  to map all the threads as QOM vCPUs. This means
> the array of present or possible CPUs represented by 'struct CPUArchIdList' contains
> all execution contexts which actually might be vCPU or a thread. Hence, usage of
> *vcpus_count* seems quite superficial to me frankly.
>
> Also, AFAICS, KVM does not have the concept of the threads and only has
> KVM vCPUs, but you are still allowed to specify the topology with sockets, dies,
> clusters, cores, threads in most architectures.  
 
There are some uses for topology, such as it affects scheduling behavior,
and it affects feature emulation, etc.
  
> >  And smp.threads means how many threads in one core, so for x86, the
> >  vcpus_count of a "thread" is 1, and for spapr, the vcpus_count of a "core"
> >  equals to smp.threads.
> 
> 
> Sure, but does the KVM specifies this? 

At least as you said, KVM (for x86) doesn't consider higher-level topologies
at the moment, but that's not to say that it won't in the future, as certain
registers do have topology dependencies.

> and how does these threads map to the QOM vCPU objects or execution context?

Each CPU object will create a (software) thread, you can refer the
function "kvm_start_vcpu_thread(CPUState *cpu)", which will be called
when CPU object realizes.

> AFAICS there is nothing but 'CPUState'
> which will be made part of the  possible vCPU list 'struct CPUArchIdList'.
 
As I said, an example is spapr ("spapr_possible_cpu_arch_ids()"), which
maps possible_cpu to core object. However, this is a very specific
example, and like Igor's slides said, I understand it's an architectural
requirement.

> >  
> >  IIUC, your granularity is still "thread", so that this filed should be 1.
> 
> 
> Well, again we need more discussion on this. I've stated my concerns against
> doing this. User should be allowed to create virtual topology which will
> include 'threads' as one of the parameter.
> 

I don't seem to understand...There is a ¡°threads¡± parameter in -smp, does
this not satisfy your use case?

Regards,
Zhao
