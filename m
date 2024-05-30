Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp118594ejk;
        Thu, 30 May 2024 03:00:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8Kyi1OjByCQAZQbnhIljGET+j7Knzomg1PNlsFHXpCQB79uE3Se5cuvzD/v7GfsjQ0QkQIxWHyYEIXKYfJ3H7U44Btt70
X-Google-Smtp-Source: AGHT+IG/IP1jGkB49xr4TJq4d+bUpMIz1IykV9EbB9O5jB66j414HeE2eCWRzY9Am31EarwRKeje
X-Received: by 2002:a05:6102:128b:b0:48b:8f15:ec93 with SMTP id ada2fe7eead31-48baea15845mr1753349137.18.1717063240193;
        Thu, 30 May 2024 03:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717063240; cv=none;
        d=google.com; s=arc-20160816;
        b=F8VdXnlLDQvT03/Bs/HSymRKdNLu9B5YUoUmTW+3LX0QO+/NV2PaAKlPDrHgHuu3zR
         mPujwgL/EtcRtd4GwR5Mnbe6gEpbmPiL4MJFRcyLIAb7ACQoM687Q8/rCVrfMz0yymnF
         9u8mpMzqnFSs9TQXm7TIR2d8W6pw8WK6hFkwB11I+4miuq4mYsPalrakf2ZUjPuJuYOa
         at00d30nvNWgJ+jpdgpzb1Vk8ZbHlOw91JMOhePg83NCQRe/rUJEeh0SCGLBpiM9YAtN
         rGi5VdMP0kuvFyB29uUssqLFtyKrD1YHjpTctgVX/GjjOOisRPYFnaEj8vZA4OW42oHh
         ccQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=40UgLqu5nZlwOPgntVoVAwo1c96MajPM/RHooqupzNs=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=EF1G8YORk+Ze2PX9x5oSm8wC+qSo5U3l7kT9P4mLIqw/csCFEM51o1v/dE+RxvaRCu
         EU1HTjYBWf9N2A/ibtSDvtiWJ6rbZwoQ0eXDgwf4EfWAu6AexlDU/mtkWyXvVMKqjDDU
         qRPTzVwJXhBLfAJKY/zT/AmZx8H+7BdHpQ/BXW6eSZu7Tg6YGkMI/Y7FORmFu7odZVdp
         VC+DnXd28ORo4ARCKbUPGIH1OsruVJ28CT28iSR+fkEfQpT/evpRAbPNMTYyXLZEx+ip
         toorZuBIOX1jYOMfjL8kfxnnhRhQgkOFaS05y62JtEyuUQiTXkZ4Dgd38KU7I3lhcaoH
         4rHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=n1hJtK6r;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-804cc02cc8asi2656177241.162.2024.05.30.03.00.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 03:00:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=n1hJtK6r;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717063240; x=1748599240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OUEY1PzrLtaJGQxKv2sq6ylcBSILR8gNfsV/1RqA31Y=;
  b=n1hJtK6rAf/qg/cHws5/IKpQV9kbBHdK5Xfa4FYv1nDsao1NMan1jtcE
   Tiv4XElVopwU9x705GNPRGGrL/XTeJYwDjICNKFMOfJu3ORZDyEN5O2t+
   uDoWF+vIDh8xtxYkxuB/w2PXAA6kDmuWFKWme5y/ZEi7BuPHuhkDX1ftV
   ClEqqcsYqza2quqV87sYzo7NPufZxXrUuBtMKcK14RFlPw7t16nDnP1kE
   /hsKwVuTBt0cFwoeOnJCq3iJVHQ/2C4cwmeyLHN1Uifg2NoAEwvHDjLFH
   x2+M8QtronodclqoSK53xhzWU4yV49YY9/xQqTQUV6rN82DECnMd3UWfb
   A==;
