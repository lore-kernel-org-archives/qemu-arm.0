Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206682wrv;
        Fri, 26 Jul 2019 10:50:37 -0700 (PDT)
X-Received: by 2002:aa7:940c:: with SMTP id x12mr23883376pfo.80.1564163437227;
        Fri, 26 Jul 2019 10:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163437; cv=none;
        d=google.com; s=arc-20160816;
        b=jvOLvIIDHLMwWXGrAv4xm/lWviP/Ff3ccNAz3F6dYdbasZv9OMGFTCpsmrOL8o30rf
         gEsWOWY/OaQ9mnmAGsZAl2dCtdRXh6V/vSnnwoV1HZfcyRKnxDYWdWoULHnst2gQ33EG
         MZFQ/LcTiK1pXBu3hgOTnBucXiNPMibi1FuMQuIiHoYDz96zRgjd0exf9K6OLPjanYc9
         wqeHSXLwDjJr6tnKUp87m9VzS4Pv9ouCv4GuOrZJ+AuzOT5OqnfqpdDCJw37YfQohUVP
         Un6XTapB/mgxZwFgyrIJmhEeGZVqG5NHUUmdSgYFvU9k3Igzgjcm3kqcNinBjICYVuxZ
         j7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=7SlZHRojqaDrAigAWryRfk9aPa/pHb9UCpOA1gKKEjI=;
        b=w4GSFZv4Q4uiQU35xtXJ8QTgGCPLfMIUnsXMYu8qjTc+XdBsPTwvglLBau0fO58/Xw
         wMSbjCqjebRUeF3V5SIcfY1/AqHSGHI4hMMgMf5KEdPKemZ3pW6RZNkk4KvcJVZ0n0/M
         aRtDJlc3v+tjIuZ/vXUAP4IF8ODFrQKL9Z4YFG+C6vjhAAqWWcmO6ssp1oXo2qiT9Ufd
         nP1vnIegYHoVS2D7VYG+jM3wnN0rcE1n4zR5BVX+GzNIlIto3ZyAoJ0frgWGfIsjaePM
         laalKx5xX/s/X94JHzmd7u5KvJ5sEFb2aaFS3MKEbU/y2oCksUYauaCULKc8lqjhUUJy
         0Nfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LERFRk9H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a2sor7202778pgv.3.2019.07.26.10.50.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LERFRk9H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7SlZHRojqaDrAigAWryRfk9aPa/pHb9UCpOA1gKKEjI=;
        b=LERFRk9HPSpHkSWvqJP4AF45a9EYb5Hly5D8dtugH9nx6e5yN/PBTDdNVSaC2Rts31
         I9XoErtG+r8XTfVdEckBmiGAPqhWfBMELsm6p4JKVeKzA58YEOSL3yC3rAHZWj7pj/3b
         vH8LgHNeGhFo8VFDCDNmA50gkU7fx0GIfY3T5weG71XGK/mSdw0NhZmlARR/ExKUUFJr
         J395y0zBgnnyRcfCAfQR/WXkiG9p1IlwCoATCETpAjkokWM7Pxz4+HXASJTxNKMle2uq
         pK0IOLV8xEMXWsFX0ee+zgX5VDbmQv0h+Z/lRHo/bhji6L0C/mQLRWIFFw5iZGgtNHKp
         4/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7SlZHRojqaDrAigAWryRfk9aPa/pHb9UCpOA1gKKEjI=;
        b=VElJIFYVlzLwNHUUQiEzNgQF5rNbwwx5PGq3kWH3RzAlpfvSilA0mzpKBWs5j1gs92
         hYMY4dXn86WPBKQqod/4dLsCReWnW24T0BkP46nJoiiC6lvU0cmM/SvQ1cTSVJ3W/Zaf
         Y6Qh7x33d2oA4jukLFLNHMAa8ML9vpMZCI/7juwHfwFc0jXYa6t4r4+5MQZJnkd2mtKx
         17LMZlRUqHk71TFWcvfFkfnZl8n3Reu0LtsvROlzVYIZPxeJAfYWiqOOO00p8tzg3RV5
         aEO4knTb6Z6JFNokQq68UHj5CRx37XZlXt1NDwj3gQRy83VMvMUm6L6Yya0ydkgNGTJm
         VYrQ==
X-Gm-Message-State: APjAAAWq0LuveBgSxmQMbFT/kRkErrrdayLGw8nsO5sT2c78t1y8MhoR
	t6MXiIu5T5aB3+hRKt/6EfAvjqpFisYVqA==
