Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475377njc;
        Tue, 20 May 2025 05:53:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4c47:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-30e7d5bb6a7mr2809078a91.33.1747745587381;
        Tue, 20 May 2025 05:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745587; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4EyJSe1RuLntutNpHgsJqi8+kRDBw0gt3GX0eW3LcucrGSnuH2NFD64bADHCGjkB4
         +HSHxDyMcEaumAvA/5LBm6TEtF5wx+zKSEJbRny1ePP3hjWEOMdoNuPlZjyJxK1sVh7F
         k2iQQ7HkdrSZhN3I2j3jEhkcQTQjKk4pAk/i7kY64GSDp42GkL7EzPRlKFzqR4f+wCv6
         xDH0wmVv7iHTYPWTWr2QP53O5/+nH9b2VqDX2v6Qr3dk8iRAXbW7L02NFJ5n1Wa6H8TP
         1t2EKrCBwFeGxkuXTUcPr9tPoqQQbcRxSfyyDUCWtz4KbQcjwehiNE9mhe1fgkv8MteH
         YmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GOF0U/wy86P4v/Jfdj/dCcLnbz7PDbEdix7I3iArBFY=;
        fh=d42D303XxL1HmlLB+61jvhvM1Hybg83jWx960QnSH14=;
        b=B0a9lLTrOzoWHWznMXFUEaBn3YFU2X6IQ9uNBVf9WyfolrsMi34wNWzNYolcBjhRoV
         PlynrNb3UL51LYdjvWsk1bwz7eLk3JnPIn+0cK/kch+2dJuIEd2ZmalkMeteh2qqkOYj
         bR2Hlrg0DyaziBRZznjg22RzSkPRmESl85YX2QsHl54zIJgh3SL18IaCSQOyrLGX3rtO
         wMWrFPThbxAwBh9zq2OPftSFM/k/DBU+isIO4uuVVw26+PnGmp+leKe3yfAjdHKZ3i6u
         mfgUv8/LaO6qJZ+cEkyZhqn94ianJOpDUvabjJGkDPrloUi92QgdKCazaetmlI/Q/Y7s
         8WCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QoqAETa3;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e823fef7dsor4719781a91.7.2025.05.20.05.53.07
        (Google Transport Security);
        Tue, 20 May 2025 05:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QoqAETa3;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745587; x=1748350387; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOF0U/wy86P4v/Jfdj/dCcLnbz7PDbEdix7I3iArBFY=;
        b=QoqAETa31E9GTfTfWFOwb2pwJay8whnuZPvrlYhs5L7h4k6Mc+NcmdbiLu9rjsKM5+
         DrX53w+JnB6gWoEuAMhr2qX11q4HT8YKmhAMdLx2H0QnhFVsJseZC3n2hhhNzTs9hMxA
         m2F0Q3A3hdWYzE01NP8ezvF6HM+odC7dnGhObmG+AQ9haFEKSFy83hC9nXKR/s/S2Gn0
         f2mYjR0n7qPG+cdSyyZGK3Nb9e5YMJP4Si/2H/HXAXgPJrXSs9NWEDIEIYYk3g+mvNcd
         bWyGTLdKMfsQZutYhrggFxQudwlIkWHvVm7OD2YD5DP6ViuaWwzyB/RU4SlD9F1unMX0
         zsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745587; x=1748350387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOF0U/wy86P4v/Jfdj/dCcLnbz7PDbEdix7I3iArBFY=;
        b=lmV68TOQ8PpTRrIijN6yi3+tzCI7YHM3EL4Owr2ruw2XmpZJ2TUvZXpTeGuVOIPP/c
         NfM9UE8xg43xNrw/WDUFOT766l2OocufdqYSuRC6qrmPxxMlMFL6usZ66wYm/gFC6vGy
         HwjJUdCWfBwYxQy7k7RLajonMqjXlU30k+6JdtGeN/cn+X7E+lL6QPsIGEguQRnibNSR
         xLIgBuEZniEyE7y5Uz6hcaR9Mo7P+WewRNpYFGqIETJ4hwN5pVT8P2c23itaiDnrpsSF
         kMYUvV2nOdcNq0wICLfLoZr70GDff3nzyL8n0b9brSEMz87uBpVKI/irsuoGqgLXDnMJ
         nP6A==
