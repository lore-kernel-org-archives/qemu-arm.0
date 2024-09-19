Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1112777njg;
        Wed, 18 Sep 2024 18:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPlsuQcHV1ceid9NrQf+phnF7aASG8682K+TMvni1HXaboYMREPFMJ10W+qb6WgK+AvZkdr9fUt9tbmA==@linaro.org
X-Google-Smtp-Source: AGHT+IE2mB7hmCeZw6goAMUK/KGo3Q3il2fFiEQ1Om2RfdwqijG1nbwZ+EAOKIUrkReJQPh0aJJB
X-Received: by 2002:a05:622a:40f:b0:459:a816:b86d with SMTP id d75a77b69052e-45b160c5c20mr29476381cf.28.1726710026930;
        Wed, 18 Sep 2024 18:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726710026; cv=none;
        d=google.com; s=arc-20240605;
        b=eMSkijGfKFstiJvM5e8RaPx75VMy7V05KJl89Wy830ILZhiyOeoQfWiVE6mN3UgHX1
         3l8TvAtsK7wLIcDhBsIT03mUj5B7bkodCkjE0nZGUD2Cdlg/3g9aAx5F143b5r907kIt
         qVgC0MZUU1jDt9oMeUr8zLGEtLJDfMXKfw0wWd0vAgrE6R9p9kRtRvqwXNlRDXyZBZa9
         VWAzbKhAq7bk40HzaulaxQobK6esCGNMTWKSveJPqj+9NtJ6hUDNeOpQt9fD+Ht8kgFb
         3msSZgnQfqmVLWAT5XQakgdFT2VQdjXGvlvVvg5sff8wpqCvICa+Q7j7MlYA2jxfITU7
         xl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=m4eYLshNNYOaTAgcidphZtXuUW3yfLSvnzp1bgnupSw=;
        fh=N9JXs6UlidM8EsUInW73fWjlYrhprlUzJ9DsuKSk+BQ=;
        b=QL9jUUQcxsXumuDTY35OISabTWmPvzO2B3aD8l7WTfqEMWTwrxQ+xPp+F/reFX/mkF
         ZrUtbJgq/QRPkRUkxzwwJVdA3TaO0EY4yhuwiR8bpIWJchPRtIikAoAR5vxE4SUAmOcR
         n1+Cad4JFpAWBhBQZI5b13qCZgSbHEC8XolOoLtKAi4BzQ/o//tNQnb7kFzWY3dqhYKZ
         SzryI4soGt+J9h59+lSv7LDzTrVMV6G9YJTbqpNfGzJudrZlSTfCGzgu2si23FzQ7BTm
         xrxX/4RSdPTgRLnq40V3JuhDl1YI7U++g2gMnJ4YLJVP7vPI4l71cxW6uTsKVyjxUw4E
         cHcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=aoTvQuqz;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b178698adsi7647481cf.78.2024.09.18.18.40.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 18:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=aoTvQuqz;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726710027; x=1758246027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+kEYgTEqzxM7Ze52eMLk4clqkl8mXjIJEkgs/jlv98A=;
  b=aoTvQuqzlGB+gLshVG9VdheVjivcHitEXumqlF2YakQH72/y8WniVm2t
   mDci4wZSHyi2IVtF7ds7jHvuJDh4syLTAkNF9Y2YKJdMFp6z2mNmmWl6B
   0QNoCHS7acnQ14trSsqXFSirzjPTETIUgtjKpQvEVI7W8OeuYGozWbr8t
   MJmDS/dY4da860Q6jHGUbpW6SlK/k6AtFwxoYZJVRgKcxpsbFaNBuFXQg
   KoyPGDb9lazO5+P4J4DBLwnl5o/cID5wyhzOtLj0SvQjJZHApJLKSiO29
   jlZ2COEw3Xwvbne3ruZf8ZNJIOTCdFYfEma2zsjfLq4WsAW55vEHzoVV9
   A==;
X-CSE-ConnectionGUID: H26iMuqDRw6JDVIszuFRvw==
X-CSE-MsgGUID: FeYyqkjtS6S+JvNvLUPr2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25797885"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25797885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 18:40:25 -0700
X-CSE-ConnectionGUID: /WO5kkQtTAmAANN0ooMDVw==
X-CSE-MsgGUID: Z1ZnLU9xQpuscAGPUNlugQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70058743"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2024 18:40:19 -0700
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 06/15] hw/core: Create CPU slot in MachineState to manage CPU topology tree
Date: Thu, 19 Sep 2024 09:55:24 +0800
Message-Id: <20240919015533.766754-7-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919015533.766754-1-zhao1.liu@intel.com>
References: <20240919015533.766754-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ArERfLkumk/g

