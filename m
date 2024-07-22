Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1949152njc;
        Mon, 22 Jul 2024 07:26:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnh/KWEy5NOfhdTXIMCsdD4H9TIImPKB320LME56G3IXfOulpVighwzgbU4xFUIH6sNDhqlfZJ3Tq5aMpWiQD9cIZjeYwh
X-Google-Smtp-Source: AGHT+IG5YTNTGzNcz990BUfS63Mb/om8JUfrD8l44Jo6rNq1x09i79vxynuQ1sUvo3TmeSOYuceF
X-Received: by 2002:a25:838b:0:b0:dfb:420:1e91 with SMTP id 3f1490d57ef6-e087029f2f2mr7786211276.27.1721658398112;
        Mon, 22 Jul 2024 07:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721658398; cv=none;
        d=google.com; s=arc-20160816;
        b=G/5IW1QABq5VrD/IQG4rLuYzG1QMLfoHZiYhwSNeVQPKXnDHI95bAQeBxio/USuJta
         ZrRLXf+CG90WKlGXF7pfVhf220yF6gCsK6OBQ8PKM+RbIWTxfnDFOUoNuXWVhi/d1GyJ
         hVCsjxifdDxbty06pdxt6R1NDf+RCB7NEmUw0HOAob8jgcbSiIeszN36gRzMm7mju0Qc
         E5/T4ok0bjU4bNNk5Z2AAhZlHBwICZj4Gc2f7EAG6tsv+xcOUT3RdHvnIZWK84RrlME4
         DvHuU80vIsk+AzF9TS8R636BmYVZd1KI4JBTnyXSs2Kw/2rdqpVwx5VcPXgEu2l4uzJo
         NJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=OsWWsKLHX/f1NpTzdYeaE/bJM17+9hOG5p8yZol9aXI=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=sFx1Dh+PlyxwwaaFI3EN4R5EEtJN5X6JpTomLss6tkXLZ0RL5dblCY2H3gIrWuCngj
         f5J76W6mBjzahPtzIRQNK2dnusCQS0KrBdNWPTvkC5V1eyTql0P57QeojyKdttEtCnEi
         ssVBJJCAKQNL1ngplZnRi+NRr9a+P9YaDQc0kEUlJOD4ibstJ69f2knwS2w4EFSVMshx
         9QkSqlDqSZP4e+c+2pIPERRILP6SGTy49k/H2SC77K8WShkIe09xykOfx5h4wl1gLczJ
         jMt8N+X0uerpKp1qf06mOSkXyvo5t2oGbqGzo0x83Wokhl1R5HP8mQwjQjhXnyhLu5y/
         bsbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="OqT4bG/z";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.12 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.12])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac99d7dcsi74327136d6.207.2024.07.22.07.26.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 07:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.12 as permitted sender) client-ip=198.175.65.12;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="OqT4bG/z";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.12 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721658398; x=1753194398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OsrIUd37YeYaTA7dO/rYy+a/KCssuHBkjLNEx5suQu0=;
  b=OqT4bG/zZH2+f8h8G4azcUCiT2y0fBgElyywN+x0xE2FnNBs/ymPz+qz
   l2SUAjWcX6aDReXNZjB1bWU8g23l49uNpZ/UdVAL4r3N69tFTH+njUNyv
   kI+DYSLmCRvzT/1kDTKktDS+IlosVt9waGqxgFAQT8TYl2i3w9KOHsfz0
   Uhv9QFekrfgH+kztNzV+tDIyQRUNsW7nsn8ohBW8+yQzmAQsFkoH2/YmL
   F0q0RNufRetbFky3xi4UpA1X25QITElIVzqbGJgKCM1yvu7Xl00nz0HZf
   WJ3HaLQBonmbDYuBolo3S4ahXguiJeOiC4W5180Uv+Zrz4x6qt/8O96WB
   A==;
