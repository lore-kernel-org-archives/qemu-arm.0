Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1871556njb;
        Mon, 7 Oct 2024 04:37:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXeRLVMYkBGwuOT3arzhgqVTr+XSFd8mBsZRGq8s+TGmWAtv9A589BSZ1Jch5ggouLeWaQ9kTjrg7xxuw==@linaro.org
X-Google-Smtp-Source: AGHT+IEHOHJTCr6qzQT9myIVrtA+2o17pN01Y4pxF+qeL0NfwSFf0C0oag3COk56yrrHNYwila/K
X-Received: by 2002:a05:6214:4699:b0:6cb:82f9:146b with SMTP id 6a1803df08f44-6cb9a2f5847mr153878746d6.15.1728301024545;
        Mon, 07 Oct 2024 04:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728301024; cv=none;
        d=google.com; s=arc-20240605;
        b=LfPhfVsaiU+YFwiXmDdOKWINFJKh3DqbbPbgRegZix5MVB6TMFxThW1u7lDLhGA5z7
         blQp1jiwzKEnsTxdVmgamJuhd3S39QhqtlwoCIYaIpzcwJEZ/X2ZNXS48smn2EmTCwVu
         LORA+6s1N9bVYW7BtEmZtiZT20DGOf9TsvopHJM4pKg17YsUY605+euSEeeB38i/h8gg
         YhBYRNHWPi/qeeFI1ofnhOMHQjLBz+uTxyu0l2EDyyhcuXGkLwfAUQ5V1/ZtXhSmEU8x
         90ugTToz9lxsEh/pHgUCKEE1cr3QJXcGu5QvFRVqf8W7h/dw1gogH5tKdmzblhezVVq1
         9Rog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ltq2kvZrpgAkwRqZnWM9oczY+qNqPexxO3rGYzLkhRo=;
        fh=lIQK4w5u8hPKTUFD1dgvaVT/MYYXdD5M0XwdCDzhkt4=;
        b=cC1wXqpLLDvnX/70FbS27K1AU6OBJLjRnnYebs2g9ZuLvwuVZO3l/onTKwKXFkIDTA
         FeF/dXflYow5G7thxiNmihg0CydcnNW+lFUuQEAIdQpTDVALSm+/vWajVddCl3cUcRm3
         z2aRm7NmsL67H9oxp2av1hkP8msZ1cIbdsTeTEpM8FL4vt9cDjaVl0Jv/PISjHcdVzuj
         sykeamBNPk6HdH36yabxXht/AtDz4BkpK8Od+CIdNaRONvc/TBr2pVDTIo5uP+PhQsRW
         3PcGd8kBWD3qo2H+/XXbKJJtlk2It5DuCmI1XE8PFbWQmAKjP3h1nRpoloGAtwpKZPyg
         r5mQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=hltA7GMT;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.14])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba475bda4si60533216d6.216.2024.10.07.04.37.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 04:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.14 as permitted sender) client-ip=198.175.65.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=hltA7GMT;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728301025; x=1759837025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jaVghokLkYagComBJOIsqVtMl7fwxtcDqAjAsloR16M=;
  b=hltA7GMTwEpL9up00TAnUw5hISIk5S8Gxq4MW9MkEDySo6y43lyxCiVQ
   3Xzdd1Gz6yLj298+yZyeSgyCc6x5hr5BdHCyZr4jJ9qkj2U3kUUJ6K+Y9
   XUOtafcypLnYJyPVvVlJl5lPBiqhNleHw8ayJ6wKUkUBpQN3LtB+/m1tb
   wLI0bmOt18c77zi24XzZlY82Dd4xjtCgz/M7vJlGbgpQImE4yS0dfAWO+
   Tiw7NWYExBcS4gmZxRBS1IKJ4cD6CEvRNx+E+dgeeOeTvErx3NtJfoJYe
   wH85cn0vCJuuhUzPBmi7Vf0yAp7e61saxzhw+nobr0Meef4lIAAO/LPhW
   g==;
