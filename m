Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2652578ejb;
        Tue, 28 Mar 2023 06:31:08 -0700 (PDT)
X-Received: by 2002:adf:f44f:0:b0:2cf:e3c7:596e with SMTP id f15-20020adff44f000000b002cfe3c7596emr11933625wrp.35.1680010268699;
        Tue, 28 Mar 2023 06:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680010268; cv=none;
        d=google.com; s=arc-20160816;
        b=UESQ7lFSBvQ9EtV1qskj/V5dIMNI1gpjiuOQ0FerQdp5ETvb1MJa2csmXJ1Bp9tsze
         rbapGeXaZ2FqqyQAdzhtLFXDoPBmlcwdUYPMe5VbZ2rU+geSzZiJ+FE7bbEdQjdwDuQM
         QDtjGX5H1Tt5y2e498d+SzThifIzby3N0IcobjFcD91aE0TDTs8DtnRgIO5UjDovre5h
         fU23ObZsSckQ3YHvpV7oah2DB1dr5U9TTBOBiDfK4D4z+BqCNmKXoL3hDcoEcn3Kl6ss
         vl02SXawQ63g/LhkTVFsdP2E4IhcSQ/GCKOnW8r3rldBlv1cSjecdRr+cpEKNGT0exxd
         aTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RpHBQbQwV/0NgNdAldoL5xQrOqOCQXGkNEOw37fpu/Y=;
        b=q+k8/j0AgQH7bAu9OayjkMTVImDcvZ8m8BdS41I3sfwU3qxdICvi7zgODY8tmcZ01b
         cg99q4FBeNAeymPXLmYXjLE0tcfr3nip5GxTbFFUFrNwqmUzEnc6So/4xGU5bleF6kWn
         8M2s+VELhzoE7AdzL6cCa8e7w0hyOPBoLNSJeeAt845ezyii8AxActmgu+8lhm6Vr1Gg
         PSaTm0+r5jWlYM992p7vVmPi/dlmWa3zn41uXdKj24w3gGqg/QxxJakAbA/NI4g3f0tf
         JM+M1nMD8GBlAtLX6njrbOrzaa2YGf5HX4fqVCotBWD2g9oNi+S/Zwnw5vEolvhBhrQ8
         Tfsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjBnVEWp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h15-20020a5d688f000000b002daf67768b9sor6687101wru.15.2023.03.28.06.31.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 06:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjBnVEWp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680010268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpHBQbQwV/0NgNdAldoL5xQrOqOCQXGkNEOw37fpu/Y=;
        b=hjBnVEWp873waT3n+FTbt3LDEjNNsjlHMKTcsa5Yw7EuXTPxhK4ieLE8qLXMEShd3N
         rqYCzYlH4Je0J7Zo5M5nkpv5fcQz31Y3LGlY0nE7GytIsLVovVXTVXeyEe8bWHWKarbV
         1Yz/QPmk6ZcPNmceOKbrYfpDyGwKejxSHNBA1wV7t51rvxzmG/QiFeBAiI6erORLh7I+
         cv3OuNG6HiQ9F5rjpfJ6XcrljbkN/I2M5BwvWP1lMlAmv1vFB+oNpRnaldqD2/fNtL5g
         XLnCSRFhGk7AWnuLKiHmZQZMCh9BUHTE6JcTkV2s2wc7YMfg4bWj+LQRyTTpXGRSzcIG
         09tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpHBQbQwV/0NgNdAldoL5xQrOqOCQXGkNEOw37fpu/Y=;
        b=B0euX/Z01k0HC/ntLWEIDY6Z2j3oFXrmOZ5tigh4clxgU41AyfLQYl3BER83uC9NSB
         axucQhI6DBebYQaX5A3QcBrSIrqQi+Zq6feaAsWHkptXL4YKXy++Onbk8fs/Xvr1Pw7V
         2NnIevgxd6xIpaOjYNgT6aq2EDSY2FhAxlKksn1kpBieB8tnCy75ga56Fz+vZYV3YtQn
         yzXjQjmsn7Hfe7VCtlISu3YHg0RdM2+ZXFWZvaP+HYCo4en7WG78L2N/GLaichAHW4sG
         P9GieZoxNVHmxC96x3Wr3um8P+cJ3O358V6BFHIAZm47oeeS3PVTuLNLbKz/gHrWUeSZ
         i37Q==
