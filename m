Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4288762ejc;
        Sun, 26 Feb 2023 21:28:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/BQ9/2YDhFl0lJHzhJjvvsI562OdeEustFYWquoqgyyIMR5l5xfiH9MUQEAGfL0LSNIVCw
X-Received: by 2002:a05:6214:1c09:b0:538:2ccc:5617 with SMTP id u9-20020a0562141c0900b005382ccc5617mr45756906qvc.43.1677475687080;
        Sun, 26 Feb 2023 21:28:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475687; cv=none;
        d=google.com; s=arc-20160816;
        b=lg80sXHVrV+BgRFsWCy1ZHZYC076Bwx6B0J67ylR23Vdyg5r7ZalKEexDHUK2QxM2/
         pUNsJ1vFyE8ahXJ0RvOC52exy3WLKQkMQvxsy9xPgcBkI7FkTXYbM3n3Fpi3tiZF9378
         ky6LK4ac3Yn/VotuuyOykUsLB7DedSO3Z0SkLGtKOU2AkYPu0eefmOIHmGscBt5+I4Ie
         rkC9dK83iTF7oRNoUo+TgM0kJhrMnT8srKX5Cg/tiQ2xVNlmCQp/RzaWPUklM7Uh5VaD
         n7Zoq7S1lajGeqrH6bdYrzpejc1BDiOw3yQztmscRBVUZLQoC7a47bibXxuNxQR/+kZj
         8JLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7rXk1sKSqinlJBrFL9P/VMnnxUDcgz/M8L7XKzjlIwM=;
        b=Rs0Rz+Jwvl451vxWKNJ+8RtYoXJS1VN0SBGHv62E+sIrEDxioQYqb36StDsBBA/DsL
         9HStoCfhz3aaNpSEt+14BGhCGzHrlkYK/4QEykH4tzUFbG1ZKqDtrMR/Frm1OYYpgm+S
         pFoeF3W+ONgCoHj/oqmXw0dYpEqUO5a5QudRVgFJalXZ9eaEjzpvUh4tUO1h736WNs5p
         rVroLIdbNMyLHyZVvaFd4EUudQkvKAgOJNm+FJ9IX+Lw6LqOuPu9iUaAiucn64/YF0Q4
         XNncO15OBr9lTtGRbNgfT0GzKAKzv7VlAtkfxyrtWVSNy+2FV1ZbLLFQ81OzViYrZ4DB
         ea2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iBUO0I6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020a378702000000b00742b7d13094si668591qkd.2.2023.02.26.21.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:28:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iBUO0I6K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW1J-00075B-Kb; Mon, 27 Feb 2023 00:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW16-0006lF-3x
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:25:41 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW13-0007My-9t
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:25:39 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so5001251pja.5
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rXk1sKSqinlJBrFL9P/VMnnxUDcgz/M8L7XKzjlIwM=;
 b=iBUO0I6K2axChAXmnL7RumH5ABIuO0oC17d4GVO+ll8rulb28mqJaTerL47dYFuMoA
 fggRX5zjBgu6ItGme89+8YqayZgGluTIL9aOG+zzXAigh1jq3wbxLC7QhT9gdTua5jCa
 0ONU8ofUlZf0MFlXd/+GILBI6Mv8iwSTjk4jgsIkWCpBb8OQtHyoH7xD3OxTehTQzpMw
 23bruLMPbV7mNIbTQBsURTRnzLSN+iS1366mHbkv0QgJZZoaPkrIznK47gtZMi5BBYs/
 yzd1Z4IBv7NEck24yaTOxyPyIUbei7q/EaH1U7QGbbLh+o9xW9ZPHH52HF/lSR80pUSN
 7yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rXk1sKSqinlJBrFL9P/VMnnxUDcgz/M8L7XKzjlIwM=;
 b=WWkx7AUzVbXrZVpnydYhTJNQoFcZAD4L+ImodEIfvlqzAaicVMLN4hdgB9nfd+AvWr
 AOLu8WR+BZRx2zOHjGj4ew2xK7KfRpTuSSp9iiPFVLAQQpCqlAqaeG2gDQEotU53I1FG
 HvJ3XxAeO1Os7kKLi0MJ0OGtVFmrbAE49FWhwAJ0g0oChE7gG1AKngRwcDCOGM73XxfX
 vIMLikZ+EGL28oAulnkmdd5Y4KyYDUxfTXcdBBWErveNwxcC6TDF3gR2hdDXpcMA5AXA
 GX1KORbq6ncsDumRZiUGFsdQjlvI7ysyyl0hV16uv58YsZH4E0hB8biQEDRZYajya6QM
 UA+A==
