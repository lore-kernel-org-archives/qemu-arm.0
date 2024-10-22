Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3083077njb;
        Tue, 22 Oct 2024 06:36:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWn/yeQAI/1FWs53h51ccVqkwHWB+Kjm7kPuX2G+SnenXkD7hh1P7mfHsVVaXGqnvfpfEJOZENFKOygng==@linaro.org
X-Google-Smtp-Source: AGHT+IFkFNEojYlXMmMcKtKV8GBvnJjrNGK6fihBPN7oL3zf851dePIO2dbIvOta4Onhh8mrrQwc
X-Received: by 2002:a05:622a:1a11:b0:460:e5cb:41e0 with SMTP id d75a77b69052e-4610104d964mr29956771cf.39.1729604165675;
        Tue, 22 Oct 2024 06:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729604165; cv=none;
        d=google.com; s=arc-20240605;
        b=J2fArdC2cJzgzQcdGcl58DxB6OlKgQJqUZ6ek+yfN3ic0I6ee0x0T0qdJ514PJnRcO
         4vSdnHI2AwU7an2h4M+crMrYe9TT9c5/Ms/8Yb/M7M/OCI9hK1owKUs5TUOGzttt4fhW
         KK5NBsZB17ZItAdD3qPFp8wYQXw8GrtX6l2BhOYTC4VHMta5+A9VlN/rLq1oUdjoPzFW
         2BYKUxfVO84qvGkq1dLUgHzCf6baH6tilVh7vPv2yu5xIAEgmhIWsmEi/YWRwpCTkrYL
         frP9xDFaMabMVXc8PNBFomZZ2N/raS8opU3zIixDqKOogfrY7OwxUIR0a7IP6mTr0fnM
         xNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=wVrGsd8K39by0ksDwtPXftkk4qCrk1MR8Zccnr1i244=;
        fh=8h7shi0yfCpjWQfPt6G8q/Uhe70OsXawCuVYUheqDjs=;
        b=NQN/E3rmNKjXompzhuVfUn4/oEgFRjk+A+3NKwvtKX15jB+NemENqCZq43J00Hz5Qr
         jOSzYSRFM6mqpxX5tggduBaYoNaGdzec9Tjto1fbTNATQO8wH6vbIjgrIrYOSraHLTQU
         cM1KwbbOI8gpFF6+qIslURtPNUXue/uREaikYW9HeZ0adFp4srC7rmAI1dPaxfUdzfGO
         kRrvL8XKqA0uNOKr/1a5icuP5p+BptCCz6IJ/AcFvMLu9/ci3XlMIhDOg3uh3ArqOdz/
         Kl0fyv/4DJcBHkW5Pey5xfkh5EtFoZPge5+5XhBFziAWLikq4GVabYkXnNLTzwQOrv8l
         mLnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="VuI/qI//";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3da6a4esi63518621cf.747.2024.10.22.06.36.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 06:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="VuI/qI//";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729604165; x=1761140165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IMS/RVXZZpKiVSsba011nnusTI1R0H8RgF+np2LvyU8=;
  b=VuI/qI//NN4+n84NUgLOUy1+GwYOP8HDKx4/XncyJc3hAjeL/H3A8o5k
   IV/DfaUNBESKtVG7qyQ33N8khQNuggs5ZVwWDTTEH+yb7Vc4I2j92Q/ZE
   Df+hfqdXXJMFQBxT7nOvVQc9SdyksTLfh+IvKz+QcAsAOAAjcQfxlKP7U
   dUt1ZjmaS6Br75UlkisNo7wEDYd4gxRhDl/JBS7njFkjAYkFGFsON7CNr
   cc9FklEdGGt06XPncz6rFiuN9v6EU9OyP3eu5tbVMpTJhkt4XoNF+ZZRZ
   YAdQVjKVyF2v+qqFg8weRC7AhvwcVOrm2HwOp9etBhoL1No1z25xMuMBS
   w==;
