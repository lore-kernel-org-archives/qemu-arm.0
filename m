Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp117511lfb;
        Tue, 10 Nov 2020 22:03:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdNzu2osbYcfG9eB0uVNF2fI0V2ov1tVpwUFqOgmKHI768/tGmbVpkVgSHLggIJ5WorF95
X-Received: by 2002:a25:c245:: with SMTP id s66mr30477918ybf.304.1605074586548;
        Tue, 10 Nov 2020 22:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605074586; cv=none;
        d=google.com; s=arc-20160816;
        b=N0kteAbr7vxD4H6KRnclU05f51nntOVNmv5annrof2VpyWj78L2llFX3ezY5LuQ5Re
         6fYNWpFp4HgPnsHDfUTwn41051FDTuwsexO97owzRgOMXnGX0wQ4IbSZu+qOJNJ3PvVx
         9th0wMPVHl/ZDfQ3iZLshs062TSRFNcCAvy0NbLjpRMWp37qFASB+NNAI8aSr0xiIRQ5
         vsF2tG+sXCMp2fe6ady33f23T7eIYpmdBYh+HeCca2JiI2mEMHfTHOCe3HKeYcJHJESE
         519h0zjDMICKMdE7JJ+vZmcXt7u7x7suTPxhvjzcCJAKT99//UbqmGjoyYXXg0kHm3yH
         S1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :ironport-sdr:ironport-sdr;
        bh=iqCdqLHB1Pjw6yB0gXUlJgE70VA2/BVjm1v0HcLqF1w=;
        b=hiHz4uo7bqTsv6wICvHi6cQXjAP4vcE3hyc7HARykgd9ffdY2KMfrhdjhOKhao5zoD
         ej8rqynTvY1A3JOT6iriO+4YKwsgtYGPHIjxOSzfjvzfAiYbeQ5hgbwg4kaHOdrisjDU
         mlFrP6DTRMvvyxkXhx8Lz+UxPR9CY6fcxwsIM+/7qKJniWDDOaN2gGVbaB8UlvXZG9hD
         kps5LZxsN3gdGEMd7YbgN8GV/Dr/KRPjD8zP4PXDDPRKfTanyhWaAjwDmmhCyeUMdDb5
         PeGMn0f7Dxe0JftvItACZy+ab3ywrlx1fVIwgpulMNlY+1QbdYP7N5RM45EYF3/Rx4s8
         6cZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15si982074yba.494.2020.11.10.22.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 22:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcjDl-0001IC-UG
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 01:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcj0R-0006hL-RX; Wed, 11 Nov 2020 00:49:20 -0500
Received: from mga14.intel.com ([192.55.52.115]:60768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcj0M-0008O5-Mw; Wed, 11 Nov 2020 00:49:19 -0500
IronPort-SDR: qxeyGnG0u+t037a7VNH526Cc9z0rDYphRC65Eu/ok4juCeKvNOTFFsuSKrrdDlALnLa0mr56QY
 9Y8z1ob87L0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314700"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314700"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:43 -0800
IronPort-SDR: 6z9hC5rUyBruSW5SBlQ5d2vq0vUb9hLl5rY+AbpeaunUhin7GFXa1+SaBXuMX4qCXcMZ3csjdT
 Y3O3tSnzIicA==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710507"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:42 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 24/25] WIP: i386/cxl: Initialize a host bridge
Date: Tue, 10 Nov 2020 21:47:23 -0800
Message-Id: <20201111054724.794888-25-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111054724.794888-1-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=ben.widawsky@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 00:47:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "open list:Virt" <qemu-arm@nongnu.org>,
 "open list:sPAPR" <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4gb6vDVHdUJ4

This patch allows initializing the primary host bridge as a CXL capable
hostbridge.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

--
This patch is WIP.
---
 hw/arm/virt.c        |  1 +
 hw/core/machine.c    | 26 ++++++++++++++++++++++++++
 hw/i386/acpi-build.c |  8 +++++++-
 hw/i386/microvm.c    |  1 +
 hw/i386/pc.c         |  1 +
 hw/ppc/spapr.c       |  2 ++
 include/hw/boards.h  |  2 ++
 include/hw/cxl/cxl.h |  4 ++++
 8 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27dbeb549e..9d1dafea9f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2475,6 +2475,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     hc->unplug = virt_machine_device_unplug_cb;
     mc->nvdimm_supported = true;
+    mc->cxl_supported = false;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
     mc->default_ram_id = "mach-virt.ram";
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 98b87f76cb..5f37d63da6 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -26,6 +26,7 @@
 #include "sysemu/qtest.h"
 #include "hw/pci/pci.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/cxl/cxl.h"
 #include "migration/vmstate.h"
 
 GlobalProperty hw_compat_5_1[] = {
@@ -491,6 +492,20 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
     nvdimms_state->persistence_string = g_strdup(value);
 }
 
+static bool machine_get_cxl(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->cxl_devices_state->is_enabled;
+}
+
+static void machine_set_cxl(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->cxl_devices_state->is_enabled = value;
+}
+
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 {
     strList *item = g_new0(strList, 1);
@@ -895,6 +910,16 @@ static void machine_initfn(Object *obj)
                                         "Valid values are cpu, mem-ctrl");
     }
 
