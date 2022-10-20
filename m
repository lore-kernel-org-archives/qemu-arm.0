Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp830352ejn;
        Wed, 19 Oct 2022 20:09:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oXLgJkafY3FfkGraRsqi5KidX1r3jhCmfIJW8vwtohKVew7HGD3MteHPbiJo2CtLfQAYe
X-Received: by 2002:a05:6214:29e7:b0:4b1:c8f7:5ec6 with SMTP id jv7-20020a05621429e700b004b1c8f75ec6mr9485046qvb.79.1666235371017;
        Wed, 19 Oct 2022 20:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666235371; cv=none;
        d=google.com; s=arc-20160816;
        b=Ps41Vg2L4rikPqzV0WDgvhP5CZ1C2qcK2LNtL81vh9EZ7MD7dGNCnJlvq9/Kki8UPQ
         A8EZW33Y0LN96JrlYMUG1JJviN1IxqgPeqXuZkU+i0luLPpzW91/7Qtl+tZNt0Pzd1ou
         GzROsI1o8buJ88FxTKWRyCZzZvG5pO/l8kAJZbEv9/1kQ6VeY94WqRRryIcY1VYzvIyt
         MrgPl/dWsTaws7h7/GoZG8gryji3bgk8OXfnZsS7WVoPgFeo8cA7jK0BXcJHjTlDUyns
         0vWBRSRTcJh4RemO9s3SkuI60RMD9XKBNM69E/ud2aZ8cQ+nF0G/y3L3Lrp1iD7MRHKH
         mWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
        b=CfRxmCD2SufYFtwb3dm+W690V63JGBbVzxoW18BLY6jwSTEE+TiysBsO0Tp+UaY75H
         YoyebkeTtz8uFm+FAFqbydxtg/QVuUfRX/SYCl+lWyextfd6T+LNyFoqgL85DFGZxUql
         gxRk3IKO/PtS1ETqF8X09Jc5qS9tvZcXDL9a+ojRVeSoPtkfQlY/EPazc4SM++N62St/
         brFfWDl46oHE04BZxhxvEoohcYClgrcvvJaHaauShK2Fy60228KAFgMuBV1kC6buyDeR
         3sI3ADbE9JwYd0pYrz1uaUzO28a/Jfd7Lxv1t64Jk3+JKOhU0YXwq/pBjvrKUU2j17YA
         88Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caHIOa5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020ac845c6000000b0035bb02a856asi9325128qto.691.2022.10.19.20.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 20:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caHIOa5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olLw2-0004cy-GA
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:09:30 -0400
Received: from [::1] (port=52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olLvM-0003UX-9c
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLuG-0003Ro-Eo
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLuC-0001qR-KB
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:39 -0400
Received: by mail-pj1-x102b.google.com with SMTP id fw14so18573608pjb.3
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 20:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
 b=caHIOa5MgtHY8Nq+lULlfIxrDjqXqwm7LhvwekE3JPu/jp5t7Qu1QjD/hYDko673dw
 UM2nN5pdLhEBd/xUhjcHYoEXeW8roR8IHoaTRCyfMTzfZb3YrDdYBnmUoF1bPmTf6Tb4
 fwFW+PJyIYV+yMLHTMLjpncCsXlKPZQDgsrQvP5gkriFeZbFiUmoamt8YY/cFgTyKw//
 G7WLEL5aQOFijIbRdOptKu6x7Oa9D+4jETmz0pyL2VYulf2SoQRgNvUKkfg4BpunxOXp
 in9lhIOHREFEuhw6Z4A76VNRc6TalXR/9h69dDSUxK81V3gB3E+ZvATiR2lmpb+5FXqg
 wW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
 b=1Bq3rNqyIJtaM6UNQIozU2mvmXd255/xc+Y6UqpIvi9gzV47p39bYCl4XsW3oddwwI
 eT/ygj4G/At/KDt1RZus8HUWVp0j4T1b2GKJWY5f1rphWD+u0V1I37Al/87WZLAL2SGT
 XYKbh0joyY850COgODO2vD/lN5gxO2CT+fUpGMLlBRy+TebFbACgKS0rnJRvE2L9goOo
 UmnuU32qaxv/3g0LZbLYQ5qkJBzsC/dU8E6SPol/8E24RngwpZDRNjJZDV3H2tmE+iz+
 P8DVtSigkqTYf8Aj2cJymT6labx8MhxqrNvkoemPYXxiTcy8BCOdl7D2Nd/1bbNyUO8e
 wlNg==
X-Gm-Message-State: ACrzQf3n4a6HJ72g8JyPqDcy1yP4E3Yk4BqPbwpyNdKqyo4V19zpzeOz
 YVq5HOMkiumGMP+GGhlGr5gXuw==
X-Received: by 2002:a17:90b:3a86:b0:20d:616f:4bb6 with SMTP id
 om6-20020a17090b3a8600b0020d616f4bb6mr49673964pjb.238.1666235253076; 
 Wed, 19 Oct 2022 20:07:33 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 7/9] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Thu, 20 Oct 2022 13:06:39 +1000
Message-Id: <20221020030641.2066807-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: flLM1xGSIv8t

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

