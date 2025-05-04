Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756168njj;
        Sat, 3 May 2025 22:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgaEeQ0GELkng98M5h+Vv33tyhHr+dxtj1VE96WdosW7LXoulcvM9Z11v8mfhdGGrZP08vb3r1ZtyrTg==@linaro.org
X-Received: by 2002:a05:6a20:7f9e:b0:1f5:7f2e:5c3c with SMTP id adf61e73a8af0-20cde374c36mr12176048637.1.1746336580740;
        Sat, 03 May 2025 22:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336580; cv=none;
        d=google.com; s=arc-20240605;
        b=bRiIamEfbve42BnjdvXF17y6B+q5vZhlPWVeocg7gvVABik/BkTRFLuVWLLUbJ9i3z
         bTNEpdk3TIk6dBnoQWWm9m+DC3SMuEuUQKl0PhjuO1b5VVfFf4g63FHn0AOOupybbjbS
         DslcUJ5Yu986kCBZXD+npX23Ds/BdG6Tobjm8nn1Yq4/IahFhJwsVphcO3ZGfOy/zuAp
         W6sscF+8g6kzUKDGMC93lsgfuWWV0Xa7UYcYwLkkGcApteOrgQASgkFcSXQoLZspcXR2
         eza7jxW0BFtWq+bEhHFZodWbhSsC4Nl6+yRVP7sxw70bZlJ9Tdpem92I83C/JIZMef+o
         1ipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9WEHgb3PA0pyGgNPS7z7gsuRl+TMt0z9hzrheqBn6Fo=;
        fh=W5I9bX2hqVbe8w9v4Lj7CEOmgpPnO7gxmBtOcC9rf5E=;
        b=MKVHnJTi+DwyDakGOfQh8aNCu2Kyu4jBYz8t2Zh8HEHU1vRE/on8zrFydm4gZbvWoG
         Lcjhs6sdJO4zbxovkk2M+1Z/43/eXCvKpXF9ZLMN4aT8zyZ7cdwxBbCwMQlQantqaads
         P5kcKOS0nnQj8AOYBwQ3xhzXQ//K9kZKb5XuYfsUbKpyes7C1CCgl+hCe3Rxq9DA4R8F
         LdlM9MQUYoQM4JVO7V+qcTdHdB43aSCAcM2M1uw3WrLpVolE4dfxqGNR3AYJ+CA3r0sz
         f9b6pyMOQg3ZvRj/dBrB/gv66pdKRbB6GH8rPqfChm77CHxwzfxw56kibkKyakfCcX/j
         SQSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L96xVEEI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74058d5afd6sor2159357b3a.6.2025.05.03.22.29.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L96xVEEI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336580; x=1746941380; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WEHgb3PA0pyGgNPS7z7gsuRl+TMt0z9hzrheqBn6Fo=;
        b=L96xVEEIDoPS+XtJlpfhOLYzBIUpX6qt/vKlBHmHezLOBgBbDCwue4+9+5CO0Myb6f
         Pqu6Fq8ly8z8/aP26UFT9QeIqXyrlp83DTw7tkXEypeUgh/1ZV/5eF0gzCXiItdEJT/8
         gVxh6Ta/JdsXEvL4TYC13ToWvPygtfRQpI65XOtNIWNwb4neUQtg5/uXhRbsC6vXsS7X
         NLnXDu4uqjnl6EI4Xt61kioJ9kzdrjTDNb/GU6YpkxIn0yDY87PO9ZvCvIkMQrfaRl4d
         6RRNgw1cAxXOUvPHqutJ8OeVU6Zgvmb2Bc0LmopSRs3RzaXFbW64U8cA3gLYlIernvKV
         X5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336580; x=1746941380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WEHgb3PA0pyGgNPS7z7gsuRl+TMt0z9hzrheqBn6Fo=;
        b=YHHhtV7ZKAdTQN52z1SpkEStEkoZ/o6UPzqePa0tFpmxXuymQ29cNGcMNfo3mFU1JF
         18zV0QzAWHJFBavUAobMsQ89iiKW7x8InqzmTnyZi26sfxsI5gvnLOK2cmYmP18qD2vT
         atkDElVSUn7xvK4OO2vYQGHvVGrDMvVeunOk6qb+e8llMY3pyfepcubhMagRs8X0uBcU
         IhN/gMu5FJIC+xgFRHnhAmpoQjrHwEPFIYhsJMNHhQ7K7NgTZHyn8RV6APZca81ZY8TX
         jaWsT/7uYY1YvkElincdoyLaZJ2bX5WGxO5kKaLFv2Xe/uGn8TGPVMpWhbTXxXpwRzlj
         e7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXWf9CQWJoddIsu6cmByATsTpg9JBMdOO34uH9MjhXjWL/47qIRmonrey+NSV+7dn0alG+nXKfdbJ1MvQ==@linaro.org
X-Gm-Message-State: AOJu0Ywv2eBMu0FFedbWzBUrJZumX8kV6ZGe2gXWvW36z1edzg3fK3ht
	wSkDJCjG4doJqPTNAcjrnC7CXvf1owjzTxJuid5pOIBeQu5eTAgzzkKzbNRcK6uxJA==
X-Gm-Gg: ASbGncvLp39X+N3U42gc11eFmE3ynoJSO1Vvg98IkaWmP9QfHoJ/OLkwUfZoOenIIsA
	8dZTaj2IMvrnOk7rpig4AI7PzFK//aY3FcNNwE9RnrhHOc1HKi394ORK+4HrVKZa9NlKMROtWm3
	M6zcnK1A79sPoHyKYE1UI1hleXj37bVcHQJAco98FkD5bY6Z1zfCd/INkGOwfx3GHSXIUtpsYAl
	uJpN5z3fbfXLXm7rQ8PvM5iI9B0mF2nkxeK2J7D7P95oVJpJqYtsXQTMWGyiIIQyhhBdKWFCc1Y
	b9pyrOqiliiz2nfuMuDkV6jQyTnFf7PY/+6weeX5
X-Google-Smtp-Source: AGHT+IFZdCoc3EOd/pC3yget6airBTErnzBtACDv5VxHLSXZtnFHlYBZlNTtgrNT1W+tQ518XpSk9A==
X-Received: by 2002:a05:6a21:c8d:b0:1f5:6d00:ba05 with SMTP id adf61e73a8af0-20ce03ee7a8mr11142737637.38.1746336580375;
        Sat, 03 May 2025 22:29:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:40 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 23/40] target/arm/helper: expose aarch64 cpu registration
Date: Sat,  3 May 2025 22:28:57 -0700
Message-ID: <20250504052914.3525365-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BkWS2rKOdBz9

associated define_arm_cp_regs are guarded by
"cpu_isar_feature(aa64_*)", so it's safe to expose that code for arm
target (32 bit).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
