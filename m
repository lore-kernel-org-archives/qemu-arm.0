Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1489699njc;
        Sun, 3 Nov 2024 02:26:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoSW4euvt1VvMDLINY4l+F73jXjrv+Zj7I10+iqyw8RcN4qC6xQXHeLMwDhPaTeG0MMxoIY51yIZra5w==@linaro.org
X-Google-Smtp-Source: AGHT+IEvVM5lauiC739n8FAdhM2+loAQURPGnuhzvrew5mIVAn4WVZbHOKYSFF2wcB3AP3K+1aEI
X-Received: by 2002:a05:600c:5490:b0:431:1a98:cb40 with SMTP id 5b1f17b1804b1-4319acb8d51mr237809425e9.18.1730629584924;
        Sun, 03 Nov 2024 02:26:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730629584; cv=none;
        d=google.com; s=arc-20240605;
        b=RCJgLLTQyFwz2M0VNbBseTb9lkLpfhpJvLk0CPzN3IPT108OVTmMeMMoSzXDA7larc
         dbKU3nxn+97F8X+gI3YPfBVlgUM52sTbLw5cAQNZk2XHSOL8PpAM3ImJhS/PmNYk5alw
         UyjUA1wIy+98U/4yBbLhzCkqTjkgAfdZTI5AD1zlP8xfvHK59D+eLyTegQH1td0rCGtI
         XH1ZrpbTbrZPzIQauGbhOOYdZPPRa/CTADMbMWF2UHtRKXu5HginD/30+U31c2Ez+ciq
         lbGu/5aAPz1xP9STasj/lUZ3znBZ7E/cmRxMUOh7EiaHR9ENczG0J5sc5ygq88dSbiRK
         7H9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=8zpqM/68KZ0Fg+/60BTKVnxsfGmTRgyqzwp6RwzYobM=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=BnZFT5DpXOvwuJhHye0/zWbEGqRuOKtbevhHfVjQsenJdVRm87ZwMfXKR7Lz+ktF3g
         hysbAgrZlrH6I5tn4JxzdOp7jBuLSy2/Nc+y03VrfNkAC8ghuvTPBfKqrKO0a8b2Ne1t
         sEBITFpeBVrPYuQM6nGesuwMfgk54u80DbANRE5HunL4XLoty/pTUlKqXg35G4sQPNna
         s7soqslPhWgSk8l6kcKBfo4Xv3uzfR+/3JEexu0Md/w8NarKVcMzeOvxPNi1EG9IcM1a
         XQzaGrpu/4Op2Xtuvzy/6f0ufGetMnnaO9flda4i/4RKlikcBQBE6oYjFhNUytvaOt/b
         XArw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-431bd8ded08si63291805e9.12.2024.11.03.02.26.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2024 02:26:24 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xh9g64K68z6K5p5;
	Sun,  3 Nov 2024 18:23:46 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id E37F1140451;
	Sun,  3 Nov 2024 18:26:23 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.154.43) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 11:26:04 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH V3 3/5] hw/acpi: Update ACPI `_STA` method with QOM vCPU ACPI Hotplug states
Date: Sun, 3 Nov 2024 10:24:17 +0000
Message-ID: <20241103102419.202225-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241103102419.202225-1-salil.mehta@huawei.com>
References: <20241103102419.202225-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.154.43]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: N9HhHecNZ5OF

Reflect the QOM vCPUs ACPI CPU hotplug states in the `_STA.Present` and
and `_STA.Enabled` bits when the guest kernel evaluates the ACPI
`_STA` method during initialization, as well as when vCPUs are
hot-plugged or hot-unplugged. If the CPU is present then the its
`enabled` status can be fetched using architecture-specific code [1].

Reference:
[1] Example implementation of architecture-specific hook to fetch CPU
    `enabled status
    Link: https://github.com/salil-mehta/qemu/commit/c0b416b11e5af6505e558866f0eb6c9f3709173e

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c         | 38 ++++++++++++++++++++++++++++++++++----
 include/hw/core/cpu.h |  1 +
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 9b03b4292e..23443f09a5 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -50,6 +50,18 @@ void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
     }
 }
 
+static bool check_cpu_enabled_status(DeviceState *dev)
+{
+    CPUClass *k = dev ? CPU_GET_CLASS(dev) : NULL;
+    CPUState *cpu = CPU(dev);
+
+    if (cpu && (!k->cpu_enabled_status || k->cpu_enabled_status(cpu))) {
+        return true;
+    }
+
+    return false;
+}
+
 static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
 {
     uint64_t val = 0;
@@ -63,10 +75,11 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
     cdev = &cpu_st->devs[cpu_st->selector];
     switch (addr) {
     case ACPI_CPU_FLAGS_OFFSET_RW: /* pack and return is_* fields */
-        val |= cdev->cpu ? 1 : 0;
+        val |= check_cpu_enabled_status(DEVICE(cdev->cpu)) ? 1 : 0;
         val |= cdev->is_inserting ? 2 : 0;
         val |= cdev->is_removing  ? 4 : 0;
         val |= cdev->fw_remove  ? 16 : 0;
+        val |= cdev->cpu ? 32 : 0;
         trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
         break;
     case ACPI_CPU_CMD_DATA_OFFSET_RW:
@@ -349,6 +362,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_REMOVE_EVENT  "CRMV"
 #define CPU_EJECT_EVENT   "CEJ0"
 #define CPU_FW_EJECT_EVENT "CEJF"
+#define CPU_PRESENT       "CPRS"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                     build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
@@ -409,7 +423,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
         /* tell firmware to do device eject, write only */
         aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
-        aml_append(field, aml_reserved_field(3));
+        /* 1 if present, read only */
+        aml_append(field, aml_named_field(CPU_PRESENT, 1));
+        aml_append(field, aml_reserved_field(2));
         aml_append(field, aml_named_field(CPU_COMMAND, 8));
         aml_append(cpu_ctrl_dev, field);
 
@@ -439,6 +455,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         Aml *ctrl_lock = aml_name("%s.%s", cphp_res_path, CPU_LOCK);
         Aml *cpu_selector = aml_name("%s.%s", cphp_res_path, CPU_SELECTOR);
         Aml *is_enabled = aml_name("%s.%s", cphp_res_path, CPU_ENABLED);
+        Aml *is_present = aml_name("%s.%s", cphp_res_path, CPU_PRESENT);
         Aml *cpu_cmd = aml_name("%s.%s", cphp_res_path, CPU_COMMAND);
         Aml *cpu_data = aml_name("%s.%s", cphp_res_path, CPU_DATA);
         Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
@@ -467,13 +484,26 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e7de77dc6d..db8a6fbc6e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -159,6 +159,7 @@ struct CPUClass {
     void (*query_cpu_fast)(CPUState *cpu, CpuInfoFast *value);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*cpu_persistent_status)(CPUState *cpu);
+    bool (*cpu_enabled_status)(CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     vaddr (*get_pc)(CPUState *cpu);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
-- 
2.34.1
