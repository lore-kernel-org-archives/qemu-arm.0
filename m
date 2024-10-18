Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp589499njb;
        Thu, 17 Oct 2024 21:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX88xjIvZKewm4z0Cez1CwAxPaEFwzK0ao48OUbLxfLMIwtF3J2dEsthlmfzE7j/kMIdoeARk2D0b6pHg==@linaro.org
X-Google-Smtp-Source: AGHT+IEDWeWlW9oTXKJM9JFjbBX/qe+1JNd9rkVtmJG/W4iulNTQP11oL5IrNzNcO7p/ZFgOgIil
X-Received: by 2002:a05:6214:451e:b0:6cb:f7dd:b6a8 with SMTP id 6a1803df08f44-6cde15379e0mr17536226d6.26.1729224621570;
        Thu, 17 Oct 2024 21:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729224621; cv=none;
        d=google.com; s=arc-20240605;
        b=LabopinLrEi1+Qo8PrBAYGahQmTMaPDQyQhT0iEdq28nTGZxT66sEEGlsZf/8VnxJj
         P8rHf1N/1XyVXG7ovgqr2v949LqXIFmd4v46HQ+VNDLTdZj8mpoThUTa+lon7It2lIBe
         a6lckwqAOwfXZdcGgHGuI56oT0WVUS1mdzPW3GutcCyuoPP50rPLPAgkfaBuL5lWvAWM
         XdPqei4SYQU+oz/U0OsUYFPTz868zJ4Fb9lq9DWLiAX5nvBDcUhcn9FgvLNWYJMnJGUn
         3rTSz6TVniCIViEVxIU9mTilpPo1M/lt/ieM8umIkwuO1xC89zObWEaEdrYS61KseuVG
         gyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=r4ZQ2iGttkarx5P5vdhvObeefKtTomz6u0CLLWMigUY=;
        fh=Lsr1I1WmDys7uDlzKwVM6idwSU5cyOX6HezNlE9gGr4=;
        b=NS7yE8ROPhlQ79rPtcadJAhan5IJmCDdPdB2L/CjMWUoCfg7q/OBHRt7VmWnMsYdCM
         GY/IMOK6YMraalJpjr7nIHOp8+Y5jzRZ9KH7CM/le/kMbJSQvsnD/PNg5JSZK5F7+oSg
         fXWB0swe40SezoUyHQFEfIXfUpEeFv4qeDYXDBY97VbVwFZ/OQVuGK4gSF42UBTnigMZ
         UU02wS4JRXG7Ktn7VvjyE+CUDOl4aw8b2q9fEFphIS/ptxRPVmqFWPgcswh9PNNK3stO
         xG5sA9WOr85i0u5sTYJg2/Kxc06kKrwmzuyJyfpcPR6gN+diF4tFsF3uR96UIFufphh8
         Ujdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZzyEPZAt;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.19])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cde111eae8si8582496d6.26.2024.10.17.21.10.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 21:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.19 as permitted sender) client-ip=198.175.65.19;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZzyEPZAt;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.19 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729224622; x=1760760622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UO03l2WlkbGHRPPhQ1W7PzTfDWTByRjaEAMTt2eMXo4=;
  b=ZzyEPZAtNhPizxkjU2pRYU1SJSva9tI3OAJL3gmKB8Djx2da1bvkpflV
   syVz6fcVzSmvUqCvc+39UUZJDUx61a0iHnQtTD7aRET0SOXXU/hz7x6xS
   skV6rJskmpV+hNqgqJKXKNi2M3v5VeuA05xMNUzRk3T491NRqlNb2Jf8a
   870v3ZJ4CIOxspkCW+LJw5v1mOZ74VF3K3+lVROZZMBjnUgQKRvMRZJ4C
   TzsxIFy5IDOsy2ZIdi0L0h0FWoJ51LFJs/ICVPP0G3VAZnsNfKV6MbcG4
   FRDrLq2lbzJ3NTQVTgZ28pvKf9Gtw0e6h3wOI7B35+5rZQumVesK78WPz
   w==;
