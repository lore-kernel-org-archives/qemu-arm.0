Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597546ejj;
        Mon, 25 Mar 2024 03:15:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVO9TWxjwDVSm3tU/6cmnCtJP/Dl0vD4xQPmW4f4L0TPfL64GhI98n7AjEGQBrfaWi40nqi5PQeNa5LVGzFX7bMGAdUbAHI
X-Received: by 2002:a0d:cbc7:0:b0:611:6d6d:5d7b with SMTP id n190-20020a0dcbc7000000b006116d6d5d7bmr2222968ywd.16.1711361715604;
        Mon, 25 Mar 2024 03:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361715; cv=none;
        d=google.com; s=arc-20160816;
        b=K06FWCBO7PwHXOvIm+7CfV042+toZJktmYmJ/U9UI3Cs0uVFfHc8v/zmcYFasp0sWQ
         VVYmiNEHCY6x23AKhntMKN5yLvE6XrgwqYp6AhxvT610PDz6YegKwtorPswqkgz7g3pf
         xvQtvtPkSbmMzVazON9VJA8mD5n3iIb+YG7L9Go8Q8fzPXuEJt/ny3AaR9t9nBjgcInq
         KqkAYmDneNTSQJ0FRSzaR8YX2Dohh7CLCCkNdNcsC2uNe1Lrzo3FxcvQH4NQ2sdDVIZ8
         bdr/SmSvMv0NauPENpELr6Ap+1L4iqyjlkFvdUAZiqWVObs9KFrhqtYPFA+hmN/1kH9m
         1coA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=eHoUPCH/YMadeu6TWvrJiZJZDJjDW6k+aPnqL5b9wjg=;
        fh=TZrHRVlUxTjHRULcOGTw+XhnTmAz1jryWuCUL7xfRE0=;
        b=Za/htIAaLpV42CIqBOmic+xeBdsl+UdQgLwGKdyK8yFG6NzIoRmDQZcvR8id33fYJm
         ALrUYd+ItNpo4ZFkzdyfhSinqQk6n9wdLr8wJxEKE6eOiFKo+vaBIVbC3Hx2CeJI8x+E
         u2kcauGS2qr2r83cPmno2mZ3Y/eGEaMIMeqrYFrC7COXVWLX0Po6B+s9XHkpHW8PCKFb
         834cjYiIfQZD2yQ1Z2U0uM0gP/KoAxEo0oAioMEvwYSDaza3vV/ZEqeDaS5MTmiPrbMH
         xJQFWyvcQL5IzvHAE3ehWm28eGHh3/JY9lVWUuMuxQ+4yac2Hfr6rxwBFnwBHsXMaz++
         O58A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TmV6xP0y;
       spf=pass (google.com: domain of 3s04bzggkc4w82489qvqw44w1u.s42q1ud.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3s04BZggKC4w82489qvqw44w1u.s42q1uD.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3s04BZggKC4w82489qvqw44w1u.s42q1uD.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id m10-20020a81d24a000000b0060a2081f0c4sor2554570ywl.15.2024.03.25.03.15.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3s04bzggkc4w82489qvqw44w1u.s42q1ud.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TmV6xP0y;
       spf=pass (google.com: domain of 3s04bzggkc4w82489qvqw44w1u.s42q1ud.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3s04BZggKC4w82489qvqw44w1u.s42q1uD.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361715; x=1711966515; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHoUPCH/YMadeu6TWvrJiZJZDJjDW6k+aPnqL5b9wjg=;
        b=TmV6xP0yFP6nHmao5nZY9KEWnWoZd3dxOWcpFVbtQ/IajMbT2iEpaNKA9Xt0G9rtHP
         TVWlU879Bv2yQQVAzKWt2VGWQ0Fb4u4Q4015n4bJL0y6eVLfvWXLUjLYGDuLIHqYIO2+
         92LBYgxne3pddMSwBuNZUs6LkPNZi1qK3eBChfLESNpGaVW4vqc3FYLC6pqH9jT4RPd2
         SRYSTv++4aJoqiFrUAuMeq6i2GVC15dClGxS48QJdHPncou0HOTibM35RHYaT2lG/G6d
         mORiPY5qP9kfPI6S1ARN9VoarDpTpAWSTi2sn5+hUaQsnCfb6EFQLKwgCfT65DGL6/o8
         mhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361715; x=1711966515;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHoUPCH/YMadeu6TWvrJiZJZDJjDW6k+aPnqL5b9wjg=;
        b=UJMU3tTYSUaTXQdLjlI22etmtrLcKPhTXgyFjVqOOZ8M1JhJAvIgeup/D3SVDu0Eo9
         VjwmeuMhomt53f3BhNGuOAJt+6Qof3Fu7aV6cwzR3x5xk4eZ3g2E7NE4DTY54Ef7pL1/
         zw34ZocOMlA5LXFmA2KGD3v45N9tN0rgR2D9MfDBRh4pSgA4e9fQK+mLD9OnDLU0wTNd
         3gO6gZv5ayB72jlP0hIaB6OSSJPBHNDWfS6uGKnqjlWY6XKXthdiHEY8w7heupMQFmsy
         UgDm1TZpCUTmhMlJDA4BdqgYWjL0+1tzz7/N2gsHJoNUpS6oEf0RhjyM9g39G81+qdLK
         u/YA==
X-Forwarded-Encrypted: i=1; AJvYcCWtWvPLzIND5N5G7twoXDsE6at7tPJpukKVGNUXwWxGSY1Mw0ZM9vDlQtbaz+9eMnB2wXErh9XEvkmlbCFlVQA5yltsXDkk
X-Gm-Message-State: AOJu0Yy48yd9gZ4sguBJEz8scny5TwjFYm0bVDmIR9r5VU7bNAQ+tKK3
	Q7lzjLn0LtoL0rv5VDmDXLzwKqI0PS25vMF4PADKLr2kE3O2BcmLatQPmEnK9WLetIy+41n+mst
	rYors03LkVQ==
X-Google-Smtp-Source: AGHT+IHXtcE8vPKkk9UnxjONeFhwulYVc7m3vqAZvDSAzUouYEXPKzc8bJvOkPwoM+SHcFv94wU9qV48jPc59Q==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:690c:fcd:b0:611:967b:ed8e with SMTP
 id dg13-20020a05690c0fcd00b00611967bed8emr288621ywb.10.1711361715231; Mon, 25
 Mar 2024 03:15:15 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:14:01 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-6-smostafa@google.com>
Subject: [RFC PATCH 05/12] hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: leTXxcv2z1dC

IOMMUTLBEvent only understands IOVA, for stage-2 only SMMUs keep
the implementation, while only notify for stage-1 invalidation
in case of nesting.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c     | 23 +++++++++++++++--------
 hw/arm/trace-events |  2 +-
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 9460fff0ed..d9ee203d09 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -993,7 +993,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
                                IOMMUNotifier *n,
                                int asid, int vmid,
                                dma_addr_t iova, uint8_t tg,
-                               uint64_t num_pages)
+                               uint64_t num_pages, int stage)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     IOMMUTLBEvent event;
@@ -1017,14 +1017,21 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
             return;
         }
 
