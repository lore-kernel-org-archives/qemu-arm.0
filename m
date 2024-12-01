Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2151233njk;
        Sun, 1 Dec 2024 07:13:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNqITE4gKiC6LZyUDTzZzgaYU/AFar1nUoVX7G6L+GJhdqhbJTuElz7g2HGJXY0Y4uTw0nKN52UuXHrA==@linaro.org
X-Google-Smtp-Source: AGHT+IF/LJ/oNlprhgXXbAasgV0bRwDGbPryZqXI3Yj7B3wsIiwcHEbY4pCr5/j7MY0ZaIyvusH5
X-Received: by 2002:a05:6214:21a9:b0:6cb:fa74:bafb with SMTP id 6a1803df08f44-6d864dccbb4mr263706996d6.31.1733065984835;
        Sun, 01 Dec 2024 07:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065984; cv=none;
        d=google.com; s=arc-20240605;
        b=BKUV63aOABbg+s93ltB20n5sFR+qv76U1JVY/QJ1z6mpAtnPB3+VBgrzBsp7gzZqhD
         ZuxnAjqZ8vs7IgaWTFOcmS7Mou6FX+JCpWAuvJPy1SFxoyQiui7zMXTeXhjO9apt61LD
         XNufEj7M2nrZcJfQMRaCqUlIhJFWWrR7VBUnmOWvc+jlHjSfMI55OI/ZbwgIFoEuacIt
         p9n0xa27ejqLyO4ChUCdBFk20NdQ8UbbdPZhy1BjaLvwCytZtITzvX1caW85hfyF02zm
         cNbHN8Tork2jHXJ1zFbkgJVXjmoCU36IC8Yc+QqPwo9la71ZTasyJ+hssI7gA3IXlcdi
         UUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Gr0IQ6r5skT2/byPmQI2npFAs/PD67MqWmqJZlEMMn0=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=kAXYHe6Lvg4705d4r1k/3KkjJgWN3aTRgFBttH65K4dsG3/cTEq3e6UT2Mz+dBJoYi
         epSwYNevSg2YvD/F2U1C0HAkXCVceOpuPSsoyseuJXq7lcotfeRXEOWYrbbmzoKiHk2y
         mMOUUzMntv1Hfk90XWA4hzebJsPj7vR/dpd6Vs0gsuVX6qAyqTiodz4YPP2NbcEBITM0
         Zw6a6wqOV700V0zpoAIE1okUrThPSCfzEbWihV8bgoO70MuQ0oqf7Ou0sQ8O9A7DW1zs
         Ftx1Mj8TiAPvwhHtdmXnXi5LDC6PdDI+QkB0/Bm1oL0r04emBEnV17i+OhQBrviCJRMg
         tOpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iTZmLecC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849b1d9dsi954777185a.295.2024.12.01.07.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iTZmLecC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlX3-0001WU-9b; Sun, 01 Dec 2024 10:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX1-0001VG-0K
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:43 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWz-0004Iw-7U
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:42 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-27b7a1480bdso1591968fac.2
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065600; x=1733670400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gr0IQ6r5skT2/byPmQI2npFAs/PD67MqWmqJZlEMMn0=;
 b=iTZmLecCQ7f4y9jiKryX1Glj7Vtjd7O3Ry3s4DoVOt2fR3kwrAAolfe20OTIcVQOUs
 6rU5s0jkbIWv4BoJ00JG94oaUYpcHJ3o4/UAKDpEOJZnUVoHKYshy1IpyAC1DyIFdBRn
 D9DFSNvoJHp73Kp6UwY1ZjI6rE67WbvKIQXzJOiTCtffGkvktyXXL7hcgQv9iHm7FG9i
 ZIZf1aHt20mr119KDGB/YC47lrB8Dw2vZ+ED0JD1/CsN+0c7AFlZt/2NDZCtiMqLjUWy
 rT9GaAdaRH8AbRDC7D2HE5ZvCwRGYkJDHC1ztG0HQ9AcWVDsHluoxwhcoqqjSG5xqJ4h
 czMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065600; x=1733670400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gr0IQ6r5skT2/byPmQI2npFAs/PD67MqWmqJZlEMMn0=;
 b=aMWjRt5pem9cdEISnv3pGmOTKKeq5b/MDc3ee58QZ7nIiiTQifaEvtPcpcqUxq7COB
 dtwKTx6v51YvfbYWu7Noy8zeuOwhVkTTdMFTXvsjBQf34yxkZQPT4krjqKz8YkXwwsy3
 La7qYxA/Vu7Di12JujtsgxLm8Nol/nF6VlMBlLBNjA1BQPdTWBejEOxN4RLw5bZjG46i
 v9KO0JhNXJQ8asEMqL2dRFn3aTldFIQFgdNZhhcvDSEk3W7V54crWP3+XzopVJbEVHDz
 rvpAWTeUdvlM9VUcWGmiTM9qFv69SUY0TNWDox37G0QWTWLeOKX5kwqxCovP1jxtwZO9
 jrKQ==
