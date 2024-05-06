Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1424856ejc;
        Mon, 6 May 2024 01:51:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlQmIwsxYoUaSZtxNkKewXTuYNjPeotFj6UYj9SXGh4VPLIG3YjT+m3WsfFe+7Wv3gdyO7DvGCssq0sFFTAGhKo07LIsuw
X-Google-Smtp-Source: AGHT+IE23ZOaZP1D2UG/MO3IVtpPWT7S1GnWcC//MeomAAs3p/jaJd9NHnTsccODSZssC996CcH4
X-Received: by 2002:a67:ffc5:0:b0:47c:86c:cb75 with SMTP id w5-20020a67ffc5000000b0047c086ccb75mr11106287vsq.16.1714985511982;
        Mon, 06 May 2024 01:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714985511; cv=none;
        d=google.com; s=arc-20160816;
        b=c9eEon0Z1eAyj41kNNNbVQa+3cQNu+mtwigLAo1n6inbCndjl3VJ9OmJwMMCrn6xi8
         Ws2SfppppTTeZ59Pi0dq+6p+oXxJZQuZg30/cxgPPh7ABHGbHfsz8rR1/1DnzRkdJT2m
         4X50OJFGqbk8M6XKYvP+R5m7Z84YQmWIlzM/0hAfX2VqzE/BjxaCr0IiaH8ODYx0SGDu
         fnwOPh60wMbO2E23Ruf5sdTEjF4zAAW/o9rbivygW7ohO/voUVx63n2bMgx+kNeN+5kh
         WyrHsyUHlCHiTOq7etbwSzoRZMkBijvyezsan1N1JmKwoBm2TF7lctckC1ggiAJ0HR3N
         rr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=qS7ROZ76ecVOnhXZ99JE7KvtevFQjehCHoywc1cuB+c=;
        fh=f16HA1tCe+fMy5I0tWo2a13+FpANjfOn+mSIgbokRQY=;
        b=QOrw5tHehNTubpeCpDkfxCD5fG9dKgVSBEBgGdweEOUQgFmoMEo+QOqoCsKsTrHevQ
         MR4y3tPJSOFuh/MoRMzBix9IQuIXRJ0mNkfKIQpVKlDe+bkaTRQ7K3ieKOdzVR8kYIgO
         pElab37oMnZnva/jWJMRUlgXoHV+3Cf1xTR7nsQ1EdpG/8gTXNmTHLCR9eTFUiHSNjdY
         zGVyNJTOlqwILvuJbaxWIS3X/VMAGkWxW9Iqk4SuH4qujw6CbxYfCnHnEWbqN+4kafHZ
         1GhidvAHVu8iqPT8B9FmhJqoTqwuDtVeWZSGe2rVLbPNs/2pOXQoNnkZ9E6Pkf2KkX+Y
         yCYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cTlIjZgc;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.19])
        by mx.google.com with ESMTPS id r4-20020a0562140c8400b006a0cde16c61si8870272qvr.417.2024.05.06.01.51.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2024 01:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.19 as permitted sender) client-ip=192.198.163.19;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cTlIjZgc;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714985512; x=1746521512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xl9SAidf/IAvag53ZON+iKmnnx/oQRppsBE+55au41E=;
  b=cTlIjZgcymSH0/e0FcQSRokwJwGYZXu+W4ahRm9OPFFcTCSdNPm6jF8d
   lXCiqN1TN5qL+Kk9FyUak/rcX6UbJqeJOFnb0eGSlkHFFq8s+46ijhZ/H
   IqCOKPOgsM2/zUE6lxmSp+eXVsPJFgsoSYK036E12ZRby9diJZmDD6CJg
   Rh9O5Cy1bEzFSN7/PYtf6ceVVlBlpRw2XxMpXdcCvG33kBxyWZvaM3BvX
   itUz1xiMjRClsWPsl+v7+Hj1BricQs7/mLDsEDa20Q+U7E/cueleDum7T
   14ymX4AxPObzqYgDLnN0I84M0/b5PWG0Kodwggv+Q6/WD1tQgDnnKBh0G
   g==;
