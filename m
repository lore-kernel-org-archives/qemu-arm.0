Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286592njm;
        Mon, 1 Jul 2024 04:03:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9VhOS0ITiLL6726rJ7P1oItnNDZfZdhK94v4k7hRYZY5peFi6t693XW2Yzn/c1Q0/B/qse7u/jS6kpKvTaY9BmxwnGosx
X-Received: by 2002:a2e:b52f:0:b0:2ec:5a85:66ec with SMTP id 38308e7fff4ca-2ee5e6f53e0mr31990721fa.48.1719831824815;
        Mon, 01 Jul 2024 04:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831824; cv=none;
        d=google.com; s=arc-20160816;
        b=c+1uOWe4BPHaDD/UiPTA0VRWrUnw50R1qT7I+ptIXaNzaI1CMjKxytMpF8Xsu5Z6xA
         dHmirkjXyeggUcqUthzuowPANlHDJRuqLTRFI8Bfh+Uvh8PnozeT8H4Rb8qP7pVoPLvC
         +StJjCKXdiHnMPuFT9RmzDNGKGLfveUd13mTP6zdPahXDniUjMpZXHwYyLSYU8jJgg0o
         F9dEfmp7BcUdKWCuuqjd0VIiwFPryEZPjjxMUwOwjJCByFFvs4PxFhQf0I1qCkgv0/zW
         krz42L2x8K+I3QccY+uJtKZhkziE/26gckSeOrz/WT9i0CeX8/G9PWWnEzPUyBmSxEHR
         3mVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=nrrOdBSglOcwc85QEPbyeeoGCPengTnNdMy+0E35hk8=;
        fh=HXy6ZJaIrx7UwTgJLa3BjIxTzlTOtvumwDcA4u1utOk=;
        b=PRwt3KC83fKvpt/LbD5fC4JZ3uEizVFZBCqRYk99TbRormgpIdX/NSXaTcCpbb/fdl
         Mxaa3LOkMjFHAkTlcijKjJcZQWQUqhRFA3l+MTzNbyKegVXfvPTiwz3TT1yL1iZmwS1Z
         JtKx2CgFNMsjpIQQx1sOSMGAQ60JwFNJZc5EsCNHCi5IrCo0PbDTP+Byn7LDNoJRB3LG
         HkZkEA3BmMsczAVw4s713MCnSPtPPs8SQTTgmDhEhdwDUubAqvdnj+Z6fXSCmBihuA8T
         2bgt5XjOMxYHL8OOYAomgLf/MlYNUJLWzdXgK9D9zMzs//yTxAV+q8N5eGZWIkx/g1aB
         2cyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Z53YVjeM;
       spf=pass (google.com: domain of 3ei2czggkc28fzbfgnsntbbtyr.pbznyrk.oraarryvaneb.bet@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3EI2CZggKC28fZbfgNSNTbbTYR.PbZNYRk.ORaaRRYVaNeb.beT@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3EI2CZggKC28fZbfgNSNTbbTYR.PbZNYRk.ORaaRRYVaNeb.beT@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-425651ecd85sor26667315e9.0.2024.07.01.04.03.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ei2czggkc28fzbfgnsntbbtyr.pbznyrk.oraarryvaneb.bet@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Z53YVjeM;
       spf=pass (google.com: domain of 3ei2czggkc28fzbfgnsntbbtyr.pbznyrk.oraarryvaneb.bet@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3EI2CZggKC28fZbfgNSNTbbTYR.PbZNYRk.ORaaRRYVaNeb.beT@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831824; x=1720436624; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nrrOdBSglOcwc85QEPbyeeoGCPengTnNdMy+0E35hk8=;
        b=Z53YVjeM2VIyNLTjNIRy+R3q2URRUiLAPeqcd+o4/crhmBhTMquh8mejyher1w6dNc
         dFoSWxQ8DzpyFzyTv3X8OEjVjHJSMdtqH6wybe3NLyf+YcbXjH3HwIbgW8SwCTGi448N
         Gh7uzHcRiKD0Ye5C+lVqNljFmY6JxbVBI+PO2MEC5lSDA6fmSxgJD2gLCqwrFVsGLT8d
         GoIpfFH/8m18uUbcHfgHn46Ma3NqtNvGGnMuxTd1ngd2GQE9zOEWgKtHUwG6mfPJ04h3
         60apufM9pRSwbybYvef/N4db1H8kIIXBv51W4rRTRePtdOh3FoakfKxPO4KQbC7pRV8L
         uuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831824; x=1720436624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nrrOdBSglOcwc85QEPbyeeoGCPengTnNdMy+0E35hk8=;
        b=KlcTI/HDpWL5QzaWDCuYduryuzYhWeecV2gRgozPG5HR5FBNd6SenTsq3trtM1adfu
         ZRqGMH4Sa+svHVBDe2LoS3xukc5yRiKvOOOO9okAg+OGv4p5X+D6zWP/z+SlhYp9tbDF
         GBo0beGf3rO+jt8KCjSUBfZx3JBL94HIbYXfmfdwugaOMBc7+3YTtBwKewFhygWmnpW5
         pxp3F8JEGGKUvp//J+bfoOvZJrQ+ioWYzBKLLcn8hSpfAYmqEKnxmvjvFwQG+ASrJtux
         nPdk/9ofDsOv7kQifAXEzllRByBpc7y0L63O9Y5Y93a6nlKNYe2QDxwEUhekIuo5uFzu
         J5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVxx5bz/xV3JLtfPZ3n/kK7aWwKzf1X/+eHlBlGEMavvj37KxzuZ7plncu1FnLD/wXk/emAKBsR2+nI6AjxhJOo/zrUFNKX
X-Gm-Message-State: AOJu0YztuRtFb3iGNOS/a7JjUUfQuVqNbe8k+ltEZ95nDYcblPG9oz4M
	1d8iVyEhWhlM/tfU5qc9M1aQ+IoA0huSsXlrAgBYP95DNOcXk1CiZK/Elu66tJnOJeQZVoQkp2a
	UfSTkf48TqA==
X-Google-Smtp-Source: AGHT+IFr9vjH7vIkUsu0vMpKSKV1Di9Zz2iiIrHiCMq1gFCJkl4CaaVXQVd9oV7aCNRCTvsFXBNDWPD8zOZh1w==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:4f06:b0:425:7ac6:96f5 with SMTP
 id 5b1f17b1804b1-4257ac698dbmr244115e9.0.1719831824275; Mon, 01 Jul 2024
 04:03:44 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:38 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-17-smostafa@google.com>
Subject: [PATCH v4 16/19] hw/arm/smmuv3: Handle translation faults according
 to SMMUPTWEventInfo
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4xRcEQ5ZM7Z3

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
index 36eb6f514a..6c18dc0acf 100644
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
@@ -919,7 +920,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             event->u.f_walk_eabt.addr2 = ptw_info.addr;
             break;
         case SMMU_PTW_ERR_TRANSLATION:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_TRANSLATION;
                 event->u.f_translation.addr = addr;
                 event->u.f_translation.addr2 = ptw_info.addr;
@@ -928,7 +929,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             }
             break;
         case SMMU_PTW_ERR_ADDR_SIZE:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_ADDR_SIZE;
                 event->u.f_addr_size.addr = addr;
                 event->u.f_addr_size.addr2 = ptw_info.addr;
@@ -937,7 +938,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             }
             break;
         case SMMU_PTW_ERR_ACCESS:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_ACCESS;
                 event->u.f_access.addr = addr;
                 event->u.f_access.addr2 = ptw_info.addr;
@@ -946,7 +947,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
             }
             break;
         case SMMU_PTW_ERR_PERMISSION:
-            if (PTW_RECORD_FAULT(cfg)) {
+            if (PTW_RECORD_FAULT(ptw_info, cfg)) {
                 event->type = SMMU_EVT_F_PERMISSION;
                 event->u.f_permission.addr = addr;
                 event->u.f_permission.addr2 = ptw_info.addr;
-- 
2.45.2.803.g4e1b14247a-goog
