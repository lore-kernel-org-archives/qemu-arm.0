Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931841ejb;
        Sun, 28 Apr 2024 20:25:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiqhfpOr0uD2JdjNJTlrN0HA40pSoJ4sVfauKrPXAjfKnrJ7xrSNonFjdbRVd0sr/Eb8fCz3hrT38iT98VjqSzmUXZrMQw
X-Received: by 2002:a25:c70a:0:b0:de5:852f:6afe with SMTP id w10-20020a25c70a000000b00de5852f6afemr9475419ybe.30.1714361103293;
        Sun, 28 Apr 2024 20:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361103; cv=none;
        d=google.com; s=arc-20160816;
        b=EZVhaqrWVAqTfMbY9hlfq64xTyZxDMszreU8CfrQ777SgsfG2qdb6TAeJDTeL5PbyQ
         F8M9nHH//Z20JYkhljnHSKOwuH0gOuYH2yNif6gXKamYukk3G+2Bl1dmbnXrayk9Y9gj
         jnGQ8FVyFRkZcMPnrFuMmssaZLEu5zhGulgJhHKnz4zEwjxhPjnAhP7lAgdp3+ppmyeg
         zGW31JB9UbUDmllgNUhynLzR9id84zjL8Q4YjXbm6MQziH5yJIV7blhw4YeCXxc7gG6T
         r2DekO8jF7HxzKG09FkjVkTwlDIv+0ZRHbmxg+FrbG8B7aaVM2LbzLnq5EhQme9qnr3p
         PjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=kQSHQ4bjl48E5wczRMJUqDVsdeVuhwGaWB+Kj7A4WsY=;
        fh=suVFkMA6FZjSW1f6+TtSpPNx3l/271jGp6UbFMnXmE0=;
        b=kzGWLyJswU/dm+xa7pDaaZEsF/mf3pj1uoB2FX7Mb+GylBn5RFt7R9VTlkOWnghd6Z
         U80KxbBbO5WKV08O4+f/7OikdYZSKHCNkfr9bQG+FoLkNDCwV9mKI+TFf6BVZY0d5NCA
         66DK2O7kTYnmOogOQiyKmkhXxg5g9CJcYY38s2a3lVOhPwLydvkqOAxotizmQ1roa3Aa
         N36fmKM9VX/b5Z8r4aULw6o6AL8ezz1pXmFcyvPzq58rPL/YJsdP7DSdlKFc9Q45V9F3
         YUruFIYglidpCehcK1AWjhmao3GZuEkPLAeI1QGzxn6WNRICKaE8NgNXmyogJmhbrDPH
         v8lA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2iuY2+0K;
       spf=pass (google.com: domain of 3dhmvzggkcykxrtxyfkflttlqj.htrfqjc.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3DhMvZggKCykXRTXYFKFLTTLQJ.HTRFQJc.GJSSJJQNSFWT.TWL@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3DhMvZggKCykXRTXYFKFLTTLQJ.HTRFQJc.GJSSJJQNSFWT.TWL@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id m203-20020a2558d4000000b00dcffacae8b3sor16311767ybb.11.2024.04.28.20.25.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3dhmvzggkcykxrtxyfkflttlqj.htrfqjc.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2iuY2+0K;
       spf=pass (google.com: domain of 3dhmvzggkcykxrtxyfkflttlqj.htrfqjc.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3DhMvZggKCykXRTXYFKFLTTLQJ.HTRFQJc.GJSSJJQNSFWT.TWL@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361103; x=1714965903; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kQSHQ4bjl48E5wczRMJUqDVsdeVuhwGaWB+Kj7A4WsY=;
        b=2iuY2+0KFy/k7Uj8AwnU4XvPHhM0Fi8kS8xxRpNya1GK/GpwY5ySPGH4/z/TlOTblA
         gEFkAttxyAmaIsTdWd9c0tH8FfGUsRupT+Eq6l6LliAlMT/NdPFyj2CZXVusg5NCnj/D
         bKts4b+HnHJV5BhQmHS05nki1l5Tabf9xeiL5OaP5v7AT6Uu2b6zLxoZBEMjS6f+1BlJ
         sDnZ0rOx4gQaVwxfkF7X1BaqpMZpBllLZaAnILCTsRCdtrjYOH1+cBHhzlkfORR9ZFR7
         2oeSft74b1hCX+iH4CHwggHMY8aPYm+TA+RLhuzchOCjmfY0PeC/8faqdwvjrlyP/Fzv
         72Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361103; x=1714965903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQSHQ4bjl48E5wczRMJUqDVsdeVuhwGaWB+Kj7A4WsY=;
        b=UuMJDHE3C8crIbx7N0lmGn4s2ep1kXvaveqs25de94Sx1XIYVbHjFEB14uzqtIAjpo
         5daDET3JVE92k69owvZlFDuN84uhdB1ZfYtoOOgGGIdo+2GNSttkoJ0/X6czAIbL+4dc
         l+fPw1tPTe2OjkkZf0cp+73ueOvqVIZRIHd5vly3v7lB2eB6PddbF9P2oj9mFW0/yllD
         aOn/g0drLbxKHDM6M8kNb6N6X/A96YWzVX2bTh+cNYEyHv8nlEgn9qe3Xh1Gac64q7mr
         r+DVK7PtVaOGnoRUkF9bEcITie47SwK/NPoBxk8tXhrWUGGVcXUTuLd1Bqn2raKARg2I
         0I/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJDsqa4qF9WUg5L0U9PIEiSU0RBBP5kKosQSqoc666vzNsDqqHFhQI4yexaziP6MVWh97XjtqlXpkWTTfAvl1nBSeP+9Xf
X-Gm-Message-State: AOJu0Yx3oOcnYK60BpqjdzATCdgmBtQ+LKePd88FexppyawGurBoTbKV
	0AtZTKgV7SIOZR0E2TMxL87vsUmV0rUCzZ7AmMUtyxC9ZrKoqLeE8HkRjyaea26a63r2PKURUE/
	+m5gKm4l6wA==
X-Google-Smtp-Source: AGHT+IEEihisQcVfOSCXWkAdlTta/qFsp2lWKdxJceK3Mf4u+hCfssFO41A+q3TqTKjFBXvUokFvxwSAK5l6mA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:2187:b0:de5:4ed6:d3f3 with SMTP
 id dl7-20020a056902218700b00de54ed6d3f3mr3176328ybb.6.1714361102803; Sun, 28
 Apr 2024 20:25:02 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:57 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-14-smostafa@google.com>
Subject: [RFC PATCH v3 13/18] hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 7tm919Y/fUK4

IOMMUTLBEvent only understands IOVA, for stage-2 only SMMUs keep
the implementation, while only notify for stage-1 invalidation
in case of nesting.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c     | 23 +++++++++++++++--------
 hw/arm/trace-events |  2 +-
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e0fd494646..96d07234fe 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1051,7 +1051,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
                                int asid, int vmid,
                                dma_addr_t iova, uint8_t tg,
-                               uint64_t num_pages)
+                               uint64_t num_pages, int stage)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     IOMMUTLBEvent event;
@@ -1075,14 +1075,21 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
             return;
         }
 
-        if (STAGE1_SUPPORTED(s)) {
+        /*
+         * IOMMUTLBEvent only understands IOVA, for stage-2 only SMMUs
+         * keep the implementation, while only notify for stage-1
+         * invalidation in case of nesting.
+         */
+        if (stage == SMMU_STAGE_1) {
             tt = select_tt(cfg, iova);
             if (!tt) {
                 return;
             }
             granule = tt->granule_sz;
-        } else {
+        } else if (!STAGE1_SUPPORTED(s)) {
             granule = cfg->s2cfg.granule_sz;
+        } else {
+            return;
         }
 
     } else {
@@ -1101,7 +1108,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
 /* invalidate an asid/vmid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
                                       dma_addr_t iova, uint8_t tg,
-                                      uint64_t num_pages)
+                                      uint64_t num_pages, int stage)
 {
     SMMUDevice *sdev;
 
@@ -1110,10 +1117,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
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
@@ -1144,7 +1151,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
-        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
         if (stage == SMMU_STAGE_1) {
             smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         } else {
@@ -1167,7 +1174,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
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
2.44.0.769.g3c40516874-goog
