Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1686173lfg;
        Mon, 23 Aug 2021 02:18:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU4Y4t80JPBJdQ+gqhwwlKBrV9O1fkSRzubCICYa4ww+TQ1jp0fTjSaJ1eCBi0zXfYp3E2
X-Received: by 2002:a05:6638:1448:: with SMTP id l8mr28663489jad.55.1629710295670;
        Mon, 23 Aug 2021 02:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629710295; cv=none;
        d=google.com; s=arc-20160816;
        b=YE7Kr6DtvdAZLVjfWZM0nXyed9MAjZVVO92kbseeypoA3j4gikIrm95iSsoAPREO/E
         3JwI805RX5u+T5F183tEyb7ompJi2NKsnRlfby1oCQU1DY1j/PayQ02tW1Ws1+Flxtyr
         NSJlUzG4YFIclanvEJPHFxOByzvHmrhNyB3sJnvPBC3hERqpVHtMWKd/APzha+LkjHoV
         8lRQLAOVUgikJOaivco+fOw1TibkXjvcQRbetUYqJDwXS9xUqk0SINeWMBN0GyYefsud
         Lyl6VWEhdXVqCns4G8usrSyMvK75Zd6cPG+ps01feJJtgAhgFlRg5zQNlv9T/H2kcJe6
         3jlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature:content-transfer-encoding:content-language;
        bh=EY4Ki9KGhzvVgxniFQEB23onF+l8Y2jGPoOhEg4sZu4=;
        b=ZdpR1qcyCRmq1wpCbG11mF6i8SX/XZ+lEF0OuSVqJ48H8j6XT0QcK7agT1RPMZjj5+
         ehb2XYrkbzIABN9ory1udUoA12I7cOQ0T/4la+Xepd5PfBfHNG7ASHYVnA84MhwKiE6x
         5tk77Kqq0DA0xeMqv+aiWszDvheVSiFAHEBVgfBrJzqKNlsTImNLBgoxOkbq4nNkEd7a
         jzsjihR7Vgdn1ztluLk/3/oCtqYqCaqzqHvoJoq6JOHGcovWU0H8ExtuSFZvOEsV5YBb
         9ybjF8etzz+t9EAx13SOkbTVP1fo4mgmH7v53XeIzMIU9Stt2EMETqHLlTNo+Kf7SpAH
         0+DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=LAJEgVLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si14562485iln.147.2021.08.23.02.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 02:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=LAJEgVLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mI65v-0007DU-0X
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 05:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mI65c-0006vH-F2; Mon, 23 Aug 2021 05:17:56 -0400
Received: from [101.89.135.45] (port=44451 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mI65X-0004AC-1O; Mon, 23 Aug 2021 05:17:56 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629710110; h=from:subject:to:date:message-id;
 bh=6UAmz2kYquCw/b3fNkh1ufLCDjhPxD7eFSv9F9u/+YI=;
 b=LAJEgVLU1HeN+cxCXwXWs3gH8XscRxuv2SIXoxnzTTn4l8+wcClKVXjbQ9fkkuxS7mYXx5axgkn
 9avMfeNweu+JUDea52X1X/XyKM9r2uW1+mxcVWcgXC4e0I1rPHA/nCBIAJz1XWl+vQ3s18YyXRP/f
 bkuX/WUOsliExYnZtmo=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Mon, 23 Aug 2021 17:15:10 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: [PATCH v3 1/4] hw/arm/smmuv3: Support non PCI/PCIe device connect
 with SMMU v3
Thread-Topic: [PATCH v3 1/4] hw/arm/smmuv3: Support non PCI/PCIe device
 connect with SMMU v3
Thread-Index: AQHXl/0zC10rqLzMj0qwW/R/oV8UbKuAzZXQ
Date: Mon, 23 Aug 2021 09:15:09 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F9735@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.223]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--6.628200-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 101.89.135.45 (deferred)
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +xo6TRTwTis6

  . Add sid-map property to store non PCI/PCIe devices SID
  . Create IOMMU memory regions for non PCI/PCIe devices based on their SID
  . Update SID getting strategy for PCI/PCIe and non PCI/PCIe devices

Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
---
 hw/arm/smmuv3.c              | 46 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmu-common.h |  7 +++++-
 include/hw/arm/smmuv3.h      |  2 ++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 01b60bee4..11d7fe842 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -32,6 +32,7 @@
 #include "hw/arm/smmuv3.h"
 #include "smmuv3-internal.h"
 #include "smmu-internal.h"
