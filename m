Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1184951ejc;
        Mon, 22 Aug 2022 16:31:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5iUFCkolZzGvUOWemnR3hw4V1eJ6rVzIuBOnNKkphZuIjs7/Nk4rTumIs2HGH4LfvYNFn3
X-Received: by 2002:a05:622a:141:b0:344:5685:836b with SMTP id v1-20020a05622a014100b003445685836bmr17349606qtw.119.1661211070238;
        Mon, 22 Aug 2022 16:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661211070; cv=none;
        d=google.com; s=arc-20160816;
        b=k8zYPyYzEfGeZJd2Kxf3TsmCVq1mRb4e79rDP2Ak3qJYVz10fXsP8iQabQCKMcNmIh
         cSf4Egg7ZsbxA3VSUHAmnkbi9jBWlKAMB2V/8X18n69OBCDyPGbd4xuu0ydCdjKnYR6U
         lE+KlNgk0bytzFqGi28Y3TIoH5TdXlOPzkgO15hqHdhgIR0ZUf3xIe6vWYe3vvJwHOi9
         DDRrZsEG0xW9EUwN6CL3HqNoJvvQLvIS8WA8OzzNw+XpowFord16+JeYrb+OfX/vhtg5
         cwXEt4cGw+qL5xr9viPY2f81BbAOSroQO2ObZ2kUHq1zpa0QsnTggqXMUuvjbPu7TTX2
         v2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bPLSwnwAm3KKQjuztom5hM3FzbmQvthZN4SqhLXx1Bg=;
        b=aYpaG5Ce35dNtkaJCPUtATh73uj1m0Zj2XUzyNKMLEYQjH4BZfH4BgGRWVsDQX1d6h
         1B/sB6TDVSzCJBy/OvdkFXrO/VhSzCBFGBhuaj0Em0Aoz/Xw74cCYWbWvdXGX2RHcy7h
         +h/eei3a1KvT4NaKm6yMB4OjEfi6HU0KjtdBZM9xs1dG6B4vlLN48kS8l6tG92JBevyQ
         xkf8eBsaH6LpIml79vRczVBOpEycBvgRaQOCIKjbMPPvP7HL6MpJwWugFUIXqsTcYQAL
         Ek1yYuND5kSXJpNRkJFeNJ4fmQZ7VeV79TjekXahe8u9xLvQL0rvqlrpQBJ/QQsDBu29
         oC2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeNdYtLA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22-20020a05622a101600b00344779afa14si6176563qte.673.2022.08.22.16.31.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeNdYtLA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQGsv-0002AU-Nb
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlz-0005jW-TX
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:24:00 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlx-0005bv-VJ
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:23:59 -0400
Received: by mail-pf1-x436.google.com with SMTP id w138so9197431pfc.10
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bPLSwnwAm3KKQjuztom5hM3FzbmQvthZN4SqhLXx1Bg=;
 b=UeNdYtLADZG4eSDIPPAhVi4iVHBkj7Yk9I/guWApjmVI3meS3LoDAp23SpcgKqbece
 d+/gxLr0Xfn0UvS5MV7YKDX5pzM19o53gf96v3BAxEBQd1RvrB3vnQtJ1ixO1EAShzOp
 IcuF7eQLmPutmE4UVj5YG1Dl3/NZ7xzrdtfKwsuE3Dd6A6H7IzBollcn2FP1Q4Gx//RP
 GNqau1xp2bM3YZP5dOC2A2W12Y7arlTK5i2hQfOV1YQFmXcuz+sZAfZkPTedInzGxirr
 +kTt4SSMbZ9PENtllAAOOh3TZDLSof6hOoT3BpW4nJ/tWZZg+nZutuHp/YZTS4WdJogq
 g4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bPLSwnwAm3KKQjuztom5hM3FzbmQvthZN4SqhLXx1Bg=;
 b=Wj73VAs3c21hg7MF3StGTUcUxxQvo1dYSNihb2bFh5X1NzjtoWMG4Z8iSVISYBI04t
 Jo1A6iX2sOaX4DYETh4VpW4FSVZkH4DUpQKGMKO+SKwQtCwYUpv3piMpwD5D/v1962Ud
 vWJ15uZxNELpcFvtucJrejvi7fUwWy3jUuUR0HhUBJ7a2+Mqg7n4WmKpPFOYAeHC6uzE
 TNS/9iXoGk+rZzcZ2bAvp5U0oiVy20ECxdzAZJK/7Fv5uCOxfbye7C3u+G4I2qZGs1Cz
 RnCvRmdrP3Ak2qWch3l950INLpGOUZqUO9DUFPpyXXvxzEerP16+jBRz9JWNyjshhn+J
 J5jA==
X-Gm-Message-State: ACgBeo2aGEo3t731zgcjWXlCnuKhPyXjOTDt2xR1nDKyBe8ccqRSI3S1
 nTTLn8xC5qPpgmkKsqvCpWOiJQ==
X-Received: by 2002:a63:ee49:0:b0:428:8e10:200a with SMTP id
 n9-20020a63ee49000000b004288e10200amr18580455pgk.453.1661210637193; 
 Mon, 22 Aug 2022 16:23:57 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 15/17] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Mon, 22 Aug 2022 16:23:36 -0700
Message-Id: <20220822232338.1727934-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1XyW8sLfEIO3

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b777742643..322a09c503 100644
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

