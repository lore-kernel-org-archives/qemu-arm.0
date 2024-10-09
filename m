Received: by 2002:a05:7022:110:b0:8b:e46e:3391 with SMTP id 16csp643116dlk;
        Tue, 8 Oct 2024 22:45:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVY2n0YrxBl3kF1ln+N+zkORCCoMEBaAKFifBfeQMIeoHfBPkrIAjmR/WqW+bPblmoVQNERPXUcjN9UTg==@linaro.org
X-Google-Smtp-Source: AGHT+IENQuPfFIyLsDCjA0bwJ2GjXmVXo5bNweCWcufsgFqMQ+0HIevMpXA11LbpYkOx79cTXLJM
X-Received: by 2002:a05:6214:459d:b0:6c3:5c75:d2b1 with SMTP id 6a1803df08f44-6cbc9081fb5mr28721106d6.5.1728452727431;
        Tue, 08 Oct 2024 22:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728452727; cv=none;
        d=google.com; s=arc-20240605;
        b=Uqv2Kw8RtF7G0NCajiUSm4/EPWKPvsnWjn5AhJj0Xcy2CwI5mZr+3Gb/a6RkKrmpSK
         0kIih/yeTM0YY39DVfoC3kOgZa+/jeGlJhNkfU7tFq54uGRLETIyFjFxsdPgteOTcEPh
         n2fqmOrDPvHdYL6Bh8YHlNOWw3ZBQMS98oWNnUKxUcRe/6k+F/sfmGyPfdEX82N9wcaV
         1ogqjzWMvFSrEQgUMUsFPLxDKK/HLOlZYe0vVrlbE+h2vh0yg2AE3DOoKBw2hPuAbFs+
         0ZeeFIz59cddFlsQcGEQdD5KG//mbLWMnwrT092eQ55dYoJiozn5du2+0pbUhhA7cMJq
         Jt2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=SbMW2BJ7wvOz13L/HeRhE0P+s/BMXBBa7SIBcnPArUA=;
        fh=wNgTrgmq0VRUyaeC2SHc+pkwJSD6QOmCg7MKZWreEQM=;
        b=EmJN2i9iPzow4Xj6fC6ADwGGLMz/QjMB+lyyoS1oT2RxjbPTr+iwJAwgCRFkVtgFGd
         wSoGxVK+gGVtMMaqrWkCM7xvZ9eI43GlSro/0JbOfqTag+3XNAH4nhhrmPyE/5CgRqgG
         NzvQx+SS1R7tw9vyHcfIrzcVLIfm/J4shjPp1DyASWKC7FnK8lDcS/UkKtdSfWBZvFIi
         IPQXjPUaBx+NO4vwB4jrxdW8G/GDkQI6KaxIoVTgokgq8+WEkLXIkhpngjgBRxvSpLyp
         ce+Pbvu4wR2vcOdL7dHggn0tZiwa307vqX6peOR9uZVH0UindTXsCaKY9wtVPRRd6z1y
         rZqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="dSd/iP8K";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.20 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.20])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba46d7a6asi104618246d6.59.2024.10.08.22.45.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 22:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.20 as permitted sender) client-ip=198.175.65.20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="dSd/iP8K";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.20 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728452727; x=1759988727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9pYDTK3HR96Un6CzOse/eSqGpHwAG/V7ph9HU0V5qWk=;
  b=dSd/iP8KxK6Edup/WQiq0vP0IWEt5+SZlJNaPxpCOD9vj2+I5OMeBSrh
   eXXXCFkpjJ1utxCTVFtGwcGfDmP/EgncMko6ZDWy7X0GSVexzjzrc6PFC
   wPCnjx1X/1wb25ZX2rk1cjKDhH8WUsGyyBMc6yqgOw6UKb9yDajY5BhUs
   AFGrpswEuqYgEVKF5KvpvIo2BuyXSFT0Oe0JBN0FsTprQ0De1wsdp7upY
   oyTqJetrho5QJx7RbhYMyKorvhuNSnEhP5s2mejEAD0Vw31hyMOYQyLoz
   huzBmOlPsnU9F6bOf/9Xu1rgTRp0UNcdxkhd9/xB4JALtrm74yiSBygD+
   w==;
