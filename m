Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475829njc;
        Tue, 20 May 2025 05:53:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5251:b0:308:5273:4dee with SMTP id 98e67ed59e1d1-30e7d542b40mr25149608a91.15.1747745638519;
        Tue, 20 May 2025 05:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745638; cv=none;
        d=google.com; s=arc-20240605;
        b=HezTNGdjCdvfml948ZP2V8IsKXZjC2WEjniwIFkhbGdl3Sc7S9zx7hTA2Ui32qMs+R
         WNYMNh/rjyIqSU3oBtIeGVHU99epXRRvQm/NcbaA15eOyjYy6sYmOa3LdMpdOaKSIAWI
         9WU7+mnWQCEwpuMXx/CcwghOhh7mbnC+3ZUe2kUp8Z97/mZI2hVQ9M3t8V1AjEhO/LAd
         YwowoafGs3yqva5HLUnfqCUEEZNW/4IplodLAmUVN2DrJf/h/065bFEYS4Ew7e7nfUrh
         YB4uMgAaNAO8bHcHeFona9qRTpmv0hwfKL3Yoc9n3hrOdikCFK8+GGhOmzg+ggZ0Clte
         Rz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KbZX43g+ERfcOdN/FYEqrH5HB45spFaPpgCTkfGLlg0=;
        fh=tcBEh5it19OXjIJfFgcj8RG2VfrIktxrHn6KdJBOoBM=;
        b=kbJF2VmBYN7CGWWUJfOGdNxarB9OGMEqsoTkhV2SZBzuar0LLqPZb3QeBdX8B70pry
         OBcN4drLtFKjKzmNII8ggNCQzcIQdhQLQzL+79FvMpiIwJyI88sn6vD2NtHALGDi2h9o
         eWR/+/Y1W5YWKTsw4Jm+SdCevHjIJ14NfEt16OGS+inmlt/sNSfqDsxieYlIXXTCWshA
         ouB3K1W9pDiiAImLTb9DogpHS9/SE2nEU8ac4g53iwEXqql1mSmnY3w/vupvvgi0LQ7u
         oh1uEpVBW7dNVKSmVfd2xouUx1lBy7QEPNkWTK6mFcdxWu5XAIzgddgViS96LmpRHPZe
         oZsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPYXlC+K;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d556a88sor7969425a91.3.2025.05.20.05.53.58
        (Google Transport Security);
        Tue, 20 May 2025 05:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPYXlC+K;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745638; x=1748350438; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbZX43g+ERfcOdN/FYEqrH5HB45spFaPpgCTkfGLlg0=;
        b=nPYXlC+KnytYUhkepxA4Ya8WwYGmc/h+FjkiyewthUK8M/Qe21k9E40zlsaPljCYA1
         2Qgk9gr5eIQSoqmFwWTEZJpPDwT7Rva3EnmefQ9itQ9PExNn9r/HFkF/YLPx1voURS4c
         68PCYg/t3WU9ORR3H8d4OEcXIxz5IuJM1a4zR89iOVrW0vBJm9QLerDgNE1L1YJUMAV4
         8ToW0EwIVFlyLeIwJEdiOxzkHsu28tyYFwoX1zSXpiVfpTXcaoKXZJtZNaewssptNPzQ
         vESrkN5+V6vRo4waF1Fzev7rraxLZpS+zMmwm+R/FtHmj1GpQKt24Us7WDECRd4AyWOo
         Zn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745638; x=1748350438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbZX43g+ERfcOdN/FYEqrH5HB45spFaPpgCTkfGLlg0=;
        b=K+hGFDFqQNSGoejZVfbHlD6htd/GCYsArTv+HzKP1+QBcCQ/uyIlvQ00/3+tn0AO1v
         u3jwig1cNhrRDgrzep2V1bE2RfvZYu7n2SorRaG4sG1EdnbQL252nhC/a3Ea/91w1ZA1
         zlnghtZLfPQTJbT4wg2Tfny5Z0m4H6UFdsjX18gYOHfH8+LdN3u+Jrmip7L42CtjJKxE
         ubUDF1NcHwkEghwpOJaEwqbMVmq5qXqSDy9B82uMZeyRvG3cj8AX1gPVlUBYYDQ0Qdcy
         Ym5NUJ8RHDZfJiYZLZ6jxlplIKWN0RO9+LcJzeeI9S/tajdVr6rYrfJYAl7u4fcDYskQ
         IGDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3HTS5wLaa0FwqVy2fg2fXilo/NTDGK/G2unx061t9M8yPRMk7hvnTunar1TW6Ite9EZ3j3tNFoKERHOFKI3FI6Q==@linaro.org, AJvYcCUtbAinn3HkuzeZPGYXwWzc22UNv6vcQ+Dr+M2PqHxDrUWbYCjxsLNnCa0Q8X/fpP8CRiOaESY=@linaro.org, AJvYcCVz8dc1O6RED9dqVXfXL/dVX5x3khczAh5wYkF9aiX/r8OWJmYNlukVX88fnVcaRMT+QkrGedDrxpHSLGjl+uK4PaU=@linaro.org
