Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475345njc;
        Tue, 20 May 2025 05:53:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3905:b0:2fe:9783:afd3 with SMTP id 98e67ed59e1d1-30e7d507ddcmr26403138a91.2.1747745581605;
        Tue, 20 May 2025 05:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745581; cv=none;
        d=google.com; s=arc-20240605;
        b=HMhQOERQJjO5/H+O+/mt3P+2Us/WZ12NaTXDsN4l8A9VQeGbQlyRXldCcW9E0tZrQI
         LHz8wBVQFNmZi/DDV6197ViUktaUJisMSbTe1q82NnbpGHQYvaxw8jIjJ3ETCivNHvmP
         MNUQnemNiLykzotwZIoZX0Y6qMb/51hUHzc3RPUbmfywiH7cAbur0MVDGE4As13Hm0E1
         LlIyVOjZ5C238Do0OleD2MTtLm28jCZmRTr24xSmRC6mDKCMTNfPcl9cPeoT9Bnz3NVF
         u5Uj6oOr/GBj8t2uRidV9pWaAMV0/t2zuj/R7Ld7Kmx2msIoWj9JtjKbV4ZJ6/6C/7+P
         4zpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CN+y9XhejQ1H6My7no7RtPqzXKOX9HgjCuOWMfl1Tw8=;
        fh=16G4lUxKBia44xjkQQSOulKwtPp0zDcQp1IeXKVN/f0=;
        b=Sl2oYlFC8A+EuBnL7h573qt4tbj3tRh0c6FbsGPhwVypdhY27Dc/rJHAXS2TiilESc
         K6HUfmIHCJ/p84R6xLBmjCFaz+37//KGlNo6Nu6s1o1jT9Sr/k10uYCmL9UMCf/ZLUWf
         /fFdrNNFc7F9RsXsXe7rZ+Q0zfCBE/0tllUaJkdELbW/lFtu/StSLEIZhMO9MX8VgWLD
         t1dnPH0gg9EnWLinYE+Vy5LrkrDf5Ux55WoLw8ofq7FQlP5jG64SJCULWf80h4+uZoWX
         7wQgwD1tZM6yowZW4JfFNMLJdwFS2c1goS8cxO6VQkHH/6LeCXOmEisXxshdV9Wq2hr1
         wlBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IQBswkuM;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d592086sor6926155a91.7.2025.05.20.05.53.01
        (Google Transport Security);
        Tue, 20 May 2025 05:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IQBswkuM;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745581; x=1748350381; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN+y9XhejQ1H6My7no7RtPqzXKOX9HgjCuOWMfl1Tw8=;
        b=IQBswkuMJqq3gITK+68hww8Pav4rquWkGYkyQQPaQGE4tQzVWPgTzeVZm3UgbeQffW
         WsmDeaoOomTimMFerVI9iZszP05GY+L87yYDY8pqkBlvAomTmdT2NpxF1rhd4gKXyzcQ
         acFSexAfZ3fgB0k9YnadG8krA+Cx8RGroHk9bw+hGfYJcX0UWJle22gVfHWbsSI+tuDA
         ta064xd3BurdGgSvtijBVS8UP6wNMieubxmqRKz9TOQMOyt6Nhp32QF7CzHuhWNOBePi
         mWTupBMHnMCO0cgOc8ypgnpKQpYh0uUUHulkrIvgvrgIfTmGqEcRuE038mTzxJnEt/Ks
         EMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745581; x=1748350381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CN+y9XhejQ1H6My7no7RtPqzXKOX9HgjCuOWMfl1Tw8=;
        b=E6NuV5ErdM97zcU4jVWZ8p/nXnqQaXCorqOJmn7+wfX0BzzyEQDqMi5eOADnDkU1Pe
         IkcWZcihx6ppxHPjy9v694kPN+2uUQOWRY71d5wx8MXG1grvostp7MZ7TYD26GhKuViF
         9YwIGvfC3c6y55Gg3gSIrn4Ua04qtNJa8kGo1pw4i8m0umXiyBopyAHRP6yOhPTwphCb
         c1a2AhII2/Z2xUgm2jmQNH7uzJ4YZvU87udV3ytNwtfL+K9lB+eJDD7NKr5f1ak0GmLY
         Tk27sdh4//StwBFNv8DquXJn+t5oUZK+CbOUOgbyr5AmrOGz5rh3A060/xsXIS/SZYlp
         AWaA==
