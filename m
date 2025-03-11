Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1881721njc;
        Tue, 11 Mar 2025 07:12:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0kQ3vMoWdNylOgvyrbtoVPLqpEPGytGZKqUmSKoa6WMED3HC+DtMKwCjRAcCoNQVU0OpE3zN0rVLz2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHTXNBOAbfIBv69q0BkXksaj3px/caSI/S45pQ4cyQDDIn/uVTyhP9wBhl87vGa4Cd9ZIR9
X-Received: by 2002:a05:6000:2aa:b0:390:f400:2083 with SMTP id ffacd0b85a97d-39258949d55mr5266043f8f.0.1741702360765;
        Tue, 11 Mar 2025 07:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702360; cv=none;
        d=google.com; s=arc-20240605;
        b=KFYsROEMemukEVfQCKLkA6LDHgcoB8kHL2JXzIAoHEveQcvsfZHp3BVCLsjTN6t3N/
         9xlVxmOp9Dm7K7eyhwzz+spLFz7qIzXvjvK2D/64oAOgoeyFhmE7ehuLDN8fs7KlFlcO
         btjiRT08kFq74/6om0fwl2yYud9Z2JtsRNoYnxgkl5bWPZ8AvwRzbie6/bXG/NtDlzhS
         nzwb0+oQmO37ncBPn+wCi+37kG77whxTuXyGIC4GZab3SGzHzRY1peGsMM1EzhIUe0ph
         fim80qeM5NTHrAmV4/E6LftQgRUahwHvwjhDLH1pMpWXRearXIEOnyJX7jDz3ScWlos+
         2lKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=wilWMFqOE85go8eQ8X9nbFxdxfwp8k6XqzTS5QHXY3k=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=YYQRMBfcXj0nmZNuF6LWvYHdQiu/AeZC3O3mYmM6KmiZOwYsZfu+9YJpZq9NNtQ/6J
         y3eA0EUc1JPggrK14eZRsoYfC2ofoYqrkyXOByZrVdVshNSIzqhfUL/jvA6YTYPqUpJo
         WYjS6VXZff9rBkXM00TtiKC5NGShDPWl57IEMTUE6iAat8eR/7+qNXyRIvjgbJrPSsc0
         npW+cvpf+QLBSlsAYN0y5BiN7y9f9fYW5PkwZD44nqvYQN4rYeoyO7xezfb3qiY234v2
         8sdBUUb7u7+uVA/W01wvQH6t60S6MZChB17tFVmwXrjcymJN4VgX80FcszYIa5w2Zrn4
         QSzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3912c003e22si9490182f8f.244.2025.03.11.07.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ts0LT-0001KY-8E; Tue, 11 Mar 2025 10:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0LR-0001F9-3r; Tue, 11 Mar 2025 10:12:33 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0LP-0006vP-4h; Tue, 11 Mar 2025 10:12:32 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwZm2z2nz6F9Br;
 Tue, 11 Mar 2025 22:08:00 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id EED41140CB9;
 Tue, 11 Mar 2025 22:12:25 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:12:18 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 04/20] hw/arm/virt: Add support for smmuv3-accel
Date: Tue, 11 Mar 2025 14:10:29 +0000
Message-ID: <20250311141045.66620-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
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
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3ajkp2t/j5zo

Allow cold-plug smmuv3-accel to virt If the machine wide smmuv3
is not specified.

No FDT support is added for now.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c         | 12 ++++++++++++
 hw/core/sysbus-fdt.c  |  1 +
 include/hw/arm/virt.h |  1 +
 3 files changed, 14 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4a5a9666e9..84a323da55 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -73,6 +73,7 @@
 #include "qobject/qlist.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/arm/smmuv3-accel.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/internals.h"
@@ -2911,6 +2912,16 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
             platform_bus_link_device(PLATFORM_BUS_DEVICE(vms->platform_bus_dev),
                                      SYS_BUS_DEVICE(dev));
         }
+        if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3_ACCEL)) {
+            if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+                error_setg(errp,
+                           "iommu=smmuv3 is already specified. can't create smmuv3-accel dev");
+                return;
+            }
+            if (vms->iommu != VIRT_IOMMU_SMMUV3_ACCEL) {
+                vms->iommu = VIRT_IOMMU_SMMUV3_ACCEL;
+            }
+        }
     }
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
@@ -3120,6 +3131,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ARM_SMMUV3_ACCEL);
 #ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index 774c0aed41..c8502ad830 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -489,6 +489,7 @@ static const BindingEntry bindings[] = {
 #ifdef CONFIG_LINUX
     TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
     TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
+    TYPE_BINDING("arm-smmuv3-accel", no_fdt_node),
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
 #ifdef CONFIG_TPM
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c8e94e6aed..849d1cd5b5 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -92,6 +92,7 @@ enum {
 typedef enum VirtIOMMUType {
     VIRT_IOMMU_NONE,
     VIRT_IOMMU_SMMUV3,
+    VIRT_IOMMU_SMMUV3_ACCEL,
     VIRT_IOMMU_VIRTIO,
 } VirtIOMMUType;
 
-- 
2.34.1

