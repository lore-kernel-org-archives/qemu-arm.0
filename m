Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1174584ejb;
        Tue, 20 Feb 2024 01:11:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdkhWDJQbM9Cr0pXu9go1a4AGiAwCXlFOCByrYwn63np6Kl6+9ENjqYRrWyAol1L7F9RKt1E+MBTAMGEKdt1pTMwSfPNeV
X-Google-Smtp-Source: AGHT+IHZZO7YwPNQwthZiyaSgdHD376jKEcoLueyEnILzPrF/sFi4jlPjvsl3kIZs3/QJGVsEWtx
X-Received: by 2002:a05:620a:1a20:b0:787:7c4e:390 with SMTP id bk32-20020a05620a1a2000b007877c4e0390mr699881qkb.60.1708420307503;
        Tue, 20 Feb 2024 01:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708420307; cv=none;
        d=google.com; s=arc-20160816;
        b=NUMabJBkGZtBcPh8e7xB16atM1ue1wuCnhKDA4vLq8MK/9zk5gnX+6VFguZICyLq+i
         FYNEBAq+u2NGPrZW0Tv+TSGKdRu6R6J9VJvcidyowpbO7QI7doduGbx3uWV7EKqN5dYT
         hpvFsOYEtz1eSyjuHw4kQNtWaMxskBZbib0HWe8gmIoqwMqlv8NLUvhTOiKm8e4/HM/K
         AEs13qdhiRaqEVyxbEU9PqCCx1YLVbODfCHGb2lZjZWwQZlek0CCt4ua41o+mWjUqbg3
         1cLqwf9aP1fFk8MTZhhPFhtVXRv5vxaI0SujMKsuq3T+5RMQTvLyf6kX7lYLg/gKKxYl
         M0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=1SwaId+1MnuH1EZ77whyIUf2Qwe+JSmEZA6PV635WiM=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=lSg1HuT0JMpOM48A5K906yndgivtUtbeq37iW1V9wHRPk1ANs7HIGKV7RRN5l5lrXT
         ra4Zjg/tZGUrkvfy6wSCf/h2roll/mAG/CsRwZAyjd1QMhEiuON7rbH8tzv8lrUKDhjS
         fSTHroyQeCygXnC2F+XZvkJn/w6QPoJjRyNOiDh+AOAJMXy+OZAJP/2Gid060t9PmHr1
         ce/NQkFxffPG326HnfjHtEjnxvplpi+m6rzpzmKPwBbH1h/52FHKZzTnhgxgSe/m8Drx
         ULtAo3fXPDYHRtMy+nHvEIvSygB/c4GobGEqMXP04zJ/hplxf+aXrhGJBN6JcwV/u3Eb
         twaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TF5ef5BQ;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id qs15-20020a05620a394f00b007873af4a4e7si9151366qkn.764.2024.02.20.01.11.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Feb 2024 01:11:47 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=TF5ef5BQ;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708420307; x=1739956307;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=brs8Wc8MtqC+jD4fj4w5YcCZt8grPE7rypv1O7XbwgM=;
  b=TF5ef5BQruoUUSFZifCqiPEiKj+pBlZ9jcaSddAAu8vVq7rAX3MKLPfT
   zVhTmHXL005tRpyg+utZll7fEpATqkALyjG3uQI2AtIX7RIRNBzrEnH/5
   +zgF7OErKzrbg/SLOHrjsrvxBwmckEknizUuYESnsAOYX50EXMpH6PPN2
   2L0m0ng7dH+HF8rgR8QYOxDK0YzQpo5dNbgEcgnLj0+YvpOjBLQBbES3E
   gXAbYZosAEEmvP/SwfeY8J7CJl7TPBNYsOW9Gii9LxP5kWKu+W4hIDWxs
   96YSHhnrGNXBcMNCj7BJTecdlhR6OmgA/hjJ2GIOGkprtjAn2zpDE0O/X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2374951"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2374951"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 01:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5012799"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2024 01:11:39 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
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
	Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 0/8] Introduce SMP Cache Topology
Date: Tue, 20 Feb 2024 17:24:56 +0800
Message-Id: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qF7c30nPo7Jx

From: Zhao Liu <zhao1.liu@intel.com>

Hi list,

This's our proposal for supporting (SMP) cache topology in -smp as
the following example:

-smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
     l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die

With the new cache topology options ("l1d-cache", "l1i-cache",
"l2-cache" and "l3-cache"), we could adjust the cache topology via -smp.

This patch set is rebased on our i386 module series:
https://lore.kernel.org/qemu-devel/20240131101350.109512-1-zhao1.liu@linux.intel.com/

Since the ARM [1] and RISC-V [2] folks have similar needs for the cache
topology, I also cc'd the ARM and RISC-V folks and lists.


Welcome your feedback!


Introduction
============

Background
----------

Intel client platforms (ADL/RPL/MTL) and E core server platforms (SRF)
share the L2 cache domain among multiple E cores (in the same module).

Thus we need a way to adjust the cache topology so that users could
create the cache topology for Guest that is nearly identical to Host.

This is necessary in cases where there are bound vCPUs, especially
considering that Guest scheduling often takes into account the cache
topology as well (e.g. Linux cluster aware scheduling, i.e. L2 cache
scheduling).

