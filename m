Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931768ejb;
        Sun, 28 Apr 2024 20:24:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHFRssYwOq0bjPQ3xY4jMxjyOZXh/IU7oVx9KjTHNd6xiyOwbNsYYDVqriSnEGum/k63rb3rEJ7OSfEN81j8ANL23BuVmf
X-Received: by 2002:a05:600c:3b9b:b0:41a:c82c:1999 with SMTP id n27-20020a05600c3b9b00b0041ac82c1999mr8512534wms.9.1714361093327;
        Sun, 28 Apr 2024 20:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361093; cv=none;
        d=google.com; s=arc-20160816;
        b=MuR81SbXNMFRDV/pZFDOqfc2flMIzQjXzqWY0v6eFgCeRkBGAHsx/15j7tzW6dTyaC
         LTWWGoploNSTAwbMEHtRA6Hr9LhhlUW0eeW7ozxNXbHzAOlLwwKSBSs5Vm7DhXequBHP
         dRpIHhSNicTw7m87FSRY5kZNCkXq7rgfMuEfQFfWyfQjqqHeb/nh3haPC1FdLPTh5e7r
         Wqepp+yvGHCJE+YZjRITeVKhGV8z/OIJ2GGrmFygYLHzPCOxcrLgws8trQXFir20iAAE
         XsY9TXw7v6lg+/8S81VlhIiUzLmw8SANVdOyShwqXfwGV1NBSAZhVFCLaLxN2ekFqOlO
         +4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=K2K10o4HrVEMQyB0nTzL395RaCFWkr722hs0qYO5Pu4=;
        fh=ehRF7WVhnXBpkSjCADqPzTshWGTXtpwWPNzsVlIgp/k=;
        b=iFwki7uYVrrN/EFzpQQcX9EfPZqPzUIIVagQ9wy7KKVwBTsqq9AisXX/i95A6lyxt8
         LbCrKeyiwPeNIlTV3lOdRrRq1Gp01tWJu9bVtL5SupMpHVWWktnHoANAw3SgwL6Ah/XS
         Hj5ijWlOVeoZkVRFSXjfUhtONuNGPTHy+8fFsiWavT9kOoIT5l6c2TW0Orz81wHr7Ubt
         qvJnHyFcYjlBfPgoHrNPdesn4b5DYPiCqd1IXzWB7dZiZ3e8TWIIPgOOPt/7eAEdUEmt
         F2QP20ZuDT8EN36U8RapAAA7rRzZLbrFaouZevUmWjHaupmN+9agejJqYqsS1MGjtbHA
         d2RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OXbD8oCB;
       spf=pass (google.com: domain of 3brmvzggkcyaoikop6b6ckkcha.8ki6hat.7ajjaahej6nk.knc@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3BRMvZggKCyAOIKOP6B6CKKCHA.8KI6HAT.7AJJAAHEJ6NK.KNC@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3BRMvZggKCyAOIKOP6B6CKKCHA.8KI6HAT.7AJJAAHEJ6NK.KNC@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id k2-20020a05600c1c8200b0041bf979e1d5sor1001432wms.4.2024.04.28.20.24.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3brmvzggkcyaoikop6b6ckkcha.8ki6hat.7ajjaahej6nk.knc@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OXbD8oCB;
       spf=pass (google.com: domain of 3brmvzggkcyaoikop6b6ckkcha.8ki6hat.7ajjaahej6nk.knc@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3BRMvZggKCyAOIKOP6B6CKKCHA.8KI6HAT.7AJJAAHEJ6NK.KNC@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361093; x=1714965893; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K2K10o4HrVEMQyB0nTzL395RaCFWkr722hs0qYO5Pu4=;
        b=OXbD8oCBr6/wrKaXA6rgZYcO+hMO48n3GBPzLOUHK9o+DzEIH2/3u+bt8BuHpzF5Z3
         OMIlvxwExS87qRAnPVL1KX7w6l5ulPdbmwE+6B0oeH3KVnfqOQmnr4udTG4ZCmJBDh+0
         jBJcNA5YsKY18Vdw0PkYpHay9faOkY8aId83GvmHq3dr2QZ6LICFGwDVcwEn3RURk90k
         d3B5m3Nyt9e8fOJtQoMbrikh51kZCyPzwdKFgdDQJOu28ves0ieaZR3P2RQS54/M2o6i
         oXb8c5xHrEglUeeBhd9AAhkh1vR5e9YCvv1vr3R5UsFhIA/hKoWODy7xUQ0HINcBW7cq
         V95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361093; x=1714965893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2K10o4HrVEMQyB0nTzL395RaCFWkr722hs0qYO5Pu4=;
        b=f9qvc41adftN7QEZqhL0YPNsfbj+2yJOa/o78pIcirAKluCobIBPuQ8GIPNavi0O+K
         3pg6Ippr/x7uQ4eUmjYCnvncBNMKdRwkSpBk0KzJbHqTxeU/pbglOqoN0TMgQqtvwSJl
         rWalwLlnpxPLDeV3qpW5E4i9M3PGjwuR8rt/jHF5OVOKSoQT7KdB3Jf1RwNeADY8NWIb
         PI9NeCy10XDoXEx7ED10hr3Q1o8Zhqt2qUuoPy4rO097TMcHP3UNXXNBQxHKscyL+O67
         R1ODskxbvaEOKCb0lbf/2TA8p2EpX1q2BBmydqSwyH6YexUW28puWFQn0YiHxogzAzDq
         YVwg==
X-Forwarded-Encrypted: i=1; AJvYcCWs7QwP5AGo3S2AlVv+2/ylfKcFVp/+2Lg32gk4J5SDQNymu4XvmW0tOjs+KY4j7emsvtbjdusXg2/Cjg5OzqplIPQft9+g
X-Gm-Message-State: AOJu0YziSQdV1gMRz0Kzw9TLFujTwFfSzeDiVm+5mz4pF8Gk8VZ8xbdf
	ThyNAmKa3gVuUs7hDfRQhNqUhUvho15exkn4pOjlF2UES2dXl8GsYb5PT1Gkkl2eTGO88JYOvAi
	ab1xU08KmcA==
X-Google-Smtp-Source: AGHT+IEAioScIgyQYW1iT+3RIFGdD9MYHPHvp2XBiqEQ5PSeCrxbZKuYDnWsqLoHMsyqf6oHY1wlXaQ7UYnUbQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:5801:b0:419:d7:1cc7 with SMTP id
 jz1-20020a05600c580100b0041900d71cc7mr32662wmb.7.1714361093088; Sun, 28 Apr
 2024 20:24:53 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:53 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-10-smostafa@google.com>
Subject: [RFC PATCH v3 09/18] hw/arm/smmu-common: Rework TLB lookup for nesting
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: fw8yAFah/SPp

In the previous patch, comine_tlb() was added which combines 2 TLB
entries into one, which chooses the granule and level from the
smallest entry.

This means that a nested translation, an entry can be cached with the
granule of stage-2 and not stage-1.

However, the lookup for an IOVA in nested configuration is done with
stage-1 granule, this patch reworks lookup in that case, so it falls
back to stage-2 granule if no entry is found using stage-1 granule.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0d6945fa54..c67af3bc6d 100644
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
@@ -88,6 +90,24 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
         }
         level++;
     }
+    return entry;
+}
+
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
2.44.0.769.g3c40516874-goog
