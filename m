Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1187085ejc;
        Mon, 22 Aug 2022 16:37:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6rdCataufFOOkgZpadzw8BaedcQCHNUIv97sEK1GgZdwpPnRvXdcwbqqIN8XJu2CYz0Bp7
X-Received: by 2002:ac8:5d8f:0:b0:344:a747:abf1 with SMTP id d15-20020ac85d8f000000b00344a747abf1mr12016466qtx.273.1661211436348;
        Mon, 22 Aug 2022 16:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661211436; cv=none;
        d=google.com; s=arc-20160816;
        b=EYpIuwFjE42TVeDb85ML46G+rSjPLe5M+qMVs6demoa8DkyevSqDGHwMmBIGEcQ3YQ
         nAooAIKyin45laX1/J0ZK6q/fVAVRdPCbu5As9uO0JNz0TDejwbDnor2fTBsKHJ2VM/N
         bn2bvhJUZcN1ocBbt2YcD7TtoGlPScc6NVqR9cIhcUgstALwnepe4UWaXigBrib8nehj
         Z+JlaE91ibMPLdAsgF5NfHy6f4w2+QCn8HuetaqDXjCgh2RBlPwSNBvFKTq5WF3Cop90
         JYndUUNWDLUM/LxOWGHHzqZt8p93WJlyb5eHz1zlY+xtmxWLCEpPKMO8NOxqtKQOX+pE
         JAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
        b=ATufMiZvJS329HsV/ZSNZg9Kxx0ECSPcZx7OL+KG/3n3WwZnrCI+3iybthWzIUoYXE
         hXBa32UTqXXzVse+kGBLRoTyix6V+jzsu1QUYmh4WY3h8vzOdkRM+j0jxo4AInPQMyB9
         WGzURXFfK47mPBXbQ4UiSeIwYJz2pYobF/WbG3LsWqeK7NvieR4tlwnqp6OKPkwq/ygF
         /7ddIvRyZmScBeT64MLireNcVDKxGZoyusvRQkMvYNvJS4B5OrcGqi0BGWbz7B6qPVMy
         OaNqZHhP3seSAGOtmxczI61Jib6uO7/deIMnxXNVlYLKOrfq+pKAyxKpxLMlI5G20hlZ
         g1Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xyuGQrph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s24-20020ac85298000000b003446b911a75si4908656qtn.458.2022.08.22.16.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xyuGQrph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQGyp-0001RT-NQ
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGm2-0005lx-FH
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:24:03 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGm0-0005gF-2G
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:24:01 -0400
Received: by mail-pf1-x434.google.com with SMTP id x19so9037890pfq.1
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 16:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
 b=xyuGQrphGoWJ2mf4HeQPWMqmpYPnv0Ofh14oSEioviCgYs3E16rNmRXT3VJ1o8l5Bg
 ktlrpeYm1r61OpuiS0WBs5xW9X8vxKBSL/3SPiaU85/D/uox6MasejoMnVWIArNveOQQ
 IRrzPtOBAz/Drbh48np6NFz+bPm4pTIEXnwkN89NgHZ4qx1eF90cfNK0C93xGI9K2GJ/
 DZ4kVHpTdDJE+oSaYjb6LO4a5RLHi2Rt6kNufii16TfPj52Z9/cwh1ABc1zSYuw2HKXh
 LS1mo7vDqcCh7A7pSagoY6HQWRni4NAOYJLHsTrIK1GFfqk2S/P075fYm9+vQPLthc4P
 L0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cxOV+kgTy/28wcHyCPRFLTS2yytwO8pyxXme1WE5d5k=;
 b=0o9pC4cD84t9VBR3wvTrUdgV6cnQxGWB0Z1XK5ttENeLCGRu4ltkoQKWzMQEYsWTEQ
 Zc31Z4OzTkoTQyUcG5EMAQ8Tc4P+pbVr/KeNbZ61Yp5Qzk74+DPpfbxxkPule0ArP2En
 XmpEYzKQm1geTbHJ4QqDQ5zFVizVY05YKayUnpw8p0ULVr5PKOYrUFXHZ/1GumVhIyVz
 hDsV0RhJSqfmLXNFFOM50n2DTdDIJLHMcjks0dX9oZ0wqJ2rnwnA41ecgwRjpuj1X4nt
 GkcSfzal2dpRUKraLQ0kfj4/JVa8vhkyB3ruYH7ifVCjD9XfzFYuUegoRUEUQuxzM7nI
 nVDg==
X-Gm-Message-State: ACgBeo24nvTVn9NqRSeZjyKhtPLIBPxd50ptnUN/8kUOK6Zt7NM4bi3m
 ajEiwWKX0yi7v/tfqvUhtG7hOjWht2E9uw==
X-Received: by 2002:a63:224d:0:b0:42a:81ff:68ca with SMTP id
 t13-20020a63224d000000b0042a81ff68camr9562821pgm.290.1661210638587; 
 Mon, 22 Aug 2022 16:23:58 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 16/17] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Mon, 22 Aug 2022 16:23:37 -0700
Message-Id: <20220822232338.1727934-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: RTgPeuX/h7LY

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4d13e365e2..f01c8df60a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -276,11 +276,16 @@ static int jmp_diff(DisasContext *s, int diff)
     return diff + (s->thumb ? 4 : 8);
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, int diff)
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
@@ -1158,7 +1164,7 @@ void unallocated_encoding(DisasContext *s)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
+    gen_pc_plus_diff(s, cpu_R[15], curr_insn_len(s));
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -6485,7 +6491,7 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
         return false;
     }
     tmp = load_reg(s, a->rm);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_bx(s, tmp);
     return true;
 }
@@ -8356,7 +8362,7 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8375,7 +8381,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
     /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
     gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
@@ -8385,7 +8391,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
 {
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    gen_pc_plus_diff(s, cpu_R[14], jmp_diff(s, a->imm << 12));
     return true;
 }
 
@@ -8395,7 +8401,7 @@ static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
 
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
     tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8411,7 +8417,7 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     tmp = tcg_temp_new_i32();
     tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
     tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8734,10 +8740,11 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
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