X-Forwarded-Encrypted: i=1; AJvYcCU0va0P05aH9pqFtty8Agdzdemqxik5e0ZDluCTRX3FYKIaxq05LF5ZsWHxpjKv36y2Xoc/QlJ6myr6I8ZKLxoOlw==@linaro.org, AJvYcCUJ24Hp6Ff8TrihXNC7T3yUluCWP5a73xzOJ0n1hijqevxsxvk7w7XjUE0miBrrUX1452htmqc=@linaro.org, AJvYcCUSJ3tF4l3KpB/u4VgY+F3L0TmmRJgUdWmf4vby5ybkzzR4G7bfkcBXYJQwH/+q3kOzp3Gc5tvswRSO0+Sul49MGCk=@linaro.org
X-Gm-Message-State: AOJu0Yy9cDbIzZ/SrHVBREWMHu2cgC/xZLWTquQoaDqOIdENgshESbtM
	31MMjGfcYSTP9iOACbZpEiOKpHXGCtgrVgMb/5VJ0RQxXVfm7hM85HD4
X-Gm-Gg: ASbGncs8fujiWTBMWF/Pvp5Tme1uxTdPsfFS3BwDP+2eHsi3Txpkw5biiz6+2B+cR3P
	Z8AXsij/T9NDcqht9JGBXN3Rp/VYMPiEzpb5cAIB3BvHl27+xdttrkQJlurLJj62McpmDzqTe0q
	SVS4y/8qKrYY0RerTr0jWQ/yt8jl/Snc3nWSDoaDDOLxBZpBtKEtQWGX8NE0cozblQNp4QNg+M2
	8zpJ9FN9JaeXn6minjv5lV5SYbdxfgwuMPORfopVKU/A7KUyK0DTTyV4dhVZmBZmQzW9sRMharj
	dcPih2ga/1u9eyy30OR2AP+tl36fDEnUorKV1rYVnp0ekIJ1WJo=
X-Google-Smtp-Source: AGHT+IF2IdPC31h39sXeDasbK/cNnL9bKcljFz/XsOKGHNbEKDiHJj1SNgrvTkhpjoGGDiOzqccXsQ==
X-Received: by 2002:a17:90b:570d:b0:309:fe2b:306f with SMTP id 98e67ed59e1d1-30e7d5a8b14mr21480941a91.26.1747745586726;
        Tue, 20 May 2025 05:53:06 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:06 -0700 (PDT)
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
Subject: [PATCH 09/33] tcg/wasm32: Add deposit/sextract/extract instrcutions
Date: Tue, 20 May 2025 21:51:11 +0900
Message-ID: <aa5ce80ac6e711f9bdcfc08b75842ad6f4ffcf80.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: H/KyXm3Hb9y5

This implements deposit, sextract and extract operations. The
tcg_out_[s]extract functions are used by several other functions
(e.g. tcg_out_ext*) and are intended to emit TCI code. So they have been
renamed to tcg_tci_out_[s]extract.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 122 ++++++++++++++++++++++++++++++++----
 1 file changed, 109 insertions(+), 13 deletions(-)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index b1ed16ad7a..d732d2f3c0 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -231,6 +231,20 @@ static void tcg_wasm_out_op_i64_extend_i32_u(TCGContext *s)
 {
     tcg_wasm_out8(s, 0xad);
 }
+
+static void tcg_wasm_out_op_i32_and(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x71);
+}
+static void tcg_wasm_out_op_i32_or(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x72);
+}
+static void tcg_wasm_out_op_i32_shl(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x74);
+}
+
 static void tcg_wasm_out_op_if_ret_i64(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x04);
@@ -318,6 +332,23 @@ static void tcg_wasm_out_op_cond_i32(
     tcg_wasm_out8(s, op);
 }
 
+static void tcg_wasm_out_leb128_sint32_t(TCGContext *s, int32_t v)
+{
+    bool more = true;
+    uint8_t b;
+    while (more) {
+        b = v & 0x7f;
+        v >>= 7;
+        if (((v == 0) && ((b & 0x40) == 0)) ||
+            ((v == -1) && ((b & 0x40) != 0))) {
+            more = false;
+        } else {
+            b |= 0x80;
+        }
+        tcg_wasm_out8(s, b);
+    }
+}
+
 static void tcg_wasm_out_leb128_sint64_t(TCGContext *s, int64_t v)
 {
     bool more = true;
@@ -335,6 +366,12 @@ static void tcg_wasm_out_leb128_sint64_t(TCGContext *s, int64_t v)
     }
 }
 
