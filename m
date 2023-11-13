Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1595293ejc;
        Mon, 13 Nov 2023 12:14:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWR6cWrZU7Gd5DLcPZTyte9bKLjfemtG2MOocQWiKHeN0uYwQaTwvRMjXv2q+1tXea3paJ
X-Received: by 2002:a05:6000:1a8f:b0:319:8a66:f695 with SMTP id f15-20020a0560001a8f00b003198a66f695mr6956385wry.55.1699906474055;
        Mon, 13 Nov 2023 12:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699906474; cv=none;
        d=google.com; s=arc-20160816;
        b=CTc5bg5d2GuapgDvTQNfncWgJiruNmW3oHTPxCruCE3KdCOeZLfRdgLZjYm901Qc0V
         uMM0RCNUA7QgeaO0bIn3vPlVQ6lXT0HUSL/xOCaMfGQwkfZ/EyKpNj4rty0Cc7C6Idde
         uSI12XMLfj4gJSzxlJgi6DHC6XMoTybmEaUpiK16qvJGQ71PVAF2MZ6tOcOgvBG9EDWT
         edO8o6E9uK+PPivEVve/X31CXtMPbw2yYre2aVSwSrDYP/uk1YMe4SlIcaeGzKfafMR5
         UARr3S3QhoFWluCv3mvg3+D93jHLiDOWMNHHHmeQNtz4faBZKX7wqYp74CCLcgU5nHZb
         45OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=0Y1+zTpwD1/9sB3XBcLNCgBlctvP5fHBdzN2b5y1eO4=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=B4ppqKYJOvG7itCzouAztrHcvLLo7iBDzGXZP8HwYw4pME9u6CLXZoMXAJl+FXvaeX
         rgATMsZIu+e+VWx1cWdpPtG17SsdKlSNFiAmReKhM/9D7Bt0e2UfFCqGNhyZqQ49MaRl
         o4leGqD5zAAiiNFabT7OAPuCup1IzyJpL5iYVsySnOoiySIzt6nNwQUWwanwATdPE26l
         zCE1SvsbywKCny49WNY62wpO4pnKHSB0uabaORh8wUzvm9/F5GSsFd9H6r4h3XvIkXj1
         ayTCuoxSFBXqfV9Ev5YOq+y99//PRPr0iQx/k3/q/cSSYcPwESdeX/Zo26TVMjKBz3q+
         CTAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id bq4-20020a5d5a04000000b0032f7d6e316esi3658436wrb.96.2023.11.13.12.14.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2023 12:14:34 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4STgWn1qzrz686DL;
	Tue, 14 Nov 2023 04:09:57 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.147.128) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 13 Nov 2023 20:14:15 +0000
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
	<linuxarm@huawei.com>
Subject: [PATCH V7 5/8] hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
Date: Mon, 13 Nov 2023 20:12:33 +0000
Message-ID: <20231113201236.30668-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231113201236.30668-1-salil.mehta@huawei.com>
References: <20231113201236.30668-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.147.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 74SKyZDtUFV7

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
---
 hw/acpi/cpu.c         | 23 ++++++++++++++++-------
 hw/i386/acpi-build.c  |  3 ++-
 include/hw/acpi/cpu.h |  5 +++--
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index de1f9295dc..5b0eaad1c5 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -339,9 +339,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
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
@@ -366,13 +367,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
@@ -696,9 +703,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
index 3f2b27cf75..f9f31f9db5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1550,7 +1550,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
         };
         build_cpus_aml(dsdt, machine, opts, pc_madt_cpu_entry,
-                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02");
+                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02",
+                       AML_SYSTEM_IO);
     }
 
     if (pcms->memhp_io_base && nr_mem) {
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index bc901660fb..b521a4e0de 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -60,9 +60,10 @@ typedef void (*build_madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
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
