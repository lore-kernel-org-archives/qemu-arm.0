Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1750346njc;
        Mon, 22 Jul 2024 00:18:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6jdrkcOW6vRH29WZ9RuZmTuaWRynBBBDDZFr0AfOZKzYKNAQhsF7niBbKuXA5tMHd3wnP2i9dmDHiOL3G4DMpVVznzRcc
X-Google-Smtp-Source: AGHT+IGZT7dMPJjo6JYlCU4oll3IuRmQtUsWzqEq41W4vhuZ7KLmnpW67wNPzSXp1UTIwQCKQCQ/
X-Received: by 2002:a05:620a:444a:b0:79f:a32:a69d with SMTP id af79cd13be357-7a1a13c3660mr1019462885a.58.1721632688342;
        Mon, 22 Jul 2024 00:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721632688; cv=none;
        d=google.com; s=arc-20160816;
        b=CsBD+S4fgPzYwdK4epNHeCZ/nypINn/vTNQv3XROQXXXmAwkJfkGWdnO18RSlWrRut
         LyYalWQzdwsMj48r16E9pQqnZUz7N4kSYLgxvFck2kYtrjPXP6n+su5iGk2GUPsCFkhB
         dcO9bK/4tfmGR9IVDUKepKQhrdn+IwCgg3CD0e+fXWYzfwB7dp8sqnTuWFpb8zp+tXQH
         SNrb3TBH+3p634/VNgiJ/C03mPy9B+A8zFVZSQ9yE8UxWXMG1rLccnhFIVT3AwlsnmTB
         YCyzs66Wcl0u8YOXKTvNK40erR21bYxtsg+DQBNBuM3ex/rbGMCarYvjXHjLyuPjmqst
         3Auw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=NxCpXopRbbe75ZaAahPUO7tY/5DN5VOOv4mV4NWo4YM=;
        fh=woCGvZWbxZ0Id2v555zrh1YlCDgccpNUdAFEFupHgoc=;
        b=wtUQHW6o7VRdcOM4IcUT4HD6tMKChl8UN5eJJHO8rOXWq9mbh5i0XhV1ro7Sosw8DQ
         SYuR/POQIW3ZKppySjQsvmA1PeSoTJosLLr5N5mnbREnuiZocGrVAGn7ItQaofgJ058y
         pElg33EPR2l3FeHEX3hZ+NIycNS06dMz9TCnY+mVgku+jfOkNT0Ct28XNtvQdG7DmxOm
         ZeKblLFMPIY8aklvvKeB/gOUgeKBe5LVASbZ5aQsZX1DD1ZGVRgIO6DWeQDROi6/EwAn
         A4H305BkSjzo/U+GZy+Jf8/L3GJbbfkGP1Myf3VrrWW+s36W/ha0UyJ3EVfRn41sy0m7
         /mgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Rg1Z3Yul;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.9])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdba113si75918301cf.355.2024.07.22.00.18.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 00:18:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.9 as permitted sender) client-ip=192.198.163.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Rg1Z3Yul;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721632688; x=1753168688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PWz4Ht0qlbweAS5o60cJFbGqE0cijiCuaXDbGXRSJ3Q=;
  b=Rg1Z3YulixMlJPIyXToxkEywi042Z8h7XMsbg1mDUqXL83p+ziSHgU2x
   efjD45agn/QXpC5ha7nZnn+6YiqzC6V3be/6PRNrxMG6svGrTm/HsX4Ps
   L6UraPF3Nd9pEO/rxIy5yXwqnV0/gGWsbhj3flrQfqWvSFyrSyvJnCCgr
   nabCOqt0PmVqogqWqqKorVvLlrdIYuYm025FXo4wjcy++YERyT2Qi4QsV
   4jJxWkbJeGVtKBZzQpGCDs+ju6GvQF329yRsstm66ZgjDomZEOkDvHMFb
   NIi2/XXlNrmSNiz+orcE1UMGhaPaA9bi2QVqQvfxGvIrrNhWXFHkLL0WY
   w==;
X-CSE-ConnectionGUID: Tg3/CQ8KQQKjDJa4HvpvZA==
X-CSE-MsgGUID: oq9JUc3ATiisdqJGrHQywA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="29843691"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="29843691"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 00:17:59 -0700
X-CSE-ConnectionGUID: S294LoMoTdKgKC7BnmarJQ==
X-CSE-MsgGUID: cpwVM0ovRbS97rMy+BQXAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="56350156"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jul 2024 00:17:53 -0700
Date: Mon, 22 Jul 2024 15:33:37 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
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
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org,
	kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [PATCH 0/8] Introduce SMP Cache Topology
Message-ID: <Zp4LUSXlwXqI880x@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704031603.1744546-1-zhao1.liu@intel.com>
X-TUID: ep7YusJo1GE3

Hi Daniel and Markus,

A gentle ping. Would you kindly have a look at this version of the API
design? If it could meet your satisfaction, I¡¯ll continue iterating.

Thanks,
Zhao

