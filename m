Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475525njc;
        Tue, 20 May 2025 05:53:24 -0700 (PDT)
X-Received: by 2002:a17:90b:58ee:b0:30e:6ac1:3716 with SMTP id 98e67ed59e1d1-30e7d5bb679mr19995315a91.34.1747745604058;
        Tue, 20 May 2025 05:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745604; cv=none;
        d=google.com; s=arc-20240605;
        b=MQZwzQOd0POVQECZymmHHD16u7U9rig0XxIgN0Z7N8oTaRqVPxeZuOyJDKJQ0aBAa9
         NuNjaQ8i9UvoUIkJe4BgqqMtjaShNpFAu5b/VEA95Nn/icy0Vp1VZAfxcno3anjIMccC
         W0kL2toQPD6D4Ql6SYu6tPkytg6gQDbTFl88y4AZYTIW3j3PBctoIHM7G728EibGonzF
         BHkYGPH3HkAA/GQrzUY+DXfpN3UHlJxkhzRELny3x8gKx1FacM19Y1upcBkg5GZRhZ2p
         bs15/PdtQ7ru7FUiprQuV0sznQ4D8cK4IbmZVFO+E+5tLhBT/kiHBHSLT7SKV6T4XWXa
         vp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DrYdTbrh0HLfQlm+zOWduDlR9Q8yHBtmdY6iR829V3U=;
        fh=IrVF1HW4uARRhBC06bxMhwXjlEU0nfJueO4fwkjj2MM=;
        b=N64jPagzgBxSgXk4M6bJKXdpVfrehUd0lsIEIUVTaE1239QqLSTB4kOiAenwqhcXe3
         /OuVPWz4Vm0nSIg31l/O0NjkAjcV5jKP8KvHo5KXly5FoT2fukX4aoaJ9f4ebiYDWXGN
         H+VzxPanmytWuUC+HlmwdDzIExrHF91sVTHcD8nEOyg5mQpaYBjyvnJNsue2vVGYP1YM
         FdobOOXf7s1CviXKNSYclTQ7TrwZeC4UXt49/9kZEaGAluzvxnHfQ57/Oiim9MO1F9S6
         aqsVoiwOUoVEYba0D1AO6gnnIcsfHA2U62pE9uk+qrGL5IKwc/GWfM+VuygqdP/9xfja
         oWvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="LYR8/JCK";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d47706asor7964705a91.1.2025.05.20.05.53.23
        (Google Transport Security);
        Tue, 20 May 2025 05:53:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="LYR8/JCK";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745603; x=1748350403; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrYdTbrh0HLfQlm+zOWduDlR9Q8yHBtmdY6iR829V3U=;
        b=LYR8/JCKQoBj3fDRyi3M+5pRLj9opB6J3eFkHogUdqqI9hcVRtSGI6r8unswm2Ncnj
         9e5yO2ngzUBdExmvJP4i2n6D94ZVWt3CRJIenhug1yU/twm+MYSiV9wLi63zk/kiMEPC
         NRpP2oyrD24kqCxyR/iilWeVbvgdqm/47Pe5FAiHP6VLW0RFN9z5pAiXXqIiv0X+eGaJ
         PR4eQKUhN2BA+2h6kZdDBkKUepj4d7HhFmFoZ8mcdHCUZGuQE/m4SMnG1wO+lR/67N9C
         eSt8wjZU7sPW6YQvkx/N4+TMUv6LQ20dULxzrOXIpH4m1f2h2/8Li0yWsQ6YOhxNOGEP
         Y+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745603; x=1748350403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrYdTbrh0HLfQlm+zOWduDlR9Q8yHBtmdY6iR829V3U=;
        b=ru+OKMvPcj2KiNOAe5Zk7umfNl7Btbv+I7ME1wEzby0oAgGtRkbVg3URNq3fdZqR2c
         UzUUjNWDXZD8Iqj74g8G9/qX0wBt5qggr37+EGCIPBhvfoN8HoYq8jTMApvLLoAts8dj
         iFGxcK4IxIfb6FtejIy90mhoHB5e7+5yCWXyu7JLjyGSKlBRKRftsWzdntR7QBEaJjJ8
         6tC99IzXIrLgik3wRDfaeyPzgRSdtjNWtdyJcvsPfYPv8FAC05q5VaYoMKZ2SqikDsql
         0ehIk3znvW0MnP+OqQU488Gi8FaTQN7eoWX51bvANrd01DNILR+qtcvpsHIO659cdtYD
         3Afg==
