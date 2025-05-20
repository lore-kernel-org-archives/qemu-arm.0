Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476124njc;
        Tue, 20 May 2025 05:54:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd1:b0:305:5f32:d9f5 with SMTP id 98e67ed59e1d1-30e7d4f9220mr28784482a91.7.1747745672308;
        Tue, 20 May 2025 05:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745672; cv=none;
        d=google.com; s=arc-20240605;
        b=EP+m6t6b0/Qrg9IzWKFcqviYHTwhJRHzFuGeYMzFQ9zkWvy5t4hl05/x3Rd8OrJsGB
         NI0b88KnIZCvWLMPYG/q2SGW7Juj8gm9tMZed5wBZrLeGTLY+Y1MkVS5OmNlhC5b+dmg
         dBWf3Q2MAlxHvotTkgO4Y/SANdJTDFeBzlHHnB790IZ2Fc7x+HHOzkqGdnYFJ8QYOIhP
         ND4HEQNorIOwrCYJNW5LGz/0jbdkxFVhH9k4NWr+vxnh43SMfJU4UQ23zFibPDb5aSPa
         ipWc2fb24wzrWSwl1OsYWcerrC0yf6HnIOkIrS41IJh80IrNRIbs6Hlk6Y5r8hMyJ8y8
         KOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1G0lGd9H5YB3nSr0o+UY98M1y1yG48dZRtLGwlQiSB0=;
        fh=MkPvhq6mE0zyz61bmwUDuPjXxpoXRhbq5DqWX/tL6R8=;
        b=foVwvNqAKHm8lrnOEh2cWJuQZR8V593oATpGsuXHvioRqW7ASrPHNu99r1h7qw+CCZ
         KSw+HFEkhl6pvUE40gRr18WCC3imPSjdUuzWR/fqeDAyfT3w1i75sx3DoT6/zJI0DCQk
         FQKmKzJlBnb2/2JRmp+bb2wGPD1XZnxRS6QAe77If31y1yOLg/JabwtzVCaBRiRBfyVE
         TY0K4VDiFABew7wtd/zH2o9P7zp/+H6vINorU8OgFO48h+Js6dqwf+NSEVNDrCoDtofi
         Fez7XZD4BW3vz38aFMuSDU/i88cCSMSQf4SqMMt8kAUn72xVnjCwzvQ10sg+/yFa7+MF
         IyaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qi7s1PKN;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e9349326csor6213943a91.6.2025.05.20.05.54.32
        (Google Transport Security);
        Tue, 20 May 2025 05:54:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qi7s1PKN;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745672; x=1748350472; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G0lGd9H5YB3nSr0o+UY98M1y1yG48dZRtLGwlQiSB0=;
        b=Qi7s1PKNc4bndbRv2EMKSG7C2GmRlKdszZy+t+3vyZkizl28PcJkneiGIDARmGtbbS
         c6m4yert+Qt3P3TuY9UXKkmHPEBqOV4ZxebBxwmeixgiT8QbmXCYyWiDhB9BsVa8pqB6
         qB/1N+M5kf5iyNtvM56n1WLMRwMBpI1h7QQLHx2fOUPaTdPUiOaY7YfS/96H/SfQzk58
         7RfRNXAQw/DusHW+Y4iKue+4T0CsgG7W8KtzSoWOHf2nn5JnfiiLJTRVD/OZvhaFIPwy
         GgWqHhgGWA/t6G47IQPrhB40rM+ukTA5UsqH3uajuFxbdaFybKbTbPAitFTrvBXepBBH
         a9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745672; x=1748350472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1G0lGd9H5YB3nSr0o+UY98M1y1yG48dZRtLGwlQiSB0=;
        b=JtIm5uP1k7PFHRjEuV2BLf3FCtL0319L82WJ56G8a+fRvXvHSjMjopmtmRAzO69Q8t
         /33Ddur/KWXS0xa4Oc5C1l8tm8BY/pABgJLVTeqK0CXKoTg/zFNMsGAFBFDn16nfkSKb
         rkBBYHkJozJVCiHC9rf2IGq3bz2Tq8GQKdSK2TpG/t3WVd8u1geZiPFxHpJzUgxQA4Ac
         S1guQXg+1wAbzanT9/GjHhngSFJqufcqcZnRl6mwCuPfcvOzUEhiIFSXMegnxCPR/K0Y
         NXUBMlhX6Y6Qs8nOp0VtvD3ha+2Ssb8lLnZP56iPQIXGS8WV6BYBa1EXUoJqzK59MdFb
         eeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUymk20RQSp6Aqj+mgmSjJXf697P38VAeJS3DwNSEDJSbASozC4WunumPJ8Ri+pkDMI9r1bpVuZu/+1sbhwtQG/xQ==@linaro.org, AJvYcCXmJWsvgozncnqDyd4JhhSdgpCEimoZuskphoc32arBHjBXZNFbrzu04JtKA+3aJW38EJTog1yCeJd64R8Y+EuIs7k=@linaro.org, AJvYcCXniUXWoVUxv9UANKzUMUGD5veDLsFc/Mg1AS1AKW+BHkT0b5hebvuqz+4uCm6uMyGDFjbZnCg=@linaro.org
