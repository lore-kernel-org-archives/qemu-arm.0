Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397122njc;
        Mon, 24 Mar 2025 21:59:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzLRHIaVdceauh17TpXhsefFXWvARFg1XBtW7stvF7Mnab/cr8Sp6AWcTU1US/kVWqtSfouf1rZ4nIoQ==@linaro.org
X-Received: by 2002:a17:903:22c7:b0:221:85:f384 with SMTP id d9443c01a7336-22780c7bf9bmr217415715ad.16.1742878783474;
        Mon, 24 Mar 2025 21:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878783; cv=none;
        d=google.com; s=arc-20240605;
        b=hcbx/FxZlD0liLP4iCvLxluAGSBbOvDF6RgSVL5E8Zi1aiXMSDpieRNXe9d9JSuyIj
         /Hoj3316lUW9h/iICEG95Fw6wBIu/6zXVv/TYPs4BH8+cbMSmW7UoH2YKBcenIwJtQIX
         1UKrAW5b/dzi4K/QremuBB4Fxpr+U7fjoyPYx0UqXB07whSK4RIQSneCl7uiUED7xqZb
         2GXAHzqeZWXHgK4zFIlFu2/+PqhEL3mXJ+p4enizK7kjrGRn3wwlZpFUESSYRPQ1FgCo
         GqhGvom1dCDg+qIHgo1VMEb2F/y1rA9ZSAmd2KDcagCp06nvsGzl5wPMEAXrG3qwN+A5
         MbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JtusWKYTrMDoHpdfg0nshB8ODIflkcfJFt+VFvekQoU=;
        fh=lCTs/pm2XlnDsHdr51yTseiKPtZl2UreB0G/8Kb/ZUE=;
        b=fLTKCTq1Hit8rFxQuEIMxoNW7H7+ZL1YAkNBaeMDpyX+d/AHzbNkbjAum/a3vGIo7n
         FVtBd+Z/JeyrENhrUkz9kd5zBg/Izm2L4TKyY6XMJNB7nCeZnPVdH3V4BNPZvpuOx0+t
         EgUdbW6nZHu0hCeDMRvPW9wZSwsDFDbt7hbkBWLWFaY/rM7yzf5V5HpA8gREcP46169F
         K9Lg4se40YCbgWB4M1ML1T6jaeqM9ovl2aIoY6+THQsE5YkD2cxmkMB8DK37RFAgs4Fy
         Oh8X4oJLSL54Csn0sZoFPEN8D+iY9DP1q51naxYsn1Cs5t4sahlkp1TQxwS9JR2C/wrR
         gQ/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4SUgKrT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780ee9a57sor59033815ad.4.2025.03.24.21.59.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c4SUgKrT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878783; x=1743483583; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtusWKYTrMDoHpdfg0nshB8ODIflkcfJFt+VFvekQoU=;
        b=c4SUgKrT52v+loSIlZwMpZ2QzXON8GIQZ0kXp4RkgVozp9zonzHGxBR1mrFjuO7bXZ
         P75HTApZv6w4OxEDGFwQqux264SHj3pXKJWRindK3/jYQEtS4YwQ1wSrhc7RZA28w3WL
         QUE0TIHDOjIqjgoajN4vtoylZlJOigNn6IXdr7zQRreUzYvUuNP8P5/X0iP8I+qdZ7yj
         XG9deiIxHbE1U8o1RLCvEjEtXywV/4BQmHPg6z/IQ4qaC3azW8opqVuo432JdgNuIOg5
         yuOzEnDhCY/tD99z+Dv+j1G5i0JmDhZ8Rhsm0SrLu9aiCTO+b4oYNvPojnh8o3ROU2Sg
         WcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878783; x=1743483583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtusWKYTrMDoHpdfg0nshB8ODIflkcfJFt+VFvekQoU=;
        b=bSN81O2serAN9MqlqrY/7zCjw6yJ7GORQlV5+lzZbkyDf0liIKoc1FGERJW56GeEr0
         WzUGw1R84FUl8ZS2usZsn9KAAPmpHjWYSUb2ZMJMbJVAnUgkGeclx9Tut8a3JaTTtVU3
         ZaUbZCfWmHje3VvCcWSTaOYLnZOZeMvzxDhf/o6/rElTNbknFmIW3OCJBcFc6cUL3pI9
         oxW18yW/OQuc1j1yQ19GPMGqOw/ea+3MREJB576PC07gxKhEzXG4g70V+6+tSz98oGAO
         cZ+x8V21+26DF7RQL0YoG0mdyRe7IfdHJdijMTDWJ+nuNp83hCK8ZDUutIYfmbl1+rpA
         kp4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1i5FAnbl5vfE8iW4CJX7FeiFbIozWg+yj0TtcfvnDmc6Ypy3XjRNkIBjIB4KP3j23EVYE7XXPPjw4dg==@linaro.org
