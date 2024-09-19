Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1112704njg;
        Wed, 18 Sep 2024 18:40:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWV6lDo8WH+F1Q1tusXr32/URWln23i+af5e7oaoljFkc0EzHUshQJO+R2bUQBOq1pf4uTRC9Wfwoy/KQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1yzatx5bARlG7pC3JU0eEd7mkQRwRcJAVGU3xJ+I5A4jDo1isyLXML2fubIoXsccYkDay
X-Received: by 2002:a05:6214:5d02:b0:6c1:6a57:e7ee with SMTP id 6a1803df08f44-6c57dfa2ce1mr300660956d6.16.1726710013283;
        Wed, 18 Sep 2024 18:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726710013; cv=none;
        d=google.com; s=arc-20240605;
        b=XWS2srk/IlrNMUTv8i4aF88RsP7QoyLl5Ln6zwpZICv+i+MQW2NHcY9ZSqXy5SHplr
         /VRt0rWimWe0kslAXKM1muZmejr1wWdQTfB/5lzzktQkHmJY+lxgmLUdx2AJwqMJjkQw
         mA/aGRB7Tts/tqEUItXv7N8FoEgFLvLZNuHU8wOZN1Mof4vRRQtyJzUB7/hTUFYb1mGT
         M1lsMLTNMF5zn2vrWVArSAVVdpOpFJUlmaN56QfPuXcVZiNBVduvP3isS/kpvUabMTj0
         iTLiqexsd4u7FDeX4ZdrEGXN2qk3iYLjDpZsT09xvxQJRkz//+E0MoSNi5cSLvN7XfiM
         u4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=26C8Om/nVanonYnJjgrpw24DsW98RCEcDsTyAYBUf0s=;
        fh=N9JXs6UlidM8EsUInW73fWjlYrhprlUzJ9DsuKSk+BQ=;
        b=ZOXlCFPmjbcbviHoq1M3OAswGRazKSe/5V+FbJiL+XpzZABNYpqA5bGP2LFOUz4V3t
         XUH+e0ygXXMWaKckSmfN888gzYZvYUAkxjORQ/r+dGOJKTCP4m24p9Yf34AbRecuU/lo
         rwpbnNmMfRHr8KhxtcpQX2pbRVZu5xcIH0TtemM/faTHbglmGmYxKFfeKehEGb1mx/Aq
         qa5ezL2auuwoy+yY0ZLn6Y4+HgeZD85s3vyGu+0rZCSiZGNx5kOAOWI1Bij9xZxEVhJD
         tjxUAgnQpjO3QDiT8R2nu1pTPhForyYRjuP2TEIambmZAJyp8YYuICRIa/zlo/iRhFd9
         h8Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SGYN6AiL;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e453925si8109156d6.10.2024.09.18.18.40.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 18:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SGYN6AiL;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726710013; x=1758246013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F7jWrurI1XVWfEeDSjk70sFPKqku+j5BACGGdK6zY9w=;
  b=SGYN6AiLCpPYJk4bOzreSTEiSLVq6N10hNBE7ExH+3bqGPrYz+TpvhmL
   JPAFllCuLT+RR25/eMHpp66/Pnq8eJClehlU698EFBhrK/aSSs6HMrUx4
   CW8ztl6qMRlTNerSmgtiEvW1wFjafH9BRduIkkG51X8fCOLxTXj3V3fzP
   NZIc7jSiFMK4s3GZ/1Aksalp4L6xEVIUaUYr8eRD6bTfmZR5kowCF2q/8
   VD1+jn17CxOZFGnPMQYLYvEfbwtfMO5XbAyi+vrF/QKYZPMjY/sd7hbxy
   MT0AlFB3B7NJoSx2IlaUzL9tgcwQI5J5pWQlNeaDhhwnzTl1t4pZAppPb
   g==;
X-CSE-ConnectionGUID: gNGe6YRgSCKLxMuqxrepbw==
X-CSE-MsgGUID: hpqMqOSmReqRn2ym1tCuxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25797857"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25797857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 18:40:12 -0700
X-CSE-ConnectionGUID: VQKFuNgeQburcx//Eizfqw==
X-CSE-MsgGUID: 5cDjh2NdT+qSFPCfiK9wyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70058644"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2024 18:40:05 -0700
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
Subject: [RFC v2 04/15] hw/cpu: Introduce CPU slot to manage CPU topology
Date: Thu, 19 Sep 2024 09:55:22 +0800
Message-Id: <20240919015533.766754-5-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919015533.766754-1-zhao1.liu@intel.com>
References: <20240919015533.766754-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SURtW1EkzD0l

