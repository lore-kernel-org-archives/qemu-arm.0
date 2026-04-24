Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D241FB44A5
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:32:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Ca-0007Ff-DK; Fri, 24 Apr 2026 00:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8C5-0006tX-OY
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:18 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8C3-0002mj-Do
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:08 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-40ee9b945d5so5993779fac.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005066; x=1777609866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKmMywFawCK57VzKvKaE3Fm1cw6vdHmu9uE7XMxBtQ8=;
 b=vlcMxp3+8XGgD7Gz5AB7Qxt1uN4Mx3/AKsV6HFP6nB6VEQOGJzdyMGIfAzkibkRtgf
 f+KzC0SNY1x+ma74ljd9c1kCsmaIinVF9gBZFVVPhdGnATs0/5/G/lJRThzGvD1g5bEe
 lhP0Mqoidv4C3dFvy+w+WMSToH472yx69PvN2F+AzwqyXPisU108ZZ4Je+nOmcJ8fPe7
 eoeYEXBax5FvVINl5aXCcCxU0GVzKIxkRagp/zachLyzrD5fOagsN8hy8ifjwX9eoc2N
 Q2famvSQfAv/hP6CtTt6ttV9XYP4fm6sZZSDiILTpVibC5m3WXncJKFjAlnOL0T+sg35
 1zVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005066; x=1777609866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CKmMywFawCK57VzKvKaE3Fm1cw6vdHmu9uE7XMxBtQ8=;
 b=ZdEl8ZXfFP8apGl9np6GOsdT9L1IAlQE7qchc6nvnsXOukhGnPh/GLOsKeIifFcm30
 fCmJMsenTP/DX8cxFrr5EI5tBoKYb2s1dx0679kOI5PgFQFCVHPvTWeG4MUt5N3pcV4p
 PeBKwBDzvY1Hx8+M2vUgr9YsA0rr0D0agSKY+a3uGx6be0OyMSUkfNc8CPXzcSDp1TGg
 J30G/+Ev+wAH8lWkZppGbzTK0VUXLClLFiFk0p6l+C3LIEJgcahhvdz2mFXmht0PCxgL
 +toCyseV9KR65w4PEDMkraclu2nLy1jitTbeEO/OriiBs+K9OrajcpS/5jVWINZyZKl5
 2vaQ==
X-Gm-Message-State: AOJu0Yzjy3X5R897YAuidUxb583vMv1UBUC2YsGqm/Ir06gLOsBD8jlO
 8VVb666Kbc3kOIZkpMIEOnmv0lN332kcVa9eAqmMNkUqEkJ2AmvaPa5i+IrUldKWkRUfNdTryeN
 LjzJKt2w=
X-Gm-Gg: AeBDiesxpUDrTjpl21e6U3iY44cirdc9nMqokEaDiJ/2fuGEZGuGiK+8qQKEHgpzrrG
 U8RvD9n6V9x5ruse4w59IBDaXrDyAbo6xZYY9JOtepqknly7PzqBpdCz12My1JLpeieZo5cEJ+8
 U29PdAKEFM+ssyRutwtqZJntE4Zirdq1vm/G+9A8RLyM+WlKKIbidZm4NF8NPVUz+MNKHfZ1LRg
 XSEw+ZSFpNgIsDyjHiUNuZ4qcBtPEfoYq2OoHdVMLt1XOnNDjzkz7qiCTz7QkiTB6JkBSnkNdV0
 aJAPM7iSBgLNWBnc3peKIvxny1zUVmsX32TIo8OUjNUAsW2z1SsoMMhWJiRnhPhOqRob9vcMX8G
 fm2KrSLYN0XnLeuNzrBrQssoI4FiTXLy+8o5RjUBAJ37tKBlHpMZyFGPfXAUORxBdvRJyTjWfl9
 LreL7mWZIqDEgJCZKqMgZI52Q/+0BUFMOyEcncFzYcweP1vseDY8BbHTqmZZkpLw==
X-Received: by 2002:a05:6870:3268:b0:430:b01:1f79 with SMTP id
 586e51a60fabf-4300b01447dmr157236fac.2.1777005066153; 
 Thu, 23 Apr 2026 21:31:06 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:31:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 10/40] target/arm: Enable EnFPM bits for FEAT_FPMR
Date: Fri, 24 Apr 2026 14:29:44 +1000
Message-ID: <20260424043014.46305-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1a0673a343..06b5fbbe55 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -787,6 +787,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_mec, cpu)) {
             valid_mask |= SCR_MECEN;
         }
+        if (cpu_isar_feature(aa64_fpmr, cpu)) {
+            valid_mask |= SCR_ENFPM;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -4030,6 +4033,9 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (cpu_isar_feature(aa64_gcs, cpu)) {
         valid_mask |= HCRX_GCSEN;
     }
+    if (cpu_isar_feature(aa64_fpmr, cpu)) {
+        valid_mask |= HCRX_ENFPM;
+    }
 
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
@@ -4103,6 +4109,9 @@ uint64_t arm_hcrx_el2_eff(CPUARMState *env)
         if (cpu_isar_feature(aa64_gcs, cpu)) {
             hcrx |= HCRX_GCSEN;
         }
+        if (cpu_isar_feature(aa64_fpmr, cpu)) {
+            hcrx |= HCRX_ENFPM;
+        }
         return hcrx;
     }
     if (arm_feature(env, ARM_FEATURE_EL3) && !(env->cp15.scr_el3 & SCR_HXEN)) {
-- 
2.43.0


