Received: by 2002:a05:7022:140a:b0:7e:eb73:5b3b with SMTP id pd10csp466003dlb;
        Tue, 4 Jun 2024 08:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgvLporK3rsnEMypjEm/vbD+EMUdGvdCl07u6hHKGWfBF+tEx5/rhOntwQgTq7MQIrrW5CwSolxzwiCMWM48MdqQLzfz8L
X-Google-Smtp-Source: AGHT+IHT7VOdOAc2Xfh+azkV+cJc8wX2RBpwZiUBc2rdk3cSp+5i/oXWBQNQYMN3Flf8UllmUdJQ
X-Received: by 2002:a05:6214:460e:b0:6ad:7af0:e361 with SMTP id 6a1803df08f44-6aecd5a2fdemr142861816d6.16.1717516406495;
        Tue, 04 Jun 2024 08:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717516406; cv=none;
        d=google.com; s=arc-20160816;
        b=P1WTNj5+QnuOyC0NeqzupWuaGenIcSN3XtsosoUvY/UlF+UA5F0PGPV1TC3YbDo857
         ZkVSyf6X0/oU1YMz5v/IsqI8sXM5Xh3jMFhKtJISgw5ayXJ3kDTNvGQEnWAcoKZ+Dpny
         yKOj8m0ltB5mTqio2m1QZYEF0NNScY2BBwrWnaLrRB4Wa1iC2fILNsx0YufeleFPxFRA
         PlYz4j/pCyrpY3UbIbh3JtybIiCvKRHKMsqrPFbChNXhKBCQ8Djx1qfITrDmxbsj0Rlq
         PAhYoCgmZ3jHEsCpeExe9dkfz3fsXrKr9RxpixIlIt9WmpYQsyKZuGsQDrgkzMukWHPs
         8u3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=n+030oGbHr6xGnJOHQbipcKXUuy81Ch8pOaYTkNLNhI=;
        fh=eksEV5KT1sVE/IK41AR7cgQCYnC5ZfsQnQiPp5E3e3c=;
        b=hsKVkn7BApaIEcJUfY0fpvzQ1sOZ8SgRi7kO371vbhNBb46xE0YTrI++T4ykPJ/dKA
         Kg9KMAdTtpWKlMFnr+7SCyemD8N49Gqn519DSjS09XDFDSX5JoJVm20uQusJ7X16ZsF/
         etG6pBGzaIHEVi8X0v/AdYu5BlJAPT0gjWxNf5N4JMRsqjd0k0djuMZbjCSAwCzsF22Z
         fx9wGtdksZ01Qzo+jthW/ELxwF6MSocMIa6OolyLpxUbDXvLwEfauAJsB7mcCAaY5zjw
         gX2WEQ0u/WonQy77TzQR1CsK8KBUDKUyVPc/KQi7ZrtYoFmrpwSl5h6SM2JA7szUy7Vp
         OLZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JOF46bTC;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b42bf6dsi114399216d6.473.2024.06.04.08.53.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 08:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JOF46bTC;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717516406; x=1749052406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IBh4cRZ5Gd6TO3btnDYuVa+tLMDOJq9bXCSjiq19S8g=;
  b=JOF46bTCM6MLv0gxrklcxH2h6SMAS2fL2oenQslkSwAzP+mbrDz4y/9M
   2oY+On6Jv31vlUqgpS1lVEVeTSP5PAJKxPRTl+MaedyjBdKiCVuHpe1Jm
   Ja1nSVEUOAsn8rCtNt0osbR+1DE80kgNsDugXEXyElXSfFK6llMwAXCJg
   tFPExjcu75OsWG7R4aT6R4yjvYtxX4Eo3tOyFwSHLY0crsnVltkRUCXUC
   flPhiM3I5qdWapw75+2kEnP9VBotwrnU/li9GljsT4clduNGrKvo99FdQ
   W/4S6M+g9kO4NXf1TgzPgtVawjqj645Zi/mNdR//T7lOIb8QvRSWlvXbC
   w==;
X-CSE-ConnectionGUID: DUWPhHPNTUmI7G+b49jIOg==
X-CSE-MsgGUID: iX9sI0xmQ9+LKFZLDIW9Sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="31571570"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="31571570"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 08:53:24 -0700
X-CSE-ConnectionGUID: ksKFdK+nR9iExjBaDjLmig==
X-CSE-MsgGUID: 1nv681oTSPinEBAr57ciog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="60472787"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2024 08:53:19 -0700
Date: Wed, 5 Jun 2024 00:08:45 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
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
Subject: Re: [RFC v2 3/7] hw/core: Add cache topology options in -smp
Message-ID: <Zl88DYwLE3ScDF5F@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
 <20240530101539.768484-4-zhao1.liu@intel.com>
 <87sext9jfo.fsf@pond.sub.org>
 <Zl7fHop_GaiJt6AE@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zl7fHop_GaiJt6AE@redhat.com>
X-TUID: isu5yiGO6gxM

Hi Markus and Daniel,

(I replied to both of you because I discussed the idea of cache object
at the end)

