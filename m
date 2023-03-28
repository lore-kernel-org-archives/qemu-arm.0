Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp53946ejb;
        Tue, 28 Mar 2023 14:25:19 -0700 (PDT)
X-Received: by 2002:a7b:cd10:0:b0:3ee:672d:caa4 with SMTP id f16-20020a7bcd10000000b003ee672dcaa4mr13174136wmj.17.1680038719498;
        Tue, 28 Mar 2023 14:25:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680038719; cv=none;
        d=google.com; s=arc-20160816;
        b=hL5qCyIemTgt4ihu5N/3VjcGKwVHV7NzwRlO/UyXSykVSn/SYGgRK4SSssRU9pYOJI
         U6dL8zNRTs6J5OnzuCXacMXfe8ImnoIROT4072znfQXFPOxyGZIYTbjLTXP93eYZQTGb
         SaGSWD7KORxLNPTFSMrDedh8sAJ73mUY7Y/DQ91GDC0g3eYfAFwyy9cVxpU58USqmc1Z
         1OY3ZqzozQXMAdYHNjzivfYkamZQOc6H3fym1nPMQnQcYODGF2Z2RxYfuIzCe2MeYWYR
         iwHwMyn8JcBs5r89AFHSk1b2mkrrLY+zlZs3qS5swJkhMzs6mL6MnNXOL9g7kKQWM2PK
         riXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=E3L0YvTAg6g+pvqy2IDkXobfjbifgoR5d+5WWMVGSjA=;
        b=Z08UNQFPXoTlP2Ybrdsiv97wgmf40+e3oWwRHM/p/kLvz8R4sRuuhG9uT7ppsGIQcb
         +Z58WpoDLQTQL/0MuQ8JkY8PHd9yfSZ1uQL7NB8d+kXRSnFpI0To3prEkRWvF/NhRYZY
         BDokr1Ch9zWdQZ+wWRXlqTkkYXCdqO1OM3LK4f08mDcVRbNA2Op1ThVXm5NfBIx/b4rJ
         D3m6jPJkXEdCDdBg+zpzXtCJ/K+MDg+gI39MJRCyO/y5Ncxpj5XuqjdnsereYFwlTY38
         HSC0xfRSGslylBkk2lt6wx2ixVVdyQtWbG49oc3YcD2Eh+CTF74IWM3EvwVic1a9Kx+/
         EpLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bv49Li2i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x11-20020a05600c21cb00b003ee737ac055sor11344wmj.12.2023.03.28.14.25.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 14:25:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bv49Li2i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680038719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3L0YvTAg6g+pvqy2IDkXobfjbifgoR5d+5WWMVGSjA=;
        b=bv49Li2ipHy1cMxkX6WHvslBbEPnJ3y9dwwdiLKSpPyJJTgL9ZubdYWhuv8dJISqNS
         3etfsZHTL2Y2BJYQlPF8PHVabyDWQBH0OWesmep62cm6r9FmjSa/G6IpRlwBMc7ToXE1
         QxHTyFSB0TtxsVuxTr3RdQxeZ9wwA+CueZRUdvFn/qWW71Tb0QMArp4pMK4/u7Gc+X5t
         ajqaY3goblqz/v5SkagIf8XvOMigcBmAKQdSF+UclT3z0ivieaAJ2TT/TTD5yaZVLAeL
         n6y38l+ZiYGBSgGgp8B790ehV07C/IAVyyUeT9xSvUiiiChIBVIikKouMVC43ZizKgB5
         kwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680038719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3L0YvTAg6g+pvqy2IDkXobfjbifgoR5d+5WWMVGSjA=;
        b=GJqysbBoODoJFTobk+1xH5ii44xnPxvqyHnLvR8jjcMRfBNNZYenjvQ+IuxRpkhiGN
         0D2iF3sDbXc9fmgJzyPHGDUO27NSH0ZxiEKwNMekyRoXonj3FVRxAf8MxaRNxeBXo5yi
         /6oUzZePeprIIm5mlJPXdDkW6EgyPCVscVEbLyVQW7whgLde5RZ5zWFdp39lWnZN30ze
         Vobe77mGXYN1Xy6cJqigC8uWAmXuyIEY7XUzuLNPjyeaJJf7dfQvmo/bL4yUgz2qIQlU
         ifib88/2idHE5BQT5TvMtER+1a+y5Jiy3frxqm9U8RfKasQnV8dNj/7gj9EasEKP0vBh
         gxig==
X-Gm-Message-State: AO0yUKUgCplCJF6Ri5rXCyD2xFq6C3DPuX98ZuE2Y6VmyErpWrT658k3
	3aRA+WXXiUaNAPSfxlnQj0eHn9pL
X-Google-Smtp-Source: AK7set8WIujXU1AGAEWuXez1uuf9srFnCNMjZgpwikxo9IlRHARBhBgxt9KQvvH2X/nraKe9jOnZ/Q==
X-Received: by 2002:a05:600c:2312:b0:3ee:b3bf:5f7c with SMTP id 18-20020a05600c231200b003eeb3bf5f7cmr13420456wmo.23.1680038719144;
        Tue, 28 Mar 2023 14:25:19 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id m1-20020a05600c4f4100b003ee1e07a14asm13756569wmq.45.2023.03.28.14.25.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 14:25:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v3] target/arm: Fix non-TCG build failure by inlining pauth_ptr_mask()
Date: Tue, 28 Mar 2023 23:25:16 +0200
Message-Id: <20230328212516.29592-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0k8Y8bxS6nSY

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

- Inline pauth_ptr_mask() in aarch64_gdb_get_pauth_reg()
  (this is the single user),
- Rename pauth_ptr_mask_internal() as pauth_ptr_mask() and
  inline it in "internals.h",

Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Supersedes: <20230328133054.6553-1-philmd@linaro.org>

Since v2:
- Rebased (patch #1 merged)
- Addressed rth's comments
- Added R-b tags
---
 target/arm/internals.h        | 16 +++++++---------
 target/arm/gdbstub64.c        |  7 +++++--
 target/arm/tcg/pauth_helper.c | 18 +-----------------
 3 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 673519a24a..71f4c6d8a2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1389,15 +1389,13 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
-/**
- * pauth_ptr_mask:
- * @env: cpu context
- * @ptr: selects between TTBR0 and TTBR1
- * @data: selects between TBI and TBID
- *
- * Return a mask of the bits of @ptr that contain the authentication code.
- */
-uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
+static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
+{
+    int bot_pac_bit = 64 - param.tsz;
+    int top_pac_bit = 64 - 8 * param.tbi;
+
+    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+}
 
 /* Add the cpreg definitions for debug related system registers */
 void define_debug_regs(ARMCPU *cpu);
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index ec1e07f139..c1f7e8c934 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -230,8 +230,11 @@ int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
         {
             bool is_data = !(reg & 1);
             bool is_high = reg & 2;
-            uint64_t mask = pauth_ptr_mask(env, -is_high, is_data);
-            return gdb_get_reg64(buf, mask);
+            ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+            ARMVAParameters param;
+
+            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data);
+            return gdb_get_reg64(buf, pauth_ptr_mask(param));
         }
     default:
         return 0;
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 20f347332d..de067fa716 100644
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
+    uint64_t mask = pauth_ptr_mask(param);
 
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
