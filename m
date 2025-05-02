Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp744861njj;
        Fri, 2 May 2025 03:28:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtA7SoQMkpfE1NyCYThNTMW6i9F8HOJ3D6EB54pmPo500tBIozikgNl5zlFrwcwj7DHrEpdnQ4cKhaMg==@linaro.org
X-Google-Smtp-Source: AGHT+IEBcNqxCZJZu1Hw58eIx/ujEIVQrWOq0DTWw5BbEhlgumBiqUJIkFqmxwZ9YRSlFYx0M7x4
X-Received: by 2002:a05:6214:dae:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6f51513f83amr35668076d6.3.1746181700812;
        Fri, 02 May 2025 03:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746181700; cv=none;
        d=google.com; s=arc-20240605;
        b=dMx5sQiyho9WBfSVofyKK/Vohp4GFIgM6CgoCw6vxLkck3cE8TYreYgUwBvB9rcOD7
         ZtWiTp8m7kpi/t4tZwHTxtjIaRk0Yzfv7Q6R46M+bmzLXuO+1VyiUr2vdiz0upHmJnTH
         F1F9HQidj78FQCiU2gQMa7JoFAzxfZPnL9ICPIHqWxPzXnIOeSQElMR1WaIpBfJxjw4O
         5lD5N6OmIuyTbuxeF3O0UMeIgynaiujJe9R5KocPbRuRQWl3NMb8qnqbgNSqsIMaBWpb
         fxAdkAxhPZMN/EqA3nnuSeBfrTn62P8CSwNNVacLeQokgPex14/N7fCbMnY8zG5F02lX
         03mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=hXdSu8XfuIJhl9Wr8C4c8MT54ivF/Sigi+bK+OaTEeA=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=LwItN6nT6K3QFf4oK6arkeW2DOa7yDbhTu/XCFbqNSjTYm7rfyblIi29Ug6YHjj/Np
         Z5+UF0KitoTc1kxV663exnCLOqyh3k4cd/WBsiTyCrcgUm+wLoSb4wBD0uzrmK7jWSi0
         bT5bT73R5xW/K7yX1M1642JhxBu4mzqQcPkINbBVrEAOjU9FCNsLQ8A8Prf42/lcaGw4
         sCONmS1F+mu8v4zT1tK219vsT8I+Ai6LJt0fylsMkn27ytSK+rloXYmdWCfOEydMh8Fo
         P4KTsSG/OvyZv39NONwwUCTfS4K/ufp3KPKfRt67by6X3ylwDmbXFtBQfM2UTBONTHtR
         zUUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f48fccdsi27366656d6.288.2025.05.02.03.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAncY-0008PL-UY; Fri, 02 May 2025 06:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncU-0008ND-Kx; Fri, 02 May 2025 06:27:50 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncS-0001rx-T1; Fri, 02 May 2025 06:27:50 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpn6f4fb8z6K99k;
 Fri,  2 May 2025 18:22:34 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 92C19140137;
 Fri,  2 May 2025 18:27:33 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 12:27:26 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
Date: Fri, 2 May 2025 11:27:02 +0100
Message-ID: <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5N2FioFaByQJ

Although this change does not affect functionality at present, it lays
the groundwork for enabling user-created SMMUv3 devices in
future patches

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3.c | 26 ++++++++++++++++++++++++++
 hw/arm/virt.c   |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ab67972353..605de9b721 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -24,6 +24,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bridge.h"
 #include "cpu.h"
 #include "exec/target_page.h"
 #include "trace.h"
@@ -1874,6 +1875,25 @@ static void smmu_reset_exit(Object *obj, ResetType type)
     smmuv3_init_regs(s);
 }
 
+static int smmuv3_pcie_bus(Object *obj, void *opaque)
+{
+    DeviceState *d = opaque;
+    PCIBus *bus;
+
+    if (!object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        return 0;
+    }
+
+    bus = PCI_HOST_BRIDGE(obj)->bus;
+    if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus->name)) {
+        object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
+                                 &error_abort);
+        /* Return non-zero as we got the bus and don't need further iteration.*/
+        return 1;
+    }
+    return 0;
+}
+
 static void smmu_realize(DeviceState *d, Error **errp)
 {
     SMMUState *sys = ARM_SMMU(d);
@@ -1882,6 +1902,10 @@ static void smmu_realize(DeviceState *d, Error **errp)
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
     Error *local_err = NULL;
 
+    if (!object_property_get_link(OBJECT(d), "primary-bus", &error_abort)) {
+        object_child_foreach_recursive(object_get_root(), smmuv3_pcie_bus, d);
+    }
+
     c->parent_realize(d, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -1996,6 +2020,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
     device_class_set_parent_realize(dc, smmu_realize,
                                     &c->parent_realize);
     device_class_set_props(dc, smmuv3_properties);
+    dc->hotpluggable = false;
+    dc->bus_type = TYPE_PCIE_BUS;
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 177f3dd22c..3bae4e374f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -56,6 +56,7 @@
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/virtio/virtio-pci.h"
 #include "hw/core/sysbus-fdt.h"
@@ -1442,7 +1443,7 @@ static void create_smmu(const VirtMachineState *vms,
     }
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
-- 
2.34.1