X-CSE-ConnectionGUID: 44QygM9lQLaPxROfEZFycQ==
X-CSE-MsgGUID: xcD70yjoTCGf6sQkah/Cfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10599852"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10599852"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 01:51:49 -0700
X-CSE-ConnectionGUID: Spa7drKlSsWej+cuhfs7Qw==
X-CSE-MsgGUID: bPUX185UTb+qdDp+mHCIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32581742"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa005.fm.intel.com with ESMTP; 06 May 2024 01:51:41 -0700
Date: Mon, 6 May 2024 17:05:53 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
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
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
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
	Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH V8 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <ZjidcX8p1ERW276J@intel.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-4-salil.mehta@huawei.com>
 <ZfFEKgpRiEOZo9xd@intel.com>
 <6acc5b10128d431ca8bfa26ec45ae0f6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6acc5b10128d431ca8bfa26ec45ae0f6@huawei.com>
X-TUID: 9Kamd3xdFS8r

Hi Salil,

On Fri, May 03, 2024 at 07:59:32PM +0000, Salil Mehta wrote:
> Date: Fri, 3 May 2024 19:59:32 +0000
> From: Salil Mehta <salil.mehta@huawei.com>
> Subject: RE: [PATCH V8 3/8] hw/acpi: Update ACPI GED framework to support
>  vCPU Hotplug
> 
> Hello,
> 
> Sorry, I missed this earlier.
>
> >  From: Zhao Liu <zhao1.liu@intel.com>
> >  Sent: Wednesday, March 13, 2024 6:14 AM
> >  To: Salil Mehta <salil.mehta@huawei.com>
> >  
> >  Hi Salil,
> >  
> >  It seems my comment [1] in v7 was missed, but I still hit the same issue. Pls
> >  let me paste the previous comment here again.
> >  
> >  [1]: https://lore.kernel.org/qemu-devel/ZXCqp32ggIFvUweu@intel.com/
> 
> Yes, I have this in my mind. 
> 
> >  
> >  [snip]
> >  
> >  > @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
> >  >      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
> >  >                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
> >  >      sysbus_init_mmio(sbd, &ged_st->regs);
> >  > +
> >  > +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp
> >  container",
> >  > +                       ACPI_CPU_HOTPLUG_REG_LEN);
> >  > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
> >  > +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> >  > +                        &s->cpuhp_state, 0);
> >  >  }
> >  >
> >  
> >  I find this cpu_hotplug_hw_init() can still cause qtest errors (for v8) on x86
> >  platforms as you mentioned in v6:
> >  https://lore.kernel.org/qemu-devel/15e70616-6abb-63a4-17d0-
> >  820f4a254607@opnsrc.net/T/#m108f102b2fe92b7dd7218f2f942f7b233a9d6a
> >  f3
> >  
> >  IIUC, microvm machine has its own 'possible_cpus_arch_ids' and that is
> >  inherited from its parent x86 machine.
> >  
> >  The above error is because device-introspect-test sets the none-machine:
> >  
> >  # starting QEMU: exec ./qemu-system-i386 -qtest unix:/tmp/qtest-
> >  3094820.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-
> >  3094820.qmp,id=char0 -mon chardev=char0,mode=control -display none -
> >  audio none -nodefaults -machine none -accel qtest
> >  
> >  So what about just checking mc->possible_cpu_arch_ids instead of an
> >  assert in cpu_hotplug_hw_init()?
> >  
> >  diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c index
> >  4b24a2500361..303f1f1f57bc 100644
> >  --- a/hw/acpi/cpu.c
> >  +++ b/hw/acpi/cpu.c
> >  @@ -221,7 +221,10 @@ void cpu_hotplug_hw_init(MemoryRegion *as,
> >  Object *owner,
> >       const CPUArchIdList *id_list;
> >       int i;
> >  
> >  -    assert(mc->possible_cpu_arch_ids);
> >  +    if (!mc->possible_cpu_arch_ids) {
> >  +        return;
> >  +    }
> >  +
> 
> 
> Yes, we can do this with some debug print or trace maybe.

Here it is just to return early without touching mc->possible_cpu_arch_ids().
If you adopt this workaround, then in the meantime I suggest adding a comment
to this "if" to clarify that it is for compatibility with certain machines
that do not implement mc->possible_cpu_arch_ids().
 
> >       id_list = mc->possible_cpu_arch_ids(machine);
> >       state->dev_count = id_list->len;
> >       state->devs = g_new0(typeof(*state->devs), state->dev_count);
> >  
> >  This check seems to be acceptable in the general code path? Not all
> >  machines have possible_cpu_arch_ids, after all.
> 
> True. BTW, have you tested this with Qtest?

Yes, by "make check" on x86 platform. This workaround can help us pass
the x86 tests.

Regards,
Zhao
