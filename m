Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1358461ejf;
        Mon, 15 Aug 2022 12:03:10 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed2:b0:3a5:f177:8a9a with SMTP id g18-20020a05600c4ed200b003a5f1778a9amr4588979wmq.4.1660590190386;
        Mon, 15 Aug 2022 12:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660590190; cv=none;
        d=google.com; s=arc-20160816;
        b=v8v7dJhgRyNwUwML7pVn2zNp8frtdQq6apN+eXRe3CYtMCO8fYrYu2LLmvv/V0JhO2
         POhYe/fSb7JJvlfE9KPo3MfgtFqAJEJAORujAz+/WR6RVgdcuv37ojb0oSIetbzpB2Od
         JDHcecamET4pTvtznRRPszcdFhLyFXxRhiXmQH41Rmza+u/yaCaO1LHX+4DHZFSyKY3R
         8vOf7l+sQzAUyDhCWYVzz1m4jg6yXknnoexmfDBvqIbwvCQH0f3x9JOF0OmDhiaftYMV
         CHBzPwT7Qgl11q4D70dcdDVRBCNteTxfobszKzJiGfJmlURHDN0WmIKm41GpV5pIKCb8
         jkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yL2kCSEaX64Q/NPJAtRoJiqW85LCPcZ6AySZ3J3a/uE=;
        b=Qfr+Bqf/jGPYjtp3jsc8iWe5jI/qbCcyyum45u15FMzlS7/MhJCMwwb2TlOdebtdIo
         BVTwV4eYJAP/gLZRgzhO44GmpkEXrxuYH4rwhIHcKp87tQZsjkBy9KlzkyA+a6OnfmZD
         2dasgzpN4HaRBM4mFEAo49S5M4hYmk0CC4ooYviCVd0SnruJPFsbRLJK1gfS93N0HUrT
         l6pl4/7WxPOzoNe5bwaeLkDZu+d6jI6TSKfmK5IcCqP6Xcgrb5MeTRLKky/SGJIM/dSP
         7/00MKuBW7BK+gghjQA6uAswGJ07FqSWwBieEj7l2WEDziVYeXUBmg4JKZVx3cm9zCr2
         k4GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OrCsM1gB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l28-20020a05600c2cdc00b003a2eac7e540sor2264073wmc.17.2022.08.15.12.03.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Aug 2022 12:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OrCsM1gB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=yL2kCSEaX64Q/NPJAtRoJiqW85LCPcZ6AySZ3J3a/uE=;
        b=OrCsM1gBbnPay5eEdRjbJBP2AlvrnZEpp+mSTgO/wZSFxV6k3MEZT+wNFPoyyAvvCJ
         ZVyZbYwLV521HVBEJML8Ir58Qs43nc7IqnWmkY9/4vXwdgP50CaLtKW4WHM5TJgWkXY2
         1lPNW7FpzR90IqAb7lCsG782CZ/1cKuZvmI9qFo68ih0z1/RmH3FZvvb+G/I9mrDJCV+
         tioZJGijJBXlStK2gb22YdzHdxm9hj1C1CvOZ8csBl5aD4Xql8pfaTMyOK1uBAJQbuU9
         ZZ3V1iIHK8NKYXeKrR0tkmy+9YDv7wPjC0QELHfar3DXdklqdeIEQ33ewgZdK/gwROoW
         YcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=yL2kCSEaX64Q/NPJAtRoJiqW85LCPcZ6AySZ3J3a/uE=;
        b=as87AV881CWPtPaImZf6WLXuSCl4WJz/WGHj+jxqqBbLx9peP0Mzlum7foR/FbgKIi
         4XyJXNOUDXYSE0bQgrmtpEtNzymPnI4dzBxGKHj+mb8uyEQ3MzbkrFUFtrAK+J8Ev6JW
         kJnmC8k9xYp75VCwJAR+1LRvVz3IJGfVdSoucDaW3Nvy6eLl2X9ZOVXEOAxHQ1OW9kPh
         DJZP+G/PLHtW6Wdi0OXfSxYYzv4rdpQIFD7GGkYgcY+EUayq3DAf5O/fPYChmXtj37Ec
         F86kla/q6LI2A6Ul+0Wf+SeVSD7ve7beo1EBB2QUZRxZi+nFRXEz1es5b4S2TCgaqLKN
         WRBw==
X-Gm-Message-State: ACgBeo0uMNzOYZYmVK9X8OKovdDAHYrSzRNC8/1UCKid+2n/2KPbVhlL
	C9BSglyYqmzmWnaHOv+Hkq0Qi5bA
X-Google-Smtp-Source: AA6agR56kkbw3hbHC+j8NpWBmdfafwNZC4mXIeyeG3wHz3D/CrA6Nb6QNvyA6TWFiGIgXK3i7o6U2w==
X-Received: by 2002:a05:600c:4f07:b0:3a3:2277:7064 with SMTP id l7-20020a05600c4f0700b003a322777064mr10859341wmq.181.1660590189958;
        Mon, 15 Aug 2022 12:03:09 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 12:03:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stefan Pejic <stefan.pejic@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 2/7] target/arm: Honour -semihosting-config userspace=on
Date: Mon, 15 Aug 2022 20:02:58 +0100
Message-Id: <20220815190303.2061559-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: zMBSacuMQhxs

Honour the commandline -semihosting-config userspace=on option,
instead of never permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled(), instead of manually checking and
always forbidding semihosting if the guest is in userspace and this
isn't the linux-user build.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 12 +-----------
 target/arm/translate.c     | 16 ++++------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3decc8da573..9bed336b47e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2219,17 +2219,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          * it is required for halting debug disabled: it will UNDEF.
          * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
          */
-        if (semihosting_enabled(false) && imm16 == 0xf000) {
-#ifndef CONFIG_USER_ONLY
-            /* In system mode, don't allow userspace access to semihosting,
-             * to provide some semblance of security (and for consistency
-             * with our 32-bit semihosting).
-             */
-            if (s->current_el == 0) {
-                unallocated_encoding(s);
-                break;
-            }
-#endif
+        if (semihosting_enabled(s->current_el == 0) && imm16 == 0xf000) {
             gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b85be8a818d..54543b7c2a8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1169,10 +1169,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      * semihosting, to provide some semblance of security
      * (and for consistency with our 32-bit semihosting).
      */
-    if (semihosting_enabled(false) &&
-#ifndef CONFIG_USER_ONLY
-        s->current_el != 0 &&
-#endif
+    if (semihosting_enabled(s->current_el != 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
         gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
         return;
@@ -6556,10 +6553,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
     /* BKPT is OK with ECI set and leaves it untouched */
     s->eci_handled = true;
     if (arm_dc_feature(s, ARM_FEATURE_M) &&
-        semihosting_enabled(false) &&
-#ifndef CONFIG_USER_ONLY
-        !IS_USER(s) &&
-#endif
+        semihosting_enabled(s->current_el == 0) &&
         (a->imm == 0xab)) {
         gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
@@ -8764,10 +8758,8 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
 {
     const uint32_t semihost_imm = s->thumb ? 0xab : 0x123456;
 
-    if (!arm_dc_feature(s, ARM_FEATURE_M) && semihosting_enabled(false) &&
-#ifndef CONFIG_USER_ONLY
-        !IS_USER(s) &&
-#endif
+    if (!arm_dc_feature(s, ARM_FEATURE_M) &&
+        semihosting_enabled(s->current_el == 0) &&
         (a->imm == semihost_imm)) {
         gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
-- 
2.25.1
