Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp625077njb;
        Sun, 8 Sep 2024 05:43:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZTGN6QNfMYIAvMNL3UmciFOZSOQtCx38BIjm1gnzgUM5mNMwH7tcrHYlVd5RCSUBetH/UfhcCG8WZcA==@linaro.org
X-Google-Smtp-Source: AGHT+IFIEAcoytOHJNLxC9vNUm3A4PoVHbbGvJKe0Wp05u3TveO4clzzicuDDn+QpoEwc4wIwoLO
X-Received: by 2002:a05:6214:534a:b0:6c5:13f0:240d with SMTP id 6a1803df08f44-6c532479176mr42376976d6.38.1725799408831;
        Sun, 08 Sep 2024 05:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725799408; cv=none;
        d=google.com; s=arc-20240605;
        b=MT7yHQNp9Wgja+NvbKBTWC+mC7tjfCPg7iOYLDhEhYg0kHpuU+frnb+PgU/Ukovs9X
         WL1ox6lU6DY0fxZSmoChirKnTEoLFbS0I7nxAGzVLxLBjjjDyaa9YrUA3X+joDLnxtjU
         wIEHxfQYf8ZMYs8V20jTZAaI2PmIgkDWJlYUGUhwfq+sNcu0bfM9hFu5lL5AWXGUogQZ
         KNS/G+f4w9ONjsiKuMqpuip81ob7bVyOSdvdWpnTnUh1vkNbSR80fBrA7mbVKJAD+tpq
         TC8qSaFA6gT4WVn0KVnekZKQsQXGckwKv0yQf3RpD6HXImyYg56MCdDZuYZw253IEzFs
         9BKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=K4NU6+oSf71nbQEpeeK96Vj1OV+IioGM+hwjNVRDcRI=;
        fh=0cJcinrZnucqYjSNYncb6+eMGja84j/gs35YiXtiMHU=;
        b=BsMTl5ihAqdIvlfjt+udPDFQjcdZXdKr/Zwk6FxE5IpiOJpNcaepe6/K3ccGaNINC+
         Sa2N9A+HS2nsHIgh2kvyno5/gAPamwzEzRphN2OmdcOiEp3inXR+PABCZTCU1/UB6T2k
         ipQ6FTxdf9c+gIO8zeJ/KU0JHcsSNCZ6Cl7RCbsiTTTR/5kBvxU9OaMTG4Oyp2zaNJNO
         7Q5ED6Jm0gW2hfVHSvHf1dMDvCCmHn9UOWk0jGM+SduhrwOdnyVbVGaBDIhk/Nd9p3qj
         V6urMdl38xVVQoswSt1Iq9uH8KTy3WXcpcUngUNJWT2ulCx4HqJrJiG7BUt0d57D0IiO
         46Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=eZwMcEVj;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534787b9dsi31732186d6.435.2024.09.08.05.43.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Sep 2024 05:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) client-ip=198.175.65.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=eZwMcEVj;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725799409; x=1757335409;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BoRZmDFSyV2mqYLCh9CopRCSnLh6p2jwwrbsvnqOMEY=;
  b=eZwMcEVjn3vsJYkUQ8NCotYis0yL8EIeseDVSjaVBCa/WUZtlTaIrgaZ
   5QrvDS3uPMR8uTTwKkB8bcX0FrXkXng4ck54C/mxZLCT9XdCHnVvTTfKB
   Lv5x7lOOLNwTu50icpjTcbkEJFNtn255wsjV7ykFlp7b9/WtDoCXqyFBB
   pbmYX/JLlJD3svKSSwpbQT1sq9maGpnI8WErTOwgL7zOXrjnpQ2MepJZU
   x6PkCyDINS3CAQURctlolk19md7BJd0sog5KB/6LkHtfZx8PmOJDhIjAu
   cjROM22BhMir+9OkBeMQsS7fwg9Jq+QgWFog7sD/2l2irIUyOddJfPiRh
   g==;
X-CSE-ConnectionGUID: /2vvWNYTTqWT1ED4eN0WoQ==
X-CSE-MsgGUID: 3QskC/hGQsKQqAcT9mR+Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28238097"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="28238097"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:43:27 -0700
X-CSE-ConnectionGUID: d/rhpYHgS4em0LAuGrlaJQ==
X-CSE-MsgGUID: FSUCJbt4QfG2OSDdwDfZ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="97196482"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 05:43:21 -0700
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
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 0/7] Introduce SMP Cache Topology
Date: Sun,  8 Sep 2024 20:59:13 +0800
Message-Id: <20240908125920.1160236-1-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +jumEcwbOc79

Hi all,

Compared with previous Patch v1 [1], I've put the cache properties list
into -machine, this is to meet current needs and also remain compatible
with my future topology support (more discussion details, pls refer [2]).

This series is based on the commit 1581a0bc928d ("Merge tag 'pull-ufs-
20240906' of https://gitlab.com/jeuk20.kim/qemu into staging ufs
queue").

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

In this version, smp-cache is implemented as a array integrated in
-machine. Though -machine currently can't support JSON format, this is
the one of the directions of future.

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


Welcome your comment!


[1]: Patch v1: https://lore.kernel.org/qemu-devel/20240704031603.1744546-1-zhao1.liu@intel.com/
[2]: API disscussion: https://lore.kernel.org/qemu-devel/8734ndj33j.fsf@pond.sub.org/

Thanks and Best Regards,
Zhao
---
Changelog:

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
Zhao Liu (7):
  hw/core: Make CPU topology enumeration arch-agnostic
  qapi/qom: Define cache enumeration and properties
  hw/core: Add smp cache topology for machine
  hw/core: Check smp cache topology support for machine
  i386/cpu: Support thread and module level cache topology
  i386/cpu: Update cache topology with machine's configuration
  i386/pc: Support cache topology in -machine for PC machine

 hw/core/machine-smp.c      | 119 +++++++++++++++++++++++
 hw/core/machine.c          |  44 +++++++++
 hw/i386/pc.c               |   4 +
 hw/i386/x86-common.c       |   4 +-
 include/hw/boards.h        |  13 +++
 include/hw/i386/topology.h |  22 +----
 qapi/machine-common.json   |  96 ++++++++++++++++++-
 qemu-options.hx            |  28 +++++-
 target/i386/cpu.c          | 191 ++++++++++++++++++++++---------------
 target/i386/cpu.h          |   4 +-
 10 files changed, 425 insertions(+), 100 deletions(-)

-- 
2.34.1
