Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118192nji;
        Mon, 15 Jul 2024 01:46:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXRdy6l4/bpEF0KPgOc5xUxGAzMeWtvNGAkc58vcIYv2t+hWI/J+8K0WdFkdfUQ4vykx6WZT7W9uidgaBZnq4DcvxQ/AJx
X-Received: by 2002:a05:600c:28b:b0:426:6f81:d235 with SMTP id 5b1f17b1804b1-426707d9c3dmr146393025e9.15.1721033165176;
        Mon, 15 Jul 2024 01:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033165; cv=none;
        d=google.com; s=arc-20160816;
        b=zJhfi/u22yjTsjQ/Fd8wWfxLfJvFNCIogfURGWpB+1LfOOnH9XpKcBTjuVGrxhhX6F
         zoIxNByNKH+A9UxJGGytWGDUMJJ+3P2hOwzgf2ZhDFTf1ZW9GzKMUt63A3/MIoalQ/E1
         x93S9woF5Q20HeQOFfg4iVUkcLmrEVmwW6hU+n6Y1pQjhWZjSdyvKRYQ5Ap2DNi5+KZA
         rlptUn/xaVHew3c6lmGC4NjdwQbjb+7JROYsjVPnvWyK31b+DZmHKXaUY+TgR4KVljwH
         t8wjwslwNDNSbvhvl8Iyr9XdFy511tFk38JIwLVR9KsqMAAuOA0sS4ialOD4E1I0+PDh
         WrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=s69Mr04NY6qoAF7uIAiGzjwI8ISorJ9nbI/mR7x4wgc=;
        fh=54bw6+GG2qejm9TA4TXz6r3L68Uz09UglsopBLNWuZc=;
        b=hItSfBMPTHnhsC6W8g18f0edXPjMZveWw6+vNMPob3iv+GAB+VBhmBd86hL6Ece5i3
         eef/RYTTgqxaSxv2n53Rj6GdAFDrVY3Ekzfzd98aUxg6I122bkEb6zV+OZsTjxFHX4Bn
         teJlYS9NG+Dsf1QOj+/ikLhb5TkD7wXJ7zEwXIDmu/ZXxjrVJGlEmwTTdwH962ayT6Vf
         Gj8SU1LN0AL6CF3T5l00iT8d/DaoARwqCvares6mwzDssJ9BmDVYVgi/5L1SCy3//ynu
         2s5w1xV2o2yBOk1KV/KChSmJM7PlSKbn1Muwsa61Tme57dBOPQXgp877LwJQ1CjREQKZ
         zefQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TY2VFcNi;
       spf=pass (google.com: domain of 3zoguzggkcx8nhjno5a5bjjbg9.7jh5g9s.69ii99gdi5mj.jmb@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3zOGUZggKCx8NHJNO5A5BJJBG9.7JH5G9S.69II99GDI5MJ.JMB@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3zOGUZggKCx8NHJNO5A5BJJBG9.7JH5G9S.69II99GDI5MJ.JMB@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427a5f040b6sor9250615e9.4.2024.07.15.01.46.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3zoguzggkcx8nhjno5a5bjjbg9.7jh5g9s.69ii99gdi5mj.jmb@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TY2VFcNi;
       spf=pass (google.com: domain of 3zoguzggkcx8nhjno5a5bjjbg9.7jh5g9s.69ii99gdi5mj.jmb@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3zOGUZggKCx8NHJNO5A5BJJBG9.7JH5G9S.69II99GDI5MJ.JMB@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033164; x=1721637964; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s69Mr04NY6qoAF7uIAiGzjwI8ISorJ9nbI/mR7x4wgc=;
        b=TY2VFcNieAdL+CsSUT1TAx0Upnio9bkUMRL815txkTIgRlu1r5KaPXB634ObQBfZ4N
         Tq1mqJxsksGMO/l452dhDqp0pTKJUmiMVKdnjYOQ8ORW559d7cGi3zSkl3Vdon3NOEVd
         x72/MM0euDsJa0/59g34oZaedFBbBZH9WnFY7qSVOaLHX04UPHW/vPtk2vvOdl2szAoC
         pdHoZrLyKq/HQ+Nb3r/iEpATHxVYH8hDbuoPh24zOmnSiu5+Gi7wihuqVleJwfmoJ9Tr
         icXHM8AQRg6RcZdUcL5vvkSLeTkrBedPDuSe6XkrUem+WK+J7jvnIhFFtsZyq/z3cZyu
         o+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033164; x=1721637964;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s69Mr04NY6qoAF7uIAiGzjwI8ISorJ9nbI/mR7x4wgc=;
        b=tIbmbfUm/zXTzmHH/OT2TH2nBCm6H2hpmKyeeqGaM8NzR7UicIX3UKoo5IYCqgsHY6
         sl4RzoZuSBUWxpuvvf9SNO8IQb0f/LHdenSlT46NtDHCpnBH1QuWtKUJKwNraPPkGNAL
         QZhdMPho/3G8mV/2TYOqRQW3pm8ZbX+OPxsJdlo5ZoHA5o+CtgMcJPvOUFA8t/79Q+b8
         5usqHY+5SC/ZHUxSUTHPwK5Idl1WUqnxYSWoXnhhnvVjzBbVXBx+XMubMrK92RzdDUJQ
         +h7zaCVsfWz2hnJiQGEGmlxNSb/DLESNLJ5HPA8yIjrLW+eSMa2SFSRkySwo/eYpM+JD
         ANCA==
X-Forwarded-Encrypted: i=1; AJvYcCWG23NMwOqCQmZjygYvA9Q/3ADBU/w3+nsUxuLWNpMBBq/wuBDVXZaRcYq9ee1ytKRBnBrZQ5+lZUb/wBKNI0PDyV6kCii4
X-Gm-Message-State: AOJu0Yz1nvskRsFlTSR3JoagI3wmIQFm5r4eBXM0tcDJ88xnDaQnSguZ
	73gmZv3GkNbUxsKcFOIbkU8dV5Sibs8M8UJ2ADfiKi5DEU4BYL+7FWjoBXP7di1IYof/hqMf/AZ
	BzGHI+z9Owg==
X-Google-Smtp-Source: AGHT+IFlVVm+FGobKoSjPiE9yCTFm1VWz0/8JhGHfsjqZkHW9w42e90RTwYd2hCESfFkWPEy6wfT8rV7WRS07Q==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:6b18:b0:426:627e:46f6 with SMTP
 id 5b1f17b1804b1-427a25f645fmr180675e9.4.1721033164481; Mon, 15 Jul 2024
 01:46:04 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:16 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-17-smostafa@google.com>
Subject: [PATCH v5 16/18] hw/arm/smmuv3: Handle translation faults according
 to SMMUPTWEventInfo
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 6QDQjRriemjg

Previously, to check if faults are enabled, it was sufficient to check
the current stage of translation and check the corresponding
record_faults flag.

However, with nesting, it is possible for stage-1 (nested) translation
to trigger a stage-2 fault, so we check SMMUPTWEventInfo as it would
have the correct stage set from the page table walk.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 84cd314b33..d052a2ba24 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -34,9 +34,10 @@
 #include "smmuv3-internal.h"
 #include "smmu-internal.h"
 
-#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage == SMMU_STAGE_1) ? \
-                                 (cfg)->record_faults : \
-                                 (cfg)->s2cfg.record_faults)
+#define PTW_RECORD_FAULT(ptw_info, cfg) (((ptw_info).stage == SMMU_STAGE_1 && \
+                                        (cfg)->record_faults) || \
+                                        ((ptw_info).stage == SMMU_STAGE_2 && \
+                                        (cfg)->s2cfg.record_faults))
 
 /**
  * smmuv3_trigger_irq - pulse @irq if enabled and update
@@ -933,7 +934,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             event->u.f_walk_eabt.addr2 = ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_TRANSLATION;
                 event->u.f_translation.addr2 = ptw_info.addr;
                 event->u.f_translation.class = class;
@@ -941,7 +942,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             }
             break;
         case SMMU_PTW_ERR_ADDR_SIZE:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_ADDR_SIZE;
                 event->u.f_addr_size.addr2 = ptw_info.addr;
                 event->u.f_addr_size.class = class;
@@ -949,7 +950,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             }
             break;
         case SMMU_PTW_ERR_ACCESS:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_ACCESS;
                 event->u.f_access.addr2 = ptw_info.addr;
                 event->u.f_access.class = class;
@@ -957,7 +958,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             }
             break;
         case SMMU_PTW_ERR_PERMISSION:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_PERMISSION;
                 event->u.f_permission.addr2 = ptw_info.addr;
                 event->u.f_permission.class = class;
-- 
2.45.2.993.g49e7a77208-goog
