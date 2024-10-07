Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1830245njb;
        Mon, 7 Oct 2024 03:05:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOT1J+EYHrHYhJGfvOGE7uLFvo6fTYazs+IOGSxlrdr6Iu9MESnTu4FQqnZAfxiSiRI1ICfd6hl9I9JA==@linaro.org
X-Google-Smtp-Source: AGHT+IE+60yZL9KDiE98pxaC87sQN6dnYl2tzvj0iHnmjkP7D0npvOhqa0e+tABK/B+76ftiSd/C
X-Received: by 2002:a05:622a:1910:b0:45d:8513:f29d with SMTP id d75a77b69052e-45d9ba4d7b7mr142697811cf.20.1728295521429;
        Mon, 07 Oct 2024 03:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728295521; cv=none;
        d=google.com; s=arc-20240605;
        b=B6BH7dL8Ehb0TZNlG6zRpF8N1V4rSl+gwI+A5Mxj5f2gfp//yPR217/3C6Qk6mhNtb
         Fn4Xt9bt2LssyQanbZkkYa4oj/34f+x1H3y7ZM/dYLnnsZe14qxPJEnDsH9RUlOh04pT
         1a03YHBVSPjQ9uxVtuSyHqjU8nhcV51hXliDEW8zdb1yinUvO4Nq/kmS8tkvG/UFQoBg
         k3ggJSJX66kBQBFgvOG332kKlNOxmnqwhO3t1YTfTzn0cgHq/Wut99bGAdCBMIOdxqhu
         APgyqzkyHasulc4BQ7lRVM7gvtcGYvGd11Sfn91H6L9dxcAnTUS79tHMQZwjo0o9t6km
         +eFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=5DoIycgnFDwRV8CeG+1PARjTZG99bxRG72OQ3X0uJkg=;
        fh=GKgCDuvS7tBXdMALRfuSc8T4QLSb1ZpnuHleJb8HiKg=;
        b=QVnW4Yu3y3CT8jCfZu7CgFT1PiKz/DcaI+HQUxg9esSzxRQY7xrGNllM05geib5c1U
         J65I1u7GQmEA2xES2XK+9O0We+NDd3t1fX/1MMybHgQLG27bWR10D0sIy43/upAJ9OiM
         e4PVuHdTbJu3hn01RPYHCwmt4hF7hpt5t0p39Z6hVgtVlhY/axZY4p8nYAHQahfjNwye
         DPtz6E2kTpiSBJxI4cTeU32NBJaQT7cAlL4FWQaipnEn20rbZNBb4ZsN/5LVyZ8hRY36
         r9vt8Z6/RnMPcqzAa4SHlWCpu/jZoiUXFFIW6x8tii09m0GMwok5JJAmmNPpDfygieal
         kqNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nuB1d5LH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da76ca284si57884301cf.693.2024.10.07.03.05.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 03:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=nuB1d5LH;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728295521; x=1759831521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AnOcALsZJg/wxyrcnpW+cGt1cV5NfTexgZo0XTBcLLw=;
  b=nuB1d5LHozc7FOpOkiMVe76PP0e3iEnGleCvG5hlGBuQawdt7Mz5Xsln
   YqSz2TqWYAGKFNkuGCP59ruRTQxkp3HO7S7RDS2IvrQaT6B3tNVkTzJYi
   SZRVOfCaT9TXLwc6tNnUJ8h1g7I8YlL8xOIU66dRJIbs+0P6A3KwEqBKH
   P4PCu8ZW/6XOrK6Rxvzxgfmbqf2rkcLKdoLv+tUDqcM2SYlTjL58xUfk9
   XCrzwJAMpYVytKjvG7y9K4JVunCrPCtHIE1Q2pLSc8Kt3JQ8YdR+Y3P04
   p9fkgrUkNwwMqnZ+Y4BOgigWbnvZg1NGxnKsdpPIMINJIhrHFIMM5d+ae
   g==;
X-CSE-ConnectionGUID: I8mDQ+PsRf2Mhio3E4mLmQ==
X-CSE-MsgGUID: 4yXK0kESSLqa3ejkNo+0nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27319850"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27319850"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 03:05:19 -0700
X-CSE-ConnectionGUID: 7gJQIEZzT8mpzKFWqrHFdQ==
X-CSE-MsgGUID: ogeD7LVYT4KOliHP51MW6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75258677"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 07 Oct 2024 03:05:13 -0700
Date: Mon, 7 Oct 2024 18:21:24 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
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
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v2 6/7] i386/cpu: Update cache topology with machine's
 configuration
Message-ID: <ZwO2JIMJ+lX0N61h@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
 <20240908125920.1160236-7-zhao1.liu@intel.com>
 <20240911110028.00001d3d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911110028.00001d3d@huawei.com>
X-TUID: 0W3sRNQsv+N3

Hi Ali,

[snip]

> > +
> > +    /*
> > +     * TODO: Add a SMPCompatProps.has_caches flag to avoid useless
> > Updates
> > +     * if user didn't set smp_cache.
> > +     */
> Hi Zhao,
> 
> Thanks for sending this patchset so quickly. I really appreciate the
> TODO already :)

Welcome! And I'm also sorry for a long silence. Now I'm back from the
vacation and will keep pushing this series forward.

> It also helps me avoid going through every single
> layer, especially when I want to avoid matching system registers in
> ARM, particularly when there's no description in the command line.

Great! I also noticed your patch for this "TODO" and will help you
review it soon.

Regards,
Zhao

> > +    x86_cpu_update_smp_cache_topo(ms, cpu);
> > +
> >      qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
> >  
> >      if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || ms->smp.cpus >
> > 1) {
> 
