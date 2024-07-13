Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp1457870nji;
        Sat, 13 Jul 2024 11:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaLWjOE7AfIyzQf/ZX76WreVZLZM234lZT8H4r/+sFQX2LjhycSI+x5QikKRiEQa+y9JgYghq9XozIjMYDXqIFay85ikWz
X-Google-Smtp-Source: AGHT+IGQ6f6IuZ0uygtQ0UfWyXTBVQJle7qV7I4gSmm1oViC8MYPZedH1X988vb5dQEUf7uNH00L
X-Received: by 2002:a7b:c38f:0:b0:426:62df:bdf0 with SMTP id 5b1f17b1804b1-426707d8a07mr101104435e9.10.1720895261710;
        Sat, 13 Jul 2024 11:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720895261; cv=none;
        d=google.com; s=arc-20160816;
        b=TkUANzizw27SbxY40vF8HPwvd4E/xbln7rk95SSZMI5qCFG/md8Gjdaj1vu3BkF4R7
         T62XHcce8b1g6tPnVFa6kzVLpQ+szrLCvnEWGrAAfQ0WglVINSYXmxTvp3ilVY4vU3yK
         F2ggJFVn0+H5GkaV0B7bPPcs9RsOMC2c61mlxvye7BpTLPJUISi21qtOvk5NO4rL52gq
         IeWVFM7k+AHkl/Qfl+KSD/omkgGbdh41sxHsqye7rovs5PpapJF4zewzkfmnR7gLJNt2
         CO3Lte0nB9fhvWr7vHcmm6V67u8oJxATljq2vpYgl7QCyBrVoPo9WEaApnqG2muA2him
         sjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Y108iW7lns4Fl7/3CdmlB55H6zqANSKuC/5FSWYQVfg=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=fQRuzS7QYiKsOY/BYgu36OABFhJModjrLowyv6ZNU/ob3jNkieMXHvUwvoQb4W6Qsq
         nJpXLwGCRvbhigRktRyiZJk4GQ8H+Z3jTEUZOwniXR4ry2G3oP9oPK6WeOPXAFX7wE+E
         IaFtoO/jFsCbf3skzxqawFYZElaqMmeFOEFcjBg9gOrsyvM72qrk6EjJ5f5Q+zUHK8Ks
         SI/cAApQh+451JZXIYpWWofLTrDLeedW3IEL5kdt+H4AXfYV68ZOXQzRzRz2fGy+aKSL
         398tdXUVHBs19/EXGj3TUxMkhQdeXuGg+hmFWiVxz5XTzPQJhebWMw/y7qSrMWEmyUHA
         82gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3680db0cb00si1005616f8f.762.2024.07.13.11.27.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2024 11:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WLxkJ6yZ4z67f4J;
	Sun, 14 Jul 2024 02:26:32 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id A85AE140A70;
	Sun, 14 Jul 2024 02:27:40 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.172.138) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 19:27:22 +0100
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
Subject: [PATCH V15 5/7] hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
Date: Sat, 13 Jul 2024 19:25:14 +0100
Message-ID: <20240713182516.1457-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713182516.1457-1-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.172.138]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: exGpAGhhw5Dk

CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is IO port
based and existing CPUs AML code assumes _CRS objects would evaluate to a system
resource which describes IO Port address. But on ARM arch CPUs control
device(\\_SB.PRES) register interface is memory-mapped hence _CRS object should
evaluate to system resource which describes memory-mapped base address. Update
build CPUs AML function to accept both IO/MEMORY region spaces and accordingly
update the _CRS object.

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
 hw/acpi/cpu.c         | 17 +++++++++++++----
 hw/i386/acpi-build.c  |  3 ++-
 include/hw/acpi/cpu.h |  5 +++--
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index cf5e9183e4..5cb60ca8bc 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -338,9 +338,10 @@ const VMStateDescription vmstate_cpu_hotplug = {
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
@@ -364,14 +365,22 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
             aml_name_decl("_UID", aml_string("CPU Hotplug resources")));
         aml_append(cpu_ctrl_dev, aml_mutex(CPU_LOCK, 0));
 
+        assert((rs == AML_SYSTEM_IO) || (rs == AML_SYSTEM_MEMORY));
+
         crs = aml_resource_template();
-        aml_append(crs, aml_io(AML_DECODE16, io_base, io_base, 1,
+        if (rs == AML_SYSTEM_IO) {
+            aml_append(crs, aml_io(AML_DECODE16, base_addr, base_addr, 1,
                                ACPI_CPU_HOTPLUG_REG_LEN));
+        } else if (rs == AML_SYSTEM_MEMORY) {
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
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f4e366f64f..5d4bd2b710 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1536,7 +1536,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
         };
         build_cpus_aml(dsdt, machine, opts, pc_madt_cpu_entry,
-                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02");
+                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02",
+                       AML_SYSTEM_IO);
     }
 
     if (pcms->memhp_io_base && nr_mem) {
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index df87b15997..32654dc274 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -63,9 +63,10 @@ typedef void (*build_madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
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
