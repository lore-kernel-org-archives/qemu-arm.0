Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1689457lfc;
        Fri, 28 Aug 2020 11:36:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJPwo/dihXlR3E0jAjdxqyAd1dqHzyWggnz3nRA+L0E3RSxzw7/RU/ZfcAec3UnoIJ+b+G
X-Received: by 2002:a25:db8f:: with SMTP id g137mr4288860ybf.489.1598639773641;
        Fri, 28 Aug 2020 11:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598639773; cv=none;
        d=google.com; s=arc-20160816;
        b=K3kBJ4DM8Bodt4y5vjgc2hU7utWaoehkI4n1YY3YgF5kFhJCKXfOn0SIEcQsOuFqF5
         Xkc8gqQrKig7a8xMgEhi7mTE/FUNlppzqPbAQJmUat/DuUu/vgTcpS6x5JMLldjx2YbV
         8CXRVTh51jbDtCuU3bk3VBVs8TujmWjJnnn1X73Ci5IW60aiAJwFTQEnUlG/VHVhF4/o
         4UGsLrY7uFnKP4HHZ9M1JLlCBw6MWxgaNG4kjVG9JIotQSou19qfovdwchc14PmPx9ju
         SyJgeSP81PiOJqpzC38OUJRFB9gWibSVLu0i2HYunvPzOS1rJ72f38qI7NRohl/dxuHn
         BO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pSgg9uuUHzyN4R9Ddc/CwltGoD1XbDu8WkO7Eutn4bA=;
        b=vOsJ+ol5AEqIk8bs7zTZPFJDMA1zELy8iQD/hiln6XuUqL5v62RCuA/4KjpJBQLjAc
         3vxi3S/THYWAauDMRLqOjNGVqXs1d3gpjs/I2YhwCqAjInkELEm8Dm1UptxTM/ffMAJ/
         y711FQmqTy+fC8MS+6sT/tow03PubyZ6RjyXLbiILFd/jE65E2bD0/fwbOuy7oXeox96
         1j7hzyVejyFrBbjKul+5GWW/xDoRCCZUDjemf5cCU9HGm/jcDIYaRpR/O/ViqG+HDsSD
         AygOxPca6EGybPEBBom/RhNjDDcpQNp2dXGgBi6grNNDjt1YKhKxJs+UccfX6t4rI3Xu
         5eyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kydivrvt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si107491ybd.119.2020.08.28.11.36.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:36:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kydivrvt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjES-0004ik-Rg
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCZ-0002A0-Es
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:15 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCS-0005wN-Ue
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:15 -0400
Received: by mail-wr1-x441.google.com with SMTP id i7so23469wre.13
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pSgg9uuUHzyN4R9Ddc/CwltGoD1XbDu8WkO7Eutn4bA=;
 b=kydivrvtESuVVrprgp1LdY6EQwXqs1cJtO+23hGFXfTCNYsL9olHnblQOrj2gGwfDJ
 ifA0PKcndF+zDhrGpi4YsdAiC/7LU5X06HGqZdfXdwWhxu6fjqAgYj5EpzELmuw1eqTa
 xLYZ7kLaA69XtJZMwlhOMSgqJ0TGKBmA++T+E1hVJTZl9y+n8VYCjeVbhtvK2Tuj/mOU
 q3hSDesnvxQM5lbprZQ0z4E/Oe1jBrho9ItRFAUXlzYtBsDpctoVlge3hzmwrpUgePFq
 +UNfBACNQ3QwORHWmZkBtcFmDIQJKFarXgishLDJmBjQj7YcIvB4RcVA/K1dXyJ05Jkc
 TZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pSgg9uuUHzyN4R9Ddc/CwltGoD1XbDu8WkO7Eutn4bA=;
 b=uJVHlE70MO1Hj5N+o6o+ZdPYbmzsOp1gY1/EbjtIP1QQ6vqqBm7UkuV+D+neY0Zi4L
 HTnYQiD8lD2gcWnoInYWhCsJ8vq+d2jqIvP2xdIfCeXZz96wwWWj5aq6ucCAvJipMgCD
 4PiEQ9L3xanse4Pn2AO1Hk8FbFkQly/2q8K9hs57dvHgWbKceqTAaRD5zN7+t5z0WeHv
 FHkLtgK0n8vKJImSBJQt0FvPOnYoVIP6zoammulavtzZD8M8Yqjt8O3jSZAQy4C/vjKN
 zXYzyuZSCpQ1s4uqOhev7qrTMBYjz6RQqeFcpj6zB8ow1Uef97pLC9OP+CETsnGG3xZY
 gyjA==
