Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp276696njc;
        Fri, 1 Nov 2024 01:16:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3NhfkSwUiaZD/7SgZaW9kplAeq+WQL3PJa0piDJFYuCxp9EVFo74ioa6Lvm8ejn/c15u34/nDpqw+Qw==@linaro.org
X-Google-Smtp-Source: AGHT+IHMmebu36heegeeAnM6fGvLVBOm7gjMnNFnS+OUmdAMuiA7r3R/OE+VEEoJ9/ivULaxIFin
X-Received: by 2002:a05:6102:442c:b0:4a9:14:3ee9 with SMTP id ada2fe7eead31-4a9543a912emr7252170137.23.1730448960778;
        Fri, 01 Nov 2024 01:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730448960; cv=none;
        d=google.com; s=arc-20240605;
        b=JO17m2pgEA7/aL/tlI1CSBImAeDZN7XJncE6lS1uTriydUNJQPUEQd/f1hjlbv7NFS
         IRCidV8PALBwDBymVwVVQtTYIifQ04fBZt3eNMVAhKEaWBd44eni/GaZ06QwRoGOG30K
         /6qRGdxTNOr9D5FFEPkO5tULRcWYiuNWih61KsZFM1rByqXumrhlCaYBiC3XWfwABTtX
         MEKn9583rB4p84Rdzel04NBjjs8h02TIHLOkrnb6H7NLEYIf6Cx/jZN58Qg6pQhHLjEh
         HSwajJUexBIXppJMKxn/ei5WfMvUDkSI4UGzksFcUyPAezYh56En+50Y6TFB+vKi2+7j
         H8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:dkim-signature;
        bh=3LAOFSbGVV8G7hTs0ywBHMefEjcusnnXgP0sYJl+8+A=;
        fh=/Q7DFfK0c6lcL5pNzN/8+EzqG4IF+hoXAsi0Ur0bC2k=;
        b=I4SM4fAegzD7qWZ6HEMVl5lSuNAPbC/VUV18OUUQf71q31UpSNZ4WYuvVad52lPYNB
         9iV639ZCrjPU3nZ1QMPPP8N8z7cJs33X+0HOYshk5pkuPLpopu4zXJwwzwcXXzJpG0Um
         6k8fU8uJm47tRDacIdUIMXFE4lkITL6yBF0PUKj/96vnsKp9z7ecxdAmycKR0L9mdtST
         5QP1VyEc9zy36if/CGe4Nb5rt4c7fMtZmatOIA4Pjmi3cpVg8p2ugVDi5a0bnXF9xn5I
         DM8QrQRh8OKW5QlJpL1JLkgBTO2UNMAenADSPiwMYNAas11TNTA4ukI2OBhcrNBOfdub
         eTtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=MC4aef0V;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.16])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b2030si40528111cf.75.2024.11.01.01.15.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 01:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) client-ip=192.198.163.16;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=MC4aef0V;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.16 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730448961; x=1761984961;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OeRYF2apaD+NDr933mJ/vBCoF1Va5KOdDbSi5mJxQUk=;
  b=MC4aef0Vq+ARo+XktnTpUDo98v8WKvFSZPRSv+wGh3bsZw52bELNYPTy
   vk7pWH3e23LeTD7HqeMHJ8DwWC5XNpu61eRz2NHqFDlZ8jxS3yj6fphK+
   JxQnZpIHRUJVR9Nc/35MQu0YSwUuVOzoG47DLGTUbKC+wOi2G/AN6xrbH
   1GBp1tSq72Kma+jRFSIv3YE+fivsOk5zDBQEiHZVcqWET9gwPM3G3qu8n
   qhRRuJoPKwxhUuYoqrVLDhV4hZf/xl6FiXxSt6HjpeNOyQl+IPs6/CZx6
   nucAFaBd1nGTJ2R2b8tMuuQfdH1TcrGXUSKZjKg30u57hre4aVYKP7w9H
   w==;
X-CSE-ConnectionGUID: 7S8G1jQ8TLOFGVAJQ75yOA==
X-CSE-MsgGUID: fecVMpaJR0CKsquf4gKJxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17845995"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="17845995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:15:59 -0700
X-CSE-ConnectionGUID: FKT23MALQ2CRulJ7gc80ig==
X-CSE-MsgGUID: t3SK6hiQRqeSZcJtirYTcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="86834534"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa003.fm.intel.com with ESMTP; 01 Nov 2024 01:15:54 -0700
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
	Alireza Sanaee <alireza.sanaee@huawei.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v5 0/9] Introduce SMP Cache Topology
Date: Fri,  1 Nov 2024 16:33:22 +0800
Message-Id: <20241101083331.340178-1-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ySd46WIJCW7R

Hi Paolo,

This is my v5, if you think it's okay, could this feature get the final
merge? (Before the 9.2 cycle ends) :-)

Compared with v4 [1], there's no more changes except rebase and adding
Acked/Reviewed-by tags (thanks!).

ARM side has also worked a lot on the smp-cache based on this series [2].

This series is based on the Paolo's for-upstream-i386 (commit 1a519388a882
("target/i386: Introduce GraniteRapids-v2 model")).

Since AMD's Turin model hasn't been picked, there's actually no conflict
at the moment, and this series can be applied to the master as well


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


[1]: Patch v4: https://lore.kernel.org/qemu-devel/20241022135151.2052198-1-zhao1.liu@intel.com/
[2]: ARM smp-cache: https://lore.kernel.org/qemu-devel/20241010111822.345-1-alireza.sanaee@huawei.com/
[3]: API disscussion: https://lore.kernel.org/qemu-devel/8734ndj33j.fsf@pond.sub.org/

Thanks and Best Regards,
Zhao
---
Changelog:

Changes since Patch v4:
 * Added Acked/Reviewed-by tags.
 * Rebased on Paolo's for-upstream-i386 tag.

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
