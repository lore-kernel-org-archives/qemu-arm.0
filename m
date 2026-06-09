Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F67CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:27:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX265-0007yP-6q; Tue, 09 Jun 2026 15:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21q-0003YE-7Z
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21g-0003zv-5p
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2c0c35980fdso60217915ad.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032875; x=1781637675; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxJlZl6n8F/qIy1kJwiEnWFNrPr1p3ske2PZwKnmD7Q=;
 b=xC9sfD4wz33+MK2lSFcwryHr3uSrufASx2/X6y3/hsmu3AvZTL6y3yyC4RSQOIxuB8
 HimgpsY0EzA0/JknNyZXQUwZH9sBOqTTu8sPB7BTg1LfJboZiNQWHtAMg5/eiNyA+ZmK
 nCRWiVtRA1k1ZNAx8lbbeAShwbAyntON/7Y8V4IeXyZ79wpoifQuIX0jGclqhPExWilv
 f0LfAOEQA9+kRYwYtq4k8auJ3TSU0F/GP+55wzhkdchpRcK/IJ1QPwHJErohcwWtoAgK
 lNfqYcvbBKw+Fi9vg01pp6umlnRmI7iR5NPlgjYsHpB6TGLuIzN+nO+//1OCjGvN77gH
 Maag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032875; x=1781637675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qxJlZl6n8F/qIy1kJwiEnWFNrPr1p3ske2PZwKnmD7Q=;
 b=WtU8SIuMVu4ervMPAfi06oc2bBqhhCzr+d69X1n/A/REoq63Ov+PWZ+jX0FV2g46W9
 1l40/p+eIEoUUe59HGEfdbXqvif+Up8+TnEywMbXbQmSnUQQ/XymtqJ5uXFPnEqzWGDw
 6BbxvlQb7dFM1uElU4X/XF4SmlxpARb7pBUZaUBHg74tQoh33roxw6EJ7qjeU3fXYgLe
 LE6oMAIpT0Jdyeai5PGxCJBt1h4C5QvFZV56JbFDRnI93/pPHiaobppXpAgXAYvmy3aH
 q6rJpUV6bPcBGVNOBOhkt3RpQ/4+xHyNN4CQm5v2ZfRjDzXfBexOn3ECa4+e/N/OsAJH
 I7OQ==
X-Gm-Message-State: AOJu0Yx4mfRD/r+x3VP20XOYm0gGnzOp0QfCZEij6Tp2AoC9rV/7Sl6Q
 /mYvQUHjibdpO1E04m9XlDiNU0HNIo/O+GRivenTHrvAV0WlxdPK6fJlSz61KBDdkFTtTJiZyiW
 +qxsLPBA=
X-Gm-Gg: Acq92OGmFINa2HOtiTRtyY0AGf/fBqmzQUrHThYu1maqUcSUXRVx8d8ob7kQtw+KaOx
 w0+iQpViWvAsYqbKjmHrD5FQYfXXaVawPNBWtGI3xQ85XVkF2k1XgxayHLQbSDlTKxipSCaQ5Ct
 O10PX1L+mI66XB3IfwGMTv79uUnPh1xm21mt07u/UDdOB6kB9nQ1o25qNlETvstK39kgzmkfE6U
 kJVlc3eZIgxyBHzfpm0f3V+VPKisntBZ8PbidykqPo+TCmrIkCy/pOOYg64mkx9oO60D0Ea8Oy5
 n8Er2d/O6pXIukt1QNKxD0luq1Qtjq7Oavh9PdgHZgl7d+rSe5mE1K6ODM72M1IymYXoutMZmj/
 4KCRnlCeD9sh+MAsCdO/3USz7DcwYb+f/14K8SvD0gHezjQQvpB6igEvx+84IhILDvnAfcCCfZf
 vT+IBwDJ0oYwXrLWhqvkfxQwfAO0WcDvaXkkQkwFQ=
X-Received: by 2002:a17:903:3bc7:b0:2bd:c925:3a16 with SMTP id
 d9443c01a7336-2c1e80e3bcbmr254403755ad.2.1781032874861; 
 Tue, 09 Jun 2026 12:21:14 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 05/45] target/arm: Introduce arm_init_fp_status
Date: Tue,  9 Jun 2026 12:20:29 -0700
Message-ID: <20260609192110.752384-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Create a function to set all default controls for a float_status.
Other settings for specific FPST will be set afterward.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a13e6dae2a..b75c6a6622 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -304,6 +304,13 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
     assert(oldvalue == newvalue);
 }
 
+static void arm_init_fp_status(float_status *s)
+{
+    memset(s, 0, sizeof(*s));
+    arm_set_default_fp_behaviours(s);
+    /* We want 0 for all other settings. */
+}
+
 static void arm_cpu_reset_hold(Object *obj, ResetType type)
 {
     CPUState *cs = CPU(obj);
@@ -626,20 +633,16 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
         env->sau.ctrl = 0;
     }
 
+    for (int i = 0; i < FPST_COUNT; i++) {
+        arm_init_fp_status(&env->vfp.fp_status[i]);
+    }
+
     set_flush_to_zero(1, &env->vfp.fp_status[FPST_STD]);
     set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_STD]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD_F16]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA]);
     set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA_F16]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A32]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A32_F16]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_A64_F16]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_ZA_F16]);
-    arm_set_default_fp_behaviours(&env->vfp.fp_status[FPST_STD_F16]);
     arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH]);
     set_flush_to_zero(1, &env->vfp.fp_status[FPST_AH]);
     set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_AH]);
-- 
2.43.0


