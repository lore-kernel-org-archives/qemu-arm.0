Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2340244njb;
        Tue, 15 Oct 2024 03:07:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSdmZH5++5dS3jZdFSD+aUoTw/d2AXb7VbbYS6Vaub/2MdbBdgMU4zDfvZiFQRSVqiBp0NgslD7BUWMg==@linaro.org
X-Google-Smtp-Source: AGHT+IGdCczi8wJrQL6xajHJ9IQWcrpIWmrYV0T2NHdLwrxC0EW0Rw+siU3hfLppC7jvvvpuNP4N
X-Received: by 2002:a5d:5e0c:0:b0:37d:8084:160b with SMTP id ffacd0b85a97d-37d80841d0cmr923718f8f.23.1728986878595;
        Tue, 15 Oct 2024 03:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986878; cv=none;
        d=google.com; s=arc-20240605;
        b=POAUTjJQ5t6LpjiWUkUByMvbutgvuNMj078KEc/kn91qF1tc+oRbY8RCVArBH9RfwH
         2Ea/yHCARJbZ4lhnKA/UMySOEf29rd3j+tKMKQ8NTQpV13A5Iv9dxaEHSVofOnA2pICt
         jeyR+bXjClhzmDhDTKNUosxPj9YdUPU0W+yEGeEFt4PPKcOAI/lEAsZVt/ILZGB+o/qC
         Y3iye5d04k5U6PWQCSQArbeBhVK3fIs2SLv4YEDBt7ayAq4AvsixhYXhX2CxMWAQ5yKg
         rOlOaR1EHkgie3YG/S3M7yIIzozA6fTivbdnuXytGZcyV8Q4EFe44n4zaRATromfrXfl
         onPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5hfLDqXxAr1m/SRzfcYkf39dG+f81lsTuiaUplZkE2Q=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=LlnoSAnWGQjFo3z9/T1+0YxJ+WWy+AaS5OcTFqiTeKYyDCc27aImnQIKGI0IkZ3OPk
         djm4mF5fTLPtf4JY6Duy5x7L0j1QneUZs/9pAZ1dbmDiwBcNP+5QeZ0dWLyWacMl1u//
         R64RyuopX422rHJPxcwX4Ws7EZTK7fT+WrujsQMJAob6+cExYwPQKSc9dXgNySevlAZD
         4XXjC7pRSSmofJaYuXwBxH4f4CD3oKZWZGU4jXtUZqq37NH0v9vuKGc+eS+IJME/qH9z
         PrObVrAcHvu3FX/z1PmvFn9SFqVcLRSKmHVBxfhMwaUc2BMRsOdE9VD6ANixqaoSx/Tt
         /mIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fbed4d5si554851f8f.186.2024.10.15.03.07.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:07:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV9W2214z6FHFT;
	Tue, 15 Oct 2024 18:06:07 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A224140AA7;
	Tue, 15 Oct 2024 18:07:44 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:07:24 +0200
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
Subject: [PATCH RFC V5 20/30] hw/arm: Changes required for reset and to support next boot
Date: Tue, 15 Oct 2024 11:00:02 +0100
Message-ID: <20241015100012.254223-21-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: t77NlHaTFozE

Updates the firmware config with the next boot cpus information and also
registers the reset callback to be called when guest reboots to reset the cpu.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/boot.c         |  2 +-
 hw/arm/virt.c         | 18 +++++++++++++++---
 include/hw/arm/boot.h |  2 ++
 include/hw/arm/virt.h |  1 +
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 5301d8d318..8bf8d003eb 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -682,7 +682,7 @@ fail:
     return -1;
 }
 
-static void do_cpu_reset(void *opaque)
+void do_cpu_reset(void *opaque)
 {
     ARMCPU *cpu = opaque;
     CPUState *cs = CPU(cpu);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 295012bce1..b1eba8de8c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -45,6 +45,8 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
+#include "sysemu/reset.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/tpm.h"
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
@@ -1429,7 +1431,7 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     char *nodename;
 
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, vms->boot_cpus);
 
     nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -3196,7 +3198,13 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     }
 
     if (vms->acpi_dev) {
-        /* TODO: register cpu for reset & update F/W info for the next boot */
+        qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
+    }
+
+    /* update the firmware information for the next boot. */
+    vms->boot_cpus++;
+    if (vms->fw_cfg) {
+        fw_cfg_modify_i16(vms->fw_cfg, FW_CFG_NB_CPUS, vms->boot_cpus);
     }
 
     /*
@@ -3256,7 +3264,11 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     unwire_gic_cpu_irqs(vms, cs);
     virt_update_gic(vms, cs, false);
 
-    /* TODO: unregister cpu for reset & update F/W info for the next boot */
+    qemu_unregister_reset(do_cpu_reset, ARM_CPU(cs));
+    vms->boot_cpus--;
+    if (vms->fw_cfg) {
+        fw_cfg_modify_i16(vms->fw_cfg, FW_CFG_NB_CPUS, vms->boot_cpus);
+    }
 
     qobject_unref(dev->opts);
     dev->opts = NULL;
diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 80c492d742..f81326a1dc 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -178,6 +178,8 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                  hwaddr addr_limit, AddressSpace *as, MachineState *ms);
 
+void do_cpu_reset(void *opaque);
+
 /* Write a secure board setup routine with a dummy handler for SMCs */
 void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                             const struct arm_boot_info *info,
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 0202f0252c..073d18281e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -172,6 +172,7 @@ struct VirtMachineState {
     MemMapEntry *memmap;
     char *pciehb_nodename;
     const int *irqmap;
+    uint16_t boot_cpus;
     int fdt_size;
     uint32_t clock_phandle;
     uint32_t gic_phandle;
-- 
2.34.1
