Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp99198ejr;
        Thu, 13 Jun 2024 16:46:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSknbIrx0ekluwivWYBJtN7rIJk+dV4vXrCQf7ObUk2n8HWs+m3qfWH8YIFlX4GgfMgksC4DjvYfF3is2uhE7DiT8BEKsa
X-Google-Smtp-Source: AGHT+IGWchLlYbjhJDVe9AjfikVce/t6D841LxLhVxVqxDvRP1u06SnvD4I3ji8KpvuZ4FVUc43T
X-Received: by 2002:a05:600c:4fc9:b0:421:81b6:e7f3 with SMTP id 5b1f17b1804b1-4230482131fmr11152665e9.8.1718322396971;
        Thu, 13 Jun 2024 16:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322396; cv=none;
        d=google.com; s=arc-20160816;
        b=GhxVKNCAgwHHs3ffLiE4QSQ0883r/XgFZEIicVNCN8r5gpqWWulpDUprDb5vsJEO5u
         oD6kEWPebo89RN+SaMJCpr0I/cmO2UeV4xPgiA+/+y8I2d4fccu5fjSg6g0ceP2Zuyij
         Y+zyNdULS2l1MSz3YJPoCSHDAkn5rhCJhRXPuApG4Ca9eIm6DbTSuXEhotpfcJLxIjYf
         /XyG4MZhDVBVMbyRnhlSk5QRdTWkVALC89cAOeEW6pBKAf0+Ss9JweLq4VUtnwksDUyS
         JcIc1K5Lvq4WIwtF99sJjTC7CTbWExyaKPE7O5Qx55wWZ2/3ig9K0kUhcH6ocKHpl8y8
         rFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=yx5t+S54UPjh665c1r0yNTtps0C52OTTyBzhvvGkH7o=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=uUW2ho/Kv6FO3TOBtSlm30iKcBpENcgAng/zZmsoS8AoliWl6aZIrAZcCjUou6JQ0d
         54dMSEPIn1cN/zndZ7vQqxPDAHWJopwZLxidnQNflyCe7hNgH2H5qhNU47ncIe+TFFBd
         Mw+U6bCKhUXfF2GHeX5b2uKuvv41TymaaH4z9OeBkv86C9w5Q8CIS2UCjLpTQKvAZir2
         x0iOT4m41iAWmQK8LRJ2IXBi+xcwBlxfd1TIUrmKpnoQ/ePhfNYdZT94CWvdBRO93Dgf
         7FlJ+F+1AI8yUrnHQyOZlqz8ZDZorthzFRb2m/p84bbGG51bHAx5MbeLFAsHeZayw3gK
         ZWIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36075126b8bsi1450534f8f.600.2024.06.13.16.46.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:46:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f812cTjz6HJTP;
	Fri, 14 Jun 2024 07:41:53 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id A30AA140AE5;
	Fri, 14 Jun 2024 07:46:35 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:46:13 +0100
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
Subject: [PATCH RFC V3 23/29] hw/arm: Changes required for reset and to support next boot
Date: Fri, 14 Jun 2024 00:36:33 +0100
Message-ID: <20240613233639.202896-24-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: u9BrsTXgbHb1

Updates the firmware config with the next boot cpus information and also
registers the reset callback to be called when guest reboots to reset the cpu.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/boot.c         |  2 +-
 hw/arm/virt.c         | 17 ++++++++++++++---
 include/hw/arm/boot.h |  2 ++
 include/hw/arm/virt.h |  1 +
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d480a7da02..cb5c1e4848 100644
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
index 4fa2b7d9e7..a2200099a1 100644
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
@@ -1405,7 +1407,7 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     char *nodename;
 
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, vms->boot_cpus);
 
     nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -3190,9 +3192,14 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
             error_propagate(errp, local_err);
             return;
         }
-        /* TODO: register cpu for reset & update F/W info for the next boot */
+	/* register this cpu for reset & update F/W info for the next boot */
+	qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
     }
 
+    vms->boot_cpus++;
+    if (vms->fw_cfg) {
+	    fw_cfg_modify_i16(vms->fw_cfg, FW_CFG_NB_CPUS, vms->boot_cpus);
+    }
     cs->disabled = false;
 }
 
@@ -3259,7 +3266,11 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
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
index 9c728ba042..8dce426cc0 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -167,6 +167,7 @@ struct VirtMachineState {
     MemMapEntry *memmap;
     char *pciehb_nodename;
     const int *irqmap;
+    uint16_t boot_cpus;
     int fdt_size;
     uint32_t clock_phandle;
     uint32_t gic_phandle;
-- 
2.34.1
