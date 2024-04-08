Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293734ejh;
        Mon, 8 Apr 2024 07:09:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUliFuXssqkCrt5i3u6bcO9KIdWh+FMeXqAm4MqCoAVxrDi8mRs62+k4m8QHnTnnT59CNBbtKfmj0kFKv35r8MhaMwNeaEJ
X-Received: by 2002:a25:d88c:0:b0:dc6:9d35:f9aa with SMTP id p134-20020a25d88c000000b00dc69d35f9aamr8146959ybg.19.1712585354727;
        Mon, 08 Apr 2024 07:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585354; cv=none;
        d=google.com; s=arc-20160816;
        b=ox1yzEQTNxTJEaIOyZfpYMqnlt7bACkCuZ0pih9NxYgpbAUXevXTxG1n4BHOtalSe5
         VrqZUdVDYcc+mi3XY34D+Js8VYbSpB+zsAuaawVpocg4cYsGuRWB3QYvQSTLczNStLJ6
         r9jYvBCzSP/iaRjigY1k3WQN8MOGmPkCXWUj5Whk8V5wGBPzO8s3Yvw0l83aYGCwncLc
         ScUPsLhthdpLfC9/DPrQ7nfjrVyj6qFeA/2ai8V6MZ5jKfUEIwU2Bjh3VxP8Au/5DV95
         FemTiv28yvd4pvA7gO16edftnWRUxSajdu9/3mS93fI47PZq0mXgM53WZu/UkarnLIpl
         +Okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=92pKf8rxBG8PwjQhN5a+4mjr0DOeod7sAVNPkhgcMv4=;
        fh=QEukQzYU9nx2bdVOE0aqtblV5vJG1XGgNGvDUL8T7iA=;
        b=DttVR251WR1fMYDIQCcOxAJxqAuF+i1XdLtIoa1grK1LNduclvzw7xBLUo8KFtlG6x
         mFh5KszKiKDraZXfsIa2sj0EN43DGoEOvLetP/f2poAgLsJzi8Bct3lUi9J0ojj32eW1
         HJQTKAvtswMkU6v7gAiMisgwm6ZDjWgcnPcgvY//8PUSzzQ4Iw9Qiu+VMS4fiYjgulgV
         2PqwSVux2vqv3DM+ZmWsMy11s5GKTKrChrsvECwJwCQO60XxME5EPeGUie0KyXcxc0o8
         1+pupxad+nnTnBhsQsS0ail38imr66qBAyS+IqIfL6SVu7ZMasTP3FEVe/RT68fto/6p
         QXhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qpjh3jHr;
       spf=pass (google.com: domain of 3ivotzggkcwcztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ivoTZggKCwcztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3ivoTZggKCwcztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 7-20020a250007000000b00dce08d873f3sor3139333yba.19.2024.04.08.07.09.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ivotzggkcwcztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qpjh3jHr;
       spf=pass (google.com: domain of 3ivotzggkcwcztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ivoTZggKCwcztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585354; x=1713190154; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=92pKf8rxBG8PwjQhN5a+4mjr0DOeod7sAVNPkhgcMv4=;
        b=qpjh3jHrrZEQsweyWIh2B0UTYBT+23ffEz8LI4ETo35F4sbeYIa1tN/mRZ80pJSjpi
         dGL5ir2s97bgwzc9d2i8S8Jz1VdJTe2g90FhEzuGKXkg150gygTLnnqgFGOGKJt6VdY3
         yf8ka4HC/bwrBpDiYy8E69kFCvFn0CU7xvSNayaq0KRtVccBlEVrs2IWl/smj2eL75oX
         J/5yo1m4EP4FnUykgQztLsKOizTsjBk92r0sWmE0DNUBfsfrSF00uEgTdo2WMHQEY82Q
         BNko8kdiEFHy2quKTVL/+qQfvwEjob96mXLJ1RQ0At1xTrX/v2zQfsLxR53QIKT/Pw+M
         56pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585354; x=1713190154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92pKf8rxBG8PwjQhN5a+4mjr0DOeod7sAVNPkhgcMv4=;
        b=ZpZkordN5wS6+E7nGNTcDK5oMo3611a0MeOZM4myhN23UF2ppqiEZediogeQJOMh6a
         bLNZHvOSj2XafiG5iymAvu/hC2rs6RTHIZXlXPAIexwH6ftVKN6oMm0sism+MoP66H9A
         hL6KTTMUBiV9zaDLbSfmnb/LoVO/FPeZJR2MSuum65wwuwoMAe93BF4jRSavImqyx0Yb
         tZnLCkCzhe/6OA5VTaxpe7RGMsRByvW4MrY83kZiz+y65WLgw4jpn45+nRev7li8aO+C
         tzNVQH7yaScM0IOHlXrnj0JaymCfnd6V0FuthLOBRk9JoNj8DMGSaq5CcwQs4pnWp3El
         rK8A==
X-Forwarded-Encrypted: i=1; AJvYcCVoADvtawxAlTHaJ152BIZ2dW7Bcx4G/vOm/ZmOuwjCUus07bRIrTtAuMIaledz8GBB8eplwB1dA7Yawj1E6UV5d4zGLENh
X-Gm-Message-State: AOJu0Ywk4z/Uq12ICeiVDL0UDJnyC5C2lYqe1Yuia+LzX6gA6tDoLTaB
	lZY9XFC9c7o+rxBClV8hCT/x9SFCjjSD1wDQu4iAPlXHdwT82Hx+rI7scKnL5DSi4CKjpoTPFsC
	ZCS+RxTpTFg==
X-Google-Smtp-Source: AGHT+IEC3Ffqy2fMPOhBoZ+TpT0m8VPrxASVqJkvNBOpS6Svpvf7pl6OkMxqYlyy8N3wPeiGYvQMal65raJS1A==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:100a:b0:de0:ecc6:139c with SMTP
 id w10-20020a056902100a00b00de0ecc6139cmr1506774ybt.11.1712585354338; Mon, 08
 Apr 2024 07:09:14 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:11 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-7-smostafa@google.com>
Subject: [RFC PATCH v2 06/13] hw/arm/smmu: Support nesting in smmuv3_range_inval()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: HFBMLM4AFR5q

With nesting, we would need to invalidate IPAs without
over-invalidating stage-1 IOVAs. This can be done by
distinguishing IPAs in the TLBs by having ASID=-1.
To achieve that, rework the invalidation for IPAs to have a
separate function, while for IOVA invalidation ASID=-1 means
invalidate for all ASIDs.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 47 ++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3.c              | 23 ++++++++++++------
 hw/arm/trace-events          |  2 +-
 include/hw/arm/smmu-common.h |  3 ++-
 4 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 2cf27b490b..8b9e59b24b 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -184,6 +184,25 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
            ((entry->iova & ~info->mask) == info->iova);
 }
 
+static gboolean smmu_hash_remove_by_vmid_ipa(gpointer key, gpointer value,
+                                             gpointer user_data)
+{
+    SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
+    IOMMUTLBEntry *entry = &iter->entry;
+    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
+    SMMUIOTLBKey iotlb_key = *(SMMUIOTLBKey *)key;
+
+    /* This is a stage-1 address. */
+    if (info->asid >= 0) {
+        return false;
+    }
+    if (info->vmid != SMMU_IOTLB_VMID(iotlb_key)) {
+        return false;
+    }
+    return ((info->iova & ~entry->addr_mask) == entry->iova) ||
+           ((entry->iova & ~info->mask) == info->iova);
+}
+
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl)
 {
@@ -212,6 +231,34 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                                 &info);
 }
 
