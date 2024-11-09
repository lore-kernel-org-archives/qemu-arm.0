Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5290255njc;
        Fri, 8 Nov 2024 16:08:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOJooLsCwKuju5f6SJvlAKJv9Mi1FthyEA87wTN6IayOxcpJ+tnJxuD5ed8P2oEHACJscfsJ25oL9ioA==@linaro.org
X-Google-Smtp-Source: AGHT+IG9gqm42bBhGgcVaV2AEha02s/5Z2IzPHwc3w315a0NgDBfVZ8fP3kragJfT9nkJUdrUXYS
X-Received: by 2002:a05:6830:6509:b0:710:fd8e:1727 with SMTP id 46e09a7af769-71a1c24a489mr5658716a34.18.1731110907972;
        Fri, 08 Nov 2024 16:08:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731110907; cv=none;
        d=google.com; s=arc-20240605;
        b=YyjUD8URYK3h3KcKNjwrqztSfu/hmzP5Eymx0SzTi23z/uNfDqLbRPMtDQ6oJlf3fX
         j5iT9nPdoEpG5GRLm931odr1t2WlHXF84HngWtofnYWz2fQnxAuW+53m2lL3GLaCIVbB
         ZYiIw3gTdrpxG+1bwaxT9AXIRL9QV8xHg5HYdIYm79IhaccPw1BiuJanumOlhbottLYN
         Z7VEvfcIKUkBpTBZAwPp9PJS3cv08jhIEPKilTvdM9Bky/eHzdl42W9cUUFOWyTPGf5r
         K6szrCnMqKuocRGCrUgh7sIXoeU7BeGMA7CW49Gf1dEppJDewFIPtLPhxM3nKsmDUQIV
         t0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=f0rFjRusWArQQ4LQ3MGI+xfKdWYsYns7CL4l38r78ZY=;
        fh=r8ajd3FUMdtDxzqs0wLEINYA6psD113amket9C+CNXU=;
        b=TDZpI/7VhgIGROhSveTRKKOZT5N2XuZc0KjG7omBBeEXp527dF43Y9cr6sHAf1OfBk
         t5Iaf9bi0uNpIQ6NN+h8GhSbNSeD2mHG/kvUeIe66jEWHlavxvTzxao5hwflWTluoUh5
         LCjzBuM1cjM0pj0f2aLN7n52qrVk8VuK1Pd2g1ZFsf9dwG90v0NVrcqDH3y7vYruV5PN
         pgE/8mc92voqQQdmkhnO5RSAxRLyc7OwIrzYdDvtUkq+LZ+SwUqG73XuJIGEuqoqs+hD
         0kW64wQY0uwN+uuUJHpTHUi+fLUOUnHaRJ0LRWyGfNQ80B6hWRc7SW/rStIZS1QSRIYa
         6pmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 46e09a7af769-71a10848f01si3170870a34.113.2024.11.08.16.08.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2024 16:08:27 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XlbkC6MJWz67D3M;
	Sat,  9 Nov 2024 08:08:19 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 043E6140517;
	Sat,  9 Nov 2024 08:08:26 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.150.69) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 9 Nov 2024 01:08:11 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
	<imammedo@redhat.com>
CC: <salil.mehta@huawei.com>, <jonathan.cameron@huawei.com>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<anisinha@redhat.com>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
	<david@redhat.com>, <philmd@linaro.org>, <peterx@redhat.com>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>, <zhao1.liu@intel.com>,
	<linuxarm@huawei.com>, <gustavo.romero@linaro.org>
Subject: [PATCH V2 2/3] Fix: CPUs presence logic in _STA for x86 backward compatability
Date: Sat, 9 Nov 2024 00:07:27 +0000
Message-ID: <20241109000728.206825-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109000728.206825-1-salil.mehta@huawei.com>
References: <20241109000728.206825-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.150.69]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: kyMn4T0wDm3I

Checking `is_present` first can break x86 migration from new Qemu
version to old Qemu. This is because CPRS Bit is not defined in the
older Qemu register block and will always be 0 resulting in check always
failing. Remove CPU_PRESENT Bit to preserve older ABI.

