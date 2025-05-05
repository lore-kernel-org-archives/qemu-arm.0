Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178825njj;
        Sun, 4 May 2025 18:52:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWw5oqv1i+iGwB8odk66vmL5HuYoYyuNkaEPiOOTzC5gtEER/Drf+JtSDdMgYLB0ju7kTD9Jl5nZQdzFA==@linaro.org
X-Received: by 2002:a05:6a00:e10:b0:73e:23bd:fb9c with SMTP id d2e1a72fcca58-7406f1b24a5mr7970304b3a.23.1746409969673;
        Sun, 04 May 2025 18:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409969; cv=none;
        d=google.com; s=arc-20240605;
        b=TKIty67wqr1ufc3s5DL3CL6NjhTpkVkVYmdD9GR9lpJnqhNTNPL75R5R4YURpqSIEk
         8jUivvjyZaZdLCzwAsao05OsrwjFJbMslBENJpUn/DkUv6Sq43QcElaB75dJUnsrKVa5
         GsRwMD1WLHMuUHbNpkwQhkoXaCoR76W9/JPWRYLsErwXnzeVXYUJlzEWvtgwqLRvQoL5
         G2mKtCKdPV2960uvS8AXuSAW7u6zdX370ndjsxun9GJAubKBfbJn0G0USuEgj+FQ5tcV
         kIFFWmXdCUa03RGdSLm9ADYJPJfzNnDa8MgVWrFU4pHKRKm0I1s5b3cArG+kDVH0gf64
         lCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=p8C01O7GU6PtK/NYVapVL2wa5t0zjMaLo72cjg41Wlg=;
        fh=qKjZmMXwpYM/XOG3sTD4yPWQ5bKCOrVxutflLYm5Hqo=;
        b=ZexGMzeY87o1sjvOtvNIfcKptC1V5QipcsjHajojNh/3Sw0LG7a03fn7zOgp4VgHSI
         LBdrXIXfqDhZ1XcZ5CsQWm0RIWvmw1e1557S0mX2mif2a3CLH+F/yZpdMJijWFs6CkKy
         jjhyhTcVM4b0DEuODrDA7JzFuxr1eBlJyOY9D/Q7lwBS64kbSCeRVRNxI7z9WFdOwLF7
         lKfosDuvt+OJPvkj8ZevZP9l7sMmX9J2qjGWIOi7LkqwrPg3CmlJZfHlOD93hkZuR34N
         qVyiEhHcThOERLcmAKKcYwDQZMIW/LEZQolQNESixd9va53j6FSpzlbWsUW6UzbHuNiI
         jDSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xo+Jy1+s;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f7be2bbsor4096171b3a.6.2025.05.04.18.52.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xo+Jy1+s;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409969; x=1747014769; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8C01O7GU6PtK/NYVapVL2wa5t0zjMaLo72cjg41Wlg=;
        b=xo+Jy1+sE6wbZlbB9/VPSBE3DdHn0xK975G+U7TMPAdLbbruife9wCf3wkK0OFewzn
         uWyZzNaVgdK7HshKde/T18pWQBqP2zsN9Vga9sw2iykTHwX5QdFC+F/PsVNLdYfitrGM
         WWA/JnWMYPghSotvS4xEh/f8GELgtmfcz9VJwoEGLmpy3GnUYHPgtaFbzM/9QuR8eCJc
         NeWncVnnL+MfwWdHVwai3eEkXBuCgeFUfiMl9cXMXytT0QhUsiqXO3C3S93V2fZDga4v
         c4Wmi0tB8tpL/vKj/im2+LmC+U8WZ0i7ugP38B5DVERE4tz1V4gkpfE/fn4KSf71yFP3
         eyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409969; x=1747014769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8C01O7GU6PtK/NYVapVL2wa5t0zjMaLo72cjg41Wlg=;
        b=mbC+pFftcxiTc+rvt0KHJwWamOImDZqrgyNXiyEDvl4MStk1DWz4csBk6wRKpHMWRl
         ez28MViSHPE2fy+8DoeFjN0EFUx42KTR2AiIgAUJM3RCSrf8P/2JyCvXcbcCEpN+Uw1W
         lRFBkDjOxp1cy4/hktOX5orJTkUeXPHXNBrVgdwOr2ZQEWdP1MX4/fTqGhd90v6N1o1M
         BOM+xOQqupW0OiIMzoB15uncH+MSiJPiOIRwxNLMgk6H6Xueq8Hkl28jaaTNRzBcq74x
         xiEuqjfFda/po4TOPZkrMCXBaNvj7GJySGFNacY3KYDbIqciY6cTYeqgrjQW+MkNerqO
         3c6g==