X-Gm-Message-State: AOJu0Yz5DSRDlvV7QTPrzkQJmZKHQJCrZRH3DYmsp/h3dWw15BFLRwx1
	Yo8Ihxy/3tabkE0bOFSCEOAHm4ebnbva0HN6UsxWbME9P+FaFSCLFDeB
X-Gm-Gg: ASbGncuTpjR8L5tFmzqv7tDfn3CGE49VYa0QNQaeK6hyA04muI/x8ih1IglaIOXr6LJ
	fMKEkjkSgTWXvyXAdKBaJyabrX67QUFRrP8CuzXXBRcUEncukEU91YpsS6smcigpv0wnO6zEXzD
	e1QPhNebQA8SlZGAmAAWJ0z5icNS0LHVqskfTrdoEcLM+WFLSm2km7sFobA5I918A3qEUPb77A9
	tRhrmmbX0GCvaSm5z9d0EMUMO7a6qGOvyZ8Zn775G2zI/hZqJXPM1RQIVz/nNCFNfNygfEjcBth
	uuVhdDsQGHH3ywVT1EBD0RIfuPYSSaFD0Pn6kwEk4qUfMDaImjQ=
X-Google-Smtp-Source: AGHT+IHuOm/86ztaL4MQCbuQAhFYIVkJJTKeycgm07PUBHqOLU5sp7gXPnJumnQRDpcHc7aR0NgZzA==
X-Received: by 2002:a17:90b:1dd1:b0:305:5f32:d9f5 with SMTP id 98e67ed59e1d1-30e7d4f9220mr28781405a91.7.1747745637647;
        Tue, 20 May 2025 05:53:57 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:57 -0700 (PDT)
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
Subject: [PATCH 18/33] tcg/wasm32: Add addc/subb instructions
Date: Tue, 20 May 2025 21:51:20 +0900
Message-ID: <a2137c5fc4e332cb991bc191e3d68a07b1d565c7.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qG0NpneaL4vV

This commit implements addc and subb operations using Wasm instructions. A
carry flag is introduced as the 16th variable in the module following other
15 variables that represent TCG variables.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 151 ++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 75e47f8c8c..167850ea7c 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -118,6 +118,11 @@ static const uint8_t tcg_target_reg_index[TCG_TARGET_NB_REGS] = {
     15, /* TCG_REG_R15 */
 };
 
+/*
+ * Global variable to store the carry flag
+ */
+#define CARRY_IDX 16
+
 /* Temporary local variables */
 #define TMP32_LOCAL_0_IDX 1
 #define TMP32_LOCAL_1_IDX 2
@@ -324,10 +329,23 @@ static void tcg_wasm_out_op_i32_eqz(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x45);
 }
+static void tcg_wasm_out_op_i64_lt_u(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x54);
+}
+static void tcg_wasm_out_op_i64_le_u(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x58);
+}
 static void tcg_wasm_out_op_i64_eqz(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x50);
 }
