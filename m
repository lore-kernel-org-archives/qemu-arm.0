Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp98062ejr;
        Thu, 13 Jun 2024 16:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/gvm9dfKzykXDSoloB6pYMu0NnSpsZA3Na8O5rdDO/vBagGgfqkg9Lxw4SQ+5MHOg92C8c2/ZFp/4tQiogMnvX3/phnN/
X-Google-Smtp-Source: AGHT+IEftz0NoSxuRucKHBYx4pvYZsqd+Ok1ZCVGkYeKLVZx6Uq/R6MgUMl0c8xj75+uYpoPsCmM
X-Received: by 2002:a17:90a:4a0e:b0:2c2:c3f5:33c3 with SMTP id 98e67ed59e1d1-2c4bd8ace45mr6083776a91.6.1718322196514;
        Thu, 13 Jun 2024 16:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322196; cv=none;
        d=google.com; s=arc-20160816;
        b=IpbgKrztmmP3Fjj7OX4g7wAKZioR7IboClcKd8XkBKoNQC7HpdmdcPqGcL3A27S/oI
         HowTEKWchE0z405egF9TR8wCWsWLZ7TeYzubDXmdH8CndQFhL4tVYEZtoXZxwbeC2d4X
         /I5IfiS3warwbLT9PGeJKMCtUXZqQCWr2mHXzLNEFcsyVYrk2n/cmLQ32PCGMprsGmyG
         2I3iuREW5mJH0bgwA6VtJQ9Uf8QrsnMaQSYjOBj8DDwAW2S1fB8PJyrWVTzgK9papEox
         GwJvSBll4BvSVKzkP2cR7EMqSjihza/XL4jiITDe+0T+1fy8n0exJ0GFmpQ2lSfzpRiW
         qpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=MCYlT5zAQanFwHfA7aNxTPx4orGTi9Tvgf6ycbydaEk=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=O7PRSUC/tyCZ+uzp3N7p5cVA/a4yeGzUG4qsvgFC2fjkVJZYhH73xEKaJKTLcn3FdY
         iQCg4jPOmcPqRwXM346KUY43b/vC54UDrVEaMobSQn/NWjhd/sebHFtbX7aoI5JZNfA3
         cFgkQC7XhIidomWF64x1w1vOuwpk4Q9vvjidmkH2siDMgvrXiHzUTk+TBEmxQ9Clsv5m
         BfdE6Ih5SfgNOpKdSUVZ2pvWqUyFVPYrMcz4DO5n+80vJrds/LsEV2ROPmmNmw7AMsaQ
         DWnV/rJoEfTz9UhIXdBkQ7cYSUzw4v+MGnpcQsJI2WV8+yzMN/hs4EbExy07pAjhxvzW
         ijow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2c4b2bdffc9si114971a91.37.2024.06.13.16.43.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f9S5t55z6K69v;
	Fri, 14 Jun 2024 07:43:08 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id A7338140C72;
	Fri, 14 Jun 2024 07:43:11 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:42:49 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 14/29] hw/acpi: ACPI/AML Changes to reflect the correct _STA.{PRES,ENA} Bits to Guest
Date: Fri, 14 Jun 2024 00:36:24 +0100
Message-ID: <20240613233639.202896-15-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: x8vBHlmr8mAo

ACPI AML changes are required to properly reflect the `_STA.PRES` and `_STA.ENA`
bits to the guest during initialization, when CPUs are hot-plugged, and after
CPUs are hot-unplugged.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c                  | 53 ++++++++++++++++++++++++++++++----
 hw/acpi/generic_event_device.c | 11 +++++++
 include/hw/acpi/cpu.h          |  2 ++
 3 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 4c63514b16..40b8899125 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -64,10 +64,11 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
     cdev = &cpu_st->devs[cpu_st->selector];
     switch (addr) {
     case ACPI_CPU_FLAGS_OFFSET_RW: /* pack and return is_* fields */
-        val |= cdev->cpu ? 1 : 0;
+        val |= cdev->is_enabled ? 1 : 0;
         val |= cdev->is_inserting ? 2 : 0;
         val |= cdev->is_removing  ? 4 : 0;
         val |= cdev->fw_remove  ? 16 : 0;
+        val |= cdev->is_present ? 32 : 0;
         trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
         break;
     case ACPI_CPU_CMD_DATA_OFFSET_RW:
@@ -230,7 +231,23 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
     state->dev_count = id_list->len;
     state->devs = g_new0(typeof(*state->devs), state->dev_count);
     for (i = 0; i < id_list->len; i++) {
-        state->devs[i].cpu =  CPU(id_list->cpus[i].cpu);
+        struct CPUState *cpu = CPU(id_list->cpus[i].cpu);
+        /*
+         * In most archs, CPUs which are ACPI 'present' are also ACPI 'enabled'
+         * by default. And these states are consistent at QOM and ACPI level.
+         */
+        if (qemu_enabled_cpu(cpu)) {
+            state->devs[i].cpu = cpu;
+            state->devs[i].is_present = true;
+            state->devs[i].is_enabled = true;
+        } else {
+            state->devs[i].is_enabled = false;
+            /*
+             * Some archs might expose 'disabled' QOM CPUs as ACPI 'present'.
+             * Hence, these states at QOM and ACPI level might be inconsistent.
+             */
+            state->devs[i].is_present = qemu_present_cpu(cpu);
+        }
         state->devs[i].arch_id = id_list->cpus[i].arch_id;
     }
     memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, state,
@@ -263,6 +280,8 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
     }
 
     cdev->cpu = CPU(dev);
