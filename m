Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931741ejb;
        Sun, 28 Apr 2024 20:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWS04cz/kwpW6KL0WwnZOg6RKjkOeODLaQbnQciz9hts7MQQt81tiB55meHvg/MqwFAS/DszHLGn9nRuv0li5BmjHygdFfg
X-Received: by 2002:a05:600c:4e8a:b0:418:9dd2:fd04 with SMTP id f10-20020a05600c4e8a00b004189dd2fd04mr8025639wmq.13.1714361089149;
        Sun, 28 Apr 2024 20:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361089; cv=none;
        d=google.com; s=arc-20160816;
        b=AUnWYdEBUU61GL6V+9ozHqe49M3W5giz+2EiBFKdGknU+l/60BHsYT8HByjQRpyX9k
         Fc2VWCNK5O7LQh8SnFFPFdxSM+6fmJBHu0IpeX09e0j3J6I7coNEsAqc1LhBKlx0J2sp
         lBL1luJ1EXIkiqSVXli+G51pvwFbGQyDQz3u/Rwkjz3rEwAHnXYmj6cJrH1ZE0P75dm2
         74ze+JTQBYFCZF9XVlOQAqaFFqfeHe6VugU2RAglBBf1oxsmTsWC3oL/42DNGvEyQ28b
         1rNh8T2dVmN45Ras16o8BgoTj318itWCtc5LDEMulvVdNKIMvj0D6SsLVJTL98H8MEmY
         MaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=sM959CSryem/ayjlI+rG1SS7UxOtrLI/cpqbk+ueezU=;
        fh=rUQixXvoRE3PymW9jERAN8J7AXgv6l+VeuKi8jR2+lY=;
        b=cWpsjLznBj1FQ+2TecuIs+ioF1IA9BM959Mytl0AavcS2WLCQskDK+iLHsGVKHqciQ
         35xX50qBKHps+Fbsuhu6wSxWZ8OmjgrLjn0EhFsR0DzyUtAEimujQL5DfSlK0y4si54/
         qoyXSODtSG2n74mu6bzLtAJ78BY/yXXxklejMy0G4rO43ScRYv0+kO5Hi4bx66mnqpBs
         kZfICdKjwkrb0cEavUS+JuoA5gQCYp1ENUJEXfHeqMsc/pEDX+kEsl3r0KRQZMlyqavh
         +vPS5aFnmUFOEsN6h+hucMGnrzYzQCGMzo2CV75SfJ7w7JyfeIyKGtNXNUtISVqhzzZ4
         lXxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=BhG9VrhY;
       spf=pass (google.com: domain of 3abmvzggkcxsjdfjk1617ff7c5.3fd1c5o.25ee55c9e1if.fi7@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ABMvZggKCxsJDFJK1617FF7C5.3FD1C5O.25EE55C9E1IF.FI7@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3ABMvZggKCxsJDFJK1617FF7C5.3FD1C5O.25EE55C9E1IF.FI7@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id c20-20020a7bc854000000b00418fd270765sor6667426wml.0.2024.04.28.20.24.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3abmvzggkcxsjdfjk1617ff7c5.3fd1c5o.25ee55c9e1if.fi7@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=BhG9VrhY;
       spf=pass (google.com: domain of 3abmvzggkcxsjdfjk1617ff7c5.3fd1c5o.25ee55c9e1if.fi7@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ABMvZggKCxsJDFJK1617FF7C5.3FD1C5O.25EE55C9E1IF.FI7@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361089; x=1714965889; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sM959CSryem/ayjlI+rG1SS7UxOtrLI/cpqbk+ueezU=;
        b=BhG9VrhYesWU5OFrz+lpv3n2ZaGLUGfMVXkMQkfuSH2l759MwcEDUwPqAbymhAH2I8
         bkmrfV0LiPjs5P21Rz76uxGbhqxQdFIjpM0eb/OvQHSP801QgzbuVVu3F0pwxK6UYThq
         MrrQqwuMHJRtSDLCPkH7S368M9/6BFmwWkqjY+xJtNJnFUEUZOHMKD/7OwSBckdN++2M
         bqM3QP40+5ePYuBOSeN61xaA/xyoOXdagENGu0joMDT4e5AzHhWZvtsv/qOSZ4dM6hPr
         YyBRaUctnVE75RoVWkTK4ey8qNosM5aZ5s1Kme/UV1+0YMI2OQ5eYKv+ueUe2fMxo7Iz
         aPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361089; x=1714965889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sM959CSryem/ayjlI+rG1SS7UxOtrLI/cpqbk+ueezU=;
        b=TgKJKBfd1+UiAMuwnAZBygv2IIq9TC294YmE148jQi3Y38SX9a34hQOtulvqil0GZx
         tipmZ2K+VEmJT6BuW2SIx9Cm90Dgr/hlrguSwo6srZa/M2+TxZatRU0avyMfMt5z028J
         tWhpfbpAN7p8hxxtzmAhO/wFv5vncezTG2KlXke3CMvKMSDACJaL7rVRGqV6s5y8B02D
         CIDhrWYjsR8LthZkCIwD3Qznqgo5hwLL3ySBv0uRgZ5pT4iirjbYWeVZnb6OhJMfqa/1
         QhrhnwPWxI0YEODMGheQkf5w4ZUxU854jxELB7qm/ebDKIDHl1yJHLtu8+gLowuDExkE
         /mwA==
X-Forwarded-Encrypted: i=1; AJvYcCVpeNfzvn4hblf+FJw7k+oI3Zj/gPkKQSi3CDdcOJCvAMjvTwoHxjCdXGPV28fRHBWZQLve05ytVZ3k+oK7IgEuv/IGPxy/
X-Gm-Message-State: AOJu0YwPbXySV1RFdNlO/zbskqk5yy0o2KDr5BmLbH6QUumzo5SJrnUF
	zvpXpVBMGW5zUS20oRdO5gnc5NiuViThA1TnF6Mt75QDz6epdODuv/69HhaISUuHB+Boy9940rQ
	ILwAi9LwGEw==
X-Google-Smtp-Source: AGHT+IEjvBy+g/621KlqAkrShcOgfXu6z3bLCLFkSJkmuXKtqWSHz6ZYIXTZgabGfZjxv+i0SKPvRK1+JDyXwg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:216:b0:41a:a78e:f90d with SMTP
 id 22-20020a05600c021600b0041aa78ef90dmr17940wmi.5.1714361088900; Sun, 28 Apr
 2024 20:24:48 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:51 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-8-smostafa@google.com>
Subject: [RFC PATCH v3 07/18] hw/arm/smmuv3: Translate CD and TT using stage-2 table
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: p7x+VxWuCIfs

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
class, this is useful for:
 - Decide wether a translation is stage-2 only or use the STE config.
 - Populate the class in case of faults, WALK_EABT is lefat as it as
   it is always triggered from TT access so no need to use the input
   class.

In case for stage-2 only translation, which only used in nesting, the
stage and asid are saved and restored before and after calling
smmu_translate().

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

As, there is multiple locations where the address is calculated from
cached entry, a new macro is introduced CACHED_ENTRY_TO_ADDR.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c              | 76 ++++++++++++++++++++++++++++++------
 include/hw/arm/smmu-common.h |  3 ++
 2 files changed, 66 insertions(+), 13 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index cc61708160..cc61c82321 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -337,14 +337,33 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
 
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
@@ -659,10 +678,13 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
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
@@ -713,9 +735,21 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
 
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
+            if (status != SMMU_TRANS_SUCCESS) {
+                return -EINVAL;
+            }
+            tt->ttb = CACHED_ENTRY_TO_ADDR(entry, tt->ttb);
+        }
+
         tt->had = CD_HAD(cd, i);
         trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
     }