X-Gm-Message-State: AOJu0YyL99qvxd6pwfAehkE46g4Y7PIYwHwmxiBsvmY+LTtD7Njxqai5
 xhvuo+H6FROrgvCuhYa+CUZLTMDhLnr5m2Fw+yc5I2hvIwhM88ENaJ89gl+n9r+qGUDdK9P3OTt
 6WTA=
X-Gm-Gg: ASbGnctCtLHfrJZN9/WyweOW0EU0xY2DC8FussQuodDFU71d/GPxMCqKeSqf8viHO/o
 f1lQS+izcBXaTaC08ZxuyPjjFn2Go7fZk8S4eAxtgKN8j5YVV9ixMi9GNYUipqu0RfvG6EoMOVj
 qm8RyhhibvDFxd1Hdn/Lq6Xc/5RD5uotOi/8VpndD6lwdGZM81bX8HZBlqsz93gUdnDtHkLuLsu
 TPMTjjpJ08NgA57liNMNKR5KpeqCnXDsWv3ea+w15PPgcznWzh2BJ08sjQrUZsVGmCYX8Ic84mP
 Fb9FhZ8UUKVTEicfCvS3LafIy7YyYj6aikwy
X-Received: by 2002:a05:6870:2b01:b0:29d:c832:8422 with SMTP id
 586e51a60fabf-29e3aa2902bmr4065691fac.18.1733065599924; 
 Sun, 01 Dec 2024 07:06:39 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 27/67] target/arm: Convert FRINT[NPMSAXI] (scalar) to
 decodetree
Date: Sun,  1 Dec 2024 09:05:26 -0600
Message-ID: <20241201150607.12812-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 72i2ymRuR7oV

Remove handle_fp_1src_half as these were the last insns
decoded by that function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 107 ++++++++++-----------------------
 target/arm/tcg/a64.decode      |   8 +++
 2 files changed, 39 insertions(+), 76 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 750db921cd..e8842012ea 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8405,46 +8405,24 @@ static const FPScalar1 f_scalar_fsqrt = {
 };
 TRANS(FSQRT_s, do_fp1_scalar, a, &f_scalar_fsqrt, -1)
 
-/* Floating-point data-processing (1 source) - half precision */
-static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
-{
-    TCGv_ptr fpst = NULL;
-    TCGv_i32 tcg_op = read_fp_hreg(s, rn);
-    TCGv_i32 tcg_res = tcg_temp_new_i32();
+static const FPScalar1 f_scalar_frint = {
+    gen_helper_advsimd_rinth,
+    gen_helper_rints,
+    gen_helper_rintd,
+};
+TRANS(FRINTN_s, do_fp1_scalar, a, &f_scalar_frint, FPROUNDING_TIEEVEN)
+TRANS(FRINTP_s, do_fp1_scalar, a, &f_scalar_frint, FPROUNDING_POSINF)
+TRANS(FRINTM_s, do_fp1_scalar, a, &f_scalar_frint, FPROUNDING_NEGINF)
+TRANS(FRINTZ_s, do_fp1_scalar, a, &f_scalar_frint, FPROUNDING_ZERO)
+TRANS(FRINTA_s, do_fp1_scalar, a, &f_scalar_frint, FPROUNDING_TIEAWAY)
+TRANS(FRINTI_s, do_fp1_scalar, a, &f_scalar_frint, -1)
 
-    switch (opcode) {
-    case 0x8: /* FRINTN */
-    case 0x9: /* FRINTP */
-    case 0xa: /* FRINTM */
-    case 0xb: /* FRINTZ */
-    case 0xc: /* FRINTA */
-    {
-        TCGv_i32 tcg_rmode;
-
-        fpst = fpstatus_ptr(FPST_FPCR_F16);
-        tcg_rmode = gen_set_rmode(opcode & 7, fpst);
-        gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
-        gen_restore_rmode(tcg_rmode, fpst);
-        break;
-    }
-    case 0xe: /* FRINTX */
-        fpst = fpstatus_ptr(FPST_FPCR_F16);
-        gen_helper_advsimd_rinth_exact(tcg_res, tcg_op, fpst);
-        break;
-    case 0xf: /* FRINTI */
-        fpst = fpstatus_ptr(FPST_FPCR_F16);
-        gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
-        break;
-    default:
-    case 0x0: /* FMOV */
-    case 0x1: /* FABS */
-    case 0x2: /* FNEG */
-    case 0x3: /* FSQRT */
-        g_assert_not_reached();
-    }
-
-    write_fp_sreg(s, rd, tcg_res);
-}
+static const FPScalar1 f_scalar_frintx = {
+    gen_helper_advsimd_rinth_exact,
+    gen_helper_rints_exact,
+    gen_helper_rintd_exact,
+};
+TRANS(FRINTX_s, do_fp1_scalar, a, &f_scalar_frintx, -1)
 
 /* Floating-point data-processing (1 source) - single precision */
 static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
