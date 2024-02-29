Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp204297eja;
        Wed, 28 Feb 2024 22:51:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdXhKj5MS39bNs3CGIrTpbybrk41MUjjKsQDvuf49hj/5QFMZGAX8O/bw24H7PvkTdIF9GLC98BwzC9+TxcQvXKsiII/pu
X-Google-Smtp-Source: AGHT+IH/nzAlTsLDHMNwPmo0VrZO6vT3bgYFN79fTUl/KGX66LuGYQm4K45Bzs8H0oHO+ZzU60pX
X-Received: by 2002:a05:622a:449:b0:42e:80bb:f25b with SMTP id o9-20020a05622a044900b0042e80bbf25bmr1368890qtx.60.1709189466017;
        Wed, 28 Feb 2024 22:51:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709189466; cv=none;
        d=google.com; s=arc-20160816;
        b=fKW03VR93Ury8/Gq8JY1f72HDoXAjWN+ZqJSLNHcMs5RdiGz7WVTp1XWmvtg6TLtmY
         bu4Lf+ccMiA+Ka0uORr8OrybohXfObbtx5x6OoKWlp/sQt7UYxO4T0RGRTQwFAIepLeT
         uvvOm8TwuGAMsQ/XsKGsNbNo8sdZCMr8xYstzP2+haq2N7AfPvf2iPCIcLme9+rsECES
         Uz8/T8LyLDJZ5WvfaFLV70vNQaxJA/6/CMhx1UUy3001HfMYf5DaaRGCsSIfY0DZDoTn
         kcj+2H52/Nem95THr3OmJSBkTp5ATXF1+OAyR8ZhR0bzW0haUDOSSUiFt3NxWxnqW1uY
         fIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Lclo39EMpS7SrJbgFNsRGNA7RU0BU97MoTQuWyr2AMM=;
        fh=LdQSP/IzOsJu2Z1R2sMd/3tGWWnW7jyc4/vr7URDKK0=;
        b=giWd1kb2pveIREJm1QkLm4AE27K30F4myk9V5YVZyQxWXjdYdH4p76N3XbYM8ZKeNj
         MgoY7sm3e1ailQnmDAdORtKLxsVg4qUWX80NJnsrUDVdKrSzfafDz800cpma1YVn8Zup
         +WqaIQ/jPL5NT2Rvp9VuPZ/j9Ac/+SdmVTD0j8X0Y3CVoJvDlen5na6Qy0N+aU/Qkjd8
         3z6wugafdkuBnuNdfO5sL3XauVIeApG4YXVNDoayFggzy23hcVTIm/QhNrxNKKEpBHqi
         e92cWz+2bgorK3qIjjTliGuCP28i2kk+RdcMS8da5uq4JURM1IvdEROxRnDaq7TVXJGo
         4otw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=laIjna1d;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.16])
        by mx.google.com with ESMTPS id c14-20020ac8518e000000b0042e5a818adasi788250qtn.189.2024.02.28.22.51.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Feb 2024 22:51:05 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=198.175.65.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=laIjna1d;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709189465; x=1740725465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GS2K/1elXcA90zDdKMXQSx9HqJcMQIF3eoynkMWLosE=;
  b=laIjna1dWfuH2gJ8V9NnjwrheGf6oCklPWSJYX71uGEv7mGLKoRC1apx
   RDH23XL82VeZdGlHSnrTiVcWsLlfOvvDZeCsd3oZpJzdex6z+PNaOkOA0
   MNT5O6X47Ik54mA01zcSHYpoENCDENg6Nk4t7HFefXtXVSO+NhK1URg9c
   B+FfPnQeZAbr24WyJ/GdxrCC8OhdPXaFULs2EeW+8N9dygB93YwUJZE0N
   NTyqsQXtuy6vBM0zpOr6EHGRWRtb0PrOL97AAwjGwuODLSvoLeLSw3JQc
   gbhV1ml4ewYepmvAArkUDCOT5yKS5+OASETd1nAuCIUlA1VPV0gtYEIFm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3755275"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3755275"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 22:51:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7638819"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa009.fm.intel.com with ESMTP; 28 Feb 2024 22:50:58 -0800
Date: Thu, 29 Feb 2024 15:04:42 +0800
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
Subject: Re: [RFC 4/8] hw/core: Add cache topology options in -smp
Message-ID: <ZeAsijVdx6DO+1pP@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
 <20240220092504.726064-5-zhao1.liu@linux.intel.com>
 <BJSPR01MB05618A7D409C2DE3E408345C9C58A@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BJSPR01MB05618A7D409C2DE3E408345C9C58A@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
X-TUID: LoCeQjx6ShV8

Hi JeeHeng,

> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 426f71770a84..cb5173927b0d 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -886,6 +886,10 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> >          .has_cores = true, .cores = ms->smp.cores,
> >          .has_threads = true, .threads = ms->smp.threads,
> >          .has_maxcpus = true, .maxcpus = ms->smp.max_cpus,
> > +        .l1d_cache = g_strdup(cpu_topo_to_string(ms->smp_cache.l1d)),
> > +        .l1i_cache = g_strdup(cpu_topo_to_string(ms->smp_cache.l1i)),
> > +        .l2_cache = g_strdup(cpu_topo_to_string(ms->smp_cache.l2)),
> > +        .l3_cache = g_strdup(cpu_topo_to_string(ms->smp_cache.l3)),
>
> Let's standardize the code by adding the 'has_' prefix.

SMPConfiguration is automatically generated in the compilation, and its
prototype is defined in qapi/machine.json like the following code:


> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index d0e7f1f615f3..0a923ac38803 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1650,6 +1650,14 @@
> >  #
> >  # @threads: number of threads per core
> >  #
> > +# @l1d-cache: topology hierarchy of L1 data cache (since 9.0)
> > +#
> > +# @l1i-cache: topology hierarchy of L1 instruction cache (since 9.0)
> > +#
> > +# @l2-cache: topology hierarchy of L2 unified cache (since 9.0)
> > +#
> > +# @l3-cache: topology hierarchy of L3 unified cache (since 9.0)
> > +#
> >  # Since: 6.1
> >  ##
> >  { 'struct': 'SMPConfiguration', 'data': {
> > @@ -1662,7 +1670,11 @@
> >       '*modules': 'int',
> >       '*cores': 'int',
> >       '*threads': 'int',
> > -     '*maxcpus': 'int' } }
> > +     '*maxcpus': 'int',
> > +     '*l1d-cache': 'str',
> > +     '*l1i-cache': 'str',
> > +     '*l2-cache': 'str',
> > +     '*l3-cache': 'str' } }
> >

The gnerated complete structure is (will in build/qapi/qapi-types-machine.h):

struct SMPConfiguration {
    bool has_cpus;
    int64_t cpus;
    bool has_drawers;
    int64_t drawers;
    bool has_books;
    int64_t books;
    bool has_sockets;
    int64_t sockets;
    bool has_dies;
    int64_t dies;
    bool has_clusters;
    int64_t clusters;
    bool has_modules;
    int64_t modules;
    bool has_cores;
    int64_t cores;
    bool has_threads;
    int64_t threads;
    bool has_maxcpus;
    int64_t maxcpus;
    char *l1d_cache;
    char *l1i_cache;
    char *l2_cache;
    char *l3_cache;
};

The int member defined in qapi/machine.json will get their corresponding
status fields as has_* to indicate if user sets those int fields.

For str type, the status field is not needed since NULL is enough to
indicate no user sets that.

Thanks,
Zhao
