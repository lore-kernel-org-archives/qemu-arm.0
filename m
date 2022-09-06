Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2853508ejh;
        Tue, 6 Sep 2022 03:11:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7x80m9DEMhLWnP0nW+5rY49R29njGE8AsLVnN8a0f9ZVZgm79bPL22cX316+1KDHWXjILK
X-Received: by 2002:a05:620a:1993:b0:6bb:7564:a31f with SMTP id bm19-20020a05620a199300b006bb7564a31fmr34120087qkb.201.1662459076207;
        Tue, 06 Sep 2022 03:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662459076; cv=none;
        d=google.com; s=arc-20160816;
        b=LZjwfdHxLYIRHy19rq0oTYYU7KJRIERlNsxB2hjPBsrHldliObPZj7cMZsEqI6djin
         EkvUl+4XxKI9EBBdY5N+rMU7mwKbwffZIVHGLoJDGvhWRA/7rkQpJgpohrc5OI6B+FMK
         8FAUepob1kIfTVR26FIzJJqdcP5OaQPNkE6+EMaxqPvSXY/SoDF9RbXoJlayG6HS9j1O
         4EiohvZNJqF0qBy12zVe7CvKDKvkEQuYWP6OEMsusOaSZoiGNJvMFMeR2xQBSv3ivKh8
         lq4sphHIocd/hHteO/BP/q7dA3I7XsvKStbCn6sv6YrpdiADDPq1JTyW9nWcFQn9Vr3U
         fbHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zqM+tLT0c4kdL2N5oQ0iibAj5/0Y8nElXOz+WlKsfPg=;
        b=pDhz7UAyEyHHCYfsRzeoSE+XQaNJsy0Y2xmk/J00njSHhCsjIPJqnNMTVsabttPSiC
         h8QwoKGC1xtZ6oPG71LHA5uw3j2bd+FSBv3R4zPJtovRvUM1KkAjBzUAvPXAdi85R9hV
         5Latei6+A1ewomvWVRH9uu35X97gWwbYLd2DNqUrKroyMJ1iZSuvVXB89Pivab5NOwBJ
         CRS5yb9SQ7BzbPnPwY5tqYZKSMetGArQ0yIatKD5xkC9lqiH02AXbJFLJRM/Ocn/UqmK
         /aVAXuM7YtbvsGu5xI5ZfjqForl910pwM6InPpWoOzx1t9OyV/JUOqR2Cq9omOZKERNp
         L0bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eVBQLKgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi2-20020a05620a318200b006bba95d2306si7643735qkb.25.2022.09.06.03.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 03:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eVBQLKgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVVY3-0000pH-Mj
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 06:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSi-00044n-PE
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSf-00034h-1C
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id az27so14645079wrb.6
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zqM+tLT0c4kdL2N5oQ0iibAj5/0Y8nElXOz+WlKsfPg=;
 b=eVBQLKgEeMHXly4tBYNXHjjpRDjs6M+GyKx7+Fk+TvR8sXcxZiw2jXI33OMuyPexBx
 bYAWl601XRxFJZFh4SIhrcERSSz+GKFFuWuZMVaRpIm6ql9Q/fdTXK1+d1cIsV4Y5M/7
 TtC5VyO9gt+wGfrW5oeNxhUL13PZ1KcQBKC1AYAIWZI1whn6nCEstkCkYdjqo2Cre/ML
 Eho3zOeGu0PsWp8AmRixCTDT5M915Heb0R5ZQxzevPjMtrEcLsSNtCAk6yJjGiJPjz2L
 rbItpBFHdHXHasxDAXqmYGQI6xnP8S158a4jUcQM0vqdR7GBQbHSIVoCVQYXDmTTP4KN
 Wx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zqM+tLT0c4kdL2N5oQ0iibAj5/0Y8nElXOz+WlKsfPg=;
 b=gKF7vBQOhhlBW/1kL6fOxPvXbKLI9N49lnX4U9cKAR6D/3bnaLumR8FBgPxmNBUfDu
 05BQp2HAmq/dC+dORM+dsuDNoI4h5rRVgpCXoRJ1BmQBFETNJpv/adRwoUb6lC6ktVLw
 jkKeHk06/4PwsyojS05SWqX7D1v49+Nw2rTl2VjkazDM80HAPup7NqoaWx0R43v3/AX4
 Z7tyx/6Q2jZw+vCdiuzo1RnhafAoz66STXuowNpNEYvrXvFHogAew2VbE4ui6x/hBE4Z
 vCQpwQbslPjyNLCCXuNsib29ugN6PscGzzq670SJLeeYbQowP2LQUikbeS4m9GmzqYs6
 8w1w==
