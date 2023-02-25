Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2639169ejc;
        Sat, 25 Feb 2023 01:23:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8vAqUeUsc/AXekQpOsShO9z532W4ag6FSFSkNt+spOrDn8eU/Xh/AEUIVkL9Kmk8PnN7N1
X-Received: by 2002:a05:6214:20cb:b0:56e:b3dc:fe8c with SMTP id 11-20020a05621420cb00b0056eb3dcfe8cmr34885315qve.28.1677317003702;
        Sat, 25 Feb 2023 01:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317003; cv=none;
        d=google.com; s=arc-20160816;
        b=LWvp1yZfc3UnyhlsP5rSb7GQnkj51sqnCP4ac6ReYKjSVwi+imPubWh0/htWq8u/nu
         Mq+xmH93dMpMCO2i/PRUo1LoJq1HLQb3Qmv8cNAnVwNOxSAw4tBLulYTrJhMLI7FGVI9
         dfLCpdWdHE13XF8hOa+KNN/+17rMiD/NhJ62jSaGtybnnRYzCASV0UX+SSI4KeyXiBhh
         XrQpjPVAhCXaOAyv0QNS9t0PKWACofoWnaVNOC0Zrc5TOR89A057wwKGi72WHkYJM/e0
         1Tg3II+t7IM7XB5IfZ79RGr9RPdOUvWm/CV3oufF4GZi07JWlqdas6nqG4T15paqq1UU
         whfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7rXk1sKSqinlJBrFL9P/VMnnxUDcgz/M8L7XKzjlIwM=;
        b=x/Kjomrif7HcYCf+b2DApt+kvv82MlM6wSF74oDhn3KVSdMZIWp96MN9rEtuGHG530
         IyWFlOr/M2MDywdaTFTpTTJ9N++WdKkI/OVhvn0He9ggTe4K3r6bp4y1PeyFB1bzy3DQ
         b2yf0qldVkPc3FjfsGBeFbcv4A57azJ8eNq9AyeHwL2HI61g+4o40Ikenb/LgsTYqvS7
         5UcDHv6GH6x5jVnr4EbvTUwmjNU7C4t2uNNFtO2tyMunxylGyoA5uDdaY0HH+r1PMumQ
         hxoeXw0ylM092udh6awhFQYuPfH4z9HDtGWZtYn2gMd2vgOeHX4WfNbkvl9k0LpTbZLy
         Vv7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KtrkV8Br;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020a0ce147000000b0056eb4526031si1441957qvl.91.2023.02.25.01.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:23:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KtrkV8Br;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqdx-0004rq-AS; Sat, 25 Feb 2023 04:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdv-0004po-W6
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:00 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqds-0001QW-EM
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:14:59 -0500
Received: by mail-pl1-x62a.google.com with SMTP id l15so1905921pls.1
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rXk1sKSqinlJBrFL9P/VMnnxUDcgz/M8L7XKzjlIwM=;
 b=KtrkV8BrlUDhgiWkKXhfJ+IjkikHl7XTjLl+UBKFkvKc7TaxwwJ9CvHBzhXE0wQB2m
 2jEAG+sE2ysGeN9gL+BKh6+TyN7XOlIW09PacKbM4/NRgvUQ0QB5tbWx2ZoFs8qZVKKr
 dI0LKxHUqSBiZkyZF0NE7eLjX6htiHhOHdPVC/Qzx6ULqzpRLwUzX9ccYP0og8FTrU9+
 Fv9SA5zWeL/VfCeY9Yx0av1rttXX49XOuIJyvN5XaYP2aUGRDpYAJoLO6jUfVHtW/vwc
 ES2VNyT1KV9SmJ0kOX8HR1vjDCLLhadyrZ578c2WsjQaLtiQcwKpcfOe5RMphXrxMaci
 tbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rXk1sKSqinlJBrFL9P/VMnnxUDcgz/M8L7XKzjlIwM=;
 b=2ZXNKODiTjx+Ocl1Ig7zeo6WdLluX2zz9oWQsduh2t1A+NbrWahi3O4GRREYkmzGQv
 TMPM1cxuv7VKsQ9iH8xxGbSSZQUEhGuhRUO/e2yOikRJwpx/0ApN5qsd2jRE1l9d4hTl
 E6HlTsz8MTBkJ9+ApeJX6CIQaWlxnIvYHe8TkiwMblLFHBaNPBiXiUL4P9VV7NGdPxht
 oIppGF1t14wqUSZ3hRwGpd/ytnQ53sYoVlmZzAxtrjflQImI9beaIXp1qc70Ct+n4tP0
 mMD/U4rYukcowEr5NQhofmRJxP1n55mcrSAT0eMMKbObcKx57q9mdyYNC759DZHG74Ip
 ExXA==
X-Gm-Message-State: AO0yUKUO9BxUPJ+KQxrSaSkg6uveww7ioRsZAIErQY77QE4KnaCp8wWm
 +Es4rgW2IidmwMcgR6KZEVLRKQ==
X-Received: by 2002:a17:903:2291:b0:19a:b427:2335 with SMTP id
 b17-20020a170903229100b0019ab4272335mr22851992plh.56.1677316495628; 
 Sat, 25 Feb 2023 01:14:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 09/76] target/arm: Drop new_tmp_a64_zero
Date: Fri, 24 Feb 2023 23:13:20 -1000
Message-Id: <20230225091427.1817156-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: qYonvwWbnsGJ

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

