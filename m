Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp596766njl;
        Tue, 8 Oct 2024 20:27:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYtTiHJ3mZuZVqsonvVYNxAY4lwsM/O7lvJ8EM4VVH5MZ8iOKiNVvHil6akS1+nW511ZfeRDy7Vd18PQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFaMlvV8Jx1HyGJ8d7cbC/OHoI8cAXSq/RxEQJ3KLJ4nKMHlHbhc3PcZkgkVQy1SqF/09wQ
X-Received: by 2002:a05:6a21:9cca:b0:1cf:59c3:62ff with SMTP id adf61e73a8af0-1d8a3c56601mr1702277637.37.1728444430055;
        Tue, 08 Oct 2024 20:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444430; cv=none;
        d=google.com; s=arc-20240605;
        b=bPkVaqIVyU5YB1MoIhyz0sYHtZMK7B/NIejaRWn8927bsXCxET0bnP3waeJ1zwgUkP
         7uea9yOdu9aUBm/0cWPHDz7K40is8WQ0IBe80gZi5qXGWcg9BiMwy9WBJfMVYU1EYxw5
         rU4dRGxALFgDFPy+i0QTQnlPqfW3Rf1XKovCaqmYK+6xjfk3qx3g+SoNa8X99aLbR/cw
         B6ljiDGjZUlr3yYZLGgAILo/5ghdHY2C7AsQM2s+18xrRcszd6icZ+KwdU265v6K0b2/
         p41B1eEdXhvG6/pboq4FDrnrDdgjy8mSWfFX1mvhp1wu94MdfRblgTtxzssv5XlFB5gW
         eO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/YypS84E7xh3Yo2+L5itTpWkdAJWdnGBRgfDsiAtuIk=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=TbK72/1fb12iypQV4x2klTRnnuB3v/XM5NZ2jlqckXhmKxY1Cc52tmpT/6bUCoNYY6
         j3Oh+3GggoT0ip48F+4agff2FdQ1guMNMx+wzl/mT76DNmOmqLUlRoEcclMxT7YCZUr9
         Wa2Q6R9dxN2Q/2v5GC05lsk3wf0irNvFomM9f3D6Zmv+BuHoMaPFcmlMaMX1woWgwxP7
         WobFRBzkaodKxROEE8nDkPR7+0VXL2KzEpMwVoEK5OISVSpEucsw61D1dzHAkL4k+b+E
         5VLreMB2z8l1ysdNsDLN0qvT41o5Pt3Kf04wMPd2Z0qWJtHrNW9ifUi8Ed8ZkUaJCuxP
         UmYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2e1a72fcca58-71df0da0ad9si928356b3a.371.2024.10.08.20.27.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdbb1H1sz6K9Gj;
	Wed,  9 Oct 2024 11:26:51 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id BF8BB140B3C;
	Wed,  9 Oct 2024 11:27:07 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:26:48 +0200
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 23/33] hw/arm: Changes required for reset and to support next boot
Date: Wed, 9 Oct 2024 04:18:05 +0100
Message-ID: <20241009031815.250096-24-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: HOhewBhfvzxS

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
index 9634011ae7..8cb66c11a1 100644
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
@@ -1427,7 +1429,7 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     char *nodename;
 
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, vms->boot_cpus);
 
     nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -3197,7 +3199,13 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
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
@@ -3263,7 +3271,11 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
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