When there's a CPU topology tree, original MachineState.smp (CpuTopology
structure) is not enough to dynamically monitor changes of the tree or
update topology information in time.

To address this, introduce the CPU slot, as the root of CPU topology
tree, which is used to update and maintain global topological statistics
by listening any changes of topology device (realize() and unrealize()).

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS               |   2 +
 hw/cpu/cpu-slot.c         | 140 ++++++++++++++++++++++++++++++++++++++
 hw/cpu/meson.build        |   1 +
 include/hw/cpu/cpu-slot.h |  72 ++++++++++++++++++++
 4 files changed, 215 insertions(+)
 create mode 100644 hw/cpu/cpu-slot.c
 create mode 100644 include/hw/cpu/cpu-slot.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 230267597b5f..8e5b2cd91dca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1884,6 +1884,7 @@ F: hw/core/machine-smp.c
 F: hw/core/null-machine.c
 F: hw/core/numa.c
 F: hw/cpu/cluster.c
+F: hw/cpu/cpu-slot.c
 F: hw/cpu/cpu-topology.c
 F: qapi/machine.json
 F: qapi/machine-common.json
@@ -1891,6 +1892,7 @@ F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
+F: include/hw/cpu/cpu-slot.h
 F: include/hw/cpu/cpu-topology.h
 F: include/sysemu/numa.h
 F: tests/functional/test_cpu_queries.py
