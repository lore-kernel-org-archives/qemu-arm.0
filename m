Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45657C5DF89
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 13:27:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxPG1-00024n-4J; Fri, 21 Aug 2026 09:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxPFz-000249-8E
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 09:26:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxPFx-0006Pa-Ko
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 09:26:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4815bce4652so609705f8f.1
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787318760; x=1787923560; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=I0h9mD58WMwK8xuh3O68ZsPFvMRWW43LjfznY7PTEQE=;
 b=LsMquxZCJAEbFBdfWqF2NQKmKhC3vZkn0ZctQxgvKajzKSU958uKr6iDvIcCM0cUjN
 TCPmaZuLUp0WwEdmdeuwZR9MTkNXT60h+E9iwqXPBwuAGneSrTqB3fGKheZg2mfq0kYM
 xdI+uJ0ZwuemNQjkNGUBVeHjol7T2EUvCH3RW8qxC9hfW+6DPvY3e/EmhmwHT8Oc555d
 jj9Q8W9t6tv2erG7AW/Lxg31sWPWvY7EcOdK3GIYa/ZMI9trncMpWjqiad1VhTlq7Oay
 K/9XT7E3a02W5iD0IHk4RPQVSPaQj0sxTqDMgFzWEtCZX/J6YamHnK+E6g68kz/BZcDS
 e1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787318760; x=1787923560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=I0h9mD58WMwK8xuh3O68ZsPFvMRWW43LjfznY7PTEQE=;
 b=dUZBtH/7HlddCttBPFQ9/yFRwlCsYG/KYiViGODh8nGMe3JU2csgTUbaS3WAPpguB1
 tcD9vKcgjkA86lT7xL0r+ODHO21lQQ9AKchMTrl4Mt+mni1AV6loFBqUMehZS58t7xyG
 Xe4JpExoKs4BRQJQVVTSzCOOSoo/Qmjw68d3It+BBxHuODRM/2r37Pmq1gyUbDXQlTUv
 2OLnVxjtZGsRqEFWgIHBSncCUewyJ72DE0dDMIeb+fiP6zr48zxa0APG+YpxDc/Frtvr
 mwqjtbna9SHcG3GJ/B4MYZG+F6WI5dA4PDLdgROfQHNKHDPn3LLyCA+Sj5S/CPWS5M9v
 ZmDA==
X-Gm-Message-State: AFuF++kSOYmdA7SJbkgfaoSjVz1sBb+lZQWCnUvY0fSd2kD5EoOGIb7t
 J019VV9pGh0QQeuwNOdFPgqW5ZPRSvpsxWJjr6CTGYne4CZ2+WoR4PhDEG4IZIkhoiTczluZQEA
 DjcB+HHE=
X-Gm-Gg: AR+sD13UXjzW0Z085+9SCUUqIrESyhQu+hjdqXBiTuGkmtBUwf/hklHixDOhtnKPTwD
 2BUrw0lbjMRSjp39ri4tOG3sH3Cln+q7BvBBien3P4nnAoOwXYQV7UH5LDORPPG7j73h40WvaU6
 V6Wub0CeMdpngF+Gt6bPg7S1XiK2PFQzORtjhrIXAKSZFLwqelzM6XKRHzzMkJLey/eYYbPo64x
 SRzzlCUFO5hwH58/rBNZRpSdfDYDYLMfA0KrnfQNK6rPOyCcNSG76kKlcbpp6ZZK10VAGH1beYL
 S7B9OwQP6pYsYu71EbD1s9mEpU4UHo9bv6NF8tFSQTfQ6oOp61ly5ArtcdWHc+2Z6YfJHiLudv0
 jYWUsLw0auypTZD3oqrMjGQoNBTLfxz4lelFkGBlny7D0+Wqy0k4csVkzvSu39U6SEkOT2yN11N
 YKavZGw5dbYg3u5wk1L8y0gLA7YO6OZ2LzUKXWFkBTGOEpuamxV54UwazODtCMKt43wQ3+rF8WN
 8SZ0uTEberBoU6SVFHEQwrlpveAYmHWm4QmjNM5bAXaL4oVKS+LFNs0OGauiDHjbrc11g==
X-Received: by 2002:a05:6000:4811:b0:47f:8fc8:a8b1 with SMTP id
 ffacd0b85a97d-482c0b9b22dmr10710256f8f.14.1787318760304; 
 Fri, 21 Aug 2026 06:26:00 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1450e54sm18770327f8f.11.2026.08.21.06.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 06:25:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Make IT insn undef when not present
Date: Fri, 21 Aug 2026 14:25:49 +0100
Message-ID: <20260821132550.168896-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821132550.168896-1-peter.maydell@linaro.org>
References: <20260821132550.168896-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

The IT insn is introduced for A-profile starting in v6T2; for
M-profile it is present when the Main Extension is implemented (which
includes v7M and excludes v6M).  We were missing the feature-check,
so fail to UNDEF on earlier cores.

Add the missing check.

Cc: qemu-stable@nongnu.org
Fixes: 9ee6e8bb853bde ("ARMv7 support.")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index df98dc2e34d..103e2fe7c73 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6038,6 +6038,16 @@ static bool trans_IT(DisasContext *s, arg_IT *a)
 {
     int cond_mask = a->cond_mask;
 
+    /*
+     * IT insn introduced in v6T2 for A-profile; it is only present
+     * on M-profile if the Main Extension is implemented.
+     */
+    if (!arm_dc_feature(s, ARM_FEATURE_THUMB2) ||
+        (arm_dc_feature(s, ARM_FEATURE_M) &&
+         !arm_dc_feature(s, ARM_FEATURE_M_MAIN))) {
+        return false;
+    }
+
     /*
      * No actual code generated for this insn, just setup state.
      *
-- 
2.43.0