+static void tcg_wasm_out_op_i32_const(TCGContext *s, int32_t v)
+{
+    tcg_wasm_out8(s, 0x41);
+    tcg_wasm_out_leb128_sint32_t(s, v);
+}
+
 static void tcg_wasm_out_op_i64_const(TCGContext *s, int64_t v)
 {
     tcg_wasm_out8(s, 0x42);
@@ -466,6 +503,50 @@ static void tcg_wasm_out_movcond(TCGContext *s, TCGType type, TCGReg ret,
     tcg_wasm_out_op_global_set_r(s, ret);
 }
 
+static void tcg_wasm_out_deposit(TCGContext *s,
+                                 TCGReg dest, TCGReg arg1, TCGReg arg2,
+                                 int pos, int len)
+{
+    int64_t mask = (((int64_t)1 << len) - 1) << pos;
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_i64_const(s, ~mask);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_global_get_r(s, arg2);
+    tcg_wasm_out_op_i64_const(s, pos);
+    tcg_wasm_out_op_i64_shl(s);
+    tcg_wasm_out_op_i64_const(s, mask);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_i64_or(s);
+    tcg_wasm_out_op_global_set_r(s, dest);
+}
+
+static void tcg_wasm_out_extract(TCGContext *s, TCGReg dest, TCGReg arg1,
+                                 int pos, int len)
+{
+    int64_t mask = ~0ULL >> (64 - len);
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_i64_const(s, pos);
+    tcg_wasm_out_op_i64_shr_u(s);
+    tcg_wasm_out_op_i64_const(s, mask);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_global_set_r(s, dest);
+}
+
+static void tcg_wasm_out_sextract(TCGContext *s, TCGReg dest, TCGReg arg1,
+                                  int pos, int len)
+{
+    int rs = 64 - len;
+    int sl = rs - pos;
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    if (sl > 0) {
+        tcg_wasm_out_op_i64_const(s, sl);
+        tcg_wasm_out_op_i64_shl(s);
+    }
+    tcg_wasm_out_op_i64_const(s, rs);
+    tcg_wasm_out_op_i64_shr_s(s);
+    tcg_wasm_out_op_global_set_r(s, dest);
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -677,6 +758,12 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
     tcg_out32(s, insn);
 }
 
+static void tcg_tci_out_extract(TCGContext *s, TCGType type, TCGReg rd,
+                                TCGReg rs, unsigned pos, unsigned len)
+{
+    tcg_out_op_rrbb(s, INDEX_op_extract, rd, rs, pos, len);
+}
+
 static void tcg_out_ldst(TCGContext *s, TCGOpcode op, TCGReg val,
                          TCGReg base, intptr_t offset)
 {
@@ -737,7 +824,8 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
 static void tcg_out_extract(TCGContext *s, TCGType type, TCGReg rd,
                             TCGReg rs, unsigned pos, unsigned len)
 {
-    tcg_out_op_rrbb(s, INDEX_op_extract, rd, rs, pos, len);
+    tcg_tci_out_extract(s, type, rd, rs, pos, len);
+    tcg_wasm_out_extract(s, rd, rs, pos, len);
 }
 
 static const TCGOutOpExtract outop_extract = {
@@ -745,10 +833,17 @@ static const TCGOutOpExtract outop_extract = {
     .out_rr = tcg_out_extract,
 };
 
+static void tcg_tci_out_sextract(TCGContext *s, TCGType type, TCGReg rd,
+                                 TCGReg rs, unsigned pos, unsigned len)
+{
+    tcg_out_op_rrbb(s, INDEX_op_sextract, rd, rs, pos, len);
+}
+
 static void tcg_out_sextract(TCGContext *s, TCGType type, TCGReg rd,
                              TCGReg rs, unsigned pos, unsigned len)
 {
-    tcg_out_op_rrbb(s, INDEX_op_sextract, rd, rs, pos, len);
+    tcg_tci_out_sextract(s, type, rd, rs, pos, len);
+    tcg_wasm_out_sextract(s, rd, rs, pos, len);
 }
 
 static const TCGOutOpExtract outop_sextract = {
@@ -762,34 +857,34 @@ static const TCGOutOpExtract2 outop_extract2 = {
 
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
 {
-    tcg_out_sextract(s, type, rd, rs, 0, 8);
+    tcg_tci_out_sextract(s, type, rd, rs, 0, 8);
 }
 
 static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
 {
-    tcg_out_extract(s, TCG_TYPE_REG, rd, rs, 0, 8);
+    tcg_tci_out_extract(s, TCG_TYPE_REG, rd, rs, 0, 8);
 }
 
 static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
 {
-    tcg_out_sextract(s, type, rd, rs, 0, 16);
+    tcg_tci_out_sextract(s, type, rd, rs, 0, 16);
 }
 
 static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
 {
-    tcg_out_extract(s, TCG_TYPE_REG, rd, rs, 0, 16);
+    tcg_tci_out_extract(s, TCG_TYPE_REG, rd, rs, 0, 16);
 }
 
 static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
-    tcg_out_sextract(s, TCG_TYPE_I64, rd, rs, 0, 32);
+    tcg_tci_out_sextract(s, TCG_TYPE_I64, rd, rs, 0, 32);
 }
 
 static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
-    tcg_out_extract(s, TCG_TYPE_I64, rd, rs, 0, 32);
+    tcg_tci_out_extract(s, TCG_TYPE_I64, rd, rs, 0, 32);
 }
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
@@ -977,6 +1072,7 @@ static void tgen_deposit(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1,
                          TCGReg a2, unsigned ofs, unsigned len)
 {
     tcg_out_op_rrrbb(s, INDEX_op_deposit, a0, a1, a2, ofs, len);
+    tcg_wasm_out_deposit(s, a0, a1, a2, ofs, len);
 }
 
 static const TCGOutOpDeposit outop_deposit = {
@@ -1034,7 +1130,7 @@ static const TCGOutOpBinary outop_eqv = {
 #if TCG_TARGET_REG_BITS == 64
 static void tgen_extrh_i64_i32(TCGContext *s, TCGType t, TCGReg a0, TCGReg a1)
 {
-    tcg_out_extract(s, TCG_TYPE_I64, a0, a1, 32, 32);
+    tcg_tci_out_extract(s, TCG_TYPE_I64, a0, a1, 32, 32);
 }
 
 static const TCGOutOpUnary outop_extrh_i64_i32 = {
@@ -1198,7 +1294,7 @@ static void tgen_sar(TCGContext *s, TCGType type,
 {
     TCGReg orig_a1 = a1;
     if (type < TCG_TYPE_REG) {
-        tcg_out_ext32s(s, TCG_REG_TMP, a1);
+        tcg_tci_out_sextract(s, TCG_TYPE_I64, TCG_REG_TMP, a1, 0, 32);
         a1 = TCG_REG_TMP;
     }
     tcg_out_op_rrr(s, INDEX_op_sar, a0, a1, a2);
@@ -1227,7 +1323,7 @@ static void tgen_shr(TCGContext *s, TCGType type,
 {
     TCGReg orig_a1 = a1;
     if (type < TCG_TYPE_REG) {
-        tcg_out_ext32u(s, TCG_REG_TMP, a1);
+        tcg_tci_out_extract(s, TCG_TYPE_I64, TCG_REG_TMP, a1, 0, 32);
         a1 = TCG_REG_TMP;
     }
     tcg_out_op_rrr(s, INDEX_op_shr, a0, a1, a2);
@@ -1325,7 +1421,7 @@ static void tgen_bswap16(TCGContext *s, TCGType type,
 {
     tcg_out_op_rr(s, INDEX_op_bswap16, a0, a1);
     if (flags & TCG_BSWAP_OS) {
-        tcg_out_sextract(s, TCG_TYPE_REG, a0, a0, 0, 16);
+        tcg_tci_out_sextract(s, TCG_TYPE_REG, a0, a0, 0, 16);
     }
 }
 
@@ -1339,7 +1435,7 @@ static void tgen_bswap32(TCGContext *s, TCGType type,
 {
     tcg_out_op_rr(s, INDEX_op_bswap32, a0, a1);
     if (flags & TCG_BSWAP_OS) {
-        tcg_out_sextract(s, TCG_TYPE_REG, a0, a0, 0, 32);
+        tcg_tci_out_sextract(s, TCG_TYPE_REG, a0, a0, 0, 32);
     }
 }
 
-- 
2.43.0