+    if (mc->cxl_supported) {
+        Object *obj = OBJECT(ms);
+
+        ms->cxl_devices_state = g_new0(CXLState, 1);
+        object_property_add_bool(obj, "cxl", machine_get_cxl, machine_set_cxl);
+        object_property_set_description(obj, "cxl",
+                                        "Set on/off to enable/disable "
+                                        "CXL instantiation");
+    }
+
     if (mc->cpu_index_to_instance_props && mc->get_default_cpu_node_id) {
         ms->numa_state = g_new0(NumaState, 1);
         object_property_add_bool(obj, "hmat",
@@ -931,6 +956,7 @@ static void machine_finalize(Object *obj)
     g_free(ms->device_memory);
     g_free(ms->nvdimms_state);
     g_free(ms->numa_state);
+    g_free(ms->cxl_devices_state);
 }
 
 bool machine_usb(MachineState *machine)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d080e24228..465bde0196 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -53,6 +53,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "hw/hyperv/vmbus-bridge.h"
+#include "hw/cxl/cxl.h"
 
 /* Supported chipsets: */
 #include "hw/southbridge/piix.h"
@@ -1569,8 +1570,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_piix4_pci0_int(dsdt);
     } else {
         sb_scope = aml_scope("_SB");
+        /*
+         * XXX: CXL spec calls this "CXL0", but that would require lots of
+         * changes throughout and so even for CXL enabled, we call it "PCI0"
+         */
         dev = aml_device("PCI0");
-        init_pci_acpi(dev, 0, PCIE);
+        init_pci_acpi(dev, 0,
+                machine->cxl_devices_state->is_enabled ? CXL : PCIE);
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(sb_scope, dev);
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 5428448b70..ed2f992b2a 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -656,6 +656,7 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     mc->auto_enable_numa_with_memdev = false;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = false;
+    mc->cxl_supported = false;
     mc->default_ram_id = "microvm.ram";
 
     /* Avoid relying too much on kernel components */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ecfc497f71..a962a77835 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1694,6 +1694,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
+    mc->cxl_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 227075103e..3d72bad5f2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4422,6 +4422,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
     mc->has_hotpluggable_cpus = true;
     mc->nvdimm_supported = true;
+    mc->cxl_supported = false;
     smc->resize_hpt_default = SPAPR_RESIZE_HPT_ENABLED;
     fwc->get_dev_path = spapr_get_fw_dev_path;
     nc->nmi_monitor_handler = spapr_nmi;
@@ -4571,6 +4572,7 @@ static void spapr_machine_4_2_class_options(MachineClass *mc)
     smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_OFF;
     smc->rma_limit = 16 * GiB;
     mc->nvdimm_supported = false;
+    mc->cxl_supported = false;
 }
 
 DEFINE_SPAPR_MACHINE(4_2, "4.2", false);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a49e3a6b44..f20ccc15c6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -205,6 +205,7 @@ struct MachineClass {
     bool ignore_boot_device_suffixes;
     bool smbus_no_migration_support;
     bool nvdimm_supported;
+    bool cxl_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
     const char *default_ram_id;
@@ -290,6 +291,7 @@ struct MachineState {
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
     struct NVDIMMState *nvdimms_state;
+    struct CXLState *cxl_devices_state;
     struct NumaState *numa_state;
 };
 
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 809ed7de60..6961e47076 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -22,5 +22,9 @@
 #define CXL_HOST_BASE 0xD0000000
 #define CXL_WINDOW_MAX 10
 
+typedef struct CXLState {
+    bool is_enabled;
+} CXLState;
+
 #endif
 
-- 
2.29.2

