Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp982971ejc;
        Tue, 26 Sep 2023 03:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6Ilk0+iTPh8hkw5J4aSrfld9sHRg/NFjLYEpRJ7CjRY+Aes0VwZq1oa/WKW/vnG6xLKF1
X-Received: by 2002:adf:e74e:0:b0:321:6bae:f764 with SMTP id c14-20020adfe74e000000b003216baef764mr7467900wrn.23.1695723082317;
        Tue, 26 Sep 2023 03:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723082; cv=none;
        d=google.com; s=arc-20160816;
        b=uG5PRC7rRkapVVFFnyAmeukFxdl45cbcyYTfmaxlbbsCN6Jck5gJOBEXmKFmPZpy3M
         kr1RK7wKtBWJTcSW7Ce92aqMAH9i8heOh+oAru40dDJ9jMZRfbUthpWF72gqRiYdzO1d
         8dH+x9ADcGorMlDVreUyVgFuHQix+Hf4QyVUXZmijXrWOTi5OVDr8frRVGzZxA7anxxb
         VTuPtNwnm9bBeDyUthiRVtIZQJGzkrNLWV1719c8pX5N3Tef3ldqm7bKg2bpcPkGA39f
         SSehfj1jHcUXnGBgqwRS7dLPJUipp/nHTj0ExIcyOIKC22jK73W4p3Lfhbc25kCQa1TA
         pnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=RZ+JlWp8OjAUfQOSWWDQRh+a72nkqhmaOy3xAfQzwsA=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=06wXIjwCpPE3RRlR7Ue29FkRNrmRNDJgZ4/GfghSvjNypfF660/g9Gq8uXn3Qbr0lp
         mp1QJY8eRlgcidjjSod2zjlhkR7F/gHbeEYITt0Bk6H3bZVIy8+cs6BQZjpbURSvEwH5
         GIzzL8NSzzgFhn4mqGy65SbIHmWQzAFlA2PjdWjKtrGwnzb0FeuqzkVZGa/7V8wK4A0I
         6K1oMqfq7UMMLabJ7X9nKyaAfMmvdT2IhuUofzl8i84rfbZk8Rrdzhak5tu/OUzwccDm
         tiVmobXiK/aWsTQndnYhOOda1bG6kuwEzY50Lr37wYtTl9owvevCfd5QHgHIF0/tTV6J
         0OOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g20-20020a05600c4c9400b0040541362eddsi4811866wmp.200.2023.09.26.03.11.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:11:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwTp3Tyvz6K7NW;
	Tue, 26 Sep 2023 18:10:06 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:11:02 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 19/37] hw/acpi: ACPI/AML Changes to reflect the correct _STA.{PRES,ENA} Bits to Guest
Date: Tue, 26 Sep 2023 11:04:18 +0100
Message-ID: <20230926100436.28284-20-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 49jzAy6PktFY

ACPI AML changes to properly reflect the _STA.PRES and _STA.ENA Bits to the
guest during initialzation, when CPUs are hotplugged and after CPUs are
hot-unplugged.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c                  | 49 +++++++++++++++++++++++++++++++---
 hw/acpi/generic_event_device.c | 11 ++++++++
 include/hw/acpi/cpu.h          |  2 ++
 3 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 232720992d..e1299696d3 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -63,10 +63,11 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
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
@@ -228,7 +229,21 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
         struct CPUState *cpu = CPU(id_list->cpus[i].cpu);
         if (qemu_present_cpu(cpu)) {
             state->devs[i].cpu = cpu;
+            state->devs[i].is_present = true;
+        } else {
+            if (qemu_persistent_cpu(cpu)) {
+                state->devs[i].is_present = true;
+            } else {
+                state->devs[i].is_present = false;
+            }
         }
+
+        if (qemu_enabled_cpu(cpu)) {
+            state->devs[i].is_enabled = true;
+        } else {
+            state->devs[i].is_enabled = false;
+        }
+
         state->devs[i].arch_id = id_list->cpus[i].arch_id;
     }
     memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, state,
@@ -261,6 +276,8 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
     }
 
     cdev->cpu = CPU(dev);
+    cdev->is_present = true;
+    cdev->is_enabled = true;
     if (dev->hotplugged) {
         cdev->is_inserting = true;
         acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
@@ -292,6 +309,11 @@ void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
         return;
     }
 
+    cdev->is_enabled = false;
+    if (!qemu_persistent_cpu(CPU(dev))) {
+        cdev->is_present = false;
+    }
+
     cdev->cpu = NULL;
 }
 
@@ -302,6 +324,8 @@ static const VMStateDescription vmstate_cpuhp_sts = {
     .fields      = (VMStateField[]) {
         VMSTATE_BOOL(is_inserting, AcpiCpuStatus),
         VMSTATE_BOOL(is_removing, AcpiCpuStatus),
+        VMSTATE_BOOL(is_present, AcpiCpuStatus),
+        VMSTATE_BOOL(is_enabled, AcpiCpuStatus),
         VMSTATE_UINT32(ost_event, AcpiCpuStatus),
         VMSTATE_UINT32(ost_status, AcpiCpuStatus),
         VMSTATE_END_OF_LIST()
@@ -339,6 +363,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_REMOVE_EVENT  "CRMV"
 #define CPU_EJECT_EVENT   "CEJ0"
 #define CPU_FW_EJECT_EVENT "CEJF"
+#define CPU_PRESENT       "CPRS"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                     hwaddr base_addr,
@@ -399,7 +424,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
         /* tell firmware to do device eject, write only */
         aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
-        aml_append(field, aml_reserved_field(3));
+        /* 1 if present, read only */
+        aml_append(field, aml_named_field(CPU_PRESENT, 1));
+        aml_append(field, aml_reserved_field(2));
         aml_append(field, aml_named_field(CPU_COMMAND, 8));
         aml_append(cpu_ctrl_dev, field);
 
@@ -429,6 +456,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         Aml *ctrl_lock = aml_name("%s.%s", cphp_res_path, CPU_LOCK);
         Aml *cpu_selector = aml_name("%s.%s", cphp_res_path, CPU_SELECTOR);
         Aml *is_enabled = aml_name("%s.%s", cphp_res_path, CPU_ENABLED);
+        Aml *is_present = aml_name("%s.%s", cphp_res_path, CPU_PRESENT);
         Aml *cpu_cmd = aml_name("%s.%s", cphp_res_path, CPU_COMMAND);
         Aml *cpu_data = aml_name("%s.%s", cphp_res_path, CPU_DATA);
         Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
@@ -457,13 +485,26 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
index d2fa1d0e4a..b84602b238 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -319,6 +319,16 @@ static const VMStateDescription vmstate_memhp_state = {
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
@@ -367,6 +377,7 @@ static const VMStateDescription vmstate_acpi_ged = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_memhp_state,
+        &vmstate_cpuhp_state,
         &vmstate_ghes_state,
         NULL
     }
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index b87ebfdf4b..786a30d6d4 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -22,6 +22,8 @@ typedef struct AcpiCpuStatus {
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
