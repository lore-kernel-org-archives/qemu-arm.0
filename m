Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1113042njg;
        Wed, 18 Sep 2024 18:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1FZWeYG7DInkuhXMn8VzWVkiwoGZYudoJjJLtvdCLldkQtAmj6+ej7TSLBkRSXVDEqVMNo0cyHtofMA==@linaro.org
X-Google-Smtp-Source: AGHT+IHESRHkqR3ZM12CBcKwquQ7mftgwn6KbPTL/scQg8ug1fwxI3sFd08qUpDgi4Ute6csRguR
X-Received: by 2002:a05:622a:3c9:b0:458:4c4f:8080 with SMTP id d75a77b69052e-458602dd736mr432235031cf.19.1726710079514;
        Wed, 18 Sep 2024 18:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726710079; cv=none;
        d=google.com; s=arc-20240605;
        b=cKGxa2hsNysfquRtunBhmH6vc4H9joK062Vl13Eb1IjtPDC32ww3Qdjp4jsyeVTbSw
         ppX1rwD7ycu4A0c4JgGpnpHvM2sod56MSOXzj3XBa53PKUkWmniVY8zq7uMOvHiRGqsZ
         0qXzRvOv889ddOnor1L6BJqEJv37VBjyQcIThVYqtsiyqZjS9HhGPe5xQw90TwgASsEI
         8QYK6b3KB7yJu4pqCfdpWcl2AV311X7je/Vk2IjCGnpbO2au3XTKLvJ+6AgfoIzEWH9T
         Ng7GMatDG60QRlHe9jfXOvhKZixfXWGt9a2PmWrlTT4nJYz9GDu7sV/64lk6nEEPM92E
         yPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZWuxI8zDPArqRC18AJ6XhUJ3c6RCtRaY+dmTuFhd6Rg=;
        fh=N9JXs6UlidM8EsUInW73fWjlYrhprlUzJ9DsuKSk+BQ=;
        b=iFy9Q1O0iWEsl4TfbZspce4IMeyAQvj1ZGCE/VJCw2BUP0urhA3kKJHmBwsAEzx4TW
         J726BasD+RFj+hwFNH6YCwfniW+f3F7JR5X4T8csGNpB3ATblyOK2FHvfoZ/UVykzITx
         fGRNxuMRqRoHi05Djfpd+ZRwMzyEBs7BFwNZWPf5mS/DC5TvDFyGWSnG14AljkMeNP59
         mYpfTDTAfvvb4UH3j6fw1hQrNX8LVWslRyCr4a/OwPrqXL+gOZskDFL7ySYAdg6zI4iP
         BJSXt1HL3AX+JcEomNJk0rUm/p+sL7id6I9C8M03U0781A0nt2FppTDk4mXqmSQ48fO8
         i0qQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="SwR/wPXk";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.15])
        by mx.google.com with ESMTPS id d75a77b69052e-45b1790cd82si7599641cf.522.2024.09.18.18.41.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 18:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) client-ip=192.198.163.15;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="SwR/wPXk";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.15 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726710079; x=1758246079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e8uNe2XyBy//pc+Jdrf2eDU6ylT8TdayHazakj6xvUI=;
  b=SwR/wPXkU3D2vddYRUpUeb2eWUksuVWB4CQDXh9bCOMP+mnnrGtscHpG
   3sEo57Dp5yg8BQWStjdt8WkyQwWHoEfcz8xtN4YcKibUOCCmn96MFwy6s
   MycS1eOpgaD6bR2ikt++JVzp5LH0gTEs77UtQ24Wglk8+7SSkLp4nCEKr
   9TtAncuep8nJTMjlG69gS/ZRPdu98lqS40/tXp8+PHkIM7595qt57348H
   O7LNelVLAzY8gWBz7a0mQSpPvPTIpRTlTrQweR2eO6H51VYtKeaXRjUbN
   RNWhnuHi/Sl7qCKTJ3k+oJJB3RsMiEPjzijyASLIRQRa3e4g7lrzIFABa
   g==;
