Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp210209eja;
        Wed, 28 Feb 2024 23:06:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXrfWlpLP52a/7IO15jHonSgaOAUnLoADj59ktX1XchRk+YbM99aH/fnp7IeRKC4QNmPBvrLEm+BgHQXlksjeY8Clm96L3b
X-Google-Smtp-Source: AGHT+IEgwJOketXOaJ3DUIJ4iOhcgdltQ8BglUGOyCJLcAOvsOuduAL78eACHaEiFMJh+UPbNUeA
X-Received: by 2002:a05:622a:104:b0:42e:168f:310d with SMTP id u4-20020a05622a010400b0042e168f310dmr1407587qtw.59.1709190363614;
        Wed, 28 Feb 2024 23:06:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709190363; cv=none;
        d=google.com; s=arc-20160816;
        b=fbWpez/QDJTX2tjTu3lmHKTlKHFgRw9k9XIoMGdrdAhvlaqlZw8kV4DnT+exFM5gKb
         oPHIbda9gmdqiYpkP/k8ypMEjP6i1p+FlTs1W1teeSQd41qPmavzdW6/PfPUeCabuHeQ
         Lnqh4YpbNAWg6EBBrQTLuD1tmX4hbA95ieG/hXFYiaYFDaOSuo/wRQ4kExjxUQjy0FDJ
         5MnBTU/rZHzYGxm7DYPR4Sw50y5HaFVxalIzC9v96o0a2Qt4BHkno0jUsniR4xycQa/h
         pmFXpMb1WkJd/bZHei090CgR1Ra4eHSHF6MeeUSVOQEBUKTOrXtQAaU19EQWv3htP9A8
         1E4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=fDu127NaKbQXspGx0t1HE+7JXtWwc+PibGUY9zypOP8=;
        fh=LdQSP/IzOsJu2Z1R2sMd/3tGWWnW7jyc4/vr7URDKK0=;
        b=jnECt2IfuAoKDrtlU2bYIdgu1rcgAcKz4U5Fy/6Vm0E7DCRTlgPaP0t5+jPOyWs2T6
         ikzqj8d8XlTqo26/qwJSXVBn8TeGuneIdXLVgY3ov6naZv1QX4ZCdTsKn+Ffij2L9WTK
         hsN4p0Fpw+IPYxZxHA9+bU6jQeDhceqtZHU32bFW7ofi5mcT5S6Wvr7NPHcMr1Q3vS+v
         ITa/Py/Sw60rcRlcJ/sEfL7k7UOGdxjQWDUZYDT8zToEQp72sryMnjFVWeo7U7brBMIQ
         bTukAl8ExYB3UEmFy3S/mFQTId7HkShoEGbShdfoFrMheRcjCOlLA/pRct/iZQ4LifN4
         MRMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cyzpHtaj;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.18])
        by mx.google.com with ESMTPS id 17-20020ac85911000000b0042e7efdd23esi872587qty.568.2024.02.28.23.06.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Feb 2024 23:06:03 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=198.175.65.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=cyzpHtaj;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709190363; x=1740726363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i9uq6y/awOo4nqggMPn0JAiBk7ClRoK07Pbq42o5yNE=;
  b=cyzpHtajw/skFpHzS6nwe3PGOLHhA1S45+IiVmXV86vUnLN7YmePnMbx
   HzFcYKIZBuLbTnykikQCN/pdR9bX13HBIn/Eko73Z/xG9qYWqou/nGIj8
   NCrZ6WwBvu768E0kIIHCT3hvklmUmsrMcFeTJHOEU1VrmKVto6hH//1Ve
   WYe7ejYwPqOUP5adBAZYI4VwF36DscqbXJmhUppiB9NZR4bkVZb04RzT+
   iQ0DEHjsHGLAmDdXCszceeRm7tUv04cnvSNqbniyUwbYMZFj1CzxbeMEW
   rq5CzdbqeBDJl+T3iUtwl2cJOwPri5S2y2jzwGJ/UckdOszJvaTANiW0T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3764830"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3764830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 23:06:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="8082618"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 28 Feb 2024 23:05:56 -0800
Date: Thu, 29 Feb 2024 15:19:40 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
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
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 6/8] i386/cpu: Update cache topology with machine's
 configuration
Message-ID: <ZeAwDIDdJff6SiiB@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
 <20240220092504.726064-7-zhao1.liu@linux.intel.com>
 <BJSPR01MB0561F3D87C67D4BCCA9E9C8D9C58A@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BJSPR01MB0561F3D87C67D4BCCA9E9C8D9C58A@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
X-TUID: CaOrV5jxssS0

Hi JeeHeng,

> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index d7cb0f1e49b4..4b5c551fe7f0 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -7582,6 +7582,27 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
> > 
> >  #ifndef CONFIG_USER_ONLY
> >      MachineState *ms = MACHINE(qdev_get_machine());
> > +
> > +    if (ms->smp_cache.l1d != CPU_TOPO_LEVEL_INVALID) {
> > +        env->cache_info_cpuid4.l1d_cache->share_level = ms->smp_cache.l1d;
> > +        env->cache_info_amd.l1d_cache->share_level = ms->smp_cache.l1d;
> > +    }
> > +
> > +    if (ms->smp_cache.l1i != CPU_TOPO_LEVEL_INVALID) {
> > +        env->cache_info_cpuid4.l1i_cache->share_level = ms->smp_cache.l1i;
> > +        env->cache_info_amd.l1i_cache->share_level = ms->smp_cache.l1i;
> > +    }
> > +
> > +    if (ms->smp_cache.l2 != CPU_TOPO_LEVEL_INVALID) {
> > +        env->cache_info_cpuid4.l2_cache->share_level = ms->smp_cache.l2;
> > +        env->cache_info_amd.l2_cache->share_level = ms->smp_cache.l2;
> > +    }
> > +
> > +    if (ms->smp_cache.l3 != CPU_TOPO_LEVEL_INVALID) {
> > +        env->cache_info_cpuid4.l3_cache->share_level = ms->smp_cache.l3;
> > +        env->cache_info_amd.l3_cache->share_level = ms->smp_cache.l3;
> > +    }
> > +
>
> I think this block of code can be further optimized. Maybe we can create
> a function called updateCacheShareLevel() that takes a cache pointer and
> a share level as arguments. This function encapsulates the common
> pattern of updating cache share levels for different caches. You can define
> it like this:
> void updateCacheShareLevel(XxxCacheInfo *cache, int shareLevel) {
>     if (shareLevel != CPU_TOPO_LEVEL_INVALID) {
>         cache->share_level = shareLevel;
>     }
> }
>

Good idea! Will try this way.

Thanks,
Zhao
