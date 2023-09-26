Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp984674ejc;
        Tue, 26 Sep 2023 03:14:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuCLfbjwICMXHME6uIqHNRRpvSc/f7iwjUtP8jO6wuyGH58a91vTA+EobsSjjCUGnwtoCM
X-Received: by 2002:a05:600c:2101:b0:401:2ee0:754a with SMTP id u1-20020a05600c210100b004012ee0754amr9068621wml.13.1695723282117;
        Tue, 26 Sep 2023 03:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723282; cv=none;
        d=google.com; s=arc-20160816;
        b=0BOt45OAQim3IypuboEqmSrFvVGJwy5+zItl5IP+UFerrJZD6EgUkuQyyID/6JnIMJ
         BRrJpIGLWh5pryh9K2COdr/rh0Ccb/EYPbqTi5ekvw7fzaCZN4mtu0+1OWnLdAojTekv
         e2rlc4CjfMGpHJ1ahyDreyelNvWK0r582tvPxN+nYLRDV/2nHeBz3fEOWTNyW8uzSaQo
         2Mo6PWcEnnh/rlNc+xPxA0cJ6qiksvo6QVVL5k9cTGCQzvMjuUe97bPNFY4sY0Hqwydz
         eXtLtuqW/C+hMxTTcb2XOGlnqhLx35to00J+/6Ds3aNFOleEOM046ATHa/pZlgorN+iy
         Q3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=HVcRIOWXgGiERZWVTT2MnIsz/6eU/b/QwWMrokP7f48=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=vRgi1nvg09PUgRNK9iZQHru0dFKJkHSkps3rK+SJo9zdxxEtUlQAz1sl1xLRRvMOuD
         IKdUv9eZYkRZS6h/tR67AviEsfhbbBHJFBmKYV5VBb+IW2ETT8oSjhN4fjEtJqLxD+PE
         TmjJn2w0tdlZglDF/p3FwSTOxzA0pbZQaMDGSoqKRUO5LR17Mkp2dByneMAwtN1nIyXZ
         vh84sMNMgVqTrVnRY0CAt6rZ/4+mKTjxaPCvCpogK4FXYmNr/zfB5UnBIepVT31ZI9bv
         BkAI8MaFdsLCb8vBBl9tx9QckreHRNdDg3ZZimB3DCYOvML8kA1PPhgmwO9Sm4/VMX68
         4i1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id n5-20020a5d51c5000000b0032001d31acdsi5826710wrv.1070.2023.09.26.03.14.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwXP1fxhz6D8hV;
	Tue, 26 Sep 2023 18:12:21 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:14:23 +0100
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
Subject: [PATCH RFC V2 30/37] hw/arm: Changes required for reset and to support next boot
Date: Tue, 26 Sep 2023 11:04:29 +0100
Message-ID: <20230926100436.28284-31-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 690ZQoQ/p24q

Updates the firmware config with the next boot cpus information and also
registers the reset callback to be called when guest reboots to reset the cpu.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
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
index 720f22531a..2a2d27c20a 100644
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
index 6f5ee4a1c6..e46f529801 100644
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
@@ -1357,7 +1359,7 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     char *nodename;
 
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, vms->boot_cpus);
 
     nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -3177,7 +3179,13 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         if (local_err) {
             goto fail;
         }
-        /* TODO: register cpu for reset & update F/W info for the next boot */
+        /* register this cpu for reset & update F/W info for the next boot */
+        qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
+    }
+
+    vms->boot_cpus++;
+    if (vms->fw_cfg) {
+        fw_cfg_modify_i16(vms->fw_cfg, FW_CFG_NB_CPUS, vms->boot_cpus);
     }
 
     cs->disabled = false;
@@ -3252,7 +3260,11 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
     unwire_gic_cpu_irqs(vms, cs);
     virt_update_gic(vms, cs);
 
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
index f9a748a5a9..a130fdad52 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -176,6 +176,7 @@ struct VirtMachineState {
     MemMapEntry *memmap;
     char *pciehb_nodename;
     const int *irqmap;
+    uint16_t boot_cpus;
     int fdt_size;
     uint32_t clock_phandle;
     uint32_t gic_phandle;
-- 
2.34.1
