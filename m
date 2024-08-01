Received: by 2002:a05:7022:1b17:b0:84:f013:bc5b with SMTP id ti23csp920492dlb;
        Thu, 1 Aug 2024 02:21:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZ+CLmmxH+HaNeAp5ege5XmRV96eL4emsDl2JwSO5Z0Ckuui2ALHSnJkaFXITvVD91Go1UeKMJsC1Uc+05Xm9aSMibStNx
X-Google-Smtp-Source: AGHT+IE0HtQhqu8Eh3k8FfEtOScKfLQAHLLbQlrH8HXFHmwGazBVCpEJfHGDof3TFo+FcQd7VAbB
X-Received: by 2002:a05:6214:4189:b0:6b7:9f1d:283a with SMTP id 6a1803df08f44-6bb8d78e66cmr19953966d6.38.1722504082879;
        Thu, 01 Aug 2024 02:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722504082; cv=none;
        d=google.com; s=arc-20160816;
        b=BfxFA+5mhT6IqYuQguAXU01x0WKNJUqd4I+fTE2t0Xxr2ynr/nBSjndEL3C7WDwM3T
         quw6GCUis0CRy1yqHBWadiwQkeufIlgBJRjE/+NuTOYEiVKBH6hpeivy1GlaEevfxsCe
         x5K4tbfE0pAehvGSh8BzksqQ5CADa0/O5j6/4yI1N5zWFsrtc0rR6Ad1DkP4TKLHNkgX
         4Hc+BZPz2qdFvUwlpDwFW12IHALvbu3BRkbc/fC5rQa0bMKDvW5ntsE5XAQCmMRdPzbV
         e81Zx6KBQyMJczrVs9PmxQ8OgEoNkP8GTBeEJHiqA1FDFaulCi1Opaufn4KDFBgnGglQ
         5xUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=VhIU0H8zCkQcv5+ATX29zXYWBb/3ZffF8LHXN416OVw=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=wiTuxHwF/vaRfBeV7iVUdikR32G5SjKtoPS2MxDI0vyhN4UNVnRtlUKehTZdTNH3uZ
         7EP0mMFgpOVR6GXpOL7ZpsJTDuybQGz3IFrZa1cJ7Tk5ebwZ6RCko/NpOBV69ixlxnxW
         GIkk/ADvzv/fK8qGy9EbOUqCfnceo2dY0aF++qfzoNtP49B56LrpW2246RJdNMyan1JD
         ic0bEXV+oz4CAs8ijR0qAFxRnv6TzP5EV5cQHboaAGy+wfZA0JI3yl5W0m/qUg/+TZWs
         JbPVpD9/cR6K8wWy0NSZi7zbpqZjf4mB5IIWuPIomP8GfbDocnI9SkuV5AchQXrltS51
         Ai/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=hh2iLbsg;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.21 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.21])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3faca26bsi177609126d6.435.2024.08.01.02.21.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2024 02:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.21 as permitted sender) client-ip=198.175.65.21;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=hh2iLbsg;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.21 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722504083; x=1754040083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xmg/968fCVUCGZYT797Z9jjQKkMZwiEQFs2Df4qxxrw=;
  b=hh2iLbsgRC+AXn5vUc9zVHi63dyBOpVq72j7e4+QreQ+Wv5iOlqY5PT+
   lcu8igdjgU6AtQ/OPA2pSoZrHRJJC1Ztdmw1ch9Fruido9+EGplOvw5m+
   IFdDUjDkZ1MSwf9jKDadCDNOBB9G0lnnKE6fpVeqRA0QvY04cB4M0fcDf
   IrbeCAVOnjIX2bya6w0qIGG3N5eZT95DTS7c0OdNBj5PJUoMA6yyTlnOF
   c6QR6AGqMyfdWrXUZ56HVWY6voamLLJ9ts7f1/RiH+9IBE2+ZsQ8OKcms
   47h/cvPKDciSBxaNRSRXVGvvLa1E4as8w53MLTLXPeIKcTQWmcYTv92RY
   A==;
X-CSE-ConnectionGUID: YFwdBi4+SiScE8EIbCvw6g==
X-CSE-MsgGUID: u9k7FL/ZRJmaZlfnuWUX6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20385177"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20385177"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 02:21:21 -0700
X-CSE-ConnectionGUID: D84dmaN6SuK0K8x9jJDrlw==
X-CSE-MsgGUID: YCFLQ0uPTG+Bm5RJ5hwSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="59787927"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2024 02:21:16 -0700
Date: Thu, 1 Aug 2024 17:37:03 +0800
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
Message-ID: <ZqtXP9MViOlyhEsu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-9-zhao1.liu@intel.com>
 <87r0bl35ug.fsf@pond.sub.org>
 <Zp5vxtXWDeHAdPok@intel.com>
 <87bk2nnev2.fsf@pond.sub.org>
 <ZqEN1kZaQcuY4UPG@intel.com>
 <87le1psuv3.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87le1psuv3.fsf@pond.sub.org>
X-TUID: jqvEH3G4bOlE

