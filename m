Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2542227njc;
        Tue, 23 Jul 2024 07:24:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOfgG1W4x/C1rM8LjiCv14EO/dk58PPqIwbn3kv5ZZnN97Vc+5C+HaW0EyE+7VWVIP/283+S+tEirv+ADN538rUzOb6bVy
X-Google-Smtp-Source: AGHT+IFa29PRLUZL6Gfq9VUDk/OoOYMak8HLHFrrxIW5DI+HrgHJEDBGBD16gmDUtx/0a17Wtsu5
X-Received: by 2002:a05:622a:489:b0:446:5b1a:da8c with SMTP id d75a77b69052e-44fa52ab457mr172874801cf.30.1721744687516;
        Tue, 23 Jul 2024 07:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721744687; cv=none;
        d=google.com; s=arc-20160816;
        b=W4Wofx5RSHWA+Obhf5HKv6U5VaJzJRbLJOXAOKhXXvrKvvSunjMGSsxh+ds1QFoLG8
         mb3a/jcM/HHkWea+NzbY0W38tvt9PJ10TlTofindPiYSdrmeUT6sy5ASQ6u3fYBEmp6C
         Bh+vZRg5QX3204y0o7KXJupps+3u2v5d0Eqv53P2KOdyqMhp7IUuIJFtE1rB7Pfu9RXz
         pOllJ2hadSvYd7vaQ5qFnVujEOhRRMkFrOJTU7BK26z8ETi1kc5ABLfkpo/MrqMRUOT/
         3V1JNSLDXgccXB0OT4GwFBCZxjqdb3Np0GYwqjJ/sd8eosO9FG31f6ysLC9FOF17Sztp
         RZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FFu5TaTb9h/h13Vxmh1VzR5t8/KGPSmmOaNiQ/XBEJA=;
        fh=QsxuhUBNyq2F7/1UitCRN/j+l2ZGR7FJ1BwILMh3mGA=;
        b=sscTDnD4pYR7CUXpWmXcJTYnxeYcQxGo/ki1bSJn2h3PATlpoWhD/QQvyMy0OBMwl4
         oJgPH5hx8EkXlUB2gvb9piiRftgoKyeS9L9irWdlugWxIU5Cx1ZaNrZd5vO2ZmlfDFco
         orqFuN5AzQraT6eEEMPY8Z4jPFva1FdKC/EMH7By3I9rEzcm8jW7CL3mhxHVNUu8vVpa
         bMceCRtHHGgYQcjGl6RdBb06UnFwUFZJK201sDEN58H0DsWXpk8I5UOmhCRKX+j1G8Uw
         Lup1AGkCvdr0DArnByjucLIo2HYeb3qj57oilS/NFu6vjtwYvWFMBWe4o4TwfKiC6Mqf
         JdqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="A5/IU6d/";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccfb5ecsi99752731cf.28.2024.07.23.07.24.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 07:24:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="A5/IU6d/";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721744688; x=1753280688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=596BeOYL/C3YYG4gWapj0nT35ULqFklo7XcRsaU+a60=;
  b=A5/IU6d/GT+/j5USyT6YpePFySatM2eRRL3sOIVMSjJiFRkiOlnGCoba
   FhGfXDGKzdSr31Pv2k7OF4XdcMklQaefB7xL53UKZK/Epwcx/A9SBGu1p
   0gqaJoXx7u3rdYjB4bg5DOTvumohFz+0Lh+CtRacgB1LW63hO7MQvqmEP
   q0UaW8+7Ozf/9o6VQFLO+d55JuNh4q3QqyDg3QMK5Z2IVqT80C3ThGtTl
   79mv4e8h5XN6RTc3jqzyTjvLj61rvUMSkMmDs1GsfXP9eb1Hg4rZGsIoe
   WGX4eLNJIqPLa0FWbIGm4WcQ2rnBb5OFahh7/FXx7iXGi+TTfxci4hBEw
   g==;
X-CSE-ConnectionGUID: +FrkmiXuSTyqSOlcdBrWYA==
X-CSE-MsgGUID: /SQqEVkaR2KVSn1INv/fjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="41900223"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="41900223"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 07:24:47 -0700
X-CSE-ConnectionGUID: hXBJ3rbPRQalpxStCGyFjw==
X-CSE-MsgGUID: 4ge7qOlyTr2QSQ3s+KE7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="52188455"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jul 2024 07:24:41 -0700
Date: Tue, 23 Jul 2024 22:40:25 +0800
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
Message-ID: <Zp/A2W5A0BqjRjR2@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
 <20240704031603.1744546-2-zhao1.liu@intel.com>
 <875xsx4l13.fsf@pond.sub.org>
 <Zp5mRrjuZWnE+9gz@intel.com>
 <87ed7kwh2x.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed7kwh2x.fsf@pond.sub.org>
X-TUID: zAyb1YzlVtnK

