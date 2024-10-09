Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp595334njl;
        Tue, 8 Oct 2024 20:21:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViK6AS+G3fE1x5T5Q1UeEuJKd2lfai2of523ePBBqbB2Q3kkTo3fCKZNJDesEVAWbJ1fw39Kd3k7KcbA==@linaro.org
X-Google-Smtp-Source: AGHT+IErqmK49J1A1AUXI83wCQfKp0ErMWf5J3Q87qaWDojHbRP2GLyUfOBwr9wNTjwFEXVhMahn
X-Received: by 2002:a05:600c:1d09:b0:42c:b9a5:ebbc with SMTP id 5b1f17b1804b1-430ccf433e6mr8039645e9.16.1728444116154;
        Tue, 08 Oct 2024 20:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444116; cv=none;
        d=google.com; s=arc-20240605;
        b=PrxjTBHlBoKnPd5BheCaJ56VviX0NE4/nAN1fjbyX1nMP3jBgKEnjZbMAvx3cxy+gr
         KnaX5ZQjVe+GZwrCBz60TAw4Svw1Kio/PUmuNjRsGdB5cBRrlDn72ptGz6f/kDkA2y3P
         Li5qV18Kai0abrY9XkXHc0dh/nuWYMkfx9SU7+4o2lRCMuV5Obxu4Gnxo3W5JcnAYbWn
         Mt0BOQR0qbeYxkMrD7AeoLTBeFtOxpcWAgZ+Eiid2k7cZQUzclaDL61yg8LV2tCNkm4x
         1PwIMszOcAYM6htrmCFRb8/k/IJDAAM2AyrJa/gCH6GcyhBvsAmdkrz0JET0tr0Lo+ge
         3WCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=v7EKCkFD9ZcbqQfK48vhPfsjIA5ji5eTM20prS/2PgY=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=Eb3ulWYtZXYKCZ+v2F8ZqVu03v4Axop3at66EuoiIqxNF967OOYJN5vlyReqddf7xx
         AJL68r5uvDfuib3CLGzLkTPxN9Zjb3jXaD1A9QSVfxUDXjVhdMBucSx7OpLZdHUjJLaz
         3W7yTL5Vi3bwFYomcFzx61BKOFaAhaCwZ4q8E9Xiu/zaCzXvpW8Xc8uEWouo+AUFVKfo
         3SvCJgYJpJ7MTRaohoeoVwkIm56SqkKJXTx1SCWWBugpy3KartDJg3CqzKxqk8Wy7Vik
         OtkGybdZkwrwSoqml+7T19E6GzrlG20jnXUZi88vJUCbqr7vNiy9EUG+Xwb8GGeFpeT7
         Znlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d16992122si3989937f8f.748.2024.10.08.20.21.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdTZ4zbLz6K5fV;
	Wed,  9 Oct 2024 11:21:38 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 563F4140447;
	Wed,  9 Oct 2024 11:21:55 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:21:36 +0200
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
Subject: [PATCH RFC V4 07/33] arm/virt,gicv3: Changes to pre-size GIC with possible vCPUs @machine init
Date: Wed, 9 Oct 2024 04:17:49 +0100
Message-ID: <20241009031815.250096-8-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: hjb4GPBAPjlQ

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
index badde5ed7a..822c7d3d14 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -768,6 +768,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     const char *gictype;
     int i;
     unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int max_cpus = ms->smp.max_cpus;
     uint32_t nb_redist_regions = 0;
     int revision;
 
@@ -792,7 +793,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     }
     vms->gic = qdev_new(gictype);
     qdev_prop_set_uint32(vms->gic, "revision", revision);
-    qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
+    qdev_prop_set_uint32(vms->gic, "num-cpu", max_cpus);
     /* Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec).
      */
@@ -804,7 +805,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     if (vms->gic_version != VIRT_GIC_VERSION_2) {
         QList *redist_region_count;
         uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
-        uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
+        uint32_t redist0_count = MIN(max_cpus, redist0_capacity);
 
         nb_redist_regions = virt_gicv3_redist_region_count(vms);
 
@@ -815,7 +816,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                 virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
 
             qlist_append_int(redist_region_count,
-                MIN(smp_cpus - redist0_count, redist1_capacity));
+                MIN(max_cpus - redist0_count, redist1_capacity));
         }
         qdev_prop_set_array(vms->gic, "redist-region-count",
                             redist_region_count);
@@ -888,7 +889,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         } else if (vms->virt) {
             qemu_irq irq = qdev_get_gpio_in(vms->gic,
                                             intidbase + ARCH_GIC_MAINT_IRQ);
-            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
+            sysbus_connect_irq(gicbusdev, i + 4 * max_cpus, irq);
         }
 
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
@@ -896,11 +897,11 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
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
