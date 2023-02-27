Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4300203ejc;
        Sun, 26 Feb 2023 21:48:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+5+EegkQdCAZLW7iNASaVDY6qeIcUCqbEcGzoZQDPidmcTa73jTgeOJ+EXZpy5P3qYTo1f
X-Received: by 2002:ac8:5751:0:b0:3b8:6ae9:b10d with SMTP id 17-20020ac85751000000b003b86ae9b10dmr25409117qtx.2.1677476936052;
        Sun, 26 Feb 2023 21:48:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476936; cv=none;
        d=google.com; s=arc-20160816;
        b=c8sidpFRdkjTxVdntTxJK8tQLabLsujSF2NIGLYHMox5i+GyJ5E9hH1m18GaWPIvv0
         jpLJ5juMrNhxIuRUhm2ZNuVUzi0TlrldEJwnT35pvYlh1bYheLziRgqlE+BTsx/WGN7c
         hlyV0ri4/nXlJ8MDIixzHCjnON0lEPJ8WQKWZ1uq5ETyUx+sy/lCNlns2KDDobSRr/7V
         sclNrsvYvFP4w5f8GvZlp+pVmIKlEwQbWJXG78jRZhMQGv9YtdN7QYf9cW1hzBGItoNl
         l41Dy2iWky7NFlB0r+YzeZtAIzHrsZjJyph3S1JZv2yccTKE9ARm5OnvprkDyyx5Ch1g
         fIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yvNzI3zdsY5ktRe+CgRMmOgY3KlQHbZNKJe85/su0xc=;
        b=eB0IxCB3gy6bwjSuEpJy+qr5kFKciEPfVrGE6sQalSQ5Xz/VQiJHzvVsgw0v/pMWbq
         Zv4dXIaMRjy1geDydSMH0apC52aAFVmwUrK/fH0yHW7ozAs1/73ISks50dCzBvR/XUBv
         nkCJqa6+qbX2p7qKCYIh7bzmOJ+IQjhRwpFTq4cNpNvpM0AOzr6dLIALM88dm0Q2kOP0
         3Swg14EGMUs/YaDXZk05nmI0KPEWCXmCos6hToPwd26c2cGSr+jXkOsx+nnruehPA3yW
         Kslz/58IggJAQcP8OO6Xqy1Zuuww+lrj+QtRi5qydFCqqB+ZKj3towOc7aI9AnI0o710
         y/Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOM0cGFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020ac87f88000000b003bb8704f3d5si5615168qtj.298.2023.02.26.21.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:48:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOM0cGFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWJH-0006v7-6a; Mon, 27 Feb 2023 00:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJ6-0005vm-Rd
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:44:16 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIu-0005Pq-U7
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:44:11 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso8867159pjb.5
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvNzI3zdsY5ktRe+CgRMmOgY3KlQHbZNKJe85/su0xc=;
 b=GOM0cGFQTikciSHBoj6KkxTyXQnoTKcAWSeESUDxFXHxijRHdDmH9D5H4rDTlToUtO
 r96lgGYrZhNckPiZ33qbQuAQfVPS/o5cb/d6pprfYOPS5p/2yIYCbWT+uQfRBzNmIQ/c
 H6k0OHin0KjLuROAPDOWzw/maUwfI1Vnl2eYqC+/QqNx8iF7Sq5AgQVlT4y5Hwm1l5SC
 6HnDz7txEkylofhtYv9cMKMsCbK0uGGz6PFz1c7ltLOWMD8pzOYzMiTeDcN7qiPp52Qq
 9mOrUyA38A1HHCwVtQOs/SXxlldQAw6W8NwFdxwWzku5x8Hdz+MNjyqtDga0x5H9+2VE
 DeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvNzI3zdsY5ktRe+CgRMmOgY3KlQHbZNKJe85/su0xc=;
 b=w8RLRAIPun+WUZSO+Vfoeb7ffoFO5Nr9m8fM+d2np3G7+qxTt1p51WVOlcoWWCzU6J
 l24WrHvFsmVzz0bf4CnCwQ8YwdsiZcs22uXrEFRJ5DmHBr6aEn3sW1vmIyAaBwPmaJkS
 mmdfUD2FuLDDBCdJm0A9Q/psYJTFPBIm5/e/W9ZQIZxPla8H6iY1JH3YbkozCst0MO4W
 bPRE7035/sN2cq41nnmOk3x+kjVZ1+q5larAtViZ1EhUwdlpOPrclbfDLBI06cJHKcrq
 n/A5XRpk3x83j8vOguBZUCdhuXjWdStJGwG40uo77dRfyk1gvaeivZkgD5xebwI0jLTD
 zgDA==
X-Gm-Message-State: AO0yUKXYieC1cDVNvYTzNOb0Q75CLzcytqS8A9Yqahan7uHggw9NamXe
 gHmJkvd08xAiFYqbBUdU/hwikQ==
X-Received: by 2002:a05:6a20:8412:b0:cd:74aa:df55 with SMTP id
 c18-20020a056a20841200b000cd74aadf55mr1128589pzd.25.1677476641238; 
 Sun, 26 Feb 2023 21:44:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 29/70] target/microblaze: Avoid tcg_const_* throughout
Date: Sun, 26 Feb 2023 19:41:52 -1000
Message-Id: <20230227054233.390271-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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
X-TUID: TGVPsBDlWxjJ

All uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index eb6bdb49e1..ee0d7b81ad 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -101,9 +101,7 @@ static void t_sync_flags(DisasContext *dc)
 
 static void gen_raise_exception(DisasContext *dc, uint32_t index)
 {
-    TCGv_i32 tmp = tcg_const_i32(index);
-
-    gen_helper_raise_exception(cpu_env, tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(index));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -116,7 +114,7 @@ static void gen_raise_exception_sync(DisasContext *dc, uint32_t index)
 
 static void gen_raise_hw_excp(DisasContext *dc, uint32_t esr_ec)
 {
-    TCGv_i32 tmp = tcg_const_i32(esr_ec);
+    TCGv_i32 tmp = tcg_constant_i32(esr_ec);
     tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUMBState, esr));
 
     gen_raise_exception_sync(dc, EXCP_HW_EXCP);
@@ -260,7 +258,7 @@ static bool do_typeb_val(DisasContext *dc, arg_typeb *arg, bool side_effects,
 
     rd = reg_for_write(dc, arg->rd);
     ra = reg_for_read(dc, arg->ra);
-    imm = tcg_const_i32(arg->imm);
+    imm = tcg_constant_i32(arg->imm);
 
     fn(rd, ra, imm);
     return true;
@@ -305,7 +303,7 @@ static bool do_typeb_val(DisasContext *dc, arg_typeb *arg, bool side_effects,
 /* No input carry, but output carry. */
 static void gen_add(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
 
     tcg_gen_add2_i32(out, cpu_msr_c, ina, zero, inb, zero);
 }
@@ -313,7 +311,7 @@ static void gen_add(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 /* Input and output carry. */
 static void gen_addc(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_add2_i32(tmp, cpu_msr_c, ina, zero, cpu_msr_c, zero);
@@ -546,7 +544,7 @@ static void gen_rsub(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 /* Input and output carry. */
 static void gen_rsubc(TCGv_i32 out, TCGv_i32 ina, TCGv_i32 inb)
 {
-    TCGv_i32 zero = tcg_const_i32(0);
+    TCGv_i32 zero = tcg_constant_i32(0);
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     tcg_gen_not_i32(tmp, ina);
@@ -1117,8 +1115,8 @@ static bool do_bcc(DisasContext *dc, int dest_rb, int dest_imm,
     }
 
     /* Compute the final destination into btarget.  */
-    zero = tcg_const_i32(0);
-    next = tcg_const_i32(dc->base.pc_next + (delay + 1) * 4);
+    zero = tcg_constant_i32(0);
+    next = tcg_constant_i32(dc->base.pc_next + (delay + 1) * 4);
     tcg_gen_movcond_i32(dc->jmp_cond, cpu_btarget,
                         reg_for_read(dc, ra), zero,
                         cpu_btarget, next);
@@ -1226,8 +1224,6 @@ static bool trans_mbar(DisasContext *dc, arg_mbar *arg)
 
     /* Sleep. */
     if (mbar_imm & 16) {
-        TCGv_i32 tmp_1;
-
         if (trap_userspace(dc, true)) {
             /* Sleep is a privileged instruction.  */
             return true;
@@ -1235,8 +1231,7 @@ static bool trans_mbar(DisasContext *dc, arg_mbar *arg)
 
         t_sync_flags(dc);
 
-        tmp_1 = tcg_const_i32(1);
-        tcg_gen_st_i32(tmp_1, cpu_env,
+        tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
                        -offsetof(MicroBlazeCPU, env)
                        +offsetof(CPUState, halted));
 
@@ -1401,8 +1396,8 @@ static bool trans_mts(DisasContext *dc, arg_mts *arg)
     case 0x1004: /* TLBHI */
     case 0x1005: /* TLBSX */
         {
-            TCGv_i32 tmp_ext = tcg_const_i32(arg->e);
-            TCGv_i32 tmp_reg = tcg_const_i32(arg->rs & 7);
+            TCGv_i32 tmp_ext = tcg_constant_i32(arg->e);
+            TCGv_i32 tmp_reg = tcg_constant_i32(arg->rs & 7);
 
             gen_helper_mmu_write(cpu_env, tmp_ext, tmp_reg, src);
         }
@@ -1487,8 +1482,8 @@ static bool trans_mfs(DisasContext *dc, arg_mfs *arg)
     case 0x1004: /* TLBHI */
     case 0x1005: /* TLBSX */
         {
-            TCGv_i32 tmp_ext = tcg_const_i32(arg->e);
-            TCGv_i32 tmp_reg = tcg_const_i32(arg->rs & 7);
+            TCGv_i32 tmp_ext = tcg_constant_i32(arg->e);
+            TCGv_i32 tmp_reg = tcg_constant_i32(arg->rs & 7);
 
             gen_helper_mmu_read(dest, cpu_env, tmp_ext, tmp_reg);
         }
@@ -1555,7 +1550,7 @@ static bool do_get(DisasContext *dc, int rd, int rb, int imm, int ctrl)
         tcg_gen_movi_i32(t_id, imm);
     }
 
-    t_ctrl = tcg_const_i32(ctrl);
+    t_ctrl = tcg_constant_i32(ctrl);
     gen_helper_get(reg_for_write(dc, rd), t_id, t_ctrl);
     return true;
 }
@@ -1585,7 +1580,7 @@ static bool do_put(DisasContext *dc, int ra, int rb, int imm, int ctrl)
         tcg_gen_movi_i32(t_id, imm);
     }
 
-    t_ctrl = tcg_const_i32(ctrl);
+    t_ctrl = tcg_constant_i32(ctrl);
     gen_helper_put(t_id, t_ctrl, reg_for_read(dc, ra));
     return true;
 }
-- 
2.34.1

