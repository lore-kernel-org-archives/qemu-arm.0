Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp44636ocs;
        Fri, 30 Sep 2022 15:15:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lyR1GrBRmKcBO/mNbXYv2xtsITSlvX3RBapAN7RIH5KK8OfREnkOR4ajfXCljeW0su/rt
X-Received: by 2002:ac8:7d8a:0:b0:35c:b85b:9c8a with SMTP id c10-20020ac87d8a000000b0035cb85b9c8amr8779505qtd.628.1664576112090;
        Fri, 30 Sep 2022 15:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664576112; cv=none;
        d=google.com; s=arc-20160816;
        b=xQjaKJA+yvpOy/cvpxta2mg0lImMWL9O1lWWHk88llEOwom7SK+8WP5x5i5Dk0BugZ
         3zQzy3gd66ScBVJM+MSxagLZLPGMH0MFOSYM1dyqjsN6BF62wfCTzJ7XFCWrJ+atposG
         DFdt41LqELHZcKrUJioYG7NMn1jNtn9ENzTCWqfTKUaE0mhHAWUf/zV+iGjJVxIdpo8k
         vL3VF7mCkWy3CbpUySn5Cm00qgRJc6mm+V9BQ3xFzbQcpLJohNq3sRDV0bgYSkQHTSOA
         OaSYAwF8pQ5YdEaZkRfAEn5j+AHs9dJIh8fqTILPvA16U7H1jYeVAjbHj7EH3d+CdU3Q
         1pRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hvGMsQzzrx+sQNIbudB82iz6OLqksguoV+s5DVfw4Xw=;
        b=Iooo/ojpJ4uFbUnW7mpklVDxCAjtJ3jB9a+ux+LrfijzNd6qOuVlwemn9kei0RB5TA
         hHO48uWU4SiL+xQ0xxNAErvR9E/L6QBR2uq6M/STjX+HrXtTx3l7xZrCGCKp67yUDzWd
         EsxRgT/+P0RzRab92QBRsbHd29zcv8ikpci2+1Unb3iBYEJ6XwdD+vBkIQMQaXgtN8go
         Hq6Cu8bBPNE/aSQ/TI+5ovD3NJruCW6o2j2w2AUoAJ8q/sLpWq/fZJqGJvqi1YWIqvdI
         5MrNnQus5BbLuMGqE6cXew4ZP0FFSN6caRV9iCAS73AS5kpSck3mM7PfZAtyD6eQCs9A
         rrsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eiaoGbG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oj2-20020a056214440200b004ad2a2e1106si1471477qvb.239.2022.09.30.15.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 15:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eiaoGbG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeOHn-0001v6-It
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 18:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6V-0001oa-Sd
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:31 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:39503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6U-0002aA-1H
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:31 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id z18so3425805qvn.6
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hvGMsQzzrx+sQNIbudB82iz6OLqksguoV+s5DVfw4Xw=;
 b=eiaoGbG450p/2PA7qXJpqyzZs4PMTJa8rAvZ+khC+reyG6yeLvAHLGKxEaXBMXY/tX
 qliOHqPBH9/IRNB/N2zd8By82qWXe+GoipPCwrtbw5fIi1nUslUkOdyzjIid4MyCfZ3Q
 LNwlovEr7wCen3Bjvb14wlS0cvQrG3PZbQwr3TFZXB+/7gfcVLnd8ZfE0+m/06J5lirP
 zRNwvSBvaC1Lf6+qS80V6IwlH2CtKhGPqBmAzDejAQxwj2ZIWYi+QpOgYCOhQbnJJFgW
 TWMI9fAEHYgfnAdx8VCOLBgFRL5xexpF6gtMnSVP4VkFBmngs9P5BZFhU1gPkggkTkf4
 wH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hvGMsQzzrx+sQNIbudB82iz6OLqksguoV+s5DVfw4Xw=;
 b=SQKflw87oHC88etOSgIDvcoyMYrg9A1uBoCA/QZmyEswLKGzYOn9vrc2kneykuZLet
 BfOAVhy+L+TlNUmu2Dh3tQnwm4hx+j028gXiKpebiTptcSWonPtbN6ErlRPtNtQp7WIL
 eW/YUR6jk8mZp+eyTklAmG8cB+OIkFINPf6FgadB+yaSvtjCtPsXF6OGypIUWLaG/s8X
 zrUgG3BwgvmOUO/+PmwUIEOUMBlJBOPUsDcuqwoY5HS1SHQW8/gDbKwI5sA3tEpxTFaR
 Rn+7PVwrimGwcjXkNEE1ATR9FMWR452G22G0zjo5D7aAWr00O3ydPV3bP2vXlF7Pi9JR
 /y7Q==
X-Gm-Message-State: ACrzQf3g0HUB12K/V+RKWHtyjpHjv3BX02PHC7KcTRilcyeKRP8j8vRq
 6lgKO2uz/6GtgV5wzwKVm48tCw==
X-Received: by 2002:a05:6214:27c1:b0:473:85c9:3eeb with SMTP id
 ge1-20020a05621427c100b0047385c93eebmr8830144qvb.53.1664575409138; 
 Fri, 30 Sep 2022 15:03:29 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm3196055qki.79.2022.09.30.15.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:03:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 7/9] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Fri, 30 Sep 2022 15:03:10 -0700
Message-Id: <20220930220312.135327-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930220312.135327-1-richard.henderson@linaro.org>
References: <20220930220312.135327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
X-TUID: V+v75dwjpQNb

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 005fd767fb..28a417fb2b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -148,9 +148,14 @@ static void reset_btype(DisasContext *s)
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
@@ -1368,7 +1373,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
-        tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
     }
 
     /* B Branch / BL Branch with link */
@@ -2309,11 +2314,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
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
@@ -2336,11 +2347,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
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
@@ -2908,7 +2925,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_constant_i64(s->pc_curr + imm);
+    clean_addr = new_tmp_a64(s);
+    gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -4252,23 +4270,22 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
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

