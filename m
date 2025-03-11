Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1882737njc;
        Tue, 11 Mar 2025 07:13:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkphQ6nFeyDpizlxa8y79aapNHpLg6cpDMgN7MMfXTixLuXlFkkEG7PbLDr16+4Y9qCh4jFB41cgMFcg==@linaro.org
X-Google-Smtp-Source: AGHT+IGm2EoWW+XtCfOzVyIoeR/aD1JZfSouWTDy4DZ0l7pJ5d1qAIkxNDiGBZue3U02J+QVUPL5
X-Received: by 2002:a5d:6c6d:0:b0:391:2b11:657 with SMTP id ffacd0b85a97d-39132da10f8mr14828435f8f.38.1741702428379;
        Tue, 11 Mar 2025 07:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702428; cv=none;
        d=google.com; s=arc-20240605;
        b=dqSGncbH40ZfuDg5dktx11UF43eOdWcB1cZQbjAtYMEa8WIl2g+c7yZtQKPMcUHEnM
         gs5KFh/kOE3Xcv9JP5oNM4CQw9YPcK8GGmB0uoNtR6u42BOJA/h5d9IWOECGc0lIn3bS
         liilUENl/wCN6D4595BlLKvFNx4LbaGXxPFzpwMzMMcQXif51B36mwGnJzNkVSgq2k8a
         wGn7p99wmIIGJFptCOkBZbWitezDEggiD8P72J2m5YanVTpnOGu/C/UbByTOl30QHTGm
         9841c8ohUzkafTCHia+A2enY1r3kDJq3o5o7kXhMQFYrH+oaS5A0DSjfrXbypqqSYc3f
         yrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=X02za+LpNnwojPuaPHNOVy5S+NKJr8vlFLWU/12RuTI=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=fQtgf+DiMhsxr2i9xmUeok5PaMRhulAkVn0macJUwLw+8B40c+EUQfEFX/QB86tKzM
         md8C11b9XUM6ybTzXI1vbQiSXu6PT8jFwKYkYIv0PEFJN2T4inKXWQ7Ryw0RxLrvYTtJ
         FnOKGH8Ck3Mf76I8XXZ+sbzK0GhE2i5v5VQlInC5FE99HvYsPZmGZtGoD6QfjJVbf3MW
         2UkWeGOOGVuDRHqEy0czxjMnSCD8nelvhkMXWYAVRwki6HXxZ8Sg/21pCO4z6He79HAE
         AFOgN7vNhnXxO2ORqMW98BEvFB052vXqW+cMPBPvoPV5nj0UlBoVkhpo1qieUn1LQAS/
         z/RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3912bfdae95si9006335f8f.68.2025.03.11.07.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ts0Ly-0002PV-94; Tue, 11 Mar 2025 10:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Lq-0001z4-BO; Tue, 11 Mar 2025 10:13:01 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Lo-0006za-Ln; Tue, 11 Mar 2025 10:12:58 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwdT5Y4pz6D8cG;
 Tue, 11 Mar 2025 22:10:21 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 5D7DC140B63;
 Tue, 11 Mar 2025 22:12:54 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:12:46 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 07/20] hw/arm/smmu-common: Introduce callbacks for
 PCIIOMMUOps
Date: Tue, 11 Mar 2025 14:10:32 +0000
Message-ID: <20250311141045.66620-8-shameerali.kolothum.thodi@huawei.com>
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
X-TUID: Qg8Oj9VSiCd6

Subsequently smmuv3-accel will provide these callbacks

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmu-common.c         | 27 +++++++++++++++++++++++++++
 include/hw/arm/smmu-common.h |  5 +++++
 2 files changed, 32 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 83c0693f5a..9fd455baa0 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -865,6 +865,10 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
     SMMUState *s = opaque;
     SMMUPciBus *sbus = smmu_get_sbus(s, bus);
 
+    if (s->accel && s->get_address_space) {
+        return s->get_address_space(bus, opaque, devfn);
+    }
+
     sdev = sbus->pbdev[devfn];
     if (!sdev) {
         sdev = sbus->pbdev[devfn] = g_new0(SMMUDevice, 1);
@@ -874,8 +878,31 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
     return &sdev->as;
 }
 
+static bool smmu_dev_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
+                                      HostIOMMUDevice *hiod, Error **errp)
+{
+    SMMUState *s = opaque;
+
+    if (s->accel && s->set_iommu_device) {
+        return s->set_iommu_device(bus, opaque, devfn, hiod, errp);
+    }
+
+    return false;
+}
+
+static void smmu_dev_unset_iommu_device(PCIBus *bus, void *opaque, int devfn)
+{
+    SMMUState *s = opaque;
+
+    if (s->accel && s->unset_iommu_device) {
+        s->unset_iommu_device(bus, opaque, devfn);
+    }
+}
+
 static const PCIIOMMUOps smmu_ops = {
     .get_address_space = smmu_find_add_as,
+    .set_iommu_device = smmu_dev_set_iommu_device,
+    .unset_iommu_device = smmu_dev_unset_iommu_device,
 };
 
 SMMUDevice *smmu_find_sdev(SMMUState *s, uint32_t sid)
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 80ff2ef6aa..7b05640167 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -160,6 +160,11 @@ struct SMMUState {
 
     /* For smmuv3-accel */
     bool accel;
+
+    AddressSpace * (*get_address_space)(PCIBus *bus, void *opaque, int devfn);
+    bool (*set_iommu_device)(PCIBus *bus, void *opaque, int devfn,
+                             HostIOMMUDevice *dev, Error **errp);
+    void (*unset_iommu_device)(PCIBus *bus, void *opaque, int devfn);
 };
 
 struct SMMUBaseClass {
-- 
2.34.1

