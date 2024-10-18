Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp677321njb;
        Fri, 18 Oct 2024 01:45:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVC9jBjVRe4ixJR52JvHE2xMFcb4EVyoB+GoQnOIdMEFAPxLQlyviJvSaRbqJ5zM4QTOPbSwWP3B7k47Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH4rFYtyKkgokJaXOj32RxkZHyl5O+byw7FfPfvvxPN7ICdSqVFo4XqfoCIdmG1izTPK66L
X-Received: by 2002:a05:622a:152:b0:45d:56e4:1ffc with SMTP id d75a77b69052e-460aee2c93fmr17909391cf.51.1729241129562;
        Fri, 18 Oct 2024 01:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729241129; cv=none;
        d=google.com; s=arc-20240605;
        b=jwSq8D4Or9psKjP6Ha8x9VJg8Z4yicTS4XmJzNdw0MM/fLdoIawxUwIj6BZkorXSMg
         shlj86X4p7SyNLAeOQLMaALVSeKs1e8gRWxclC8UcBnND0PGRyPFEG+LZ00W8eus6LMm
         d8ST2cDXvEYPbY9igJmv2MAkggwQVCwGqPqgVNKnv4rxk2rx5yYGQIsrMID0YvTbcE2e
         2gKSKNrA6AyVaC3MwCzGOORt4Y+RaaQS5U5KRKqhq4Q+u8RVxK7HFrZ+bdYhsP+7zHmx
         JKGbOPXvGP436JrMJlFV3bizhMPUMIE1bWAkkvFxr2c819f8TspVmPyS+VcwY/c+Do3y
         3S3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=78E+gqjHuUrms4r7Xm7ew09KkmlWndNofkXcn2EVqxQ=;
        fh=QQOpfZPnaut2u+2c3+U9/oBko8UmIVD4d84QZgiM70o=;
        b=F8KwWh0yaER76dDXr/sKaqLHZfaHz34BFxeO1h/C8Ag28rgfxEdeQecV2zbd0vk8Co
         gjCflGkSFOYuWsBvEWwhYq3WYsvmXnGsrjmZnpQDfyjuTsFbfSk2OwS9a9P1LiyIJuCt
         QoowTX+j8danSaQ4+KQFxQbn/CS9AkjT8nL+FPISVLtAQO16TuoCOnZfi8lLBjX+WUrY
         l/3IadY6hXwP7n+Y20LsJMi71nonLs599q+j9rpQV7z5xyHixkQvlo4ddLih7NzDyXhW
         94ObmPaJ+nwpdLsRQiaaEOiAiYvdjieAWN/YCM+/+EqsWNE7EYAvt6e/cWAMe1NePFzA
         D8ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=bQzmOJiv;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.11 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.11])
        by mx.google.com with ESMTPS id d75a77b69052e-460aea40ce9si11949921cf.356.2024.10.18.01.45.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2024 01:45:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.11 as permitted sender) client-ip=198.175.65.11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=bQzmOJiv;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.11 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729241129; x=1760777129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1hzdX0SAedJp2ZbWcaKLwBlRgfiMbk9wET1obgyYSH0=;
  b=bQzmOJivvAR2UBnMeGhNUbS7h6vMEKz8QUF6D8RhuVNEXl0jH5Tm2Aop
   KMvDH02IyklC++WmCiGelpgchY3quUqNVAe0eVskvF+eFNW/3cwUL4xUV
   huySY5rRFm824A6NezmNbRAma93RG0iOxRhL51PJzwj8uOE7RXdlff+ml
   z9vYVF2WgHVgDd1GwhWyAbWhSRTCaLoTbW3JTPiGFILvHnMDTky+gnEFi
   KP2RdRjTZ+drkNYGpwq02sGG0l5XAmgBzD/z2VGi4AWCgyeEQW8Ff7V7I
   ZoyvCrKroNOHa1Fj4S0gV1PfMioh0vVL0fW5qprsF96f5oDLHpQsnhniK
   g==;
