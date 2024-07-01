Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286404njm;
        Mon, 1 Jul 2024 04:03:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFchDGDxkvwGjnhoN6+2EHZuAjXXhaajcSRULVWVXmJwjkWQ/XRdW3JBs9RTsn9pVP/ItlXExujUACvRfPS24JHKB52x73
X-Received: by 2002:a25:aa2e:0:b0:e03:618f:c627 with SMTP id 3f1490d57ef6-e036eb8cd77mr5439636276.34.1719831808297;
        Mon, 01 Jul 2024 04:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831808; cv=none;
        d=google.com; s=arc-20160816;
        b=w3JL9hUPcL2ayLPBr3quDLldPWvxkWUpJ1+qVApDpTBIrKYpL/opQJNFTKHkm2O+Ib
         f01liSIyPs3+dJJO8auKlc1XPwuZojPoNPO2ZCeRm49exkDqGP95khdCWnxEadY08U6c
         KQzYxkKyazCUbf6I8olF70dQEVgXwCzOrw1fS0hBAcgZaNtlj7ldL//M8DOXe4+NGzNb
         GxDRROKJyytDGfUnH2iPKkEclsEbtkDqZscdzo54EFtRRZGo1HEIftAVFE89QChZTe/V
         IsQX01tkCd56dGENwH+1CXydwHZEl4SigLwdBmfA6at0OJ7IzvigdssRR/W0+Zo2BMBX
         KzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=Nf/BuvdXrYHKSrwR11B4FhLzHkeE3jRvv0ulnFc6ImY=;
        fh=MjVAzW1NOlWYRQgNL9N7mTdmoKWgenufeoOqeC1FAgk=;
        b=xkbOkVeGw+bdq+gu/+eNVZgBULRgKqA2c7v7Kv/1FHT0dq0EMBwZPCJ6nMNBPZmURj
         c0VuGjiiZ9F+xafOaDu3Is5LxOCHZV6809ttul+93WTSnoEpZwnWkVbyJ4Q4euGVgE0m
         NAnnDjs5MB5cRVahfT4wAgeecTPaDz90fWLbontatRMD+owW2FOTjx6t8p91LPHMbq6W
         axc63L9eyrCkH4q5IIqSaySy3wFQeEKO1nQ/00hPu084HffBro6grscYSKlprMw9OT22
         m0l90WVs/VhCMDtHp6DzUfPudm1HjPV+ySX8U/NJedn+bx0+de18xHIq+3fjPZGNVCzg
         0inA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=XhaquUta;
       spf=pass (google.com: domain of 3_4yczggkc14oikop6b6ckkcha.8ki6hat.7ajjaahej6nk.knc@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3_4yCZggKC14OIKOP6B6CKKCHA.8KI6HAT.7AJJAAHEJ6NK.KNC@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3_4yCZggKC14OIKOP6B6CKKCHA.8KI6HAT.7AJJAAHEJ6NK.KNC@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0345b853bbsor4106769276.9.2024.07.01.04.03.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3_4yczggkc14oikop6b6ckkcha.8ki6hat.7ajjaahej6nk.knc@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=XhaquUta;
       spf=pass (google.com: domain of 3_4yczggkc14oikop6b6ckkcha.8ki6hat.7ajjaahej6nk.knc@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3_4yCZggKC14OIKOP6B6CKKCHA.8KI6HAT.7AJJAAHEJ6NK.KNC@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831808; x=1720436608; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf/BuvdXrYHKSrwR11B4FhLzHkeE3jRvv0ulnFc6ImY=;
        b=XhaquUtaq4778R3qDSAAc1+T8YPrBv6ylS8d67fMLYG7LdiA2G51fbe2THC8Z1IcVG
         HPZcUVY0fayDZ760/p3cszPvjMuQMZcpbR3Y6AndBq0HIixKnKhr6ktYbR7ZhP5eWxOA
         ZFx7GSzXJctQ+jq4iR0wbZDF4RXk6VLaRQxrGUhMi2UvQYKY0/+NS36xUkwHHVnjP6JY
         CYgJh0p/JBuBbXaJVX5PIlJ+fKvdJV5aoiHDW6osVptz/hciPMdm1OWCSmHrZmilU9Yv
         7UUkUgzP03Evi1KpL0YtdfPW2p0L+Zpk3839RPb/Dp2OhDogsZlqqqCOmUiyUUJD98/y
         OeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831808; x=1720436608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf/BuvdXrYHKSrwR11B4FhLzHkeE3jRvv0ulnFc6ImY=;
        b=oakFP4vdeZwwGEGVLaRmfP/g/IxZSkhjYDGOQe5MxWzhwKR+8c5KisflgAN2632rge
         0WYkq+ODg87PCNOMGOMB7QBjyKd9UbR1Xaqeg4c04K+IdrvXlauEPJa+gKOQKkwVx1Tb
         ragSUSN79Jqy/e0RGZZfU578EE2U7SUIJ5+xE/LrQFpWIyxraY212Ni191QNVPInbSVx
         5KabJRTZwnSUAo5hF/S1IWJb/kdQcukDhgWVOwY6BKMwhWnjLErTuRojgTgtr2Z3xqEB
         zQs+DmzjzHXkm0OUJRlQSHFpKoVTM2nva2eiBhASWCiZlIv+4C5vO7+FGlEgm+O0gIdL
         MrXA==
X-Forwarded-Encrypted: i=1; AJvYcCWhADUV9nsb++6YZPMdCjz4P/sM/SiLXPI2QeKEDXs4lxEcoyhw4miLMTuyLM9Abo9ygPsok4VUxT9Nnbswfx+z+rw2qKM9
X-Gm-Message-State: AOJu0YwLHIUOjpTMyOGKXoA0ql+xQbB51rnsvMl4fd6t0nR2UsCvgLKP
	u90Fih8h53fx7nRXhSpZ4BGDpmwG2lc/1+j+wxIu2sLdAFalQHtMqDiV0YnglF3bRLouXfcwJNP
	EQwsZwiCXkQ==
X-Google-Smtp-Source: AGHT+IGDP9hkCJFJKAVw6gMnE6v6ROuUsQJDsyBLTRsGJ2mcTLzpD4HgzU/VuXFiqdQuCaHKE1BiDV3gzj8TPA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1542:b0:e03:4bf0:b21e with SMTP
 id 3f1490d57ef6-e036eae0fecmr455790276.1.1719831807602; Mon, 01 Jul 2024
 04:03:27 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:31 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-10-smostafa@google.com>
Subject: [PATCH v4 09/19] hw/arm/smmu-common: Rework TLB lookup for nesting
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: v/DE3qwRUYiG

In the next patch, combine_tlb() will be added which combines 2 TLB
entries into one for nested translations, which chooses the granule
and level from the smallest entry.

This means that with nested translation, an entry can be cached with
the granule of stage-2 and not stage-1.

However, currently, the lookup for an IOVA is done with input stage
granule, which is stage-1 for nested configuration, which will not
work with the above logic.
This patch reworks lookup in that case, so it falls back to stage-2
granule if no entry is found using stage-1 granule.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 21982621c0..0840b5cffd 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -66,8 +66,10 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
     return key;
 }
 
-SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
-                                SMMUTransTableInfo *tt, hwaddr iova)
+static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
+                                                  SMMUTransCfg *cfg,
+                                                  SMMUTransTableInfo *tt,
+                                                  hwaddr iova)
 {
     uint8_t tg = (tt->granule_sz - 10) / 2;
     uint8_t inputsize = 64 - tt->tsz;
@@ -88,6 +90,36 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
         }
         level++;
     }
+    return entry;
+}
+
+/**
+ * smmu_iotlb_lookup - Look up for a TLB entry.
+ * @bs: SMMU state which includes the TLB instance
+ * @cfg: Configuration of the translation
+ * @tt: Translation table info (granule and tsz)
+ * @iova: IOVA address to lookup
+ *
+ * returns a valid entry on success, otherwise NULL.
+ * In case of nested translation, tt can be updated to include
+ * the granule of the found entry as it might different from
+ * the IOVA granule.
+ */
+SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
+                                SMMUTransTableInfo *tt, hwaddr iova)
+{
+    SMMUTLBEntry *entry = NULL;
+
+    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
+    /*
+     * For nested translation also try the s2 granule, as the TLB will insert
+     * it if the size of s2 tlb entry was smaller.
+     */
+    if (!entry && (cfg->stage == SMMU_NESTED) &&
+        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
+        tt->granule_sz = cfg->s2cfg.granule_sz;
+        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
+    }
 
     if (entry) {
         cfg->iotlb_hits++;
-- 
2.45.2.803.g4e1b14247a-goog