X-Forwarded-Encrypted: i=1; AJvYcCVXJUODPjM8VGexMvwax4DPu/H9luUT4pvy+VYtNjNYgotlC4CQ63obz5HagVlEGLt9HdqFeh5+V5rQo6dt39tm7dU=@linaro.org, AJvYcCVXxPBkgvhySkwnv59d+PCv/xismPhIjLxKPTHt/iDf6U0+zhqPwr+F0cRi0DjWykKbZNwVPtDtiWW4r3+rEtlAjQ==@linaro.org, AJvYcCVmKe7aFxqCJywWKTpxfS7wz3v6kQJG4S+x7o3l63nfK0HjMfnf/Qw/UdOcKa9LP4WLZZqEobE=@linaro.org
X-Gm-Message-State: AOJu0YxCS5n4gtxJcxcmmtCAa0sX0bSCFb4YPWJGRHt3/UEgfTWmhN9F
	Ez8ULenowT3VAqOqFuDuVUB3hmDtJhWhFkhEpnHrMkcvZwX6SO23zHTCs1apHTH7
X-Gm-Gg: ASbGncvL2ti167epUEHbNi+iqA9k2AKvgaANdVA+0OKmrynRECW/sTXlZjnMLDi61Ss
	cFxTHhEAxemKUJJRAyeBSLSWbXuANi6O6dJATZL5bIvT1PZ09eCYvKtEfwEy3/RDDSNzrYw9C/1
	MN8Bz6rBIiBB2FM8ZZtzaS44AlVyuYyDBTJJ04xo91x3LY3UckSNjZ1/7/t7bqTGHoBPHPboPa+
	M9czI+d8VH437ZBxdcz/mTtFS9bLrRQ84UdcMpUhP+Zv0bbPsr01xhPAtZbG/ccWBdynmD0KRRK
	lNelsXBOCuBEHPgOtqINOJgAdhB5IXMG3tFx+sjRPAjhl2xba6kjC0sD6Fh8vQ==
X-Google-Smtp-Source: AGHT+IHs9HPY+pCVl4LDFEjCRpmaV5LycVby3DD8NvGSExZ1Rp4gMLYFjDp9u1xumNLIdKrLoH5AZA==
X-Received: by 2002:a17:90a:d604:b0:30a:9316:75a2 with SMTP id 98e67ed59e1d1-30e7d52adcfmr27622113a91.10.1747745580944;
        Tue, 20 May 2025 05:53:00 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:00 -0700 (PDT)
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
Subject: [PATCH 08/33] tcg/wasm32: Add setcond/negsetcond/movcond instructions
Date: Tue, 20 May 2025 21:51:10 +0900
Message-ID: <9381168a9d8ea609cba8461a242320c374e2487f.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qZ21sMSuPAjs

This commit implements setcond and movcond operations using Wasm's if/else
instructions. Support for TCG_COND_TSTEQ and TCG_COND_TSTNE is not yet
implemented, so TCG_TARGET_HAS_tst is set to 0.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target-has.h |   2 +-
 tcg/wasm32/tcg-target.c.inc | 136 ++++++++++++++++++++++++++++++++++--
 2 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/tcg/wasm32/tcg-target-has.h b/tcg/wasm32/tcg-target-has.h
index ab07ce1fcb..1eaa8f65f6 100644
--- a/tcg/wasm32/tcg-target-has.h
+++ b/tcg/wasm32/tcg-target-has.h
@@ -13,7 +13,7 @@
 
 #define TCG_TARGET_HAS_qemu_ldst_i128   0
 
