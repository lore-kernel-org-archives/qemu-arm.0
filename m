Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301926ejc;
        Sun, 26 Feb 2023 21:52:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9nLwZbxKO9a0aDxF5vWv9yjBMydtB2o+IEOH8JAwvKmqPt2d02GYamETASgOq/xYHm0iyJ
X-Received: by 2002:ad4:5bca:0:b0:56e:a96a:2bdc with SMTP id t10-20020ad45bca000000b0056ea96a2bdcmr40608926qvt.40.1677477128392;
        Sun, 26 Feb 2023 21:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477128; cv=none;
        d=google.com; s=arc-20160816;
        b=h7kQ1sDwyj0VXGasW9Pau01iGWQfoXs6hcUZzjklM32jA4aLf4vg41ws1cN6H5H/6c
         6olyrtYbz7m5HPjcN/WSknYpzKG+G00BvBa2cJ+DXXrFDaf2hcYRTBCxtL3eGXOFk4hx
         v4EQwHwmWKmupjFzicnP6h6SE0DE2Vakk4y7wAudRQ0Y7GTt+9WDZQiEr2uDQNSVl0tE
         18qcnY13paW/dqMEUHZwYoJStntetl3L7UnhL55xWf95kx9WbeiCvC+yFHTU67QX8/9c
         Jtvf0lqYQIglm4rv8N+rWyVakf/SZo5x+lOOJ6MlxQWPEqZ9WepoaX+Sr8O3uny9XQBS
         jJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YED/oFHPDajrG5dAWvXY/hvFs/yeoyJEXCZ48T5LxeE=;
        b=qhChHNZhksavojYQWM7T4xOaV0LQ3MOEEDiGf+v2f/XjlYHbcWpyl0sirinxECZekj
         Ywt4UHxRvKWaGhAhVKxzumTHU6XELWGQ0T2ypaSrK5g8UUw10txY1SeTl43O00QffFEn
         dBAzFx9C/Z4FfHAsNhyL5RJv/Jvrm/596n785kgPAjHUoTiX1ND8YuO0lcGy/8dGz328
         7PzYl+YwsqccXxO7rSFT6nE5D+6QzNJ67zOV2ITcaX3CMmc+vDmDw90npEY/9trCZ/PW
         +f70CT5kAasRgN9k7trZGf8GmpuFLQj/p//bfbVJTdyBRnFjdjkHVMTSseCKyuBIOXaw
         +OgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsAiMs6J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a370608000000b0073baac09237si5245918qkg.495.2023.02.26.21.52.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:52:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsAiMs6J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWMZ-0008HZ-9E; Mon, 27 Feb 2023 00:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMM-0007oH-Cf
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:47:39 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMH-000718-W8
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:47:37 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so5039652pja.5
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YED/oFHPDajrG5dAWvXY/hvFs/yeoyJEXCZ48T5LxeE=;
 b=rsAiMs6Jz26cs9pkt9TOU/wdcdRHh+JC8lRtf2p6lJtL+0V4rmI1MGx2guf8m9CAbU
 OXkAoTFb0Py0et4XkuXrBBGYlUmjPKIpOV2DkFnuCf9yvvBo1LBDA3e9YRms99J3oW6e
 miyaa+giwBvxg1UPJPqMl2dNilwnFdQZIzR23/4quFQD1BHTYtBqVv0zuq9ehLWQIZO6
 tgdHd/q6+wBVK5Bl04U1v1Jyucdi6q/JzCvod23sSK+FCF1q6gF4pIeX3KoZ1UNyO106
 JFUXEhdpRijeZG91FofTxV8uIsn5s8CA9lgMKcyh4C2DxZb1MSIB9AhVU0ng47V2X5s0
 jgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YED/oFHPDajrG5dAWvXY/hvFs/yeoyJEXCZ48T5LxeE=;
 b=gfNJbmlZF9u3i9ZjvcOrCh0v3CwNUG4j80q3RJr9t3lvWHH5t7j12pbMqxkOIQafpG
 KWKPq3W7uNCl6cdNZEx3/X0oAqFWFlYx3S4B6cWJfLVeAnvYHoiulYo4VeiMi8swM0Q3
 Iyj34aFgPuQJuwLXMjfiIPejVr86rRvgftBeSeUWLfZ3sv4QdlWsY4GLnlxBENp5foHU
 NQoTosB31WJTrD4VQi/Vmh7JSJPXc2uit75qIVrfqRvCz2WrE48c195yHHM6xMn447jC
 UTeph2C6GjYYg5+oEd+/bdfNZH9GW/CCZtYml9C5tTetdvJhACvZ+HWV03FmFqBiB0D5
 yXCA==
