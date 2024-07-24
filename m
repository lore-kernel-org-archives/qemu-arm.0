Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3106280njc;
        Wed, 24 Jul 2024 07:05:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm1eV3VLdJqayd+8ToHWOYR1ln0LChtRI6VECkU4Y5HrhDmTAH5W5cbClXzcUM5DDnZ/uS3z/yacbyZ3FPOAS+vTg68MEQ
X-Google-Smtp-Source: AGHT+IHkBGZzTYmaLMhr10HfkbT7YLdvUcdSR+tH81ANSpu9iOr3NxbnLDPJGt/dYHlXQKlFD7ck
X-Received: by 2002:a05:6359:a3a3:b0:1ac:62e5:7648 with SMTP id e5c5f4694b2df-1acec5e0e7amr248002655d.20.1721829933805;
        Wed, 24 Jul 2024 07:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721829933; cv=none;
        d=google.com; s=arc-20160816;
        b=sdu99wyhMKet0azVnhuqn2UO3j2FocdY2lPCbR1uMizLj2V75vGEdF9Uu7dV8rIWiB
         BM8Al9iFogbFdNJSfzr2lVpuJ1BBCON9GuRbkvyJy4Y230GMrM2hsZChH80c3BRtiM6a
         IlBEE3fbmoENxWgac5dN7675pyoMZLnOSizM0ZqUPAhY86eIGWM5omtHFJNPbrYGgfat
         CMyB+XPPAIrijRC7xI3OTpFpgXTw6qBucPC6xSidXk/M6yELBNAp7x6NwQCVy6EAohyF
         qtD74IQahE+Jw8mW7ZMAbV9YsidNHOtIggSKVkbJ45tVt+v6krKvWbhIn+tMFV4vnNHz
         acQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=7WXDyumFOc1bAMu88LXC5pY5/X17oRVJbbOhEeby1P0=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=DCeErpMnASW1VEItMVwXczg9eu1iZQiovVwOXVlQAra2pWUxdlan7/TztTDTWOVrBR
         fE3mS2KUs+7I+TvfT3+3O8o2V+C1nEIHYJIXWA3ahN3Hgs8jZ333rq1e5cb1MNlXZyIS
         PIk5cU9fnd7Oq/r0EuP+vw92laCj+gC8LrvBmMAaFchH372HSgXGmn7B9c3OBXZiDOw1
         3x0tD+tVxDIj3FhTi2dcXmyqvMDtkaZrvsxug91c+FikFi39jOWYhiep2aaG9gGUD08/
         bL5i7WaUbiz+SggW38et5SW3yBhdPLnbH6clU8JovLRs8n95SmWfnXkmWZOvaq/bHndT
         0LJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=bqCgQvVg;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.15])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f6a891b0bfsi622505e0c.89.2024.07.24.07.05.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 07:05:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) client-ip=198.175.65.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=bqCgQvVg;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721829933; x=1753365933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nHiDPbIFPaMJ6FYvivlu7Y0409aOZMDmB6P2KkiCJoM=;
  b=bqCgQvVgc0xxBtOBUzO4UGrQW8zYTZRLPOE6MCd5gYK98DX8AJQgTOlj
   JDFxl+ejLNfRkcZXl0VNEWFQTGP/NiLCrqz8r2IwDn8Rtvzy/TRh3pnxt
   pSxoOP7Fut2wRHgOkQbxrLpOaUxORcYDDs0dcQoEsbYsEJrrInuu56aKK
   IExaZq4aIxbwnSBnGOpB4u43Y2yn1id8IjAHnNJriEPyjbK82Cy3ZitOa
   spMqF0oAR6COZjtgYayOadsqGATHMZCrJ7yDfrtoeUcBa/PWggxVmpw7j
   dKMWFkhoi3/FZez07xAtEvs3SwwBEFX+MzR1zm0VFGH+jIp9NGCPCU6AZ
   Q==;
X-CSE-ConnectionGUID: RmYDUwmFQLKWU2d9UO3mqQ==
X-CSE-MsgGUID: pirVYnCrSzWCbPPiOCOoFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="23270112"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="23270112"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 07:05:31 -0700
X-CSE-ConnectionGUID: +ugYcPMiQx6y3EvboMm6nw==
X-CSE-MsgGUID: y6FeXgEjQiKv6wybWSsJSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="56914510"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2024 07:05:26 -0700
Date: Wed, 24 Jul 2024 22:21:10 +0800
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
Message-ID: <ZqEN1kZaQcuY4UPG@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-9-zhao1.liu@intel.com>
 <87r0bl35ug.fsf@pond.sub.org>
 <Zp5vxtXWDeHAdPok@intel.com>
 <87bk2nnev2.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk2nnev2.fsf@pond.sub.org>
