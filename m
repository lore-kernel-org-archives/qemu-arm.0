Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293691ejh;
        Mon, 8 Apr 2024 07:09:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJcyczKpysnFalkFz1EbpI/DblHRjP64QE5Knn7OueCcKEfEw3Sw122G1g/F/w6YTtynKauwd2fmfVpzVW/SHUT2pkW7s2
X-Received: by 2002:a25:af10:0:b0:dda:aa3e:73fc with SMTP id a16-20020a25af10000000b00ddaaa3e73fcmr7071692ybh.41.1712585349907;
        Mon, 08 Apr 2024 07:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585349; cv=none;
        d=google.com; s=arc-20160816;
        b=phJiQyv8JdVftwnZTuqCc56NL2xa1c1D+eVrzdoO2Hr0/A/1pdDv6lAtdAm3WgUCTY
         6WwJ9ekPdQQ3pR+9ofvuUoiuQhvxEHWXBFw99rADiSNTwSUXRHCc36IFMlkjVvybrr9V
         k6B7kHFLYi3IV1pVNKpzCCyrW+PcdpSnOJ4NXF99uIVwT4aCla9ZmHCVYQI6/nNjnXfI
         TZjleiI/tQ+bJveA2gWSj+sUdpM/UMxatwyBvpvfJI/aX/X4AN9/iMWaquyw5GhXjXpP
         FUHwORuC5id21BSMeVFoHEOi7Y4uy4/2EwKQr0BYb5pbCu1xxQ5WhADRTd4DOxQUNIBc
         LlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=I6ATJsy3meUvTXvscx3wXoJMQXTicy2M4jxU0ba4BEQ=;
        fh=hnEYOjFrviYO6DJLzd6hrOlBcAP2i9AJMtFBs862iqU=;
        b=DQFOKZcx08+vOgcndFoaeRwgnHN7t/h9wYsvPoIFY7h85n0wGiCqC9yTc7cTkedbho
         RoKSExHAocyJr+kZGt4m8LNTf1yIXQJwy0c3mFyocXgsReN+M32zDk/ml8tnrLXuUF3L
         NGUUJQKv8fbWqsBWdabdi457AoHsluryukKlSxDDybmhWapQtObBpQn8OwbXWQeCICjX
         /uf555jGOJT+gaOLG3UA4Jr/AE80btIHQOIenIAwLICD3fIQC4wE4/pz/O2wbalGJkf2
         pdS6idM4f2rDC0gEFHj6grHV604ahFiG/m1LozeeNgj+K6ZOdaUzidZ700Gnux/dBMna
         ha0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=unTiH+Bp;
       spf=pass (google.com: domain of 3hfotzggkcwiuoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3hfoTZggKCwIuoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3hfoTZggKCwIuoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id y5-20020a258605000000b00dc6c123d648sor2607005ybk.13.2024.04.08.07.09.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3hfotzggkcwiuoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=unTiH+Bp;
       spf=pass (google.com: domain of 3hfotzggkcwiuoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3hfoTZggKCwIuoquvchciqqing.eqocngz.dgppggnkpctq.qti@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585349; x=1713190149; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I6ATJsy3meUvTXvscx3wXoJMQXTicy2M4jxU0ba4BEQ=;
        b=unTiH+BpMAUZeUNJXG5220lf8QiJ18vA5MHQDDGf8pr/eGk4CAru59mJ9AXyjWul7A
         d6kIoDTzk8enUzbit7GYD0xwLHRUExOjGQvw5URSPByklqg7VuGB2cmJksBtG4DIYshu
         oO6RN+cWtVnQH6tncYKQFFdvKX2OHwsxSTTEm1VXtZRYk0bwfiSufekBHNWfoWpo56mZ
         wgXRX5YsAK3F99I9rE41PTEpIxa0Ox+WWiRSpYhW8Ck47ihQ8gOKnKKBOIWOlkVuOEs+
         9hh9y58U2egJvMHdw9YEAuhGeoUqTj95nmUmHxqTLpfa0pFmBtbVqQov0Qw4z23hHMxu
         O66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585349; x=1713190149;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6ATJsy3meUvTXvscx3wXoJMQXTicy2M4jxU0ba4BEQ=;
        b=hBKIeoz6mAIvdBj3I3xTlUohzwLkFAyj527fgVIQwCxL4XBsJoHUcvOyhiw+qCcnl1
         /+x3JNhioHv3nN5YDLoT8Y2Dh3qWil26QPENbNeva2xMV9ahuiXIAy4L0K46a23MM33y
         T4aNg04KSLddgRsl6n8dtLccxAhhufv/cis9tFP45f1B9xjFkGikdmoL5IdWL87UD8PF
         l1Hl7uRavx7DQhFd8YJoHQo58Oq7BWZbig+meoAmHnN/N8kJrutp2WtoeEuoBfQj6PlY
         rkIULldhRe2op+hMsylB1MxQPRMaGcIqJsrpi1ti3d7sRX536AQuRVhX4yGs75s2yVQZ
         u+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7fnqyTwBN9KjW52+kRiDLo1O0ZcsU4aHN6X+BmdIEPfBtvbW8z9xGBLXgYj2zRmFtZAY0W+2H3cNHDLbm5XAinywTcuN+
X-Gm-Message-State: AOJu0Yz55XdUgcz3mqK8AKsui6KwY+1ejYZpwh3QURNtP+ZqaUhBC3tA
	Eo/RgLhFX8bTmAQmf5i7mqD53YP7dLVU38g108LTYGVlDI3x7DEuvHxJ7e95ANwcSxBSsrQC0U/
	NhRQ0PP0IOA==
X-Google-Smtp-Source: AGHT+IFXhj1dMnd9bT4RTIIS37SU46vpA7CZ6O2Z8X347JAcK6N9p9bX08nMAvw66FJ0i9MlUzBFuX5qt0wigg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1502:b0:dd9:1b94:edb5 with SMTP
 id q2-20020a056902150200b00dd91b94edb5mr705407ybu.10.1712585349473; Mon, 08
 Apr 2024 07:09:09 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:09 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-5-smostafa@google.com>
Subject: [RFC PATCH v2 04/13] hw/arm/smmuv3: Translate CD and TT using stage-2 table
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ACk6/FrgHdfP

According to the user manual (ARM IHI 0070 F.b),
In "5.2 Stream Table Entry":
 [51:6] S1ContextPtr
 If Config[1] == 1 (stage 2 enabled), this pointer is an IPA translated by
 stage 2 and the programmed value must be within the range of the IAS.

In "5.4.1 CD notes":
 The translation table walks performed from TTB0 or TTB1 are always performed
 in IPA space if stage 2 translations are enabled.

So translate both the CD and the TTBx in this patch if nested
translation is requested.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c              | 49 ++++++++++++++++++++++++++++++------
 include/hw/arm/smmu-common.h | 17 +++++++++++++
 2 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 897f8fe085..a7cf543acc 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -337,14 +337,36 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
 
 }
 
+static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
+                                                 SMMUTransCfg *cfg,
+                                                 SMMUEventInfo *event,
+                                                 IOMMUAccessFlags flag,
+                                                 SMMUTLBEntry **out_entry);
 /* @ssid > 0 not supported yet */
