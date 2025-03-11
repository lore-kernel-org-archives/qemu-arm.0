Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1882460njc;
        Tue, 11 Mar 2025 07:13:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEMZryTrgfsLZpoAKfejkjoaumK4ft0FZnIfjUw4cU4HPKfFJ/sJmxutUtpeJcwGoa7ToswPGREHI32g==@linaro.org
X-Google-Smtp-Source: AGHT+IENR7kugEhjNG6D2o8VCcoElzlaJs+PRrhUKKe4MXGGszXIy8S/KXtvite9y35x2rVYXHof
X-Received: by 2002:a05:600c:4ed1:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-43cea1a7601mr84416985e9.1.1741702408971;
        Tue, 11 Mar 2025 07:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702408; cv=none;
        d=google.com; s=arc-20240605;
        b=Z+cO8VoNNWbG2ZX+QzV1yP/+fMlqQZREoPjM+gavg7Y6n+rs3pWSLOMArrc5Slgigv
         B0ck/EJ2luJeeeUkDyIr8hVpEEiC461P60UmpYPYl3a/ncs+BQy7YUr31en7VFHtrgrr
         BlHkabSNzlm+hGnLbIQb1fKlAwFQTITlMxmgt5jmp/ShovOTsVSp5t0bNFwVgfWbKns5
         J7egcOsJvGdEmW+nEKjTABh6Btaeim6EYQom9i1NA7siy/MRn1F5UR11Oya9lUo4/a2G
         iR7YbvjCEEGUHmXOWiCL56G01Fx4dQNQ0WJGwGom1AJxjd0HC8lvCynHr/9gM8gB5HQy
         R/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=uBmu3bp6huyyOQ6V0w0fKok51IutEkk1me8rzChaF3c=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=a9T3dtIEtLgBQNfQX9OqZnBZfDIpos5RXyYtFQwZPNRW1z1MkmsqW7iWnrMi69dnH5
         KBJCxAfb0r4MDeZMe5kWPz06E3r95Br85UEGy310RKym+Wh/nku8WHMsnr6XO5JPbWWx
         eh8SOWhxp8mByfPGBdOxaYvisaya4163HFhoOvxMLf55MGaz+jBgqDhdueDskX7Qn2tp
         ie8TqUBLihOaBn9P9EMPbs4sd6P2U2g67HXD0PvYFxYUkvpiEXsUFlqGvCh5mvTNz0Gh
         nG3nUh4gooLJkubLpnmLeZ1ZDZFBzIHMrUfVcZkxsGo0NI0gItoYvBfHQPq9vDklxcyT
         5nqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3912c0e1bafsi9219580f8f.378.2025.03.11.07.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:13:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts0MA-0003Gd-P3; Tue, 11 Mar 2025 10:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0M1-0002x5-24; Tue, 11 Mar 2025 10:13:09 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Lz-000718-7P; Tue, 11 Mar 2025 10:13:08 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwd23hbpz6D9dy;
 Tue, 11 Mar 2025 22:09:58 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 5F1281404F5;
 Tue, 11 Mar 2025 22:13:05 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:12:57 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 08/20] hw/arm/smmuv3-accel: Provide get_address_space
 callback
Date: Tue, 11 Mar 2025 14:10:33 +0000
Message-ID: <20250311141045.66620-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: rDYPPp9tFdDR

Also introduce a struct SMMUv3AccelDevice to hold accelerator specific
device info. This will be populated accordingly in subsequent patches.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3-accel.c         | 36 +++++++++++++++++++++++++++++++++++
 include/hw/arm/smmuv3-accel.h |  4 ++++
 2 files changed, 40 insertions(+)

diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
index 1471b65374..6610ebe4be 100644
--- a/hw/arm/smmuv3-accel.c
+++ b/hw/arm/smmuv3-accel.c
@@ -11,6 +11,40 @@
 #include "hw/arm/smmuv3-accel.h"
 #include "hw/pci/pci_bridge.h"
 
+static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *s, SMMUPciBus *sbus,
+                                                PCIBus *bus, int devfn)
+{
+    SMMUDevice *sdev = sbus->pbdev[devfn];
+    SMMUv3AccelDevice *accel_dev;
+
+    if (sdev) {
+        accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
+    } else {
+        accel_dev = g_new0(SMMUv3AccelDevice, 1);
+        sdev = &accel_dev->sdev;
+
+        sbus->pbdev[devfn] = sdev;
+        smmu_init_sdev(s, sdev, bus, devfn);
+    }
+
+    return accel_dev;
+}
+
+static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
+                                              int devfn)
+{
+    SMMUState *s = opaque;
+    SMMUPciBus *sbus;
+    SMMUv3AccelDevice *accel_dev;
+    SMMUDevice *sdev;
+
+    sbus = smmu_get_sbus(s, bus);
+    accel_dev = smmuv3_accel_get_dev(s, sbus, bus, devfn);
+    sdev = &accel_dev->sdev;
+
+    return &sdev->as;
+}
+
 static int smmuv3_accel_pxb_pcie_bus(Object *obj, void *opaque)
 {
     DeviceState *d = opaque;
@@ -30,6 +64,7 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
     SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(d);
     SMMUv3AccelClass *c = ARM_SMMUV3_ACCEL_GET_CLASS(s_accel);
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
+    SMMUState *bs = ARM_SMMU(d);
     Error *local_err = NULL;
 
     object_child_foreach_recursive(object_get_root(),
@@ -41,6 +76,7 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
+    bs->get_address_space = smmuv3_accel_find_add_as;
 }
 
 static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/arm/smmuv3-accel.h b/include/hw/arm/smmuv3-accel.h
index 56fe376bf4..86c0523063 100644
--- a/include/hw/arm/smmuv3-accel.h
+++ b/include/hw/arm/smmuv3-accel.h
@@ -16,6 +16,10 @@
 #define TYPE_ARM_SMMUV3_ACCEL   "arm-smmuv3-accel"
 OBJECT_DECLARE_TYPE(SMMUv3AccelState, SMMUv3AccelClass, ARM_SMMUV3_ACCEL)
 
+typedef struct SMMUv3AccelDevice {
+    SMMUDevice  sdev;
+} SMMUv3AccelDevice;
+
 struct SMMUv3AccelState {
     SMMUv3State smmuv3_state;
 };
-- 
2.34.1

