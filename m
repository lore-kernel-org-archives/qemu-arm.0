Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2764778ejf;
        Tue, 27 Feb 2024 08:04:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/zsFN1ub+3Hj40A4miqt1e1XyKU4QUth/UXbc25p1jsdzF6A3tL+AZCRnNL9yENXpFEJo8NnkQgrDYfagTkj+F/xvNiqY
X-Google-Smtp-Source: AGHT+IF+oySkL4KiViaQKrkhEuNdHnRFCJ0Zfv/dVT6f7USS1Rw/h06NFSdf7vW1DChn4PaIAq/Z
X-Received: by 2002:a0c:e187:0:b0:68f:fd7:fddf with SMTP id p7-20020a0ce187000000b0068f0fd7fddfmr2333358qvl.50.1709049839916;
        Tue, 27 Feb 2024 08:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709049839; cv=none;
        d=google.com; s=arc-20160816;
        b=kOoiiD4n5Qq4oyqcKNpeZ/f/UKUR1Z3P9cFDSyj1e1J7NWgwIyWPdAdDUgD1EmoHXv
         xTC9NN8vPiLlE/qTojQTzRcpsf5qAMehG/qk1H1snGVdwCLjOWw9/UsL0OlfTqaHdWUG
         CQQ0hDLhXhBr4UjT3PMeU//jGXAWauQ3tLRAibIESfH/XgsEgPvLgUjokxVcvXGd0Whv
         eESgJebd5OzduTGOiiWYVPhDsnP3VSlURLkCB+hkzqF8nryR7x2SX7Byyz24JzcKcLPd
         hJCKt6bkSccjp/aXFgeMVBCVPhOyDnjb66V76UVq2ZNftHGft6zProQYlWPqUnD3gxXW
         Zmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=izfrkDJq2Mti7eQAUJ6O+OXclCy+KvYEGnStuYpmBfU=;
        fh=xE0kSxF0WCDtbQjOAA3CLpsfbwhKfJ9P7m1pAcwBsn8=;
        b=ksrOkJ5RO+E5evpFYt+mCz+JgiujOhB/iIOvCIPtZhiu0J4nnu08Y4uAbcoQ9/o22W
         n46+CZvzqRe9IaMFRqPqay0dMUYnoJ/5GGTjqbbo9WkJbl3je+nquHr9rZqFiNZLGBxb
         E5vshtzvl2u1n1IxFAXc2JVVtERQT1//ZjyQo3tvxBeWxtJYix3O6+FR1gPbSWi0IeIi
         +K6Fdtw1LDYtEFJbrch60Yn9wqqSgiXEdregljEk7NQVLs0Q/6TtcSjMasRBLjJQarTW
         fCWonoM72+f+SZQfT2yI/yt2eoTQMZzrSzUqbwJk/vR1hylnWg7lTC5foNEed2X5bc5q
         HvuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="UID/lf36";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id dv14-20020ad44eee000000b006901a0da160si423295qvb.568.2024.02.27.08.03.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2024 08:03:59 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="UID/lf36";
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709049839; x=1740585839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a4uC/JTyOpAvVrmW4y1AlyaBbiESaUUtpRpbAEFnTQE=;
  b=UID/lf36HQh43seyBIEKRe/aJ2tFxfTrhxPxxGxuDvHK6P6zGcqgI8X4
   MLJ33Y3LSUpM0samYb+Th9a0ymS3C1l69sn8IglenPbAnnxm7zy5uyovS
   q6kPXNSzR78tEuZdruUjkppfhtX/gEUaH/PRTHqzfcDS+1Y881GoR9//h
   n0alOtQg/yTta7pNQfOTtHnb8sTlvMV9A4RiA0FDC3yVyEG83knGVKS8i
   900y80gVB3xJfnvr7pDrNidDwZ/u3ejLzjdVRvjbqwoKNjzT6gmqD1/G9
   t0g+YOYyOoNNGLvLkcY2/wHDDK6xhlIjDTA0xIbXYK1KWSme0bONnt/ha
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3561330"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3561330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 08:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7049055"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 27 Feb 2024 08:03:44 -0800
Date: Wed, 28 Feb 2024 00:17:26 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5n77+9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?B?TWF0aGlldS1EYXVk77+9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 8/8] qemu-options: Add the cache topology description of
 -smp
Message-ID: <Zd4LFoegPx6EDfNy@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
 <20240220092504.726064-9-zhao1.liu@linux.intel.com>
 <20240226154734.00000d6e@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226154734.00000d6e@Huawei.com>