-                If ((\_SB.PCI0.PRES.CPEN == One))
-                {
-                    Local0 = 0x0F
+                If ((\_SB.PCI0.PRES.CPRS == One))
+                {
+                    If ((\_SB.PCI0.PRES.CPEN == One))
+                    {
+                        Local0 = 0x0F
+                    }
+                    Else
+                    {
+                        Local0 = 0x0D
+                    }
                 }

Reported-by: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20241106100047.18901c9d@imammedo.users.ipa.redhat.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c         | 49 ++++++++++++++++---------------------------
 include/hw/acpi/cpu.h |  1 +
 include/hw/core/cpu.h |  1 -
 3 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 23443f09a5..7b0badd08a 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -23,6 +23,8 @@ enum {
     CPHP_CMD_MAX
 };
 
+static bool always_present_cpus;
+
 static ACPIOSTInfo *acpi_cpu_device_status(int idx, AcpiCpuStatus *cdev)
 {
     ACPIOSTInfo *info = g_new0(ACPIOSTInfo, 1);
@@ -79,7 +81,6 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
         val |= cdev->is_inserting ? 2 : 0;
         val |= cdev->is_removing  ? 4 : 0;
         val |= cdev->fw_remove  ? 16 : 0;
-        val |= cdev->cpu ? 32 : 0;
         trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
         break;
     case ACPI_CPU_CMD_DATA_OFFSET_RW:
@@ -246,15 +247,9 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
     memory_region_add_subregion(as, base_addr, &state->ctrl_reg);
 }
 
-static bool should_remain_acpi_present(DeviceState *dev)
+static inline bool should_remain_acpi_present(DeviceState *dev)
 {
-    CPUClass *k = CPU_GET_CLASS(dev);
-    /*
-     * A system may contain CPUs that are always present on one die, NUMA node,
-     * or socket, yet may be non-present on another simultaneously. Check from
-     * architecture specific code.
-     */
-    return k->cpu_persistent_status && k->cpu_persistent_status(CPU(dev));
+    return always_present_cpus;
 }
 
 static AcpiCpuStatus *get_cpu_status(CPUHotplugState *cpu_st, DeviceState *dev)
@@ -362,7 +357,6 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_REMOVE_EVENT  "CRMV"
 #define CPU_EJECT_EVENT   "CEJ0"
 #define CPU_FW_EJECT_EVENT "CEJF"
-#define CPU_PRESENT       "CPRS"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                     build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
@@ -423,9 +417,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
         /* tell firmware to do device eject, write only */
         aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
-        /* 1 if present, read only */
-        aml_append(field, aml_named_field(CPU_PRESENT, 1));
-        aml_append(field, aml_reserved_field(2));
+        aml_append(field, aml_reserved_field(3));
         aml_append(field, aml_named_field(CPU_COMMAND, 8));
         aml_append(cpu_ctrl_dev, field);
 
@@ -455,7 +447,6 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         Aml *ctrl_lock = aml_name("%s.%s", cphp_res_path, CPU_LOCK);
         Aml *cpu_selector = aml_name("%s.%s", cphp_res_path, CPU_SELECTOR);
         Aml *is_enabled = aml_name("%s.%s", cphp_res_path, CPU_ENABLED);
-        Aml *is_present = aml_name("%s.%s", cphp_res_path, CPU_PRESENT);
         Aml *cpu_cmd = aml_name("%s.%s", cphp_res_path, CPU_COMMAND);
         Aml *cpu_data = aml_name("%s.%s", cphp_res_path, CPU_DATA);
         Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
@@ -482,28 +473,24 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
         method = aml_method(CPU_STS_METHOD, 1, AML_SERIALIZED);
         {
-            Aml *idx = aml_arg(0);
+            Aml *default_sta = aml_int(opts.always_present_cpus ? 0xD : 0);
             Aml *sta = aml_local(0);
-            Aml *ifctx2;
-            Aml *else_ctx;
+            Aml *idx = aml_arg(0);
+
+            always_present_cpus = opts.always_present_cpus;
 
             aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
             aml_append(method, aml_store(idx, cpu_selector));
-            aml_append(method, aml_store(zero, sta));
-            ifctx = aml_if(aml_equal(is_present, one));
+            /*
+             * Default case:
+             * _STA(0xD) = cpu is present and disabled OR
+             * _STA(0x0) = cpu is not present (and hence disabled)
+             */
+            aml_append(method, aml_store(default_sta, sta));
+            ifctx = aml_if(aml_equal(is_enabled, one));
             {
-                ifctx2 = aml_if(aml_equal(is_enabled, one));
-                {
-                    /* cpu is present and enabled */
-                    aml_append(ifctx2, aml_store(aml_int(0xF), sta));
-                }
-                aml_append(ifctx, ifctx2);
-                else_ctx = aml_else();
-                {
-                    /* cpu is present but disabled */
-                    aml_append(else_ctx, aml_store(aml_int(0xD), sta));
-                }
-                aml_append(ifctx, else_ctx);
+                /* _STA(0xF) = cpu is present and enabled */
+                aml_append(ifctx, aml_or(aml_int(0xF), sta, sta));
             }
             aml_append(method, ifctx);
             aml_append(method, aml_release(ctrl_lock));
diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 32654dc274..4a3e591120 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -55,6 +55,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
 typedef struct CPUHotplugFeatures {
     bool acpi_1_compatible;
     bool has_legacy_cphp;
+    bool always_present_cpus;
     bool fw_unplugs_cpu;
     const char *smi_path;
 } CPUHotplugFeatures;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index db8a6fbc6e..e936b67675 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -158,7 +158,6 @@ struct CPUClass {
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
     void (*query_cpu_fast)(CPUState *cpu, CpuInfoFast *value);
     int64_t (*get_arch_id)(CPUState *cpu);
-    bool (*cpu_persistent_status)(CPUState *cpu);
     bool (*cpu_enabled_status)(CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     vaddr (*get_pc)(CPUState *cpu);
-- 
2.34.1