+/*
+ * Similar to smmu_iotlb_inv_iova(), but for Stage-2, ASID is always -1,
+ * in Stage-1 invalidation ASID = -1, means don't care.
+ */
+void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
+                        uint64_t num_pages, uint8_t ttl)
+{
+    uint8_t granule = tg ? tg * 2 + 10 : 12;
+    int asid = -1;
+
+   if (ttl && (num_pages == 1)) {
+        SMMUIOTLBKey key = smmu_get_iotlb_key(asid, vmid, ipa, tg, ttl);
+
+        if (g_hash_table_remove(s->iotlb, &key)) {
+            return;
+        }
+    }
+
+    SMMUIOTLBPageInvInfo info = {
+        .iova = ipa,
+        .vmid = vmid,
+        .mask = (num_pages * 1 << granule) - 1};
+
+    g_hash_table_foreach_remove(s->iotlb,
+                                smmu_hash_remove_by_vmid_ipa,
+                                &info);
+}
+
 void smmu_iotlb_inv_asid(SMMUState *s, int asid)
 {
     trace_smmu_iotlb_inv_asid(asid);
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a7cf543acc..17bbd43c13 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1095,7 +1095,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
     }
 }
 
-static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
+static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
@@ -1120,9 +1120,13 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
     }
 
     if (!tg) {
-        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
+        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
         smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
-        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
+        if (stage == SMMU_STAGE_1) {
+            smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
+        } else {
+            smmu_iotlb_inv_ipa(s, vmid, addr, tg, 1, ttl);
+        }
         return;
     }
 
@@ -1138,9 +1142,14 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
         uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
 
         num_pages = (mask + 1) >> granule;
-        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
+        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages,
+                                 ttl, leaf, stage);
         smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
-        smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
+        if (stage == SMMU_STAGE_1) {
+            smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
+        } else {
+            smmu_iotlb_inv_ipa(s, vmid, addr, tg, num_pages, ttl);
+        }
         addr += mask + 1;
     }
 }
@@ -1299,7 +1308,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-            smmuv3_range_inval(bs, &cmd);
+            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
             break;
         case SMMU_CMD_TLBI_S12_VMALL:
         {
@@ -1324,7 +1333,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
              * As currently only either s1 or s2 are supported
              * we can reuse same function for s2.
              */
-            smmuv3_range_inval(bs, &cmd);
+            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_2);
             break;
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 5f23f0b963..f5c361d96e 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -46,7 +46,7 @@ smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
 smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
-smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
+smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
 smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 03ff0f02ba..df166d8477 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -230,7 +230,8 @@ void smmu_iotlb_inv_asid(SMMUState *s, int asid);
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
-
+void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
+                        uint64_t num_pages, uint8_t ttl);
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
 void smmu_inv_notifiers_all(SMMUState *s);
 
-- 
2.44.0.478.gd926399ef9-goog
