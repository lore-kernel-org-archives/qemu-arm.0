Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3221780ejc;
        Fri, 29 Sep 2023 05:46:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjfOZUWuluZKV1Ow/j3Aoqe4IsFszBes8VJmvKeR3uEU4ZK/dd/hKO5QTn8zm16Mh6iRwQ
X-Received: by 2002:adf:fa90:0:b0:31a:d9bc:47a2 with SMTP id h16-20020adffa90000000b0031ad9bc47a2mr3766149wrr.53.1695991570694;
        Fri, 29 Sep 2023 05:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695991570; cv=none;
        d=google.com; s=arc-20160816;
        b=j0pnNRUwS1aANbS2iFQPvk0bObBtZGMBtN/bfRetvqbPUr3N+6lghX+m5HyhLYAagM
         GqY6Oh4D6fSocvHONwxg7BP9Iqg4zQhtLD9CS4uYThkchoNVvdGYGL655ljFtu3Cygfc
         hULO89oxmsaiSOF6RZl/FW4aBTKUzIBng9LbGTmwpRwbLgAHlsk09vmEJ1Mr5NrZ9R8Y
         +Xl/PTEgt4eTgvEf4+/3RbhCY8PIge0r9wzLtVDSEVWoZecnrbqu8QGTKim6xMHjEwUh
         KoeYtx+xemTX4VIazLLtGt4wd9R3EEaQIiBD02R2HeKG6lcAHM8hrVHCCSsYEGQUUeUv
         l89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=d+TkzbC2DNNGyF1HPDUlyXQKmTKqj2LZiKPZsTWyY+A=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=DoQz55VlDzR3uVIMlAePmeUlaYAHfjNCeLCpriK79YDzqngAQSBH4Ff/be2SB1Jsh2
         2IS28vp+B0Vf3sInvwPAqmgo0tn/DAMwajbc0nfwO+pUZmoJhxmx4zpJSGnMI2TUa5Ay
         ayYMolzRuNGyfzszRhh9tx93RhGsDfFZRvVnrfVrg74VwMqhILimo+kCPHeFzNGRQDSb
         Co0yfEqXDTjsL0wKPboisqiB+0ocI0nWJOqzEQrtiH7ld0EUnetXCJy07xpsGtpgxfNv
         f/QVCy4wZNDbv1x3OIxSGm8C2qAiap9fr5MQsiNXPbKzaaFvdR39Iyr+HBgrFs/ZFS38
         EDUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id h13-20020adff18d000000b0031ff20d2bddsi2013781wro.197.2023.09.29.05.46.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:46:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rxqms5bdwz67yyF;
	Fri, 29 Sep 2023 20:44:45 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.156.153) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 13:45:50 +0100
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
Subject: [PATCH 5/9] hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
Date: Fri, 29 Sep 2023 13:43:00 +0100
Message-ID: <20230929124304.13672-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230929124304.13672-1-salil.mehta@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.156.153]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: HxCx4n3Ejf2S

CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is based on
PCI and is IO port based and hence existing cpus AML code assumes _CRS objects
would evaluate to a system resource which describes IO Port address. But on ARM
arch CPUs control device(\\_SB.PRES) register interface is memory-mapped hence
_CRS object should evaluate to system resource which describes memory-mapped
base address.

This cpus AML code change updates the existing inerface of the build cpus AML
function to accept both IO/MEMORY type regions and update the _CRS object
correspondingly.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
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
