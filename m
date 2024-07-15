Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118140nji;
        Mon, 15 Jul 2024 01:45:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3+xRzMeFJ6WuxFaInss3Be+JGW+HhcFh3SUrmARLlvDdY4cxHjtAjU5cne9hyqwQlpz0Ucngpyk3eZfXZlsEQ00S9dK2Q
X-Received: by 2002:a2e:a581:0:b0:2ee:8453:5164 with SMTP id 38308e7fff4ca-2eeb304eec9mr166270981fa.0.1721033156371;
        Mon, 15 Jul 2024 01:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033156; cv=none;
        d=google.com; s=arc-20160816;
        b=eOFfWlTFAttHf5Srbarp5KWf+2kBcTvx83sHQ4GxooEe98jzFzwUzsjxBqI/yOGYcZ
         t3lnhEFP2uWQo7IFQRW55eA2DS3GVpSxnI0yDkQ9Xd6fo9A6pWgkZLtjVz6R7TEYoXJp
         RWc9QV7rB9S/4tHFTX7fM61E7EIv2SaBYmlrbotXBNMAhjtFlW3MqqzSku3g5IOdSOBA
         Dwxi/m2pmMhZc/+M40uF2BPNTyKphxBR2Pq9nE4AlubsUhniTWSW3qTi3Bdvs0/UOVHo
         Cp/4TsqgW/IwHjD3x696vZG+A0l57SpLj1GiETK5IavN/NGv4NhCwaAEeq/GZ9jyEHlu
         9yXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=qqr+nya9Tbgn4Iimld4OHaPq21aNI9rWPo4mQAadqNU=;
        fh=/4hZpTCCFnGyokQ6+TTDjLdsRZAwAWY0PauMb0tV1SY=;
        b=Dw6NPZ9a/7vH2obafExAsTMbJU9W6nyN4xGHrhqi6xqVoML4wo313SYCTZyRoqr9oz
         JNJl7AG9mgG3F8tT+DzK1tFwSS8EnvoJLRAezUTRq0Dw4G3VzpljWnluHP6VActuAmaG
         cpZr1IIqaDUDqUJeLjLycrB64vo9LV7JuWPde9GwUnsCpRRl3a+B2p7WCVXM/ImjuCR6
         7pl1D1FwgWOz11fJPmFiFq9GB12WKCV7cvcgiwGuJ83YEUzgBZ3v2f0i+K5nUSdSbPy1
         qwm4A8T8jHQjtVgGeIyKfETIpp3UrtcpOONmgCqXUAPXRn75Vk2VziMWOsEjm9rWOq/P
         jElA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=KT46So2r;
       spf=pass (google.com: domain of 3w-guzggkcxye8aefw1w2aa270.ya8w70j.x09900749wda.ad2@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3w-GUZggKCxYE8AEFw1w2AA270.yA8w70J.x09900749wDA.AD2@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3w-GUZggKCxYE8AEFw1w2AA270.yA8w70J.x09900749wDA.AD2@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id ffacd0b85a97d-3680db36c22sor725668f8f.4.2024.07.15.01.45.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3w-guzggkcxye8aefw1w2aa270.ya8w70j.x09900749wda.ad2@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=KT46So2r;
       spf=pass (google.com: domain of 3w-guzggkcxye8aefw1w2aa270.ya8w70j.x09900749wda.ad2@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3w-GUZggKCxYE8AEFw1w2AA270.yA8w70J.x09900749wDA.AD2@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033156; x=1721637956; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qqr+nya9Tbgn4Iimld4OHaPq21aNI9rWPo4mQAadqNU=;
        b=KT46So2rXioO6cfeObHpGleNlx4Vo3RaRBpWNZrSE2z1Gl4KrVQupRD5wdZDs0lSEM
         sqT4ZJAxVR7skdHaF0cpESM58o9DMaTSwXdSOiVS4BokEdrkm5U2byWRIEr1xviqd3FF
         1o8+JwHIxB5kMLxn0PbHxlqmlLgkWS8fI0x4BLsu95CHRyshwO9QGcvzLJmagMAr/5/I
         8UMfiVN1QeV1ypy3mbkWYYQ4QxciWNiZGk1rI/cOp1heuCnnxX96dV4yrQ9IG40lB5Ik
         xlqF2lUCk1IOCE5KmdQCNDSvPJ4K0U4UtmoCr6Me+3E9UmCJg5/iRRX1ZuC4UsW8r58f
         ocYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033156; x=1721637956;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qqr+nya9Tbgn4Iimld4OHaPq21aNI9rWPo4mQAadqNU=;
        b=wZYKBnLkX9p21zfSgRUkq1fIIgez0CiIN6NL/bAwWIdM/oatUyC698IlQbs3BYF2ie
         tc3DZq7A0zftkYE3dyj56SEi/ijUJJcNX84F7aLnk6IEKNqQx9PS0LBhUNGmFRWIcbjH
         IZ0Q+vTEudjoFRR6eAos2F2zpJ6Pmgupi7KCiMVyX2UJxlJMAAK+SHXXrss4tKjKw256
         eEF0dM5G6Zl4cqC6qkEMvhVFdDISLudn5ligVlxo7D3cnK2I+fvITpj6OIsAiQ0PXfIu
         Yuu87JM54O1vgsib76mW7T0we99eV3ABmNnBjjROOMGgAQa7YBJ3ctLGgDb/jRtrvHfP
         pomg==
X-Forwarded-Encrypted: i=1; AJvYcCVQxcD71xnVhp7eFTajZvR/xJy+WuX4arPdwpgMzR+QTO4shrubpM3WyqqE8GBctwExu0AYtMuG3iu2A64DT/LAhlcmzO8p
X-Gm-Message-State: AOJu0YxGtKmtrK9NPL+u2ORTIhC4Q3M4j7T7N/WW9+hTv3osD08JSdrT
	riQEUOF3VmvJxW9GZtyWLLWQJ0Pk+t4UHKDRj7G8dVT60//FP1OglesPW7Eahj/nUeiCRKk5ks6
	RteprFTxSQw==
X-Google-Smtp-Source: AGHT+IFYcl2XtYv2/IFIsNkv0jeyIiZgv8PEWZ/O2vWPOm2oj+ab9VZJnr2A1P9fMH/psovYLNrceE0B5+j+jw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:6712:0:b0:367:90cc:48e with SMTP id
 ffacd0b85a97d-367cea74a51mr25071f8f.5.1721033155745; Mon, 15 Jul 2024
 01:45:55 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:12 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-13-smostafa@google.com>
Subject: [PATCH v5 12/18] hw/arm/smmu: Support nesting in smmuv3_range_inval()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: y7V7whv4Bn8C

With nesting, we would need to invalidate IPAs without
over-invalidating stage-1 IOVAs. This can be done by
distinguishing IPAs in the TLBs by having ASID=-1.
To achieve that, rework the invalidation for IPAs to have a
separate function, while for IOVA invalidation ASID=-1 means
invalidate for all ASIDs.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 47 ++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3.c              | 23 ++++++++++++------
 hw/arm/trace-events          |  2 +-
 include/hw/arm/smmu-common.h |  3 ++-
 4 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 8ed53f5b1d..a100700497 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -195,6 +195,25 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
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
+    if (SMMU_IOTLB_ASID(iotlb_key) >= 0) {
+        /* This is a stage-1 address. */
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
@@ -223,6 +242,34 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
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
+        .mask = (num_pages << granule) - 1};
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
index 06a96c65eb..a0979f15a0 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1168,7 +1168,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
     }
 }
 
-static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
+static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
@@ -1193,9 +1193,13 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
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
 
@@ -1211,9 +1215,14 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
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
@@ -1372,7 +1381,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-            smmuv3_range_inval(bs, &cmd);
+            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
             break;
         case SMMU_CMD_TLBI_S12_VMALL:
         {
@@ -1397,7 +1406,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
              * As currently only either s1 or s2 are supported
              * we can reuse same function for s2.
              */
-            smmuv3_range_inval(bs, &cmd);
+            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_2);
             break;
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 09ccd39548..7d9c1703da 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -46,7 +46,7 @@ smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
 smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
-smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
+smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=%d"
 smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index a3e6ab1b36..f9c8b00c9d 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -217,7 +217,8 @@ void smmu_iotlb_inv_asid(SMMUState *s, int asid);
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
-
+void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
+                        uint64_t num_pages, uint8_t ttl);
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
 void smmu_inv_notifiers_all(SMMUState *s);
 
-- 
2.45.2.993.g49e7a77208-goog
