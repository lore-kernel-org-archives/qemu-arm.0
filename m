Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200919wrv;
        Sat, 3 Aug 2019 11:48:11 -0700 (PDT)
X-Received: by 2002:a17:90a:2768:: with SMTP id o95mr10399263pje.37.1564858091858;
        Sat, 03 Aug 2019 11:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858091; cv=none;
        d=google.com; s=arc-20160816;
        b=SFEFG7gjMHYayoJLX7Amsjf+2q5YlVUeeaWiz8aITkU5yiwEUChUuUGk3kC1iJWVo1
         c83EeQlA3W03BCnfUxfRO1NRgKNtSPM/F7aGfx4SMHD5EQQ7hru4aBKsf6hrXnz2ri4X
         lD2DPnMOx7fjp8YW1mGxoNIkPh84TaXzrcXX5QJT4uGYBziuYAks7V7qXahVTvE9+nuj
         v42lQFXgU3/kbDBo7keEVpWwZsc+TYGN0fyadc5XhQVMn2kYlEABpwQ+Y12nsnuBiRdt
         UOqI049ScHvFm8Psp2fCMyhJ/cIYz4az9qNs4aHkF6Cxl0/I+6RkrB3O3H4MSJTvtcwJ
         1I0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VC440BcwSuqOKz+Fo7ui0w+dupEF68UzkVylEVc+WDs=;
        b=GnmOokyCHIWRXFzihpBxUPdC+TiYjoWp3hFi7+U+EPG8EiEb9aBb0O9lZDnmR3DEEI
         Sf7j9v/qXDfvVpeOlg7RHb6JZ+9tguv/lJNykBkW2V2zZ9LrE4VmoQNKG6XFK3a9NyjE
         ZqrY/Teipsx8w2fC/ATfdWrVBHaFLHIWPk56GRMShGhoi9e1DENIIeuxmRBhYHQ4loiK
         uvL2EtMVUZHUpFKMS9Hejwe/sA0SFBEOhPo4DyGGnmweh43m+PLCqKAGtbfafsmBlaTH
         Qt3Z+y57S5+gBUajRyWFIhPBfnRgtVkhJ/VOD9koKdLKvqwJza/G3W0Lx9GlzJH3qt4l
         r4cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xYQqIug3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e63sor59985118pfa.50.2019.08.03.11.48.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xYQqIug3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VC440BcwSuqOKz+Fo7ui0w+dupEF68UzkVylEVc+WDs=;
        b=xYQqIug3gmfLrgPuAZoKA+vetM7unvOZ/ZGAnj/U508vBjOOKgPiRgD1Kqn26Kleay
         mnfIK+wozNSd+s4VKGGZldx3aH3FaWGxLPvZSzApdwKxKPn/w3P1WTLmiXsteqysDCl9
         5qMHusOO+bNqRwvYOx5bHMiJTfGTve3JxSHWI5s4Fc/AU/EgdvoZDV1W5lK1Hvt6AJyn
         QjDuCJJieLrHL2oW5lE9Rye5CAhZ1gL07/LDHjywbVZQNj36hHP4+cLTKme9MziVU2eT
         nury2BWc68bWSp+ZCFqKt7H4fT0FRLejKjejROKZDnI2jgExCs0AaBwKMV86gRws5EIh
         ialA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VC440BcwSuqOKz+Fo7ui0w+dupEF68UzkVylEVc+WDs=;
        b=tv/VqrjwLVckYAmSuSzk+MwHrqC647X4bQKzvJTLMqweqm6Ai5ezyTICoYGZtoSFC3
         Aw65bpxMiePH+EvkwO7dQYfpdE+z5pGOCtbe4FvDsr/0sdaQlP5wmlQZIqOvBxygThpR
         CsQAOSl9E+kXfiZ48/eB4/Zfe/0QEq7YMqA1XtCmI1szmJZO36uK4Kt5ZkH83dXlqlFS
         luoP8e3Re7c2Z1itUVZytrEZhAcdTaT3DBYCAb2lKmkjUq2ejWRePQBQmihxeLInrZjU
         M3kgINCpSFm0erL9R0HZsR3v5E6oL0rmzRQk/pMiKPyMNCaboeCJpymCuTksp54uHHmZ
         wdpQ==
X-Gm-Message-State: APjAAAWYMqxBzSpwhFztasf0X1Yaj+giAohMmeQOVIgwTd9iIbpLFmJX
	PH6LkyPCPo39guYzl8BMjG7Fd9oaXOoAjA==
X-Google-Smtp-Source: APXvYqz6lBWZaB/Djz8xzjkNxK72Fp1Nk7R2FXSOlEzz7gtgzwgysoidHM+p/ov4HizfXtY7fvjwfA==
X-Received: by 2002:a62:5c47:: with SMTP id q68mr66933851pfb.205.1564858091413;
        Sat, 03 Aug 2019 11:48:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 07/34] target/arm: Enable HCR_E2H for VHE
Date: Sat,  3 Aug 2019 11:47:33 -0700
Message-Id: <20190803184800.8221-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ILuIJ3o9WFsj

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
