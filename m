Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp100438njk;
        Tue, 16 Jul 2024 04:17:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyXP026N3pXuQlhzOHv8ZZZbD8O0fT4vqEy8d8Zr9fUqcWSTU4tk0RM19K768DiDLXUCZBZtIcakw3nEVEiArzTWyAq73h
X-Google-Smtp-Source: AGHT+IFGjGBa3GhAb2cxGNn4QPBtwzzgOzEcpmdr4L4FjGy244rd0RmZcRW7tlt8wFlVcgb19EE/
X-Received: by 2002:a05:6a21:e86:b0:1bd:232a:946f with SMTP id adf61e73a8af0-1c3f1241a57mr2181981637.34.1721128632120;
        Tue, 16 Jul 2024 04:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721128632; cv=none;
        d=google.com; s=arc-20160816;
        b=W1rMY6WrrWzZSbEEeufGLxjUZpUkevoxvDTetunzceYkXi3HkBk3JhgU27xmJnWIbB
         AUKLbCIeq65IgrBRQQkOL1GUIAb+v9COG86VFUIFI3oY6GlG7YqP4fo8f/VtK24bdXz7
         XD8Ln960v2MrFiInCBRLiqvUOqyjHG1H4hSrosq+b4PCY+brNS5P4EJrXQ/y3LYwwtib
         ELUyIaEXAK81ThC2nNZsefilCdp6LYZn04tNPWYhyMwyKOdz6YedWJVh3X1HpJ947o1G
         vExnMxdtO0aXgC0OmiFMWEj7e3bnEml2NV0HU4s52I35JYldH5oR2DaLCxHtb/y3wwp5
         nDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=8oRR5Hlz48hwxOBsEZW6/9W3S3Cuh4qmeaeNYBLsFR4=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=Gmbgi9+ef/zYVYId8d5VBhlIaOmItkF04oXTqSpbYhoTqrJbqdRkvMHaAN4AxOFruA
         S9dhp+ZOU9DplGfSvyLfR8TCPaRqmA2EjLph5A09RmVvatAdtPPG4dy6NFFNZg/bB3BP
         QdYlapDMcVmYOgXL+aBbYNJo19zaoFOL5j0Bno0GZOdvnu+STHkXggWZFlt8RcJgcus8
         2hTjZ8pMqzixoOSyBKPZrN3/JRWdBLfQCFWbx2Kdwwl61EsQ9tQA+YtCqR+bZkY1uyzn
         xtynSWuJJMINXnehFrgb8Ve5rLhFO5f8VdYr/0/qrT37wZxBqfL4Qw6hRHD9sT8+4Rx+
         Ns1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2e1a72fcca58-70b7eba0544si7146623b3a.54.2024.07.16.04.17.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2024 04:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WNc0v13cSz6K99D;
	Tue, 16 Jul 2024 19:14:55 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id CFB3B1400C8;
	Tue, 16 Jul 2024 19:17:07 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.170.92) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 12:16:49 +0100
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
Subject: [PATCH V16 5/7] hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
Date: Tue, 16 Jul 2024 12:15:00 +0100
Message-ID: <20240716111502.202344-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716111502.202344-1-salil.mehta@huawei.com>
References: <20240716111502.202344-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.170.92]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: 9IGgkg1bT2YY

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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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