+    cdev->is_present = true;
+    cdev->is_enabled = true;
     if (dev->hotplugged) {
         cdev->is_inserting = true;
         acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
@@ -294,6 +313,11 @@ void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
         return;
     }
 
+    cdev->is_enabled = false;
+    if (!qemu_persistent_cpu(CPU(dev))) {
+        cdev->is_present = false;
+    }
+
     cdev->cpu = NULL;
 }
 
@@ -304,6 +328,8 @@ static const VMStateDescription vmstate_cpuhp_sts = {
     .fields = (const VMStateField[]) {
         VMSTATE_BOOL(is_inserting, AcpiCpuStatus),
         VMSTATE_BOOL(is_removing, AcpiCpuStatus),
+        VMSTATE_BOOL(is_present, AcpiCpuStatus),
+        VMSTATE_BOOL(is_enabled, AcpiCpuStatus),
         VMSTATE_UINT32(ost_event, AcpiCpuStatus),
         VMSTATE_UINT32(ost_status, AcpiCpuStatus),
         VMSTATE_END_OF_LIST()
@@ -341,6 +367,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_REMOVE_EVENT  "CRMV"
 #define CPU_EJECT_EVENT   "CEJ0"
 #define CPU_FW_EJECT_EVENT "CEJF"
+#define CPU_PRESENT       "CPRS"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                     build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
@@ -399,7 +426,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
         /* tell firmware to do device eject, write only */
         aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
-        aml_append(field, aml_reserved_field(3));
+        /* 1 if present, read only */
+        aml_append(field, aml_named_field(CPU_PRESENT, 1));
+        aml_append(field, aml_reserved_field(2));
         aml_append(field, aml_named_field(CPU_COMMAND, 8));
         aml_append(cpu_ctrl_dev, field);
 
@@ -429,6 +458,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         Aml *ctrl_lock = aml_name("%s.%s", cphp_res_path, CPU_LOCK);
         Aml *cpu_selector = aml_name("%s.%s", cphp_res_path, CPU_SELECTOR);
         Aml *is_enabled = aml_name("%s.%s", cphp_res_path, CPU_ENABLED);
+        Aml *is_present = aml_name("%s.%s", cphp_res_path, CPU_PRESENT);
         Aml *cpu_cmd = aml_name("%s.%s", cphp_res_path, CPU_COMMAND);
         Aml *cpu_data = aml_name("%s.%s", cphp_res_path, CPU_DATA);
         Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
@@ -457,13 +487,26 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         {
             Aml *idx = aml_arg(0);
             Aml *sta = aml_local(0);
+            Aml *ifctx2;
+            Aml *else_ctx;
 
             aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
             aml_append(method, aml_store(idx, cpu_selector));
             aml_append(method, aml_store(zero, sta));
-            ifctx = aml_if(aml_equal(is_enabled, one));
+            ifctx = aml_if(aml_equal(is_present, one));
             {
-                aml_append(ifctx, aml_store(aml_int(0xF), sta));
+                ifctx2 = aml_if(aml_equal(is_enabled, one));
+                {
+                    /* cpu is present and enabled */
+                    aml_append(ifctx2, aml_store(aml_int(0xF), sta));
+                }
+                aml_append(ifctx, ifctx2);
+                else_ctx = aml_else();
+                {
+                    /* cpu is present but disabled */
+                    aml_append(else_ctx, aml_store(aml_int(0xD), sta));
+                }
+                aml_append(ifctx, else_ctx);
             }
             aml_append(method, ifctx);
             aml_append(method, aml_release(ctrl_lock));
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 63226b0040..e92ce07955 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -333,6 +333,16 @@ static const VMStateDescription vmstate_memhp_state = {
     }
 };
 
+static const VMStateDescription vmstate_cpuhp_state = {
+    .name = "acpi-ged/cpuhp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_CPU_HOTPLUG(cpuhp_state, AcpiGedState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_ged_state = {
     .name = "acpi-ged-state",
     .version_id = 1,
@@ -381,6 +391,7 @@ static const VMStateDescription vmstate_acpi_ged = {
     },
     .subsections = (const VMStateDescription * const []) {
         &vmstate_memhp_state,
+        &vmstate_cpuhp_state,
         &vmstate_ghes_state,
         NULL
     }
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 48cded697c..07b524b713 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -24,6 +24,8 @@ typedef struct AcpiCpuStatus {
     uint64_t arch_id;
     bool is_inserting;
     bool is_removing;
+    bool is_present;
+    bool is_enabled;
     bool fw_remove;
     uint32_t ost_event;
     uint32_t ost_status;
-- 
2.34.1