X-Gm-Message-State: AOJu0YxJuPrxBXbcNbJvDrYBU4ETtaCpcjWyZfoSjSwPZ4RwQIAM17Hi
	iC8s/lsZk6aVXBIMYlwcIEfZinU3yE1HJEkx2lAeczBYiydN108bNjv5
X-Gm-Gg: ASbGncsQr4XOm2LQc+eVag8NtFc18p1dGkcv/ExlKOmGT50QQat9QfvR7dj2yGSe7P7
	NTnZrB5ffRevLGpFDbqibBRzKYjttkoinMQbIcgkLXaULKpK64T+gJUYM1z78wVigpk9scZEE9G
	si5qLe/SOWLl00l9zrLthhPlruIQxRu+UWYO0Eqf5T/800dXPDm/0bI00K8vtgNVV2mBOC6ZWVN
	1Oyxa8jk/Wwqh70sIYcYhnH3TS+Hgw26wGdZDhydIEEJ+tKoAPgl6fcJAzidpahdQRnPsFv7fyd
	OAdQVQWwGDeEnJNxVPqOmdtiqHrqvw45YCcoxWQRUhQQFuFViTpI9tO4LthSGw==
X-Google-Smtp-Source: AGHT+IH5jPj4xy/PBDXM5vca25pM/qZpEeUcxUsvmm+yucQ5nKRbbIWJIY0zAt2Pcv7CYRhywuR8Uw==
X-Received: by 2002:a17:90b:2d47:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-30e7d520bfemr28537283a91.14.1747745671552;
        Tue, 20 May 2025 05:54:31 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:54:31 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 24/33] tcg/wasm32: Set TCG_TARGET_REG_BITS to 64
Date: Tue, 20 May 2025 21:51:26 +0900
Message-ID: <8e72ec7b0735c14a2359e95606373ac1ade5a33e.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Qgh+hHgfKhah

This commit enables to Wasm backend to run as a 64bit backend with removing
TCG_TARGET_REG_BITS = 32 macros.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32.c                     |  5 ++-
 tcg/wasm32/tcg-target-reg-bits.h |  8 +---
 tcg/wasm32/tcg-target.c.inc      | 69 +++-----------------------------
 3 files changed, 9 insertions(+), 73 deletions(-)

diff --git a/tcg/wasm32.c b/tcg/wasm32.c
index 4bc53d76d0..b238ccf6d6 100644
--- a/tcg/wasm32.c
+++ b/tcg/wasm32.c
@@ -370,8 +370,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 unsigned i, s, n;
 
                 tci_args_nl(insn, tb_ptr, &len, &ptr);