X-CSE-ConnectionGUID: gUvKuKWrTcuCwXsctddJOw==
X-CSE-MsgGUID: SKm3A3/WS6CMVIB9HpSN7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28621475"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28621475"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 21:10:20 -0700
X-CSE-ConnectionGUID: 7spyyLOrQh+idBbFxWPV8A==
X-CSE-MsgGUID: 9z7etmnrTL23n7mV1FIhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="109568860"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa002.jf.intel.com with ESMTP; 17 Oct 2024 21:10:14 -0700
Date: Fri, 18 Oct 2024 12:26:29 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
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
Message-ID: <ZxHjdWSXyYKBAVWZ@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-2-zhao1.liu@intel.com>
 <0b884126-1fcb-40d2-9fc2-ab0944370fd9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b884126-1fcb-40d2-9fc2-ab0944370fd9@linaro.org>
X-TUID: rYHGS291VHIF

Hi Marcin,

On Thu, Oct 17, 2024 at 06:19:59PM +0200, Marcin Juszkiewicz wrote:
> Date: Thu, 17 Oct 2024 18:19:59 +0200
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Subject: Re: [PATCH v3 1/7] hw/core: Make CPU topology enumeration
>  arch-agnostic
> 
> W dniu 12.10.2024 o 12:44, Zhao Liu pisze:
> > Cache topology needs to be defined based on CPU topology levels. Thus,
> > define CPU topology enumeration in qapi/machine.json to make it generic
> > for all architectures.
> 
> I have a question: how to create other than default cache topology in C
> source?

What does "C source" mean? Does it refer to the C code for sbsa-ref?

There's the ARM change to support cache topology for virt machine:

https://lore.kernel.org/qemu-devel/20241010111822.345-5-alireza.sanaee@huawei.com/

If you're looking to store cache information for some common purposes,
you could also define a cache model structure similar to how it's done
for x86:

static const CPUCaches epyc_cache_info = {
    .l1d_cache = &(CPUCacheInfo) {
        .type = DATA_CACHE,
        .level = 1,
        .size = 32 * KiB,
        .line_size = 64,
        .associativity = 8,
        .partitions = 1,
        .sets = 64,
        .lines_per_tag = 1,
        .self_init = 1,
        .no_invd_sharing = true,
        .share_level = CPU_TOPOLOGY_LEVEL_CORE,
    },
    .l1i_cache = &(CPUCacheInfo) {
        .type = INSTRUCTION_CACHE,
        .level = 1,
        .size = 64 * KiB,
        .line_size = 64,
        .associativity = 4,
        .partitions = 1,
        .sets = 256,
        .lines_per_tag = 1,
        .self_init = 1,
        .no_invd_sharing = true,
        .share_level = CPU_TOPOLOGY_LEVEL_CORE,
    },
    .l2_cache = &(CPUCacheInfo) {
        .type = UNIFIED_CACHE,
        .level = 2,
        .size = 512 * KiB,
        .line_size = 64,
        .associativity = 8,
        .partitions = 1,
        .sets = 1024,
        .lines_per_tag = 1,
        .share_level = CPU_TOPOLOGY_LEVEL_CORE,
    },
    .l3_cache = &(CPUCacheInfo) {
        .type = UNIFIED_CACHE,
        .level = 3,
        .size = 8 * MiB,
        .line_size = 64,
        .associativity = 16,
        .partitions = 1,
        .sets = 8192,
        .lines_per_tag = 1,
        .self_init = true,
        .inclusive = true,
        .complex_indexing = true,
        .share_level = CPU_TOPOLOGY_LEVEL_DIE,
    },
};

> If I would like to change default cache structure for sbsa-ref then how
> would I do it?

I'm not very familiar with sbsa-ref. How is the cache model defined? Does
it use ACPI PPTT like the virt machine? If so, you can refer to the virt
machine series link I provided above.

> QEMU has powerful set of command line options. But it is hard to convert set
> of cli options into C code.

The CLI is currently quite complex, as different machine configurations
may vary. But don't worry. The general steps for enabling smp-cache here
are:

1. Set cache levels support in sbsa_ref_class_init(). You can refer my
   patch 6, to set ture for which cache level you need.
2. Then, the cli can support "-machine smp-cache" for sbsa-ref machine.
   You can refer the doc in my patch 6 to get the correct format.
3. Next, the MachineState will store the user's cache topology in "smp_cache".
   You can refer my patch 5 to get cache topology level from machine.
4. Finally, it's architecture-specific code, depending on whether you
   want to express cache information in the same pptt table as virt
   machine.

Regards,
Zhao

