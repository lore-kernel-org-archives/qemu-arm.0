Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1841806njb;
        Mon, 7 Oct 2024 03:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/vHo8WtKW6apKugATBrM2nwHkwb+0sudFy+HwaM0VjSyt85+UCWDqXu60GXVcNroQxmQlf2FrwmMpfA==@linaro.org
X-Google-Smtp-Source: AGHT+IHPIBIDF7jtoQelwY6LjzAzqO1d0UmYMkFf/2HNmKQsORN8PKg3CzT+Wjb15Z9+XaKlYtZi
X-Received: by 2002:a05:620a:1929:b0:7ad:832a:4063 with SMTP id af79cd13be357-7ae6f432b64mr1924665385a.7.1728297124477;
        Mon, 07 Oct 2024 03:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728297124; cv=none;
        d=google.com; s=arc-20240605;
        b=LTKKGPzLM+NFB/AMAzao/xETa7HHl6s1JPd+5mCCOQl183ZQYPupHZrDlDRrAMucbE
         Yw1g38dSmzoGtfaFRUDcKVIrY+T8ysMgf+1JT89W1yfqBn8Tr4VMwXgdqzudhRGm5qXy
         YLbMHFJg6jexZ/2b0ZOl5A+A5lBQ5w/QpFi3+Wtg/acVKn5NILhz73LtsTXuuaHl8fKy
         /iNEk3jj1QuPUenyukRl5Dab0reVoV+qW5neEVor7i1c12fOROq7ZS90xY+zriiU9gz+
         AFc17kXQypsKDYrqhuXg7XcWGVZ2XWTrlNJD5blW5g+eyH03aTYgOItoVTLE1LwvC0n1
         ILvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=dMxNs745ifIU23g7W6L4nOenxslXJTdkkSFRI1htkIo=;
        fh=lIQK4w5u8hPKTUFD1dgvaVT/MYYXdD5M0XwdCDzhkt4=;
        b=lcNiLjeYxHU/UDPCaAAIgpb3ov+AxOSCIotbn4cih5lKEO8rIm4PfZrCRpuS0GIhXJ
         orsXiNWQAYEE17LpG6bD97MPJPz1MgSAjbriIVYuNqQwK8ia2eoEwE0xdEQ90iAyiGG0
         UV1x4xnFsy2aKvLCgx1fjBraRwDt3vIN7Y6UHQVvgIHIkmGjQURGYGKFIOqlkofIRKi+
         kIB03Dmvtb0igxHmoPlLofuoxLBIyKr2ObgTG784nFWfM6U0kXURy9fEZ0nq++ero5Yc
         MiuzvxbX3+fNHibGpPn/ILPajobGgy9Z4CdoWEjCB9bV+RWnLysg0ZaLq2rp3hNUgYZP
         Mquw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=T5Npg+ln;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.11 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.11])
        by mx.google.com with ESMTPS id af79cd13be357-7ae7562ca41si571815785a.161.2024.10.07.03.32.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 03:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.11 as permitted sender) client-ip=192.198.163.11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=T5Npg+ln;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.11 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728297124; x=1759833124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jhJUK+AWFll4gfSxpcVeHGVJ440uyTmTNkzlK2H16Kk=;
  b=T5Npg+lnAie4IFieZV99/Ba0KNCWkprBSBxHTziBaVxd3ezWTpXLVGbN
   ZNVzy3qVLZz3n9RWWZwrr5dKTovTE/XeTAVYl7JlMF7AYGhaJ3vFq/Vg4
   OnCJxREZepd9Y066Mph7mJg+9Lj8O84wSc9nEUoR6ksVUHlgzl1rQjmPi
   HkXA/nTn9h2OGk3V75Ax6OIrHFmY1ZDJgDFGbvptlN0J/3PIvpySmWvhG
   4AhJ0ejNUc5fg68D/KUMZ3OKzZxRvDN4DGGNerspy8Zz9CfQ+ATb6t52X
   vVZVjzge+OZ0vmpGbbDgy2fmvYchbAZ68UCk5EC7tGtz5vgcs95i92Lib
   w==;
X-CSE-ConnectionGUID: wA9R/Qb6QD+KPiKZa9mxvQ==
X-CSE-MsgGUID: YLh8TZu4T86hNExcamatNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38044286"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="38044286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 03:32:02 -0700
X-CSE-ConnectionGUID: o2wxnFLcQ8aCs2GXkI/Wpg==
X-CSE-MsgGUID: 9taj1YQOS2OUtO3z+NOWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="80401926"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa004.jf.intel.com with ESMTP; 07 Oct 2024 03:31:56 -0700
Date: Mon, 7 Oct 2024 18:48:07 +0800
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
Subject: Re: [PATCH v2 2/7] qapi/qom: Define cache enumeration and properties
Message-ID: <ZwO8Z6pABtp2Zfi3@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
 <20240908125920.1160236-3-zhao1.liu@intel.com>
 <20240917095126.000036f1@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917095126.000036f1@Huawei.com>
X-TUID: zLHStZAeCthJ

Hi Jonathan,

Thanks for your review and feedback!

[snip]

> > Note, define cache topology based on CPU topology level with two
> > reasons:
> > 
> >  1. In practice, a cache will always be bound to the CPU container
> >     (either private in the CPU container or shared among multiple
> >     containers), and CPU container is often expressed in terms of CPU
> >     topology level.
> >  2. The x86's cache-related CPUIDs encode cache topology based on APIC
> >     ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
> >     relies on also requires CPU containers to help indicate the private
> 
> Really trivial but CPU Containers are a different ACPI concept.
> For PPTT they are referred to as Processor Groups. Wonderfully they
> 'might match a Processor Container in the namespace' which rather implies
> they might not.  In QEMU they always will because the next bit of the
> spec matters. "In that case this entry will match the value of the _UID
> method of the associated processor container. Where there is a match it must
> be represented."
> 
> So having said all that, CPU container is probably fine as a description.

Thanks for the explanation!

> >     shared hierarchy of the cache. Therefore, for SMP systems, it is
> >     natural to use the CPU topology hierarchy directly in QEMU to define
> >     the cache topology.
> > 
> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > Tested-by: Yongwei Ma <yongwei.ma@intel.com>
>
> Seems fine but my gut would be to combine this and next patch so we can
> see how it is used (assuming no one asked for it to be separate!)

No problem. I intended to make it easier to review the QAPI part, but
these two patches were simple enough that I was happy to combine them.

> Version numbers need an update I guess.

Ah, yes!

> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks!

> > +##
> > +# @SmpCachePropertiesWrapper:
> > +#
> > +# List wrapper of SmpCacheProperties.
> > +#
> > +# @caches: the list of SmpCacheProperties.
> > +#
> > +# Since 9.1
> 
> Needs updating to 9.2 I guess.

Yes, I think so, too.

Thanks,
Zhao

> > +##
> > +{ 'struct': 'SmpCachePropertiesWrapper',
> > +  'data': { 'caches': ['SmpCacheProperties'] } }
> 
