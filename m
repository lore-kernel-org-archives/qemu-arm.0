Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1969315ejn;
        Sun, 16 Oct 2022 15:11:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78WQ7kZWZQzriyZFtnV23RAKbdVF7H3phRF8IP/hsvg8bRPJefzGg45ezx/WQYVbt1qXgf
X-Received: by 2002:ae9:e107:0:b0:6ed:638:930 with SMTP id g7-20020ae9e107000000b006ed06380930mr5629287qkm.211.1665958316194;
        Sun, 16 Oct 2022 15:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665958316; cv=none;
        d=google.com; s=arc-20160816;
        b=McRfBkj8t5sw3E6eH9u2gP4WQwxPyYuDeoiAfzlqLYi/wRHXcRB2bvDkvt/Ja4rFAU
         a+IFc3RUcGJtW2AXZJEO5gZ0qZGV9G+BanbYBYCkFyumluCbRFL1rQaIPd1yBrwakeLM
         MPr0KEzyj/Wo3FRHCfug71e/khRfB8fADjXjAOeyop3oUMB6AsDHDO9IYDZHBC18zvki
         J+fhY9GgIASm1fD06TzWO4YgewT50/HM1EyUxjBAr82F4VyPf5Hezq66XzQlD1+qfdce
         Hfj9R3D4eYoZsWFnzUXICK8rXISZ3QJOkdX0ASIDuIh73oPQdmQo/5+D/TizVYLzPbCa
         6USA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
        b=sgJGpx+zs6hO7+qBE/OpJlQynJkQYY1CqabogI9E6JYB90nbsHngIzUGxviTjcOqbE
         sAY0yKx6WsY3xVXUE8CYpdsNRtZJngp/hh0cxsAVzzawrqG05gOFfbW7BHQV6/eTFHrS
         lRpT5Ye/p3VHbUOEuMH7zZXkSNf1pL1xX892DFm8Dr032DDH7fPNIMBOtAHdgHd/rh/X
         RTkeMGnWBVqnixLkKKmBC/S4wmHUJPFlepBqOScEdmhE7/B6tpu4lkob9xU154n4aiBn
         vWJYngt3m3Ca5MRlROA/VeLePMFpYp4uEZ+pq5JHgO3O78AAEIS0jWN35ULYyIEVxOp+
         Qr0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DWWlbicT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a05620a284b00b006eaa4d5345fsi4892607qkp.153.2022.10.16.15.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Oct 2022 15:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DWWlbicT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okBrP-00039m-FD
	for alex.bennee@linaro.org; Sun, 16 Oct 2022 18:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBqA-00030D-1d
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:38 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okBq7-0007fO-Sb
 for qemu-arm@nongnu.org; Sun, 16 Oct 2022 18:10:37 -0400
Received: by mail-pj1-x1032.google.com with SMTP id fw14so9425743pjb.3
 for <qemu-arm@nongnu.org>; Sun, 16 Oct 2022 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
 b=DWWlbicTbMVUY4M19gXQ9o5PB+Ee82e/rivgLStBijcOu3nU8fR3s77EVG+WpROr4P
 jCdzYrboltVOimwb4kOVrt4nNCkgKfZ82PmKkbm69tEoFn0qDD3nRPOOrCZHJdKlsKBb
 D+mluva24SZG3TYz3fBAFXhOxiBB6sP2CbxAC485JC265sBi1FUWvyZ4v+zXk7HiuFrF
 H5xfC358YtzK57IVEy8ki6Vu9iOHd7c59dwmubuQRUjnvY0gkC1h0aGnBofOam6FQvdB
 D2T60iZypVNmDMa6bimXHJ8Wo5SmNKSBReIFQe9kr8NKmbiqO3nHtGiAvAUzCCEsVa/J
 pBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
 b=0MWap4nB5mLjAmqP1otxKcb0tAxs4ShhBPi9AOnDxeCNbvPSCSO4fbQLefLz+eC7Gm
 eg2VUwRtzA5W7gO0xxnHiJYhkSvC2KOcDJydtFvz9oBQOBk4X6uHM/WwdqyEaNZPWUBX
 KSMrmPc05NYkkXtzwOlWoAIrkB19LyxbWnF+cxv+RCJpjPgpcR2uroP992VYRgKZUVj4
 dVxb8ro1L4ONQxy3N9ktz20AYsb4M1n17u+p2bJiRrwIbLhVxVLJUBlhPyUqxuqnmLnW
 AfAqK10VdZzV0+yqPwD/pGencLB3fbn0wqbM29ZVHnMLcPZNJs0RCFCfMsvGF53QEFzn
 LSZA==
X-Gm-Message-State: ACrzQf1F5hJ8eD5UKC3k1eM2WNr70Gz4jrFSztMBduECpHIexKPo0Jfg
 GswrLs62J/fvVFiy7r1KW28bc7fF9q+7lGwy
X-Received: by 2002:a17:902:d48d:b0:185:115c:b16b with SMTP id
 c13-20020a170902d48d00b00185115cb16bmr8912686plg.158.1665958235067; 
 Sun, 16 Oct 2022 15:10:35 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z18-20020aa79592000000b0053e2b61b714sm5454751pfj.114.2022.10.16.15.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:10:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 7/9] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Mon, 17 Oct 2022 08:09:30 +1000
Message-Id: <20221016220932.274260-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016220932.274260-1-richard.henderson@linaro.org>
References: <20221016220932.274260-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7if0hclY6RAh

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 623f7e2e96..f9f8559c01 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -140,9 +140,14 @@ static void reset_btype(DisasContext *s)
     }
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, target_long diff)
+{
+    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+}
+
 void gen_a64_update_pc(DisasContext *s, target_long diff)
 {
-    tcg_gen_movi_i64(cpu_pc, s->pc_curr + diff);
+    gen_pc_plus_diff(s, cpu_pc, diff);
 }
 
 /*
@@ -1360,7 +1365,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
-        tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
     }
 
     /* B Branch / BL Branch with link */
@@ -2301,11 +2306,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
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
@@ -2328,11 +2339,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
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
@@ -2900,7 +2917,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_constant_i64(s->pc_curr + imm);
+    clean_addr = new_tmp_a64(s);
+    gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -4244,23 +4262,22 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
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

