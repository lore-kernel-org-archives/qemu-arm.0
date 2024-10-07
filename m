Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1850899njb;
        Mon, 7 Oct 2024 03:56:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh9pdyv+NssjB/EWXylPf+90TfIkZ6E+huQepP3loCmUlmueo67fHHZ1Cv14y3we79MkPWaDj5botk9g==@linaro.org
X-Google-Smtp-Source: AGHT+IFF3+bFQBpR2WZNTgTtZ27OlrTZLBWFu8PLSmwUoz2jFRTQXj/O8xDaj+Y5fuQRVPTT9eHS
X-Received: by 2002:ad4:4c0a:0:b0:6cb:a17a:8051 with SMTP id 6a1803df08f44-6cba17a81aamr118928356d6.21.1728298584581;
        Mon, 07 Oct 2024 03:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728298584; cv=none;
        d=google.com; s=arc-20240605;
        b=GdC3royYoICRzmiGqybwIcsdRCUbwIO7O5qLTI8w2taRd7znWY1R94tCDO0raNKaE7
         YrO7OY0PRseez1NAhv9jUSuvoMmexPxs3tFCFHgm+oCYTc91fgblj+BFLbEmKbZ4mzBF
         i+PbbwQrCbnZPGejb8LVXSUPJEAB6O9dquSepAflFVy6iHSw2uI8KPNQ4o1Hih8O/UYQ
         kdc77DvBPrv2hgRvvE5gP2vKGThgEvQ7JjSvO977EkbcHJYPeFrasPOQB9ali19XWxrj
         xp92tW/TGNrvnTmqmbR9B3kh77tX7h5KwqWV/G4P1OLLJg0i9847frcjRCaKf0Bi2L8I
         DSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=a+wslrW2zgthihZ4yaftW18wnMy7M8yZB7DAS8YLzOk=;
        fh=lIQK4w5u8hPKTUFD1dgvaVT/MYYXdD5M0XwdCDzhkt4=;
        b=JHS39Lp1cKfQVsxdfzWFjHLh0DqSU3pG3IHhapcTCEd6tBPWpnPhko9OrkpfiX0to5
         FIk6VwFaDEuDobTHetAhPdFAz3BpuwbKadTJ9F6aKqTfjJp7pDNQ4FqTVUIvwrb4RkN7
         dqYDK489EmFzpSdQe1SyZf7l+E5Qw4+23VswD5ff34G9V/mfeis1JRgqBDlYQfWAzmSv
         o4biJJ+IrRVBM/EWjmLD879QDFOvgHdEfKczSTblgrX+oGd0Yl+GrzG0w0gvW95YacG/
         6CzpoGwsHtVSQNc4TzMmUgi+OlUvb1dsIVD1KZVA4ajFCetbNuqpmCBAFUznvolc9H69
         ed3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mroJQgSb;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba47729c3si59275026d6.355.2024.10.07.03.56.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 03:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mroJQgSb;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728298584; x=1759834584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T1pqoP48M8l988CxvjsXIyPgrv7G7BxcyDze1mpyE/g=;
  b=mroJQgSbuSfqa0/Q79JnDO+QvEItopBugUTqTl7jnZ2vN5FeWYF6ILlP
   MZA14SMtZi8SrYMcR5gmlvEMObZJEyj3R5kQfrap9ZyK0WFuRGZ8ZsHXd
   4OyC4qsOI/z1Oq9E9k90+QBdiH+xA0T39g4lWisZSsGN4pCnwyLIhG7Hf
   DUOgzc1hJT+AWEDu1P+anb7GYA+RVRushNMuVtjj8Qsym7LOFHNJc2PKh
   1qMwIpCBRNEsn57qGQh+tXGpSnX+5WMGkfKrt6cGPXQzUFFb6PKL6xgKn
   /qYvC4SE4EE9Sjf6/DybCZ++SWv55BHPFp/qhcGsdbTLmHlL2X1xy8U61
   g==;
X-CSE-ConnectionGUID: MqxplelFT4u86DeMgD4W2Q==
X-CSE-MsgGUID: E+5e/OVXTKyqjR6PJdp7Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27326410"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27326410"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 03:56:23 -0700
X-CSE-ConnectionGUID: 2Af7pHfOTv2AjgyS9bkogA==
X-CSE-MsgGUID: g1Mh539KQ7ijgVOrKBrE7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75109678"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa007.fm.intel.com with ESMTP; 07 Oct 2024 03:56:19 -0700
Date: Mon, 7 Oct 2024 19:12:29 +0800
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
Subject: Re: [PATCH v2 4/7] hw/core: Check smp cache topology support for
 machine
Message-ID: <ZwPCHRRdYD6/S7GN@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
 <20240908125920.1160236-5-zhao1.liu@intel.com>
 <20240917095612.00007b5a@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917095612.00007b5a@Huawei.com>
X-TUID: +zmSOQHUCArW

On Tue, Sep 17, 2024 at 09:56:12AM +0100, Jonathan Cameron wrote:
> Date: Tue, 17 Sep 2024 09:56:12 +0100
> From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Subject: Re: [PATCH v2 4/7] hw/core: Check smp cache topology support for
>  machine
> X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
> 
> On Sun,  8 Sep 2024 20:59:17 +0800
> Zhao Liu <zhao1.liu@intel.com> wrote:
> 
> > Add cache_supported flags in SMPCompatProps to allow machines to
> > configure various caches support.
> > 
> > And check the compatibility of the cache properties with the
> > machine support in machine_parse_smp_cache().
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > Tested-by: Yongwei Ma <yongwei.ma@intel.com>
> 
> Just a few trivial comments inline.
> 
> FWIW with or without those changes.
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks!

[snip]

> > +        /*
> > +         * Allow setting "default" topology level even though the cache
> > +         * isn't supported by machine.
> I'd flip the comment as the condition is doing the opposite.

OK, it's more intuitive.

>             * Reject non "default" topology level if the cache isn't
>             * supported by the machine.
> > +         */
> > +        if (props->topology != CPU_TOPOLOGY_LEVEL_DEFAULT &&
> > +            !mc->smp_props.cache_supported[props->cache]) {
> > +            error_setg(errp,
> > +                       "%s cache topology not supported by this machine",
> > +                       CacheLevelAndType_str(node->value->cache));
> > +            return false;
> > +        }
> > +
> > +        if (!machine_check_topo_support(ms, props->topology, errp)) {
> > +            return false;
> > +        }
> > +    }
> > +
> > +    if (smp_cache_topo_cmp(&ms->smp_cache,
> > +                           CACHE_LEVEL_AND_TYPE_L1D,
> 
> Short line wrap.  Maybe combine the two lines above and similar
> cases.

Like this?

smp_cache_topo_cmp(&ms->smp_cache, CACHE_LEVEL_AND_TYPE_L1D,
                   CACHE_LEVEL_AND_TYPE_L2)

> Up to you though, I don't feel that strongly.
> 
> > +                           CACHE_LEVEL_AND_TYPE_L2) ||
> > +        smp_cache_topo_cmp(&ms->smp_cache,
> > +                           CACHE_LEVEL_AND_TYPE_L1I,
> > +                           CACHE_LEVEL_AND_TYPE_L2)) {
> > +        error_setg(errp,
> > +                   "Invalid smp cache topology. "
> > +                   "L2 cache topology level shouldn't be lower than L1 cache");
> > +        return false;
> > +    }
> > +

Regards,
Zhao