X-Gm-Message-State: AO0yUKXuJjM34lu7J0ShEXdZBZWJjqLBxda9vrTK5O1w5AwM1UGVYpai
 G2gzpG4mJ6Ju31+wMwS5bynSQcXASeq1U6un6Yo=
X-Received: by 2002:a17:903:110e:b0:19c:ac96:223b with SMTP id
 n14-20020a170903110e00b0019cac96223bmr18961544plh.40.1677476851065; 
 Sun, 26 Feb 2023 21:47:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 40/70] target/ppc: Avoid tcg_const_* in fp-impl.c.inc
Date: Sun, 26 Feb 2023 19:42:03 -1000
Message-Id: <20230227054233.390271-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
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
X-TUID: rGzHeXfSRrf0

All uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/fp-impl.c.inc | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index d5d88e7d49..57d8437851 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -348,7 +348,7 @@ static void gen_fcmpo(DisasContext *ctx)
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
     gen_reset_fpstatus();
-    crf = tcg_const_i32(crfD(ctx->opcode));
+    crf = tcg_constant_i32(crfD(ctx->opcode));
     get_fpr(t0, rA(ctx->opcode));
     get_fpr(t1, rB(ctx->opcode));
     gen_helper_fcmpo(cpu_env, t0, t1, crf);
@@ -368,7 +368,7 @@ static void gen_fcmpu(DisasContext *ctx)
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
     gen_reset_fpstatus();
-    crf = tcg_const_i32(crfD(ctx->opcode));
+    crf = tcg_constant_i32(crfD(ctx->opcode));
     get_fpr(t0, rA(ctx->opcode));
     get_fpr(t1, rB(ctx->opcode));
     gen_helper_fcmpu(cpu_env, t0, t1, crf);
@@ -541,7 +541,7 @@ static void gen_mcrfs(DisasContext *ctx)
     tcg_gen_andi_i64(tnew_fpscr, tnew_fpscr,
                      ~((0xF << shift) & FP_EX_CLEAR_BITS));
     /* FEX and VX need to be updated, so don't set fpscr directly */
-    tmask = tcg_const_i32(1 << nibble);
+    tmask = tcg_constant_i32(1 << nibble);
     gen_helper_store_fpscr(cpu_env, tnew_fpscr, tmask);
 }
 
@@ -681,9 +681,7 @@ static void gen_mtfsb0(DisasContext *ctx)
     crb = 31 - crbD(ctx->opcode);
     gen_reset_fpstatus();
     if (likely(crb != FPSCR_FEX && crb != FPSCR_VX)) {
-        TCGv_i32 t0;
-        t0 = tcg_const_i32(crb);
-        gen_helper_fpscr_clrbit(cpu_env, t0);
+        gen_helper_fpscr_clrbit(cpu_env, tcg_constant_i32(crb));
     }
     if (unlikely(Rc(ctx->opcode) != 0)) {
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
@@ -703,9 +701,7 @@ static void gen_mtfsb1(DisasContext *ctx)
     crb = 31 - crbD(ctx->opcode);
     /* XXX: we pretend we can only do IEEE floating-point computations */
     if (likely(crb != FPSCR_FEX && crb != FPSCR_VX && crb != FPSCR_NI)) {
-        TCGv_i32 t0;
-        t0 = tcg_const_i32(crb);
-        gen_helper_fpscr_setbit(cpu_env, t0);
+        gen_helper_fpscr_setbit(cpu_env, tcg_constant_i32(crb));
     }
     if (unlikely(Rc(ctx->opcode) != 0)) {
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
@@ -733,10 +729,12 @@ static void gen_mtfsf(DisasContext *ctx)
         gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
         return;
     }
-    if (l) {
-        t0 = tcg_const_i32((ctx->insns_flags2 & PPC2_ISA205) ? 0xffff : 0xff);
+    if (!l) {
+        t0 = tcg_constant_i32(flm << (w * 8));
+    } else if (ctx->insns_flags2 & PPC2_ISA205) {
+        t0 = tcg_constant_i32(0xffff);
     } else {
-        t0 = tcg_const_i32(flm << (w * 8));
+        t0 = tcg_constant_i32(0xff);
     }
     t1 = tcg_temp_new_i64();
     get_fpr(t1, rB(ctx->opcode));
@@ -767,8 +765,8 @@ static void gen_mtfsfi(DisasContext *ctx)
         return;
     }
     sh = (8 * w) + 7 - bf;
-    t0 = tcg_const_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
-    t1 = tcg_const_i32(1 << sh);
+    t0 = tcg_constant_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
+    t1 = tcg_constant_i32(1 << sh);
     gen_helper_store_fpscr(cpu_env, t0, t1);
     if (unlikely(Rc(ctx->opcode) != 0)) {
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
-- 
2.34.1

