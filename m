Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2608415lfy;
        Mon, 24 Aug 2020 07:32:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYrI+0LQThd5FBG9eJMeXWFp9lOYmwKrSRPWHHyy+KlGZZDnJkrdzW6EXRzVef2RMra0jH
X-Received: by 2002:a05:6102:3106:: with SMTP id e6mr2940327vsh.56.1598279571478;
        Mon, 24 Aug 2020 07:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279571; cv=none;
        d=google.com; s=arc-20160816;
        b=q+rJXXSVpm0BZkY70N+T2biq2PD22nXZOt4RQ03Ir5bKzsnRpEBVl9QK/LUD3qbtIU
         GM3uXYc3kRoamMu7faLe5brnqDJeOM7GcZFw6ySnY7wMtecr6ws1pgvTgMCZAHSoaUjz
         L/9Xk3gFO356H9ZARuIwoDSRxq878o49uxkwNsEKjsLwxP4arjCP6THWSlefW/8rosLS
         Yw9yZKR0WgRnGN+pnD9SWZPFaRWWrJHgPFisYyQ59jigyeBZSrXDUom6C9QQHOCaN51W
         W9wew5x3EY1BAV4Ylip/zYV6g2bZwBvKJDBduOaxKE6/U0OCrXEDBxyXdfsJ5ElZxKeW
         PPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BJdw8FfCZJdSR7ShLg04kNyoxpE7jwtftdkn3y8quQ0=;
        b=Uo2am0xKz30UN1CMk46xn6aEMtZOvozCbPEPEv0e+rv1iDJIGpQ0VUogkhW2YcDdkw
         pnbto1K7SY79SobOw46D1IGz99wsbP8XKcc/JZWCP0hBLiahmvtObmWzLd3f0plRyPN3
         cfV159g2M1H9toAHTxf7kpM+4TGqw/lX6a6V+elEPkaUj9iXMY7QcAxcYdQjs0L3YOiO
         kwgMLZ6d/I+MrrD5ncVeuFOG/ycn9M8muMU4T0pkLbPyEpPGDyf8YKmzRqhSk9ANTo/r
         gAEsoQ6d1tEsNfbZsKmiNfdyFsadewcJMadmXAgX1AnfWNvKB+YItGyoJTKQQT2cwDUv
         QUPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOTkOiLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si110776vsr.153.2020.08.24.07.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOTkOiLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADWk-0004l9-K3
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTp-0008Io-1a
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:49 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTl-0002gs-T5
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:48 -0400
Received: by mail-wr1-x444.google.com with SMTP id f7so8942873wrw.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BJdw8FfCZJdSR7ShLg04kNyoxpE7jwtftdkn3y8quQ0=;
 b=VOTkOiLKDg60wFoBOY1Mf4lBchmikWt9cipAcoM4/dzG+lBAU5bHFZKOk/ZkpJCi3R
 Jn6ej0B7/T3uKt73UDaLqeKFq0tYiZX71Qk9eZkLH68lENE++QMhJeacOCk0S9s34vg8
 qhaRjjclTJb00LGSQdCkqWf0qscyEwLa85GTcvbAIx/C7mLI/mEoJgNGQrwnISHXXvpI
 3NX5MmIWj0phEiIiwDLlAT8CmfJUeBQUq85702OqNrT0g+IaF7wrVFTC3DbaaSfV4GyH
 OOUHWhiDDfYpY+Po+C/yxlsrcQL297Kb4EkZWV1QXwnQzeRDTXCvQMgueriu24isL5NH
 bT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BJdw8FfCZJdSR7ShLg04kNyoxpE7jwtftdkn3y8quQ0=;
 b=mJqkzZnO9kNs7kA5nrf5lX7RaayVgEjW/6I4TD7Rzr1KN7L20n8z5gDw/vhOtVp+cH
 JBMbFV5ccxxT1MP8jije0xui+RhGj50idn0G4Ype2CEVdMuxHmuVrP2SWZ29Z+cIBVxl
 U778VzrhmEVPuEdJi1mGlMTUHtIpixUs1MQ9rwVl/U7KFivWVTOYG0AEYsEw+PNqFLwP
 j0BZCoPLyoiI80YWpJo1GMg7Wdwt3x7XULFdVuBVSO1Xulr3EI18lJ+dPVBPnhMrA6ne
 Zv5wPogcQNaHDV0fL5Vby5GWhr7fvrBMgUYe41CtYowSlo1m68WLGuICiLaQQIPNwMW0
 IFmg==
X-Gm-Message-State: AOAM533J4LLqmlWyjlKrxRhNKqnSGtXjNHT+P2lw2dNT0vWwsBCj8xGQ
 ThDmZk+O5tt1kRKxaXmFmFAZLZkVdjfv8BNg
X-Received: by 2002:a5d:56c9:: with SMTP id m9mr6016716wrw.311.1598279384339; 
 Mon, 24 Aug 2020 07:29:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/22] target/arm: Macroify uses of do_vfp_2op_sp() and
 do_vfp_2op_dp()
Date: Mon, 24 Aug 2020 15:29:19 +0100
Message-Id: <20200824142934.20850-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: /5JPxYl6sXOj

Macroify the uses of do_vfp_2op_sp() and do_vfp_2op_dp(); this will
make it easier to add the halfprec support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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

