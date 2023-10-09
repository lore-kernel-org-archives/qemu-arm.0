Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp48680ejb;
        Mon, 9 Oct 2023 13:38:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH01/EoBRfkWhy92jXigyor/6NLGfVk3KQzbjnC9nZnxW5cHESS+XV+zxb4G0wWiuswBye7
X-Received: by 2002:a5d:4a8a:0:b0:320:4d1:d5f3 with SMTP id o10-20020a5d4a8a000000b0032004d1d5f3mr13562299wrq.6.1696883918303;
        Mon, 09 Oct 2023 13:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696883918; cv=none;
        d=google.com; s=arc-20160816;
        b=hpIZTw6lYnc3BEw3mntXespqHO/Cgf+Dg+0ejke5zuAQhQgUnlLjPbS455mDnIeYC7
         gOHUh9tZ5j7QwgrIk/UpL+ArN5MZUG7HSNjJImKB8gyygpUzfGL7+RSWj2T4B2TwBjPL
         pBJNLm9nF8tqgYSt5WEG8bLrPXUH/a5ct8nnlEYnDpfFy4fFythBEXovO3y0fqCezurJ
         Ki682W5F6iUYHL3vKiB22v7ERuvsw+1HludwpS5SmzU/6vetjq6zw1WYuLZc0FKn+umy
         7N03O6hknAaL5UZM537CVIvenMRvGDx/sbjTP46BaPf8fX+X7OItlzDCrLwOc3vUYmoF
         YtJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=2h09/8YSw24rJAcRB4y8HmmJi1bWWO2tNTf7Ca0WpRw=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=WpS7nOdh1238uwpYLUjPJciqDHlD4yMnjTU0kW2dWfXStC/AfeOwbtSJIOxSmZO71y
         rdQSsRyUQqRcN0oAQGtNl1joSJy95TZl9LkqPHwRwtiRyjXufgmaQbSI6VYpoM5p8yFk
         WQJY2K5HvIIkojiK7/0Zm+DpQPBRpKAb5RbRcNK+qdZCNtoOtg5f5UgkWtdZzdQmFoHe
         rOyP3lr0RBxNnFFaxG6jcBeuntNN632AGhRIxzww6PNFkfzySKm1oSrO+P9SNrEPrQXU
         KdKTHVC50kJItm94LYcafcoUowBqauSUBFSPguwsCA0FDIc/eGky+KxL5Jmx60n7B1un
         c9SA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id v5-20020adfe4c5000000b003176cc76b22si3929632wrm.202.2023.10.09.13.38.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S49pf3HJmz67bjw;
	Tue, 10 Oct 2023 04:38:18 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.175.116) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 21:38:15 +0100
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
Subject: [PATCH V4 05/10] hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
Date: Mon, 9 Oct 2023 21:35:56 +0100
Message-ID: <20231009203601.17584-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009203601.17584-1-salil.mehta@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.175.116]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: fiUWyoLvu4Pu

CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is based on
PCI and is IO port based and hence existing CPUs AML code assumes _CRS objects
would evaluate to a system resource which describes IO Port address. But on ARM
arch CPUs control device(\\_SB.PRES) register interface is memory-mapped hence
_CRS object should evaluate to system resource which describes memory-mapped
base address. Update build CPUs AML function to accept both IO/MEMORY region
spaces and accordingly update the _CRS object.

Legacy CPU Hotplug uses Generic ACPI GPE Block Bit 2 (GPE.2) event handler to
notify OSPM about any CPU hot(un)plug events. GED framework uses new register
interface for cpu-(ctrl)dev. Make AML for GPE.2 event handler conditional.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/cpu.c         | 23 ++++++++++++++++-------
 hw/i386/acpi-build.c  |  2 +-
 include/hw/acpi/cpu.h |  5 +++--
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 45defdc0e2..66a71660ec 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -338,9 +338,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_FW_EJECT_EVENT "CEJF"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
-                    hwaddr io_base,
+                    hwaddr base_addr,
                     const char *res_root,
-                    const char *event_handler_method)
+                    const char *event_handler_method,
+                    AmlRegionSpace rs)
 {
     Aml *ifctx;
     Aml *field;
@@ -367,13 +368,19 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
@@ -699,9 +706,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
index 4d2d40bab5..611d3d044d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1550,7 +1550,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
         };
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
-                       "\\_SB.PCI0", "\\_GPE._E02");
+                       "\\_SB.PCI0", "\\_GPE._E02", AML_SYSTEM_IO);
     }
 
     if (pcms->memhp_io_base && nr_mem) {
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 999caaf510..b87ebfdf4b 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -56,9 +56,10 @@ typedef struct CPUHotplugFeatures {
 } CPUHotplugFeatures;
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
-                    hwaddr io_base,
+                    hwaddr base_addr,
                     const char *res_root,
-                    const char *event_handler_method);
+                    const char *event_handler_method,
+                    AmlRegionSpace rs);
 
 void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list);
 
-- 
2.34.1