@@ -767,12 +801,12 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
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
@@ -832,13 +866,29 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
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
@@ -855,7 +905,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
                 event->type = SMMU_EVT_F_TRANSLATION;
                 event->u.f_translation.addr = addr;
                 event->u.f_translation.addr2 = ptw_info.addr;
-                event->u.f_translation.class = SMMU_CLASS_IN;
+                event->u.f_translation.class = class;
                 event->u.f_translation.rnw = flag & 0x1;
             }
             break;
@@ -864,7 +914,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
                 event->type = SMMU_EVT_F_ADDR_SIZE;
                 event->u.f_addr_size.addr = addr;
                 event->u.f_addr_size.addr2 = ptw_info.addr;
-                event->u.f_addr_size.class = SMMU_CLASS_IN;
+                event->u.f_addr_size.class = class;
                 event->u.f_addr_size.rnw = flag & 0x1;
             }
             break;
@@ -873,7 +923,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
                 event->type = SMMU_EVT_F_ACCESS;
                 event->u.f_access.addr = addr;
                 event->u.f_access.addr2 = ptw_info.addr;
-                event->u.f_access.class = SMMU_CLASS_IN;
+                event->u.f_access.class = class;
                 event->u.f_access.rnw = flag & 0x1;
             }
             break;
@@ -882,7 +932,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
                 event->type = SMMU_EVT_F_PERMISSION;
                 event->u.f_permission.addr = addr;
                 event->u.f_permission.addr2 = ptw_info.addr;
-                event->u.f_permission.class = SMMU_CLASS_IN;
+                event->u.f_permission.class = class;
                 event->u.f_permission.rnw = flag & 0x1;
             }
             break;
@@ -943,15 +993,15 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
-    status = smmuv3_do_translate(s, addr, cfg, &event, flag, &cached_entry);
+    status = smmuv3_do_translate(s, addr, cfg, &event, flag,
+                                 &cached_entry, SMMU_CLASS_IN);
 
 epilogue:
     qemu_mutex_unlock(&s->mutex);
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
index 96eb017e50..09d3b9e734 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -37,6 +37,9 @@
 #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
                                              VMSA_BIT_LVL(isz, strd, lvl)) - 1)
 
+#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
+                                             ((addr) & (ent)->entry.addr_mask);
+
 /*
  * Page table walk error types
  */
-- 
2.44.0.769.g3c40516874-goog
