Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp874495njb;
        Sat, 12 Oct 2024 03:28:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlMn1AjkyouLA1x7mtLSvpg1JrPKJrz9jO3OoZqEOfvulIaZRWQYv5GELi2ziL7mnp7xutlgdwEm6gBg==@linaro.org
X-Google-Smtp-Source: AGHT+IEMpcvSyWUQzsAMwVp1HEddmvHTeTpBM8TC2qgaoH0GWj32XKRh90QIBjTlnFPIgUebiGPz
X-Received: by 2002:a05:6214:3a8a:b0:6cb:be89:dd8 with SMTP id 6a1803df08f44-6cbeff52f57mr100646856d6.22.1728728913114;
        Sat, 12 Oct 2024 03:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728728913; cv=none;
        d=google.com; s=arc-20240605;
        b=ADqkOo6VzzhvG1Xhu28ogWVQS/4ngTaXTrbiz/reCBWoLL4Nch6toJ/367DgjfpfFh
         A0pfah+n4xc5xI4/Oasn1K7HLp/BKwRoizF9MWUm9PU1g7fuSCWSLlx/Ru/jc1aMJPfK
         +OoIGN+xx90LTiNu+ojAV3ZhyE08sorFPkXJCm7ioPPapZBFBuxgk9xXrWorU7tnH3Pi
         lSoKvy1Q4StsEy/XuKAAM1+5GEzSfQ6Le38mZNgQ2NSbPa2jQrapqrnw/6nNQX6DMJZW
         Q4EyKCU9dHokzlK0RnrONnoYyTPVMqbkC1RgWLSNA7LXJyOxgScHRZBBVjZlOSoFVyXx
         QiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=jVWo9yPmOLpT1D4g6fP5xD4r9Dl9jRCW5oUriZRRQM0=;
        fh=8h7shi0yfCpjWQfPt6G8q/Uhe70OsXawCuVYUheqDjs=;
        b=cHnExDLOromV5j55jpg/xeoEXDNIgIY3rLdBPfBkFvMZ6/Hf3fYg5NKpO0jTkmn4E3
         YYowsRQzuWjZEayl3u/N0o/JdkwWOgVHJ5HCzz6i6ZaV5PEi6T8OQCC/TyKo+GzYFFLR
         Oal3ISUiDABuCqoiuQdbdSfRJaW5hy3nlKg+Rzr39FGwhrGWpywpTju8ofvjd1qn/UY/
         Vr6DVujq+9G7zknsNsyc8+70Ubp6R8tWrCUVZheWhdiUL69OZLRZ+Lvamxg2t+pOzaFP
         KGmgnDIaIVp4Ouzfns2rKcgTapjtLkATHdYL4WOaD+GOH0ud777UzbqhdCopu2wfyrTW
         zCXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=X3od+MH1;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.8])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe85e0783si58893326d6.189.2024.10.12.03.28.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 03:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) client-ip=192.198.163.8;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=X3od+MH1;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.8 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728728913; x=1760264913;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QT95lceBi+UKQklKM/4f5OmFs4hQWznFN9i2vSXwYKI=;
  b=X3od+MH1zWialDrCrRQx1U+lWQYCF0/t5sjmMw5TjM156xXsSQbyivXT
   Ht3hoULer5AzUrCjANUv2WE2WbOqL+MpE6U3eSbdntYbzpXC5SoGSil1L
   UE2vZm4yXFAL33tD0ssTAwbx9gc2GW/ZDVCXN5lT15NyAvrM//Vjx2T5i
   oJT11C5+2GpDSIUROlyvQpd8iuMD4Oc6dJA5KrZ0SZiLjdsgoo/WCJX8z
   dFANb0lp2qr9DlEi0Mm+kv7k1goGcoKiS99LgHu+9psApFqtHMr7JMucr
   ku0BI1gJMlxEHIE/1f0gYQ45gTnR646EXijN1kVk+drDrb09VG5Oc82sQ
   Q==;
X-CSE-ConnectionGUID: Z4X8tjlmRQSEjzQRdy3gPw==
X-CSE-MsgGUID: ctYRXt6uSCygRsGvEVIIQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45634853"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="45634853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:28:31 -0700
X-CSE-ConnectionGUID: YkkSec8AQhyfX8wa+TnkcA==
X-CSE-MsgGUID: FR0NkbxUQTSH29mlrlvhQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77050807"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 03:28:25 -0700
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
Subject: [PATCH v3 0/7] Introduce SMP Cache Topology
Date: Sat, 12 Oct 2024 18:44:22 +0800
Message-Id: <20241012104429.1048908-1-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: d22fqFfM9Xzw

Hi all,

Compared with v2 [1], the changes in v3 are quite minor, and most of
patches (except for patch 1 and 7) have received Jonathan’s R/b (thanks
Jonathan!).

Meanwhile, ARM side has also worked a lot on the smp-cache based on
this series [2], so I think we are very close to the final merge, to
catch up with this cycle. :)

This series is based on the commit 7e3b6d8063f2 ("Merge tag 'crypto-
fixes-pull-request' of https://gitlab.com/berrange/qemu into staging").

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

[1]: Patch v2: https://lore.kernel.org/qemu-devel/20240908125920.1160236-1-zhao1.liu@intel.com/
[2]: ARM smp-cache: https://lore.kernel.org/qemu-devel/20241010111822.345-1-alireza.sanaee@huawei.com/
[3]: API disscussion: https://lore.kernel.org/qemu-devel/8734ndj33j.fsf@pond.sub.org/

Thanks and Best Regards,
Zhao
---
Changelog:

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

Zhao Liu (6):
  hw/core: Make CPU topology enumeration arch-agnostic
  qapi/qom: Define cache enumeration and properties for machine
  hw/core: Check smp cache topology support for machine
  i386/cpu: Support thread and module level cache topology
  i386/cpu: Update cache topology with machine's configuration
  i386/pc: Support cache topology in -machine for PC machine

 hw/core/machine-smp.c      | 117 +++++++++++++++++++++++
 hw/core/machine.c          |  44 +++++++++
 hw/i386/pc.c               |   4 +
 hw/i386/x86-common.c       |   4 +-
 include/hw/boards.h        |  16 ++++
 include/hw/i386/topology.h |  22 +----
 qapi/machine-common.json   |  96 ++++++++++++++++++-
 qemu-options.hx            |  26 ++++-
 target/i386/cpu.c          | 190 ++++++++++++++++++++++---------------
 target/i386/cpu.h          |   4 +-
 10 files changed, 423 insertions(+), 100 deletions(-)

-- 
2.34.1