@@ -8461,20 +8439,6 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x6: /* BFCVT */
         gen_fpst = gen_helper_bfcvt;
         break;
-    case 0x8: /* FRINTN */
-    case 0x9: /* FRINTP */
-    case 0xa: /* FRINTM */
-    case 0xb: /* FRINTZ */
-    case 0xc: /* FRINTA */
-        rmode = opcode & 7;
-        gen_fpst = gen_helper_rints;
-        break;
-    case 0xe: /* FRINTX */
-        gen_fpst = gen_helper_rints_exact;
-        break;
-    case 0xf: /* FRINTI */
-        gen_fpst = gen_helper_rints;
-        break;
     case 0x10: /* FRINT32Z */
         rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_s;
@@ -8494,6 +8458,13 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x1: /* FABS */
     case 0x2: /* FNEG */
     case 0x3: /* FSQRT */
+    case 0x8: /* FRINTN */
+    case 0x9: /* FRINTP */
+    case 0xa: /* FRINTM */
+    case 0xb: /* FRINTZ */
+    case 0xc: /* FRINTA */
+    case 0xf: /* FRINTI */
+    case 0xe: /* FRINTX */
         g_assert_not_reached();
     }
 
@@ -8521,20 +8492,6 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
     tcg_res = tcg_temp_new_i64();
 
     switch (opcode) {
-    case 0x8: /* FRINTN */
-    case 0x9: /* FRINTP */
-    case 0xa: /* FRINTM */
-    case 0xb: /* FRINTZ */
-    case 0xc: /* FRINTA */
-        rmode = opcode & 7;
-        gen_fpst = gen_helper_rintd;
-        break;
-    case 0xe: /* FRINTX */
-        gen_fpst = gen_helper_rintd_exact;
-        break;
-    case 0xf: /* FRINTI */
-        gen_fpst = gen_helper_rintd;
-        break;
     case 0x10: /* FRINT32Z */
         rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_d;
@@ -8554,6 +8511,13 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
     case 0x1: /* FABS */
     case 0x2: /* FNEG */
     case 0x3: /* FSQRT */
+    case 0x8: /* FRINTN */
+    case 0x9: /* FRINTP */
+    case 0xa: /* FRINTM */
+    case 0xb: /* FRINTZ */
+    case 0xc: /* FRINTA */
+    case 0xf: /* FRINTI */
+    case 0xe: /* FRINTX */
         g_assert_not_reached();
     }
 
@@ -8691,15 +8655,6 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             handle_fp_1src_double(s, opcode, rd, rn);
             break;
         case 3:
-            if (!dc_isar_feature(aa64_fp16, s)) {
-                goto do_unallocated;
-            }
-
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_fp_1src_half(s, opcode, rd, rn);
-            break;
         default:
             goto do_unallocated;
         }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 9e5ea14683..fbfdf96eb3 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1329,6 +1329,14 @@ FABS_s          00011110 .. 1 000001 10000 ..... .....      @rr_hsd
 FNEG_s          00011110 .. 1 000010 10000 ..... .....      @rr_hsd
 FSQRT_s         00011110 .. 1 000011 10000 ..... .....      @rr_hsd
 
+FRINTN_s        00011110 .. 1 001000 10000 ..... .....      @rr_hsd
+FRINTP_s        00011110 .. 1 001001 10000 ..... .....      @rr_hsd
+FRINTM_s        00011110 .. 1 001010 10000 ..... .....      @rr_hsd
+FRINTZ_s        00011110 .. 1 001011 10000 ..... .....      @rr_hsd
+FRINTA_s        00011110 .. 1 001100 10000 ..... .....      @rr_hsd
+FRINTX_s        00011110 .. 1 001110 10000 ..... .....      @rr_hsd
+FRINTI_s        00011110 .. 1 001111 10000 ..... .....      @rr_hsd
+
 # Floating-point Immediate
 
 FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
-- 
2.43.0

