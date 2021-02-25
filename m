Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp185908lfg;
        Thu, 25 Feb 2021 01:18:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6WCJmoksZyg3Wt55Zb7u03mA4yxEE1wshE8lecXQl5p+BW/ZbMBYs6NGYGYD75cqxTNvb
X-Received: by 2002:a05:6638:189:: with SMTP id a9mr1659266jaq.22.1614244679981;
        Thu, 25 Feb 2021 01:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614244679; cv=none;
        d=google.com; s=arc-20160816;
        b=c3QWvi6SL+cD9hUIbKNZ++XkGUnjRq51TRnBM3iyByISMHW7ThfkpsjTeqMRpjyI1/
         9eIK4h+/GeQh1xgRGJskDSuZgdklLjRoQWNU/0cnxbxhOllqmc4VMLr8SOCeN+nWHJax
         vNyhMdw6USRmzj82UYqL26mfKji6UMcAADxiHTZsuXY6kLz7GJoixdSjgL+zVriMVUBY
         qmXKD4F7T7z/QsBQKbIIQQ9kFBlFi2qU/Jvx3f3Vl/16YG/7b3nCY8Cx+kN6oKeAlY2W
         Xc8AK66ZaWkO151R4oaEGC3QPocVocL8vCAjNCAj5h/w87xd9gUsIzekc+N7XmppijWa
         Uecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=X7z56cssujukh5mVL51YBukB9pXuTLOc3hfcaaMOgCE=;
        b=iije7wYHrtWwYNTrS+4t3wf2FQWdjxAsC+AQEfVW0Kp7A3F1rB0Kf6Yj+wK8lH+8Y2
         QK4Dg1tXoTjl+lw/tAkBwiCUm2CD93lVnjjXOkM4/74Da/ylWyE7foX22sgSVusSx6eU
         RN9NBCKy0o9yvGoZPP2hkqIQjb87ejPXb+t4yBS2lccWJfmS3KozBrQY6XvOt9bIVZwy
         zeov2tbIrJb7Rs0IuxICtq4CO52RFC/CDxixDpQaCDJghF7Vd24dLni74XpBT1VgNCl8
         mjIXUZBDUA6pOh33nVR47s+1UVBaeVHb2XItWs02hYbo+bhoVLdO15ptauXMyKS7wPAR
         BdAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PJ970ATY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si4059270ilu.74.2021.02.25.01.17.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 01:17:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PJ970ATY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFCmV-0005VL-7y
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 04:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCk3-0003e3-BN
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCjw-0006EX-MB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614244520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7z56cssujukh5mVL51YBukB9pXuTLOc3hfcaaMOgCE=;
 b=PJ970ATYNrNNtnyQy9jmuXoWcZBBHgtJ/eoJY2nVkdz4hSykOVsIf+FaadX/CdrlT1q8G0
 WcXszfXKZWm0AsQijS/75/lmKyYFiYlzHWUC4UEoo/JlV+9RRr8/pOy370BQ4mFXHU7V9C
 aKEvvQJYUMdNnUN0FK6wf+Atv/AzHJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-IeEZNgmvPhiuO0wHvfQ5Sw-1; Thu, 25 Feb 2021 04:15:16 -0500
X-MC-Unique: IeEZNgmvPhiuO0wHvfQ5Sw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0370D18C35CA;
 Thu, 25 Feb 2021 09:15:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88F7863623;
 Thu, 25 Feb 2021 09:15:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 peterx@redhat.com, jasowang@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 6/7] hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
Date: Thu, 25 Feb 2021 10:14:34 +0100
Message-Id: <20210225091435.644762-7-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-1-eric.auger@redhat.com>
References: <20210225091435.644762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7XpvCy3k9FZv

If the whole SID range (32b) is invalidated (SMMU_CMD_CFGI_ALL),
@end overflows and we fail to handle the command properly.

Once this gets fixed, the current code really is awkward in the
sense it loops over the whole range instead of removing the
currently cached configs through a hash table lookup.

Fix both the overflow and the lookup.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-internal.h |  5 +++++
 hw/arm/smmuv3.c        | 34 ++++++++++++++++++++--------------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 55147f29be..2d75b31953 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -104,4 +104,9 @@ typedef struct SMMUIOTLBPageInvInfo {
     uint64_t mask;
 } SMMUIOTLBPageInvInfo;
 
+typedef struct SMMUSIDRange {
+    uint32_t start;
+    uint32_t end;
+} SMMUSIDRange;
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index fdd6332ce5..3b87324ce2 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -32,6 +32,7 @@
 
 #include "hw/arm/smmuv3.h"
 #include "smmuv3-internal.h"
+#include "smmu-internal.h"
 
 /**
  * smmuv3_trigger_irq - pulse @irq if enabled and update
@@ -895,6 +896,20 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     }
 }
 
+static gboolean
+smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
+{
+    SMMUDevice *sdev = (SMMUDevice *)key;
+    uint32_t sid = smmu_get_sid(sdev);
+    SMMUSIDRange *sid_range = (SMMUSIDRange *)user_data;
+
+    if (sid < sid_range->start || sid > sid_range->end) {
+        return false;
+    }
+    trace_smmuv3_config_cache_inv(sid);
+    return true;
+}
+
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs = ARM_SMMU(s);
@@ -965,27 +980,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
         {
-            uint32_t start = CMD_SID(&cmd), end, i;
+            uint32_t start = CMD_SID(&cmd);
             uint8_t range = CMD_STE_RANGE(&cmd);
+            uint64_t end = start + (1ULL << (range + 1)) - 1;
+            SMMUSIDRange sid_range = {start, end};
 
             if (CMD_SSEC(&cmd)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-
-            end = start + (1 << (range + 1)) - 1;
             trace_smmuv3_cmdq_cfgi_ste_range(start, end);
-
-            for (i = start; i <= end; i++) {
-                IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, i);
-                SMMUDevice *sdev;
-
-                if (!mr) {
-                    continue;
-                }
-                sdev = container_of(mr, SMMUDevice, iommu);
-                smmuv3_flush_config(sdev);
-            }
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_CFGI_CD:
-- 
2.26.2