X-Forwarded-Encrypted: i=1; AJvYcCUz1w7UJwwYqeo56RRZ3GulFTeLclx9/bqp4XYLPYBNz2hUu30N5O5DTPcHfQrxOIvWGGsuBA+9Wiw2bd2AYMxriA==@linaro.org, AJvYcCVVA6pOhlgIRynmpVONqrRPINHjFYTRhmAWG8MVGbWOm+GVVAYqqDewUvZfxG61R8U11g1QzVRmzsbGJIElSiRv3tM=@linaro.org, AJvYcCWxbhnHoagAoIy/E/R7Gu32pMNvqYn/b/pPar2zr698hYkY/47tpYdHSikT/aR4+a7LbsKJqb4=@linaro.org
X-Gm-Message-State: AOJu0YxSUDK1IYvib9MusqK7PYhl2fvdA5JaOLmP/Y5GBZJ+OEz7EjQK
	NvF31gI1rO5LgaHEHNt0FJ8Fh+wlTb9nIDfL1xEFWhKwkbvr0tmVUepa
X-Gm-Gg: ASbGnctaHAKWaGrkxVQSTNcOwdOYz+NOiofpmbl1xRdnciIogW4EagjUgfasrVmu6Bh
	3VMuYetMxu4gY4wN+2vCj9roLO+kjbmxw0ZSiEZ1aMZV1XQmUJ2g+VQoDkbBLihnPJvzMGMd40Q
	pScfYwavSUOVsesb6RwkDTe43E5lQknVB8yLzsX5iet1vuDL+UFKF5B0R7oV0giNbBNqtyACuEW
	9xIMDI39dQ9rxlsjsW4zyFAJpWeAlqBw69eFFwvZ6aQ7Wv0XxL7Cq1CEev0e2K6ePi2v3QdF+SK
	xWzZ3QYhqGmEQ7fn/1xVJM7oQg8X9HHZNAxCDoLdUDlrrbQte8PStFNTKd5Bdw==
X-Google-Smtp-Source: AGHT+IHSVeSZrqI1p+LKyaXlkp/QemBYcHu0gGDpX+Iuujio4I5h58FLti/L/Smc9nkP49kM+CaNOw==
X-Received: by 2002:a17:90b:4a50:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-30e7d500953mr24868929a91.6.1747745603425;
        Tue, 20 May 2025 05:53:23 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:22 -0700 (PDT)
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
Subject: [PATCH 12/33] tcg/wasm32: Add ext instructions
Date: Tue, 20 May 2025 21:51:14 +0900
Message-ID: <6c4e1684c2c1207c01ceff9168cf3031707040c6.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aZocOxkJkaL3

This commit implements the ext operations using Wasm's extend instructions.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 79 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 90a5705442..dff79a9854 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -231,7 +231,14 @@ static void tcg_wasm_out_op_i64_extend_i32_u(TCGContext *s)
 {
     tcg_wasm_out8(s, 0xad);
 }
-
+static void tcg_wasm_out_op_i64_extend8_s(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0xc2);
+}
+static void tcg_wasm_out_op_i64_extend16_s(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0xc3);
+}
 static void tcg_wasm_out_op_i32_add(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x6a);
@@ -631,6 +638,60 @@ static void tcg_wasm_out_sextract(TCGContext *s, TCGReg dest, TCGReg arg1,
     tcg_wasm_out_op_global_set_r(s, dest);
 }
 