-static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
-                       CD *buf, SMMUEventInfo *event)
+static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
+                       uint32_t ssid, CD *buf, SMMUEventInfo *event)
 {
     dma_addr_t addr = STE_CTXPTR(ste);
     int ret, i;
+    SMMUTranslationStatus status;
+    SMMUTLBEntry *entry;
 
     trace_smmuv3_get_cd(addr);
+
+    if (cfg->stage == SMMU_NESTED) {
+        CALL_FUNC_CFG_S2(cfg, status, smmuv3_do_translate, s, addr,
+                         cfg, event, IOMMU_RO, &entry);
+        /*
+         * It is not clear what should happen if this fails, so we return here
+         * which gets propagated as a translation error.
+         */
+        if (status != SMMU_TRANS_SUCCESS) {
+            return -EINVAL;
+        }
+
+        addr = CACHED_ENTRY_TO_ADDR(entry, addr);
+    }
+
     /* TODO: guarantee 64-bit single-copy atomicity */
     ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
                           MEMTXATTRS_UNSPECIFIED);
@@ -659,10 +681,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
     return 0;
 }
 
-static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
+static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
+                     CD *cd, SMMUEventInfo *event)
 {
     int ret = -EINVAL;
     int i;
+    SMMUTranslationStatus status;
+    SMMUTLBEntry *entry;
 
     if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
         goto bad_cd;
@@ -713,6 +738,17 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
 
         tt->tsz = tsz;
         tt->ttb = CD_TTB(cd, i);
+
+        /* Translate the TTBx, from IPA to PA if nesting is enabled. */
+        if (cfg->stage == SMMU_NESTED) {
+            CALL_FUNC_CFG_S2(cfg, status, smmuv3_do_translate, s,
+                             tt->ttb, cfg, event, IOMMU_RO, &entry);
+            /* See smmu_get_cd(). */
+            if (status != SMMU_TRANS_SUCCESS) {
+                return -EINVAL;
+            }
+            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
+        }
         if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
             goto bad_cd;
         }
@@ -767,12 +803,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return 0;
     }
 
-    ret = smmu_get_cd(s, &ste, 0 /* ssid */, &cd, event);
+    ret = smmu_get_cd(s, &ste, cfg, 0 /* ssid */, &cd, event);
     if (ret) {
         return ret;
     }
 
-    return decode_cd(cfg, &cd, event);
+    return decode_cd(s, cfg, &cd, event);
 }
 
 /**
@@ -942,8 +978,7 @@ epilogue:
     switch (status) {
     case SMMU_TRANS_SUCCESS:
         entry.perm = cached_entry->entry.perm;
-        entry.translated_addr = cached_entry->entry.translated_addr +
-                                    (addr & cached_entry->entry.addr_mask);
+        entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
         entry.addr_mask = cached_entry->entry.addr_mask;
         trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
                                        entry.translated_addr, entry.perm,
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 96eb017e50..2772175115 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -37,6 +37,23 @@
 #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
                                              VMSA_BIT_LVL(isz, strd, lvl)) - 1)
 
+#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
+                                             ((addr) & (ent)->entry.addr_mask);
+
+/*
+ * From nested context, some functions might need to translate IPA addresses.
+ * As cfg has SMMU_NESTED, this won't work, this macro calls a function with
+ * making it a stage-2 cfg and then restore it after.
+ */
+#define CALL_FUNC_CFG_S2(cfg, ret, fn, ...)  ({ \
+                                                   int asid = cfg->asid; \
+                                                   cfg->stage = SMMU_STAGE_2; \
+                                                   cfg->asid = -1; \
+                                                   ret = fn(__VA_ARGS__); \
+                                                   cfg->asid = asid; \
+                                                   cfg->stage = SMMU_NESTED; \
+                                              })
+
 /*
  * Page table walk error types
  */
-- 
2.44.0.478.gd926399ef9-goog
