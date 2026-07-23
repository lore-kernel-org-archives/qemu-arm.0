Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C167FC531FF
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 23:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn2xa-0004uB-Du; Thu, 23 Jul 2026 19:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wn2xY-0004rV-DW
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 19:36:12 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wn2xW-0001cG-MC
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 19:36:12 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-4560d6f82edso686392fac.3
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 16:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784849769; x=1785454569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PRIi6XtfgqYlUx793rNESywQHULiK6u+HEEbogPG23Q=;
 b=YX+weK1kZ6qpuv6z/1auEN053Xss9KwuMZhSS0VY/Qm6jXaZj4uKolxBc5bm1W3BDw
 drduNUwvEDO2D+Kc4P+NouAFj9QzYjfmfHJaC77WZrfqE0PsxrQ+BbsmN6ZGqcZI8jJw
 AZoeGCBOFq5QwRDapbV++zOyUfdsSssC0fwKU9tO/vwtoxEl7CHg/uCdsbvmanxhYM/2
 jAR7Qtci0SDyroHEsOp1azWGRh9ZO7nMu7wvzQVhPSrZqB8gx62T4+lmEYCLTdOEbNjC
 jWZxsotERYbQNINjzxbLsfiOjjU0+cH5+9QErUgWursGhid/m7TxQXGBBpO61GserTpZ
 Zi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784849769; x=1785454569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PRIi6XtfgqYlUx793rNESywQHULiK6u+HEEbogPG23Q=;
 b=LrpMx/kj309U5FBl4dwVc3hQgmY2VB4AGgSEFa+2LQtcNMLbxcg8vPj3R3ua2omfRy
 m9t5Ueo9ZjJUaNymhdcWz98u66qK3PvqrXPdLilKBJ5fYYdEu9+KN6BDyo78nZh1UNH2
 Mr6/YWMiMkEe15mLXfZhmZkUePjXIkGPyrA4QsLEeQjKTHp8XVSPajkl8F9vynUX6Fdb
 koo5d9Y/1IpUZs9RAVxF3epx6ra577GH2Cy1Vn4QxtEzAn9X8WbFwuIwblYjxB6kaVkM
 i0m1jBUfpmJAiegIEK06+pCobDCF44Lb2wqcacw8MGKz3wjMw0A3ILTJYsOMxKDjAuaa
 csBg==
X-Gm-Message-State: AOJu0YxxgOOJkNsm7n7cY0UMV9vGYWxW9D/XyIG6SmGRzfVDzshaYmQ5
 kOrkS+fYM6is5guDasP8fDRmfSBWAT2dE09xLhC0o0zH2w+lhOl0UPN1
X-Gm-Gg: AR+sD12AEOpt8UyZEsFjYPMkV1x8517WQS+vSyFmAWmIp85F+zSTBKKRDANfJTeu2ke
 5tsD1e1GKjcBxZn7ZD+ZSqPuCt3RTcezYLIGP//4pJMqOKcRfPAFrzzfPlU0r2py/lCT1w6EDGC
 MR3eQH+NVhZyKS0c71cAh+hesFhQMIALHmLBs4mFGz4TOBsSZAP+ULs2KWZ7GnsvR0JxdrsFdxN
 u4vqywExywnojNbKcHtdv5gwkgbjycF+0FII5ddIi6QSvzcbcaFbkdTKY45SQLU57zW3oTDVIdG
 7z/UQ/oBrTu+4CE7fnOGen23txiUIZiKtan2kBQXd1vMF7W56qR2WLgHvQNP6LH6L4/pgVBwz/m
 CekCuGvJ60ZLmMobAmj1KHcKzRzTaXvryCOQouSzwh16Uwlt9KFzXIY5VGt+kKcID4XwVcFRQZt
 xmUPCpMj7QxJzs93uYHzHSLMk=
X-Received: by 2002:a05:6808:f07:b0:4a1:296:adec with SMTP id
 5614622812f47-4ab352904famr3191656b6e.15.1784849769077; 
 Thu, 23 Jul 2026 16:36:09 -0700 (PDT)
Received: from HPE-2MQ6131DV6.home.local ([23.124.244.239])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4ab248c6667sm3631997b6e.0.2026.07.23.16.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 16:36:08 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Robert Elliott <elliott@hpe.com>, Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH 1/4] target/arm/tcg/cpu-v7m.c: add cortex-m85 model
Date: Thu, 23 Jul 2026 18:36:02 -0500
Message-Id: <20260723233605.805-2-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723233605.805-1-simonxhy0404@gmail.com>
References: <20260723233605.805-1-simonxhy0404@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add Arm Cortex-M85 CPU, modeld after the existing M55 CPU.
The new M85 feature PACBTI is not implemented in QEMU and the midr value
is based off the r1p1 product revision identifier.

Arm Cortex-M85 TRM:
https://developer.arm.com/documentation/101924/0101/

Reviewed-by: Owen Giles <owen.giles@hpe.com>
Reviewed-by: Robert Elliott <elliott@hpe.com>
Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
---
 target/arm/tcg/cpu-v7m.c | 41 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index dc249ce1f1..a1e62a20f8 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -237,6 +237,45 @@ static void cortex_m55_initfn(Object *obj)
     cpu->ctr = 0x8303c003;
 }
 
+static void cortex_m85_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
+
+    /* QEMU currently does not support the PACBTI feature */
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_V8_1M);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr = 0x411fd231; /* r1p1 */
+    cpu->revidr = 0;
+    cpu->pmsav7_dregion = 16;
+    cpu->sau_sregion = 8;
+    /* These are the MVFR* values for the FPU + full MVE configuration */
+    cpu->isar.mvfr0 = 0x10110221;
+    cpu->isar.mvfr1 = 0x12100211;
+    cpu->isar.mvfr2 = 0x00000040;
+    SET_IDREG(isar, ID_PFR0, 0x20000030);
+    SET_IDREG(isar, ID_PFR1, 0x00000230);
+    SET_IDREG(isar, ID_DFR0, 0x10200000);
+    SET_IDREG(isar, ID_AFR0, 0x00000000);
+    SET_IDREG(isar, ID_MMFR0, 0x00111040);
+    SET_IDREG(isar, ID_MMFR1, 0x00000000);
+    SET_IDREG(isar, ID_MMFR2, 0x01000000);
+    SET_IDREG(isar, ID_MMFR3, 0x00000011);
+    SET_IDREG(isar, ID_ISAR0, 0x01103110);
+    SET_IDREG(isar, ID_ISAR1, 0x02212000);
+    SET_IDREG(isar, ID_ISAR2, 0x20232232);
+    SET_IDREG(isar, ID_ISAR3, 0x01111131);
+    SET_IDREG(isar, ID_ISAR4, 0x01310132);
+    SET_IDREG(isar, ID_ISAR5, 0x00000000);
+    SET_IDREG(isar, ID_ISAR6, 0x00000000);
+    SET_IDREG(isar, CLIDR, 0x00000000); /* caches not implemented */
+    cpu->ctr = 0x8303c003;
+}
+
 static const TCGCPUOps arm_v7m_tcg_ops = {
     /* ARM processors have a weak memory model */
     .guest_default_memory_order = 0,
@@ -290,6 +329,8 @@ static const ARMCPUInfo arm_v7m_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m55",  .initfn = cortex_m55_initfn,
                              .class_init = arm_v7m_class_init },
+    { .name = "cortex-m85",  .initfn = cortex_m85_initfn,
+                             .class_init = arm_v7m_class_init },
 };
 
 static void arm_v7m_cpu_register_types(void)
-- 
2.34.1