On Thu, Jul 25, 2024 at 11:07:12AM +0200, Markus Armbruster wrote:
> Date: Thu, 25 Jul 2024 11:07:12 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
>  object
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Hi Markus and Daniel,
> >
> > I have the questions about the -object per cache implementation:
> >
> > On Wed, Jul 24, 2024 at 02:39:29PM +0200, Markus Armbruster wrote:
> >> Date: Wed, 24 Jul 2024 14:39:29 +0200
> >> From: Markus Armbruster <armbru@redhat.com>
> >> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
> >>  object
> >> 
> >> Zhao Liu <zhao1.liu@intel.com> writes:
> >> 
> >> > Hi Markus,
> >> >
> >> > On Mon, Jul 22, 2024 at 03:37:43PM +0200, Markus Armbruster wrote:
> >> >> Date: Mon, 22 Jul 2024 15:37:43 +0200
> >> >> From: Markus Armbruster <armbru@redhat.com>
> >> >> Subject: Re: [PATCH 8/8] qemu-options: Add the description of smp-cache
> >> >>  object
> >> >> 
> >> >> Zhao Liu <zhao1.liu@intel.com> writes:
> >> >> 
> >> >> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> >> >> 
> >> >> This patch is just documentation.  The code got added in some previous
> >> >> patch.  Would it make sense to squash this patch into that previous
> >> >> patch?
> >> >
> >> > OK, I'll merge them.
> >> >
> >> >> > ---
> >> >> > Changes since RFC v2:
> >> >> >  * Rewrote the document of smp-cache object.
> >> >> >
> >> >> > Changes since RFC v1:
> >> >> >  * Use "*_cache=topo_level" as -smp example as the original "level"
> >> >> >    term for a cache has a totally different meaning. (Jonathan)
> >> >> > ---
> >> >> >  qemu-options.hx | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
> >> >> >  1 file changed, 58 insertions(+)
> >> >> >
> >> >> > diff --git a/qemu-options.hx b/qemu-options.hx
> >> >> > index 8ca7f34ef0c8..4b84f4508a6e 100644
> >> >> > --- a/qemu-options.hx
> >> >> > +++ b/qemu-options.hx
> >> >> > @@ -159,6 +159,15 @@ SRST
> >> >> >          ::
> >> >> >  
> >> >> >              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
> >> >> > +
> >> >> > +    ``smp-cache='id'``
> >> >> > +        Allows to configure cache property (now only the cache topology level).
> >> >> > +
> >> >> > +        For example:
> >> >> > +        ::
> >> >> > +
> >> >> > +            -object '{"qom-type":"smp-cache","id":"cache","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"module"},{"name":"l3","topo":"die"}]}'
> >> >> > +            -machine smp-cache=cache
> >> >> >  ERST
> >> >> >  
> >> >> >  DEF("M", HAS_ARG, QEMU_OPTION_M,
> >> >> > @@ -5871,6 +5880,55 @@ SRST
> >> >> >          ::
> >> >> >  
> >> >> >              (qemu) qom-set /objects/iothread1 poll-max-ns 100000
> >> >> > +
> >> >> > +    ``-object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}'``
> >> >> > +        Create an smp-cache object that configures machine's cache
> >> >> > +        property. Currently, cache property only include cache topology
> >> >> > +        level.
> >> >> > +
> >> >> > +        This option must be written in JSON format to support JSON list.
> >> >> 
> >> >> Why?
> >> >
> >> > I'm not familiar with this, so I hope you could educate me if I'm wrong.
> >> >
> >> > All I know so far is for -object that defining a list can only be done in
> >> > JSON format and not with a numeric index like a keyval based option, like:
> >> >
> >> > -object smp-cache,id=cache0,caches.0.name=l1i,caches.0.topo=core: Parameter 'caches' is missing
> >> >
> >> > the above doesn't work.
> >> >
> >> > Is there any other way to specify a list in command line?
> >> 
> >> The command line is a big, sprawling mess :)
> >> 
> >> -object supports either a JSON or a QemuOpts argument.  *Not* keyval!
> >> 
> >> Both QemuOpts and keyval parse something like KEY=VALUE,...  Keyval
> >> supports arrays and objects via dotted keys.  QemuOpts doesn't natively
> >> support arrays and objects, but its users can hack around that
> >> limitation in various ways.  -object doesn't.  So you're right, it's
> >> JSON or bust here.
> >> 
> >> However, if we used one object per cache instead, we could get something
> >> like
> >> 
> >>     -object smp-cache,name=l1d,...
> >>     -object smp-cache,name=l1u,...
> >>     -object smp-cache,name=l2,...
> >>     ...
> >
> > Current, I use -object to create a smp_cache object, and link it to
> > MachineState by -machine,smp-cache=obj_id.
> >
> > Then for the objects per cache, how could I link them to machine?
> >
> > Is it possible that I create something static in smp_cache.c and expose
> > all the cache information to machine through some interface?
> 
> Good questions.  However, before we head deeper into the weeds here, I
> feel we should discuss the things below.  And before we do that, I need
> a clear understanding of the use case.  Elsewhere in this thread, I just
> described the use case as I understand it.  Please reply there.  I'll
> then come back to this message.
> 
> [...]

Jonathan and I provided different use cases for x86 and Arm. Could we
come back here to continue the discussion? :)

Thanks,
Zhao

