Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475778njc;
        Tue, 20 May 2025 05:53:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:3289:b0:1f5:8220:7452 with SMTP id adf61e73a8af0-216219356ddmr24765289637.24.1747745632854;
        Tue, 20 May 2025 05:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745632; cv=none;
        d=google.com; s=arc-20240605;
        b=PHqA5w9MgKZppnXO4uzaXFKli5AjJYD2JOx0cak9xAmZXCtE6NhgI2dfu0rMKUnGs5
         J+AK10F/1QM7/IYKTHUAWzbSmFFcyQQTDHAXgHxtOAf6TP6flLK/POPe8eUQrgugfjRj
         eioQY6cUObtkJU0lvANYdurWR25tTaQ/JWdWM6ygAX70l/NDK0NXpAqN0JpwLEKo5TZL
         N6DRMz1x//Ohbi38UkEewg2wcx0CzRQtPS8fO1pn9Pd1bPfMXTkL1s2OrmTyNudzJwkR
         1GhbWLHLXgl4HXkR2GCOkLJDXiqUS41NVFvzX3ydeUbEKOfqh5W1iWDiL3G5w3gMhZuL
         dWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2hDX6tqZfoQbfyom/brX/vCkpGWr5vOfzD19dhVKfxE=;
        fh=8aNrjOixyAGba+hdqkaUge+uU/6CE5yieXp4lbSHjUc=;
        b=LMJLZYX+OD8fSHhLjPrRSeEgyD48QoCxfqmwf3hTGTulWbibIz6lAyIyxeD8dP/djD
         6e/RzVSMsHaEfpggzzBmeqsUL+NN2HzLNo83c/XBw0FVj2c7jk3OIvnN7TeQpOyQid7B
         ebKQmeCqIQ8sJdqXBIwNk27S0xCEfrxFozIaTp3Xp5JA+xtZ9Iu9T6R9R1VRhV1DWOZi
         p0lu68dcZFWlDotItHd/VZMqs6LnowrUQO662vVOwJd+gnMRxnVRnTALUY7/AT4piMsO
         V+tjQVtYXo32k/JVO0jNuB5nmZbUAlxCVpZbDyFDugSXjGsbuV4qaDng5GYCZcKzEqib
         JJkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwzCro2S;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26eb07712bsor4527139a12.5.2025.05.20.05.53.52
        (Google Transport Security);
        Tue, 20 May 2025 05:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwzCro2S;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745632; x=1748350432; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hDX6tqZfoQbfyom/brX/vCkpGWr5vOfzD19dhVKfxE=;
        b=kwzCro2SEXPRWYOMuK1LMxbH3h9ZOH2/AMqJ5oHMPHU/WgDFUlw5WZOrx98OAb6oPB
         82pY9lc2NOMwRLg96Hkg0lTSRv7uJlzKKj/S1KhCfLSGXzrOlRjZbj2Zzc3TwRDiGSrI
         cK+NwEMQYVjZg6g+f9j8xb+tCBnPnR4Yk8TxU8Q9tabqQ+k5RKoqol9tgxINidCvZ3yG
         sPDNtv6ywvZEIVbZyOdnoB2IS/M+4uCq42J6raN+uz6MXgfUTFDK8u1Q0tItPVe+2c9q
         4LFQs6XJi2Y78EYco5GuaR1cieNXhFZDsDZKuS9w/n6NRaj4eKDci2d982FUq1KopeoH
         n9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745632; x=1748350432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hDX6tqZfoQbfyom/brX/vCkpGWr5vOfzD19dhVKfxE=;
        b=uNzrwTGcXXuKit16LZlHRHi1ZeFx3u1n5m4LooDpyMRJ+CVNA928AcT74OBD5MjBxb
         uh0fDBodF1uIQEZU3k0Aie8JQDsW5ELau619G8acY94H1M3kMcmSLWBVOwz2YUB8e0yr
         iMJ5ekjoX8/2D7kJZ1rC0e8/H1Y6xMYMwlTOkTXAfT2QSf3TQ59A2vADn23dSasx84tt
         TnIHQDHVOBxzVTMpTe4WFrIHsMp4yD7vLGd4cuoDmaxvHmUdP+ANXVqsUAn5mlX6gEWj
         AEl/qnL6u917A+Qv5kkPouL6lOtAkiQOleYHZX5H1epqUz81xjS+do/kY2ozCgtK7tzI
         XcCA==
