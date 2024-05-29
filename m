Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp901790ejk;
        Wed, 29 May 2024 16:45:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqVyZo7pNHgrIexALU2Ar8nE9Y/5QB89nG6bNU3+AVIl/fG22Y8hz3TQIApuaLNJXUucgqTgYVB9p9YCnRhMJRvUl1R0/M
X-Google-Smtp-Source: AGHT+IHKpRyOoIvaX2vSx010dN7Pos0fcdgK4BfG3PsC0oRmDbDmAYtjJfDIuhOOsmlTxMqA02Re
X-Received: by 2002:a05:600c:5486:b0:420:1284:475 with SMTP id 5b1f17b1804b1-42127818637mr5938485e9.12.1717026324378;
        Wed, 29 May 2024 16:45:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717026324; cv=none;
        d=google.com; s=arc-20160816;
        b=cOngeonz52iC7dGWfEcdWpOL60Y4EB1EPSh2Ozju5lC4WpIdCbwZJKwHQ+xRprdEvX
         wvoYx4zthI2aLHMO0hXJq6i/PbJZM1joePv32WVnKKdAy88uiWH7hB4kTjXj/rmnVSNa
         bMVLj5aWVOXrK0DLZAtlnFfUn02y3MZk9B/3mpan0oRQi0b6XzQLtn6UFv+nwqGovy9m
         2SKXlpJAXB7hFL6I0rTHLt27lUHy3dn8W+HIqGG8X6V9V9gfHCux2/8JlJrAkU0qoxLb
         +hgN3pQR/At6F+9g3jmFyRU51+9qWe3auRkTAixFaWCmJyoJkAKchBZifTzo/rZd4jEi
         dczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=tALMS3Jb+5EphxGlSm8+jjwAHKeOcILEHP7gOqamHoo=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=Jclt9GTz2q7MOkUZro2ogitERMKyfgB/L8BXx18Ag5XmmxFQWTU4SRA8lkAqvdDwnU
         hswz28k589qpImZ3mr2EtdY68eefd0NMqo5p/+DKCjZ8wl4/a509sO8nSaWbRPkZ2/XZ
         eUtMauGKRV1N8G6bEtVGiK0sDLQt16jGiLVi23zforL3ieFxPGEKLabSdSp4kWimz0e2
         lvJfgXdsXYsZirLIXAmF1LI9fSEJdsZ78DO6xceWSs7fE42j5hQbbcvjxhGFIctKGFxn
         ecQ3OL9wZ+lVCFvXbehMwPQ+h1Phm0Y2t8Cx+HkxtH6kEq2RVK7kdQTJ6857dhGGEnze
         c0Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35579d7afafsi7285346f8f.168.2024.05.29.16.45.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2024 16:45:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VqQrL66llz688d6;
	Thu, 30 May 2024 07:41:22 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 31638140A08;
	Thu, 30 May 2024 07:45:23 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.246.47) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 00:45:01 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Shaoqin Huang <shahuang@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH V12 5/8] hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
Date: Thu, 30 May 2024 00:42:38 +0100
Message-ID: <20240529234241.205053-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529234241.205053-1-salil.mehta@huawei.com>
References: <20240529234241.205053-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.246.47]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: myAIh4ZZn0Yx

CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is IO port
based and existing CPUs AML code assumes _CRS objects would evaluate to a system
resource which describes IO Port address. But on ARM arch CPUs control
device(\\_SB.PRES) register interface is memory-mapped hence _CRS object should
evaluate to system resource which describes memory-mapped base address. Update
build CPUs AML function to accept both IO/MEMORY region spaces and accordingly
update the _CRS object.

On x86, CPU Hotplug uses Generic ACPI GPE Block Bit 2 (GPE.2) event handler to
notify OSPM about any CPU hot(un)plug events. Latest CPU Hotplug is based on
ACPI Generic Event Device framework and uses ACPI GED device for the same. Not
all architectures support GPE based CPU Hotplug event handler. Hence, make AML
for GPE.2 event handler conditional.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Tested-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/acpi/cpu.c         | 23 ++++++++++++++++-------
 hw/i386/acpi-build.c  |  3 ++-
 include/hw/acpi/cpu.h |  5 +++--
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index af2b6655d2..4c63514b16 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -343,9 +343,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_FW_EJECT_EVENT "CEJF"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
-                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
+                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
                     const char *res_root,
-                    const char *event_handler_method)
+                    const char *event_handler_method,
+                    AmlRegionSpace rs)
 {
     Aml *ifctx;
     Aml *field;
@@ -370,13 +371,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         aml_append(cpu_ctrl_dev, aml_mutex(CPU_LOCK, 0));
 
         crs = aml_resource_template();
-        aml_append(crs, aml_io(AML_DECODE16, io_base, io_base, 1,
+        if (rs == AML_SYSTEM_IO) {
+            aml_append(crs, aml_io(AML_DECODE16, base_addr, base_addr, 1,
                                ACPI_CPU_HOTPLUG_REG_LEN));
+        } else {
+            aml_append(crs, aml_memory32_fixed(base_addr,
+                               ACPI_CPU_HOTPLUG_REG_LEN, AML_READ_WRITE));
+        }
+
         aml_append(cpu_ctrl_dev, aml_name_decl("_CRS", crs));
 
         /* declare CPU hotplug MMIO region with related access fields */
         aml_append(cpu_ctrl_dev,
-            aml_operation_region("PRST", AML_SYSTEM_IO, aml_int(io_base),
+            aml_operation_region("PRST", rs, aml_int(base_addr),
                                  ACPI_CPU_HOTPLUG_REG_LEN));
 
         field = aml_field("PRST", AML_BYTE_ACC, AML_NOLOCK,
@@ -700,9 +707,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
     aml_append(sb_scope, cpus_dev);
     aml_append(table, sb_scope);
 
-    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
-    aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
-    aml_append(table, method);
+    if (event_handler_method) {
+        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
+        aml_append(table, method);
+    }
 
     g_free(cphp_res_path);
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 53f804ac16..b73b136605 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1537,7 +1537,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
         };
         build_cpus_aml(dsdt, machine, opts, pc_madt_cpu_entry,
-                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02");
+                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02",
+                       AML_SYSTEM_IO);
     }
 
     if (pcms->memhp_io_base && nr_mem) {
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index e6e1a9ef59..48cded697c 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -61,9 +61,10 @@ typedef void (*build_madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
                                   GArray *entry, bool force_enabled);
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
-                    build_madt_cpu_fn build_madt_cpu, hwaddr io_base,
+                    build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
                     const char *res_root,
-                    const char *event_handler_method);
+                    const char *event_handler_method,
+                    AmlRegionSpace rs);
 
 void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
 
-- 
2.34.1
