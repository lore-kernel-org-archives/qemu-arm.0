Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1883166njc;
        Tue, 11 Mar 2025 07:14:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVChjiuJDB1FyGCyfCI3tsFfCPFA0WkLhLWgKnifqtDsqHwwtuyBwySVnNA7onYYOvygJsjLygwlK+PxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFF1p1WSbisFSSevv04Mcc7HzQN8OxIFng27l0mBaHZIqN6FzRo8LKaZGyjTY3gBLFhCofK
X-Received: by 2002:a05:6402:27d3:b0:5e6:17a4:29d2 with SMTP id 4fb4d7f45d1cf-5e75e4354f0mr5227896a12.15.1741702462440;
        Tue, 11 Mar 2025 07:14:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702462; cv=none;
        d=google.com; s=arc-20240605;
        b=Hlb45cSFaJzcKf/DD8KU4/Ced6TXLpj9ZhF5+JCzU7AZnhq0H16C+37CFokkj4YDnv
         dP+0TgOed881bqt1m60z44a0e1lXpaauB6NdFb6qEhl/U5+0WiXpFe2yosrSNo8N5BBM
         RQ3/lQweEtM1jdIppPgMQdYHuDsx6IM5l0EjPx53jpWc7exaJahEnpFeARPA0P4dGGxx
         UYjW+xtxoq3O8b+b/86+sdJF2rTgjC1VCT/eJ7yS3y8RVqd/9JllE9NQvU9NzZhi2OGe
         PThDsRhvyOe2PQ0O9a6ZmXkPFC8zpa1qGANcKrS3bWGnWQCqCgUHkhOhEjavTFm6oSYu
         cM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=GCzjVLGV5fLFShonFfMPgiFIiY+f+BYxnWZ0M5MfXow=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=XycduTWvOgVLwtBFIQCJRbHLcI4fd0lpN6RthtixC18+MFrXgwHipnP9z6vO5UhOeh
         LTItoc4G47IK9EcPwSQ5TVp+TCOSKwkssdg+psMkHpKd4cjFRnj9ictYccobJ0HDAV6W
         k2MkNgxL0E96iDli/y6lLVVpkDM6Pc7S9Lgtejlbzp4HJ8Ykqx9lnaJlgXovt+FYfzjA
         cVUMRWlvHXToq9TJWw8WF+dfWzpxIGU9Lr/Dj/YhlhHIfmAQtvMbOd6zthILMBdM+T/h
         BJqAx3dFdGM5H9nPgPbnjNJkYn8jIyyUYj6C3onumWpcl5LAt7yjpSB5Pcan9Zie1QJm
         7MVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5e5c7689c06si10933153a12.498.2025.03.11.07.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:14:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ts0Ms-0006Rm-Jm; Tue, 11 Mar 2025 10:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Mp-00069n-I3; Tue, 11 Mar 2025 10:13:59 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Mn-00079R-9s; Tue, 11 Mar 2025 10:13:59 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwf03jm1z6D9Ry;
 Tue, 11 Mar 2025 22:10:48 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 60100140B63;
 Tue, 11 Mar 2025 22:13:55 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:13:48 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers to batch
 and issue cache invalidations
Date: Tue, 11 Mar 2025 14:10:38 +0000
Message-ID: <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
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
X-TUID: EWH0P8vA4Y2t

From: Nicolin Chen <nicolinc@nvidia.com>

Inroduce an SMMUCommandBatch and some helpers to batch and issue the
commands.  Currently separate out TLBI commands and device cache commands
to avoid some errata on certain versions of SMMUs. Later it should check
IIDR register to detect if underlying SMMU hw has such an erratum.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3-accel.c    | 69 ++++++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3-internal.h | 29 +++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
index 76134d106a..09be838d22 100644
--- a/hw/arm/smmuv3-accel.c
+++ b/hw/arm/smmuv3-accel.c
@@ -160,6 +160,75 @@ void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
                                           nested_data.ste[0]);
 }
 
