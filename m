Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1213643ejb;
        Sat, 1 Apr 2023 03:51:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350b9eUZP/svZRm4MeWMamcMytGZyLtaJPn+hOZc5Y6oUjBzoHHTxpFxgbRfNQucX+260AGQK
X-Received: by 2002:ad4:5ccc:0:b0:5aa:8e3e:496e with SMTP id iu12-20020ad45ccc000000b005aa8e3e496emr49968192qvb.34.1680346297282;
        Sat, 01 Apr 2023 03:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680346297; cv=none;
        d=google.com; s=arc-20160816;
        b=PbWFYsNKMmAbN18smPovqj73X5Y36GY59DKQ1W/TUsMJK1MrJuUtlQu9ck4ul3AjsK
         1kA3lGFOgXyomVtkoOa/ffV5mFHr/afoi1eiViu+AEgTe0HJkd1N2zD5tRzDsXa0TJqG
         e8KTwnd7v4N2D3W2X6C7MpQlNIUuslfOnnk3jWesOVj/GFXkPee7WX40SNWIT4UeRxtb
         5qIAFkhSV6Lp8q4hiduk36OlM+vGlH/Lya8GcEcWWSV5ZwVsKKSWrRo0v2H6ZLZkdTUl
         QkCtstDSsdhd2oNg9c03v4VDfDKcGFgRi7pN4ptS86VNPBwlqGf+fSSY0wZKfo30ffdN
         cZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=aoEvNafhxZOatcPvV6YjPDrKeOQ8MVO471UhdyqdjDU=;
        b=DmNuMk/775kkJ1j+giT2Q6E+pKTDcP87CPaUA5qURzKuQAmIB6smoAV9RKfSEUTWyr
         zitrKwWYP67GgRTq+/OSkdHznIHITDrfX1vw9dJ0CvOIqzO2yEKOCycgjXR5t0FPj6S0
         g1dp+VTxVPWGMyW8awCMUzbc4/d9roImpEIoXatp0qPJeEW3U7E2H7VgLEXujXi60zgU
         lFWK9gfXyC3mOhHj9EwRpnsH8tk+NuBC5E9pK7FSbuZTZk7i3iXXLrlNKFdmN4n+bHeq
         /C/6XjaUyJ5vuGLRBOXFYhfNAhIIwhIwGJ5MVfG0c/s4lN2eiRp+1TzHE+Wb3FRpZako
         Fosg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Heckz0rX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a0562140d6400b005ac03c18e10si2927465qvs.327.2023.04.01.03.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Apr 2023 03:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Heckz0rX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piYoW-0000qB-5M; Sat, 01 Apr 2023 06:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YgwoZAgKCEMxrtxyfkflttlqj.htrvjrz-fwrstslsz.twl@flex--smostafa.bounces.google.com>)
 id 1piYoK-0000n0-1K
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:16 -0400
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YgwoZAgKCEMxrtxyfkflttlqj.htrvjrz-fwrstslsz.twl@flex--smostafa.bounces.google.com>)
 id 1piYoH-0003Cp-A7
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:14 -0400
Received: by mail-ed1-x54a.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so35520979edb.21
 for <qemu-arm@nongnu.org>; Sat, 01 Apr 2023 03:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346210;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=aoEvNafhxZOatcPvV6YjPDrKeOQ8MVO471UhdyqdjDU=;
 b=Heckz0rXgtPtVIAiowogkrohVNwd4PsJawnKHWu6OXU4pCbwMrfkC5xdiGuOXSaQwa
 xxp6OPRlOLXtnXNWwY1rgHqSXiPr2lpmAuFfIM9Hb3CQgTtAKqr2IdQ5ZYmP6bjQPl59
 qC7cUa1xXkDT2r9fDHQFBEBVMceyiY3SOtbu4KtVQwFItez55ptu0lyASEttgCuzCO7P
 uMcNhfdUIvO0vqNt6Kujlo684YMg2R/gPDQMLdc9gLEKhqusHY6vInW1Cz7zpdnRBGw7
 cKLkfq7p2T+wkWJeew0/GEK8TFoOGbLYOQVlgfU03aA/BImolXqkZ0T8dR7eJjqQjM/l
 odEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346210;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aoEvNafhxZOatcPvV6YjPDrKeOQ8MVO471UhdyqdjDU=;
 b=frhZ7iy4kbtJJa+tUubrZZ1/VlHfAt+bO9G85xbaAFct8sq5PCBdOwW9TZa/qTqg4B
 1p49PG3EZrN2IibuGdGdOHlKMLrVfNcb9McGIt8gLSZLt+qPB+ixpMOw7kGgeRicgKRe
 jBhijBg6z3cS16iEFg00rrlGPuK1Gt1PSpNN4uefzgaJt4UiTP5urMfqkg7XfRf3Ec7q
 7Pkde9sW34hxE0DHuBaICVBhkrAdHj7qgTHPNORbjVqU2xynUojFSbWRjoyKB5Ed6mqX
 mI8M5Q/iU/WM5jbOf45x0+e89/W9KErIheoOtpmT4rW8xg4kmwmBj32C9oHxqqszXNOn
 1YSg==
