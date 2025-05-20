Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475295njc;
        Tue, 20 May 2025 05:52:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5603:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-30e7d53fa9cmr25155327a91.15.1747745575847;
        Tue, 20 May 2025 05:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745575; cv=none;
        d=google.com; s=arc-20240605;
        b=Uzcl2wbctigQBhXJZhq6gSC9/TLV5uO+kaNpTbFvOdcGh+Qbq01pcWfO+HWVScboGp
         +T5fiEfiUF603C0GachOuMmZ/esCHRLExAddgYMC9cXBzsuW2oB8MZO7rTE48iPG7VHS
         rtjUrs5Xd4Db0LoxQL4VjfIgWxYD0qYrocIG0Ud39z62PkJWWDk7zKX2oyqn7M2ytbFt
         zKC/MfgGslNNTdteWtuKk/9iBLpfWTe33on4uYuAwVFHqU+dnOFqxS4IGP2/QlizFNLw
         HSZAClYZSlR1iW1K40FhkZEv51SfzoUhzNufLZ7kJJUtS8Jf91oIAX3qwEsthymOLEsA
         JKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Bns4HZO2Nb4MGLYLQJB6/ZEKS2CSFb3ypYim5fOiTl8=;
        fh=j4/M5D09gh6aY3vQhCA3lFrqNylpehWOqCIQw1fJ2tg=;
        b=d84bmGKA1OcF6ZEms5pxTPin6XOq0bEeMS5agTIQWmJm//1KA1yb7GzOJHxfCXCs3R
         hYWb1KDmCS5ykdMaUsuJ0FPUh4ZKinMxCdTXI61OCcrejYh3QPYuThNWX5QsarLTLio1
         7BQuCSMmo01q56IXHV2X1LUwi2F24UM0D+fDNIwx2zsYQaAWUWDu9f2D8/XrdRcSfWtI
         mcbJ39Dje2kDRWCD+KioUaSHbnWGVcG1oYYc4r/I9am2uxbDg66MN0ZMQ5hE/RIhpAHP
         8onWpzWrInpytLvrzCJYvhrMR81O3R/QCYaSJBrQ97OiGeaBYn7IPrC1swSzx3CTM1wO
         0fHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="VN1n/u5q";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d47705fsor7537041a91.2.2025.05.20.05.52.55
        (Google Transport Security);
        Tue, 20 May 2025 05:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="VN1n/u5q";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745575; x=1748350375; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bns4HZO2Nb4MGLYLQJB6/ZEKS2CSFb3ypYim5fOiTl8=;
        b=VN1n/u5q8zp3WBEFOHvfsrYgw/akRMVNSIlGMSaNagM5LSd3ihNoeU8QxvdxNjewAV
         nrQRwS8XjKn0Bh+HdP92rhOw3tDFzwBwp/DfRgz+JJNLJG7Dc/u17Xug/wYPjJcZk9S4
         /lghyT8Dwdjgzh6PF6gtr/NUXteI0V0zzIJNhBy5XW+u1hN/uPeeTipD7KC5RxKYAVrk
         xy5gIjqEFcLXoBd0vYBzux+2RIS6mc938vTu/vWKSGkV8G8Tuo0c8eDu6y/ukbA6k7Kg
         S0F6wnxrRrXsAHPkElxV/VqZEO6wS7qwybS2Gq1EzbbZq8qnLPKBLKz7IlZrN+vIMDs1
         dG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745575; x=1748350375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bns4HZO2Nb4MGLYLQJB6/ZEKS2CSFb3ypYim5fOiTl8=;
        b=ud4OM56p07GfiVWA5OLA0bKjw3Xmpu0TJFA1euwR/H0Kcy788BOSuC3Wjg+y9qvcur
         dAoIdgQwQRO9N2iuEtdrha+tx76W3sPCn1gLi1NjjSi8TaEyriw4bGzRjvc6r3HehHLB
         YFNLkCnRSXabZUUeME92hoKu+5f9XEIleYXmHFvXui0RfIbWdLkpC2j6bYHdlQmJPe7y
         /RTQTlBAb/AbBUDpnfjlnWUls25wXTC8iR9T8ZLogPVaNYxuw63bZSXshD+/fuhWemWj
         aJ0Pri/Gpn5AJT5qxgH4iznLNqhkiDHf02xby9/qAdwq8L2+DRSvGavuTMSrMplJMoSS
         P7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUYd7Bz3a/LOE0Yf+XEf8ak7I1xFjiohsi0TjoNp4pVPaPAAWSTrVl/xS+UdUuKqwg+cF1M+bHMCDUNGrkC8ebIeA==@linaro.org, AJvYcCVYke4CFIxWAGoC+rggk2rDn+UDtY4MZ1PLL92Zv8lljxXO01U5vhuo/Gfj4/KH8zXWDLhGIXM=@linaro.org, AJvYcCXgTml8dlXAo6J4bRUxguxKsJ6xL0ltrl73PT0I4N6ZQai+hJkfaSj0D9jZNJx8MP8EgK77XBLL9gAl7SWXBx+IK6M=@linaro.org
X-Gm-Message-State: AOJu0YwmRT3PAvJbw84F7FeQpNV6enNkejge88PwJ+SON3OKUBtD+sBq
	NxEX8MvYjYSgPu/pzu4/jW270Zel77zuOOcHLWT02W447zU/MpNFVU2Q
