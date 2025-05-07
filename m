Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95687njb;
        Wed, 7 May 2025 16:46:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3BEJu/N2pMXVEtAdciLFjHX+73J4bOtSXxRouu9HM6GUemdJ+lH0pRbcpeSW6wv/LNkLWynedzcxa8g==@linaro.org
X-Received: by 2002:a17:903:32c5:b0:211:e812:3948 with SMTP id d9443c01a7336-22e85367010mr21293455ad.0.1746661618198;
        Wed, 07 May 2025 16:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661618; cv=none;
        d=google.com; s=arc-20240605;
        b=ehqfDsVscrq1SNByq7AMD/HrBcmzZ5MStwskzdQgE1ojWizmtHtyH5nj/ZiYeLYriS
         EshRDDax/XEa8uwtZplQXmGawVLwO7uEhbPogIV0FkiIgdaKj9ymKqLLSP1nI4Qd+ula
         IAvrg9IShAHcbn5cE69LUC/NjjpIoxuvL1EFsCTSRn/CJIF3WmjWignt2P1DLkt/rp6j
         E1ecx/SG/SHqSzy5aqTNApzT6jFD1r26rzbF/rZGN0b30I5AnbFbJE0IlV1ER0aQzJru
         OuRGfqxen90oITvRwBgCzpnoC7UX6pchQ4Y/aZKJb/pMA+Dw37wtOzdY3C2PcGHmyZJo
         y5Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZWI42H1mGpC+qtJnGTlft49SFGxWloHLdh6QbAbdhzc=;
        fh=bUebTyAlb9bOe1Ufme0LvET1q8txbcX4iDa9AE2Kc+g=;
        b=lWcLpMyKL+Dg5wDjVo7TvTeq39kn0kqzG5xXof8x0fOuHpnvnONtvyKB4ysktFrArJ
         fnYA/vfbJA4S6PTvITzHocTL5gJ6I2PyRCzsgkzqq1GHHTmbtee9V+YihbXyvINdENCu
         5/UO88TlW+AfMyQQKadJ0AsjT6ylogHdGkKdpN51JAjsTQROBnNDd436o4/g5BWYzeYj
         tWj5P6Ss5ZhEy2QibOukyj72meXW5GpDr8PKYAeOzHJ82Y73bWYmv3T3KV2MJOVwbKCr
         j/Dg5jTQl2hrUzNSf0CaFW9bg2/zG9XKimQyTo+RNnEseNmyZqqfOI5NbPEZ0xN1XJtQ
         jAAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Lw2/2oQE";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be749b1sor86048565ad.12.2025.05.07.16.46.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Lw2/2oQE";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661618; x=1747266418; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWI42H1mGpC+qtJnGTlft49SFGxWloHLdh6QbAbdhzc=;
        b=Lw2/2oQE4qvOqdIdUM5D+ksmo7ZduJ+7/Y5V8QqyYITFqKuQLE/GOmz0Q1fxNZ0AU6
         x76XGPwMntYkRTsii0ODvK/JLvDkFbPY5H5/EdFJ7DvbMHduh6Vm+PS9seRvOLpeKTSq
         zkUY+s/8GSKc4P7IY2qLmfQWehWJy+hvgJ9A99uHFQqsVimOyw6rhYqP+XgXcMiUtp8T
         mFrJQPEfJRPzLINDrYvD1k3pC43P8bvERrV85btIbYtCd+lN7WGGKFCuok8m4YmZaRsq
         JAaixuUjqdcsrKCbm8u+ZgT+BOL65t8VcWL6KWlfBv1tiZumZGyh5sqUVu5EeIufG0Rh
         fFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661618; x=1747266418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWI42H1mGpC+qtJnGTlft49SFGxWloHLdh6QbAbdhzc=;
        b=Z9Km4VEk+Mqo7/Ko8cCbRdzWWkemavTRkMprz6BAc/xoYDFiPVGfKDKwtvAfWNfVyB
         lvxflQlBlwA1KErMSUlxtJO/vl9hr+SHzzx8PhSRPv0aJsk0sH1TADXj9VzjTVewXyxj
         IaSywnmMu6smb4hl0H65QMh8m2fwH+8lpLdf2AMEzMgjPsVPC8breRQ2JxbwyrXHi2JW
         ZcBcDGXybLifb2V1Z8rkGU3iaY7/kqhBxjfent6MZCQp93mZmSzSzQDO7XgCROyTWkcF
         0Cpp/y4Dy3qI1AjzDLltKcp9lerrAzuMfUovb4EWozsNJkJ/zkC6FtuplX6dDK2o5c97
         fEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg1aKWAqnxm58r6Jhi+jepayTFXiVeEEJBNa1IwOFGqqA5xrR8ErAug9OTMhul1dHix2fI2V7b1prx1g==@linaro.org
X-Gm-Message-State: AOJu0YyUv4hjNZ7QWQC/AhRC/ttAN1LHIykmlIcHWCEfUidUVF0eQpJt
	wunCrGl1FdqpyhyaByYdTc4rWSMk+jnZJO1YESDUMUiyGcB7Cid/Xrac4VuM3Nv/ew==
X-Gm-Gg: ASbGncsM3EEKMGAUHe8+thuJd7CFG82gRPKZsS6dtgOHyVCRtEUKeFbY7cngD+M+BWY
	t+KD3NcgWjAivGygw4F6IbP6lgOXF6oHk1JDZ1URaHdrjI6DO9M0AmM8FAlvupnlmQGE29fNdk5
	iFDXbCaT7rgWPYcwmb/zbJ1s8VndhyuVqFl7GKOJqw3/qswqhi4UCkrMXX7rznWTJKQe17Rei+Y
	81Wub3c1B4sirW4uqRBX770xrF7sRJ/vEfeI+t5h/hXFwYdX4TQ2K9bAOXB1BQC8BGI7nfoEXY+
	j22GGYCqvGWaa4dcxeEJj2QU24y+U7NyuvuKimsO
X-Google-Smtp-Source: AGHT+IF+9FdcXEjg+vjvcbNJXKTc/SzGzp3tVqidhIc+lSQaQpxF9T3Yy5aNHSF14QdgE/W2bTVreQ==
X-Received: by 2002:a17:903:32c5:b0:211:e812:3948 with SMTP id d9443c01a7336-22e85367010mr21293255ad.0.1746661617799;
        Wed, 07 May 2025 16:46:57 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 47/49] target/arm/tcg/tlb-insns: compile file once (system)
Date: Wed,  7 May 2025 16:42:38 -0700
Message-ID: <20250507234241.957746-48-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8Lj0vjIrQShW

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
