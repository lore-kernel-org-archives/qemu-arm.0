Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287702lfk;
        Wed, 9 Feb 2022 20:04:45 -0800 (PST)
X-Received: by 2002:a17:902:e546:: with SMTP id n6mr5460098plf.38.1644465884853;
        Wed, 09 Feb 2022 20:04:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465884; cv=none;
        d=google.com; s=arc-20160816;
        b=BGGLpF9RLKyeufxobxrWdjTRcRHLPkywub7dwskpm91RIfuZ4lWchl24xDd3+FFp7q
         MK+/Grvs2qxaguUWHtj0SK/6CvVX5j/LItw0ZWEZ5TqFxpOWjqLIUGDEbHgw3wjvTiPU
         btpZmsaGpy/BnTDfznilh3ciNtVLg6bo6iJZsQklgUasHW8CwAg2APJwBCKvdo5qiRYC
         d5cn6OG11wm52r13IDBIQ+vK9vWAOxeRFIY9hfZLuC+hXGo5VeGYHnqixLspjYHRa5uO
         I5AE9f+gPjFcTcEAHBErTqjotv7MEYh5uoDQCzG87CqP/Fzs2Y3XfjO0fjsrus7tR3PL
         +yyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hrRLKIw2UploLh3OYXeRorBfG35Au7O6BtUh3Pw46MI=;
        b=XcpVOGzJdQxJJG30YzUswp5T4k52n2BEtM1NrzBL469jlj3W8MfU5qdbd11Inks4u9
         FGtHQ0faqGu4z5Zg/Z4dzl/Lqqk2zwq2iNq6TmBZA3pyOv96glO0Il9xLMXu4JFkek4c
         cuL7U1ZN5hlSitHK6x6FI5A17pKKfuogzjSt/SOaDdqKGlglWvvW6PbzDm7QSyW33HX6
         FxY+HjQT0uE7ZxV09yPt1ZvCbfsA8Ir6HVxbiOaNWgaczslXFtYBJZ16x2YiIXT49U60
         idY1UPtFBeH46WNgiCtGZ9R17LVhWrrH7jD3HvLubUh/FtlKhMKyWPF7K35H2f52vQz7
         pyNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iBi1wrg4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t10sor1602867pfg.1.2022.02.09.20.04.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iBi1wrg4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hrRLKIw2UploLh3OYXeRorBfG35Au7O6BtUh3Pw46MI=;
        b=iBi1wrg4DQGv4B7r5taPRZ3/8W1VV57B/vUAAX7NvlrYXf1bLUL0cbPuJG7r8el9ov
         vvgcD4IdYSqeUPKWnRfXEsOaK5zNFQ5jgCEzjNyDVRxHs1D2VS01qfIbAeR6C20uNnSH
         XZNI9jsspQIPNebsQ38OCtGpwCs6oIZ83aybixWk5DlqJQBI5mqMrQILt/vuOgwQbRAM
         nBZQ8o9oUY/TSHsvldrfKhdlOOQlqjLSaMGgjfcTou8htfMwIl+0ZO5uCDHc8ndmUpu/
         4wacc4u5PUQ9+VekUMCybTZqhnqvbiQ931tM39Bh89U/HZwV8TOOMxAdnquP+nCDe1vL
         30Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hrRLKIw2UploLh3OYXeRorBfG35Au7O6BtUh3Pw46MI=;
        b=qI93QBprDfHneRFJmuFgYRgi1PcOLNdEwvQlr7Y/PmcWUIajMeOckbaKOKsTd+tkxG
         DdC5xTwsKbTohBTolLz1FFB6QC7wNhuRJo+3cUr6GtXsQPUbI1Go3jTK2/tUHkDYldsU
         +b0IqGkaSUCblAjUZKAr1cTeM5e8Ofof0GkxyuZBk/B+VYuaTdShR66ggclSWqcF3lgk
         8FMdjYXe+magsiTsl0uYCQD0tvHTwUFzBPOLK8Xnyuk0PrmpcFvs3N4KzjGL/PAcGftS
         j5sr29WK/kUbugcIZW7VX9PBuEIfYEey0eIaCa7jNRX9fOQRh6oBH2/nd+Fno1Xhnr8e
         YJ8g==
X-Gm-Message-State: AOAM532cs6XdtkyUKWCSxzmrMmginLfXNZvuVbdoRuPqvVMDvJBQ0Auj
	HblfDdep03YDzllnYNWhEvwoI92a
X-Google-Smtp-Source: ABdhPJygVkRQssZ6DGrIskSk9b4mojjSxaH827Koe8+9NAh4Jt+RvGE5gCdpeYolXN5EpRTreiL8RQ==
X-Received: by 2002:a62:b618:: with SMTP id j24mr5792829pff.42.1644465884304;
        Wed, 09 Feb 2022 20:04:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 04/15] target/arm: Move arm_pamax out of line
Date: Thu, 10 Feb 2022 15:04:12 +1100
Message-Id: <20220210040423.95120-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7HZ6+RUjuWCu

We will shortly share parts of this function with other portions
of address translation.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 19 +------------------
 target/arm/helper.c    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ef6c25d8cb..fefd1fb8d8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -243,24 +243,7 @@ static inline void update_spsel(CPUARMState *env, uint32_t imm)
  * Returns the implementation defined bit-width of physical addresses.
  * The ARMv8 reference manuals refer to this as PAMax().
  */
-static inline unsigned int arm_pamax(ARMCPU *cpu)
-{
-    static const unsigned int pamax_map[] = {
-        [0] = 32,
-        [1] = 36,
-        [2] = 40,
-        [3] = 42,
-        [4] = 44,
-        [5] = 48,
-    };
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-    /* id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.  */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
-}
+unsigned int arm_pamax(ARMCPU *cpu);
 
 /* Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 14cc866d8d..fa0824e12c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11150,6 +11150,28 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    static const unsigned int pamax_map[] = {
+        [0] = 32,
+        [1] = 36,
+        [2] = 40,
+        [3] = 42,
+        [4] = 44,
+        [5] = 48,
+    };
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+    /*
+     * id_aa64mmfr0 is a read-only register so values outside of the
+     * supported mappings can be considered an implementation error.
+     */
+    assert(parange < ARRAY_SIZE(pamax_map));
+    return pamax_map[parange];
+}
+
 static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
-- 
2.25.1
