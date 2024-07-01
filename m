Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286484njm;
        Mon, 1 Jul 2024 04:03:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZLeCDxYGm7IxccXaERaX6+MGzpNiQlRK4aOfbek8GmVt01v3ws2JSDxS7/qWbqqCRVPyCP2tNkFR2HEQLUIzIUKogDnzy
X-Received: by 2002:a81:a254:0:b0:627:e963:2bcf with SMTP id 00721157ae682-64c739ee6f2mr49528147b3.51.1719831815149;
        Mon, 01 Jul 2024 04:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831815; cv=none;
        d=google.com; s=arc-20160816;
        b=loUpJojrtAfAH8E0WbrBBYERXRGHt3x+ohzRd6qZpB5XWOxOPRhBPozh8clAuCYi95
         i1/jKAgtgv4arYgZK5MUbxRLz6QgH1Y4YZZXGwznTt+vNwPDKYLU+74RjluJ6ui9XeXM
         e0VDBGJI0BYF0TLD1M+Z8CodXexGwAudU4Q0jSStyoS90ZjdNcLNyOX43g+Sr5mlZuTz
         zG91Z6/uvmenMC6uQZbHNypNKja9bydd1BU5cHfVv1gCbzl0TVgOc6/IygzKU8lBd1T0
         DFg8H0GNasZudqsJTeyloixWhon/ZyHpOmmIJizjJMbAT84Oo32iZW8ZcwgmFOVcM6GY
         cLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=k3otTmRv6e7tjJ/B/LGAW/z2pAH8+/eAhcSRRudoZhA=;
        fh=1jON9Zv12Y+Yoasg+RMvBNmHGq43SLb18wJq7jC83no=;
        b=vud1HL2UloagPRGMC2AjFrDdtLZUC4YCIUAQn7bGegLsWWy4PqU/aY6BgC8SWK7FTX
         IJzpLX5hDOmlhcJMwhXHEjSx378yiJgbdCQGnLnWyEr0EDPaMr8DLez/Y1USDOWxGOvE
         ZGPYt63Wd9popxv+sxFPfLXXjVoy64Wqb4x/ZYdElHGl5Fv8CKCuu52XXUbYAgFuhn0c
         xPQZk2+fFAqx82aTvEfMvew1Yh982DaFi5WlyfItFsHKOKAePkOoQLLCs3QovaWRnrks
         suiBWx5YiDf8gxsco9UD8LE2s6cbYjoASt/y5u8KU+N+6QjMJpGgf4gT/irS8jEPSoHk
         GyYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tidxcyMa;
       spf=pass (google.com: domain of 3bo2czggkc2uvprvwdidjrrjoh.frpdoha.ehqqhholqdur.ruj@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3Bo2CZggKC2UVPRVWDIDJRRJOH.FRPDOHa.EHQQHHOLQDUR.RUJ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3Bo2CZggKC2UVPRVWDIDJRRJOH.FRPDOHa.EHQQHHOLQDUR.RUJ@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 00721157ae682-64a9a9f1cd2sor38768547b3.11.2024.07.01.04.03.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3bo2czggkc2uvprvwdidjrrjoh.frpdoha.ehqqhholqdur.ruj@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=tidxcyMa;
       spf=pass (google.com: domain of 3bo2czggkc2uvprvwdidjrrjoh.frpdoha.ehqqhholqdur.ruj@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3Bo2CZggKC2UVPRVWDIDJRRJOH.FRPDOHa.EHQQHHOLQDUR.RUJ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831815; x=1720436615; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3otTmRv6e7tjJ/B/LGAW/z2pAH8+/eAhcSRRudoZhA=;
        b=tidxcyMaROLvIB8DvP/f/B7uhHMbGIEyFFqgbUf71956CX8uwjdjPaBd+imXWIGHl6
         HKK1jq1bgIjfKZtkw5UZY6EZIXsKZ3HoNlpTLomjwMH6MPjrpFtE4+GoT6PUx+fZTg0F
         NSDoeTVlyCowDvjBhI9M5LJljZp8daPKWsY9jTlK6opMGgM7UjxkKRxZA48PRIrjVeSw
         /2UvSa3OW0Q5U0wDtd1CI9b0Yhhz0KypZjGSEx2xpLF1ppbOg88zd67vv4IBxxguEW9m
         ZQ01pslTyQKkSRskgvrXa1Pm9VRpzYLd15GtGYZAWCRs9sU6iJMceXIt89KJDHzwwntW
         nGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831815; x=1720436615;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3otTmRv6e7tjJ/B/LGAW/z2pAH8+/eAhcSRRudoZhA=;
        b=lTNsEK8icFAxINHSFFOdx7YBWM/kvDt+88EYx7OI3871VFjpnHIjzdhkqHjDSrkANZ
         FrD3DDxmgxOLOppoNWUFbP5d+OHyhi8jS0xx/KLW+QQz9UvuoQUxwGBB13ouYTDqwRGZ
         +mw0HAkoW/QslXbKaYl61W5l6Rg+8RU8B3Erf+3N3+l874QPFNcXoNadLawf9MsDX8sL
         FSzvSXUjpQoY4UdjyWKFwbxVPdLsLeBH3VjzrdiKRtxVMV9RAFWnROowqz/BbR85mB01
         dzhun6QCTc5/k762jpJU9rfsc8iJPF9gWCw+KPSr9kTwrSncyfyaB3DVD2muRZpB04T1
         vgTw==
X-Forwarded-Encrypted: i=1; AJvYcCUX05zza81cm8WWm2PrFBOM2500cayvTte1QXB7ltUgv/9ukPYSIxKqum78QcCx7kx1w6nowjUIpXjwOF6+5+ZDgqMoIx5I
X-Gm-Message-State: AOJu0YwAxirbB+Gq6MHObUwNgMepNLOuH/IQnnqw5+0WepTbd1SWo9gx
	uI5jXxdyywHRuLa8cIDbs5+Ax9xUUWoi4ATUZazjXxb2hWxN5TVI7cFLNTfVwntRPGSy24gM/66
	sVhIA0PAUzA==
X-Google-Smtp-Source: AGHT+IG6hr0BGodtdLqLe4YfAeKTx685aeyklLvi0+RKiO6OrGc0BKS7OgCgGj615kbmuP2wtaBt4UAHVv7qnw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:690c:fc8:b0:64b:16af:d264 with SMTP
 id 00721157ae682-64c776d2fd5mr161897b3.7.1719831814708; Mon, 01 Jul 2024
 04:03:34 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:34 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-13-smostafa@google.com>
Subject: [PATCH v4 12/19] hw/arm/smmu: Support nesting in smmuv3_range_inval()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Rk+U/yh1PNlO

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
index 71afd486ba..5bf9eadeff 100644
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
index 86f95c1e40..e5ecd93258 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1136,7 +1136,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
     }
 }
 
-static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
+static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
@@ -1161,9 +1161,13 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
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
 
@@ -1179,9 +1183,14 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
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
@@ -1340,7 +1349,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-            smmuv3_range_inval(bs, &cmd);
+            smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
             break;
         case SMMU_CMD_TLBI_S12_VMALL:
         {
@@ -1365,7 +1374,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
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
2.45.2.803.g4e1b14247a-goog