X-CSE-ConnectionGUID: W8y5AUNSQKyYhy3uREbkDw==
X-CSE-MsgGUID: yAschAJeSpS8WXTIBOopag==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46603581"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46603581"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:36:03 -0700
X-CSE-ConnectionGUID: I9f+t04WTYKni3/RchTGxg==
X-CSE-MsgGUID: qbS7s9nSTJ2xp8XPbE+DuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79782206"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 06:35:58 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v4 0/9] Introduce SMP Cache Topology
Date: Tue, 22 Oct 2024 21:51:42 +0800
Message-Id: <20241022135151.2052198-1-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nKl6I64Taxj7

Hi all,

Compared with v3 [1], the v4 mainly changes these places:

 * Don't expose "invalid" enumeration in QAPI and define it by a
   macro instead. (new patch 1, and updated patch 2)

 * Check cache topology after the arch machine loads the user-
   configured cache model from MachineState.smp_cache and consumes
   the special "default" level by replacing it with the specific level.
   (new patch 5, and updated patch 7)

 * Describ the omitting cache will use "default" level and describ
   the default cache topology model of i386 PC machine. (updated
   patch 8)

All the above changes are tested and the interface design has remained
stable.

Meanwhile, ARM side has also worked a lot on the smp-cache based on
this series [2].

This series is based on the commit cc5adbbd50d8 ("Merge tag
'pull-tpm-2024-10-18-1' of https://github.com/stefanberger/qemu-tpm into
staging").

Welcome your feedback, and I appreciate your reviews. Hope our series
can catch up with the 9.2 cycle. :)


Background
==========

The x86 and ARM (RISCV) need to allow user to configure cache properties
(current only topology):
 * For x86, the default cache topology model (of max/host CPU) does not
   always match the Host's real physical cache topology. Performance can
   increase when the configured virtual topology is closer to the
   physical topology than a default topology would be.
 * For ARM, QEMU can't get the cache topology information from the CPU
   registers, then user configuration is necessary. Additionally, the
   cache information is also needed for MPAM emulation (for TCG) to
   build the right PPTT. (Originally from Jonathan)


About smp-cache
===============

The API design has been discussed heavily in [3].

Now, smp-cache is implemented as a array integrated in -machine. Though
-machine currently can't support JSON format, this is the one of the
directions of future.

An example is as follows:

smp_cache=smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=module,smp-cache.3.cache=l3,smp-cache.3.topology=die

"cache" specifies the cache that the properties will be applied on. This
field is the combination of cache level and cache type. Now it supports
"l1d" (L1 data cache), "l1i" (L1 instruction cache), "l2" (L2 unified
cache) and "l3" (L3 unified cache).

"topology" field accepts CPU topology levels including "thread", "core",
"module", "cluster", "die", "socket", "book", "drawer" and a special
value "default".

The "default" is introduced to make it easier for libvirt to set a
default parameter value without having to care about the specific
machine (because currently there is no proper way for machine to
expose supported topology levels and caches).

If "default" is set, then the cache topology will follow the
architecture's default cache topology model. If other CPU topology level
is set, the cache will be shared at corresponding CPU topology level.

Welcome your feedback and review!

[1]: Patch v3: https://lore.kernel.org/qemu-devel/20241012104429.1048908-1-zhao1.liu@intel.com/
[2]: ARM smp-cache: https://lore.kernel.org/qemu-devel/20241010111822.345-1-alireza.sanaee@huawei.com/
[3]: API disscussion: https://lore.kernel.org/qemu-devel/8734ndj33j.fsf@pond.sub.org/

Thanks and Best Regards,
Zhao
---
Changelog:

Main changes since Patch v3:
 * Stopped exposing "invalid" enumeration in QAPI and define it by a
   macro instead. (Dainel)
 * Checked cache topology after the arch machine loads the
   user-configured cache model from MachineState.smp_cache and consumes
   the special "default" level by replacing it with the specific level.
   (Daniel)
 * Described the omitting cache will use "default" level and described
   the default cache topology model of i386 PC machine. (Daniel)

Main changes since Patch v2:
 * Updated version of new QAPI structures to v9.2. (Jonathan)
 * Merged the QAPI change and smp-cache property support of machine
   into one commit. (Jonathan)
 * Picked Alireza's patch to add a has_caches flag.
 * Polished english and coding style. (Jonathan)

