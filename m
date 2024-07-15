Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118165nji;
        Mon, 15 Jul 2024 01:46:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVp41rOY1nN83134xv6fdfyzZ/JluwOL5P8xVl/N0NLzznNah5ITRgsm71fC/puYoU38Dq1t+LZqkC2nYkEEY/fqZ13CdhC
X-Received: by 2002:a81:93c6:0:b0:65f:ca0b:5ad9 with SMTP id 00721157ae682-65fca0b5b09mr66531237b3.25.1721033160744;
        Mon, 15 Jul 2024 01:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033160; cv=none;
        d=google.com; s=arc-20160816;
        b=fovwJFgEhnPX9/TcmyJhqzdqOErVGqQzKvd9LcCASjufgd8RtnOnBNLYnRMZG/qbXA
         h0kQ81Gkeqb66cjE27tSX9eFdXq4NmihpU684lhgzs440EiG7aYW7tzUM3B5/+AITvNZ
         vS6I1C0uGPejrUHIOUijBuHBaCni3Uzu3HqhofLJ9LLWEgp6v+SRkR+vCpJsZ8939tbB
         G3HdVVIXHE4cYK/pU5QX/glF9k/r95ZTA4CXDzPpv/cUtfHdj7wb1Bchdw1CsJkv31f3
         /I0RUZ9XxIwkVwUKH6IE2vQ4HlM5dj/dgLHq/6qqCOggjsw2RJO5d92s9cbNKU+9cvVN
         5gkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=Chw4FqJ0T5QGDw52fywH0TUhHtoJV74548yvdKTYn6E=;
        fh=RxSLg08v9Weqg1jwerfuQke7FQD2CkGnmAb6K2co8R4=;
        b=aU9YSzQi70SwBQfN4vKZT7+SKFPKdHQTgoJHtSKr7R96vqisrU6DPxDL7+uhDzQkiB
         mwjIU8MaZ/CCW6AGmuhMioskGOZb0SG5uo5WzItgpj/h1eL8jYgFevPyP7eUBO+9+t0V
         g+rZj54g0ysoTfcXH/W/M8PSbAckW2yzplIZIMIwuzAE/vmqjX6/rBZoNRcgkRi+nXOD
         ur2904aN6s0k1ZHSnbKn9HS2Al4cHvUhsT+OoUkoIJh/tWUx0imf16GFsxzlgCuc62ee
         ttJedDPtBlyHPaQBfKgiw6D+QYGtlrIsFvSFICskyeCGD5GAOZXElXEAB61lI+kabCVB
         COIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GO24hPhf;
       spf=pass (google.com: domain of 3yoguzggkcxsjdfjk1617ff7c5.3fd1c5o.25ee55c9e1if.fi7@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3yOGUZggKCxsJDFJK1617FF7C5.3FD1C5O.25EE55C9E1IF.FI7@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3yOGUZggKCxsJDFJK1617FF7C5.3FD1C5O.25EE55C9E1IF.FI7@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 00721157ae682-65fc2fd271fsor21770687b3.8.2024.07.15.01.46.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:46:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3yoguzggkcxsjdfjk1617ff7c5.3fd1c5o.25ee55c9e1if.fi7@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GO24hPhf;
       spf=pass (google.com: domain of 3yoguzggkcxsjdfjk1617ff7c5.3fd1c5o.25ee55c9e1if.fi7@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3yOGUZggKCxsJDFJK1617FF7C5.3FD1C5O.25EE55C9E1IF.FI7@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033160; x=1721637960; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Chw4FqJ0T5QGDw52fywH0TUhHtoJV74548yvdKTYn6E=;
        b=GO24hPhf8MJpaT4GYNjeknLi0mw1TTZFC8NSgRO5DFpAZdilQnmG7qgHA2XTBKNQHO
         zLK04mb/uuwI7Sf4u2clDkIinvIO7edTgN13WMU9tmmUz+kZdSDB9QAGN1xewEkKvGDd
         xMYoF/KXzDTzXZfpNXIuDpchjT19urTWNN62wkEu/sp3aRYpOn3tCsvMTzV5yFyGiKEU
         DDus+xNqSKsriqqYFs95/zdaKJ7s1aMk5El49ltzkjb00mRsbcT108ScgYaOAkUGEPcc
         hugmKOLcsjY2UGaIEzIkCz+aFBCT/XO94ncBQEh/JjTn5O6hk+2a5XBL0CAunlGX2Hu0
         AgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033160; x=1721637960;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Chw4FqJ0T5QGDw52fywH0TUhHtoJV74548yvdKTYn6E=;
        b=JqoQUVHeZmB1AClPJex86jrDwgqUVNMtCNkmLHnNvxLvipi5X7iVDRe77pDRDDmaix
         Pc/9fB4QZL+tDfc26b9DZL4HUio7kiaf4sFbgV+pMMLZDv4yZpj6tldvx2Q2eynXt7e3
         vaqRcM7HqdBdOj0Q9mVHKeAdxdpUJwiREPjCraIxO5z9LMDrwF9EXS2Hjd4CWjwRGzhq
         ZpeIuMO42YwiFpqMNpJhW9lT50kSOLMVpor3477zJ5q2gNY49vGDwe5V3rGpcNfGSgZf
         CxS8tzthv42PgkMtAlCPJrI1XPVoRXuz3aJJspgHdO79b3WcCdHfzWx23jG8ihMA0lvy
         Qa5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwD/mEdVa5aVW+/ZSkU3GeBjyVOrBUrUHbQVYJ06Qpc6a3bIdyLIHILhOcDh18nrdKh2FPcRNp0qa6OzymkG88XadYyt+y
X-Gm-Message-State: AOJu0YywZ1ARzP2uf1pX7HFHwkkPcZdPnZRf9sfMCEW02mFaB2eIcTdT
	a8pT5W4QJzFH8T5TJ+MjhzwySTCjWgH4CFINhMpsRnJJQcVngSHJY/3falATaF97CWzIaEb0y8W
	wmPtgQJ2how==
X-Google-Smtp-Source: AGHT+IHC2a1XPeyJXvu9U4qmKRTZiNQ2yXDn0+7juZiM3/fD24czItRVjP3r5cyRm2yEgZGsUMdpQpXynY5FPg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:690c:3510:b0:64b:5dc3:e4fe with SMTP
 id 00721157ae682-658ee699c87mr4766677b3.1.1721033160342; Mon, 15 Jul 2024
 01:46:00 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:14 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-15-smostafa@google.com>
Subject: [PATCH v5 14/18] hw/arm/smmu: Support nesting in the rest of commands
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: cgi307Vq3Eze

Some commands need rework for nesting, as they used to assume S1
and S2 are mutually exclusive:

- CMD_TLBI_NH_ASID: Consider VMID if stage-2 is supported
- CMD_TLBI_NH_ALL: Consider VMID if stage-2 is supported, otherwise
  invalidate everything, this required a new vmid invalidation
  function for stage-1 only (ASID >= 0)

Also, rework trace events to reflect the new implementation.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 16 ++++++++++++++++
 hw/arm/smmuv3.c              | 28 ++++++++++++++++++++++++++--
 hw/arm/trace-events          |  4 +++-
 include/hw/arm/smmu-common.h |  1 +
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index bf35806b02..67cb134d23 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -178,6 +178,16 @@ static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
     return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
 }
 
+static gboolean smmu_hash_remove_by_vmid_s1(gpointer key, gpointer value,
+                                            gpointer user_data)
+{
+    int vmid = *(int *)user_data;
+    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
+
+    return (SMMU_IOTLB_VMID(*iotlb_key) == vmid) &&
+           (SMMU_IOTLB_ASID(*iotlb_key) >= 0);
+}
+
 static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
                                               gpointer user_data)
 {
@@ -288,6 +298,12 @@ void smmu_iotlb_inv_vmid(SMMUState *s, int vmid)
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
 }
 