X-CSE-ConnectionGUID: 1bBXgSSoSBq/YszJSjc/og==
X-CSE-MsgGUID: czgK13OZQ3Gkmq3J9wg8vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30617135"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="30617135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 07:26:37 -0700
X-CSE-ConnectionGUID: +SEajsCAQSm91RWdetg5tQ==
X-CSE-MsgGUID: RxjqKHH3QVySpkXovI9GSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="51555979"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jul 2024 07:26:30 -0700
Date: Mon, 22 Jul 2024 22:42:14 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache object
Message-ID: <Zp5vxtXWDeHAdPok@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-9-zhao1.liu@intel.com>
 <87r0bl35ug.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0bl35ug.fsf@pond.sub.org>
X-TUID: BunqHu4+TrKU

Hi Markus,

On Mon, Jul 22, 2024 at 03:37:43PM +0200, Markus Armbruster wrote:
> Date: Mon, 22 Jul 2024 15:37:43 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
>  object
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> 
> This patch is just documentation.  The code got added in some previous
> patch.  Would it make sense to squash this patch into that previous
> patch?

OK, I'll merge them.

> > ---
> > Changes since RFC v2:
> >  * Rewrote the document of smp-cache object.
> >
> > Changes since RFC v1:
> >  * Use "*_cache=topo_level" as -smp example as the original "level"
> >    term for a cache has a totally different meaning. (Jonathan)
> > ---
> >  qemu-options.hx | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 8ca7f34ef0c8..4b84f4508a6e 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -159,6 +159,15 @@ SRST
> >          ::
> >  
> >              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
> > +
> > +    ``smp-cache='id'``
> > +        Allows to configure cache property (now only the cache topology level).
> > +
> > +        For example:
> > +        ::
> > +
> > +            -object '{"qom-type":"smp-cache","id":"cache","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"module"},{"name":"l3","topo":"die"}]}'
> > +            -machine smp-cache=cache
> >  ERST
> >  
> >  DEF("M", HAS_ARG, QEMU_OPTION_M,
> > @@ -5871,6 +5880,55 @@ SRST
> >          ::
> >  
> >              (qemu) qom-set /objects/iothread1 poll-max-ns 100000
> > +
> > +    ``-object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}'``
> > +        Create an smp-cache object that configures machine's cache
> > +        property. Currently, cache property only include cache topology
> > +        level.
> > +
> > +        This option must be written in JSON format to support JSON list.
> 
> Why?

I'm not familiar with this, so I hope you could educate me if I'm wrong.

All I know so far is for -object that defining a list can only be done in
JSON format and not with a numeric index like a keyval based option, like:

-object smp-cache,id=cache0,caches.0.name=l1i,caches.0.topo=core: Parameter 'caches' is missing

the above doesn't work.

Is there any other way to specify a list in command line?

> > +
> > +        The ``caches`` parameter accepts a list of cache property in JSON
> > +        format.
> > +
> > +        A list element requires the cache name to be specified in the
> > +        ``name`` parameter (currently ``l1d``, ``l1i``, ``l2`` and ``l3``
> > +        are supported). ``topo`` parameter accepts CPU topology levels
> > +        including ``thread``, ``core``, ``module``, ``cluster``, ``die``,
> > +        ``socket``, ``book``, ``drawer`` and ``default``. The ``topo``
> > +        parameter indicates CPUs winthin the same CPU topology container
> > +        are sharing the same cache.
> > +
> > +        Some machines may have their own cache topology model, and this
> > +        object may override the machine-specific cache topology setting
> > +        by specifying smp-cache object in the -machine. When specifying
> > +        the cache topology level of ``default``, it will honor the default
> > +        machine-specific cache topology setting. For other topology levels,
> > +        they will override the default setting.
> > +
> > +        An example list of caches to configure the cache model (l1d cache
> > +        per core, l1i cache per core, l2 cache per module and l3 cache per
> > +        socket) supported by PC machine might look like:
> > +
> > +        ::
> > +
> > +              {
> > +                "caches": [
> > +                   { "name": "l1d", "topo": "core" },
> > +                   { "name": "l1i", "topo": "core" },
> > +                   { "name": "l2", "topo": "module" },
> > +                   { "name": "l3", "topo": "socket" },
> > +                ]
> > +              }
> > +
> > +        An example smp-cache object would look like:()
> > +
> > +        .. parsed-literal::
> > +
> > +             # |qemu_system| \\
> > +                 ... \\
> > +                 -object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}' \\
> > +                 ...
> >  ERST
> 