X-CSE-ConnectionGUID: 8I2mBNFfQ9CgGKSP+UxwWw==
X-CSE-MsgGUID: FLJgd6gIQ/qNB+yQPArwOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25798105"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25798105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 18:41:17 -0700
X-CSE-ConnectionGUID: FdACOWMXSMOp94R+MXOELA==
X-CSE-MsgGUID: Wk9cMGQHQpOW5if6nrEZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70058986"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2024 18:41:11 -0700
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
Subject: [RFC v2 14/15] i386/cpu: Support CPU plugged in topology tree via bus-finder
Date: Thu, 19 Sep 2024 09:55:32 +0800
Message-Id: <20240919015533.766754-15-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919015533.766754-1-zhao1.liu@intel.com>
References: <20240919015533.766754-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9QrEfscHDEcI

Use topology sub IDs or APIC ID to locate parent topology device and
bus.

This process naturally verifies the correctness of topology-related IDs,
making it possible to drop the existing topology ID sanity checks once
x86 machine supports topology tree.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86-common.c  | 99 ++++++++++++++++++++++++++++++++++---------
 include/hw/i386/x86.h |  2 +
 target/i386/cpu.c     | 11 +++++
 3 files changed, 91 insertions(+), 21 deletions(-)

diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
index a7f082b0a90b..d837aadc9dea 100644
--- a/hw/i386/x86-common.c
+++ b/hw/i386/x86-common.c
@@ -208,6 +208,65 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
     }
 }
 
+static void x86_fixup_topo_ids(MachineState *ms, X86CPU *cpu)
+{
+    /*
+     * die-id was optional in QEMU 4.0 and older, so keep it optional
+     * if there's only one die per socket.
+     */
+    if (cpu->module_id < 0 && ms->smp.modules == 1) {
+        cpu->module_id = 0;
+    }
+
+    /*
+     * module-id was optional in QEMU 9.0 and older, so keep it optional
+     * if there's only one module per die.
+     */
+    if (cpu->die_id < 0 && ms->smp.dies == 1) {
+        cpu->die_id = 0;
+    }
+}
+
+BusState *x86_cpu_get_parent_bus(DeviceState *dev)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    X86MachineState *x86ms = X86_MACHINE(ms);
+    X86CPU *cpu = X86_CPU(dev);
+    X86CPUTopoIDs topo_ids;
+    X86CPUTopoInfo topo_info;
+    BusState *bus;
+
+    x86_fixup_topo_ids(ms, cpu);
+    init_topo_info(&topo_info, x86ms);
+
+    if (cpu->apic_id == UNASSIGNED_APIC_ID) {
+        /* TODO: Make the thread_id and bus index of CPU the same. */
+        topo_ids.smt_id = cpu->thread_id;
+        topo_ids.core_id = cpu->core_id;
+        topo_ids.module_id = cpu->module_id;
+        topo_ids.die_id = cpu->die_id;
+        topo_ids.pkg_id = cpu->socket_id;
+    } else {
+        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
+    }
+
+    bus = x86_find_topo_bus(ms, &topo_ids);
+
+    /*
+     * If APIC ID is not set,
+     * set it based on socket/die/module/core/thread properties.
+     *
+     * The children walking result proves topo ids are valid.
+     * Though module and die are optional, topology tree will create
+     * at least 1 instance by default if the machine supports.
+     */
+    if (bus && cpu->apic_id == UNASSIGNED_APIC_ID) {
+        cpu->apic_id = x86_apicid_from_topo_ids(&topo_info, &topo_ids);
+    }
+
+    return bus;
+}
+
 void x86_rtc_set_cpus_count(ISADevice *s, uint16_t cpus_count)
 {
     MC146818RtcState *rtc = MC146818_RTC(s);
@@ -340,6 +399,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     X86CPU *cpu = X86_CPU(dev);
     CPUX86State *env = &cpu->env;
     MachineState *ms = MACHINE(hotplug_dev);
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     X86MachineState *x86ms = X86_MACHINE(hotplug_dev);
     unsigned int smp_cores = ms->smp.cores;
     unsigned int smp_threads = ms->smp.threads;
@@ -374,26 +434,9 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         set_bit(CPU_TOPOLOGY_LEVEL_DIE, env->avail_cpu_topo);
     }
 
