Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286560njm;
        Mon, 1 Jul 2024 04:03:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVGZ6r8XP+Zr7ZI6X6JN6L9gkqIr5fiILlTa6mL36BbfkV2vB6pMY2ROC3HgyHk4VdoTrqsrzmhwbUdkeqTjPjJww664oD
X-Received: by 2002:a05:600c:4202:b0:424:ad2a:1055 with SMTP id 5b1f17b1804b1-4257a02c872mr42826355e9.15.1719831822492;
        Mon, 01 Jul 2024 04:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831822; cv=none;
        d=google.com; s=arc-20160816;
        b=NN/yOupal6h3KZeSddvqi+eFlGfgPt4dvN69jWBpPBUcxktOFALLztJ6l23JJMJ5yL
         9/FCXw3D883M4YSCe/wlAhx8D1WPr1YREDB72o1RSF3xQy+NwrtGVlPwFs2cUoH3mPQX
         dYE4/XMAAewxk8EbBInY7Pp83NChcvb31jSKQdigjf4ZA4hWQIOzUt0ycr/yApVS4fTx
         dTAxNfPRSj5oooXDFoMQ7f8MwYrutr4VLbZPVbVxw678wZBgkgYFHoopj3Ru71z8uXoG
         9xIPCDBtAC2y1RbJcy6KERObyfJGgSig1NW1M+8i5UHy2AGzaJW00iMoANVn54zsx7Pl
         +sXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=lFf7LTyQryhCqwJWdSrsDWz4NW2inRaYmsKx7TIXcNM=;
        fh=ku/ujm0uXoKnPzgUYvUWKkOdft39TLNUleQ2LtGGddw=;
        b=FYh5wgmkMOBG0D16JXvdfK//qP53vv/aDa4TNSJ0tym1yXKgj5SrsUkeoWPAWX72a0
         cL/KviKs0reRWXfrGaz/D4BilYR1x0mNNTQFnS6ccsR6ykKsNF0jIAKLKpeoQP5WfuKN
         jQOq1TXIrOMAedlqrFx3XYdd4dMUOLgfsj0WtbhWy6Git8SGc7SgqDES61fHgHta1aQm
         1twjFeaHmKVBRVha0o4qd8+jL/0xAZw0l5XbbJyO72/DaH+xQ4kCMARC/iKgBcBXIGua
         NI1y9wR4d3DNXey1xX4FOjebwZCIlq70K8LK3n0IuRgw7w92CjNRbe+9Vm8MRdjbcN85
         62kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hHf+B1Ia;
       spf=pass (google.com: domain of 3dy2czggkc2wcwycdkpkqyyqvo.mywkvoh.loxxoovsxkby.ybq@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3DY2CZggKC2wcWYcdKPKQYYQVO.MYWKVOh.LOXXOOVSXKbY.YbQ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3DY2CZggKC2wcWYcdKPKQYYQVO.MYWKVOh.LOXXOOVSXKbY.YbQ@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42565606e4fsor26190255e9.8.2024.07.01.04.03.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3dy2czggkc2wcwycdkpkqyyqvo.mywkvoh.loxxoovsxkby.ybq@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hHf+B1Ia;
       spf=pass (google.com: domain of 3dy2czggkc2wcwycdkpkqyyqvo.mywkvoh.loxxoovsxkby.ybq@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3DY2CZggKC2wcWYcdKPKQYYQVO.MYWKVOh.LOXXOOVSXKbY.YbQ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831822; x=1720436622; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFf7LTyQryhCqwJWdSrsDWz4NW2inRaYmsKx7TIXcNM=;
        b=hHf+B1IanZkY/ETHKZEYqkHB+RKt5MUMFKl9UReV5Np3W97vLCWfO9F69JXH14Ll8Z
         hlvfWm6YguAJ98+u4DH5L1oau2yGI664HPrjDh5G+hur747BgaIz4WMIS0ZJsSqy1h/L
         uRaUwcRAdiRRfpvPgboRIg6AwG/bqOhKT9B+UglnOkEVGEBqaWbzRgzO4G/HyeutuJNk
         PFHRM1UgL4uJ02s3Ic2PZWd6P5//xRTOYI0JbmtyVADX5p5dFGPnciV06xTLtbChPNta
         TECqTECtp1znC3kXfzoOJMoKOd/YKmrzFUkmjCpbaTX5SqVZbRTCcpjhWca6BSSZ664v
         ZZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831822; x=1720436622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFf7LTyQryhCqwJWdSrsDWz4NW2inRaYmsKx7TIXcNM=;
        b=OdkjDO8lXkGk7OfAQGpFheN72271XO347TAKY8YI9R8xu8Jrdy6yJ3NeKUMYlCPgmZ
         7YPu2z+pcjy0G97+++Y29I2YO/wp5NV6m4Ebk0ywQs+KpaSfUFqRh2S3NXUTonZUhwFZ
         3OL0XJXRV2MedrGUNwlojd30R79m2DUCtlfr7o0WOENhPddEWNEIRTtaetr6QGURkKSW
         6+wB/zCysh9hqG4ZVberZ4ZCqB9TtZ400A6I2o+X1HS0yukr+dqecDP8+OtdNWfSNXT7
         Y2AxoJNy1/1jq0nZJLb9WmndVOJvNP3NR8wyZ2v/fndNr9vHFj71kaDCVVT0FNGiSQCW
         vICQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU0grEp1vbYejdMrl3dcJYL7Nc+kqnV/bSIl8Dk4GLSvqJAlX42KSoQkceBqX7M1zbcriYuTsUbZQV2bhP7B7Awep1Q874
X-Gm-Message-State: AOJu0YxV3aaF7ot9BATEAYFXY1u/lgeuCE/0nVyRKX6DKqcu+viHCVJj
	sD2chOyk68HsDlg5UBEKH+aqoLohJ07f6m1W8tmTF86mtkxfiWwSN0+LCv9paq7aYB5km2ko1br
	0sNx2f8vmBA==
X-Google-Smtp-Source: AGHT+IFxdDw/zMT5mUyxzY5kRonRo/WQXM4JeI7ZxY0226hit9+Bo9BAi7N8CHvRqD2FUGck4n8tFgEEc7rC0w==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:35c7:b0:425:672a:769b with SMTP
 id 5b1f17b1804b1-4257a05c6b4mr297475e9.5.1719831821932; Mon, 01 Jul 2024
 04:03:41 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:37 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-16-smostafa@google.com>
Subject: [PATCH v4 15/19] hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: f9uM+CZLqNQd

IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
SMMU instances we consider the input address as the IOVA, but when
nesting is used, we can't mix stage-1 and stage-2 addresses, so for
nesting only stage-1 is considered the IOVA and would be notified.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c     | 28 +++++++++++++++++++---------
 hw/arm/trace-events |  2 +-
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e9007af3cd..36eb6f514a 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1064,17 +1064,17 @@ epilogue:
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
     IOMMUTLBEvent event;
     uint8_t granule;
-    SMMUv3State *s = sdev->smmu;
 
     if (!tg) {
         SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
@@ -1093,14 +1093,24 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
             return;
         }
 
-        if (STAGE1_SUPPORTED(s)) {
+        /*
+         * stage is passed from TLB invalidation commands which can be either
+         * stage-1 or stage-2.
+         * However, IOMMUTLBEvent only understands IOVA, for stage-1 or stage-2
+         * SMMU instances we consider the input address as the IOVA, but when
+         * nesting is used, we can't mix stage-1 and stage-2 addresses, so for
+         * nesting only stage-1 is considered the IOVA and would be notified.
+         */
+        if (stage == SMMU_STAGE_1) {
             tt = select_tt(cfg, iova);
             if (!tt) {
                 return;
             }
             granule = tt->granule_sz;
-        } else {
+        } else if ((stage == SMMU_STAGE_2) && (cfg->stage != SMMU_NESTED)) {
             granule = cfg->s2cfg.granule_sz;
+        } else {
+            return;
         }
 
     } else {
@@ -1119,7 +1129,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
 /* invalidate an asid/vmid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
                                       dma_addr_t iova, uint8_t tg,
-                                      uint64_t num_pages)
+                                      uint64_t num_pages, int stage)
 {
     SMMUDevice *sdev;
 
@@ -1128,10 +1138,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
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
@@ -1162,7 +1172,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
-        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
         if (stage == SMMU_STAGE_1) {
             smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         } else {
@@ -1185,7 +1195,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
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
2.45.2.803.g4e1b14247a-goog