X-Gm-Message-State: AOAM533WXbXVkKRcKQd52+ncRqABMwB2N1WeQVqTK0+krGGqByGjmpEV
 iY1jZjwL4JF0JZg2aFkZUWuE9ldvoL11PbGb
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr228373wrv.405.1598639645274;
 Fri, 28 Aug 2020 11:34:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/45] target/arm: Macroify uses of do_vfp_2op_sp() and
 do_vfp_2op_dp()
Date: Fri, 28 Aug 2020 19:33:16 +0100
Message-Id: <20200828183354.27913-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: nBnVqZ7cyl1C

Macroify the uses of do_vfp_2op_sp() and do_vfp_2op_dp(); this will
make it easier to add the halfprec support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 49 ++++++++++------------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index b5eb9d66b3d..f891d860bb9 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -2234,55 +2234,34 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
     return true;
 }
 
-static bool trans_VMOV_reg_sp(DisasContext *s, arg_VMOV_reg_sp *a)
-{
-    return do_vfp_2op_sp(s, tcg_gen_mov_i32, a->vd, a->vm);
-}
+#define DO_VFP_2OP(INSN, PREC, FN)                              \
+    static bool trans_##INSN##_##PREC(DisasContext *s,          \
+                                      arg_##INSN##_##PREC *a)   \
+    {                                                           \
+        return do_vfp_2op_##PREC(s, FN, a->vd, a->vm);          \
+    }
 
-static bool trans_VMOV_reg_dp(DisasContext *s, arg_VMOV_reg_dp *a)
-{
-    return do_vfp_2op_dp(s, tcg_gen_mov_i64, a->vd, a->vm);
-}
+DO_VFP_2OP(VMOV_reg, sp, tcg_gen_mov_i32)
+DO_VFP_2OP(VMOV_reg, dp, tcg_gen_mov_i64)
 
-static bool trans_VABS_sp(DisasContext *s, arg_VABS_sp *a)
-{
-    return do_vfp_2op_sp(s, gen_helper_vfp_abss, a->vd, a->vm);
-}
+DO_VFP_2OP(VABS, sp, gen_helper_vfp_abss)
+DO_VFP_2OP(VABS, dp, gen_helper_vfp_absd)
 
-static bool trans_VABS_dp(DisasContext *s, arg_VABS_dp *a)
-{
-    return do_vfp_2op_dp(s, gen_helper_vfp_absd, a->vd, a->vm);
-}
-
-static bool trans_VNEG_sp(DisasContext *s, arg_VNEG_sp *a)
-{
-    return do_vfp_2op_sp(s, gen_helper_vfp_negs, a->vd, a->vm);
-}
-
-static bool trans_VNEG_dp(DisasContext *s, arg_VNEG_dp *a)
-{
-    return do_vfp_2op_dp(s, gen_helper_vfp_negd, a->vd, a->vm);
-}
+DO_VFP_2OP(VNEG, sp, gen_helper_vfp_negs)
+DO_VFP_2OP(VNEG, dp, gen_helper_vfp_negd)
 
 static void gen_VSQRT_sp(TCGv_i32 vd, TCGv_i32 vm)
 {
     gen_helper_vfp_sqrts(vd, vm, cpu_env);
 }
 
-static bool trans_VSQRT_sp(DisasContext *s, arg_VSQRT_sp *a)
-{
-    return do_vfp_2op_sp(s, gen_VSQRT_sp, a->vd, a->vm);
-}
-
 static void gen_VSQRT_dp(TCGv_i64 vd, TCGv_i64 vm)
 {
     gen_helper_vfp_sqrtd(vd, vm, cpu_env);
 }
 
-static bool trans_VSQRT_dp(DisasContext *s, arg_VSQRT_dp *a)
-{
-    return do_vfp_2op_dp(s, gen_VSQRT_dp, a->vd, a->vm);
-}
+DO_VFP_2OP(VSQRT, sp, gen_VSQRT_sp)
+DO_VFP_2OP(VSQRT, dp, gen_VSQRT_dp)
 
 static bool trans_VCMP_sp(DisasContext *s, arg_VCMP_sp *a)
 {
-- 
2.20.1

