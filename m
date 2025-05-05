Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779809njj;
        Mon, 5 May 2025 16:24:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWp5ewGv2d4WfNrqy7q/VmKiOSlYsX4ucGKXOq9xVokyPLmrsdhiLnFpP5TdhZQvBG1mfIQT3Gsczq9g==@linaro.org
X-Received: by 2002:a17:90b:3c87:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-30a6196f08cmr16013486a91.2.1746487455590;
        Mon, 05 May 2025 16:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487455; cv=none;
        d=google.com; s=arc-20240605;
        b=TdQw19NxxuwVnbxD9/9KwCDrnnhYDSFbLg5oGygyBLll+FY67PLIxIq9NvBVA8UXHu
         f9JqdHnGq5J/ShlmsAx4HnYw8s317A6OA7XleByxJgpJ5lkr1a0Nemx2QtHNb5nXx3fz
         VudWpUc/lFghTV4+RF9A1+CFp4lgtbcRru7XG2+RJE2vb2JmsS7dGt9a1TFmXWicmneX
         V01mM/GAjoBgDxVYmkUCXVpP5QhimkrlQZKB1eZLxcFAc5b6qy8HR1YupzkaCU6WBhGy
         Whuz2lVqjNY1y36A3bDCodvgG6O6zYeuQ1wcNW0LWXojic3jTEhLklx3dVymFf/5ztyV
         URqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZWI42H1mGpC+qtJnGTlft49SFGxWloHLdh6QbAbdhzc=;
        fh=tdAAoHhxVX+eScTyu0821HwAFIYDR2AwhcLqbY9qDds=;
        b=fvc+37EiEGGhrqU0250m3YXuXmSo+TIYAE15vCbVAZ3ai1rRgQK4hYJLULWDthv7y6
         e8SoQU4PNBxm1LmAMgEY8AEVApumnasiJXOcMR83mwDHK31eSUzK7Sm+rjValH5CVmmh
         eb2rL07YKjP7wNUuNid8T9vdl9vl80p5doh/3FUEFOc2JoN6A+T8wiUD0r0RNw9AXBR9
         dccFROWEi5E4BPV5dTlvAQC8isr/ncWqHxGUA7XlvV/vjkLVjd6MeTBR0KpqBUTRwhZi
         fgLZ/VxTIhC7bvtwz3m4EEURC/h6n5jKSb3A9cDGrRO+7oAj99DwqaUGQfPZtQKIqHQ1
         WD1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dHcFtCv3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc86c50sor57326935ad.13.2025.05.05.16.24.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dHcFtCv3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487455; x=1747092255; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWI42H1mGpC+qtJnGTlft49SFGxWloHLdh6QbAbdhzc=;
        b=dHcFtCv3bLatJHuCPb76Rn5NjwiBwz4Gadq+rnRkcavsUOl0vsrQO6i6hHVkOhyaNN
         zxovwocSL3hajzMp9jxRrdATlcngmaJwYramqGibEu8IeOXmwf24VbrWnKIh9SSQfmok
         D54NBYKGvDSrO0o/t2uwqoe41SzfA1QBVT5vLsyFWewc8llqtHWjnq9v1Y3Yz3IxeuEq
         7fTA61L6HEq43AJmzvV78WA8SFu9XjPgxigwGsPJT+EnpCMCYs7qbo7wlPhsmoUkLaNU
         wK1ze8Hj44Ee2/R2MfUMC40wCeHJ3jQ6yeuUeRejAyZaRRn/jkrQPNGbsllHLx7GwGoV
         G31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487455; x=1747092255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWI42H1mGpC+qtJnGTlft49SFGxWloHLdh6QbAbdhzc=;
        b=X1hdeahOux0/CAJdd/qgtC3F0+uoy7e+NrHlpxKNJVKVGlITVVKczgPd8R9RarcwpR
         LHTP08B41kmU7MZbuw0grCQJGye7cv5I4zzGIQjdU6spyQHAJsryJTNaWOPSTqsA0hpU
         wKBnAX8aXx+CQeb6xeS8SJNW1Fbs/faqfd5Osu4YCNVlJgHsJmTufY4EeTA9T5TDiT4r
         mt+04aaiWzsTpicnKnAOGz761SvRfn+qm6IK8Q9l85IsehIfnPKTuZlLXM4s0G3ws92R
         BWYTgnZQZ3lDeIZpZRHIwn1nPeruujmmx98nkGp8fifD+CK6Xbb0kx+e0ImYfV/+hfcF
         PrPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbSg21ec3XjG8y5bYEGfKTTJfXjQ1iqwNXWesviyrNoG8oL3HOQ6Xz+WfKxEDZYWiXmLwt12luKJemIg==@linaro.org
X-Gm-Message-State: AOJu0YysGnBBlewAOVBJqDF0po9oVUt4K/ROtyvccnkuYi0S+vEGIJkR
	TyAqzuCcPKiU4zwamJKLsUosWxEAg9CPFax3uOy4l6xIOariMn2qcRao2+RU6TrWUQ==
X-Gm-Gg: ASbGncv0k0D1JlSlFl+/e7RxDHRUihBr8oLbEPjixQAxQLCBIlJDLDhFaPZbqeze7sT
	dRgxYuh2sOYt+asLFVLUJSrnV5DaGeelqUbf+7tfQDWDSWa8JAQm/J2hNKEeABW1Y8TOZp/Vzdg
	du+4GmQCNmzS2K+CxIpY/JqatNZHCtMjcRPA1XiC6N/jkM29Ub8BLGvhIg8jMZ+qJQYvKvPFR8z
	LqawZDtQzgpm5qEa5UOkA9Uxs+z+z6f11cwm+LXkow1Hm2Cq73xF1r7Q+1GI1h1qbz45vv0jcj2
	J0P/ZT37pE6NFJryiIybbxznS2uJzrPdkRrLK+4N+Hca/0MrBII=
X-Google-Smtp-Source: AGHT+IEUQQFAnhHZvpgEW269JjynFC74SxQHriC0mVPlLRJAjytrepF+TKFERHIHr5qYzSkqIHY0bA==
X-Received: by 2002:a17:902:f14d:b0:22e:37b8:7972 with SMTP id d9443c01a7336-22e37b881c3mr6291595ad.10.1746487455166;
        Mon, 05 May 2025 16:24:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:14 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 48/50] target/arm/tcg/tlb-insns: compile file once (system)
Date: Mon,  5 May 2025 16:20:13 -0700
Message-ID: <20250505232015.130990-49-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: r3ucfaPFSs9t

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