On Tue, Jun 04, 2024 at 10:32:14AM +0100, Daniel P. Berrang¨¦ wrote:
> Date: Tue, 4 Jun 2024 10:32:14 +0100
> From: "Daniel P. Berrang¨¦" <berrange@redhat.com>
> Subject: Re: [RFC v2 3/7] hw/core: Add cache topology options in -smp
> 
> On Tue, Jun 04, 2024 at 10:54:51AM +0200, Markus Armbruster wrote:
> > Zhao Liu <zhao1.liu@intel.com> writes:
> > 
> > > Add "l1d-cache", "l1i-cache". "l2-cache", and "l3-cache" options in
> > > -smp to define the cache topology for SMP system.
> > >
> > > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > 
> > [...]
> > 
> > > diff --git a/qapi/machine.json b/qapi/machine.json
> > > index 7ac5a05bb9c9..8fa5af69b1bf 100644
> > > --- a/qapi/machine.json
> > > +++ b/qapi/machine.json
> > > @@ -1746,6 +1746,23 @@
> > >  #
> > >  # @threads: number of threads per core
> > >  #
> > > +# @l1d-cache: topology hierarchy of L1 data cache. It accepts the CPU
> > > +#     topology enumeration as the parameter, i.e., CPUs in the same
> > > +#     topology container share the same L1 data cache. (since 9.1)
> > > +#
> > > +# @l1i-cache: topology hierarchy of L1 instruction cache. It accepts
> > > +#     the CPU topology enumeration as the parameter, i.e., CPUs in the
> > > +#     same topology container share the same L1 instruction cache.
> > > +#     (since 9.1)
> > > +#
> > > +# @l2-cache: topology hierarchy of L2 unified cache. It accepts the CPU
> > > +#     topology enumeration as the parameter, i.e., CPUs in the same
> > > +#     topology container share the same L2 unified cache. (since 9.1)
> > > +#
> > > +# @l3-cache: topology hierarchy of L3 unified cache. It accepts the CPU
> > > +#     topology enumeration as the parameter, i.e., CPUs in the same
> > > +#     topology container share the same L3 unified cache. (since 9.1)
> > > +#
> > >  # Since: 6.1
> > >  ##
> > 
> > The new members are all optional.  What does "absent" mean?  No such
> > cache?  Some default topology?

I suppose "absent" means using the the default arch-specific cache topo.

For example, x86 has its own default cache topo. my purpose in providing
this interface is to allow users to override the default (arch-specific)
cache topology.

Daniel suggested in cover letter's reply that I could add the value
¡°default¡±, I think omitting it would have the same effect as setting it
to ¡°default¡±, and omitting it shouldn't be regarded as disabling a
particular cache, since the interface is only about the topology!

> > Is this sufficiently general?  Do all machines of interest have a split
> > level 1 cache, a level 2 cache, and a level 3 cache?

The different cache support can be extended by such control fields in
MachineClass:

typedef struct {
    ...
    bool l1_separated_cache_supported;
    bool l2_unified_cache_supported;
    bool l3_unified_cache_supported;
} SMPCompatProps;

For example, if a machine with l1 unified cache appears, it can add the
"l1_unified_cache_supported", and add "l1" option in QAPI.

Then separate L1 cache has ¡°l1i¡± and ¡°l1d¡± options, and unified L1 cache
should have ¡°l1¡± option.

> Level 4 cache is apparently a thing
> 
> https://www.guru3d.com/story/intel-confirms-l4-cache-in-upcoming-meteor-lake-cpus/
> 
> but given that any new cache levels will require new code in QEMU to
> wire up, its not a big deal to add new properties at the same time.
> 
> That said see my reply just now to the cover letter, where I suggest
> we should have a "caches" property that takes an array of cache
> info objects.

Yes, I agree.

> > 
> > Is the CPU topology level the only cache property we'll want to
> > configure here?  If the answer isn't "yes", then we should perhaps wrap
> > it in an object, so we can easily add more members later.
> 
> Cache size is a piece of info I could see us wanting to express

For the simplicity and clarity, I think it's better to only cover
topology in -smp, including the current CPU topology and the cache
topology I'm working on.

I've thought about the idea of converting the cache into the device,
which in turn could define more properties for the cache.

This one is mostly in connection with the previous qom-topo idea (aka
abstracting CPU topology device [1]):

    -device cpu-socket,id=sock0 \
    -device cpu-die,id=die0,parent=sock0 \
    -device cpu-core,id=core0,parent=die0,nr-threads=2 \
    -device cpu-cache,id=cache0,parent=core0,level=l1,type=inst \
    -device cpu-cache,id=cache1,parent=core0,level=l1,type=data \
    -device cpu-cache,id=cache2,parent=core0,level=l2,type=unif \
    -device cpu-cache,id=cache3,parent=die0,level=l3,type=unif

Cache device idea was mainly to support hybrid cache topology, because
Intel client hybrid architecture has hybrid cache topology (on MTL,
compute die has a L3 and SOC die has no L3).

Based on such a cache device, we can define more properties for the
cache and also meet flexible topology requirements at the same time.

This cache device I had planned to implement after the cpu topo device.
It's a long and hard way to go, I wonder if this future I'm portraying
will alleviate your concerns about more cache properties support. ;-)

Soon I'm also planning to refresh the qom-topo series again, reducing
hack changes, deleting dead codes, etc. Maybe it shouldn't be called
qom-topo, because I want to display topology tree in qom path by
qdev_set_id().

[1]: https://lore.kernel.org/qemu-devel/20231130144203.2307629-1-zhao1.liu@linux.intel.com/

> > Two spaces between sentences for consistency, please.
> >

Sure, thanks!

Regards,
Zhao
