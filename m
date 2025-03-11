Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1882149njc;
        Tue, 11 Mar 2025 07:13:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWT5txlgYMLejK2PsjBRNE/bL1skz5gDMnz3FNY0eEz1NiLlcKFwAKrdfMmEdukMFXNkMrUVnM8CiiBJg==@linaro.org
X-Google-Smtp-Source: AGHT+IG+HaaTQNVp2gGJ4cNEL19GJO9sOFRoJlyQB3/VlTo2yOLmSgArjzs1sGnCotJzcerrOM84
X-Received: by 2002:a05:6000:1549:b0:391:2163:dd67 with SMTP id ffacd0b85a97d-39132d060aemr12879345f8f.6.1741702391116;
        Tue, 11 Mar 2025 07:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702391; cv=none;
        d=google.com; s=arc-20240605;
        b=DXMi8GvFVaPrsZ6PI0PSSLnSl01tSoUkXHtvSDwG9p6gAJRVuhlz5nE7FWxb//mCkC
         R/eTbYuecq07FwGnAi9DJvm/ntk4UK/ZWgwlbspGqHNgKq6CB/vbmYoHAdW3YznqUJA5
         FgZRWLSMxpmEehQz5MNxA8EmKqO44S1lm5re8jq3r2ENFJHYOGU0uzZXv1cTQhUL0XRJ
         xMeToVi7S3tRd4RDQnIilR0RLoy1/aTOjq66weCvVozEbKz2Wy129uc5pEs6PZMNGpPC
         bBbvgbtz2suSDmzCnZWjeRdY5G/SB+l74aBHvnJQqo9llUm2tYgNGyi64Ckc7fSavpIY
         638w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ISD+N3zzFhgtIPIvmR/4dVC+s+vqyCXVqTJbnFk48q8=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=Xd8b8EsN0+Zl0x1QcqvFHgTNl4FFV7v6M6aN/V3PfXeI/uwisaOu2K82+UCuLJzemi
         nSr7Cbf0/dehngYA+lhOZnr2tYAFeXuqGE8trkQKJV2wYUlIXKj5EZ84ON/zIH1+AvPp
         X/jdZM0h6as9wAtDg5GPRPw4/RknG/KT/i3CMNGX8ENcvkRYTBplBzAuupFeJKAbHiob
         nn2y+3p87fk6YXB2a7hF1exqiW5RvJCDaE68CBqIQ/bMeB21PwI0VCeDuGUXpzfaXp4D
         c6xBgL+MO/WLOm739wNArhh/w9wENS8gu89NgE0kjdSedRI1RgWLkePBApKRPDqr8u6t
         ORQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3912c11f1cbsi9064807f8f.679.2025.03.11.07.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ts0LZ-0001Uf-R0; Tue, 11 Mar 2025 10:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0LX-0001Rf-8u; Tue, 11 Mar 2025 10:12:39 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0LV-0006wP-IL; Tue, 11 Mar 2025 10:12:38 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwcS2szQz6D9pm;
 Tue, 11 Mar 2025 22:09:28 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 4309B140B63;
 Tue, 11 Mar 2025 22:12:35 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:12:28 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
Date: Tue, 11 Mar 2025 14:10:30 +0000
Message-ID: <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
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
X-TUID: BXFPOFE5vxxO

User must associate a pxb-pcie root bus to smmuv3-accel
and that is set as the primary-bus for the smmu dev.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3-accel.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
index c327661636..1471b65374 100644
--- a/hw/arm/smmuv3-accel.c
+++ b/hw/arm/smmuv3-accel.c
@@ -9,6 +9,21 @@
 #include "qemu/osdep.h"
 
 #include "hw/arm/smmuv3-accel.h"
+#include "hw/pci/pci_bridge.h"
+
+static int smmuv3_accel_pxb_pcie_bus(Object *obj, void *opaque)
+{
+    DeviceState *d = opaque;
+
+    if (object_dynamic_cast(obj, "pxb-pcie-bus")) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj->parent)->bus;
+        if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus->name)) {
+            object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
+                                     &error_abort);
+        }
+    }
+    return 0;
+}
 
 static void smmu_accel_realize(DeviceState *d, Error **errp)
 {
@@ -17,6 +32,9 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
     Error *local_err = NULL;
 
+    object_child_foreach_recursive(object_get_root(),
+                                   smmuv3_accel_pxb_pcie_bus, d);
+
     object_property_set_bool(OBJECT(dev), "accel", true, &error_abort);
     c->parent_realize(d, &local_err);
     if (local_err) {
@@ -33,6 +51,7 @@ static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
     device_class_set_parent_realize(dc, smmu_accel_realize,
                                     &c->parent_realize);
     dc->hotpluggable = false;
+    dc->bus_type = TYPE_PCIE_BUS;
 }
 
 static const TypeInfo smmuv3_accel_type_info = {
-- 
2.34.1