X-CSE-ConnectionGUID: ndaTrxQHTIi0pKUBY9FJ8w==
X-CSE-MsgGUID: T6L1Fd8pR3e0jKHcHuNDBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31032449"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31032449"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:00:37 -0700
X-CSE-ConnectionGUID: TKXLj6QZRxOqLu9u46k3EQ==
X-CSE-MsgGUID: dl3u8jibTlSRrNV7RvOg9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35705007"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2024 03:00:29 -0700
From: Zhao Liu <zhao1.liu@intel.com>
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
Subject: [RFC v2 2/7] hw/core: Define cache topology for machine
Date: Thu, 30 May 2024 18:15:34 +0800
Message-Id: <20240530101539.768484-3-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530101539.768484-1-zhao1.liu@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TscQJSqsNvAu

Define the cache topology based on CPU topology level for two reasons:

1. In practice, a cache will always be bound to the CPU container
   (either private in the CPU container or shared among multiple
   containers), and CPU container is often expressed in terms of CPU
   topology level.
2. The x86's cache-related CPUIDs encode cache topology based on APIC
   ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
   relies on also requires CPU containers to help indicate the private
   shared hierarchy of the cache. Therefore, for SMP systems, it is
   natural to use the CPU topology hierarchy directly in QEMU to define
   the cache topology.

Currently, separated L1 cache (L1 data cache and L1 instruction cache)
with unified higher-level cache (e.g., unified L2 and L3 caches), is the
most common cache architectures.

Therefore, define the topology for L1 D-cache, L1 I-cache, L2 cache and
L3 cache in machine as the basic cache topology support.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine.c   |  5 +++++
 include/hw/boards.h | 25 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8087026b45da..e31d0f3cb4b0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1175,6 +1175,11 @@ static void machine_initfn(Object *obj)
     ms->smp.cores = 1;
     ms->smp.threads = 1;
 
+    ms->smp_cache.l1d = CPU_TOPO_LEVEL_INVALID;
+    ms->smp_cache.l1i = CPU_TOPO_LEVEL_INVALID;
+    ms->smp_cache.l2 = CPU_TOPO_LEVEL_INVALID;
+    ms->smp_cache.l3 = CPU_TOPO_LEVEL_INVALID;
+
     machine_copy_boot_config(ms, &(BootConfiguration){ 0 });
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index c1737f2a5736..e70b2a1bdca2 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -10,6 +10,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "hw/core/cpu.h"
+#include "hw/core/cpu-topology.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
@@ -145,6 +146,12 @@ typedef struct {
  * @books_supported - whether books are supported by the machine
  * @drawers_supported - whether drawers are supported by the machine
  * @modules_supported - whether modules are supported by the machine
+ * @l1_separated_cache_supported - whether l1 data and instruction cache
+ *                                 topology are supported by the machine
+ * @l2_unified_cache_supported - whether l2 unified cache topology are
+ *                               supported by the machine
+ * @l3_unified_cache_supported - whether l3 unified cache topology are
+ *                               supported by the machine
  */
 typedef struct {
     bool prefer_sockets;
@@ -154,6 +161,9 @@ typedef struct {
     bool books_supported;
     bool drawers_supported;
     bool modules_supported;
+    bool l1_separated_cache_supported;
+    bool l2_unified_cache_supported;
+    bool l3_unified_cache_supported;
 } SMPCompatProps;
 
 /**
@@ -359,6 +369,20 @@ typedef struct CPUTopology {
     unsigned int max_cpus;
 } CPUTopology;
 
+/**
+ * CPUTopology:
+ * @l1d: the CPU topology hierarchy the L1 data cache is shared at.
+ * @l1i: the CPU topology hierarchy the L1 instruction cache is shared at.
+ * @l2: the CPU topology hierarchy the L2 (unified) cache is shared at.
+ * @l3: the CPU topology hierarchy the L3 (unified) cache is shared at.
+ */
+typedef struct CacheTopology {
+    CPUTopoLevel l1d;
+    CPUTopoLevel l1i;
+    CPUTopoLevel l2;
+    CPUTopoLevel l3;
+} CacheTopology;
+
 /**
  * MachineState:
  */
@@ -410,6 +434,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CPUTopology smp;
+    CacheTopology smp_cache;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
-- 
2.34.1