+inline void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid)
+{
+    trace_smmu_iotlb_inv_vmid_s1(vmid);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid_s1, &vmid);
+}
+
 /* VMSAv8-64 Translation */
 
 /**
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index cfee42add4..9a88b83511 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1353,25 +1353,49 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_TLBI_NH_ASID:
         {
             int asid = CMD_ASID(&cmd);
+            int vmid = -1;
 
             if (!STAGE1_SUPPORTED(s)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
 
+            /*
+             * VMID is only matched when stage 2 is supported, otherwise set it
+             * to -1 as the value used for stage-1 only VMIDs.
+             */
+            if (STAGE2_SUPPORTED(s)) {
+                vmid = CMD_VMID(&cmd);
+            }
+
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
-            smmu_iotlb_inv_asid_vmid(bs, asid, -1);
+            smmu_iotlb_inv_asid_vmid(bs, asid, vmid);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
+        {
+            int vmid = -1;
+
             if (!STAGE1_SUPPORTED(s)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
+
+            /*
+             * If stage-2 is supported, invalidate for this VMID only, otherwise
+             * invalidate the whole thing.
+             */
+            if (STAGE2_SUPPORTED(s)) {
+                vmid = CMD_VMID(&cmd);
+                trace_smmuv3_cmdq_tlbi_nh(vmid);
+                smmu_iotlb_inv_vmid_s1(bs, vmid);
+                break;
+            }
             QEMU_FALLTHROUGH;
+        }
         case SMMU_CMD_TLBI_NSNH_ALL:
-            trace_smmuv3_cmdq_tlbi_nh();
+            trace_smmuv3_cmdq_tlbi_nsnh();
             smmu_inv_notifiers_all(&s->smmu_state);
             smmu_iotlb_inv_all(bs);
             break;
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 4aa71b1b19..593cc571da 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -13,6 +13,7 @@ smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "base
 smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid_vmid(int asid, int vmid) "IOTLB invalidate asid=%d vmid=%d"
 smmu_iotlb_inv_vmid(int vmid) "IOTLB invalidate vmid=%d"
+smmu_iotlb_inv_vmid_s1(int vmid) "IOTLB invalidate vmid=%d"
 smmu_iotlb_inv_iova(int asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
 smmu_iotlb_lookup_hit(int asid, int vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
@@ -47,7 +48,8 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf, int stage) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d stage=%d"
-smmuv3_cmdq_tlbi_nh(void) ""
+smmuv3_cmdq_tlbi_nh(int vmid) "vmid=%d"
+smmuv3_cmdq_tlbi_nsnh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=%d"
 smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index b3a937190b..d38687581b 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -215,6 +215,7 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
 void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
+void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
 void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
-- 
2.45.2.993.g49e7a77208-goog
