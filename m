Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071218wrv;
        Wed, 31 Jul 2019 13:38:24 -0700 (PDT)
X-Received: by 2002:a17:90a:b903:: with SMTP id p3mr4625108pjr.79.1564605504463;
        Wed, 31 Jul 2019 13:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605504; cv=none;
        d=google.com; s=arc-20160816;
        b=fXFkPUsBrCEjFH6jPl2c61gAPgDMvoH2gsJoh2AvD0rsmDq4DJSkUN4fYSza8OhroU
         DyDRbX19LwxjmQi6FR1PzniJXaf3N+XkyA8rr9is25fw0wPOY716YIGLyTyGrjdu9i8E
         FMAyLo/PovACglgTeCTXo8n94n77evMUAcf7qvAwpXm4JH+Q5Qad4JEq7RkhXgFXLsNs
         uGJE6KFxKUZRXmspygEKm20u7fzMJqKs92XafExTG3i7JNXG7h9XXYwL62T/Cha1AtiI
         oiL6z1snLbntFr8Ei0noWuiOl6clVt43OaSMIX+m47KOZaASNTemAy+yDAQQcUQJx5cl
         IiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VC440BcwSuqOKz+Fo7ui0w+dupEF68UzkVylEVc+WDs=;
        b=NvbQXLZRAvxeMPOwk7D8JcH1nM6lKsGDC6l3/AaR+bUTbbkVwViKkGTBGLXTkPaAzH
         /mXIn36VSTVe4CHZI490IP1zUJkPwNuxvD2u3qVkOUeh4XfWlxXXyYvKw8h8xP9by4Y3
         7Dx06HqK5wQoVE4/LYQ96Xb2UEYma76F1vnssaeVXaKgsgfZRhFKqhA/+SGy7Hiwu3gO
         mlbNjLw1J5Ztoa/YIZgN2Gq3P5O66AQ4263EuAfB54e6aVkpT0RCLNJaNda8VMHcKBny
         xHTHvekqF0DoWzOMb/ymUALSfaS/zHzrmZYYys3CxWFUUDac97aavd9qDTOjJ3AodyI1
         XfqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I9uyMOU3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z23sor50765010pfn.3.2019.07.31.13.38.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I9uyMOU3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VC440BcwSuqOKz+Fo7ui0w+dupEF68UzkVylEVc+WDs=;
        b=I9uyMOU3oEdwC4uca/HtLL2zKp2V2rvHGUrb1UsT+oOlm1DEvz2TAK+0wpTiyUukX+
         BBfUCM+XSFoCKDZwKc0WTIlFyX4mk7eziMk3HgGDslZ3yQTRDf0zrVxE7hldTwZ4q6Zl
         Nwb8wjypqFtUFir+gZ2lbYle8UY09BKUXUxuJbSImbMnzznNPUjkGdOODCOkHwPVv17L
         ZKz5VWjIortAYA6H3X6Vrw73ZG9kbrScFVshp7eSCsM6mc5GSWG3PMhg0+mttZLRmP/9
         OeozOhiGC1hOjujJZz7LAg1mqcjBRxUIe6W5k10hgcsFdxEquKzjsL6ooDvAEqphzXVq
         aUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VC440BcwSuqOKz+Fo7ui0w+dupEF68UzkVylEVc+WDs=;
        b=P+6RJPpSbGBv+phYU34GAxYdCUziOQvngVkFDn6sgT7hrIysgv1ZKDpLgm5xa92D69
         XH7LHSkJFKbxlnZUG/5DhgaaJgCgMS/eVgC1J7gRWNVCA79YvDaCfBUa6dwh1eAOzJpH
         L8mPSimiqf1RBF/40/HzVAqeh6tbuNcz9nPMZtRO3pkrLjphBv58IRfD8g0VVOtd4DPo
         FhTtF8Xq1HIoch6EMYRcfIQFC2SJhOBkKn+YMnbpBTtmzK88/O3+wdvH1QTyLtgqb1Pb
         4uHWqV2ca4jf/GgJz1jBWlGJ2+uXAeSACnGVgsaloRF5MGLbJr/kzWtRonFFsHnf3xpB
         Mjeg==
X-Gm-Message-State: APjAAAXuFqeDjthNn27IR0ilsrXlEDBWpJrVm9LiEjeHpwu193PDyy3e
	d7jb01582bJSCDaDYeYMcmyyo2j1IDOH5w==
X-Google-Smtp-Source: APXvYqxrwIjjz+PLHlGQZcyrMabdgwhqnqTo3z5N8wLK59zia+OByOKST1v4zmMxJUlLtpWwLacpzg==
X-Received: by 2002:aa7:91cc:: with SMTP id z12mr49207441pfa.76.1564605504020;
        Wed, 31 Jul 2019 13:38:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 07/32] target/arm: Enable HCR_E2H for VHE
Date: Wed, 31 Jul 2019 13:37:48 -0700
Message-Id: <20190731203813.30765-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aR15ksicKzIO

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 7 -------
 target/arm/helper.c | 6 +++++-
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e6a76d14c6..e37008a4f7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1366,13 +1366,6 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_ATA       (1ULL << 56)
 #define HCR_DCT       (1ULL << 57)
 
-/*
- * When we actually implement ARMv8.1-VHE we should add HCR_E2H to
- * HCR_MASK and then clear it again if the feature bit is not set in
- * hcr_write().
- */
-#define HCR_MASK      ((1ULL << 34) - 1)
-
 #define SCR_NS                (1U << 0)
 #define SCR_IRQ               (1U << 1)
 #define SCR_FIQ               (1U << 2)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 65e3ffbb43..9a18ecf8f6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4623,7 +4623,8 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
-    uint64_t valid_mask = HCR_MASK;
+    /* Begin with bits defined in base ARMv8.0.  */
+    uint64_t valid_mask = MAKE_64BIT_MASK(0, 34);
 
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         valid_mask &= ~HCR_HCD;
@@ -4637,6 +4638,9 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
          */
         valid_mask &= ~HCR_TSC;
     }
+    if (cpu_isar_feature(aa64_vh, cpu)) {
+        valid_mask |= HCR_E2H;
+    }
     if (cpu_isar_feature(aa64_lor, cpu)) {
         valid_mask |= HCR_TLOR;
     }
-- 
2.17.1