On Tue, Jul 23, 2024 at 12:14:30PM +0200, Markus Armbruster wrote:
> Date: Tue, 23 Jul 2024 12:14:30 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: Re: [PATCH 1/8] hw/core: Make CPU topology enumeration
>  arch-agnostic
> 
> Zhao Liu <zhao1.liu@intel.com> writes:
> 
> > Hi Markus,
> >
> > On Mon, Jul 22, 2024 at 03:24:24PM +0200, Markus Armbruster wrote:
> >> Date: Mon, 22 Jul 2024 15:24:24 +0200
> >> From: Markus Armbruster <armbru@redhat.com>
> >> Subject: Re: [PATCH 1/8] hw/core: Make CPU topology enumeration
> >>  arch-agnostic
> >> 
> >> One little thing...
> >> 
> >> Zhao Liu <zhao1.liu@intel.com> writes:
> >> 
> >> > Cache topology needs to be defined based on CPU topology levels. Thus,
> >> > define CPU topology enumeration in qapi/machine.json to make it generic
> >> > for all architectures.
> >> >
> >> > To match the general topology naming style, rename CPU_TOPO_LEVEL_SMT
> >> > and CPU_TOPO_LEVEL_PACKAGE to CPU_TOPO_LEVEL_THREAD and
> >> > CPU_TOPO_LEVEL_SOCKET.
> >> >
> >> > Also, enumerate additional topology levels for non-i386 arches, and add
> >> > a CPU_TOPO_LEVEL_DEFAULT to help future smp-cache object de-compatibilize
> >> > arch-specific cache topology settings.
> >> >
> >> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> >> 
> >> [...]
> >> 
> >> > diff --git a/qapi/machine-common.json b/qapi/machine-common.json
> >> > index fa6bd71d1280..82413c668bdb 100644
> >> > --- a/qapi/machine-common.json
> >> > +++ b/qapi/machine-common.json
> >> > @@ -5,7 +5,7 @@
> >> >  # See the COPYING file in the top-level directory.
> >> >  
> >> >  ##
> >> > -# = Machines S390 data types
> >> > +# = Common machine types
> >> >  ##
> >> >  
> >> >  ##
> >> > @@ -19,3 +19,48 @@
> >> >  { 'enum': 'CpuS390Entitlement',
> >> >    'prefix': 'S390_CPU_ENTITLEMENT',
> >> >    'data': [ 'auto', 'low', 'medium', 'high' ] }
> >> > +
> >> > +##
> >> > +# @CpuTopologyLevel:
> >> > +#
> >> > +# An enumeration of CPU topology levels.
> >> > +#
> >> > +# @invalid: Invalid topology level.
> >> > +#
> >> > +# @thread: thread level, which would also be called SMT level or
> >> > +#     logical processor level.  The @threads option in
> >> > +#     SMPConfiguration is used to configure the topology of this
> >> > +#     level.
> >> > +#
> >> > +# @core: core level.  The @cores option in SMPConfiguration is used
> >> > +#     to configure the topology of this level.
> >> > +#
> >> > +# @module: module level.  The @modules option in SMPConfiguration is
> >> > +#     used to configure the topology of this level.
> >> > +#
> >> > +# @cluster: cluster level.  The @clusters option in SMPConfiguration
> >> > +#     is used to configure the topology of this level.
> >> > +#
> >> > +# @die: die level.  The @dies option in SMPConfiguration is used to
> >> > +#     configure the topology of this level.
> >> > +#
> >> > +# @socket: socket level, which would also be called package level.
> >> > +#     The @sockets option in SMPConfiguration is used to configure
> >> > +#     the topology of this level.
> >> > +#
> >> > +# @book: book level.  The @books option in SMPConfiguration is used
> >> > +#     to configure the topology of this level.
> >> > +#
> >> > +# @drawer: drawer level.  The @drawers option in SMPConfiguration is
> >> > +#     used to configure the topology of this level.
> >> > +#
> >> > +# @default: default level.  Some architectures will have default
> >> > +#     topology settings (e.g., cache topology), and this special
> >> > +#     level means following the architecture-specific settings.
> >> > +#
> >> > +# Since: 9.1
> >> > +##
> >> > +{ 'enum': 'CpuTopologyLevel',
> >> > +  'prefix': 'CPU_TOPO_LEVEL',
> >> 
> >> Why set a 'prefix'?
> >> 
> >
> > Because my previous i386 commit 6ddeb0ec8c29 ("i386/cpu: Introduce bitmap
> > to cache available CPU topology levels") introduced the level
> > enumeration with such prefix. For naming consistency, and to shorten the
> > length of the name, I've used the same prefix here as well.
> >
> > I've sensed that you don't like the TOPO abbreviation and I'll remove the
> > prefix :-).
> 
> Consistency is good, but I'd rather achieve it by consistently using
> "topology".
> 
> I never liked the 'prefix' feature much.  We have it because the mapping
> from camel case to upper case with underscores is heuristical, and can
> result in something undesirable.  See commit 351d36e454c (qapi: allow
> override of default enum prefix naming).  Using it just to shorten
> generated identifiers is a bad idea.

Thanks for your clarification! I see, I will drop the prefix.

Regards,
Zhao

