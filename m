Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1174677ejb;
        Tue, 20 Feb 2024 01:12:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUiAWbZB2Oh71Xy3P84RScHGaoTflAnZdMux/w/P9pccLr2V7eIlffCZtG9vZLbiiE7ani/jOfXmu38O52EeV9lLrxq8fs
X-Google-Smtp-Source: AGHT+IFwypnRSpE53116CagZD5Yko+ikg/4tWFXeVh2EmpXcyfL+3Ly6H+MXt4Jc9s0BPg5/0o+h
X-Received: by 2002:a05:620a:36f1:b0:787:796e:73d5 with SMTP id cz49-20020a05620a36f100b00787796e73d5mr686005qkb.58.1708420323008;
        Tue, 20 Feb 2024 01:12:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708420322; cv=none;
        d=google.com; s=arc-20160816;
        b=V1akIpswbZkYdp6kXfDwqyytV2Hmt9ZEIxtb1RhIhLpyijO0QHwgMzo2/uUydaEDCM
         4XDWM/E8Abf1a5KybvZrAE/vKTMQnsywFOmtnNPnZ2T74f8pCQ+xhd4FcJLUgBK3jWL2
         IC3aDa4t/bIwCqoco+0Cpe9DOIXDCEVaHXISDcNuhXGr47tHa7GMSACTmgmsZFAWlaPo
         JBjIooMH1+bb5gXjHZgKNc1IfLXFjP8EYYcfDdZnsXyLhofcplL14PUjUAcbe2pLGFR9
         ALqJ3dmHYRs8OrS0JYVqoM942TAIGtBhuj9PeCilGffCiEOKpgp4TapRmXTXLoixyQK4
         h0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ir8jeB9n9+PBa0rQd518/TPuwxf1PmDmskJayeq2oD8=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=S+wnozc/Jtnwa55sOR0hHkikjxFMpuAnvKiYj4kB5NWvauLDrwa1/tPuC8QplxCYEe
         I31zFUvuKfMASPXnq5tvCAMvzn8m8es+vk/XRMSoZnjgwf2771nMd0LJrMrQcDYOepc8
         +2Dqm5kJDZK0ABajYgSZD1uCfc21hhrLG9C/bAoQ1pyoo3QrbSWwAVX//tmTfosgdg2L
         iGEoD2zvwPOgdfT/f8K6YrN5lmhdbdngbTKJoNbOURpsR0indaI5jQ3amUpKxEnFjJ9Q
         PvrpteDckAVjoQ+ME2WMlF265SUtszZo5dPnDIgf/t8fQ3viIjwb3zyurMD7bb88eUEV
         /aDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=k4xJPgy5;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id qs15-20020a05620a394f00b007873af4a4e7si9151366qkn.764.2024.02.20.01.12.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Feb 2024 01:12:02 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=k4xJPgy5;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708420323; x=1739956323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZUUAxB4sXVe45cGLGYGHp6RoRiuaOzKNjOeO96oXZvg=;
  b=k4xJPgy5morXTuYWqX+3yCo26JSMJ2CSPXRKvuR+TfbMwLcg/r8YV7jC
   mMrbArsoNrXfn1f/yuZWKF6kbLm1Nt+TLRbmf0l50BwwUm8gdfP95iZZg
   vyW54xLTxyemlyn/fYqdm1zTq3aAa0yF8XO4cpMBTFojMqRFkOZdQ0ymg
   953C8sh98VZ3W8WK2QM5rHQFZ4OfbSF2ju1VUzmxpWh0zDiHzswwcVk83
   ozpJjDAb2AjFR1N400Ch58Sj7nQdqLr5IVHJ/roJbCocyHORusaPCtppL
   XUfunMTUwS5oYNNriic4sBJhFM2tGf9DeAQoBKJTy5F3oq72IPLRIRBgy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2374982"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2374982"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 01:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5012944"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2024 01:11:55 -0800
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
Subject: [RFC 3/8] hw/core: Define cache topology for machine
Date: Tue, 20 Feb 2024 17:24:59 +0800
Message-Id: <20240220092504.726064-4-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Hu8a1hkuILNe

From: Zhao Liu <zhao1.liu@intel.com>

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
index b3199c710194..426f71770a84 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1163,6 +1163,11 @@ static void machine_initfn(Object *obj)
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
index e63dec919da2..8558b88aea52 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -10,6 +10,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "hw/core/cpu.h"
+#include "hw/core/cpu-topology.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
@@ -144,6 +145,12 @@ typedef struct {
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
@@ -153,6 +160,9 @@ typedef struct {
     bool books_supported;
     bool drawers_supported;
     bool modules_supported;
+    bool l1_separated_cache_supported;
+    bool l2_unified_cache_supported;
+    bool l3_unified_cache_supported;
 } SMPCompatProps;
 
 /**
@@ -358,6 +368,20 @@ typedef struct CPUTopology {
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
@@ -408,6 +432,7 @@ struct MachineState {
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
     CPUTopology smp;
+    CacheTopology smp_cache;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
-- 
2.34.1