X-Gm-Message-State: AAQBX9f85yfmL92jcog3BzgIHSVkgeKSN1HdeYXzkSKrkhZz/AVq9QnA
	/DO3rS5NpgcfKlUG+WWxryMH0Lm/
X-Google-Smtp-Source: AKy350ZpZeqOVAwUeVVnQce07pMDfOuvgDYq3HcnXrGqWSBegup0aOz5b26XpvePZ1DFsfz/GMjf6g==
X-Received: by 2002:a5d:4d11:0:b0:2d2:d324:e44f with SMTP id z17-20020a5d4d11000000b002d2d324e44fmr12287363wrt.16.1680010268143;
        Tue, 28 Mar 2023 06:31:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id v6-20020a5d6106000000b002c55521903bsm27530836wrt.51.2023.03.28.06.31.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 06:31:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 2/2] target/arm/pauth: Inline pauth_param_mask() and pauth_ptr_mask()
Date: Tue, 28 Mar 2023 15:30:54 +0200
Message-Id: <20230328133054.6553-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328133054.6553-1-philmd@linaro.org>
References: <20230328133054.6553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MNsHGje/k1Fa

aarch64_gdb_get_pauth_reg() -- although disabled since commit
5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
gdb") is still compiled in. It calls pauth_ptr_mask() which is
located in target/arm/tcg/pauth_helper.c, a TCG specific helper.

To avoid a linking error when TCG is not enabled:

  Undefined symbols for architecture arm64:
    "_pauth_ptr_mask", referenced from:
        _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

- Rename pauth_ptr_mask_internal() as pauth_param_mask() and
  inline it in "internals.h",
- Inline pauth_ptr_mask() in "internals.h".

Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h        | 16 +++++++++++++++-
 target/arm/tcg/pauth_helper.c | 18 +-----------------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 673519a24a..a617466fa8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1389,6 +1389,14 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
+static inline uint64_t pauth_param_mask(ARMVAParameters param)
+{
+    int bot_pac_bit = 64 - param.tsz;
+    int top_pac_bit = 64 - 8 * param.tbi;
+
+    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+}
+
 /**
  * pauth_ptr_mask:
  * @env: cpu context
@@ -1397,7 +1405,13 @@ bool arm_generate_debug_exceptions(CPUARMState *env);
  *
  * Return a mask of the bits of @ptr that contain the authentication code.
  */
-uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
+static inline uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
+{
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+
+    return pauth_param_mask(param);
+}
 
 /* Add the cpreg definitions for debug related system registers */
 void define_debug_regs(ARMCPU *cpu);
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 20f347332d..c78dafda4e 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -339,17 +339,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     return pac | ext | ptr;
 }
 
-static uint64_t pauth_ptr_mask_internal(ARMVAParameters param)
-{
-    int bot_pac_bit = 64 - param.tsz;
-    int top_pac_bit = 64 - 8 * param.tbi;
-
-    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
-}
-
 static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
 {
-    uint64_t mask = pauth_ptr_mask_internal(param);
+    uint64_t mask = pauth_param_mask(param);
 
     /* Note that bit 55 is used whether or not the regime has 2 ranges. */
     if (extract64(ptr, 55, 1)) {
@@ -359,14 +351,6 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
     }
 }
 
-uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
-{
-    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
-
-    return pauth_ptr_mask_internal(param);
-}
-
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber)
 {
-- 
2.38.1
