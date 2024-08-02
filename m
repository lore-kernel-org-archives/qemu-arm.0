Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1243941njb;
        Fri, 2 Aug 2024 00:42:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxwLgCzCU8F1MB2aPWyVgNCuHuQrZHt1cvBO9MptpRiIcg2xASyzITsgJ49V6kOOCL81YBj7ytLAC/yy3rFZM8Em/nqVxa
X-Google-Smtp-Source: AGHT+IFVJSvcLOrs3LrGPy5cK7L6kOjI+qf2SHC5DqAjI5I2Xs773uVkEKw0Lxv3Q1780da8dx34
X-Received: by 2002:a05:620a:24d0:b0:79f:433:6e7f with SMTP id af79cd13be357-7a34ef0af5emr315916285a.21.1722584549236;
        Fri, 02 Aug 2024 00:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722584549; cv=none;
        d=google.com; s=arc-20160816;
        b=msTProqrHl/K4VxEsvjJtEfeOn8h5ftnujkKuBqnnvzD5wRZYBbHRJppEA83OizcbU
         qvBEJYe9fM11rXw01U391dOL5idXXDMDnDZ/LRdfjFwC3WkhjpjNwCUwiNiB8tNHqpf0
         No48Dgkn3PPVjZiQAWRGcQ3RTDuk+SQmo8dm/0vvew5Wp0o77u5BeeWL7Qy5iJeCzyp0
         q3ODQaqofEfzW2Jp+JwH6Wfg7fchSKM/SBLbvdzgmeLZ9qY6k6kkxCY9L9jQbjMuNeyq
         ma0pNA3Nmm8doUU/jBhZPKgNB/pU664GkwOLVkAzST9tJYekz01RbU+6NucC8snxwwO7
         eB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=M2er7b3E0+IWWEwF91TskuCopD/+fdAx5n5eruwGCRY=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=A/s02D29FC4Zl9/5SvkfZSRYi4yRgZqjVXWyI4HvO6SEDjoWDCQ/hqbcV1mGwEd+Vn
         +JTalzqJCqFb2GOSO+CosFS9mXDj91NcIBP37X5yZxlRds95ZJmpIDWi7pXvdZHpljH8
         bSELXcRt1FW+E4GBJvmy6qJBKmZZCWUxs0+MtkUe3XGPYmmRh6SsPvzlMUYTeIz+xf4k
         QhHRQmpBhQ7/u6GJ9iIS4KDVRARc1wxsYO1IqsQhz+Qsrkk6qT8a6ltQVaL/0sH3uwgx
         8b6HH2k5Ypoaq0iGfKn04QPp8aItlGoP5q/VU5UAp8xTLxjFClkiUhWUq5c2qXoDRs6f
         GADw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Sdw0bN1Q;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.18])
        by mx.google.com with ESMTPS id d75a77b69052e-4518a7bc76fsi18273311cf.717.2024.08.02.00.42.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Aug 2024 00:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.18 as permitted sender) client-ip=192.198.163.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Sdw0bN1Q;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722584549; x=1754120549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=98bICXwlLoB9PagSTdgthbA/jG/d2EhJwMrIVt9kYvE=;
  b=Sdw0bN1QT/UyVyQuZwm7aPurftDkBsn+ojgW9BYqpXqVBooZqm+LHJ4o
   y3FeJ2tHpobDuCntzdUc76Oyq1Oc3cRAzjIBDxSbsEM8NHLsv3spmAgL9
   f272MHJO3dwM86TSeOCUQRIH2BKe8wjdpmPCRw/WPT1ge3+f+1whAaYKd
   UOgjPYqP6FUdQJ9yjGrvSrJS+dMnik8yPdDuZJKNiqNc4qpqza8lHkd09
   Sw79sGMRmWtR3mPlZdwWUuAVtUoSus3jS9nsU7zG+5V313vIOs2P30/cu
   ghsMjDRjBY6mHwCuRMnQ8Wg2e0KXzDiZ8lhy9UI+9cR4F/YHYHwa6Pa5H
   Q==;
