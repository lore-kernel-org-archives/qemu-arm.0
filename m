Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1924481njc;
        Mon, 22 Jul 2024 06:46:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdDTbhk0yFqVIV9dgcZwaeVhhy4kmbiiexPgP0NGkiuW7Ekzs46RjVY/4PaEp//kICROkOFhxx/zpE86drkoXvtqg1Wflk
X-Google-Smtp-Source: AGHT+IEsaobSXZuqyUWjwFrCObm66smfJEN39DLxy2Xc3J/uBvNax5b4FnfvbOANyxHPgXRiZ00f
X-Received: by 2002:ad4:5cab:0:b0:6b5:e4eb:8584 with SMTP id 6a1803df08f44-6b94f02b546mr143927296d6.11.1721655965589;
        Mon, 22 Jul 2024 06:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721655965; cv=none;
        d=google.com; s=arc-20160816;
        b=owaOduoezqtKnoBkhGThjFtd+VgWrTRh1Qb4AraMbFW7f4gLtqbQFhYX28YvCHypPZ
         Y3IjHLvJRbI9+s3pAoD0nhMe2lBQENhguoUHKpx81WDTh5MCiBDOGDXN28iwzZ1vGPPW
         TW357wgVvaMOp5DaQDl9yYmi3NRAwCNDSxQgbeadj7YeXvF5IkiBepPny7JUr9cUlKeF
         CwLAQ/1C4KGOAMEq+6k031sAWohnBP7pRSmhBHr5AhkIvVMy8WkX/WNhyqwcP0SvQziB
         UXJ5+6y9eJkzn9Uko/0oQh+ay3p+4R+x2kxhrT6/rlnNx3533kEUKqT+NKFMbxPUgm5v
         iwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=h1S+clwP/TZuDrKvne/r3SuOltONs3dTcst4Q7Tl+qU=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=BV2LJKVXiUgNFAtUz3FhuByDawQds3+1v7YzKOLPuA99hufXEHi3YEQDFVK56xzj15
         qScQscdTTkG25jKhn8rofi/lUI1BbpxLMe0W2s8w2OjkmWpiHxZxiobJ1Vz50JOIpGvK
         7yzGc187azcRS7wmLF2enpBE+KIu2X1RKIm1rAGHOmNGdRDvM6+YerdJ+0LEk2QiVcVJ
         6AUKfJ+K7byAQCgLmG6e0iWt7N3sTNc+yattPhCNxdV5bHCN88WXE1Msk2++olpDuwNG
         uRvlvkKaX+9VYoXY2MtX8w2Wd4xwx5lr82o/dEzUlKcCZMFGX7BvJptMLJuUxKdiG+D9
         1X8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KSvDLhJY;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.18])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac7c5b17si75077716d6.155.2024.07.22.06.46.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 06:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.18 as permitted sender) client-ip=198.175.65.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KSvDLhJY;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721655965; x=1753191965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0VBpJCAF/a++txWiiz/0DTFqCVwBxK6I/Uf6ZwYzsFM=;
  b=KSvDLhJYaHfYzUjvMXpS23p9EwgEOL+/y6+DacdEZMiKF0cxjba3QS/4
   dibEI0OZgs7qxR++rW6SVEzfEmO8p5kGuyZqbtnxw/3DTLvh8K4lb0PIO
   8Ql99koJAUYc9t1JeKu5OVPSuO4WBUxRAsA3y/E8lzIHGQpQpm93siJQ+
   8uA5j0cwDut3vMwUGd9R8oThfObF8lrHrcbqHyjB98j1kXrGZPQFqu5bK
   QElePOQGs1NYrVRObRMRgHFZb/Xho/UAJWEzGj8MaG4vh46AqUCiWRMi0
   Xe1oKORMQ0urAzPm6OiFqHQUYJEmGnqmVBdmBzxDcaQsNkYTioiMiZWX5
   g==;
