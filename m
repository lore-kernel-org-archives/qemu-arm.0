Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312E4C87FCE
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 17:56:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufMdf-0007vZ-3y; Fri, 25 Jul 2025 13:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ufMdb-0007kv-GN
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:55:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ufMdX-0001ky-FJ
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:55:17 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b77901b4d2so151648f8f.2
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753466114; x=1754070914; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNWd437IneI7rQZbiaYAiFHnUytRK1qpbnn38Zb1wZA=;
 b=FndEFV9f/a01nyspN9eYGHVaNs0VH2mGgE1OElA1qJyGHLJknGQVAf8A8hnTzjgNDy
 wredVDgJTO4ekTfa9IBl01gq62BUsYcKymmD/WfY6oUf7JoYyVVsJkjCNrvr3Ub+x/Fp
 IlXGBVezS01+P3GQvIwXytIfNtb9huLi3aFbuXEZRx8o02C+IArPWY+Tfw1vHdSpyA3t
 GS8H13IR3KWJqvt+n/uzhiTH4pHPOu/yR7FdYIjOtrDx9YXVk46ck7MLPFz+5HnARYVq
 likdq47SPyv6FovvI14Lpvi0Q2Z/hUSP2XxYg7HJdmseknP3RZKpXjN4ZpTQOd8L1bjm
 mepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753466114; x=1754070914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNWd437IneI7rQZbiaYAiFHnUytRK1qpbnn38Zb1wZA=;
 b=c2PYAGXxpTm/edn+FJAkE0yZgvXFKpQw3c3OwdmJIroYvFwRMk43lWO5aoSaNSYbCH
 sksT4leoB0qWH34Dyw5YhQSLESVHOn5EDiIiMajmxROc30w3Dz45J40dfo/F+H9Pu51c
 tEfFlKb8phVw3/ZrHdZBD3J8Arix+Jt1wT5hsVG8ROtb/LNFgueAOUVD5hAYJw+ImDbj
 e517EuTEqKjcoXCx93LSAP3MHdnn9dh85L5yOtlwhKUlK+dR+l/UYILT9FdAIlI20U+u
 svReA/d/cuFr4GKkDKHmZtkMBMood1zXHXvs2N2yiPp2OsAdm4HIdeZ+B/zHLGnYqN/x
 9cXw==
X-Gm-Message-State: AOJu0YxmF81uiwjAl5j3XLu2d+GqzdvRQgMpand7YPxpEC2dQBpvvPue
 ds31cJKmvzCaNPLNa3mx0BdvjkE9UBs94+5WobQrra2fR+Q2ohxsnrtIJDSyGWgPnDVxmGaQK0H
 GqmxH
X-Gm-Gg: ASbGnctgc4eLy9wcpUw3zAP/Qe09BDCdRhG1WSUd8LZUFyoMbtp3Dt/s56BdkByaUrN
 nXrsVEFt6KPz+9cTx7XKlAQrA5NerrSgpmohJTimF9JkO9XQM+tX6/RT85f2XkUfcd0sF5021/e
 d1GAKM/b9NWxq3in+BFDFD5N7txvvHzelE6LoEoPGyKJ2LqRa4XFPa5dSnKNA/Ylkid+QfLXixW
 rUnwgVFJ+bjeP8HXhZEGx416A1mxPkUaT5EYx+LUOFzvz44o08y16B/iOC7dCZsSx05EpbEiMtl
 ttFgB4XbL10mHTEsIOAQAQs07G6rlx7nOwl9xcq0blxD34w0iuNX0vj6WMGp9vd7jsmdApNAau5
 dQCTAR9W15zh87f4RWc3gf+21ZUx5
X-Google-Smtp-Source: AGHT+IF+U1f6wmbiKlV0Fz9wOf+lF3q8IEne9h8zxkeXmFO4McUPkhkeZR3lu5O0rf32JiAwCHUhIA==
X-Received: by 2002:a05:6000:2484:b0:3a4:cbc6:9db0 with SMTP id
 ffacd0b85a97d-3b77677defbmr2740567f8f.51.1753466113781; 
 Fri, 25 Jul 2025 10:55:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b778f16819sm499036f8f.67.2025.07.25.10.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 10:55:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 for-10.1 1/3] linux-user/aarch64: Clear TPIDR2_EL0 when
 delivering signals
Date: Fri, 25 Jul 2025 18:55:08 +0100
Message-ID: <20250725175510.3864231-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725175510.3864231-1-peter.maydell@linaro.org>
References: <20250725175510.3864231-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

A recent change to the kernel (Linux commit b376108e1f88
"arm64/fpsimd: signal: Clear TPIDR2 when delivering signals") updated
the signal-handler entry code to always clear TPIDR2_EL0.

This is necessary for the userspace ZA lazy saving scheme to work
correctly when unwinding exceptions across a signal boundary.
(For the essay-length description of the incorrect behaviour and
why this is the correct fix, see the commit message for the
kernel commit.)

Make QEMU also clear TPIDR2_EL0 on signal entry, applying the
equivalent bugfix to our implementation.

Note that getting this unwinding to work correctly also requires
changes to the userspace code, e.g.  as implemented in gcc in
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b5ffc8e75a8

This change is technically an ABI change; from the kernel's
point of view SME was never enabled (it was hidden behind
CONFIG_BROKEN) before the change. From QEMU's point of view
our SME-related signal handling was broken anyway as we weren't
saving and restoring TPIDR2_EL0.

Cc: qemu-stable@nongnu.org
Fixes: 78011586b90d1 ("target/arm: Enable SME for user-only")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index d50cab78d83..6514b73ad98 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -666,8 +666,12 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         env->btype = 2;
     }
 
-    /* Invoke the signal handler with both SM and ZA disabled. */
+    /*
+     * Invoke the signal handler with a clean SME state: both SM and ZA
+     * disabled and TPIDR2_EL0 cleared.
+     */
     aarch64_set_svcr(env, 0, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
+    env->cp15.tpidr2_el0 = 0;
 
     if (info) {
         frame->info = *info;
-- 
2.43.0