+static void tcg_wasm_out_op_if_noret(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x04);
+    tcg_wasm_out8(s, 0x40);
+}
 
 static void tcg_wasm_out_op_if_ret_i64(TCGContext *s)
 {
@@ -1789,10 +1807,28 @@ static TCGConstraintSetIndex cset_addsubcarry(TCGType type, unsigned flags)
     return type == TCG_TYPE_REG ? C_O1_I2(r, r, r) : C_NotImplemented;
 }
 
+static void tcg_wasm_out_addco(TCGContext *s, TCGReg a0, TCGReg a1, TCGReg a2)
+{
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_add(s);
+    tcg_wasm_out_op_global_set_r(s, a0);
+    tcg_wasm_out_op_global_get_r(s, a0);
+    if (a0 == a1) {
+        tcg_wasm_out_op_global_get_r(s, a2);
+    } else {
+        tcg_wasm_out_op_global_get_r(s, a1);
+    }
+    tcg_wasm_out_op_i64_lt_u(s);
+    tcg_wasm_out_op_i64_extend_i32_s(s);
+    tcg_wasm_out_op_global_set(s, CARRY_IDX);
+}
+
 static void tgen_addco(TCGContext *s, TCGType type,
                        TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_addco, a0, a1, a2);
+    tcg_wasm_out_addco(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_addco = {
@@ -1801,10 +1837,21 @@ static const TCGOutOpBinary outop_addco = {
     .out_rrr = tgen_addco,
 };
 
+static void tcg_wasm_out_addci(TCGContext *s, TCGReg a0, TCGReg a1, TCGReg a2)
+{
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_add(s);
+    tcg_wasm_out_op_global_get(s, CARRY_IDX);
+    tcg_wasm_out_op_i64_add(s);
+    tcg_wasm_out_op_global_set_r(s, a0);
+}
+
 static void tgen_addci(TCGContext *s, TCGType type,
                        TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_addci, a0, a1, a2);
+    tcg_wasm_out_addci(s, a0, a1, a2);
 }
 
 static const TCGOutOpAddSubCarry outop_addci = {
@@ -1813,10 +1860,51 @@ static const TCGOutOpAddSubCarry outop_addci = {
     .out_rrr = tgen_addci,
 };
 
+static void tcg_wasm_out_addcio(TCGContext *s, TCGReg a0, TCGReg a1, TCGReg a2)
+{
+    tcg_wasm_out_op_global_get(s, CARRY_IDX);
+    tcg_wasm_out_op_if_noret(s);
+
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_add(s);
+    tcg_wasm_out_op_i64_const(s, 1);
+    tcg_wasm_out_op_i64_add(s);
+    tcg_wasm_out_op_global_set_r(s, a0);
+    tcg_wasm_out_op_global_get_r(s, a0);
+    if (a0 == a1) {
+        tcg_wasm_out_op_global_get_r(s, a2);
+    } else {
+        tcg_wasm_out_op_global_get_r(s, a1);
+    }
+    tcg_wasm_out_op_i64_le_u(s);
+    tcg_wasm_out_op_i64_extend_i32_s(s);
+    tcg_wasm_out_op_global_set(s, CARRY_IDX);
+
+    tcg_wasm_out_op_else(s);
+
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_add(s);
+    tcg_wasm_out_op_global_set_r(s, a0);
+    tcg_wasm_out_op_global_get_r(s, a0);
+    if (a0 == a1) {
+        tcg_wasm_out_op_global_get_r(s, a2);
+    } else {
+        tcg_wasm_out_op_global_get_r(s, a1);
+    }
+    tcg_wasm_out_op_i64_lt_u(s);
+    tcg_wasm_out_op_i64_extend_i32_s(s);
+    tcg_wasm_out_op_global_set(s, CARRY_IDX);
+
+    tcg_wasm_out_op_end(s);
+}
+
 static void tgen_addcio(TCGContext *s, TCGType type,
                         TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_addcio, a0, a1, a2);
+    tcg_wasm_out_addcio(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_addcio = {
@@ -1828,6 +1916,8 @@ static const TCGOutOpBinary outop_addcio = {
 static void tcg_out_set_carry(TCGContext *s)
 {
     tcg_out_op_v(s, INDEX_op_tci_setcarry);
+    tcg_wasm_out_op_i64_const(s, 1);
+    tcg_wasm_out_op_global_set(s, CARRY_IDX);
 }
 
 static void tgen_and(TCGContext *s, TCGType type,
@@ -2182,10 +2272,25 @@ static const TCGOutOpSubtract outop_sub = {
     .out_rrr = tgen_sub,
 };
 
+static void tcg_wasm_out_subbo(TCGContext *s, TCGReg a0, TCGReg a1, TCGReg a2)
+{
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_lt_u(s);
+    tcg_wasm_out_op_i64_extend_i32_s(s);
+    tcg_wasm_out_op_global_set(s, CARRY_IDX);
+
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_sub(s);
+    tcg_wasm_out_op_global_set_r(s, a0);
+}
+
 static void tgen_subbo(TCGContext *s, TCGType type,
                        TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_subbo, a0, a1, a2);
+    tcg_wasm_out_subbo(s, a0, a1, a2);
 }
 
 static const TCGOutOpAddSubCarry outop_subbo = {
@@ -2194,10 +2299,21 @@ static const TCGOutOpAddSubCarry outop_subbo = {
     .out_rrr = tgen_subbo,
 };
 
+static void tcg_wasm_out_subbi(TCGContext *s, TCGReg a0, TCGReg a1, TCGReg a2)
+{
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_sub(s);
+    tcg_wasm_out_op_global_get(s, CARRY_IDX);
+    tcg_wasm_out_op_i64_sub(s);
+    tcg_wasm_out_op_global_set_r(s, a0);
+}
+
 static void tgen_subbi(TCGContext *s, TCGType type,
                        TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_subbi, a0, a1, a2);
+    tcg_wasm_out_subbi(s, a0, a1, a2);
 }
 
 static const TCGOutOpAddSubCarry outop_subbi = {
@@ -2206,10 +2322,43 @@ static const TCGOutOpAddSubCarry outop_subbi = {
     .out_rrr = tgen_subbi,
 };
 
+static void tcg_wasm_out_subbio(TCGContext *s, TCGReg a0, TCGReg a1, TCGReg a2)
+{
+    tcg_wasm_out_op_global_get(s, CARRY_IDX);
+    tcg_wasm_out_op_if_noret(s);
+
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_le_u(s);
+    tcg_wasm_out_op_i64_extend_i32_s(s);
+    tcg_wasm_out_op_global_set(s, CARRY_IDX);
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_sub(s);
+    tcg_wasm_out_op_i64_const(s, 1);
+    tcg_wasm_out_op_i64_sub(s);
+    tcg_wasm_out_op_global_set_r(s, a0);
+
+    tcg_wasm_out_op_else(s);
+
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_lt_u(s);
+    tcg_wasm_out_op_i64_extend_i32_s(s);
+    tcg_wasm_out_op_global_set(s, CARRY_IDX);
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_global_get_r(s, a2);
+    tcg_wasm_out_op_i64_sub(s);
+    tcg_wasm_out_op_global_set_r(s, a0);
+
+    tcg_wasm_out_op_end(s);
+}
+
 static void tgen_subbio(TCGContext *s, TCGType type,
                         TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_subbio, a0, a1, a2);
+    tcg_wasm_out_subbio(s, a0, a1, a2);
 }
 
 static const TCGOutOpAddSubCarry outop_subbio = {
@@ -2221,6 +2370,8 @@ static const TCGOutOpAddSubCarry outop_subbio = {
 static void tcg_out_set_borrow(TCGContext *s)
 {
     tcg_out_op_v(s, INDEX_op_tci_setcarry);  /* borrow == carry */
+    tcg_wasm_out_op_i64_const(s, 1);
+    tcg_wasm_out_op_global_set(s, CARRY_IDX);
 }
 
 static void tgen_xor(TCGContext *s, TCGType type,
-- 
2.43.0
