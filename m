Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2659301lfg;
        Tue, 9 Mar 2021 02:35:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEIKQ+5swjiTkg5O4TtVX61sfbKb48AZtvpdaUD1moqiYwLZ1nkFAX6UieGtJf7bHy8vDk
X-Received: by 2002:a25:4ce:: with SMTP id 197mr38988679ybe.462.1615286101089;
        Tue, 09 Mar 2021 02:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615286101; cv=none;
        d=google.com; s=arc-20160816;
        b=VgjnPZ+p8M3BOiF9CqOJPkqs6obzjB0o4FqwdLb0jK6K8MMQ4Zkaz2Fqr2CPNdIexo
         AJx3uvO3yrKqEMF6EztgwLXCKOz3TbEJ7j0LRX33aPBGcys05QcjKiPTFTxMMDw0uG/z
         +cX4AEFUFIFerPZ7j7mP+dsLGcdovFlvDlax22YI30EU0cVjsWpZMP+JkUNQzBWNVW32
         KD6VVAzZUwoQ4Wa5/BJt4p56/MI5bqmP+Xs6IERv3eerZUDNHfacb4hBR9uQuiInrgyy
         2SsApz54VFzPcqM66nKlEL+wRdPQ4hEDPDD9hNLiLoXIjw0KWpOYbMg9Wd9tb8cYkVFP
         vf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6txWYgdsv1IUgko2LPoI1zljDxs9Wc8uvShob2iim2s=;
        b=nmUFfLd+chy1Q5HQfTn1rUFfJfUy95+NqnnXQMF3IYr8mteReqjVIRQrANqY+DnSfz
         hfwM26ldOr4LTwcZy9V1yB9GkfRpc+hVMJD3MajdMgl7lUGqk1YcxP7oPuLlvrLNV6HF
         sMSdRp9a/VKftsnFuQrYC6yTDGHIDSC1IHneIkeG+MGbM3BsTYM/KNjLxdSXZM/sH8+W
         ttHksLchFfuKmsKVAIfvTPgIv6yuNdXJq3uC7BtchIX7Yk+cZ7TXCUpjfbrzgGMpxA9E
         Nn35oxCcSGL2x1WnXLKbxPYCOy4A9JvmaX1/28s/2r8fk5mqpF7MzOy71SngDl1cnWVQ
         vFSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pp5SwdUG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x71si16066033ybg.103.2021.03.09.02.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 02:35:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pp5SwdUG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJZhc-0003jc-EY
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 05:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZbO-0005sz-Cv
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 05:28:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZbL-0005jn-Hs
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 05:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6txWYgdsv1IUgko2LPoI1zljDxs9Wc8uvShob2iim2s=;
 b=Pp5SwdUGFvn7ZuHMISZSENoXHD+WKzRjJssNhkPyAFUZ/Ze+QIdyvE7q1zrl5BYcg5TO0k
 iZrm50g2IsMsXN3OI70fcBk0jl3UmqVKdKcQ/OWPr8NptP15ynt47QUXYIQezjJV8/0b7n
 7goLGywRAcU/tmSlYYF1udkSaY9YH2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-KQZW3ScdM8SZi7YurXlOqw-1; Tue, 09 Mar 2021 05:28:29 -0500
X-MC-Unique: KQZW3ScdM8SZi7YurXlOqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D085926862;
 Tue,  9 Mar 2021 10:28:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30B041A862;
 Tue,  9 Mar 2021 10:28:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v3 6/7] hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
Date: Tue,  9 Mar 2021 11:27:41 +0100
Message-Id: <20210309102742.30442-7-eric.auger@redhat.com>
In-Reply-To: <20210309102742.30442-1-eric.auger@redhat.com>
References: <20210309102742.30442-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NktC7Updt4is

If the whole SID range (32b) is invalidated (SMMU_CMD_CFGI_ALL),
@end overflows and we fail to handle the command properly.

Once this gets fixed, the current code really is awkward in the
sense it loops over the whole range instead of removing the
currently cached configs through a hash table lookup.

Fix both the overflow and the lookup.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

Added Peter's R-b
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

