Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597531ejj;
        Mon, 25 Mar 2024 03:15:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0nnoqNlI/bddQMKqFq6KLfKAgROAsYV1ezh7sTUlCsQdOS+IqJAyou/ivX1fDwUgLoubrril/NyXGWgHjpoPyU0xv00Ix
X-Received: by 2002:a05:600c:1c8d:b0:414:6ee:a392 with SMTP id k13-20020a05600c1c8d00b0041406eea392mr4906258wms.8.1711361713218;
        Mon, 25 Mar 2024 03:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361713; cv=none;
        d=google.com; s=arc-20160816;
        b=NhchAj4hSCMv7KY3acWwyMuQSXleUhVXXGOkDcjVD2uMs0VyTGUSkvWAn8SSf4UrVw
         t5EzXwMyWGGOPb/YTngp73Mm8lGFAuoYvofNzAP/Y61XzTOR2750s7Qiz0AhJzbAubBP
         zxFPOoo+NMnnCPA5zBx0ecglrS13Gy5asVufRodB3kVZvSCwuW316u2x4MlZH6/UXMR6
         LcsyVYzyRc1N+yl5fAygKo0SZhGNnvRKAC4XrbBhwtLJItZTbBq0zzNItaUTFDmWPA9M
         WBJKEsSjRQ8D1j1oD9lzXw8aIkiu4vzMwRsByv7pv9lyFPRk+VO0XfgXnyeQxcd572Pj
         AaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=26bo4OK1oRLPmUoPAhKQN+ii39gQbfEXqIUiZXYMfoE=;
        fh=BFtTa7l4e1nkbkts/tTRnudkdcS+Gjk75Jf5O2u86UE=;
        b=kIlBIw52Zd6KoVuXZblGkZIsxAesn5t/u4wwBDZX0o/KW0W3BYLr0huXQYaAG20V8i
         T3aMAHlG41RrIJSS9ZF7MhKKF/1wzCqfDoq+S3+OtuKMfk2B/kQ2PRmNX4O45C9ao1k1
         1EixYyhzWbMa7OQU3gMIE46OFkfKKBbYiQ2XOddzcG+X0AB8il/gL4ebT/LG4EIfl7Mh
         sq5tstHlgV3EZvHR0CBszKGoREAMQqSlMDPY8W73jRGZSTNUz/F1x+GmWmAgbJcXb3ot
         V701CWH8o265tTKGHZQaf2HshpRrn8BCh3zBIh4s2cLavVOK3u9o+an6D1+wPZtCIkAq
         /YoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Kj8Py4EO;
       spf=pass (google.com: domain of 3su4bzggkc4o60267otou22uzs.q20ozsb.ps11sszw1o52.25u@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3sU4BZggKC4o60267otou22uzs.q20ozsB.ps11sszw1o52.25u@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3sU4BZggKC4o60267otou22uzs.q20ozsB.ps11sszw1o52.25u@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id l25-20020a05600c089900b004140079fea2sor1101155wmp.4.2024.03.25.03.15.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3su4bzggkc4o60267otou22uzs.q20ozsb.ps11sszw1o52.25u@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Kj8Py4EO;
       spf=pass (google.com: domain of 3su4bzggkc4o60267otou22uzs.q20ozsb.ps11sszw1o52.25u@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3sU4BZggKC4o60267otou22uzs.q20ozsB.ps11sszw1o52.25u@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361713; x=1711966513; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=26bo4OK1oRLPmUoPAhKQN+ii39gQbfEXqIUiZXYMfoE=;
        b=Kj8Py4EO32wPm1JVYfjwWYAOwtJyQ4O/DLt76E7RmXUaCYcPpvDqiGZzawNvRNtsWm
         iLdEbpLMxPIVsw4qA2KnYOBNAo1fMuEvs/Pdux2+PakgqE/QCZl6/y5DKU2mtz80RCf5
         1RjGwDRx1jFfVg1Ib3gbDU9MPOh1Ts7xr9lIdQDSR70YA6evBAJzt9pY5Ep1tmIm7ige
         Z5XI9M9LEccSP2PKTea8fQr2/ziH2uHZJLi8wX79T5Rps6qQR0yt346qNSTKAnhWY7ST
         BrJ0Fy+l8MeYTqZKRPPc1foFIpt27f4lvASWIpLXGFk21ate4JjWuITr+K/0kHYro3HV
         bQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361713; x=1711966513;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26bo4OK1oRLPmUoPAhKQN+ii39gQbfEXqIUiZXYMfoE=;
        b=v0SoUXF8dj9Y5J6GxSbPHja2IIJWjTtdoanChDg7KcFu5D5RvBiRCAmKQlTlB8acgI
         Z2NEvzbJzTapUxpjehLD4fnfjt/XGFGPyiQhjnw0+Bc4/ctMW8BsXb7CZkJHrnhupb9Q
         P9cvDurPhukCL7beB96a7OjoUaomlyvpCsw/coEKXMWar4tslnLco5btxRQV9nDhCVTC
         SCedjfcnyVjw8eSfu6klx1LxQ+agP4/F5pnarNoteW+dgpygEGHX0sr4JnuJTMMEesFp
         q7IzJgV1dkk7Rb2ThqEWTZ9qT4mh37RYXZLW5aLfFyeo04p2Dy8OC21dfWBEyUAhtWPN
         P8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGe58ZvmNlhvR5fWE2CMxJOb4l6nLFI/cNAq5GOopfduA2M6l9JaDSigFF0IA7LkQa9mVmTFuYPF3ormm343vqMDgyMxsZ
X-Gm-Message-State: AOJu0YwPsZVMOigt5K5iDYzxQ0ut0X1IYZU7rsI12rSv9Oe3XS2P4xDw
	tlom/vVBrgIsG/WV3y6LMi/oUmOIgKk9vdIydkbFmYPeuayjWUcMi7KU45Sec0UdgDsZ6H9Lx5W
	c2ubGWXFV6g==
X-Google-Smtp-Source: AGHT+IGjTc2xwZSG2zw7LF89NYgfoR94W73ilRIlZK5sJd7P155JSlBqYhgjdPIBA53TGUdkz3rgJz1Eb8748A==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:22d7:b0:414:8889:5a5e with SMTP
 id 23-20020a05600c22d700b0041488895a5emr19187wmg.7.1711361713000; Mon, 25 Mar
 2024 03:15:13 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:14:00 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-5-smostafa@google.com>
Subject: [RFC PATCH 04/12] hw/arm/smmu: Support nesting in commands
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: lBAXlFlQ4Mjt

Commands had assumptions about VMID and ASID being mutually exclusive
and the same for stage-1 and stage-2. As we are going to support
nesting, we need to implement them properly:
- CMD_TLBI_NH_ASID: Used to ignore VMID as it was not used in stage-1
  instances, now we read it from the command and invalidate by
  ASID + VMID if stage-2 exists.

- CMD_TLBI_NH_ALL: Use to invalidate all as VMID were not used in
  stage-1 instances, now it invalidates stage-1 by vmid, and this
  command is decoupled from CMD_TLBI_NSNH_ALL which invalidates all
  stages.

- CMD_TLBI_NH_VAA, SMMU_CMD_TLBI_NH_VA: Used to ignore VMID also.

- CMD_TLBI_S2_IPA: Now invalidates stage-2 only.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 34 +++++++++++++++++---------
 hw/arm/smmuv3.c              | 47 +++++++++++++++++++++++++++---------
 hw/arm/trace-events          |  7 +++---
 include/hw/arm/smmu-common.h |  4 +--
 4 files changed, 64 insertions(+), 28 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 677dcf9a13..f0905c28cf 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -129,22 +129,24 @@ void smmu_iotlb_inv_all(SMMUState *s)
     g_hash_table_remove_all(s->iotlb);
 }
 
-static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
-                                         gpointer user_data)
+static gboolean smmu_hash_remove_by_asid_vmid(gpointer key, gpointer value,
+                                              gpointer user_data)
 {
-    uint16_t asid = *(uint16_t *)user_data;
+    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
     SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
 
-    return SMMU_IOTLB_ASID(*iotlb_key) == asid;
+    return (SMMU_IOTLB_ASID(*iotlb_key) == info->asid) &&
+            (SMMU_IOTLB_VMID(*iotlb_key) == info->vmid);
 }
 
 static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
                                          gpointer user_data)
 {
-    uint16_t vmid = *(uint16_t *)user_data;
+    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
     SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
 
-    return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
+    return (SMMU_IOTLB_VMID(*iotlb_key) == info->vmid) &&
+            (info->stage & SMMU_IOTLB_STAGE(*iotlb_key));
 }
 
 static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