X-TUID: PRc1PFdBxGvG

Hi Markus and Daniel,

I have the questions about the -object per cache implementation:

On Wed, Jul 24, 2024 at 02:39:29PM +0200, Markus Armbruster wrote:
> Date: Wed, 24 Jul 2024 14:39:29 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
>  object
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Hi Markus,
> >
> > On Mon, Jul 22, 2024 at 03:37:43PM +0200, Markus Armbruster wrote:
> >> Date: Mon, 22 Jul 2024 15:37:43 +0200
> >> From: Markus Armbruster <armbru@redhat.com>
> >> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
> >>  object
> >> 
> >> Zhao Liu <zhao1.liu@intel.com> writes:
> >> 
> >> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> >> 
> >> This patch is just documentation.  The code got added in some previous
> >> patch.  Would it make sense to squash this patch into that previous
> >> patch?
> >
> > OK, I'll merge them.
> >
> >> > ---
> >> > Changes since RFC v2:
> >> >  * Rewrote the document of smp-cache object.
> >> >
> >> > Changes since RFC v1:
> >> >  * Use "*_cache=topo_level" as -smp example as the original "level"
> >> >    term for a cache has a totally different meaning. (Jonathan)
> >> > ---
> >> >  qemu-options.hx | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
> >> >  1 file changed, 58 insertions(+)
> >> >
> >> > diff --git a/qemu-options.hx b/qemu-options.hx
> >> > index 8ca7f34ef0c8..4b84f4508a6e 100644
> >> > --- a/qemu-options.hx
> >> > +++ b/qemu-options.hx
> >> > @@ -159,6 +159,15 @@ SRST
> >> >          ::
> >> >  
> >> >              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
> >> > +
> >> > +    ``smp-cache='id'``
> >> > +        Allows to configure cache property (now only the cache topology level).
> >> > +
> >> > +        For example:
> >> > +        ::
> >> > +
> >> > +            -object '{"qom-type":"smp-cache","id":"cache","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"module"},{"name":"l3","topo":"die"}]}'
> >> > +            -machine smp-cache=cache
> >> >  ERST
> >> >  
> >> >  DEF("M", HAS_ARG, QEMU_OPTION_M,
> >> > @@ -5871,6 +5880,55 @@ SRST
> >> >          ::
> >> >  
> >> >              (qemu) qom-set /objects/iothread1 poll-max-ns 100000
> >> > +
> >> > +    ``-object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}'``
> >> > +        Create an smp-cache object that configures machine's cache
> >> > +        property. Currently, cache property only include cache topology
> >> > +        level.
> >> > +
> >> > +        This option must be written in JSON format to support JSON list.
> >> 
> >> Why?
> >
> > I'm not familiar with this, so I hope you could educate me if I'm wrong.
> >
> > All I know so far is for -object that defining a list can only be done in
> > JSON format and not with a numeric index like a keyval based option, like:
> >
> > -object smp-cache,id=cache0,caches.0.name=l1i,caches.0.topo=core: Parameter 'caches' is missing
> >
> > the above doesn't work.
> >
> > Is there any other way to specify a list in command line?
> 
> The command line is a big, sprawling mess :)
> 
> -object supports either a JSON or a QemuOpts argument.  *Not* keyval!
> 
> Both QemuOpts and keyval parse something like KEY=VALUE,...  Keyval
> supports arrays and objects via dotted keys.  QemuOpts doesn't natively
> support arrays and objects, but its users can hack around that
> limitation in various ways.  -object doesn't.  So you're right, it's
> JSON or bust here.
> 
> However, if we used one object per cache instead, we could get something
> like
> 
>     -object smp-cache,name=l1d,...
>     -object smp-cache,name=l1u,...
>     -object smp-cache,name=l2,...
>     ...

Current, I use -object to create a smp_cache object, and link it to
MachineState by -machine,smp-cache=obj_id.

Then for the objects per cache, how could I link them to machine?

Is it possible that I create something static in smp_cache.c and expose
all the cache information to machine through some interface?

Additionally, I would like to consider for the long term heterogeneous
cache, as asked before in [1], does the object per cache conflict with
the cache device I'm considering? Considering cache device is further
because I want to create CPU/cache topology via -device and build a
topology tree.

[1]: https://lore.kernel.org/qemu-devel/Zl88DYwLE3ScDF5F@intel.com/

I think this is becoming a nightmare I can't get around. Naming is
difficult, and sorting out interface design I think is also a difficult
task.

If you feel that there is indeed a conflict, then I'm also willing
to fall back to -smp again and do it based on keyval's list, as originally
suggested by Daniel. Sorry for the repetition on thoughts/design, I hope
that discussion with you I can make sense of the current and subsequent
paths without getting out of hand!

Best Regards,
Zhao