X-Forwarded-Encrypted: i=1; AJvYcCUcTyinUGpwQBCXA2AbOlNf5S1j6RRbgCUqpAOy6alW/kZF2tCQfhACBQT1SaYE3GLLQxef4UFIR5U8//rSHaDNWQ==@linaro.org, AJvYcCVkdGKrbXlPqH7PbcFunDrotprpFBARbax6ClgRUxpOnt2TZY+NmsvDAKwrHYjhQqyM9D89+QM=@linaro.org, AJvYcCWmOYiZG+AIZq6ZJoqkYU5EXw26bS7xV+FqGij28OCCXev4H3tghC+WX4V3pnVyWISkZWJ7KyHd3KGlDNbsF0C/7pE=@linaro.org
X-Gm-Message-State: AOJu0YyNSlyY5HbsY5B3GgZfg2KytPu6H4kvmWjGaRezxuInQRgooAoo
	MfpSf45Ez9G5Jb8q2cDwTdZLhsgLaW+UdibksobsQMi4pS+hHGR95QutavHK7dlA
X-Gm-Gg: ASbGnctwFl1VJZ30IEjqz3E8nQ86Uiq86rLoXPAVpWCrC2H3wYl6CltKN7ZB27gr/14
	BSH62gVXwWVoofgYD/vp91MVaKHTeGC1r+D5TFB7rjeFhnMefE2KTVtK/q/bOQFkqUeaytGUR9L
	BHFej1cZW2+vE+f+XBqMw23jv5oMl9EhMWLOIIU2LmGgYhc7jDll2elPfInSj6acyTewjwLaqyi
	CGa325yVg50QlN7edtn62ej5BjamrpbVZ6mR5wjRctGxG8jG7LfQLVsw6CNKBBjW2YAI1QGMFS8
	JdsYFyNSvfWGN//7JqNkbWTG2dt7FkbPA3sF88cez9Fed2wr5Ls=
X-Google-Smtp-Source: AGHT+IE4U2UXF2xs+H6bxIt71NsbCMeWEhfCOMavrX7tJFkvHIkvkiyDXs60OAAtuPGm3U++zpH5Cg==
X-Received: by 2002:a17:90b:28c5:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-30e7d2def4fmr30108178a91.0.1747745632031;
        Tue, 20 May 2025 05:53:52 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:51 -0700 (PDT)
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
Subject: [PATCH 17/33] tcg/wasm32: Add rot/clz/ctz instructions
Date: Tue, 20 May 2025 21:51:19 +0900
Message-ID: <ec4eb2d3ee8f6e880501e51bd496ac3260040d00.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aV26UCJcYT9b

This commit implements rot, clz and ctz operations using Wasm instructions.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 155 ++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index e5de2f69bd..75e47f8c8c 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -200,6 +200,14 @@ static void tcg_wasm_out_op_i64_xor(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x85);
 }
+static void tcg_wasm_out_op_i64_clz(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x79);
+}
+static void tcg_wasm_out_op_i64_ctz(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x7a);
+}
 static void tcg_wasm_out_op_i64_popcnt(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x7b);
@@ -244,6 +252,10 @@ static void tcg_wasm_out_op_i64_shr_u(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x88);
 }
+static void tcg_wasm_out_op_i64_rotl(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x89);
+}
 static void tcg_wasm_out_op_i64_rotr(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x8a);
@@ -268,6 +280,14 @@ static void tcg_wasm_out_op_i64_extend16_s(TCGContext *s)
 {
     tcg_wasm_out8(s, 0xc3);
 }
+static void tcg_wasm_out_op_i32_clz(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x67);
+}
+static void tcg_wasm_out_op_i32_ctz(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x68);
+}
 static void tcg_wasm_out_op_i32_add(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x6a);
@@ -292,16 +312,33 @@ static void tcg_wasm_out_op_i32_shr_u(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x76);
 }