-#define TCG_TARGET_HAS_tst              1
+#define TCG_TARGET_HAS_tst              0
 
 #define TCG_TARGET_extract_valid(type, ofs, len)   1
 #define TCG_TARGET_sextract_valid(type, ofs, len)  1
diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index b9f2c9c195..b1ed16ad7a 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -227,6 +227,23 @@ static void tcg_wasm_out_op_i64_extend_i32_s(TCGContext *s)
 {
     tcg_wasm_out8(s, 0xac);
 }
+static void tcg_wasm_out_op_i64_extend_i32_u(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0xad);
+}
+static void tcg_wasm_out_op_if_ret_i64(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x04);
+    tcg_wasm_out8(s, 0x7e);
+}
+static void tcg_wasm_out_op_else(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x05);
+}
+static void tcg_wasm_out_op_end(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x0b);
+}
 static void tcg_wasm_out_op_var(TCGContext *s, uint8_t instr, uint8_t i)
 {
     tcg_wasm_out8(s, instr);
@@ -265,6 +282,42 @@ tcg_wasm_out_i64_calc(add);
 tcg_wasm_out_i64_calc(sub);
 tcg_wasm_out_i64_calc(mul);
 
+static const struct {
+    uint8_t i32;
+    uint8_t i64;
+} tcg_cond_to_inst[] = {
+    [TCG_COND_EQ] =  { 0x46 /* i32.eq */   , 0x51 /* i64.eq */},
+    [TCG_COND_NE] =  { 0x47 /* i32.ne */   , 0x52 /* i64.ne */},
+    [TCG_COND_LT] =  { 0x48 /* i32.lt_s */ , 0x53 /* i64.lt_s */},
+    [TCG_COND_GE] =  { 0x4e /* i32.ge_s */ , 0x59 /* i64.ge_s */},
+    [TCG_COND_LE] =  { 0x4c /* i32.le_s */ , 0x57 /* i64.le_s */},
+    [TCG_COND_GT] =  { 0x4a /* i32.gt_s */ , 0x55 /* i64.gt_s */},
+    [TCG_COND_LTU] = { 0x49 /* i32.lt_u */ , 0x54 /* i64.lt_u */},
+    [TCG_COND_GEU] = { 0x4f /* i32.ge_u */ , 0x5a /* i64.ge_u */},
+    [TCG_COND_LEU] = { 0x4d /* i32.le_u */ , 0x58 /* i64.le_u */},
+    [TCG_COND_GTU] = { 0x4b /* i32.gt_u */ , 0x56 /* i64.gt_u */}
+};
+
+static void tcg_wasm_out_op_cond_i64(
+    TCGContext *s, TCGCond cond, TCGReg arg1, TCGReg arg2)
+{
+    uint8_t op = tcg_cond_to_inst[cond].i64;
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_global_get_r(s, arg2);
+    tcg_wasm_out8(s, op);
+}
+
+static void tcg_wasm_out_op_cond_i32(
+    TCGContext *s, TCGCond cond, TCGReg arg1, TCGReg arg2)
+{
+    uint8_t op = tcg_cond_to_inst[cond].i32;
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_op_global_get_r(s, arg2);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out8(s, op);
+}
+
 static void tcg_wasm_out_leb128_sint64_t(TCGContext *s, int64_t v)
 {
     bool more = true;
@@ -288,6 +341,12 @@ static void tcg_wasm_out_op_i64_const(TCGContext *s, int64_t v)
     tcg_wasm_out_leb128_sint64_t(s, v);
 }
 
+static void tcg_wasm_out_op_not(TCGContext *s)
+{
+    tcg_wasm_out_op_i64_const(s, -1);
+    tcg_wasm_out_op_i64_xor(s);
+}
+
 static void tcg_wasm_out_shl(TCGContext *s, TCGReg ret,
                              TCGReg arg1, TCGReg arg2)
 {
@@ -347,6 +406,66 @@ static void tcg_wasm_out_shr_s(
     }
 }
 
+static void tcg_wasm_out_setcond(TCGContext *s, TCGType type, TCGReg ret,
+                                 TCGReg arg1, TCGReg arg2, TCGCond cond)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_cond_i32(s, cond, arg1, arg2);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_cond_i64(s, cond, arg1, arg2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_wasm_out_op_i64_extend_i32_u(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_negsetcond(TCGContext *s, TCGType type, TCGReg ret,
+                                    TCGReg arg1, TCGReg arg2, TCGCond cond)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_cond_i32(s, cond, arg1, arg2);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_cond_i64(s, cond, arg1, arg2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_wasm_out_op_i64_extend_i32_u(s);
+    tcg_wasm_out_op_not(s);
+    tcg_wasm_out_op_i64_const(s, 1);
+    tcg_wasm_out_op_i64_add(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_movcond(TCGContext *s, TCGType type, TCGReg ret,
+                                 TCGReg c1, TCGReg c2,
+                                 TCGReg v1, TCGReg v2,
+                                 TCGCond cond)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_cond_i32(s, cond, c1, c2);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_cond_i64(s, cond, c1, c2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_wasm_out_op_if_ret_i64(s);
+    tcg_wasm_out_op_global_get_r(s, v1);
+    tcg_wasm_out_op_else(s);
+    tcg_wasm_out_op_global_get_r(s, v2);
+    tcg_wasm_out_op_end(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -1261,8 +1380,8 @@ static const TCGOutOpUnary outop_not = {
     .out_rr = tgen_not,
 };
 
-static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
-                         TCGReg dest, TCGReg arg1, TCGReg arg2)
+static void tgen_setcond_tci(TCGContext *s, TCGType type, TCGCond cond,
+                             TCGReg dest, TCGReg arg1, TCGReg arg2)
 {
     TCGOpcode opc = (type == TCG_TYPE_I32
                      ? INDEX_op_tci_setcond32
@@ -1270,6 +1389,13 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
     tcg_out_op_rrrc(s, opc, dest, arg1, arg2, cond);
 }
 
+static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
+                         TCGReg dest, TCGReg arg1, TCGReg arg2)
+{
+    tgen_setcond_tci(s, type, cond, dest, arg1, arg2);
+    tcg_wasm_out_setcond(s, type, dest, arg1, arg2, cond);
+}
+
 static const TCGOutOpSetcond outop_setcond = {
     .base.static_constraint = C_O1_I2(r, r, r),
     .out_rrr = tgen_setcond,
@@ -1278,8 +1404,9 @@ static const TCGOutOpSetcond outop_setcond = {
 static void tgen_negsetcond(TCGContext *s, TCGType type, TCGCond cond,
                             TCGReg dest, TCGReg arg1, TCGReg arg2)
 {
-    tgen_setcond(s, type, cond, dest, arg1, arg2);
+    tgen_setcond_tci(s, type, cond, dest, arg1, arg2);
     tgen_neg(s, type, dest, dest);
+    tcg_wasm_out_negsetcond(s, type, dest, arg1, arg2, cond);
 }
 
 static const TCGOutOpSetcond outop_negsetcond = {
@@ -1290,7 +1417,7 @@ static const TCGOutOpSetcond outop_negsetcond = {
 static void tgen_brcond(TCGContext *s, TCGType type, TCGCond cond,
                         TCGReg arg0, TCGReg arg1, TCGLabel *l)
 {
-    tgen_setcond(s, type, cond, TCG_REG_TMP, arg0, arg1);
+    tgen_setcond_tci(s, type, cond, TCG_REG_TMP, arg0, arg1);
     tcg_out_op_rl(s, INDEX_op_brcond, TCG_REG_TMP, l);
 }
 
@@ -1307,6 +1434,7 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond cond,
                      ? INDEX_op_tci_movcond32
                      : INDEX_op_movcond);
     tcg_out_op_rrrrrc(s, opc, ret, c1, c2, vt, vf, cond);
+    tcg_wasm_out_movcond(s, type, ret, c1, c2, vt, vf, cond);
 }
 
 static const TCGOutOpMovcond outop_movcond = {
-- 
2.43.0