@@ -198,16 +200,26 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                                 &info);
 }
 
-void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
+void smmu_iotlb_inv_asid_vmid(SMMUState *s, uint16_t asid, uint16_t vmid)
 {
+    SMMUIOTLBPageInvInfo info = {
+        .asid = asid,
+        .vmid = vmid,
+    };
+
     trace_smmu_iotlb_inv_asid(asid);
-    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid_vmid, &info);
 }
 
-inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
+inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid, SMMUStage stage)
 {
-    trace_smmu_iotlb_inv_vmid(vmid);
-    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
+    SMMUIOTLBPageInvInfo info = {
+        .vmid = vmid,
+        .stage = stage,
+    };
+
+    trace_smmu_iotlb_inv_vmid(vmid, stage);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &info);
 }
 
 /* VMSAv8-64 Translation */
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index b27bf297e1..9460fff0ed 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1060,7 +1060,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
     }
 }
 
-static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
+static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
@@ -1085,9 +1085,9 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
     }
 
     if (!tg) {
-        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
+        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
         smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
-        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl, SMMU_NESTED);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl, stage);
         return;
     }
 
@@ -1103,10 +1103,10 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
         uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
 
         num_pages = (mask + 1) >> granule;
-        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
+        trace_smmuv3_range_inval(vmid, asid, addr, tg,
+                                 num_pages, ttl, leaf, stage);
         smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
