Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2337647njb;
        Tue, 15 Oct 2024 03:03:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEoin8mObkONqZPwEw3pORPbYk1PUpgKyfFz1R0oeW6hpEgA47tz8/B0hiffP7DiVBq9aJ5s1NRuqiNw==@linaro.org
X-Google-Smtp-Source: AGHT+IE/NEuSj+c4IrDM6fnSN4tnRrTlXu0fKAy8FtBL3DUrt8QxKtsaXgV5ULlhiocX5N9Kt0yW
X-Received: by 2002:a05:6a21:b8b:b0:1d8:f785:1f8d with SMTP id adf61e73a8af0-1d8f78524ffmr2128501637.5.1728986588487;
        Tue, 15 Oct 2024 03:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986588; cv=none;
        d=google.com; s=arc-20240605;
        b=U7FeXowZH0LeNePt4crOC5i8wNTzCEqlie2kWAAV2cF1v+gYk86yCUWJZ1QHSuhcUM
         mAvdH3/EK2PQUatQ9NnfK2wMXacUqo19Ryh1g2mM/CvpDjGjA402BU+1AXx83AvPD9Eb
         YW9pXiIMMm1vWjJiRU/mcn95sg5JxIbbFqGeqXNMVa6toLdEkpuHkRZ8+gRW58f/U9fr
         G1LChDLU1o1DqaYCtYfrQ+8hj6Csi4QMg16YYn6bMh2tj996BRzdVzPpBv4v/SOEoPPS
         9L5CkOWCTuCO0ZsZk2mo5Q/1fj842U2fVZkuA9C6hRuGTnvNFk3DXxvC6Yv4swcDg7TZ
         Vbnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=futlLmkAxmN6GZOcyBySIcb+84w8/P+Hl2iDmHiCrGE=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=TdZQi6Vy8PT8S5mSq3/1tvEQG6a9tSuN3VpvgFQHILvXBDy725D43TloRRnELaF0PP
         TDBBZ2KSTMQx1UX91d7RtMbcNMbLZxKK2Zs2REyYRSm+6bJeVUIseZa0KXrL0jswbEL7
         FjYhCmx+Tl06q/jERAYjKyJjcMvIn+lNNitDplY0VV6kZm0rGU7FR1Z521D/ZkLfYNOC
         +656pmjCwknjQsCpZQQXAq8/nKA/+Jhhc+T+VwcuGoL5OygLYfVGQc+59I+BmogobN/g
         Rc9vDac/Aa3nXaTJUJD5ESI5+eFvLy+ZT1Aqdnt8FLdtMybUrccgg5TXwIOgNaOiBExT
         whig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2e1a72fcca58-71e7736602asi1277593b3a.27.2024.10.15.03.03.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV5K4Yw7z6K98P;
	Tue, 15 Oct 2024 18:02:29 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 148CC1404F5;
	Tue, 15 Oct 2024 18:03:04 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:02:44 +0200
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
Subject: [PATCH RFC V5 06/30] arm/virt,gicv3: Changes to pre-size GIC with possible vCPUs @machine init
Date: Tue, 15 Oct 2024 10:59:48 +0100
Message-ID: <20241015100012.254223-7-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: jzeDyx//Dfze

The GIC must be pre-sized with the possible vCPUs during initialization. This is
essential because:

1. Memory regions and resources associated with GICC/GICR cannot be modified
   (i.e., added, deleted, or changed) once the VM has been initialized.
2. Additionally, the `GIC_TYPER` must be initialized with the `mp_affinity` and
   CPU interface number associations, which cannot be altered after
   initialization.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c         | 15 ++++++++-------
 include/hw/arm/virt.h |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 858a19bc8b..b286afc62c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -769,6 +769,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     const char *gictype;
     int i;
     unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int max_cpus = ms->smp.max_cpus;
     uint32_t nb_redist_regions = 0;
     int revision;
 
@@ -793,7 +794,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     }
     vms->gic = qdev_new(gictype);
     qdev_prop_set_uint32(vms->gic, "revision", revision);
-    qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
+    qdev_prop_set_uint32(vms->gic, "num-cpu", max_cpus);
     /* Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec).
      */
@@ -805,7 +806,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     if (vms->gic_version != VIRT_GIC_VERSION_2) {
         QList *redist_region_count;
         uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
-        uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
+        uint32_t redist0_count = MIN(max_cpus, redist0_capacity);
 
         nb_redist_regions = virt_gicv3_redist_region_count(vms);
 
@@ -816,7 +817,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                 virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
 
             qlist_append_int(redist_region_count,
-                MIN(smp_cpus - redist0_count, redist1_capacity));
+                MIN(max_cpus - redist0_count, redist1_capacity));
         }
         qdev_prop_set_array(vms->gic, "redist-region-count",
                             redist_region_count);
@@ -889,7 +890,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         } else if (vms->virt) {
             qemu_irq irq = qdev_get_gpio_in(vms->gic,
                                             intidbase + ARCH_GIC_MAINT_IRQ);
-            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
+            sysbus_connect_irq(gicbusdev, i + 4 * max_cpus, irq);
         }
 
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
@@ -897,11 +898,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                                                      + VIRTUAL_PMU_IRQ));
 
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(gicbusdev, i + smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + max_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
-        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + 2 * max_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
-        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + 3 * max_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
 
         if (vms->gic_version != VIRT_GIC_VERSION_2) {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 446c574c0d..362422413c 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -214,7 +214,7 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 
     assert(vms->gic_version != VIRT_GIC_VERSION_2);
 
-    return (MACHINE(vms)->smp.cpus > redist0_capacity &&
+    return (MACHINE(vms)->smp.max_cpus > redist0_capacity &&
             vms->highmem_redists) ? 2 : 1;
 }
 
-- 
2.34.1