On Thu, Jul 04, 2024 at 11:15:55AM +0800, Zhao Liu wrote:
> Date: Thu, 4 Jul 2024 11:15:55 +0800
> From: Zhao Liu <zhao1.liu@intel.com>
> Subject: [PATCH 0/8] Introduce SMP Cache Topology
> X-Mailer: git-send-email 2.34.1
> 
> Hi all,
> 
> Since the previous RFC v2, I've reimplemented smp-cache object based on
> Daniel's comment (thanks Daniel!), which is both flexible to support
> current cache topology requirements and extensible.
> 
> So, I officially convert the RFC to PATCH.
> 
> Background on smp cache topology can be found in the previous RFC v2
> cover letter:
> 
> https://lore.kernel.org/qemu-devel/20240530101539.768484-1-zhao1.liu@intel.com/
> 
> The following content focuses on this series implementation of the
> smp-cache object.
> 
> 
> About smp-cache
> ===============
> 
> In fact, the smp-cache object introduced in this series is a bit
> different from Daniel's original suggestion. Instead of being integrated
> into -smp, it is created explicitly via -object, and the smp-cache
> property is added to -machine to link to this object.
> 
> An example is as follows:
> 
> -object '{"qom-type":"smp-cache","id":"cache0","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"module"},{"name":"l3","topo":"socket"}]}'
> -machine smp-cache=cache0
> 
> 
> Such the design change is based on the following 2 reasons:
>  * Defining the cache with a JSON list is very extensible and can
>    support more cache properties.
> 
>  * But -smp, as the sugar of machine property "smp", is based on keyval
>    format, and doesn't support options with JSON format. Thus it's not
>    possible to add a JSON format based option to -smp/-machine for now.
> 
> So, I decoupled the creation of the smp-cache object from the -machine
> to make both -machine and -object happy!
> 
> 
> Welcome your feedback!
> 
> 
> Thanks and Best Regards,
> Zhao
> ---
> Changelog:
> 
> Main changes since RFC v2:
>  * Dropped cpu-topology.h and cpu-topology.c since QAPI has the helper
>    (CpuTopologyLevel_str) to convert enum to string. (Markus)
>  * Fixed text format in machine.json (CpuTopologyLevel naming, 2 spaces
>    between sentences). (Markus)
>  * Added a new level "default" to de-compatibilize some arch-specific
>    topo settings. (Daniel)
>  * Moved CpuTopologyLevel to qapi/machine-common.json, at where the
>    cache enumeration and smp-cache object would be added.
>    - If smp-cache object is defined in qapi/machine.json, storage-daemon
>      will complain about the qmp cmds in qapi/machine.json during
>      compiling.
>  * Referred to Daniel's suggestion to introduce cache JSON list, though
>    as a standalone object since -smp/-machine can't support JSON.
>  * Linked machine's smp_cache to smp-cache object instead of a builtin
>    structure. This is to get around the fact that the keyval format of
>    -machine can't support JSON.
>  * Wrapped the cache topology level access into a helper.
>  * Split as a separate commit to just include compatibility checking and
>    topology checking.
>  * Allow setting "default" topology level even though the cache
>    isn't supported by machine. (Daniel)
>  * Rewrote the document of smp-cache object.
> 
> Main changes since RFC v1:
>  * Split CpuTopology renaimg out of this RFC.
>  * Use QAPI to enumerate CPU topology levels.
>  * Drop string_to_cpu_topo() since QAPI will help to parse the topo
>    levels.
>  * Set has_*_cache field in machine_get_smp(). (JeeHeng)
>  * Use "*_cache=topo_level" as -smp example as the original "level"
>    term for a cache has a totally different meaning. (Jonathan)
> ---
> Zhao Liu (8):
>   hw/core: Make CPU topology enumeration arch-agnostic
>   qapi/qom: Introduce smp-cache object
>   hw/core: Add smp cache topology for machine
>   hw/core: Check smp cache topology support for machine
>   i386/cpu: Support thread and module level cache topology
>   i386/cpu: Update cache topology with machine's configuration
>   i386/pc: Support cache topology in -machine for PC machine
>   qemu-options: Add the description of smp-cache object
> 
>  MAINTAINERS                 |   2 +
>  hw/core/machine-smp.c       |  86 ++++++++++++++++++++++++++++++
>  hw/core/machine.c           |  22 ++++++++
>  hw/core/meson.build         |   1 +
>  hw/core/smp-cache.c         | 103 ++++++++++++++++++++++++++++++++++++
>  hw/i386/pc.c                |   4 ++
>  include/hw/boards.h         |  11 +++-
>  include/hw/core/smp-cache.h |  27 ++++++++++
>  include/hw/i386/topology.h  |  18 +------
>  qapi/machine-common.json    |  97 ++++++++++++++++++++++++++++++++-
>  qapi/qapi-schema.json       |   4 +-
>  qapi/qom.json               |   3 ++
>  qemu-options.hx             |  58 ++++++++++++++++++++
>  target/i386/cpu.c           |  83 +++++++++++++++++++++--------
>  target/i386/cpu.h           |   4 +-
>  15 files changed, 478 insertions(+), 45 deletions(-)
>  create mode 100644 hw/core/smp-cache.c
>  create mode 100644 include/hw/core/smp-cache.h
> 
> -- 
> 2.34.1
> 