diff --git a/hw/cpu/cpu-slot.c b/hw/cpu/cpu-slot.c
new file mode 100644
index 000000000000..66ef8d9faa97
--- /dev/null
+++ b/hw/cpu/cpu-slot.c
@@ -0,0 +1,140 @@
+/*
+ * CPU slot abstraction - manage CPU topology
+ *
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/boards.h"
+#include "hw/cpu/cpu-slot.h"
+#include "hw/cpu/cpu-topology.h"
+#include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+
+static void cpu_slot_add_topo_info(CPUSlot *slot, CPUTopoState *topo)
+{
+    CpuTopologyLevel level = GET_CPU_TOPO_LEVEL(topo);
+    CPUTopoStatEntry *entry;
+    int instances_num;
+
+    entry = &slot->stat.entries[level];
+    entry->total_instances++;
+
+    instances_num = cpu_topo_get_instances_num(topo);
+    if (instances_num > entry->max_instances) {
+        entry->max_instances = instances_num;
+    }
+
+    set_bit(level, slot->stat.curr_levels);
+
+    return;
+}
+
+static void cpu_slot_device_realize(DeviceListener *listener,
+                                    DeviceState *dev)
+{
+    CPUSlot *slot = container_of(listener, CPUSlot, listener);
+    CPUTopoState *topo;
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_CPU_TOPO)) {
+        return;
+    }
+
+    topo = CPU_TOPO(dev);
+    cpu_slot_add_topo_info(slot, topo);
+}
+
+static void cpu_slot_del_topo_info(CPUSlot *slot, CPUTopoState *topo)
+{
+    CpuTopologyLevel level = GET_CPU_TOPO_LEVEL(topo);
+    CPUTopoStatEntry *entry;
+
+    entry = &slot->stat.entries[level];
+    entry->total_instances--;
+
+    return;
+}
+
+static void cpu_slot_device_unrealize(DeviceListener *listener,
+                                      DeviceState *dev)
+{
+    CPUSlot *slot = container_of(listener, CPUSlot, listener);
+    CPUTopoState *topo;
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_CPU_TOPO)) {
+        return;
+    }
+
+    topo = CPU_TOPO(dev);
+    cpu_slot_del_topo_info(slot, topo);
+}
+
+DeviceListener cpu_slot_device_listener = {
+    .realize = cpu_slot_device_realize,
+    .unrealize = cpu_slot_device_unrealize,
+};
+
+static bool slot_bus_check_topology(CPUBusState *cbus,
+                                    CPUTopoState *topo,
+                                    Error **errp)
+{
+    CPUSlot *slot = CPU_SLOT(BUS(cbus)->parent);
+    CpuTopologyLevel level = GET_CPU_TOPO_LEVEL(topo);
+
+    if (!test_bit(level, slot->supported_levels)) {
+        error_setg(errp, "cpu topo: level %s is not supported",
+                   CpuTopologyLevel_str(level));
+        return false;
+    }
+    return true;
+}
+
+static void cpu_slot_realize(DeviceState *dev, Error **errp)
+{
+    CPUSlot *slot = CPU_SLOT(dev);
+
+    slot->listener = cpu_slot_device_listener;
+    device_listener_register(&slot->listener);
+
+    qbus_init(&slot->bus, sizeof(CPUBusState),
+              TYPE_CPU_BUS, dev, "cpu-slot");
+    slot->bus.check_topology = slot_bus_check_topology;
+}
+
+static void cpu_slot_unrealize(DeviceState *dev)
+{
+    CPUSlot *slot = CPU_SLOT(dev);
+
+    device_listener_unregister(&slot->listener);
+}
+
+static void cpu_slot_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->realize = cpu_slot_realize;
+    dc->unrealize = cpu_slot_unrealize;
+}
+
+static const TypeInfo cpu_slot_type_info = {
+    .name = TYPE_CPU_SLOT,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .class_init = cpu_slot_class_init,
+    .instance_size = sizeof(CPUSlot),
+};
+
+static void cpu_slot_register_types(void)
+{
+    type_register_static(&cpu_slot_type_info);
+}
+
+type_init(cpu_slot_register_types)
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 6c6546646608..358e2b3960fa 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,6 +1,7 @@
 common_ss.add(files('cpu-topology.c'))
 
 system_ss.add(files('core.c'))
+system_ss.add(files('cpu-slot.c'))
 system_ss.add(when: 'CONFIG_CPU_CLUSTER', if_true: files('cluster.c'))
 
 system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
diff --git a/include/hw/cpu/cpu-slot.h b/include/hw/cpu/cpu-slot.h
new file mode 100644
index 000000000000..9d02d5de578e
--- /dev/null
+++ b/include/hw/cpu/cpu-slot.h
@@ -0,0 +1,72 @@
+/*
+ * CPU slot abstraction header
+ *
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef CPU_SLOT_H
+#define CPU_SLOT_H
+
+#include "hw/cpu/cpu-topology.h"
+#include "hw/qdev-core.h"
+#include "hw/sysbus.h"
+#include "qapi/qapi-types-machine-common.h"
+#include "qom/object.h"
+
+/**
+ * CPUTopoStatEntry:
+ * @total_instances: Total number of topological instances at the same level
+ *                   that are currently inserted in CPU slot
+ * @max_instances: Maximum number of topological instances at the same level
+ *                 under the parent topological container
+ */
+typedef struct CPUTopoStatEntry {
+    int total_instances;
+    int max_instances;
+} CPUTopoStatEntry;
+
+/**
+ * CPUTopoStat:
+ * @entries: Detail count information for valid topology levels under
+ *           CPU slot
+ * @curr_levels: Current CPU topology levels inserted in CPU slot
+ */
+typedef struct CPUTopoStat {
+    /* TODO: Exclude invalid and default levels. */
+    CPUTopoStatEntry entries[CPU_TOPOLOGY_LEVEL__MAX];
+    DECLARE_BITMAP(curr_levels, CPU_TOPOLOGY_LEVEL__MAX);
+} CPUTopoStat;
+
+#define TYPE_CPU_SLOT "cpu-slot"
+OBJECT_DECLARE_SIMPLE_TYPE(CPUSlot, CPU_SLOT)
+
+/**
+ * CPUSlot:
+ * @cores: Queue consisting of all the cores in the topology tree
+ *     where the cpu-slot is the root. cpu-slot can maintain similar
+ *     queues for other topology levels to facilitate traversal
+ *     when necessary.
+ * @stat: Topological statistics for topology tree.
+ * @bus: CPU bus to add the children topology device.
+ * @supported_levels: Supported topology levels for topology tree.
+ * @listener: Hooks to listen realize() and unrealize() of topology
+ *            device.
+ */
+struct CPUSlot {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    CPUBusState bus;
+    CPUTopoStat stat;
+    DECLARE_BITMAP(supported_levels, CPU_TOPOLOGY_LEVEL__MAX);
+
+    DeviceListener listener;
+};
+
+#endif /* CPU_SLOT_H */
-- 
2.34.1
