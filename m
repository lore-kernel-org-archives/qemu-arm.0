Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19631njj;
        Wed, 30 Apr 2025 23:24:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2waycTDoZR7w7MPM1dazEoO3y/7NlpJg9znxfJvNYftEdnZQp/lPnnI9jcHX/kmXr/OKfawNYhZA4Sg==@linaro.org
X-Received: by 2002:a05:6a00:2e05:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-7404792985bmr2733185b3a.21.1746080650609;
        Wed, 30 Apr 2025 23:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080650; cv=none;
        d=google.com; s=arc-20240605;
        b=KXWsNLsNCzgbRPiM18Fosvqo5lhIdip3dKtDGWhvtr9I2FhI9tlOnv19QJ5kbax2eW
         WdFRxW5Ui2yHR+l5ItQDqPyMsXXsVN1vHTJWIUHAv+AVsbLOrvZsD1Y38b76A3AmDOQZ
         p1eaxfQ7ATImmyDAx6gU7zxCZIX82/kfgFf3bBftrcPrF+qlS7jG7h/UxQIx1NmT2Klj
         /sMohtmf9YEnXMSHA5HtXKBYRBk//wYtDYX2r2J+j2ZrEDOPUFe5m1WRMS/3h2/OK6R8
         tYhZGbdsS8ORrBD7x51kG7uW4YClORhaOwclS8xr02Ohl57i/ca0vQuWCwmxvx9jxqA6
         mTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AIzywu3ug9p30W5eG0L2N1zxQEyM7lznNJHWjTnjaTM=;
        fh=u0z2ndO6Ql+SqIz9VMP877GnSOT8UIQYKY9IgukiEXs=;
        b=SoHBYGDC6lks154JehhGwzvaDeGo5nHjbyuoNMPVZzSyyAfe8vqP7lQ0mbKT0MrSCt
         Fz1e3MLJov323Fpy6niI+p/4aKhuRkSRVjkzYSv/IdI6YPqAhOJngXc97nGfjadvUXJ9
         GJM7CuFg+wMy/L8RfsSVLH6YfiE7nL9K8ltT5rTXMQ7j3SZkA8WZLpy8WtnCy/OqVxSl
         X0u2OhLFI1+rdcr0RPN6qYcvyh5l2nEXPRA3sss3EsXHKwPo/48aVXiRnXz19eZiidqA
         2GeA1t/3yDCB7wmznOEr1fgHV0rLqzUrrXeCihoj+NapPxhm22foiNkLai8BiASrMnOg
         AHgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rs18CvGk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5ab54bsor127111b3a.0.2025.04.30.23.24.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rs18CvGk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080650; x=1746685450; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIzywu3ug9p30W5eG0L2N1zxQEyM7lznNJHWjTnjaTM=;
        b=rs18CvGk9kOMpBeYYvkTvZExACklgl9FbyAUkDgnXJtTBx4SgONEPNeSE/AEeA5dHA
         GwAzCmD4hTV0jRKjB85J1TOLt5yrZL7059hdn13vNN3+DCMR25+0H3jKYcfsUnTu5oW5
         3UfQEMG/sQcoowH7OeoBNURbKudoBzsr2wqbT7a+4K6W3UzrRmnhWuDiZeEMOnUmVgNP
         9zmeg3wZaWAjcVEz0OuPKQVq+PEm4BIGuzsjYkUk0aRhQqjUOTpJFl1NQJLzCH/yCET+
         LgQmekyj3mtrR6xj2BVz5TBgGOlgvneQIAYyS6cHSU6yS2M9p3v8sSdi3HFg2bfMAURl
         IOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080650; x=1746685450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIzywu3ug9p30W5eG0L2N1zxQEyM7lznNJHWjTnjaTM=;
        b=fty4fIi/xzYH1KKqwYhgkNdSp1VsNPKOvajIrlPTE8cUDH6fo043kzqoFdwrDUUA2R
         zeiXq4G+Rc0lyKPDdwh2vJVSjVxYP7ZdTDevT9PxFPU2klJVlxiEnUA11mmotACh1EzS
         Z+2Gh8koPceltKzd7Ynh3VsfuNbuuNZAgMQFSUiMzponyIfLP9iHgXN5xyGm34pMibbv
         uuGLqjRYHkFP3HQzS/umZ2tGe9C+4+lRNYy3cFxpxQcbjNXDTynwa0jsUiNfF51D9f0x
         WfO9vVJhZ0NkawgdlYrcm4NU6wfv/29hVz3jQSWj/JB1nHRG115GP9lkUsIMIbHRLMq2
         ijkA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Kfc9JbA5rV7QY0L3VkqT/nHG8i+4/uNCRHCC+dxaOxSVnAqFCl2pAh9iEIqZeHaQAsJ5MpPqTCA/mQ==@linaro.org