X-Google-Smtp-Source: APXvYqwZ10jR7S3Jw9vaIEJhprcYYfEB1OiUa6mgFvRr2eLx6b46KUmjgNSwz8kVpt0glC8pKj6AEQ==
X-Received: by 2002:a63:2252:: with SMTP id t18mr92745343pgm.5.1564163436713;
        Fri, 26 Jul 2019 10:50:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 02/67] target/arm: Remove offset argument to gen_exception_insn
Date: Fri, 26 Jul 2019 10:49:27 -0700
Message-Id: <20190726175032.6769-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: bPKwqrXD9tgv

The address of the current insn is still available in s->base.pc_next.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c |  6 +++---
 target/arm/translate.c         | 32 ++++++++++++++++----------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 092eb5ec53..e7389bc057 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -96,10 +96,10 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
         if (arm_dc_feature(s, ARM_FEATURE_M)) {
-            gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
+            gen_exception_insn(s, EXCP_NOCP, syn_uncategorized(),
                                s->fp_excp_el);
         } else {
-            gen_exception_insn(s, 4, EXCP_UDEF,
+            gen_exception_insn(s, EXCP_UDEF,
                                syn_fp_access_trap(1, 0xe, false),
                                s->fp_excp_el);
         }
@@ -108,7 +108,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 
     if (!s->vfp_enabled && !ignore_vfp_enabled) {
         assert(!arm_dc_feature(s, ARM_FEATURE_M));
-        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+        gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
                            default_exception_el(s));
         return false;
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7853462b21..33f78296eb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1247,11 +1247,11 @@ static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_insn(DisasContext *s, int offset, int excp,
-                               int syn, uint32_t target_el)
+static void gen_exception_insn(DisasContext *s, int excp, int syn,
+                               uint32_t target_el)
 {
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc - offset);
+    gen_set_pc_im(s, s->base.pc_next);
     gen_exception(excp, syn, target_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1298,7 +1298,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         return;
     }
 
-    gen_exception_insn(s, s->thumb ? 2 : 4, EXCP_UDEF, syn_uncategorized(),
+    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
                        default_exception_el(s));
 }
 
@@ -3175,7 +3175,7 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
 
 undef:
     /* If we get here then some access check did not pass */
-    gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), exc_target);
+    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(), exc_target);
     return false;
 }
 
@@ -3569,7 +3569,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
      * for attempts to execute invalid vfp/neon encodings with FP disabled.
      */
     if (s->fp_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF,
+        gen_exception_insn(s, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
@@ -4840,7 +4840,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
      * for attempts to execute invalid vfp/neon encodings with FP disabled.
      */
     if (s->fp_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF,
+        gen_exception_insn(s, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
@@ -6968,7 +6968,7 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
     }
 
     if (s->fp_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF,
+        gen_exception_insn(s, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
@@ -7091,7 +7091,7 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
         off_rm = vfp_reg_offset(0, rm);
     }
     if (s->fp_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF,
+        gen_exception_insn(s, EXCP_UDEF,
                            syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
@@ -7584,7 +7584,7 @@ static void gen_srs(DisasContext *s,
      * For the UNPREDICTABLE cases we choose to UNDEF.
      */
     if (s->current_el == 1 && !s->ns && mode == ARM_CPU_MODE_MON) {
-        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
+        gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(), 3);
         return;
     }
 
@@ -7620,7 +7620,7 @@ static void gen_srs(DisasContext *s,
     }
 
     if (undef) {
-        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+        gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
                            default_exception_el(s));
         return;
     }
@@ -7711,7 +7711,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
      * UsageFault exception.
      */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        gen_exception_insn(s, 4, EXCP_INVSTATE, syn_uncategorized(),
+        gen_exception_insn(s, EXCP_INVSTATE, syn_uncategorized(),
                            default_exception_el(s));
         return;
     }
@@ -9254,7 +9254,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             break;
         default:
         illegal_op:
-            gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+            gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
                                default_exception_el(s));
             break;
         }
@@ -10288,7 +10288,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             }
 
             /* All other insns: NOCP */
-            gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
+            gen_exception_insn(s, EXCP_NOCP, syn_uncategorized(),
                                default_exception_el(s));
             break;
         }
@@ -10972,7 +10972,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     }
     return;
 illegal_op:
-    gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
+    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
                        default_exception_el(s));
 }
 
@@ -11809,7 +11809,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     return;
 illegal_op:
 undef:
-    gen_exception_insn(s, 2, EXCP_UDEF, syn_uncategorized(),
+    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
                        default_exception_el(s));
 }
 
-- 
2.17.1