X-CSE-ConnectionGUID: 4gfnmsf8T1KD5UyjUxS3sQ==
X-CSE-MsgGUID: ot8a5X8yRIWX57vdgDEVGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20172641"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20172641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 00:42:23 -0700
X-CSE-ConnectionGUID: YxAOI0TlQYOZ2sHkI+xz/A==
X-CSE-MsgGUID: LgIiHlT2SK2ZXV97TQKygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="55239962"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 02 Aug 2024 00:42:15 -0700
Date: Fri, 2 Aug 2024 15:58:02 +0800
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
Message-ID: <ZqyRik4UHHz3xaKl@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-9-zhao1.liu@intel.com>
 <87r0bl35ug.fsf@pond.sub.org>
 <Zp5vxtXWDeHAdPok@intel.com>
 <87bk2nnev2.fsf@pond.sub.org>
 <ZqEN1kZaQcuY4UPG@intel.com>
 <87le1psuv3.fsf@pond.sub.org>
 <ZqtXP9MViOlyhEsu@intel.com>
 <87mslweb38.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mslweb38.fsf@pond.sub.org>
X-TUID: Mfu5Lb8zT1xf

On Thu, Aug 01, 2024 at 01:28:27PM +0200, Markus Armbruster wrote:
> Date: Thu, 01 Aug 2024 13:28:27 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
>  object
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > On Thu, Jul 25, 2024 at 11:07:12AM +0200, Markus Armbruster wrote:
> >> Date: Thu, 25 Jul 2024 11:07:12 +0200
> >> From: Markus Armbruster <armbru@redhat.com>
> >> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
> >>  object
> >> 
> >> Zhao Liu <zhao1.liu@intel.com> writes:
> >> 
> >> > Hi Markus and Daniel,
> >> >
> >> > I have the questions about the -object per cache implementation:
> >> >
> >> > On Wed, Jul 24, 2024 at 02:39:29PM +0200, Markus Armbruster wrote:
> >> >> Date: Wed, 24 Jul 2024 14:39:29 +0200
> >> >> From: Markus Armbruster <armbru@redhat.com>
> >> >> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
> >> >>  object
> >> >> 
> >> >> Zhao Liu <zhao1.liu@intel.com> writes:
> >> >> 
> >> >> > Hi Markus,
> >> >> >
> >> >> > On Mon, Jul 22, 2024 at 03:37:43PM +0200, Markus Armbruster wrote:
> >> >> >> Date: Mon, 22 Jul 2024 15:37:43 +0200
> >> >> >> From: Markus Armbruster <armbru@redhat.com>
> >> >> >> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
> >> >> >>  object
> >> >> >> 
> >> >> >> Zhao Liu <zhao1.liu@intel.com> writes:
> >> >> >> 
> >> >> >> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> >> >> >> 
> >> >> >> This patch is just documentation.  The code got added in some previous
> >> >> >> patch.  Would it make sense to squash this patch into that previous
> >> >> >> patch?
> >> >> >
> >> >> > OK, I'll merge them.
> >> >> >
> >> >> >> > ---
> >> >> >> > Changes since RFC v2:
> >> >> >> >  * Rewrote the document of smp-cache object.
> >> >> >> >
> >> >> >> > Changes since RFC v1:
> >> >> >> >  * Use "*_cache=topo_level" as -smp example as the original "level"
> >> >> >> >    term for a cache has a totally different meaning. (Jonathan)
> >> >> >> > ---
> >> >> >> >  qemu-options.hx | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
> >> >> >> >  1 file changed, 58 insertions(+)
> >> >> >> >
> >> >> >> > diff --git a/qemu-options.hx b/qemu-options.hx
> >> >> >> > index 8ca7f34ef0c8..4b84f4508a6e 100644
> >> >> >> > --- a/qemu-options.hx
> >> >> >> > +++ b/qemu-options.hx
> >> >> >> > @@ -159,6 +159,15 @@ SRST
> >> >> >> >          ::
> >> >> >> >  
> >> >> >> >              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
> >> >> >> > +
> >> >> >> > +    ``smp-cache='id'``
> >> >> >> > +        Allows to configure cache property (now only the cache topology level).
> >> >> >> > +
> >> >> >> > +        For example:
> >> >> >> > +        ::
> >> >> >> > +
> >> >> >> > +            -object '{"qom-type":"smp-cache","id":"cache","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"module"},{"name":"l3","topo":"die"}]}'
> >> >> >> > +            -machine smp-cache=cache
> >> >> >> >  ERST
> >> >> >> >  
> >> >> >> >  DEF("M", HAS_ARG, QEMU_OPTION_M,
> >> >> >> > @@ -5871,6 +5880,55 @@ SRST
> >> >> >> >          ::
> >> >> >> >  
> >> >> >> >              (qemu) qom-set /objects/iothread1 poll-max-ns 100000
> >> >> >> > +
> >> >> >> > +    ``-object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}'``
> >> >> >> > +        Create an smp-cache object that configures machine's cache
> >> >> >> > +        property. Currently, cache property only include cache topology
> >> >> >> > +        level.
> >> >> >> > +
> >> >> >> > +        This option must be written in JSON format to support JSON list.
> >> >> >> 
> >> >> >> Why?
> >> >> >
> >> >> > I'm not familiar with this, so I hope you could educate me if I'm wrong.
> >> >> >
> >> >> > All I know so far is for -object that defining a list can only be done in
> >> >> > JSON format and not with a numeric index like a keyval based option, like:
> >> >> >
> >> >> > -object smp-cache,id=cache0,caches.0.name=l1i,caches.0.topo=core: Parameter 'caches' is missing
> >> >> >
> >> >> > the above doesn't work.
> >> >> >
> >> >> > Is there any other way to specify a list in command line?
> >> >> 
> >> >> The command line is a big, sprawling mess :)
> >> >> 
> >> >> -object supports either a JSON or a QemuOpts argument.  *Not* keyval!
> >> >> 
> >> >> Both QemuOpts and keyval parse something like KEY=VALUE,...  Keyval
> >> >> supports arrays and objects via dotted keys.  QemuOpts doesn't natively
> >> >> support arrays and objects, but its users can hack around that
> >> >> limitation in various ways.  -object doesn't.  So you're right, it's
> >> >> JSON or bust here.
> >> >> 
> >> >> However, if we used one object per cache instead, we could get something
> >> >> like
> >> >> 
> >> >>     -object smp-cache,name=l1d,...
> >> >>     -object smp-cache,name=l1u,...
> >> >>     -object smp-cache,name=l2,...
> >> >>     ...
> >> >
> >> > Current, I use -object to create a smp_cache object, and link it to
> >> > MachineState by -machine,smp-cache=obj_id.
> >> >
> >> > Then for the objects per cache, how could I link them to machine?
> >> >
> >> > Is it possible that I create something static in smp_cache.c and expose
> >> > all the cache information to machine through some interface?
> >> 
> >> Good questions.  However, before we head deeper into the weeds here, I
> >> feel we should discuss the things below.  And before we do that, I need
> >> a clear understanding of the use case.  Elsewhere in this thread, I just
> >> described the use case as I understand it.  Please reply there.  I'll
> >> then come back to this message.
> >> 
> >> [...]
> >
> > Jonathan and I provided different use cases for x86 and Arm. Could we
> > come back here to continue the discussion? :)
> 
> Can you provide a brief summary of the design alternatives that have
> been proposed so far?  Because I've lost track.