-                func = ((void **)ptr)[0];
-                cif = ((void **)ptr)[1];
+                tcg_target_ulong *data = (tcg_target_ulong *)ptr;
+                func = (void *)data[0];
+                cif = (void *)data[1];
 
                 n = cif->nargs;
                 for (i = s = 0; i < n; ++i) {
diff --git a/tcg/wasm32/tcg-target-reg-bits.h b/tcg/wasm32/tcg-target-reg-bits.h
index dcb1a203f8..375feccf91 100644
--- a/tcg/wasm32/tcg-target-reg-bits.h
+++ b/tcg/wasm32/tcg-target-reg-bits.h
@@ -7,12 +7,6 @@
 #ifndef TCG_TARGET_REG_BITS_H
 #define TCG_TARGET_REG_BITS_H
 
-#if UINTPTR_MAX == UINT32_MAX
-# define TCG_TARGET_REG_BITS 32
-#elif UINTPTR_MAX == UINT64_MAX
-# define TCG_TARGET_REG_BITS 64
-#else
-# error Unknown pointer size for tci target
-#endif
+#define TCG_TARGET_REG_BITS 64
 
 #endif
diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index ea9131e6fe..9fad96d0fd 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -30,15 +30,9 @@
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          8
-#if TCG_TARGET_REG_BITS == 32
-# define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_EVEN
-# define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
-# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_EVEN
-#else
-# define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_NORMAL
-# define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
-# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_NORMAL
-#endif
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 typedef uint32_t tcg_insn_unit_tci;
@@ -3083,39 +3077,6 @@ static const TCGOutOpMovcond outop_movcond = {
     .out = tgen_movcond,
 };
 
-static void tgen_brcond2(TCGContext *s, TCGCond cond, TCGReg al, TCGReg ah,
-                         TCGArg bl, bool const_bl,
-                         TCGArg bh, bool const_bh, TCGLabel *l)
-{
-    tcg_out_op_rrrrrc(s, INDEX_op_setcond2_i32, TCG_REG_TMP,
-                      al, ah, bl, bh, cond);
-    tcg_out_op_rl(s, INDEX_op_brcond, TCG_REG_TMP, l);
-}
-
-#if TCG_TARGET_REG_BITS != 32
-__attribute__((unused))
-#endif
-static const TCGOutOpBrcond2 outop_brcond2 = {
-    .base.static_constraint = C_O0_I4(r, r, r, r),
-    .out = tgen_brcond2,
-};
-
-static void tgen_setcond2(TCGContext *s, TCGCond cond, TCGReg ret,
-                          TCGReg al, TCGReg ah,
-                          TCGArg bl, bool const_bl,
-                          TCGArg bh, bool const_bh)
-{
-    tcg_out_op_rrrrrc(s, INDEX_op_setcond2_i32, ret, al, ah, bl, bh, cond);
-}
-
-#if TCG_TARGET_REG_BITS != 32
-__attribute__((unused))
-#endif
-static const TCGOutOpSetcond2 outop_setcond2 = {
-    .base.static_constraint = C_O1_I4(r, r, r, r, r),
-    .out = tgen_setcond2,
-};
-
 static void tcg_out_mb(TCGContext *s, unsigned a0)
 {
     tcg_out_op_v(s, INDEX_op_mb);
@@ -3242,18 +3203,8 @@ static const TCGOutOpQemuLdSt outop_qemu_ld = {
     .out = tgen_qemu_ld,
 };
 
-static void tgen_qemu_ld2(TCGContext *s, TCGType type, TCGReg datalo,
-                          TCGReg datahi, TCGReg addr, MemOpIdx oi)
-{
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_TMP, oi);
-    tcg_out_op_rrrr(s, INDEX_op_qemu_ld2, datalo, datahi, addr, TCG_REG_TMP);
-}
-
 static const TCGOutOpQemuLdSt2 outop_qemu_ld2 = {
-    .base.static_constraint =
-        TCG_TARGET_REG_BITS == 64 ? C_NotImplemented : C_O2_I1(r, r, r),
-    .out =
-        TCG_TARGET_REG_BITS == 64 ? NULL : tgen_qemu_ld2,
+    .base.static_constraint = C_NotImplemented,
 };
 
 static void tgen_qemu_st(TCGContext *s, TCGType type, TCGReg data,
@@ -3268,18 +3219,8 @@ static const TCGOutOpQemuLdSt outop_qemu_st = {
     .out = tgen_qemu_st,
 };
 
-static void tgen_qemu_st2(TCGContext *s, TCGType type, TCGReg datalo,
-                          TCGReg datahi, TCGReg addr, MemOpIdx oi)
-{
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_TMP, oi);
-    tcg_out_op_rrrr(s, INDEX_op_qemu_st2, datalo, datahi, addr, TCG_REG_TMP);
-}
-
 static const TCGOutOpQemuLdSt2 outop_qemu_st2 = {
-    .base.static_constraint =
-        TCG_TARGET_REG_BITS == 64 ? C_NotImplemented : C_O0_I3(r, r, r),
-    .out =
-        TCG_TARGET_REG_BITS == 64 ? NULL : tgen_qemu_st2,
+    .base.static_constraint = C_NotImplemented,
 };
 
 static void tcg_out_st(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
-- 
2.43.0