-    /*
-     * If APIC ID is not set,
-     * set it based on socket/die/module/core/thread properties.
-     */
-    if (cpu->apic_id == UNASSIGNED_APIC_ID) {
-        /*
-         * die-id was optional in QEMU 4.0 and older, so keep it optional
-         * if there's only one die per socket.
-         */
-        if (cpu->die_id < 0 && ms->smp.dies == 1) {
-            cpu->die_id = 0;
-        }
-
-        /*
-         * module-id was optional in QEMU 9.0 and older, so keep it optional
-         * if there's only one module per die.
-         */
-        if (cpu->module_id < 0 && ms->smp.modules == 1) {
-            cpu->module_id = 0;
-        }
+    if (cpu->apic_id == UNASSIGNED_APIC_ID &&
+        !mc->smp_props.topo_tree_supported) {
+        x86_fixup_topo_ids(ms, cpu);
 
         if (cpu->socket_id < 0) {
             error_setg(errp, "CPU socket-id is not set");
@@ -409,7 +452,6 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         } else if (cpu->die_id > ms->smp.dies - 1) {
             error_setg(errp, "Invalid CPU die-id: %u must be in range 0:%u",
                        cpu->die_id, ms->smp.dies - 1);
-            return;
         }
         if (cpu->module_id < 0) {
             error_setg(errp, "CPU module-id is not set");
@@ -442,6 +484,21 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         topo_ids.core_id = cpu->core_id;
         topo_ids.smt_id = cpu->thread_id;
         cpu->apic_id = x86_apicid_from_topo_ids(&topo_info, &topo_ids);
+    } else if (cpu->apic_id == UNASSIGNED_APIC_ID &&
+               mc->smp_props.topo_tree_supported) {
+        /*
+         * For this case, CPU is added by specifying the bus. Under the
+         * topology tree, specifying only the bus should be feasible, but
+         * the topology represented by the bus, topo ids, or apic id must
+         * be consistent.
+         *
+         * To simplify, the case with only the bus specified is not supported
+         * at this time.
+         */
+        if (x86_cpu_get_parent_bus(dev) != dev->parent_bus) {
+            error_setg(errp, "Invalid CPU topology ids");
+            return;
+        }
     }
 
     cpu_slot = x86_find_cpu_slot(MACHINE(x86ms), cpu->apic_id, &idx);
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index d43cb3908e65..2a62b4b8d08c 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -138,6 +138,8 @@ void x86_load_linux(X86MachineState *x86ms,
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
 
+BusState *x86_cpu_get_parent_bus(DeviceState *dev);
+
 /* Global System Interrupts */
 
 #define ACPI_BUILD_PCI_IRQS ((1<<5) | (1<<9) | (1<<10) | (1<<11))
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6d9f7dc0872a..90221ceb7313 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -35,12 +35,14 @@
 #include "standard-headers/asm-x86/kvm_para.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/topology.h"
+#include "monitor/bus-finder.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/reset.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/i386/sgx-epc.h"
+#include "hw/i386/x86.h"
 #endif
 
 #include "disas/capstone.h"
@@ -8468,6 +8470,11 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     dc->user_creatable = true;
 
+#ifndef CONFIG_USER_ONLY
+    BusFinderClass *bfc = BUS_FINDER_CLASS(oc);
+    bfc->find_bus = x86_cpu_get_parent_bus;
+#endif
+
     object_class_property_add(oc, "family", "int",
                               x86_cpuid_version_get_family,
                               x86_cpuid_version_set_family, NULL, NULL);
@@ -8520,6 +8527,10 @@ static const TypeInfo x86_cpu_type_info = {
     .abstract = true,
     .class_size = sizeof(X86CPUClass),
     .class_init = x86_cpu_common_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_BUS_FINDER },
+        { }
+    }
 };
 
 /* "base" CPU model, used by query-cpu-model-expansion */
-- 
2.34.1
