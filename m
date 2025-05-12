Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp45168njb;
        Mon, 12 May 2025 11:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmRFmsvKaXJtHRFaBGOWBZaG3DhKKrHuzGRTjhgpY8w50DHW11OATRHcWCj/FP0hFeKLtV2OOZ36p8UA==@linaro.org
X-Received: by 2002:a05:6a00:17a7:b0:730:79bf:c893 with SMTP id d2e1a72fcca58-7423bc1d336mr21127510b3a.4.1747073338001;
        Mon, 12 May 2025 11:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073337; cv=none;
        d=google.com; s=arc-20240605;
        b=kdZfUB6whbec8F7EHsHopRiUmj9x9nSd/WvsrOtCUaeUkvkNjtHx7YJZzKatQdvax7
         0CGE3iuWuXiKu4e+4OdeGgzXt1ym4KjmfyQk2GJWkZAhM9orCTo3SAjBmSP+sg3PM0Tl
         6xYKuTd8APYGWHxIDD2fU30bcAKc5ziUKvd+380gZX/YEIkfcvE5Ob/L7d6MhSmQ6qOn
         +laNC0nOypaJpJaf7UUk81GWWDNYR/9ZHyrodfyRnbHuDcwYk5SZVrAfeTKDQEtam0DH
         rqkeIuwRPW92OTzlFVkbhBGreMul74rmLAJYSLm1EMWjDQN6qMtjO0fvVlFa9tojNRRY
         yC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZWI42H1mGpC+qtJnGTlft49SFGxWloHLdh6QbAbdhzc=;
        fh=Pw+zHK/HHtSpPbyIrEPSaROuGqfXJ/TSHS8Z+Y0o35Y=;
        b=d75jsQHKXo+fFwA4w4nMrrBWTOVzzLRGhbA0trDddvzSnKBXHxjsP1HhCD42UlVTFd
         9vchkodTSRkG1h6KsbkKq453VAqfayDTz8DkHEYDtriBRWzhQ286M9/4/W0MXuqhNfki
         ROQhZfWPaulxnzD9LRZ9VxUGaDD0JRD40RKG7TI9Ho5Z+bvEzP55YE57W6kb2OBy/6/q
         ehKbdbu1EUhPA7GwNWA+w+tA8NhhNJRkejiL9PFeptBmVmdtarnpQCeGtpZ/QaYzabxQ
         mDMVn7fOeLKYz8C5TKJq6ajm462+Bf24OVU5VAQuTbc6DvOROPOKSBzZsVIi8aKsjjx4
         ZfhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mdumgkry;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7423cbc138fsor3230001b3a.1.2025.05.12.11.08.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mdumgkry;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073337; x=1747678137; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWI42H1mGpC+qtJnGTlft49SFGxWloHLdh6QbAbdhzc=;
        b=mdumgkryaGWts5aXNnnJI29vSEYkQPtu5ucKBI1jNaE353O2KsSt/3DOiT31vwJsdo
         NKjT6yOuvgEqgOWz0AlDvXNiKjW6/u8BQe4WAbx6v81R/EsJXjDrK5ynlpgHGU1pLrnT
         ZNR1kJd/NKhrtb/vaOClEFlhMctQjDtLFvI/pws3EIqvgPFQXY1YojMkxjd2hFuiwoTE
         JSaxKjsWTW7udNp3UgLCNu0H/u/1bRAiXpBA7zIMhxfyHk6EqXHj/pcdHoR1H3JEr/pm
         Ld2T/NR2/LyzMk0+Imv0rkI79ZDh5n2Ut0vPi7FNlT4kzYDKrZT4+ZSWH++DGcOMkDLR
         w+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073337; x=1747678137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWI42H1mGpC+qtJnGTlft49SFGxWloHLdh6QbAbdhzc=;
        b=GFWCLOzOYasU/0Qf/5R/e0wnGjyLomCGzrbu5w2EBdfEf88u/+pndX3OxdhQJXHDUw
         H7KPlpz0NjVu6NsBKyZpKIIh1OsJQF9lNvNry3griZxyvao11lJqkcdmIi9fM5V1pAnx
         y0labIu2B6F1MH7pHKQjSAlUUfm5JK8/Q+LmYNdVQoL1ibtzVyDJDBK/IQqo0qDY61wX
         K6JUghwbzWvb5YFmCFWw2QyW4hQPwp8xPmXs6I4ZXu+gwnU5mScP+dZW8+WoCtYDQixm
         HWntQniU1b/sKu1fAt5lfGbOIX2DyPFalD7lZ0fA6TSoZScWCs8tFCvuS2qnWZtM/gCA
         5YPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEvWnxH3Px6F/HZLLrBt/j+wBkmG67+NhMSm1//iQWUDMxNCiMdni/FXQxyEZOq8EYEnFb4nLJ+mzmDQ==@linaro.org
