Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286383njm;
        Mon, 1 Jul 2024 04:03:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtQL4YCchKLHfSK9BDYgZwT7EUmyw1YXI17gk/TplvqASRIhBdPJiYodwTdd91jmP6wU0hsqlfkBf2sOAKaSgGFxkImXFC
X-Received: by 2002:a05:651c:81d:b0:2ec:5502:b2f4 with SMTP id 38308e7fff4ca-2ee5e707762mr35302991fa.45.1719831805993;
        Mon, 01 Jul 2024 04:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831805; cv=none;
        d=google.com; s=arc-20160816;
        b=K2X2KnYfxlkP1LD1jajQHNvIt6dVA7vrYpedX8/M7NhYyyaHsPDRwd7m98IB/FCLio
         5ldUfUBEbWBD66ONdxPQY0LTooXsinyWtVH867ISXGcJ3e9kqCWxOVn4SHDJbgRifNlE
         qEsl+LefF8cuY4YyUPRZF1IMmBRSaYZgzXENiewkxy5Vj7yN2aSJpKbYD/p/G7ANF0Bu
         5KEkiX3tKEi+uCpJPzzWugwV9D4n523uOtM6FcdbLv2b4sJxD93THl2wQ3hbI3hHt4hy
         kuwrSQ/Ll5VhdxJj/eWaeyeoUIp2vniXdnIciXhw95xNChAv8he1tD/MWKXcPW5zKgIm
         rgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=CX75BBMr16Pco/B3TBgFcZZDPnngLrDGwCyV2KD+jJ0=;
        fh=gdzlRDLILJWfLZxRmm9djNhKK2Y9X+tn0k9KJ14M/80=;
        b=Z4Q91xPLvFQwbqrINUa5GLIXBQAS9/T3BjIvy/GH8ntQGILdyUn2SoGkV1ZjX4B9UL
         dQiUM8boPAWOLU5xS4zWjM2cS78ApPjS/AbB1a+9nYrbc5t2TplY2VnUyZkOvkCWmUAg
         hK8suN0en9KuvUKNyXKOUZLjPewvXREH95W3/1DWI6EyMVWbl/f9CfiuLR8QHcR6g22J
         p9znjHcGu2NgJT6ZS83m7fP67xCfCHsrlQwc5hsu6I1mEZJwgLtyIcsvHxgwaIrocfC0
         i9szFZDiX6tTvFkvqwQ95H10fuSYHOBIZS3fACaG5euznICqwFWvYDvXwdK8XAVPn9D2
         +vgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jQz1hXsF;
       spf=pass (google.com: domain of 3_yyczggkc1wmgimn494aiiaf8.6ig4f8r.58hh88fch4li.ila@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3_YyCZggKC1wMGIMN494AIIAF8.6IG4F8R.58HH88FCH4LI.ILA@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3_YyCZggKC1wMGIMN494AIIAF8.6IG4F8R.58HH88FCH4LI.ILA@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-425655c00efsor34419125e9.1.2024.07.01.04.03.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3_yyczggkc1wmgimn494aiiaf8.6ig4f8r.58hh88fch4li.ila@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jQz1hXsF;
       spf=pass (google.com: domain of 3_yyczggkc1wmgimn494aiiaf8.6ig4f8r.58hh88fch4li.ila@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3_YyCZggKC1wMGIMN494AIIAF8.6IG4F8R.58HH88FCH4LI.ILA@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831805; x=1720436605; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CX75BBMr16Pco/B3TBgFcZZDPnngLrDGwCyV2KD+jJ0=;
        b=jQz1hXsF98JTB+77AqPNugbpMPzybWIgAQZ9L+u+7/xTUpyX5D+mxVuBWjOaTcbv69
         fq39jsXmWOJVNeh4A/LVlODruZc8NFMH3ZPk8fNX96Cnij1KPR7s7qZ+I5bjF2mDmV8F
         ZQv+lmv6Banr2r56B68/H6dpZO4s5CbTZQdYEgFYWHCD28+zEKCPI4DIhbWBDzjjgGQS
         5is0FU9L5YuAUXZ8FiMi6+g7bMTG9VZM3wDSyen+Yqg+A8Lnbul9qI5nYxN/IQxlsdjz
         NdtYBbdaxmSyAORYqgxq3N0aCNkaaoJIggFYoVbjrAQOFm267VsNMpTbKfuY3x74GP8c
         lwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831805; x=1720436605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CX75BBMr16Pco/B3TBgFcZZDPnngLrDGwCyV2KD+jJ0=;
        b=aPPnQ5StkbB7zf+ZnOu5hp9lu0DVZKOjBX4zvXWDeqbS+IrxYUXzbhYVyrO6XLyX7i
         2YxMq71QYIy7j9wBGCe4VH27UsCf5kQRKPOEk1MWMxw/QP6r2hQ9e6O/YvM6D1p0cWjl
         936mwAy4ASa6XdyarnZeRtOorjxp7hCQzbR0AE/4QVTHR6vjA8vNwENzjj6tQLgFN6Ox
         9uRkoKpcA5cUJUoqEMhYY+fsgpXzS0wcJvh+S9nJUBCi+olK/wjvHOPg5v3/FQpCvDzm
         zV7/T6UZWfgFBHfyR+8KmZwFK785oB2uURuPWRJah//JsuAOK2r4wkJ7jrqBrXvD4++L
         lJqg==
X-Forwarded-Encrypted: i=1; AJvYcCUECLJGapYdC7Wju7t/dYQGJX3JgqA88A+aLvumYbqAPZ6OCP7xg6RkBZ7SX9g5T8FXrUucS2ahaZGAsxRIpgqi7Z2phJAt
X-Gm-Message-State: AOJu0Yy9vb845Az7MdfGgjGa+usLHfrNihNavc92yJbXbo/VglDmjmmb
	ca+AMnMi7x15ocNLTq2/6G+hOnas15dtm8qFixpXKvzA488RbNY2PXHiJ/HOAh6tPVpvXR935//
	2Q9OwWQpX0w==
X-Google-Smtp-Source: AGHT+IHkOtQW1UdbGSx6SEkZDuB9UujL1yyijz3SygDOe2j4jqk/o4VNie7yzWDpxF9i7uoCdCgo7yQccO9Gew==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:1ca3:b0:425:671d:cef6 with SMTP
 id 5b1f17b1804b1-4257a046ccamr803115e9.4.1719831805403; Mon, 01 Jul 2024
 04:03:25 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:30 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-9-smostafa@google.com>
Subject: [PATCH v4 08/19] hw/arm/smmuv3: Translate CD and TT using stage-2 table
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: AaQEhQ7LPHl3

According to ARM SMMU architecture specification (ARM IHI 0070 F.b),
In "5.2 Stream Table Entry":
 [51:6] S1ContextPtr
 If Config[1] == 1 (stage 2 enabled), this pointer is an IPA translated by
 stage 2 and the programmed value must be within the range of the IAS.

In "5.4.1 CD notes":
 The translation table walks performed from TTB0 or TTB1 are always performed
 in IPA space if stage 2 translations are enabled.

This patch implements translation of the S1 context descriptor pointer and
TTBx base addresses through the S2 stage (IPA -> PA)

smmuv3_do_translate() is updated to have one arg which is translation
class, this is useful to:
 - Decide wether a translation is stage-2 only or use the STE config.
 - Populate the class in case of faults, WALK_EABT is left unchanged,
   as it is always triggered from TT access so no need to use the
   input class.

In case for stage-2 only translation, used in the context of nested
translation, the stage and asid are saved and restored before and
after calling smmu_translate().

Translating CD or TTBx can fail for the following reasons:
1) Large address size: This is described in
   (3.4.3 Address sizes of SMMU-originated accesses)
   - For CD ptr larger than IAS, for SMMUv3.1, it can trigger either
     C_BAD_STE or Translation fault, we implement the latter as it
     requires no extra code.
   - For TTBx, if larger than the effective stage 1 output address size, it
     triggers C_BAD_CD.

2) Faults from PTWs (7.3 Event records)
   - F_ADDR_SIZE: large address size after first level causes stage 2 Address
     Size fault (Also in 3.4.3 Address sizes of SMMU-originated accesses)
   - F_PERMISSION: Same as an address translation. However, when
     CLASS == CD, the access is implicitly Data and a read.
   - F_ACCESS: Same as an address translation.
   - F_TRANSLATION: Same as an address translation.
   - F_WALK_EABT: Same as an address translation.
  These are already implemented in the PTW logic, so no extra handling
  required.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 91 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 11 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 229b3c388c..86f95c1e40 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -337,14 +337,35 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
 
 }
 
