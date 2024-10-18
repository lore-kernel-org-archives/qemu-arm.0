Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp560900njb;
        Thu, 17 Oct 2024 19:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCJy0SkNmlD9BvpuSiNJj4S1RYun5XAqe1bTPEqlU/7RywVhud0m2J5cMK6GB8jHY1YuLpTfHnrDglfg==@linaro.org
X-Google-Smtp-Source: AGHT+IF9OSpLIE8UWC8WPOScPo0G5NzGOzbKprt0r6rAWwBX+vfEljuG7ZjW+POeYTKl8jUcR3oo
X-Received: by 2002:a05:6102:2ac4:b0:4a5:6f41:2132 with SMTP id ada2fe7eead31-4a5d6ac27f2mr1168509137.14.1729218024165;
        Thu, 17 Oct 2024 19:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729218024; cv=none;
        d=google.com; s=arc-20240605;
        b=Q89wlY1Ko4hCzrZ5eghxdFukZ2MqTZPnNA8Qb9WfhaaF37qwmJkLD648q2Xu8dZUKT
         Fg/nSvsgRqPe3Cl9hNeaZXPMvB9JpivHBhfKsByckgqro0tZDs8x7lW1JNL6tr6pgAnm
         bZS3ZyyE9rmN8z0mzYtD5IX8SfR7bEq4Hk8NKakX5r40lXZuMPnFUOl0AdXZEwcA/jZm
         a74sRfMi4sHbxcvkIINs2hg63TUAJesTsU7SW51fy4DEqR/EHqdgvD5OdFzAnQ9FsLd/
         x8N9SKjZGJVhh6hdcBWieKd2K/V2qv4JCjhsoY/4Pu+wn8YX+6U+WLXyGEVDqFkDMYze
         tL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=q9gyJFY9ZYkoelzIOtFCsyrxszUHypFZeotYTK8LlBU=;
        fh=QQOpfZPnaut2u+2c3+U9/oBko8UmIVD4d84QZgiM70o=;
        b=jHN+E2c48A+2RCIC7WR+Xw1saFElV6rZKXbbyvN9Q1Vuaj5pBUVKWgNGNJuMYQM8I2
         cSuIQy/WS2g1hrbr0e3ytzTGu+g7SMs8yLKi5bO3dm/ipc8Hb4/KRkB/9rF/4I0TfAK5
         8Mtwmp9owMQO6TMnX/J5lde0dLSiCSnJB27zp2dz7BE87JwXlTEUCbNkP9St6Kb7Ic/K
         whWdWHKYOlQwBRDqLskm3+CjaUbGgwKVvP9Bq8JRyLv9U7/LzRHTEyXdYSruQhCaFjjh
         6phXhnIlM+TcLRGEg4++ZxhOKLZn74xg+ZlbqUPfk7A6a1eqLB0juZvsbeKGQwgjcQfy
         Ukgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JbQHSlyi;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460aea57ee6si6581441cf.393.2024.10.17.19.20.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 19:20:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.17 as permitted sender) client-ip=198.175.65.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JbQHSlyi;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.17 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729218024; x=1760754024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8PKsoPgR4Ld+C0xF/qZFXE3weaPnEMpOVlDjd59wIDw=;
  b=JbQHSlyiod/ypeogmVVv0sUOyiKRLqMwhaXGt5Zpaj4nhUhSjXFhSiN7
   xbhJXyDx3hhThKP5kjcJJNDhOSg4yYHIVa/vdqByIYgBAHbbtSsJ9ZR0F
   iYawaCdLlN+tWJN651yMypd0TPbAFZrX7C8OsuHB9Ps54mxipaxRfOaCM
   6PnSoPswGmFlCANzvBbALoWnwK2T/zHKTYL0x1Oislcs+5NgNuBCaloX+
   zDap/R1xZE8aUIL7jyWiSGg9TIUigoE9nNbOljKbtijqUfBI6G57arn49
   u6s/+6ZpbDJWAlb1RKCEJMFLUIjoBy8zMCB2qB9El7BCUgzq5tE2d8ofY
   A==;
X-CSE-ConnectionGUID: zOf/iwp1SO+f8B3BeV+ygw==
X-CSE-MsgGUID: GANyxDLMRDSR3UI/aczOBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28827904"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="28827904"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 19:20:22 -0700
X-CSE-ConnectionGUID: L+YNHYlyR+6QwKMonGQkjw==
X-CSE-MsgGUID: GChpiH98T9WKlXP4N1D6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83557602"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2024 19:20:14 -0700
Date: Fri, 18 Oct 2024 10:36:30 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH v3 1/7] hw/core: Make CPU topology enumeration
 arch-agnostic
Message-ID: <ZxHJri+rgdGKf/0L@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-2-zhao1.liu@intel.com>
 <ZxEte1KBwWuCdkb1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxEte1KBwWuCdkb1@redhat.com>
X-TUID: DSPRXGVwFwMz

Hi Daniel,

> > -/*
> > - * CPUTopoLevel is the general i386 topology hierarchical representation,
> > - * ordered by increasing hierarchical relationship.
> > - * Its enumeration value is not bound to the type value of Intel (CPUID[0x1F])
> > - * or AMD (CPUID[0x80000026]).
> > - */
> > -enum CPUTopoLevel {
> > -    CPU_TOPO_LEVEL_INVALID,
> > -    CPU_TOPO_LEVEL_SMT,
> > -    CPU_TOPO_LEVEL_CORE,
> > -    CPU_TOPO_LEVEL_MODULE,
> > -    CPU_TOPO_LEVEL_DIE,
> > -    CPU_TOPO_LEVEL_PACKAGE,
> > -    CPU_TOPO_LEVEL_MAX,
> > -};
> > -
> 
> snip
> 
> > @@ -18,3 +18,47 @@
> >  ##
> >  { 'enum': 'S390CpuEntitlement',
> >    'data': [ 'auto', 'low', 'medium', 'high' ] }
> > +
> > +##
> > +# @CpuTopologyLevel:
> > +#
> > +# An enumeration of CPU topology levels.
> > +#
> > +# @invalid: Invalid topology level.
> 
> Previously all topology levels were internal to QEMU, and IIUC
> this CPU_TOPO_LEVEL_INVALID appears to have been a special
> value to indicate  the cache was absent ?

Now I haven't support this logic.
x86 CPU has a "l3-cache" property, and maybe that property can be
implemented or replaced by the "invalid" level support you mentioned.

> Now we're exposing this directly to the user as a settable
> option. We need to explain what effect setting 'invalid'
> has on the CPU cache config.

If user set "invalid", QEMU will report the error message:

qemu-system-x86_64: Invalid cache topology level: invalid. The topology should match valid CPU topology level

Do you think this error message is sufficient?

Thanks,
Zhao