No problem!

Currently, we have the following options:

* 1st: The first one is just to configure cache topology with several
  options in -smp:

  -smp l1i-cache-topo=core,l1d-cache-topo-core

  This one lacks scalability to support the cache size that ARM will
  need in the future.


* 2nd: The cache list object in -smp.

  The idea was to use JSON to configure the cache list. However, the
  underlying implementation of -smp at the moment is keyval parsing,
  which is not compatible with JSON.

  If we can not insist on JSON format, then cache lists can also be
  implemented in the following way:
  
  -smp caches.0.name=l1i,caches.0.topo=core,\
       caches.1.name=l1d,caches.1.topo=core


* 3rd: The cache list object linked in -machine.

  Considering that -object is JSON-compatible so that defining lists via
  JSON is more friendly, I implemented the caches list via -object and
  linked it to MachineState:

  -object '{"qom-type":"smp-cache","id":"obj","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"}]}'
  -machine smp-caches=obj


* 4th: The per cache object without any list:

  -object smp-cache,id=cache0,name=l1i,topo=core \
  -object smp-cache,id=cache1,name=l1d,topo=core

  This proposal is clearer, but there are a few opens:
  - I plan to push qom-topo forward, which would abstract CPU related
    topology levels and cache to "device" instead of object. Is there a
    conflict here?

  - Multiple cache objects can't be linked to the machine on the command
    line, so I maintain a static cache list in smp_cache.c and expose
    the cache information to the machine through some interface. is this
    way acceptable?


In summary, the 4th proposal was the most up in the air, as it looked to
be conflict with the hybrid topology I wanted to do (and while hybrid
topology may not be accepted by the community either, I thought it would
be best for the two work to be in the same direction).

The difference between 2nd and 3rd is about the JSON requirement, if JSON
is mandatory for now then it's 3rd, if it's not mandatory (or accept to
make -machine/-smp support JSON in the future), 2nd looks cleaner, which
puts the caches list in -smp.

Regards,
Zhao