X-Gm-Message-State: AOJu0YxqvnCwdvkbQqwBHQzl8iHO6T+FfmVPeIRyYfOA6xKG/dfzlwxu
	6fNbN2r+JotGqnnVRQpgHa8ZQIltT/qJmEZddd8Xi2p7Ftlsig+QUurr0YZg6nyisQ==
X-Gm-Gg: ASbGncv9lTueygn4hTvG/CqZS5JLMV4PTS+HUZmEHqwU03rpaqH4yQAhOw/Tzzc1g9M
	BuXK/d7MbkZYfHQqho71lP0BGSMRQH6Kx6S87X/ggHNfnYD1FWT6+0lViU4RgPgEAOEgY/kVun0
	ptKu7l3mvUpRf2wFjurhoOWHYZs1ZF1HSEI+BHeT3oC/rEd8eX/88igB4qvRbSPfDO+qS4Gbh9T
	/gFdnme6V9kty8LamsNPT3qF+JhePZGw9VEdb+cElst3nSwYsykn5z2quMcbjPD4ra/jntWvrbY
	b3ODaWUvkRsOYHERR7tC5uL+Ks7tCDRlknoqbidl+kH22tWcXa0=
X-Google-Smtp-Source: AGHT+IHtnl15XBTtEr1mY8dLt6bXrBUqTmVSSEupohhsnj2Dz63VmmRIZJFm31uUpKt4D1dkYmWtPw==
X-Received: by 2002:a05:6a00:23c8:b0:737:9b:582a with SMTP id d2e1a72fcca58-7423c087158mr22392781b3a.24.1747073337534;
        Mon, 12 May 2025 11:08:57 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705499sm6438580b3a.33.2025.05.12.11.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:08:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 46/48] target/arm/tcg/tlb-insns: compile file once (system)
Date: Mon, 12 May 2025 11:05:00 -0700
Message-ID: <20250512180502.2395029-47-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2Qbr63BmbpW5

aarch64 specific code is guarded by cpu_isar_feature(aa64*), so it's
safe to expose it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/tlb-insns.c | 7 -------
 target/arm/tcg/meson.build | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index 0407ad5542d..95c26c6d463 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -35,7 +35,6 @@ static CPAccessResult access_ttlbis(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
-#ifdef TARGET_AARCH64
 /* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBOS. */
 static CPAccessResult access_ttlbos(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
@@ -46,7 +45,6 @@ static CPAccessResult access_ttlbos(CPUARMState *env, const ARMCPRegInfo *ri,
     }
     return CP_ACCESS_OK;
 }
-#endif
 
 /* IS variants of TLB operations must affect all cores */
 static void tlbiall_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -802,7 +800,6 @@ static const ARMCPRegInfo tlbi_el3_cp_reginfo[] = {
       .writefn = tlbi_aa64_vae3_write },
 };
 
-#ifdef TARGET_AARCH64
 typedef struct {
     uint64_t base;
     uint64_t length;
@@ -1270,8 +1267,6 @@ static const ARMCPRegInfo tlbi_rme_reginfo[] = {
       .writefn = tlbi_aa64_paallos_write },
 };
 
-#endif
-
 void define_tlb_insn_regs(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
@@ -1299,7 +1294,6 @@ void define_tlb_insn_regs(ARMCPU *cpu)
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         define_arm_cp_regs(cpu, tlbi_el3_cp_reginfo);
     }
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_tlbirange, cpu)) {
         define_arm_cp_regs(cpu, tlbirange_reginfo);
     }
@@ -1309,5 +1303,4 @@ void define_tlb_insn_regs(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_rme, cpu)) {
         define_arm_cp_regs(cpu, tlbi_rme_reginfo);
     }
-#endif
 }
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 49c8f4390a1..5d326585401 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -34,7 +34,6 @@ arm_ss.add(files(
   'mve_helper.c',
   'op_helper.c',
   'vec_helper.c',
-  'tlb-insns.c',
   'arith_helper.c',
   'vfp_helper.c',
 ))
@@ -68,6 +67,7 @@ arm_common_system_ss.add(files(
   'iwmmxt_helper.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'tlb-insns.c',
 ))
 arm_user_ss.add(files(
   'hflags.c',
-- 
2.47.2