+static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
+                                                 SMMUTransCfg *cfg,
+                                                 SMMUEventInfo *event,
+                                                 IOMMUAccessFlags flag,
+                                                 SMMUTLBEntry **out_entry,
+                                                 SMMUTranslationClass class);
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
+        status = smmuv3_do_translate(s, addr, cfg, event,
+                                     IOMMU_RO, &entry, SMMU_CLASS_CD);
+
+        /* Same PTW faults are reported but with CLASS = CD. */
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
@@ -659,10 +680,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
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
@@ -713,9 +737,26 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
 
         tt->tsz = tsz;
         tt->ttb = CD_TTB(cd, i);
+
         if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
             goto bad_cd;
         }
+
+        /* Translate the TTBx, from IPA to PA if nesting is enabled. */
+        if (cfg->stage == SMMU_NESTED) {
+            status = smmuv3_do_translate(s, tt->ttb, cfg, event, IOMMU_RO,
+                                         &entry, SMMU_CLASS_TT);
+            /*
+             * Same PTW faults are reported but with CLASS = TT.
+             * If TTBx is larger than the effective stage 1 output addres
+             * size, it reports C_BAD_CD, which is handled by the above case.
+             */
+            if (status != SMMU_TRANS_SUCCESS) {
+                return -EINVAL;
+            }
+            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
+        }
+
         tt->had = CD_HAD(cd, i);
         trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
     }