X-Forwarded-Encrypted: i=1; AJvYcCVcjTzHeV7BeSeiztNYdKgCvN+Vs34rm+u7cOHOYWud2IX0g8Jc3fi19GaJHLXZTPrlMgTtOBk4QBh/Vw==@linaro.org
X-Gm-Message-State: AOJu0YyCj7Zef6kEKW3BbesM3atdv4fV9TUSbAIyN02l3gu8EcmftMEM
	nZJ2bAAnTA+w9b/3cvJvSjNr2iCz1dStmFOBXFdAgBWFDjRwS3zoGSpGrfxIIuRPKw==
X-Gm-Gg: ASbGncsjdPtIZz2wH3hhfQs4lCnvh3dPuievh666AJOb5yj93IyF5gCADREe5dx/nAu
	vwV6IADf4DchczUzP4wf6CNMzPEmhnO+b+2hwMwvOaC+HGxJi72HMxFPQpmJVirNa/B1y3kXfft
	Gxg7dwBjNk9i5lB8US65UnRDeIaDaezDbPTM+c5dCtvzRABhNLknxmaGEaasK7JEofDWFOcuRKX
	bDpL96rbnYNAEIs1AoS1ntvOocETAhyfQLfK1g6QflhEmq4Hpcqdk6ekUtN7cFZY57Kv2mf9ACI
	kQfkgD4gBNQpU0wvqHiOPwhrUDkZvI7XmgW9hhoK
X-Google-Smtp-Source: AGHT+IHiEk3UOQip9JYyp7dcUAGKcm8K1pFYoaIR5DOLsapNGpbY+g96PPg3mXrgXS7c1B+8FJb02Q==
X-Received: by 2002:a05:6a20:d046:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-20e966051a7mr7469413637.13.1746409969294;
        Sun, 04 May 2025 18:52:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:48 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 23/48] target/arm/helper: expose aarch64 cpu registration
Date: Sun,  4 May 2025 18:51:58 -0700
Message-ID: <20250505015223.3895275-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5qOnhvOzMeBG

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
index 7daf44e199d..7e07ed04a5b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6590,7 +6590,6 @@ static const ARMCPRegInfo zcr_reginfo[] = {
       .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
-#ifdef TARGET_AARCH64
 static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
 {
@@ -6824,7 +6823,6 @@ static const ARMCPRegInfo nmi_reginfo[] = {
       .writefn = aa64_allint_write, .readfn = aa64_allint_read,
       .resetfn = arm_cp_reset_ignore },
 };
-#endif /* TARGET_AARCH64 */
 
 static void define_pmu_regs(ARMCPU *cpu)
 {
@@ -7016,7 +7014,6 @@ static const ARMCPRegInfo lor_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
-#ifdef TARGET_AARCH64
 static CPAccessResult access_pauth(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -7509,8 +7506,6 @@ static const ARMCPRegInfo nv2_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.vncr_el2) },
 };
 
-#endif /* TARGET_AARCH64 */
-
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
 {
@@ -8951,7 +8946,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &hcrx_el2_reginfo);
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sme, cpu)) {
         define_arm_cp_regs(cpu, sme_reginfo);
     }
@@ -9012,7 +9006,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_nmi, cpu)) {
         define_arm_cp_regs(cpu, nmi_reginfo);
     }
-#endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
-- 
2.47.2