-        if (STAGE1_SUPPORTED(s)) {
+        /*
+         * IOMMUTLBEvent only understands IOVA, for stage-2 only SMMUs
+         * keep the implementation, while only notify for stage-1
+         * invalidation in case of nesting.
+         */
+        if (stage == SMMU_STAGE_1) {
             tt = select_tt(cfg, iova);
             if (!tt) {
                 return;
             }
             granule = tt->granule_sz;
-        } else {
+        } else if (!STAGE1_SUPPORTED(s)) {
             granule = cfg->s2cfg.granule_sz;
+        } else {
+            return;
         }
 
     } else {
@@ -1043,7 +1050,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
 /* invalidate an asid/vmid/iova range tuple in all mr's */
 static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
                                       dma_addr_t iova, uint8_t tg,
-                                      uint64_t num_pages)
+                                      uint64_t num_pages, int stage)
 {
     SMMUDevice *sdev;
 
@@ -1052,10 +1059,10 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, int vmid,
         IOMMUNotifier *n;
 
         trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, vmid,
-                                        iova, tg, num_pages);
+                                        iova, tg, num_pages, stage);
 
         IOMMU_NOTIFIER_FOREACH(n, mr) {
-            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages);
+            smmuv3_notify_iova(mr, n, asid, vmid, iova, tg, num_pages, stage);
         }
     }
 }
@@ -1086,7 +1093,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
 
     if (!tg) {
         trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf, stage);
-        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, 1, stage);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl, stage);
         return;
     }
@@ -1105,7 +1112,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
         num_pages = (mask + 1) >> granule;
         trace_smmuv3_range_inval(vmid, asid, addr, tg,
                                  num_pages, ttl, leaf, stage);
-        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages);
+        smmuv3_inv_notifiers_iova(s, asid, vmid, addr, tg, num_pages, stage);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl, stage);
         addr += mask + 1;
     }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 73cec52d21..34b10af83f 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -55,7 +55,7 @@ smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
-smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
+smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
 
 # strongarm.c
 strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
-- 
2.44.0.396.g6e790dbe36-goog
