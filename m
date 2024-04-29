Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931805ejb;
        Sun, 28 Apr 2024 20:24:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEq71noTKGULK0d2bQhhNVQ72x/ILi6tJMD2k56Zyu7rjTMhmSGCfvy+Vxt1VkY44cYqUfadWF+YvoTX+4UKeQjiLTsqeq
X-Received: by 2002:a25:6609:0:b0:de4:2e6:a2a5 with SMTP id a9-20020a256609000000b00de402e6a2a5mr9641385ybc.55.1714361098052;
        Sun, 28 Apr 2024 20:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361098; cv=none;
        d=google.com; s=arc-20160816;
        b=XMYgWjBMuVgteD6Bl1PjBIyA//DCVgAPb7vJbt71nrOdTVTmcZS01hRaBq8XJF/+qh
         XtFishwxV6puHGAvEypwsOpmpmWwSAALqN+OU5n+dshGgjtFghF2Uh7l5xuJ4MGfhvmX
         jBOssJkmzu8zUCbVgI+8fyYn36xnN8NgdozKVFqhxDgroJxDwX95VHCrGXBSIHAJBuY/
         Ar0n5tkIjhLWbfDHq04DZ6ZvmWPrNaglIb9mWHLzvtM4NIoU+g2wHkEBnRmTKHlUdqqv
         nuNMgN7J8xgzIvuSTiV5YgQ8bN2BfBPVOaJKi38b1YMYaXOGnmwK57PdtRjkYj24PS4e
         T9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=G/iYbUD2yVdv1Qb5Re/QqfHd26Cn7VLxRc01/vgMYm0=;
        fh=Vw/xOjD3oYvZ43tFNNK+rUc+xg5OJtokcKP5CO9iWUc=;
        b=ZLdNCVXprRpjaxuoHHd/VCQhCRpxlHPEi1Bk9lFaeJRuRPAmp+eHRYJfGNGXNpT+ky
         jjcXNT/nNBEVUr2CxxpUwwIvIREhzCzepw38JxwKHhnf0iFyOWB+UdJSRplowBoAYeV/
         XwNiphsxYe8Z3yIBoQEEEfAXrRM4xCJVTmvI03WKYxhmFrtj4J4/LZfztUzurn6JaNDf
         LnnoC3Gb9AJhaGyGkqbL5rrqYvn1hSDSlnsgaIcBktBTvVsPvitNEO1DaEAT6qZS8ego
         iItDJO7FNWw5jIh2JwRwK6yz+DMg/2SJNMsaVl48I0hFgjK5tqJJgUAHA80Cg5FyyGiI
         6jNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ndhu4sLL;
       spf=pass (google.com: domain of 3crmvzggkcyqsmostafagoogle.comalex.benneelinaro.org@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3CRMvZggKCyQSMOSTAFAGOOGLE.COMALEX.BENNEELINARO.ORG@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3CRMvZggKCyQSMOSTAFAGOOGLE.COMALEX.BENNEELINARO.ORG@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id m186-20020a2558c3000000b00dc748f6fadfsor15849994ybb.18.2024.04.28.20.24.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3crmvzggkcyqsmostafagoogle.comalex.benneelinaro.org@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ndhu4sLL;
       spf=pass (google.com: domain of 3crmvzggkcyqsmostafagoogle.comalex.benneelinaro.org@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3CRMvZggKCyQSMOSTAFAGOOGLE.COMALEX.BENNEELINARO.ORG@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361097; x=1714965897; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G/iYbUD2yVdv1Qb5Re/QqfHd26Cn7VLxRc01/vgMYm0=;
        b=Ndhu4sLL14ttCSAfJmL3rLfnV4VnCZYIWZOWDsH4If0yWqV61KI6FxxyFAgv1Rrh/z
         tPw9HumcvR8B/lUUg1o49cIR0gUFaZ5cuwETtXtDKs+Ue3YmY486Rywlo/yWW5ubhifv
         K270PykWnxKkS0gPfntJz5EkXUNr/WTUkMwx7LFgmpkBlsDq+/phJD6tNB03qFYxWaVt
         3fWLsMd35ri92mSj+VUSwrhmXXKjamwLI22HpndqXHwnpoH2maUR3Acxfvjj/RimoHD1
         ZrZx1pEMjIqoZrTvLzmnA/lcikiMOz+rkGbGaWNikeihm/VVNVoPjsh9Dx7RYfz8i834
         L0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361097; x=1714965897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/iYbUD2yVdv1Qb5Re/QqfHd26Cn7VLxRc01/vgMYm0=;
        b=Hm8Wkf5SK6s0ZMnQLHLy5e+AahZgT+szNDWEVeyfllWyTmhpUnRIZknBTZDjvI3nxl
         qQa3kdYz+apYt91g0l4W5LqnkJXph4Sqq38vuieNLuZvY/d8LmHMYDa4p5fFPgR3dYom
         MOf/jiB1F+Ov0UdagyGWzSfTiUdFD31IKTZHKc/3WYvtMuNC3Ki8rZc1umlhg3eJ17Vy
         kZzaUPeduPC7JuK+5a0Nd2VIEbaVz84Dim1gD39r2+Zb/HLk4WdgJp4LEKspZFGpkJqf
         nkYrxQt845SeZx9PhQRsX1xlV4T2bY9I4tO/wzYbjTryPGa9huItJvDQGeRXGvdlwndA
         KVPg==
X-Forwarded-Encrypted: i=1; AJvYcCU4NlRhZRezzgXFTMaO+CX4pzKmS1niORRHP3AXhtjFSPmRQgfUq+wb/vYvYZxQ0jhqe+yfj2zynE0mqYUhbzQ26RM383oy
X-Gm-Message-State: AOJu0Yw6X8eRzXZBtThaj9bzx5HCa67g7IQwrrcYwMby5fvPaPGIJTQh
	1gyztAOsRIing90HM/rwKIJaV23YVyMZUNqoUFy2AxzfNkAZlZgsUj7BOCi9MHQQLU26fKhA8aZ
	Ggqx8cAf+tw==
X-Google-Smtp-Source: AGHT+IEbF+UkwSnh0XB/Ob5cBz8zvL7SXff7Ro2ZDspyrVSwqe4tb6EPxVcIjgLbuZJeWfPIpkJSJb2kIFv4+g==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:100a:b0:de4:7be7:1c2d with SMTP
 id w10-20020a056902100a00b00de47be71c2dmr2932240ybt.11.1714361097618; Sun, 28
 Apr 2024 20:24:57 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:55 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-12-smostafa@google.com>
Subject: [RFC PATCH v3 11/18] hw/arm/smmu: Support nesting in smmuv3_range_inval()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: TkFxnXhzDzRz

With nesting, we would need to invalidate IPAs without
over-invalidating stage-1 IOVAs. This can be done by
distinguishing IPAs in the TLBs by having ASID=-1.
To achieve that, rework the invalidation for IPAs to have a
separate function, while for IOVA invalidation ASID=-1 means
invalidate for all ASIDs.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c         | 47 ++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3.c              | 23 ++++++++++++------
 hw/arm/trace-events          |  2 +-
 include/hw/arm/smmu-common.h |  3 ++-
 4 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index d48ec08947..fa2460cf64 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -183,6 +183,25 @@ static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
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
+    if (info->asid >= 0) {
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
@@ -211,6 +230,34 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
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
index cc61c82321..82d918d9b5 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1118,7 +1118,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
     }
 }
 
-static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
+static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
@@ -1143,9 +1143,13 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
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
 
@@ -1161,9 +1165,14 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
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
@@ -1322,7 +1331,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-            smmuv3_range_inval(bs, &cmd);
+            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
             break;
         case SMMU_CMD_TLBI_S12_VMALL:
         {
@@ -1347,7 +1356,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
index cf0fd3ec74..de032fdfd1 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -216,7 +216,8 @@ void smmu_iotlb_inv_asid(SMMUState *s, int asid);
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
-
+void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
+                        uint64_t num_pages, uint8_t ttl);
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
 void smmu_inv_notifiers_all(SMMUState *s);
 
-- 
2.44.0.769.g3c40516874-goog