+/* Update batch->ncmds to the number of execute cmds */
+int smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch)
+{
+    SMMUv3AccelState *s_accel = ARM_SMMUV3_ACCEL(bs);
+    uint32_t total = batch->ncmds;
+    IOMMUFDViommu *viommu_core;
+    int ret;
+
+    if (!bs->accel) {
+        return 0;
+    }
+
+    if (!s_accel->viommu) {
+        return 0;
+    }
+    viommu_core = &s_accel->viommu->core;
+    ret = iommufd_backend_invalidate_cache(viommu_core->iommufd,
+                                           viommu_core->viommu_id,
+                                           IOMMU_VIOMMU_INVALIDATE_DATA_ARM_SMMUV3,
+                                           sizeof(Cmd), &batch->ncmds,
+                                           batch->cmds);
+    if (total != batch->ncmds) {
+        error_report("%s failed: ret=%d, total=%d, done=%d",
+                      __func__, ret, total, batch->ncmds);
+        return ret;
+    }
+
+    batch->ncmds = 0;
+    batch->dev_cache = false;
+    return ret;
+}
+
+int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
+                            SMMUCommandBatch *batch, Cmd *cmd,
+                            uint32_t *cons, bool dev_cache)
+{
+    int ret;
+
+    if (!bs->accel) {
+        return 0;
+    }
+
+    if (sdev) {
+        SMMUv3AccelDevice *accel_dev;
+        accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
+        if (!accel_dev->s1_hwpt) {
+            return 0;
+        }
+    }
+
+    /*
+     * Currently separate out dev_cache and hwpt for safety, which might
+     * not be necessary if underlying HW SMMU does not have the errata.
+     *
+     * TODO check IIDR register values read from hw_info.
+     */
+    if (batch->ncmds && (dev_cache != batch->dev_cache)) {
+        ret = smmuv3_accel_issue_cmd_batch(bs, batch);
+        if (ret) {
+            *cons = batch->cons[batch->ncmds];
+            return ret;
+        }
+    }
+    batch->dev_cache = dev_cache;
+    batch->cmds[batch->ncmds] = *cmd;
+    batch->cons[batch->ncmds++] = *cons;
+    return 0;
+}
+
 static bool
 smmuv3_accel_dev_attach_viommu(SMMUv3AccelDevice *accel_dev,
                                HostIOMMUDeviceIOMMUFD *idev, Error **errp)
diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 46c8bcae14..4602ae6728 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -549,13 +549,42 @@ typedef struct CD {
     uint32_t word[16];
 } CD;
 
+/**
+ * SMMUCommandBatch - batch of invalidation commands for smmuv3-accel
+ * @cmds: Pointer to list of commands
+ * @cons: Pointer to list of CONS corresponding to the commands
+ * @ncmds: Total ncmds in the batch
+ * @dev_cache: Issue to a device cache
+ */
+typedef struct SMMUCommandBatch {
+    Cmd *cmds;
+    uint32_t *cons;
+    uint32_t ncmds;
+    bool dev_cache;
+} SMMUCommandBatch;
+
 int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
                   SMMUEventInfo *event);
 void smmuv3_flush_config(SMMUDevice *sdev);
 
 #if defined(CONFIG_ARM_SMMUV3_ACCEL) && defined(CONFIG_IOMMUFD)
+int smmuv3_accel_issue_cmd_batch(SMMUState *bs, SMMUCommandBatch *batch);
+int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
+                            SMMUCommandBatch *batch, Cmd *cmd,
+                            uint32_t *cons, bool dev_cache);
 void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid);
 #else
+static inline int smmuv3_accel_issue_cmd_batch(SMMUState *bs,
+                                               SMMUCommandBatch *batch)
+{
+    return 0;
+}
+static inline int smmuv3_accel_batch_cmds(SMMUState *bs, SMMUDevice *sdev,
+                                          SMMUCommandBatch *batch, Cmd *cmd,
+                                          uint32_t *cons, bool dev_cache)
+{
+    return 0;
+}
 static inline void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
 {
 }
-- 
2.34.1

