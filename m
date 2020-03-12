Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087102lfc;
        Thu, 12 Mar 2020 12:42:25 -0700 (PDT)
X-Received: by 2002:a17:902:b40f:: with SMTP id x15mr9918380plr.82.1584042145519;
        Thu, 12 Mar 2020 12:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042145; cv=none;
        d=google.com; s=arc-20160816;
        b=pIST+DLw5mbj+eZHRakpXz4caDXB5TB/iXVXZm85ZoqQxrqK27+tjD0LDfJjsEVFZz
         B08i0tEKrT+jQViyj2mYhXlVn9FkvJQkvC8aQS9Z3Bj3jJPJN2URRwioBs5uoMmQi2kU
         Kq4boRM6THh3PUcdo6Unea1YVuXBHPcyhIPkEC/CRw/q79lSa2+OoQWlb4zm5scrHseK
         xRRQgKt1DXK+nklYyDfJYyzwcWLKhkJ9S47NhoS1ZcCYfdR874FdGjY5+/gP5V8s0YLy
         JkFMCF6MRcxSRHO8Ht9DrhSYHgKYZh5ZvvLovwFdBKeAHj9YVqfv4CFP7P41RH01CwFF
         dteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KU/VVN1rk+40NYMvd20F10ZZXWCOkzDc6Y3oZJm23Fo=;
        b=INAG/d2/KTREcIk6pMwZU1nXoU0Tq4L/MmVz8MZDFiUoMFQ7d05INHb8iM+mZHpF2l
         amQJvWb/NwIvL5kLc4E77kD0sUnkPFF9JO65ngG5qjVOdjCNTMqBMUeYJRvpmgEUzS7U
         W2Ve8tNgi+w3CTbBsNhaukqK8/1rnfK8tDeVlVLT0MLX42/F3i24rP8KhR6HkYIXh0dO
         tjVQETMKorKc1W+YGqYylfqsTHFMRNtlIVIlXvusdaQEUFRQMwg99QYSOeGDDUNPntrQ
         NDZcfxlw8X/BMcN9lOkS7AC1sQ7bpG04dCa1cbChdjTR5UjZLVtUuLWzFovKvR9daIAQ
         LQ+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Cz2ajr5/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id na4sor4788140pjb.30.2020.03.12.12.42.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Cz2ajr5/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KU/VVN1rk+40NYMvd20F10ZZXWCOkzDc6Y3oZJm23Fo=;
        b=Cz2ajr5/QhOAnzaaP6LKFM/3V0FBVWWtBqjbIelavFdcxqV1qnJgcG7tdIVS6WSv9T
         C4NDHG5s254YD00fYJ9ultRocjlZjJF0NUe//z7LgtxCX14jFzS2eggRfCKZzmKx8RsU
         49ibsWAqiaXa+x5hWr7PTQyWi4WuMd3mlcmqYftWf5CqRCg8av1mbyFrWtt76pnSEmWc
         cdR9fK4xrFhl+9JK4OaPicpSsUUckh6jOfL0nBHTWZ5CvD/upDTj336VTyP1qpTax5GN
         tYFhQYge8gIwebyMQg7LP5fOsTyJLrWuEI1k/heKgFxZByjrar28TVLMD3UocDus+oJO
         bnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KU/VVN1rk+40NYMvd20F10ZZXWCOkzDc6Y3oZJm23Fo=;
        b=Dmi54CnuM7yoCcfX6lEZPdwmaifrCHeoyNz2F40ztDE3EHm+TXXWlLMvR/DkGuB9qb
         O1ycOzWK0IV14Q8LSDyUEJxqdUFqZBDnbhzxtzt3wgePDy1TzV+d5bwixuwlA0xXGXBM
         EH46iWTqKEY6s3ABflZUVWvALx6ux3gB8BM/vQFqLf8l8o5cq6iK5WfSCkm5d4O6drCd
         ByRYJlnYzmgvkjcDN7jOMpeYPLuAZYGsI+0HRiXuutFxs5NwhdlyGOupGXCZAcQcelRq
         nCjHI6ev3q1/GItcg2YBEp3vifMXLJHrY8+QCfHxhUkyy6mOwqa4ZU7M5AV5kj8cqsEF
         bmpQ==
X-Gm-Message-State: ANhLgQ0lfNKDseTSH6IHi2yriTjPMYE4GwGbSo9OMgeW6yBakeed3fxP
	vIhL1YtDksQNFDvux3G3qWPI4uIo
X-Google-Smtp-Source: ADFU+vuNYQpVaziTeFLpSohDOCt+7OJpcMgPu1XaeC4O/XKlipx6MtFuJsrVoBWbsleyU39EjPHICw==
X-Received: by 2002:a17:90a:5d85:: with SMTP id t5mr5788826pji.126.1584042144949;
        Thu, 12 Mar 2020 12:42:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 03/42] target/arm: Add support for MTE to SCTLR_ELx
Date: Thu, 12 Mar 2020 12:41:40 -0700
Message-Id: <20200312194219.24406-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MU9xxm1CX/Av

This does not attempt to rectify all of the res0 bits, but does
clear the mte bits when not enabled.  Since there is no high-part
mapping of SCTLR, aa32 mode cannot write to these bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d04fc0a140..97272502ce 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4680,6 +4680,22 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     ARMCPU *cpu = env_archcpu(env);
 
+    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
+        /* M bit is RAZ/WI for PMSA with no MPU implemented */
+        value &= ~SCTLR_M;
+    }
+
+    /* ??? Lots of these bits are not implemented.  */
+
+    if (ri->state == ARM_CP_STATE_AA64 && !cpu_isar_feature(aa64_mte, cpu)) {
+        if (ri->opc1 == 6) { /* SCTLR_EL3 */
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
+        } else {
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
+                       SCTLR_ATA0 | SCTLR_ATA);
+        }
+    }
+
     if (raw_read(env, ri) == value) {
         /* Skip the TLB flush if nothing actually changed; Linux likes
          * to do a lot of pointless SCTLR writes.
@@ -4687,13 +4703,8 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
-        /* M bit is RAZ/WI for PMSA with no MPU implemented */
-        value &= ~SCTLR_M;
-    }
-
     raw_write(env, ri, value);
-    /* ??? Lots of these bits are not implemented.  */
+
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
 
-- 
2.20.1
