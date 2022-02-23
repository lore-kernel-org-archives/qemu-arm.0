X-Received: by 2002:a17:902:f546:b0:14f:7b6a:e02a with SMTP id h6-20020a170902f54600b0014f7b6ae02amr1702113plf.9.1645655505435;
        Wed, 23 Feb 2022 14:31:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655505; cv=none;
        d=google.com; s=arc-20160816;
        b=wLRPzPHzCxx3/ijcD7qxipCXe+BnDpr+SyEV5pDj62SoHwbd5Oi8GH5L44jE6DX8d7
         e6iNIKia81dLfX4KG0BHs96b8ZNSXsOwLX4HOtoApFGO6y9k8O8GFiQd+7Wo0ehfS82b
         wlFhu/jXUXX9mdo0vxpRP+MwGSf0d9/X54F1+Kmp2BzUT62lbDXG2X4ODEqMHHqoN27c
         IfGXXQDT8RfiGuFSNc1nv9x8Uev4wE8w+7D7I+BeS7qJZk5c+oMcSmG7f9klKj/WRsVO
         +k6ZZU2e3tieoKAP5IlJiCQhyIfJkr8kx9eXe2HPPhm3wTpkZwtD7OJedLhZ1m82aN2S
         CE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
        b=qPpkWB/stK5dFatB/m5J1XzizpinLKuYctZoa6SQPDnX4QFGHLYf2ADWuNRbrmQyhl
         pQbNhsaVo5EC+i3enNjUZ6fdJNhbkq3ZGkJAwwAU2ASNCH7m0E3aSHzo4BxzAiQsgxZ+
         8awqX/ev8HXtT5Vdse96mbK0tbYLDStrarO7HSmsY7gV1cJnIzgySdBxVsHVFfSPWzZP
         WSpehDPoRHZ95v7q3EvaTtaKA9AG3OMv5msB6+A5GWTu7fYKGHu5qEixjUMoUtV2a3sr
         l2ID5nuQY4kOk47TYjeAMGSL6fK67khAZiw3pDR1dQSgycRpLsZVfJxQUXY9bYPFJfa8
         QQ9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mMRtQwqR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e6sor1307821plx.93.2022.02.23.14.31.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:45 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mMRtQwqR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
        b=mMRtQwqR+JIHKhxGCA+TZ6Lh4RIplVAtW7d2GOe2aabcU2ObhZz8nFysChL+X81uYZ
         HWxG1Bf7IW7vFrk3yTQm6igrjA8s2+t2b8iGEUjJ9Ndrh1UktS2JBDucZreqGrtciHF9
         t077h2otJGdRO0C6HLeXi2car4sGQKJ7xY1xjENA9oSzNqV6mSxFq9s2imG1OJ+cMTdN
         OOyL2vNQ61SK9HcsHkabx0zrh1OmdoL8s1c8mYP0Ec5oFmefRJ1YcA6leHt8A8lzXdep
         AV4rUJbjhlbxtlkYAbpPEXV2fCzAEYI4W7CWLqaO4q3JXrYG7E3xI/9iA/M/gpzZdyxc
         LmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8FniAxzNq9R5C3PUa8crK2rtgbWJQ/YT25+L7bxil2U=;
        b=UlG+EA6SW13mXLK9K3xqqYgK8ZXjjW5IaIpu4EPtUozWB64S53J6FsFSdJTNmgxRjW
         w8zFMCftOC8dSn+X1c2rOcMjL3bIOoAECcY3eCKlojK53Fjs2Vws1WKOeBN+0qRbP6Pn
         Ot+zxfFUFUmJ7nR758yLxqUe8F9UHe/GPNwlwzqJFg4GowhBGgObkdMkj2M8+V4vmtuD
         zlrZ8c5TXYFhkYOS6KF5xQtSFJm0PNK78c9IvgUlIFIRIStIrPPf/tRC/I8erQSGbofp
         nsHGq5hpZV8mYMaoIsAMrRZbP2jK2FkErBI6CazVOSzJ3ztGzP8H0r6RqFsPLXUC8K5y
         ojhg==
X-Gm-Message-State: AOAM533zV7jNGZkrq3h/xTcmK+LyhPPKJcJtzWrXgQZr9MV33ID2oCKn
	nxAO6v16o2N44EgT6YZFgTOsHAxV3cabRy8I
X-Google-Smtp-Source: ABdhPJyYcA4ug90zs8VD1oXohXbp67GE+oYX9HyhG2qVKKg6rllJgm7PYlttiAJuvsNHPOUAcSuipw==
X-Received: by 2002:a17:902:dcc9:b0:14f:edff:7df3 with SMTP id t9-20020a170902dcc900b0014fedff7df3mr1704151pll.154.1645655504906;
        Wed, 23 Feb 2022 14:31:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 03/17] target/arm: Fault on invalid TCR_ELx.TxSZ
Date: Wed, 23 Feb 2022 12:31:23 -1000
Message-Id: <20220223223137.114264-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: V4w9Sx82P0ci

Without FEAT_LVA, the behaviour of programming an invalid value
is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
minimum value requires a Translation fault.

It is most self-consistent to choose to generate the fault always.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Continue to bound in aa64_va_parameters, so that PAuth gets
    something it can use, but provide a flag for get_phys_addr_lpae
    to raise a fault.
---
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 32 ++++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3f05748ea4..ef6c25d8cb 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1055,6 +1055,7 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool using16k   : 1;
     bool using64k   : 1;
+    bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7bf50fdd76..dd4d95bda2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11190,8 +11190,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi, max_tsz;
+    bool epd, hpd, using16k, using64k, tsz_oob;
+    int select, tsz, tbi, max_tsz, min_tsz;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11232,9 +11232,17 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     } else {
         max_tsz = 39;
     }
+    min_tsz = 16;  /* TODO: ARMv8.2-LVA  */
 
-    tsz = MIN(tsz, max_tsz);
-    tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
+    if (tsz > max_tsz) {
+        tsz = max_tsz;
+        tsz_oob = true;
+    } else if (tsz < min_tsz) {
+        tsz = min_tsz;
+        tsz_oob = true;
+    } else {
+        tsz_oob = false;
+    }
 
     /* Present TBI as a composite with TBID.  */
     tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
@@ -11251,6 +11259,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .using16k = using16k,
         .using64k = using64k,
+        .tsz_oob = tsz_oob,
     };
 }
 
@@ -11374,6 +11383,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
+
+        /*
+         * If TxSZ is programmed to a value larger than the maximum,
+         * or smaller than the effective minimum, it is IMPLEMENTATION
+         * DEFINED whether we behave as if the field were programmed
+         * within bounds, or if a level 0 Translation fault is generated.
+         *
+         * With FEAT_LVA, fault on less than minimum becomes required,
+         * so our choice is to always raise the fault.
+         */
+        if (param.tsz_oob) {
+            fault_type = ARMFault_Translation;
+            goto do_fault;
+        }
+
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
-- 
2.25.1