X-Gm-Message-State: AO0yUKVQKU//76munGUBVrCtWQThIAKc0dqXtuMYYIyKNcFBwzX8ay4Z
 NIX7wf2VdjQswq+xWWpm2/EibQ==
X-Received: by 2002:a17:903:1d1:b0:19d:1dfe:eab4 with SMTP id
 e17-20020a17090301d100b0019d1dfeeab4mr1243388plh.41.1677475534806; 
 Sun, 26 Feb 2023 21:25:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 09/76] target/arm: Drop new_tmp_a64_zero
Date: Sun, 26 Feb 2023 19:23:58 -1000
Message-Id: <20230227052505.352889-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JR6cgoHevWb4

Only the use within cpu_reg requires a writable temp,
so inline new_tmp_a64_zero there.  All other uses are
fine with a constant temp, so use tcg_constant_i64(0).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 -
 target/arm/translate-a64.c | 41 +++++++++++++++++---------------------
 2 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 8ac126991f..0576c4ea12 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -18,7 +18,6 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
-TCGv_i64 new_tmp_a64_zero(DisasContext *s);
 TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
 TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 04872d9925..b5d6508cbc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -408,13 +408,6 @@ static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
     }
 }
 
-TCGv_i64 new_tmp_a64_zero(DisasContext *s)
-{
-    TCGv_i64 t = tcg_temp_new_i64();
-    tcg_gen_movi_i64(t, 0);
-    return t;
-}
-
 /*
  * Register access functions
  *
@@ -433,7 +426,9 @@ TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 TCGv_i64 cpu_reg(DisasContext *s, int reg)
 {
     if (reg == 31) {
-        return new_tmp_a64_zero(s);
+        TCGv_i64 t = tcg_temp_new_i64();
+        tcg_gen_movi_i64(t, 0);
+        return t;
     } else {
         return cpu_X[reg];
     }
@@ -1532,7 +1527,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11000: /* PACIAZ */
         if (s->pauth_active) {
             gen_helper_pacia(cpu_X[30], cpu_env, cpu_X[30],
-                                new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11001: /* PACIASP */
@@ -1543,7 +1538,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11010: /* PACIBZ */
         if (s->pauth_active) {
             gen_helper_pacib(cpu_X[30], cpu_env, cpu_X[30],
-                                new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11011: /* PACIBSP */
@@ -1554,7 +1549,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11100: /* AUTIAZ */
         if (s->pauth_active) {
             gen_helper_autia(cpu_X[30], cpu_env, cpu_X[30],
-                              new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11101: /* AUTIASP */
@@ -1565,7 +1560,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
     case 0b11110: /* AUTIBZ */
         if (s->pauth_active) {
             gen_helper_autib(cpu_X[30], cpu_env, cpu_X[30],
-                              new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
         break;
     case 0b11111: /* AUTIBSP */
@@ -2285,7 +2280,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
                 if (op4 != 0x1f) {
                     goto do_unallocated;
                 }
-                modifier = new_tmp_a64_zero(s);
+                modifier = tcg_constant_i64(0);
             }
             if (s->pauth_active) {
                 dst = tcg_temp_new_i64();
@@ -3550,10 +3545,10 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
     if (s->pauth_active) {
         if (use_key_a) {
             gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
-                             new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         } else {
             gen_helper_autdb(dirty_addr, cpu_env, dirty_addr,
-                             new_tmp_a64_zero(s));
+                             tcg_constant_i64(0));
         }
     }
 
@@ -5628,7 +5623,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacia(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacia(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x09): /* PACIZB */
@@ -5636,7 +5631,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacib(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacib(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0a): /* PACDZA */
@@ -5644,7 +5639,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacda(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacda(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0b): /* PACDZB */
@@ -5652,7 +5647,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacdb(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_pacdb(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0c): /* AUTIZA */
@@ -5660,7 +5655,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autia(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autia(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0d): /* AUTIZB */
@@ -5668,7 +5663,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autib(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autib(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0e): /* AUTDZA */
@@ -5676,7 +5671,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autda(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autda(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x0f): /* AUTDZB */
@@ -5684,7 +5679,7 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         } else if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
-            gen_helper_autdb(tcg_rd, cpu_env, tcg_rd, new_tmp_a64_zero(s));
+            gen_helper_autdb(tcg_rd, cpu_env, tcg_rd, tcg_constant_i64(0));
         }
         break;
     case MAP(1, 0x01, 0x10): /* XPACI */
-- 
2.34.1