+static void tcg_wasm_out_ext8s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_wasm_out_op_global_get_r(s, rs);
+    tcg_wasm_out_op_i64_extend8_s(s);
+    tcg_wasm_out_op_global_set_r(s, rd);
+}
+
+static void tcg_wasm_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_wasm_out_op_global_get_r(s, rs);
+    tcg_wasm_out_op_i64_const(s, 0xff);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_global_set_r(s, rd);
+}
+
+static void tcg_wasm_out_ext16s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_wasm_out_op_global_get_r(s, rs);
+    tcg_wasm_out_op_i64_extend16_s(s);
+    tcg_wasm_out_op_global_set_r(s, rd);
+}
+
+static void tcg_wasm_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_wasm_out_op_global_get_r(s, rs);
+    tcg_wasm_out_op_i64_const(s, 0xffff);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_global_set_r(s, rd);
+}
+
+static void tcg_wasm_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_wasm_out_op_global_get_r(s, rs);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_op_i64_extend_i32_s(s);
+    tcg_wasm_out_op_global_set_r(s, rd);
+}
+
+static void tcg_wasm_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_wasm_out_op_global_get_r(s, rs);
+    tcg_wasm_out_op_i64_const(s, 0xffffffff);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_global_set_r(s, rd);
+}
+
+static void tcg_wasm_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_wasm_out_op_global_get_r(s, rs);
+    tcg_wasm_out_op_i64_const(s, 0xffffffff);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_global_set_r(s, rd);
+}
+
 static void tcg_wasm_out_ld(
     TCGContext *s, TCGType type, TCGReg val, TCGReg base, intptr_t offset)
 {
@@ -1126,33 +1187,39 @@ static const TCGOutOpExtract2 outop_extract2 = {
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
 {
     tcg_tci_out_sextract(s, type, rd, rs, 0, 8);
+    tcg_wasm_out_ext8s(s, rd, rs);
 }
 
 static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_tci_out_extract(s, TCG_TYPE_REG, rd, rs, 0, 8);
+    tcg_wasm_out_ext8u(s, rd, rs);
 }
 
 static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
 {
     tcg_tci_out_sextract(s, type, rd, rs, 0, 16);
+    tcg_wasm_out_ext16s(s, rd, rs);
 }
 
 static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_tci_out_extract(s, TCG_TYPE_REG, rd, rs, 0, 16);
+    tcg_wasm_out_ext16u(s, rd, rs);
 }
 
 static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
     tcg_tci_out_sextract(s, TCG_TYPE_I64, rd, rs, 0, 32);
+    tcg_wasm_out_ext32s(s, rd, rs);
 }
 
 static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
     tcg_tci_out_extract(s, TCG_TYPE_I64, rd, rs, 0, 32);
+    tcg_wasm_out_ext32u(s, rd, rs);
 }
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
@@ -1169,6 +1236,7 @@ static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
     tcg_tci_out_mov(s, TCG_TYPE_I32, rd, rs);
+    tcg_wasm_out_extrl_i64_i32(s, rd, rs);
 }
 
 static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
@@ -1396,9 +1464,18 @@ static const TCGOutOpBinary outop_eqv = {
 };
 
 #if TCG_TARGET_REG_BITS == 64
+static void tcg_wasm_out_extrh_i64_i32(TCGContext *s, TCGReg a0, TCGReg a1)
+{
+    tcg_wasm_out_op_global_get_r(s, a1);
+    tcg_wasm_out_op_i64_const(s, 32);
+    tcg_wasm_out_op_i64_shr_u(s);
+    tcg_wasm_out_op_global_set_r(s, a0);
+}
+
 static void tgen_extrh_i64_i32(TCGContext *s, TCGType t, TCGReg a0, TCGReg a1)
 {
     tcg_tci_out_extract(s, TCG_TYPE_I64, a0, a1, 32, 32);
+    tcg_wasm_out_extrh_i64_i32(s, a0, a1);
 }
 
 static const TCGOutOpUnary outop_extrh_i64_i32 = {
-- 
2.43.0
