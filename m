Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp40345ocs;
        Fri, 30 Sep 2022 15:05:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7MM2g9GVGE3pzWrLwak9qUEwN2v89yRyxdF1BGEEjoBljC4nFokzX9DcMtf0y31HRN2XGN
X-Received: by 2002:ac8:5d49:0:b0:35b:b603:504a with SMTP id g9-20020ac85d49000000b0035bb603504amr8670415qtx.511.1664575522245;
        Fri, 30 Sep 2022 15:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664575522; cv=none;
        d=google.com; s=arc-20160816;
        b=pC2SD5HyDS0LxYDoDt/rjlEKu7c8SJbOPvS8W0cStPZUdOpX4ThIOBSeNKqH8FxLlu
         AB+lmA7VROwfRXK9fvjNhD3VClY6bF4GOU9YsRPMpwRodGjr70hz5ihq4SIvzQqH+ttY
         2ei+NPyY40OPjBhzQQg1zqXkNGLBhSFbvJfHmA5QzVhBerrxsZjUmv+3XQQNXmyCA8DQ
         monY0Y2XyeRjFMiWl4AsyBPYJtFWXxgGY1YfCnnWi8JdHL5HC9cJgKTFOwFEh1eo33mx
         97GN3I/oE7PE9mT4mPkQW2cRLe2SUMb2Nm6mdiK0R0kf0QSq305TaqucxVAiNS00n2no
         ugMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XYRaFM7NBrkMyyb5R6XrzLrGa558v90pQOaMAn7lGPk=;
        b=Oojsr49V7mQQqN6X1KNB6Gmx2/+VXv6VplSfLqIrmV0tH2rvpFyaNK6Hh9WP+pESWY
         JDIFbrYQUnVQDFCFf33K6sKERjIUpYaFDUeb/QM1H6QYZR0SUbmFYt/5gEYBHqwcikeJ
         Q56NoptgqnLcp4dBhZljANl++wNN8ieQn9DOGysQi5FwJz9ob0O3cXBmB6dcwqYrZgwL
         +QbmLMve4bb9glp7GF7qfDh09OxZMoeV0gA7ZfXVe/tXs7pzyzLYJpyXab1IOekc1gos
         Q/HgjY7AVtWhIZ9nbG5wSeQgjffAudRGJ//HQUsKyyp/CID+TOYDnPDtmqxua56+KprM
         pZqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rI6yTkKj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb10-20020a05622a480a00b0035ceca082fasi1867378qtb.214.2022.09.30.15.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 15:05:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rI6yTkKj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeO8H-0003ZJ-Od
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 18:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6Y-0001xo-Q4
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:34 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:42782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6W-0002aS-Tf
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:34 -0400
Received: by mail-qv1-xf36.google.com with SMTP id u8so3634293qvv.9
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XYRaFM7NBrkMyyb5R6XrzLrGa558v90pQOaMAn7lGPk=;
 b=rI6yTkKjofz8jEr9XLfNhWVOBExlrXv/bvy9Ps5Oq3kW3b4e7ChbvYn8HZAmrLE6Ox
 f1Hqyc9CXBY/ETROk3RBeASrGPIxzzgB1ASOouXy+gJQKnqWUpfXQQLo3hvajTRX84qQ
 5inH7n1LO54jzEJUSvPdC0nFe+zITo9p2z/545v1ft66A3+4jxUMH8TMQGTwlpgsoKmc
 Aphvnp/z96pTDX9tQsOkmsFIw+5lGcODobV846xYqShWSZ7uRI7FVeTd2DVMCvEqUbWs
 jAwLIBcIA40Iw3gEvjDAVYMf897Gjcw+jNGEvKJtgvLLKjWtEES22mPPrEHKr5UlX+zm
 QgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XYRaFM7NBrkMyyb5R6XrzLrGa558v90pQOaMAn7lGPk=;
 b=tv1okfAavAKZRMceftHPZTU1IRgyEV05kJJXKMV048XFPTfE5BkyUmPqspRrX+LAtL
 W7Hc4H6cfO7N9LiuT1vPLrihdNLUQWrnZ+QcIiwAibLq8kspGPotbiDXN3E2QUyUIBZ/
 BT9CoWhwCYZNTXr2ZQq6TgJYM35anHmPwmv075AS5n8R2R42F2hEDYoUeaXbwZzgWQgD
 uU2IJl7gsUzA70bAMUjHqjO/pOPleZn3JTfxmYtqUeEQAs8Pl5SXNKy+ttMV3Nm1VXy5
 PT4lbvUlg8C2jk5jJiy9pHuPMyZDPBagGJ6byfiZlp0hvX+Xsf8UcscU/3mVMCv7oRXu
 tBHg==
X-Gm-Message-State: ACrzQf1QwO6di8+oDG1yLKmrdbkq5CmjKjpnnKGEuktEniFOvPqyMuca
 KwNU76jc8C98fphGaWc8H71xrQbOoiU1jQ==
X-Received: by 2002:a05:6214:21a5:b0:4af:b677:7429 with SMTP id
 t5-20020a05621421a500b004afb6777429mr5700033qvc.60.1664575410834; 
 Fri, 30 Sep 2022 15:03:30 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm3196055qki.79.2022.09.30.15.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:03:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Fri, 30 Sep 2022 15:03:11 -0700
Message-Id: <20220930220312.135327-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930220312.135327-1-richard.henderson@linaro.org>
References: <20220930220312.135327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
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
X-TUID: fZeXNPWGckQu

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fd35db8c8c..050da9e740 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -276,11 +276,16 @@ static target_long jmp_diff(DisasContext *s, target_long diff)
     return diff + (s->thumb ? 4 : 8);
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
+{
+    tcg_gen_movi_i32(var, s->pc_curr + diff);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
     if (reg == 15) {
-        tcg_gen_movi_i32(var, read_pc(s));
+        gen_pc_plus_diff(s, var, jmp_diff(s, 0));
     } else {
         tcg_gen_mov_i32(var, cpu_R[reg]);
     }
@@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     if (reg == 15) {
-        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
+        /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
+        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);
     } else {
         tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
     }
@@ -1159,7 +1165,7 @@ void unallocated_encoding(DisasContext *s)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
+    gen_pc_plus_diff(s, cpu_R[15], curr_insn_len(s));
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -6483,7 +6489,7 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
         return false;
     }
     tmp = load_reg(s, a->rm);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_bx(s, tmp);
     return true;
 }
@@ -8351,7 +8357,7 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8370,7 +8376,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
     /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
     gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
@@ -8380,7 +8386,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
 {
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    gen_pc_plus_diff(s, cpu_R[14], jmp_diff(s, a->imm << 12));
     return true;
 }
 
@@ -8390,7 +8396,7 @@ static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
 
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
     tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8406,7 +8412,7 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     tmp = tcg_temp_new_i32();
     tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
     tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8729,10 +8735,11 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
     tcg_gen_add_i32(addr, addr, tmp);
 
     gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), half ? MO_UW : MO_UB);
-    tcg_temp_free_i32(addr);
 
     tcg_gen_add_i32(tmp, tmp, tmp);
-    tcg_gen_addi_i32(tmp, tmp, read_pc(s));
+    gen_pc_plus_diff(s, addr, jmp_diff(s, 0));
+    tcg_gen_add_i32(tmp, tmp, addr);
+    tcg_temp_free_i32(addr);
     store_reg(s, 15, tmp);
     return true;
 }
-- 
2.34.1