X-CSE-ConnectionGUID: MP+ObF+EQviNIcumPj3ilQ==
X-CSE-MsgGUID: MFPvUTCTRaKrJFgstkW1Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="31237682"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="31237682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 04:37:03 -0700
X-CSE-ConnectionGUID: 0/ZcA+bqQ8i8F/qPbC/qAA==
X-CSE-MsgGUID: b1Gs2tQfTSqj5/6woMuvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="98764773"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa002.fm.intel.com with ESMTP; 07 Oct 2024 04:36:57 -0700
Date: Mon, 7 Oct 2024 19:53:08 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S.Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 7/7] i386/pc: Support cache topology in -machine for
 PC machine
Message-ID: <ZwPLpOt/DIvNO70f@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
 <20240908125920.1160236-8-zhao1.liu@intel.com>
 <20240917101631.00003dcb@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917101631.00003dcb@Huawei.com>
X-TUID: Yvp6KTQe1cWv

On Tue, Sep 17, 2024 at 10:16:31AM +0100, Jonathan Cameron wrote:
> Date: Tue, 17 Sep 2024 10:16:31 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [PATCH v2 7/7] i386/pc: Support cache topology in -machine for
>  PC machine
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Sun,  8 Sep 2024 20:59:20 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> > Allow user to configure l1d, l1i, l2 and l3 cache topologies for PC
> > machine.
> > 
> > Additionally, add the document of "-machine smp-cache" in
> > qemu-options.hx.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > Tested-by: Yongwei Ma <yongwei.ma@intel.com>
>
> Trivial language suggestions.
> In general looks good to me.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Hopefully QOM maintainers and others will get to this soon. 
> I'd like Ali's ARM series to land this cycle as well
> as the lack of this support has been a pain point for us
> for a while.
>
> Jonathan

Thanks! I'll refresh a new version.

[snip]

> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index d94e2cbbaeb1..3936ff3e77f9 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -39,7 +39,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
> >      "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
> >      "                hmat=on|off controls ACPI HMAT support (default=off)\n"
> >      "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
> > -    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
> > +    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n"
> > +    "                smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel\n",
> 
> Now my cxl-fmw stuff has competition for most hideous element :)
> When we add a few more properties maybe we'll get an even longer line!

May JSON support can save us :). When I have time I will consider this.
Command line's keyval format is more convenient for configuring a single
element in an array.
 
> >      QEMU_ARCH_ALL)
> >  SRST
> >  ``-machine [type=]name[,prop=value[,...]]``
> > @@ -159,6 +160,31 @@ SRST
> >          ::
> >  
> >              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
> > +
> > +    ``smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel``
> > +        Define cache properties (now only the cache topology level) for SMP
> > +        system.
> 
> I'd drop the 'now only' bit.  Just means we have add noise updating that
> later.   It's easy enough to look down and see what is available anyway give
> the parameter docs follow immediately after this.

Agree.

> > +
> > +        ``cache=cachename`` specifies the cache that the properties will be
> > +        applied on. This field is the combination of cache level and cache
> > +        type. Currently it supports ``l1d`` (L1 data cache), ``l1i`` (L1
> 
> Drop the word Currently as I don't think it adds anything to he meaning.
> We are never going to add docs that say 'previously it supported' or 'in the
> future it will support'.
> 
> 	   "Supports ...
> 

Thanks! I will change to "It supports ..."

> > +        instruction cache), ``l2`` (L2 unified cache) and ``l3`` (L3 unified
> > +        cache).
> > +
> > +        ``topology=topologylevel`` sets the cache topology level. It accepts
> > +        CPU topology levels including ``thread``, ``core``, ``module``,
> > +        ``cluster``, ``die``, ``socket``, ``book``, ``drawer`` and a special
> > +        value ``default``. If ``default`` is set, then the cache topology will
> > +        follow the architecture's default cache topology model. If other CPU
> If another topology level is set
> 
> would be clearer.   I briefly read this as saying the topology for another CPU
> rather than a different value here.

Ah, yes, I agree.

> > +        topology level is set, the cache will be shared at corresponding CPU
> > +        topology level. For example, ``topology=core`` makes the cache shared
> > +        in a core.
> "by all threads within a core." perhaps?

Nice, it's more accurate.

Thanks,
Zhao