With CPU slot support, the machine can manage the CPU topology tree. To
enable hot-plug support for topology devices, use the machine as the
hotplug handler for the CPU bus.

Additionally, since not all machines support the topology tree from the
start, add a "topo_tree_supported" flag to indicate whether a machine
supports the topology tree. And create the CPU slot as the topology root
only for machines that support it.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine.c         |  2 ++
 hw/cpu/cpu-slot.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/boards.h       |  9 +++++++++
 include/hw/cpu/cpu-slot.h |  2 ++
 system/vl.c               |  4 ++++
 5 files changed, 51 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 518beb9f883a..b6258d95b1e8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1239,6 +1239,8 @@ static void machine_initfn(Object *obj)
         ms->smp_cache.props[i].topology = CPU_TOPOLOGY_LEVEL_DEFAULT;
     }
 
+    ms->topo = NULL;
+
     machine_copy_boot_config(ms, &(BootConfiguration){ 0 });
 }
 
diff --git a/hw/cpu/cpu-slot.c b/hw/cpu/cpu-slot.c
index 66ef8d9faa97..4dbd5b7b7e00 100644
--- a/hw/cpu/cpu-slot.c
+++ b/hw/cpu/cpu-slot.c
@@ -138,3 +138,37 @@ static void cpu_slot_register_types(void)
 }
 
 type_init(cpu_slot_register_types)
+
+void machine_plug_cpu_slot(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    CPUSlot *slot;
+
+    slot = CPU_SLOT(qdev_new(TYPE_CPU_SLOT));
+    set_bit(CPU_TOPOLOGY_LEVEL_THREAD, slot->supported_levels);
+    set_bit(CPU_TOPOLOGY_LEVEL_CORE, slot->supported_levels);
+    set_bit(CPU_TOPOLOGY_LEVEL_SOCKET, slot->supported_levels);
+
+    /*
+     * Now just consider the levels that x86 supports.
+     * TODO: Supports other levels.
+     */
+    if (mc->smp_props.modules_supported) {
+        set_bit(CPU_TOPOLOGY_LEVEL_MODULE, slot->supported_levels);
+    }
+
+    if (mc->smp_props.dies_supported) {
+        set_bit(CPU_TOPOLOGY_LEVEL_DIE, slot->supported_levels);
+    }
+
+    ms->topo = slot;
+    object_property_add_child(container_get(OBJECT(ms), "/peripheral"),
+                              "cpu-slot", OBJECT(ms->topo));
+    DEVICE(ms->topo)->id = g_strdup_printf("%s", "cpu-slot");
+
+    sysbus_realize(SYS_BUS_DEVICE(slot), &error_abort);
+
+    if (mc->get_hotplug_handler) {
+        qbus_set_hotplug_handler(BUS(&slot->bus), OBJECT(ms));
+    }
+}
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 2dd8decf640a..eeb4e7e2ce9f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -10,6 +10,7 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 #include "hw/core/cpu.h"
+#include "hw/cpu/cpu-slot.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
@@ -152,6 +153,8 @@ typedef struct {
  * @modules_supported - whether modules are supported by the machine
  * @cache_supported - whether cache topologies (l1d, l1i, l2 and l3) are
  *                    supported by the machine
+ * @topo_tree_supported - whether QOM topology tree is supported by the
+ *                        machine
  */
 typedef struct {
     bool prefer_sockets;
@@ -162,6 +165,7 @@ typedef struct {
     bool drawers_supported;
     bool modules_supported;
     bool cache_supported[CACHE_LEVEL_AND_TYPE__MAX];
+    bool topo_tree_supported;
 } SMPCompatProps;
 
 /**
@@ -431,6 +435,11 @@ struct MachineState {
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
     SmpCache smp_cache;
+    /*
+     * TODO: get rid of "smp" and merge it into "topo" when all arches
+     * support QOM topology.
+     */
+    CPUSlot *topo;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
diff --git a/include/hw/cpu/cpu-slot.h b/include/hw/cpu/cpu-slot.h
index 9d02d5de578e..24e122013bf7 100644
--- a/include/hw/cpu/cpu-slot.h
+++ b/include/hw/cpu/cpu-slot.h
@@ -69,4 +69,6 @@ struct CPUSlot {
     DeviceListener listener;
 };
 
+void machine_plug_cpu_slot(MachineState *ms);
+
 #endif /* CPU_SLOT_H */
diff --git a/system/vl.c b/system/vl.c
index fe547ca47c27..193e7049ccbe 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2151,6 +2151,10 @@ static void qemu_create_machine(QDict *qdict)
                                           false, &error_abort);
         qobject_unref(default_opts);
     }
+
+    if (machine_class->smp_props.topo_tree_supported) {
+        machine_plug_cpu_slot(current_machine);
+    }
 }
 
 static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
-- 
2.34.1
