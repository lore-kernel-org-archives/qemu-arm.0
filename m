Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293799ejh;
        Mon, 8 Apr 2024 07:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxwqZB6QJM8Wm+O4En0oAcJs7WWTYWsI8irqsvfBbaeB61aQ0wiDRaYAlvb1cz2kkgah/kTjogFtg6ovtxFtxpTt3vJTHn
X-Received: by 2002:a5b:9c1:0:b0:dd1:22f1:50e7 with SMTP id y1-20020a5b09c1000000b00dd122f150e7mr5694318ybq.35.1712585359533;
        Mon, 08 Apr 2024 07:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585359; cv=none;
        d=google.com; s=arc-20160816;
        b=rXCFTTWgwGs5HcGCZJt4gPJzkvqWgIE7mSIZuQh8XOgLJPFwABCkTLRbhsw5OfeVG1
         lm5I3vCfUXxgmbnf4RFzBBejWfZZiggz88i9q+iqV6Iv4vDoNDbHxOzVoVXk1jCJSQy4
         5IQI3AcLg1HZ/qq6pQlgtxW7nXPf+oydYDCHv5+7tkI5wt/bWOJXjf7DBQykvZyztAGD
         oCzcGmnvlpPo0+0escD1wpC/Q3INNtLGvcZmAUmlidnnJ0vNI1O/6a4ADKyznhfp/FyU
         o7m5JH7lBoX44DGgA4f+2p1GwxyQQoqzuIX+byMuoMFo0CktUZQax0sNqiOZ/jVycRMA
         ZJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=3HqNDgdJVJw0NA38Rt0khH0xSYdgx1axY3awgliAoN0=;
        fh=I+sRWVUwj3CDRH/5gPzFmLzerfNC56ctWSuz4jSFhFA=;
        b=NOLJNM54ogdoZTf3o3F8nNLXBU7288fGl1D6OA/Lgs0MIRcTFOFf6BMNZaOOjBy7Z9
         Gq2LWEpQZlsiINo5XgN6Nu4w19j0maxAz7PILvhiMIeSwQ1HkvJf1wj53s0PAHCrB+t+
         1c2x4/IHauCHAGw2uvDb9HE+xZ4pqbGV0ttPPEvOR+Dn4+BdNB/OrxeOLEQbbRraygk0
         z0kFYt41J/TkGQAPNtztLIkO4BIVjLVpjBurXchKd2s6DKayCypUNHKvMjsKWAWPIip6
         pxuwwqDHWSf2Llzo0yMBcuxuc9kioSjP0/jeoPgQaQ99C4EYtETIwcXda1Sbn7j/uVuw
         JPGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1RfHdmcO;
       spf=pass (google.com: domain of 3jvotzggkcws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3jvoTZggKCws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3jvoTZggKCws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 129-20020a250087000000b00dc6baa2262dsor2590943yba.12.2024.04.08.07.09.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3jvotzggkcws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1RfHdmcO;
       spf=pass (google.com: domain of 3jvotzggkcws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3jvoTZggKCws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585359; x=1713190159; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HqNDgdJVJw0NA38Rt0khH0xSYdgx1axY3awgliAoN0=;
        b=1RfHdmcOBH2PUhi2nR9eWUuatACcfZbBtqFMTSgPDjrqWr90JMyWGTU5Eo/Tgum1Ie
         KPZlc6+QwX9N2gllQz/l+Jepr85vrZj/XNXfvZcVnMwV6HOoxYp0nBeZbUWeyxdFcF2e
         FVgc4cwjLKxCIG2k8DT4oZn97I5Lkg/9JALEIW07UMXBFoo+GjpK90Or5UE4xCzSdjKm
         Jf7LKqJFyyTFLNNFIXGlSKZRnvqrxava1rEdG7AyeBabuR2kY3WZBNSS23NU1Nqir713
         qCccGtBj4xLXkbmUY0Wu/G6oiM59p29F+6cZXwqaH1vriGvTtY+4vtRpkP8oOwIPl6RD
         /iKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585359; x=1713190159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3HqNDgdJVJw0NA38Rt0khH0xSYdgx1axY3awgliAoN0=;
        b=r1af1bLOSNDEmsp7+CxTcnC3s7MYIX64pgeKJJGiLLpzPe7BOK71S1LkghRzECGSnM
         FsXjT46CLm53iQ5HjBycnhhBO1LX0+T43JHTmR5VBd4zpQxDp7GMlOhHm+JrAlXFDzVi
         BJ5tVt5McEF78dCxp9D1dGqPCt7r9Ntc/AUSehEcoXqmkGmATn41yub3Co9jcAK6h73d
         9kroQ9UFvR5FAcQQ+6u0XoDBZRd92JdMHHMwnuzvo48/YBTfxVw5WRq1VVzzGLCVhKcN
         B8VbwHbNvXUzU7MvU+9SRiYQgAup7RXXY7ROh/3RXQsvKoEdvusTyfAnRzW20Gz7XW72
         pywQ==
X-Forwarded-Encrypted: i=1; AJvYcCU75rEYzck5gT8tCqMiLg8cT7yHy2ma7bAPcDk9fCNGkJvLPzxjkTiKXnnMkSFPkTzvSPlulqC8SXx67Vzf8FX9KScsRP+s
X-Gm-Message-State: AOJu0Yy4nHJ3ew3QPLqyaueEoWEl4gjK1XGx9eb5ABeyrG31+8ZtofEq
	x+DNdYZN+X3FShWBzPKjB/ofwsOPsRV8iPEEy6Roy9WgZL6L5u0lO02oh7z5Fxh+jm5rAVsDVj/
	DOngT+ftQHQ==
X-Google-Smtp-Source: AGHT+IEWg5K7fM2dcPCvRd9RMsFcEdOBM1qMISm61aHu3BqQA/Rfue4/66wDQOMCL5NYhR7j9lozroVomxR0yg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:727:b0:dcc:8927:7496 with SMTP
 id l7-20020a056902072700b00dcc89277496mr672950ybt.5.1712585358833; Mon, 08
 Apr 2024 07:09:18 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:13 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-9-smostafa@google.com>
Subject: [RFC PATCH v2 08/13] hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: +nBw98ond/8p

IOMMUTLBEvent only understands IOVA, for stage-2 only SMMUs keep
the implementation, while only notify for stage-1 invalidation
in case of nesting.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c     | 23 +++++++++++++++--------
 hw/arm/trace-events |  2 +-
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ece647b8bf..85b3ac6a9c 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1028,7 +1028,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
                                int asid, int vmid,
                                dma_addr_t iova, uint8_t tg,
-                               uint64_t num_pages)
+                               uint64_t num_pages, int stage)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     IOMMUTLBEvent event;
@@ -1052,14 +1052,21 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
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
@@ -1078,7 +1085,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
 /* invalidate an asid/vmid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
                                       dma_addr_t iova, uint8_t tg,
-                                      uint64_t num_pages)
+                                      uint64_t num_pages, int stage)
 {
     SMMUDevice *sdev;
 
@@ -1087,10 +1094,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
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
@@ -1121,7 +1128,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
-        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
         if (stage == SMMU_STAGE_1) {
             smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         } else {
@@ -1144,7 +1151,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages,
                                  ttl, leaf, stage);
-        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages, stage);
         if (stage == SMMU_STAGE_1) {
             smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         } else {
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 2556f4721a..53b9d11feb 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -55,7 +55,7 @@ smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
-smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
+smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
 
 # strongarm.c
 strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
-- 
2.44.0.478.gd926399ef9-goog