X-Gm-Message-State: AOJu0YyV1cNw+oIFT7af82pCTIO3bAB+rKArUSm+kwzeFrSDaJFz9oeo
	b/EK1yeKejfOwOwRKoe3j0YHduHIp+Mj0KyfBBwHO1usNNprbln5P0dDrZQXXJhxkg==
X-Gm-Gg: ASbGncsI86liAVsUHFld2NaF+Hy/T03lX23gQo9v3+7wtTzIvwL/F6DIu8hzoEqtyd2
	AE7axUPpbkywP0Ap8UT6sSpmwlgwW0WyBUMhqnurSuRuysDMRCA+tJmBsgRIklaiIa6tkxBJ3SJ
	hCRmyooXvpmf3CV7q1ClE6NXHEstZdBdnPEf0FfgeQ85uSbcQdYn7xp48DHl9T7jk193c0WY039
	/1PRQC2DNq02RWpBM3QLnIsc1ER2n+DQL9j0tWVHVlUapoc7lG4UtMIQpO76SVVeny+4cy3ykbr
	Dh9yHzXuh0LcNlf9LRUHT4FLmqr3fkISRWL1dnwj
X-Google-Smtp-Source: AGHT+IGQmTrN7AnDEHnrZ7Y8mTNrNLs1cJ9kxtU929N6mekWZpSbZF3PYXiv0EdYTWvD2uSXI9SPsg==
X-Received: by 2002:a05:6a00:3e1d:b0:730:97a6:f04 with SMTP id d2e1a72fcca58-7404777ec84mr2994181b3a.7.1746080650223;
        Wed, 30 Apr 2025 23:24:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:09 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 21/33] target/arm/helper: expose aarch64 cpu registration
Date: Wed, 30 Apr 2025 23:23:32 -0700
Message-ID: <20250501062344.2526061-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: W9DUxgICSqud

associated define_arm_cp_regs are guarded by
"cpu_isar_feature(aa64_*)", so it's safe to expose that code for arm
target (32 bit).

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 595d9334977..1db40caec38 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6591,7 +6591,6 @@ static const ARMCPRegInfo zcr_reginfo[] = {
       .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
-#ifdef TARGET_AARCH64
 static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
 {
@@ -6825,7 +6824,6 @@ static const ARMCPRegInfo nmi_reginfo[] = {
       .writefn = aa64_allint_write, .readfn = aa64_allint_read,
       .resetfn = arm_cp_reset_ignore },
 };
-#endif /* TARGET_AARCH64 */
 
 static void define_pmu_regs(ARMCPU *cpu)
 {
@@ -7017,7 +7015,6 @@ static const ARMCPRegInfo lor_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
-#ifdef TARGET_AARCH64
 static CPAccessResult access_pauth(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -7510,8 +7507,6 @@ static const ARMCPRegInfo nv2_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.vncr_el2) },
 };
 
-#endif /* TARGET_AARCH64 */
-
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
 {
@@ -8952,7 +8947,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &hcrx_el2_reginfo);
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sme, cpu)) {
         define_arm_cp_regs(cpu, sme_reginfo);
     }
@@ -9013,7 +9007,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_nmi, cpu)) {
         define_arm_cp_regs(cpu, nmi_reginfo);
     }
-#endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
-- 
2.47.2
