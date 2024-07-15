Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118182nji;
        Mon, 15 Jul 2024 01:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLeN2xq1CDBh4d48aBAM8kTsp3IxRQLhXt7Ngmkjaxnir36cFVYdxZFagv5pwRRqkaVkPahZ9PTWTR242TzccTeB3KgCTj
X-Received: by 2002:a05:600c:896:b0:426:5216:3254 with SMTP id 5b1f17b1804b1-426708f1eebmr142391265e9.32.1721033162926;
        Mon, 15 Jul 2024 01:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033162; cv=none;
        d=google.com; s=arc-20160816;
        b=bPQRJd/eY6ZR9YAi5CbaVd+7IozcXkyylAeEz+aBzwbsrlY3gfuofjh8faNDvZN/IV
         7kb6PkpRiV0vCVt88BKfpb+e39rFUEkYQfHl2rXqtbPe7AX7T8zQM8euUJh1hCx2+8GM
         7HyoxLqwdBEfeERLDWPG/JlwrQPxkol7wibuD9H3ptfO+roRZ4QSu8AnWUYN0bdjcZI1
         nnbK4AQ6F+i147GtbP79H8srDD2VcEha66nP/ckHdR1Jaz98mVdHHNW5J+cOlz74oheZ
         mBXs4Dz8bL5sumdR2jHamoTrE7xaVQ28YTITWKn5Qdg+KU0D+oUUIp+9fMIeKnNEQjfJ
         umPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=1XxTn9lU99aLCsa3PM/+eEB25Y0hNHnXmG38B345hjk=;
        fh=XdFRuB3L4QicaG52+AF9ZKnGGHQHuGxavp8BxeY2YSA=;
        b=o9WrCLMyKzf5Aj/upsCv5wAM5w/OpVHLkuX9UwJ2m8hC5hX0MZXeZIRHtSvzq2T+Mt
         llp/f3eNLKImEJUwG1lG//6KzYXj5mZiV6aG7qIG5RvI/SFnos1OCN3vml8C6L4I22wo
         ruzXYnGP5lVBtzs2RcjMwl4tZ34ThVS8B4oj+pGuYjLU8GoOkrDCV/HXgTc83a3w4uwd
         sB+2O/9S5YAKLSke/H1WbWPzrLevO4cM8wxW+lFGMm1E9fseu6+6BP6kSwPGobXQl9z3
         rkqug28CvlfElaKkKOar21SeUNVNTELDiE5PsbbvC6IwFu63V1WUU6iWJvQ5Rpd4vhH/
         Xjuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yVwnDizG;
       spf=pass (google.com: domain of 3yuguzggkcx0lfhlm3839hh9e7.5hf3e7q.47gg77ebg3kh.hk9@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3yuGUZggKCx0LFHLM3839HH9E7.5HF3E7Q.47GG77EBG3KH.HK9@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3yuGUZggKCx0LFHLM3839HH9E7.5HF3E7Q.47GG77EBG3KH.HK9@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4279f2d8b8asor15330675e9.4.2024.07.15.01.46.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3yuguzggkcx0lfhlm3839hh9e7.5hf3e7q.47gg77ebg3kh.hk9@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yVwnDizG;
       spf=pass (google.com: domain of 3yuguzggkcx0lfhlm3839hh9e7.5hf3e7q.47gg77ebg3kh.hk9@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3yuGUZggKCx0LFHLM3839HH9E7.5HF3E7Q.47GG77EBG3KH.HK9@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033162; x=1721637962; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XxTn9lU99aLCsa3PM/+eEB25Y0hNHnXmG38B345hjk=;
        b=yVwnDizGDtdgcBXGJU4pAhZm+lNNpKCAxqhsOV2v5lziJ99dLHBP0Q5XcDTBBj9m+s
         BfOoIOf/X5MrKwWrU/gGJbNoTN7mZtplYXtA67yZ/NkHnxtIKJCYLlfFMB5IvnBZYuwR
         KApLIUhk6cCaFxXATi9wl3T0fpKmtxvCzRlg+wKogmYqymS6e6XFQOaZVQDBA12LS5xr
         pyz+qw2GXUmvhhNwjHM9FqZB7hfwxqlMPrWbvP/B/v9COWRcuT0QVZYRCrBlEdqB/Rjg
         w77M1W7axxd23D7D6vq24I1efdkzd/Z+85tGb7+msHggjpgXSsRT8sjWstNCF5JV1F/c
         UkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033162; x=1721637962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XxTn9lU99aLCsa3PM/+eEB25Y0hNHnXmG38B345hjk=;
        b=cCdH1ZEguxy3aLUWr/gq6T8XODcguCmsHSBd/VK2+7cbjHXhWjAW+EaQdIeOXE6rYF
         H8OPIgCVO8f+wU7IyXOSmdNOZvzHps22QlUmAkMjBTG5ccafkgr/clmnc/3ekmvT0S9a
         KxZjZuysulDC2+iRIwWesQFn6Ag3YNjZn2bDVbaxGgHcQfldiJO2ulKHkZoIXkK42Dth
         nKTu5rYxQQ9/uEBMei0KrdJ6/w/cXRBsT3EjGZgmNBJZ7XsXu+m+0AkU2m+JiR6kndVx
         RrgCdmcavqY8YQ+egezcWjNCejSBiMD5XcrEbpT7mBtqun3Iy7HIiL0PRjC7yRT09p8U
         d0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq4qa3cV2z+L35jZkLlmnRinww2oKJfrT78til76E5F3oeGieopnA+Q3fiKkDko97iQiUKfyjFf5zOuf00jtUckJVfMsAV
X-Gm-Message-State: AOJu0YzwaAmRBesiWoPvXWdFNPaYUEK2p4DqVDRp5NHu7+6AiS7i9q4h
	7YZcgFwfmlr9Qb2cMtaxx8I+Uctd9yZGyrXfSOAbfV4s40znukS6mZ627fVlZH7lpTnR7MQd3yh
	/L2XzRLXl4g==
X-Google-Smtp-Source: AGHT+IG5QvFYtLJNBSxdQVQa1bZYSq9HTWY+Y345s0HAPefESRyEn+25u17l4skJpUA/jZruVCJwao9mGfai6A==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:1d86:b0:426:52a8:2847 with SMTP
 id 5b1f17b1804b1-4279dadbd9emr2510365e9.1.1721033162442; Mon, 15 Jul 2024
 01:46:02 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:15 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-16-smostafa@google.com>
Subject: [PATCH v5 15/18] hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: WKvGfhLGJ+t3

IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
SMMU instances we consider the input address as the IOVA, but when
nesting is used, we can't mix stage-1 and stage-2 addresses, so for
nesting only stage-1 is considered the IOVA and would be notified.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c     | 39 +++++++++++++++++++++++++--------------
 hw/arm/trace-events |  2 +-
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 9a88b83511..84cd314b33 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1096,27 +1096,38 @@ epilogue:
  * @iova: iova
  * @tg: translation granule (if communicated through range invalidation)
  * @num_pages: number of @granule sized pages (if tg != 0), otherwise 1
+ * @stage: Which stage(1 or 2) is used
  */
 static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
                                int asid, int vmid,
                                dma_addr_t iova, uint8_t tg,
-                               uint64_t num_pages)
+                               uint64_t num_pages, int stage)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
+    SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
+    SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
     IOMMUTLBEvent event;
     uint8_t granule;