X-Gm-Message-State: AOJu0YxPyOEaYKDvRnA67W1gnpUpDuqgmG+fzAknOKzui8hT88W0O4My
	ymwW6VkwjEaZTCBUFpRgd1LLPmFnJJL3kdrcXZk4Q34Nlyf+7tVhPe25s0h5IRVpLg==
X-Gm-Gg: ASbGncs9BbeGFtMvE9lwJKz0yl08dNID+yodIK8Rfr728XgyF3dv/+qMuhrin8hBBg4
	mwuTrLmWlNVsLB5AsBSQvdu93pM1hVSF1GPuiggpySkweOE46h2koiveUDbPMDfUbjRzYmybFBD
	13mtf921D2cpVaiwlrOpmaXmnGaJ8GG2vC2AYH/uVk6jOeSWA1JWQoSzxVM1J2uc+GMAEhZUTSH
	kV7DpbAnOzmkNrbJlWs88xXVjXY4ijvYznE/Kj96vM6J/+ym27Sy8EzctxerxuNZTRV01z5T5sM
	sElk9QBbJFU14hVz6vouGJSaYWNkwYun0NvR655Y+AsucyLBSoaKTPw=
X-Google-Smtp-Source: AGHT+IF7fVNDkEZpxZD3TpaipUefPuzR5blv1e1P/DipQrGSgNSjRKkE8a4ucCi3CcRYcjp1MOK1Kw==
X-Received: by 2002:a17:903:46c3:b0:21b:d2b6:ca7f with SMTP id d9443c01a7336-22780e07919mr289321195ad.32.1742878782353;
        Mon, 24 Mar 2025 21:59:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:41 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 22/29] target/arm/cpu: remove inline stubs for aarch32 emulation
Date: Mon, 24 Mar 2025 21:59:07 -0700
Message-Id: <20250325045915.994760-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BCKF9sMBW3Oc

Directly condition associated calls in target/arm/helper.c for now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h    | 8 --------
 target/arm/helper.c | 6 ++++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b1c3e463267..c1a0faed3ad 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1222,7 +1222,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
  */
 void arm_emulate_firmware_reset(CPUState *cpustate, int target_el);
 
-#ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
@@ -1254,13 +1253,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
 #endif
 }
 
-#else
-static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
-static inline void aarch64_sve_change_el(CPUARMState *env, int o,
-                                         int n, bool a)
-{ }
-#endif
-
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fa23e309040..73e98532c03 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6564,7 +6564,9 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
+#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
+#endif
     }
 }
 
@@ -10648,7 +10650,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
          * Note that new_el can never be 0.  If cur_el is 0, then
          * el0_a64 is is_a64(), else el0_a64 is ignored.
          */
+#ifdef TARGET_AARCH64
         aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+#endif
     }
 
     if (cur_el < new_el) {
@@ -11665,7 +11669,9 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
+#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
+#endif
     }
 }
 #endif
-- 
2.39.5