+static void tcg_wasm_out_op_i32_rotl(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x77);
+}
 static void tcg_wasm_out_op_i32_rotr(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x78);
 }
+static void tcg_wasm_out_op_i32_eqz(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x45);
+}
+static void tcg_wasm_out_op_i64_eqz(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x50);
+}
 
 static void tcg_wasm_out_op_if_ret_i64(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x04);
     tcg_wasm_out8(s, 0x7e);
 }
+static void tcg_wasm_out_op_if_ret_i32(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x04);
+    tcg_wasm_out8(s, 0x7f);
+}
 static void tcg_wasm_out_op_else(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x05);
@@ -360,6 +397,8 @@ tcg_wasm_out_i64_calc(xor);
 tcg_wasm_out_i64_calc(add);
 tcg_wasm_out_i64_calc(sub);
 tcg_wasm_out_i64_calc(mul);
+tcg_wasm_out_i64_calc(rotl);
+tcg_wasm_out_i64_calc(rotr);
 
 static const struct {
     uint8_t i32;
@@ -918,6 +957,118 @@ static void tcg_wasm_out_bswap16(
     tcg_wasm_out_op_global_set_r(s, dest);
 }
 
+static void tcg_wasm_out_rotl(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i32_rotl(s);
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_i64_calc_rotl(s, ret, arg1, arg2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_rotr(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i32_rotr(s);
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_i64_calc_rotr(s, ret, arg1, arg2);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_clz(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i32_eqz(s);
+        tcg_wasm_out_op_if_ret_i32(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_else(s);
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i32_clz(s);
+        tcg_wasm_out_op_end(s);
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i64_eqz(s);
+        tcg_wasm_out_op_if_ret_i64(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_else(s);
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i64_clz(s);
+        tcg_wasm_out_op_end(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_ctz(
+    TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i32_eqz(s);
+        tcg_wasm_out_op_if_ret_i32(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_else(s);
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        tcg_wasm_out_op_i32_ctz(s);
+        tcg_wasm_out_op_end(s);
+        tcg_wasm_out_op_i64_extend_i32_s(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    case TCG_TYPE_I64:
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i64_eqz(s);
+        tcg_wasm_out_op_if_ret_i64(s);
+        tcg_wasm_out_op_global_get_r(s, arg2);
+        tcg_wasm_out_op_else(s);
+        tcg_wasm_out_op_global_get_r(s, arg1);
+        tcg_wasm_out_op_i64_ctz(s);
+        tcg_wasm_out_op_end(s);
+        tcg_wasm_out_op_global_set_r(s, ret);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void tcg_wasm_out_ld(
     TCGContext *s, TCGType type, TCGReg val, TCGReg base, intptr_t offset)
 {
@@ -1710,6 +1861,7 @@ static void tgen_clz(TCGContext *s, TCGType type,
                      ? INDEX_op_tci_clz32
                      : INDEX_op_clz);
     tcg_out_op_rrr(s, opc, a0, a1, a2);
+    tcg_wasm_out_clz(s, type, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_clz = {
@@ -1724,6 +1876,7 @@ static void tgen_ctz(TCGContext *s, TCGType type,
                      ? INDEX_op_tci_ctz32
                      : INDEX_op_ctz);
     tcg_out_op_rrr(s, opc, a0, a1, a2);
+    tcg_wasm_out_ctz(s, type, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_ctz = {
@@ -1948,6 +2101,7 @@ static void tgen_rotl(TCGContext *s, TCGType type,
                      ? INDEX_op_tci_rotl32
                      : INDEX_op_rotl);
     tcg_out_op_rrr(s, opc, a0, a1, a2);
+    tcg_wasm_out_rotl(s, type, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_rotl = {
@@ -1962,6 +2116,7 @@ static void tgen_rotr(TCGContext *s, TCGType type,
                      ? INDEX_op_tci_rotr32
                      : INDEX_op_rotr);
     tcg_out_op_rrr(s, opc, a0, a1, a2);
+    tcg_wasm_out_rotr(s, type, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_rotr = {
-- 
2.43.0