X-Gm-Gg: ASbGncul0Pn64372U9JS1XjVyeVouIuMeyqyX9uNAwaYCq/7uYU0p9VvzpmxIn/DLdx
	1MCz1uZlNKKwxFmxAImSorxY0R+EOKK601qtr1CIxhhGu8le6mu2nyfs0lWnpJsIwh6RYdVgGJo
	cAGjxIkPI4CVVxtKe3buab2OXhzHMulfVgjzzG0aBIX3GLFsi3C/YqL4O+/Gj+ddMXmXgCyzNGj
	Uy51wNqijuwufLTd4hlN3wYadR6gblvs6ibBE9L//BAQIQvTeYLiD5DRvzMOIRhgkreWKITKTaZ
	9zibj97fXf88zExuyG0tvtvaHvuZqjfs3lDmjkh9vmpVsVib9oXPE3K3LhIpvg==
X-Google-Smtp-Source: AGHT+IGlDhFteL3xifkGxWzP+tChzeTDjC8nEVDX/xHHzS8M7A6BHOyu+hh3zK9skEJFg3yaRl/GPA==
X-Received: by 2002:a17:90b:33c2:b0:30e:6a9d:d787 with SMTP id 98e67ed59e1d1-30e7d50b04bmr28998390a91.11.1747745575202;
        Tue, 20 May 2025 05:52:55 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:52:54 -0700 (PDT)
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
Subject: [PATCH 07/33] tcg/wasm32: Add shl/shr/sar instructions
Date: Tue, 20 May 2025 21:51:09 +0900
Message-ID: <1451b4a4c7547f4077709557f07f3002cfc3d889.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qOJkqf8rYvWe

This commit implements shl, shr and sar operations using Wasm
instructions. The Wasm backend uses 64bit variables so the right shift
operation for 32bit values needs to extract the lower 32bit of the operand
before shifting. Additionally, since constant values must be encoded in
LEB128 format, this commit introduces an encoder function implemented
following [1].

[1] https://en.wikipedia.org/wiki/LEB128

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 107 ++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index e4204d3956..b9f2c9c195 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -207,6 +207,26 @@ static void tcg_wasm_out_op_i64_mul(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x7e);
 }
+static void tcg_wasm_out_op_i64_shl(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x86);
+}
+static void tcg_wasm_out_op_i64_shr_s(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x87);
+}
+static void tcg_wasm_out_op_i64_shr_u(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x88);
+}
+static void tcg_wasm_out_op_i32_wrap_i64(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0xa7);
+}
+static void tcg_wasm_out_op_i64_extend_i32_s(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0xac);
+}
 static void tcg_wasm_out_op_var(TCGContext *s, uint8_t instr, uint8_t i)
 {
     tcg_wasm_out8(s, instr);
@@ -245,6 +265,88 @@ tcg_wasm_out_i64_calc(add);
 tcg_wasm_out_i64_calc(sub);
 tcg_wasm_out_i64_calc(mul);
 
+static void tcg_wasm_out_leb128_sint64_t(TCGContext *s, int64_t v)
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
+static void tcg_wasm_out_op_i64_const(TCGContext *s, int64_t v)
+{
+    tcg_wasm_out8(s, 0x42);
+    tcg_wasm_out_leb128_sint64_t(s, v);
+}
+
+static void tcg_wasm_out_shl(TCGContext *s, TCGReg ret,
+                             TCGReg arg1, TCGReg arg2)
+{
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_global_get_r(s, arg2);
+    tcg_wasm_out_op_i64_shl(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_shr_u(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i64_const(s, 0xffffffff);
+        tcg_wasm_out_op_i64_and(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_const(s, 0x7f);
+        tcg_wasm_out_op_i64_and(s);
+        tcg_wasm_out_op_i64_shr_u(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_shr_u(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_shr_s(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_const(s, 0x7f);
+        tcg_wasm_out_op_i64_and(s);
+        tcg_wasm_out_op_i64_shr_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i64_shr_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -975,11 +1077,13 @@ static const TCGOutOpBinary outop_rotr = {
 static void tgen_sar(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
+    TCGReg orig_a1 = a1;
     if (type < TCG_TYPE_REG) {
         tcg_out_ext32s(s, TCG_REG_TMP, a1);
         a1 = TCG_REG_TMP;
     }
     tcg_out_op_rrr(s, INDEX_op_sar, a0, a1, a2);
+    tcg_wasm_out_shr_s(s, type, a0, orig_a1, a2);
 }
 
 static const TCGOutOpBinary outop_sar = {
@@ -991,6 +1095,7 @@ static void tgen_shl(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_shl, a0, a1, a2);
+    tcg_wasm_out_shl(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_shl = {
@@ -1001,11 +1106,13 @@ static const TCGOutOpBinary outop_shl = {
 static void tgen_shr(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
+    TCGReg orig_a1 = a1;
     if (type < TCG_TYPE_REG) {
         tcg_out_ext32u(s, TCG_REG_TMP, a1);
         a1 = TCG_REG_TMP;
     }
     tcg_out_op_rrr(s, INDEX_op_shr, a0, a1, a2);
+    tcg_wasm_out_shr_u(s, type, a0, orig_a1, a2);
 }
 
 static const TCGOutOpBinary outop_shr = {
-- 
2.43.0