X-Gm-Message-State: AAQBX9eUA1xEuDnekSv0/LvfLqL31DkooqDPqrQ7/GPVXk6b4chm5WmI
 Of6tx45KnefnTU3A1FSjIq54JgwWVnRAtQ==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a17:907:3908:b0:947:7be7:e554 with SMTP
 id so8-20020a170907390800b009477be7e554mr3766530ejc.7.1680346210336; Sat, 01
 Apr 2023 03:50:10 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:49 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-7-smostafa@google.com>
Subject: [RFC PATCH v3 06/10] hw/arm/smmuv3: Make TLB lookup work for stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::54a;
 envelope-from=3YgwoZAgKCEMxrtxyfkflttlqj.htrvjrz-fwrstslsz.twl@flex--smostafa.bounces.google.com;
 helo=mail-ed1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lluquL9SxCUP

Right now, either stage-1 or stage-2 are supported, this simplifies
how we can deal with TLBs.
This patch makes TLB lookup work if stage-2 is enabled instead of
stage-1.
TLB lookup is done before a PTW, if a valid entry is found we won't
do the PTW.
To be able to do TLB lookup, we need the correct tagging info, as
granularity and input size, so we get this based on the supported
translation stage. The TLB entries are added correctly from each
stage PTW.

When nested translation is supported, this would need to change, for
example if we go with a combined TLB implementation, we would need to
use the min of the granularities in TLB.

As stage-2 shouldn't be tagged by ASID, it will be set to -1 if S1P
is not enabled.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
Changes in v3:
- Rename temp to tt_combined and move to top.
- Collected Reviewed-by tag.
Changes in v2:
- check if S1 is enabled(not supported) when reading S1 TT.
---
 hw/arm/smmuv3.c | 44 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 0f5429aed8..a1f4a4f902 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -727,6 +727,9 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
     STE ste;
     CD cd;
 
+    /* ASID defaults to -1 (if s1 is not supported). */
+    cfg->asid = -1;
+
     ret = smmu_find_ste(s, sid, &ste, event);
     if (ret) {
         return ret;
@@ -824,6 +827,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .addr_mask = ~(hwaddr)0,
         .perm = IOMMU_NONE,
     };
+    /*
+     * Combined attributes used for TLB lookup, as only one stage is supported,
+     * it will hold attributes based on the enabled stage.
+     */
+    SMMUTransTableInfo tt_combined;
 
     qemu_mutex_lock(&s->mutex);
 
@@ -852,21 +860,35 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
-    tt = select_tt(cfg, addr);
-    if (!tt) {
-        if (cfg->record_faults) {
-            event.type = SMMU_EVT_F_TRANSLATION;
-            event.u.f_translation.addr = addr;
-            event.u.f_translation.rnw = flag & 0x1;
+    if (cfg->stage == 1) {
+        /* Select stage1 translation table. */
+        tt = select_tt(cfg, addr);
+        if (!tt) {
+            if (cfg->record_faults) {
+                event.type = SMMU_EVT_F_TRANSLATION;
+                event.u.f_translation.addr = addr;
+                event.u.f_translation.rnw = flag & 0x1;
+            }
+            status = SMMU_TRANS_ERROR;
+            goto epilogue;
         }
-        status = SMMU_TRANS_ERROR;
-        goto epilogue;
-    }
+        tt_combined.granule_sz = tt->granule_sz;
+        tt_combined.tsz = tt->tsz;
 
-    page_mask = (1ULL << (tt->granule_sz)) - 1;
+    } else {
+        /* Stage2. */
+        tt_combined.granule_sz = cfg->s2cfg.granule_sz;
+        tt_combined.tsz = cfg->s2cfg.tsz;
+    }
+    /*
+     * TLB lookup looks for granule and input size for a translation stage,
+     * as only one stage is supported right now, choose the right values
+     * from the configuration.
+     */
+    page_mask = (1ULL << tt_combined.granule_sz) - 1;
     aligned_addr = addr & ~page_mask;
 
-    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
+    cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             status = SMMU_TRANS_ERROR;
-- 
2.40.0.348.gf938b09366-goog

