Received: by 2002:a05:7022:fd07:b0:7c:9548:a19d with SMTP id up7csp4598250dlb;
        Sun, 19 May 2024 14:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSrowss01wf8R5F2lwxUmBjaowE7cRxEl7R+Qtwhzw5AtKm4qnRpqj8vn69PTb+/lwdVBTPexENgahwoj6tNrwGf6YSCCe
X-Google-Smtp-Source: AGHT+IHCNFGHQ7hXhaFTtyYh1XPvhYrEHzFYaPFaUfmbv85GNR4kVX2yj7oEPlnns8WlRSRwOmFd
X-Received: by 2002:a05:600c:1381:b0:41f:ef1e:7314 with SMTP id 5b1f17b1804b1-41fef1e7575mr253593485e9.33.1716152972779;
        Sun, 19 May 2024 14:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716152972; cv=none;
        d=google.com; s=arc-20160816;
        b=lNbYPNaK3Jogqi0934jLiJ+h/gFwI9up11iQ9gh5kRDU452/SE1URNOEYO+T5ZxeGe
         aNSg7tHQkd8kPzgw+JKesDlMQtrv417tq8qvd4W0EoARDWxpqJKyBhac3jwvFCd7dAeq
         mub5uqzNMni+SywnztFX5I8W47I4lkFVt2EHadQzsONBFxXCbqtGmmCZO7wP08D2AAMk
         JPQFxYts1hv/ptp0tOxob+dR7g0FlIDlIxfVF9iHReVHVBVu4phtke2u2CUKImE3FZOU
         hqXHfZrMAL0YAoODNSOrY+SaYTxShc3y3sZEO5Y23QqRwIw4RjsmhA0/i+XligCT2bDG
         2+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=xOxtPV54mOZzPh34LQeNF2CBM1BnpW/+D+eFL4KmjtQ=;
        fh=ESkCDJy4SlBfmiW/LaxStj1s4ONFbSiMcQYeaiK5m7w=;
        b=izrufziD8bmOJuei4Qpua3tYlCZbjbILeFrLsYEku+oaB4/yPivxcMhjb6rEKl+Iq+
         ESxxEhFkbtKN3/ghNgl6cdBuYhq3dLqWeoyQf/TIiht1sbjCP/sHL5n7rzAtpU7cqIjs
         TAGy+zCT5Sq3zQbrzC+8kyvfX9Ki82Re+WH15FADPjw1Olt9FK1/8gII6GQDk4Zv02dj
         H4vVWVYBp/Ujqhr4DNYh3vOJJylY7czIa8gz13oBvBEjR+/GWplXEx5qwSwNtvm2/Y5Y
         RknB0bYeusJ861cdZ6PISMTpUYf0XyY6/tzA64ZlwAGuguf7QD4sAYes4C1NdiZhG1KS
         dkLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-41fcfe63934si137986605e9.201.2024.05.19.14.09.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2024 14:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VjCws51RJz6K8lH;
	Mon, 20 May 2024 05:08:45 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id B3765140B2F;
	Mon, 20 May 2024 05:09:31 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.126.174.235) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 19 May 2024 22:09:10 +0100
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
 Cameron <Jonathan.Cameron@huawei.com>, Shaoqin Huang <shahuang@redhat.com>
Subject: [PATCH V9 5/8] hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
Date: Sun, 19 May 2024 22:06:17 +0100
Message-ID: <20240519210620.228342-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519210620.228342-1-salil.mehta@huawei.com>
References: <20240519210620.228342-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.174.235]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: g7UXZ2Yq2iYE

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