X-CSE-ConnectionGUID: HiYMwCQWT3el2GGBbws2xQ==
X-CSE-MsgGUID: ao2s2z4TTsqzMIH3r7na/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19353445"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="19353445"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 06:46:04 -0700
X-CSE-ConnectionGUID: KKANULJsSICbrZipe8omdg==
X-CSE-MsgGUID: A6QV4KAqQ76bUFCb7lKS1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="51954848"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jul 2024 06:45:59 -0700
Date: Mon, 22 Jul 2024 22:01:42 +0800
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
Subject: Re: [PATCH 1/8] hw/core: Make CPU topology enumeration arch-agnostic
Message-ID: <Zp5mRrjuZWnE+9gz@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-2-zhao1.liu@intel.com>
 <875xsx4l13.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xsx4l13.fsf@pond.sub.org>
X-TUID: 9l4/3gNCkO4A

Hi Markus,

On Mon, Jul 22, 2024 at 03:24:24PM +0200, Markus Armbruster wrote:
> Date: Mon, 22 Jul 2024 15:24:24 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 1/8] hw/core: Make CPU topology enumeration
>  arch-agnostic
> 
> One little thing...
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Cache topology needs to be defined based on CPU topology levels. Thus,
> > define CPU topology enumeration in qapi/machine.json to make it generic
> > for all architectures.
> >
> > To match the general topology naming style, rename CPU_TOPO_LEVEL_SMT
> > and CPU_TOPO_LEVEL_PACKAGE to CPU_TOPO_LEVEL_THREAD and
> > CPU_TOPO_LEVEL_SOCKET.
> >
> > Also, enumerate additional topology levels for non-i386 arches, and add
> > a CPU_TOPO_LEVEL_DEFAULT to help future smp-cache object de-compatibilize
> > arch-specific cache topology settings.
> >
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> 
> [...]
> 
> > diff --git a/qapi/machine-common.json b/qapi/machine-common.json
> > index fa6bd71d1280..82413c668bdb 100644
> > --- a/qapi/machine-common.json
> > +++ b/qapi/machine-common.json
> > @@ -5,7 +5,7 @@
> >  # See the COPYING file in the top-level directory.
> >  
> >  ##
> > -# = Machines S390 data types
> > +# = Common machine types
> >  ##
> >  
> >  ##
> > @@ -19,3 +19,48 @@
> >  { 'enum': 'CpuS390Entitlement',
> >    'prefix': 'S390_CPU_ENTITLEMENT',
> >    'data': [ 'auto', 'low', 'medium', 'high' ] }
> > +
> > +##
> > +# @CpuTopologyLevel:
> > +#
> > +# An enumeration of CPU topology levels.
> > +#
> > +# @invalid: Invalid topology level.
> > +#
> > +# @thread: thread level, which would also be called SMT level or
> > +#     logical processor level.  The @threads option in
> > +#     SMPConfiguration is used to configure the topology of this
> > +#     level.
> > +#
> > +# @core: core level.  The @cores option in SMPConfiguration is used
> > +#     to configure the topology of this level.
> > +#
> > +# @module: module level.  The @modules option in SMPConfiguration is
> > +#     used to configure the topology of this level.
> > +#
> > +# @cluster: cluster level.  The @clusters option in SMPConfiguration
> > +#     is used to configure the topology of this level.
> > +#
> > +# @die: die level.  The @dies option in SMPConfiguration is used to
> > +#     configure the topology of this level.
> > +#
> > +# @socket: socket level, which would also be called package level.
> > +#     The @sockets option in SMPConfiguration is used to configure
> > +#     the topology of this level.
> > +#
> > +# @book: book level.  The @books option in SMPConfiguration is used
> > +#     to configure the topology of this level.
> > +#
> > +# @drawer: drawer level.  The @drawers option in SMPConfiguration is
> > +#     used to configure the topology of this level.
> > +#
> > +# @default: default level.  Some architectures will have default
> > +#     topology settings (e.g., cache topology), and this special
> > +#     level means following the architecture-specific settings.
> > +#
> > +# Since: 9.1
> > +##
> > +{ 'enum': 'CpuTopologyLevel',
> > +  'prefix': 'CPU_TOPO_LEVEL',
> 
> Why set a 'prefix'?
> 

Because my previous i386 commit 6ddeb0ec8c29 ("i386/cpu: Introduce bitmap
to cache available CPU topology levels") introduced the level
enumeration with such prefix. For naming consistency, and to shorten the
length of the name, I've used the same prefix here as well.

I've sensed that you don't like the TOPO abbreviation and I'll remove the
prefix :-).

Thanks,
Zhao