X-TUID: k50pcxzDn29d

Hi Jonathan,

On Mon, Feb 26, 2024 at 03:47:34PM +0000, Jonathan Cameron wrote:
> Date: Mon, 26 Feb 2024 15:47:34 +0000
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [RFC 8/8] qemu-options: Add the cache topology description of
>  -smp
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Tue, 20 Feb 2024 17:25:04 +0800
> Zhao Liu <zhao1.liu@linux.intel.com> wrote:
> 
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> 
> Hi,
> 
> A trivial comment, but also a possibly more significant one about
> whether the defaults are correctly verified.
> 
> Jonathan
> > ---
> >  qemu-options.hx | 54 ++++++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 47 insertions(+), 7 deletions(-)
> > 
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 70eaf3256685..85c78c99a3b0 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -281,7 +281,9 @@ ERST
> >  
> >  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> >      "-smp [[cpus=]n][,maxcpus=maxcpus][,drawers=drawers][,books=books][,sockets=sockets]\n"
> > -    "               [,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]\n"
> > +    "               [,dies=dies][,clusters=clusters][,modules=modules][,cores=cores]\n"
> > +    "               [,threads=threads][,l1d-cache=level][,l1i-cache=level][,l2-cache=level]\n"
> burns more characters but I'd go with
> l1d->cache=topo_level
> 
> As level for a cache has a totally different meaning!

Yes, good catch! Thanks.

> 
> > +    "               [,l3-cache=level]\n"
> >      "                set the number of initial CPUs to 'n' [default=1]\n"
> >      "                maxcpus= maximum number of total CPUs, including\n"
> >      "                offline CPUs for hotplug, etc\n"
> > @@ -290,9 +292,14 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> >      "                sockets= number of sockets in one book\n"
> >      "                dies= number of dies in one socket\n"
> >      "                clusters= number of clusters in one die\n"
> > -    "                cores= number of cores in one cluster\n"
> > +    "                modules= number of modules in one cluster\n"
> > +    "                cores= number of cores in one module\n"
> >      "                threads= number of threads in one core\n"
> > -    "Note: Different machines may have different subsets of the CPU topology\n"
> > +    "                l1d-cache= topology level of L1 D-cache\n"
> > +    "                l1i-cache= topology level of L1 I-cache\n"
> > +    "                l2-cache= topology level of L2 cache\n"
> > +    "                l3-cache= topology level of L3 cache\n"
> > +    "Note: Different machines may have different subsets of the CPU and cache topology\n"
> 
> >  
> >          -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32
> >  
> > +    The following sub-option defines a CPU topology hierarchy (2 sockets
> > +    totally on the machine, 2 dies per socket, 2 modules per die, 2 cores per
> > +    module, 2 threads per core) with 3-level cache topology hierarchy (L1
> > +    D-cache per core, L1 I-cache per core, L2 cache per core and L3 cache per
> > +    die) for PC machines which support sockets/dies/modules/cores/threads.
> > +    Some members of the CPU topology option can be omitted but their values
> > +    will be automatically computed. Some members of the cache topology
> > +    option can also be omitted and target CPU will use the default topology.:
> 
> Given the default could be inconsistent I wonder if we should 'push' levels
> up.  So if L2 not defined it is set either to default of equal to max of
> l1i and l1d level. L3 either default or same level as l2.

HMM, IIUC, I think there may be the case:

User sets L2 cache as per core and omits L3 cache. In this case, if L3
is per core (as L2) by default, how could we identify if that per core
L3 is the default or from user? We need to identify this becase x86's L3
is shared at die by default and L2 is shared at core level for current
CPU models.

To resolve this issue, we can add the status field in SMPCompatProps,
e.g., has_l3_cache, just like current SMPCompatProps.has_clusters, to
explicitly indicate that the L3 cache topo is set by user.

Then other caches also need the similar fields...It doesn't look as
simple as the current default invalid topology level.
 
> Won't always correspond to a sensible system so maybe just rejecting
> cases where default isn't possible is the best plan.  However I don't
> see that verification as the checks on higher levels are gated on them
> being specified.
> 
> > +
> > +    ::
> > +
> > +        -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
> > +             l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die
> > +
> >      The following sub-option defines a CPU topology hierarchy (2 sockets
> >      totally on the machine, 2 clusters per socket, 2 cores per cluster,
> >      2 threads per core) for ARM virt machines which support sockets/clusters
> 