+#include "hw/qdev-properties.h"
=20
 /**
  * smmuv3_trigger_irq - pulse @irq if enabled and update
@@ -1430,6 +1431,19 @@ static void smmu_reset(DeviceState *dev)
     smmuv3_init_regs(s);
 }
=20
+static SMMUDevice *smmu_find_peri_sdev(SMMUState *s, uint16_t sid)
+{
+    SMMUDevice *sdev;
+
+    QLIST_FOREACH(sdev, &s->peri_sdev_list, next) {
+        if (smmu_get_sid(sdev) =3D=3D sid) {
+            return sdev;
+        }
+    }
+
+    return NULL;
+}
+
 static void smmu_realize(DeviceState *d, Error **errp)
 {
     SMMUState *sys =3D ARM_SMMU(d);
@@ -1437,6 +1451,9 @@ static void smmu_realize(DeviceState *d, Error **errp=
)
     SMMUv3Class *c =3D ARM_SMMUV3_GET_CLASS(s);
     SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
     Error *local_err =3D NULL;
+    SMMUDevice *sdev;
+    char *name =3D NULL;
+    uint16_t sid =3D 0;
=20
     c->parent_realize(d, &local_err);
     if (local_err) {
@@ -1454,6 +1471,28 @@ static void smmu_realize(DeviceState *d, Error **err=
p)
     sysbus_init_mmio(dev, &sys->iomem);
=20
     smmu_init_irq(s, dev);
+
+    /* Create IOMMU memory region for peripheral devices based on their SI=
D */
+    for (int i =3D 0; i < s->num_sid; i++) {
+        sid =3D s->sid_map[i];
+        sdev =3D smmu_find_peri_sdev(sys, sid);
+        if (sdev) {
+            continue;
+        }
+
+        sdev =3D g_new0(SMMUDevice, 1);
+        sdev->smmu =3D sys;
+        sdev->bus =3D NULL;
+        sdev->devfn =3D sid;
+
+        name =3D g_strdup_printf("%s-peri-%d", sys->mrtypename, sid);
+        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
+                                 sys->mrtypename,
+                                 OBJECT(sys), name, 1ULL << SMMU_MAX_VA_BI=
TS);
+
+        QLIST_INSERT_HEAD(&sys->peri_sdev_list, sdev, next);
+        g_free(name);
+    }
 }
=20
 static const VMStateDescription vmstate_smmuv3_queue =3D {
@@ -1506,6 +1545,12 @@ static void smmuv3_instance_init(Object *obj)
     /* Nothing much to do here as of now */
 }
=20
+static Property smmuv3_properties[] =3D {
+    DEFINE_PROP_ARRAY("sid-map", SMMUv3State, num_sid, sid_map,
+                      qdev_prop_uint16, uint16_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void smmuv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -1515,6 +1560,7 @@ static void smmuv3_class_init(ObjectClass *klass, voi=
d *data)
     device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
     c->parent_realize =3D dc->realize;
     dc->realize =3D smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
=20
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 706be3c6d..95cd12a4b 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -117,6 +117,7 @@ struct SMMUState {
     QLIST_HEAD(, SMMUDevice) devices_with_notifiers;
     uint8_t bus_num;
     PCIBus *primary_bus;
+    QLIST_HEAD(, SMMUDevice) peri_sdev_list;
 };
=20
 struct SMMUBaseClass {
@@ -138,7 +139,11 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_=
t bus_num);
 /* Return the stream ID of an SMMU device */
 static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
 {
-    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+    if (sdev->bus =3D=3D NULL) {
+        return sdev->devfn;
+    } else {
+        return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+    }
 }
=20
 /**
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index c641e6073..32ba84990 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -39,6 +39,8 @@ struct SMMUv3State {
     uint32_t features;
     uint8_t sid_size;
     uint8_t sid_split;
+    uint32_t num_sid;
+    uint16_t *sid_map;
=20
     uint32_t idr[6];
     uint32_t iidr;
--=20