Previously, we introduced a x86 specific option to adjust the cache
topology:

-cpu x-l2-cache-topo=[core|module] [3]

However, considering the needs of other arches, we re-implemented the
generic cache topology (aslo in response to Michael's [4] and Daniel's
comment [5]) in this series.


Cache Topology Representation
-----------------------------

We consider to define the cache topology based on CPU topology level for
two reasons:

1. In practice, a cache will always be bound to the CPU container -
   "CPU container" indicates to a set of CPUs that refer to a certain
   level of CPU topology - where the cache is either private in that
   CPU container or shared among multiple containers.

2. The x86's cache-related CPUIDs encode cache topology based on APIC
   ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
   relies on also requires CPU containers (CPU topology) to help
   indicate the private shared hierarchy of the cache.

Therefore, for SMP systems, it is natural to use the CPU topology
hierarchy directly in QEMU to define the cache topology.

And currently, separated L1 cache (L1 data cache and L1 instruction
cache) with unified higher-level caches (e.g., unified L2 and L3
caches), is the most common cache architectures.

Thus, we define the topology for L1 D-cache, L1 I-cache, L2 cache and L3
cache in MachineState as the basic cache topology support:

typedef struct CacheTopology {
    CPUTopoLevel l1d;
    CPUTopoLevel l1i;
    CPUTopoLevel l2;
    CPUTopoLevel l3;
} CacheTopology;

Machines may also only support a subset of the cache topology
to be configured in -smp by setting the SMP property of MachineClass:

typedef struct {
    ...
    bool l1_separated_cache_supported;
    bool l2_unified_cache_supported;
    bool l3_unified_cache_supported;
} SMPCompatProps;


Cache Topology Configuration in -smp
------------------------------------

Further, we add new parameters to -smp:
* l1d-cache=level
* l1i-cache=level
* l2-cache=level
* l3-cache=level

These cache topology parameters accept the strings of CPU topology
levels (such as "drawer", "book", "socket", "die", "cluster", "module",
"core" or "thread"). Exactly which topology level strings could be
accepted as the parameter depends on the machine's support for the
corresponding CPU topology level.

Unsupported cache topology parameters will be omitted, and
correspondingly, the target CPU's cache topology will use the its
default cache topology setting.

In this series, we add the cache topology support in -smp for x86 PC
machine.

The following example defines a 3-level cache topology hierarchy (L1
D-cache per core, L1 I-cache per core, L2 cache per core and L3 cache per
die) for PC machine.

-smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
     l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die


Reference
---------

[1]: [ARM] Jonathan's proposal to adjust cache topology:
     https://lore.kernel.org/qemu-devel/20230808115713.2613-2-Jonathan.Cameron@huawei.com/
[2]: [RISC-V] Discussion between JeeHeng and Jonathan about cache
     topology:
     https://lore.kernel.org/qemu-devel/20240131155336.000068d1@Huawei.com/
[3]: Previous x86 specific cache topology option:
     https://lore.kernel.org/qemu-devel/20230914072159.1177582-22-zhao1.liu@linux.intel.com/
[4]: Michael's comment about generic cache topology support:
     https://lore.kernel.org/qemu-devel/20231003085516-mutt-send-email-mst@kernel.org/
[5]: Daniel's question about how x86 support L2 cache domain (cluster)
     configuration:
     https://lore.kernel.org/qemu-devel/ZcUG0Uc8KylEQhUW@redhat.com/

Thanks and Best Regards,
Zhao

---
Zhao Liu (8):
  hw/core: Rename CpuTopology to CPUTopology
  hw/core: Move CPU topology enumeration into arch-agnostic file
  hw/core: Define cache topology for machine
  hw/core: Add cache topology options in -smp
  i386/cpu: Support thread and module level cache topology
  i386/cpu: Update cache topology with machine's configuration
  i386/pc: Support cache topology in -smp for PC machine
  qemu-options: Add the cache topology description of -smp

 MAINTAINERS                     |   2 +
 hw/core/cpu-topology.c          |  56 ++++++++++++++
 hw/core/machine-smp.c           | 128 ++++++++++++++++++++++++++++++++
 hw/core/machine.c               |   9 +++
 hw/core/meson.build             |   1 +
 hw/i386/pc.c                    |   3 +
 hw/s390x/cpu-topology.c         |   6 +-
 include/hw/boards.h             |  33 +++++++-
 include/hw/core/cpu-topology.h  |  40 ++++++++++
 include/hw/i386/topology.h      |  18 +----
 include/hw/s390x/cpu-topology.h |   6 +-
 qapi/machine.json               |  14 +++-
 qemu-options.hx                 |  54 ++++++++++++--
 system/vl.c                     |  15 ++++
 target/i386/cpu.c               |  55 ++++++++++----
 target/i386/cpu.h               |   2 +-
 tests/unit/meson.build          |   3 +-
 tests/unit/test-smp-parse.c     |  14 ++--
 18 files changed, 399 insertions(+), 60 deletions(-)
 create mode 100644 hw/core/cpu-topology.c
 create mode 100644 include/hw/core/cpu-topology.h

-- 
2.34.1