-        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg,
-                            num_pages, ttl, SMMU_NESTED);
+        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl, stage);
         addr += mask + 1;
     }
 }
@@ -1237,25 +1237,48 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_TLBI_NH_ASID:
         {
             uint16_t asid = CMD_ASID(&cmd);
+            uint16_t vmid = CMD_VMID(&cmd);
 
             if (!STAGE1_SUPPORTED(s)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
+            /*
+             * VMID is only matched when stage 2 is supported for the Security
+             * state corresponding to the command queue that the command was
+             * issued in.
+             * QEMU ignores the field by setting to -1, similarly to what STE
+             * decoding does. And invalidation commands ignore VMID < 0.
+             */
+            if (!STAGE2_SUPPORTED(s)) {
+                vmid = -1;
+            }
 
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_asid(bs, asid);
+            smmu_iotlb_inv_asid_vmid(bs, asid, vmid);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
+        {
+            uint16_t vmid = CMD_VMID(&cmd);
+
+            trace_smmuv3_cmdq_tlbi_nh(vmid);
             if (!STAGE1_SUPPORTED(s)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-            QEMU_FALLTHROUGH;
+
+            /* See SMMU_CMD_TLBI_NH_ASID. */
+            if (!STAGE2_SUPPORTED(s)) {
+                vmid = -1;
+            }
+
+            smmu_iotlb_inv_vmid(bs, vmid, SMMU_STAGE_1);
+            break;
+        }
         case SMMU_CMD_TLBI_NSNH_ALL:
-            trace_smmuv3_cmdq_tlbi_nh();
+            trace_smmuv3_cmdq_tlbi_nsnh();
             smmu_inv_notifiers_all(&s->smmu_state);
             smmu_iotlb_inv_all(bs);
             break;
@@ -1265,7 +1288,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-            smmuv3_range_inval(bs, &cmd);
+            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
             break;
         case SMMU_CMD_TLBI_S12_VMALL:
         {
@@ -1278,7 +1301,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
 
             trace_smmuv3_cmdq_tlbi_s12_vmid(vmid);
             smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_vmid(bs, vmid);
+            smmu_iotlb_inv_vmid(bs, vmid, SMMU_NESTED);
             break;
         }
         case SMMU_CMD_TLBI_S2_IPA:
@@ -1290,7 +1313,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
              * As currently only either s1 or s2 are supported
              * we can reuse same function for s2.
              */
-            smmuv3_range_inval(bs, &cmd);
+            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_2);
             break;
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 3000c3bf14..73cec52d21 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -12,7 +12,7 @@ smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, ui
 smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
 smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
-smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
+smmu_iotlb_inv_vmid(uint16_t vmid, int stage) "IOTLB invalidate vmid=%d stage=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 smmu_iotlb_inv_stage(int stage) "Stage invalidate stage=%d"
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
@@ -47,8 +47,9 @@ smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
 smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
-smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
-smmuv3_cmdq_tlbi_nh(void) ""
+smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
+smmuv3_cmdq_tlbi_nsnh(void) ""
+smmuv3_cmdq_tlbi_nh(uint16_t vmid) "vmid=%d"
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
 smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 695d6d10ad..6d3bf5316b 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -208,8 +208,8 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
 SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level, SMMUStage stage);
 void smmu_iotlb_inv_all(SMMUState *s);
-void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
-void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
+void smmu_iotlb_inv_asid_vmid(SMMUState *s, uint16_t asid, uint16_t vmid);
+void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid, SMMUStage stage);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl,
                          SMMUStage stage);
-- 
2.44.0.396.g6e790dbe36-goog
