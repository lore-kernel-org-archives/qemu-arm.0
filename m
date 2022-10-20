Received: by 2002:a05:7022:458e:b0:46:22f1:8c13 with SMTP id cf14csp809694dlb;
        Wed, 19 Oct 2022 20:26:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM45Hew60a8FTxBnepPM6uR8fH2urAeG/dAbP8Hp7ztaHapA6F0R+Kcc+7XNBtoyRNrGcHZv
X-Received: by 2002:a37:a98b:0:b0:6eb:c2c5:7af6 with SMTP id s133-20020a37a98b000000b006ebc2c57af6mr7808602qke.409.1666236365445;
        Wed, 19 Oct 2022 20:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666236365; cv=none;
        d=google.com; s=arc-20160816;
        b=yAljE+xLT57sSKr+HwCvCQPADc6me2GE1FyGBlzF0WViDxRkaumd8jW2Y0NMHt3cA0
         qt3SDyLomid5dsA4ScgYXHbbBPI1JULrTWDT8XLSkoqxxWlEhMTxBgi4sly3lVWNhsHu
         U3FBRor+d3YmspcM1jrwIvgfyBH07Px7mUYqknJsFQRXPntfOfCWl0SZ1vaKYMcgDXIU
         86TkhocUPzczoSuvVU7d4pNT5whSYk7O+/7559CFcjr7vvQ7lKf9EQ0v/tn8g8HD0gZa
         1DvQ/cYllEx+oQmlBWXkO78Qdu9BRuB/tx8dKHSpmAQ2EVOGuA2mAJ3y4XU7IHVbsdG7
         OPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eirybTGa1WIietzoG766hMinqRXYJPoKdxjJFXnDkP8=;
        b=z6+znDIs2GGJ+xFaiaanihcsX/IsnQUfqYU0YbHv+LJBbRm6zGMYzI4mL7jvjqOClo
         zmY17ck0JwgxUSCtmRMogRksZL5wrRtBFixHMmoyXJ9VLcfjEA2iHFKrsNrGNotHOZXK
         NSUbwhq84kK0cHOIIleNLrMeQCN50EuJZjcg31QStw+hYX5uookJs+Z7C1IO9A0aDA8E
         6aO72rSLLD2qi3gZaLn7SIP83BpA1TQMQkeHhfLhwsRztf6ewGlPuIZqo2bmogaTnXSj
         7O6Zl84t5SSsLamsSSXJf/J69k19B2yhE7ZwG8wfCW3sUYleOZAKW/gsyratVLA51/MI
         GSFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kz2fCoX9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05620a29ce00b006ee93d034d8si10803604qkp.279.2022.10.19.20.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 20:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kz2fCoX9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olMBf-0003Op-7d
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:25:39 -0400
Received: from [::1] (port=52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olLvN-0003WV-3X
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLuI-0003S1-E3
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:44 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLuE-0001qx-Ch
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:07:41 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 3so19056315pfw.4
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 20:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eirybTGa1WIietzoG766hMinqRXYJPoKdxjJFXnDkP8=;
 b=kz2fCoX9WreEHne84egX3WeZ2wc/0mO0RQCL1fRjOn0Lmfk33vK2uF6zD+YHbj8/pg
 jRBhwHN79Q5j/tsQt3VBoSIGgKIXU0464YfV0XAcG04XVGiE9F0kc/MeAnNmzJHzQa9v
 KYQ2tDn/04XiBQFGd4bTB49RiWa3xKw0ttNpbKoMXFZqgofxdwROvpszX+tN/W4TQeyF
 VcwhpFACOOqaldtPHxD2aO/gfqu2GUa5TjQBxOS+dsyQt2FVDDve9kUJqHphZKWLf8MZ
 fQBGY7rvfQs/wkgoxHUOvj/W3LJ3gB8N+Pk1GV7djbHSjJeVPPtI//tC5NRQjZ6Mu06t
 1sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eirybTGa1WIietzoG766hMinqRXYJPoKdxjJFXnDkP8=;
 b=QjuHdVkN8KlCLMgOwqBk0WfbP15yE0PmHj/sNpGg34mnLz5xErbTOfRuPCRTsyrisS
 w5Ca3arxq/JYc0CR199ji2hMTyOPnDsKLcy0wQhpqtE9ZCO8h4Hs2YrX+lN/1olLrwmn
 vlGcnUXFuDpuldXdjfo6kQ26N23xaooCTJ+N0ORbkijhgjKGqROxdqVZv9H1z0IRRuSw
 0HfiSAaXsa6d7ELBlOwcr8Vtg4YK7tSvtyvdH+XFZIeibsO0yH3X1eiGF0h6rtMlR5W3
 QRslqB77zL/B6EiuRthNbl8UyHgQYhiZqBX6hhbKQNJLQJp4/AfNs2gNhEWWqb1ZfFBM
 zSKQ==
X-Gm-Message-State: ACrzQf2BUjpAlMjnksUCaiRGhnyC/0oIb0LWTrEb5FxK9pBORFG/6JaU
 SiNbNjrE1li+lFAhWZBZ9tSO+Q==
X-Received: by 2002:a63:4f4f:0:b0:434:b9db:b9f with SMTP id
 p15-20020a634f4f000000b00434b9db0b9fmr10183785pgl.438.1666235256357; 
 Wed, 19 Oct 2022 20:07:36 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Thu, 20 Oct 2022 13:06:40 +1000
Message-Id: <20221020030641.2066807-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: Z+h2P0u3XNjU

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ca128edab7..5f6bd9b5b7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -260,23 +260,22 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     }
 }
 
-/* The architectural value of PC.  */
-static uint32_t read_pc(DisasContext *s)
-{
-    return s->pc_curr + (s->thumb ? 4 : 8);
-}
-
 /* The pc_curr difference for an architectural jump. */
 static target_long jmp_diff(DisasContext *s, target_long diff)
 {
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
@@ -292,7 +291,11 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     if (reg == 15) {
-        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
+        /*
+         * This address is computed from an aligned PC:
+         * subtract off the low bits.
+         */
+        gen_pc_plus_diff(s, tmp, jmp_diff(s, ofs - (s->pc_curr & 3)));
     } else {
         tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
     }
@@ -1155,7 +1158,7 @@ void unallocated_encoding(DisasContext *s)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
+    gen_pc_plus_diff(s, cpu_R[15], curr_insn_len(s));
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -6479,7 +6482,7 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
         return false;
     }
     tmp = load_reg(s, a->rm);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_bx(s, tmp);
     return true;
 }
@@ -8347,7 +8350,7 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8366,7 +8369,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
     /* This jump is computed from an aligned PC: subtract off the low bits. */
     gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));
@@ -8376,7 +8379,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
 {
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    gen_pc_plus_diff(s, cpu_R[14], jmp_diff(s, a->imm << 12));
     return true;
 }
 
@@ -8386,7 +8389,7 @@ static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
 
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
     tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8402,7 +8405,7 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     tmp = tcg_temp_new_i32();
     tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
     tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8725,10 +8728,11 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
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