Main changes since Patch v1:
 * Dropped handwriten smp-cache object and integrated cache properties
   list into MachineState and used -machine to configure SMP cache
   properties. (Markus)
 * Dropped prefix of CpuTopologyLevel enumeration. (Markus)
 * Rename CPU_TOPO_LEVEL_* to CPU_TOPOLOGY_LEVEL_* to match the QAPI's
   generated code. (Markus)
 * Renamed SMPCacheProperty/SMPCacheProperties (QAPI structures) to
   SmpCacheProperties/SmpCachePropertiesWrapper. (Markus)
 * Renamed SMPCacheName (QAPI structure) to SmpCacheLevelAndType and
   dropped prefix. (Markus)
 * Renamed 'name' field in SmpCacheProperties to 'cache', since the
   type and level of the cache in SMP system could be able to specify
   all of these kinds of cache explicitly enough.
 * Renamed 'topo' field in SmpCacheProperties to 'topology'. (Markus)
 * Returned error information when user repeats setting cache
   properties. (Markus)
 * Renamed SmpCacheLevelAndType to CacheLevelAndType, since this
   representation is general across SMP or hybrid system.
 * Dropped machine_check_smp_cache_support() and did the check when
   -machine parses smp-cache in machine_parse_smp_cache().

Main changes since RFC v2:
 * Dropped cpu-topology.h and cpu-topology.c since QAPI has the helper
   (CpuTopologyLevel_str) to convert enum to string. (Markus)
 * Fixed text format in machine.json (CpuTopologyLevel naming, 2 spaces
   between sentences). (Markus)
 * Added a new level "default" to de-compatibilize some arch-specific
   topo settings. (Daniel)
 * Moved CpuTopologyLevel to qapi/machine-common.json, at where the
   cache enumeration and smp-cache object would be added.
   - If smp-cache object is defined in qapi/machine.json, storage-daemon
     will complain about the qmp cmds in qapi/machine.json during
     compiling.
 * Referred to Daniel's suggestion to introduce cache JSON list, though
   as a standalone object since -smp/-machine can't support JSON.
 * Linked machine's smp_cache to smp-cache object instead of a builtin
   structure. This is to get around the fact that the keyval format of
   -machine can't support JSON.
 * Wrapped the cache topology level access into a helper.
 * Split as a separate commit to just include compatibility checking and
   topology checking.
 * Allow setting "default" topology level even though the cache
   isn't supported by machine. (Daniel)
 * Rewrote the document of smp-cache object.

Main changes since RFC v1:
 * Split CpuTopology renaimg out of this RFC.
 * Use QAPI to enumerate CPU topology levels.
 * Drop string_to_cpu_topo() since QAPI will help to parse the topo
   levels.
 * Set has_*_cache field in machine_get_smp(). (JeeHeng)
 * Use "*_cache=topo_level" as -smp example as the original "level"
   term for a cache has a totally different meaning. (Jonathan)
---
Alireza Sanaee (1):
  i386/cpu: add has_caches flag to check smp_cache configuration

Zhao Liu (8):
  i386/cpu: Don't enumerate the "invalid" CPU topology level
  hw/core: Make CPU topology enumeration arch-agnostic
  qapi/qom: Define cache enumeration and properties for machine
  hw/core: Check smp cache topology support for machine
  hw/core: Add a helper to check the cache topology level
  i386/cpu: Support thread and module level cache topology
  i386/cpu: Update cache topology with machine's configuration
  i386/pc: Support cache topology in -machine for PC machine

 hw/core/machine-smp.c      | 128 +++++++++++++++++++++
 hw/core/machine.c          |  44 ++++++++
 hw/i386/pc.c               |   4 +
 hw/i386/x86-common.c       |   4 +-
 include/hw/boards.h        |  19 ++++
 include/hw/i386/topology.h |  22 +---
 qapi/machine-common.json   |  94 +++++++++++++++-
 qemu-options.hx            |  31 ++++-
 target/i386/cpu.c          | 225 ++++++++++++++++++++++++-------------
 target/i386/cpu.h          |   4 +-
 10 files changed, 474 insertions(+), 101 deletions(-)

-- 
2.34.1