@@ -767,12 +808,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
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
@@ -832,13 +873,40 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
                                                  SMMUTransCfg *cfg,
                                                  SMMUEventInfo *event,
                                                  IOMMUAccessFlags flag,
-                                                 SMMUTLBEntry **out_entry)
+                                                 SMMUTLBEntry **out_entry,
+                                                 SMMUTranslationClass class)
 {
     SMMUPTWEventInfo ptw_info = {};
     SMMUState *bs = ARM_SMMU(s);
     SMMUTLBEntry *cached_entry = NULL;
+    int asid, stage;
+    bool S2_only = class != SMMU_CLASS_IN;
+
+    /*
+     * The function uses the argument class to indentify which stage is used:
+     * - CLASS = IN: Means an input translation, determine the stage from STE.
+     * - CLASS = CD: Means the addr is an IPA of the CD, and it would be
+     *   tranlsated using the stage-2.
+     * - CLASS = TT: Means the addr is an IPA of the stage-1 translation table
+     *   and it would be tranlsated using the stage-2.
+     * For the last 2 cases instead of having intrusive changes in the common
+     * logic, we modify the cfg to be a stage-2 translation only in case of
+     * nested, and then restore it after.
+     */
+    if (S2_only) {
+        asid = cfg->asid;
+        stage = cfg->stage;
+        cfg->asid = -1;
+        cfg->stage = SMMU_STAGE_2;
+    }
 
     cached_entry = smmu_translate(bs, cfg, addr, flag, &ptw_info);
+
+    if (S2_only) {
+        cfg->asid = asid;
+        cfg->stage = stage;
+    }
+
     if (!cached_entry) {
         /* All faults from PTW has S2 field. */
         event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
@@ -855,7 +923,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
                 event->type = SMMU_EVT_F_TRANSLATION;
                 event->u.f_translation.addr = addr;
                 event->u.f_translation.addr2 = ptw_info.addr;
-                event->u.f_translation.class = SMMU_CLASS_IN;
+                event->u.f_translation.class = class;
                 event->u.f_translation.rnw = flag & 0x1;
             }
             break;
@@ -864,7 +932,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
                 event->type = SMMU_EVT_F_ADDR_SIZE;
                 event->u.f_addr_size.addr = addr;
                 event->u.f_addr_size.addr2 = ptw_info.addr;
-                event->u.f_addr_size.class = SMMU_CLASS_IN;
+                event->u.f_addr_size.class = class;
                 event->u.f_addr_size.rnw = flag & 0x1;
             }
             break;
@@ -873,7 +941,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
                 event->type = SMMU_EVT_F_ACCESS;
                 event->u.f_access.addr = addr;
                 event->u.f_access.addr2 = ptw_info.addr;
-                event->u.f_access.class = SMMU_CLASS_IN;
+                event->u.f_access.class = class;
                 event->u.f_access.rnw = flag & 0x1;
             }
             break;
@@ -882,7 +950,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
                 event->type = SMMU_EVT_F_PERMISSION;
                 event->u.f_permission.addr = addr;
                 event->u.f_permission.addr2 = ptw_info.addr;
-                event->u.f_permission.class = SMMU_CLASS_IN;
+                event->u.f_permission.class = class;
                 event->u.f_permission.rnw = flag & 0x1;
             }
             break;
@@ -943,7 +1011,8 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
-    status = smmuv3_do_translate(s, addr, cfg, &event, flag, &cached_entry);
+    status = smmuv3_do_translate(s, addr, cfg, &event, flag,
+                                 &cached_entry, SMMU_CLASS_IN);
 
 epilogue:
     qemu_mutex_unlock(&s->mutex);
-- 
2.45.2.803.g4e1b14247a-goog