-    SMMUv3State *s = sdev->smmu;
+
+    if (!cfg) {
+        return;
+    }
+
+    /*
+     * stage is passed from TLB invalidation commands which can be either
+     * stage-1 or stage-2.
+     * However, IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
+     * SMMU instances we consider the input address as the IOVA, but when
+     * nesting is used, we can't mix stage-1 and stage-2 addresses, so for
+     * nesting only stage-1 is considered the IOVA and would be notified.
+     */
+    if ((stage == SMMU_STAGE_2) && (cfg->stage == SMMU_NESTED))
+        return;
 
     if (!tg) {
-        SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
-        SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
         SMMUTransTableInfo *tt;
 
-        if (!cfg) {
-            return;
-        }
-
         if (asid >= 0 && cfg->asid != asid) {
             return;
         }
@@ -1125,7 +1136,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
             return;
         }
 
-        if (STAGE1_SUPPORTED(s)) {
+        if (stage == SMMU_STAGE_1) {
             tt = select_tt(cfg, iova);
             if (!tt) {
                 return;
@@ -1151,7 +1162,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
 /* invalidate an asid/vmid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
                                       dma_addr_t iova, uint8_t tg,
-                                      uint64_t num_pages)
+                                      uint64_t num_pages, int stage)
 {
     SMMUDevice *sdev;
 
@@ -1160,10 +1171,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
         IOMMUNotifier *n;
 
         trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, vmid,
-                                        iova, tg, num_pages);
+                                        iova, tg, num_pages, stage);
 
         IOMMU_NOTIFIER_FOREACH(n, mr) {
-            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages);
+            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages, stage);
         }
     }
 }
@@ -1194,7 +1205,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
-        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
         if (stage == SMMU_STAGE_1) {
             smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         } else {
@@ -1217,7 +1228,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages,
                                  ttl, leaf, stage);
-        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages, stage);
         if (stage == SMMU_STAGE_1) {
             smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         } else {
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 593cc571da..be6c8f720b 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -55,7 +55,7 @@ smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
-smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
+smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
 
 # strongarm.c
 strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
-- 
2.45.2.993.g49e7a77208-goog