X-CSE-ConnectionGUID: SoKO84uaRR2+rULAQSzCzQ==
X-CSE-MsgGUID: p9pt1JPSSkikSGAW/qjL9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39305837"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39305837"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 01:45:26 -0700
X-CSE-ConnectionGUID: BIYrmkbwQmuSAshnFlJ3Ug==
X-CSE-MsgGUID: vn3Ep1RJQbukF0MCtS2swQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="102105402"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2024 01:45:21 -0700
Date: Fri, 18 Oct 2024 17:01:36 +0800
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
Message-ID: <ZxIj8CWZd7u+cysK@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-2-zhao1.liu@intel.com>
 <ZxEte1KBwWuCdkb1@redhat.com>
 <ZxHJri+rgdGKf/0L@intel.com>
 <ZxIUd9tMi9o1UVOS@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxIUd9tMi9o1UVOS@redhat.com>
X-TUID: q1lS43W9ojlO

On Fri, Oct 18, 2024 at 08:55:35AM +0100, Daniel P. Berrangé wrote:
> Date: Fri, 18 Oct 2024 08:55:35 +0100
> From: "Daniel P. Berrangé" <berrange@redhat.com>
> Subject: Re: [PATCH v3 1/7] hw/core: Make CPU topology enumeration
>  arch-agnostic
> 
> On Fri, Oct 18, 2024 at 10:36:30AM +0800, Zhao Liu wrote:
> > Hi Daniel,
> > 
> > > > -/*
> > > > - * CPUTopoLevel is the general i386 topology hierarchical representation,
> > > > - * ordered by increasing hierarchical relationship.
> > > > - * Its enumeration value is not bound to the type value of Intel (CPUID[0x1F])
> > > > - * or AMD (CPUID[0x80000026]).
> > > > - */
> > > > -enum CPUTopoLevel {
> > > > -    CPU_TOPO_LEVEL_INVALID,
> > > > -    CPU_TOPO_LEVEL_SMT,
> > > > -    CPU_TOPO_LEVEL_CORE,
> > > > -    CPU_TOPO_LEVEL_MODULE,
> > > > -    CPU_TOPO_LEVEL_DIE,
> > > > -    CPU_TOPO_LEVEL_PACKAGE,
> > > > -    CPU_TOPO_LEVEL_MAX,
> > > > -};
> > > > -
> > > 
> > > snip
> > > 
> > > > @@ -18,3 +18,47 @@
> > > >  ##
> > > >  { 'enum': 'S390CpuEntitlement',
> > > >    'data': [ 'auto', 'low', 'medium', 'high' ] }
> > > > +
> > > > +##
> > > > +# @CpuTopologyLevel:
> > > > +#
> > > > +# An enumeration of CPU topology levels.
> > > > +#
> > > > +# @invalid: Invalid topology level.
> > > 
> > > Previously all topology levels were internal to QEMU, and IIUC
> > > this CPU_TOPO_LEVEL_INVALID appears to have been a special
> > > value to indicate  the cache was absent ?
> > 
> > Now I haven't support this logic.
> > x86 CPU has a "l3-cache" property, and maybe that property can be
> > implemented or replaced by the "invalid" level support you mentioned.
> > 
> > > Now we're exposing this directly to the user as a settable
> > > option. We need to explain what effect setting 'invalid'
> > > has on the CPU cache config.
> > 
> > If user set "invalid", QEMU will report the error message:
> > 
> > qemu-system-x86_64: Invalid cache topology level: invalid. The topology should match valid CPU topology level
> > 
> > Do you think this error message is sufficient?
> 
> If the user cannot set 'invalid' as an input, and no QEMU interface
> will emit, then ideally we would not define 'invalid' in the QAPI
> schema at all.
> 
> This woudl require us to have some internal only way to record
> "invalid", separately from the topology level, or with a magic
> internal only constant that doesn't clash with the public enum
> constants. I guess the latter would be less work e.g. we could
> "abuse" the 'MAX' constant value
> 
>    #define CPU_TOPOLOGY_LEVEL_INVALID CPU_TOPOLOGY_LEVEL_MAX
> 
> or separate it with a negative value
> 
>    #define CPU_TOPOLOGY_LEVEL_INVALID -1
>

This's a clever idea. Thank you!

Rgards,
Zhao