X-Gm-Message-State: ACgBeo0il9CPpMPiC2Jxx/hwAC+6C5UGsvCotrnXoRKQjGezubHxA3jW
 /9rdwMrP7Dh0BuP1ewCmuxWxrTRYMLeivNtY
X-Received: by 2002:a5d:6d89:0:b0:228:da8b:2537 with SMTP id
 l9-20020a5d6d89000000b00228da8b2537mr1022612wrs.585.1662458739131; 
 Tue, 06 Sep 2022 03:05:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 7/9] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Tue,  6 Sep 2022 11:05:26 +0100
Message-Id: <20220906100528.343244-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100528.343244-1-richard.henderson@linaro.org>
References: <20220906100528.343244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fz6jF0kIaMxW

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9bb744fad3..7dd9b29dbf 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -148,9 +148,14 @@ static void reset_btype(DisasContext *s)
     }
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, int diff)
+{
+    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+}
+
 void gen_a64_update_pc(DisasContext *s, int diff)
 {
-    tcg_gen_movi_i64(cpu_pc, s->pc_curr + diff);
+    gen_pc_plus_diff(s, cpu_pc, diff);
 }
 
 /*
@@ -1368,7 +1373,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
-        tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
     }
 
     /* B Branch / BL Branch with link */
@@ -2319,11 +2324,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         default:
             goto do_unallocated;
         }
-        gen_a64_set_pc(s, dst);
         /* BLR also needs to load return address */
         if (opc == 1) {
-            tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+            TCGv_i64 lr = cpu_reg(s, 30);
+            if (dst == lr) {
+                TCGv_i64 tmp = new_tmp_a64(s);
+                tcg_gen_mov_i64(tmp, dst);
+                dst = tmp;
+            }
+            gen_pc_plus_diff(s, lr, curr_insn_len(s));
         }
+        gen_a64_set_pc(s, dst);
         break;
 
     case 8: /* BRAA */
@@ -2346,11 +2357,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         } else {
             dst = cpu_reg(s, rn);
         }
-        gen_a64_set_pc(s, dst);
         /* BLRAA also needs to load return address */
         if (opc == 9) {
-            tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+            TCGv_i64 lr = cpu_reg(s, 30);
+            if (dst == lr) {
+                TCGv_i64 tmp = new_tmp_a64(s);
+                tcg_gen_mov_i64(tmp, dst);
+                dst = tmp;
+            }
+            gen_pc_plus_diff(s, lr, curr_insn_len(s));
         }
+        gen_a64_set_pc(s, dst);
         break;
 
     case 4: /* ERET */
@@ -2918,7 +2935,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_constant_i64(s->pc_curr + imm);
+    clean_addr = new_tmp_a64(s);
+    gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -4262,23 +4280,22 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
 static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
 {
     unsigned int page, rd;
-    uint64_t base;
-    uint64_t offset;
+    int64_t offset;
 
     page = extract32(insn, 31, 1);
     /* SignExtend(immhi:immlo) -> offset */
     offset = sextract64(insn, 5, 19);
     offset = offset << 2 | extract32(insn, 29, 2);
     rd = extract32(insn, 0, 5);
-    base = s->pc_curr;
 
     if (page) {
         /* ADRP (page based) */
-        base &= ~0xfff;
         offset <<= 12;
+        /* The page offset is ok for TARGET_TB_PCREL. */
+        offset -= s->pc_curr & 0xfff;
     }
 
-    tcg_gen_movi_i64(cpu_reg(s, rd), base + offset);
+    gen_pc_plus_diff(s, cpu_reg(s, rd), offset);
 }
 
 /*
-- 
2.34.1