X-CSE-ConnectionGUID: iknQmHy+Rl+0hZS15Nf67A==
X-CSE-MsgGUID: A7TZN8ISSquu6vy09yro4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27545675"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27545675"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 22:45:24 -0700
X-CSE-ConnectionGUID: 3vUy2zWBQcSZlfFJZ2+OXQ==
X-CSE-MsgGUID: Vhs2SIyzQkyn0HaVgqI5jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76446635"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 22:45:18 -0700
Date: Wed, 9 Oct 2024 14:01:30 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5n77+9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Sergio Lopez <slp@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC v2 00/12] Introduce Hybrid CPU Topology via Custom Topology
 Tree
Message-ID: <ZwYcOuZAt7qX5ci3@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
 <20241008113038.00007ee4@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008113038.00007ee4@Huawei.com>
X-TUID: s6g4XpXBvSby

Hi Jonathan,

Thank you for looking at here!

On Tue, Oct 08, 2024 at 11:30:38AM +0100, Jonathan Cameron wrote:
> Date: Tue, 8 Oct 2024 11:30:38 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [RFC v2 00/12] Introduce Hybrid CPU Topology via Custom
>  Topology Tree
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Thu, 19 Sep 2024 14:11:16 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> 
> > -smp maxsockets=1,maxdies=1,maxmodules=2,maxcores=2,maxthreads=2
> > -machine pc,custom-topo=on \
> > -device cpu-socket,id=sock0 \
> > -device cpu-die,id=die0,bus=sock0 \
> > -device cpu-module,id=mod0,bus=die0 \
> > -device cpu-module,id=mod1,bus=die0 \
> > -device x86-intel-core,id=core0,bus=mod0 \
> > -device x86-intel-atom,id=core1,bus=mod1 \
> > -device x86-intel-atom,id=core2,bus=mod1 \
> > -device host-x86_64-cpu,id=cpu0,socket-id=0,die-id=0,module-id=0,core-id=0,thread-id=0 \
> > -device host-x86_64-cpu,id=cpu1,socket-id=0,die-id=0,module-id=0,core-id=0,thread-id=1 \
> > -device host-x86_64-cpu,id=cpu2,socket-id=0,die-id=0,module-id=1,core-id=0,thread-id=0 \
> > -device host-x86_64-cpu,id=cpu3,socket-id=0,die-id=0,module-id=1,core-id=1,thread-id=0
> 
> I quite like this as a way of doing the configuration but that needs
> some review from others.

Thanks!

> Peter, Alex, do you think this scheme is flexible enough to ultimately
> allow us to support this for arm? 

I was also hoping that being generic enough would benefit ARM.

> > 
> > This does not accommodate hybrid topologies. Therefore, we introduce
> > max* parameters: maxthreads/maxcores/maxmodules/maxdies/maxsockets
> > (for x86), to predefine the topology framework for the machine. These
> > parameters also constrain subsequent custom topologies, ensuring the
> > number of child devices under each parent device does not exceed the
> > specified max limits.
> 
> To my thinking this seems like a good solution even though it's a
> bunch more smp parameters.
> 
> What does this actually mean for hotplug of CPUs?  What cases work
> with this setup?

My solution for this does not change the current CPU hotplug, because the
current cpu hotplug only needs to consider smp.cpus and smp.maxcpus.

But when a cpu is plugged in, machine needs to make sure that plugging
into the core doesn't break the maxthreads limit. Similarly, if one wants
to support hotplugging at the socket/die/core granularity, he will need
to make sure that the new topology meets the limits set by the max
parameters, which are the equivalent of preemptively leaving some empty
holes that can be utilized by hotplug.

> > Therefore, once user wants to customize topology by "-machine
> > custom-topo=on", the machine, that supports custom topology, will skip
> > the default topology creation as well as the default CPU creation.
> 
> Seems sensible to me.

Thank you! Glad to have your support.

Regards,
Zhao
