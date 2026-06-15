Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26E1CD98DA
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 10:51:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ4uJ-0000TG-Tm; Mon, 15 Jun 2026 06:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4to-0000QV-Sc
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:44 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ4tl-0001SN-Qi
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 06:50:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so1963215f8f.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781520632; x=1782125432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2fxx0HT57BvR4zKgzbdI8CQgvLW39zgONazI3L1iFlw=;
 b=EDemrtzmZ38UvEtKfvtWE56HXO78QCU6WYpPmXtWG3GCbBQPTBRXZhKYr2OWGQcRW1
 JT7HW2uigVL2b7pwMOyU1ntukNkfExlB2EzrMxrDRyOjfmUYOnLmvHxqRdLQx78SvMCb
 ORfWsY1i9fDovJlntQHJIoNyKDEV4IYURsIqqwMPgBgcRnr68Sb7l26q0J1mlFQnHPM4
 /xs/aN8FGPN6l5rO7GcIl4AcKQpZ8bMvADsqYUlnjRiEkWxgsoTNwory8z2j3WfxroHS
 tj48hJxchLklaYeOIgRsfd/yxAN5CJF+pRhBJ3PawPVKnBG3anBxXCVp3gwfbyhxxtqP
 WCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781520632; x=1782125432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2fxx0HT57BvR4zKgzbdI8CQgvLW39zgONazI3L1iFlw=;
 b=loXhoNZ6Xhdf5Ncj7p1YXgydqyodBy20RGdzzr8Ld5lt77xk5e1cswo6FOEOt75Xd/
 clBMPU9jlhPDW6fFwFs3zdUHbNb0LJDG/wpCiiePGAFBk7GVxD7xsAmuCzuZBBJWKX0s
 nYIqbwH93Sy/cyaSyLIsm5pmN3T1VqPBc9o9fYhhnWvCWE8ktyfCnXlF+sq86XK1+2af
 3HON5L88IG5V6IiYZrBoLVvkx81IyV35M++hTlfY5gy0PSfSTkLuD5cRstPs8kTnzQJK
 Sy0pTIpgmy+aC1TVWBcqXqMPQSOQjXbXvK69HM27P72nXL4zkU16T6JqqEk9kR3m5Dua
 OFJA==
X-Gm-Message-State: AOJu0YyxD2EOg7Sbq5acfrO750Iqsiyml/ftgF86VCZA80qiHOR2TbFA
 iRHTsmli1LxSl/Vgz2ea9cMGDEqPNxEzRwshMy8khm8fLRA1ENrjsni5PFPYsVOW0U5cJ8hqmOX
 lv39o
X-Gm-Gg: Acq92OH/bricsqsSt3r/nlHeguHupOpxheTzWkgqc7KT20qKPE7Y/7icpnuWJIR75/z
 /YU4RGhn3pruZxbK5YYTw6Db4c72Sq5J5byHQ2hAa7LJouM6DyrIZu2RF8K77z14zp4gkZeD723
 CW9mI2TqpgQDEQ3U1JwJTVpSL64qj0D6S8IUebny6EcSaoYRGbTEA+7TNq2aB9XJ6MXCM8wbCbU
 FkubEaZ5G1Yc1Hv4VLWCuUEBQb6SML3FHjjaewuyUBWNGHRRqikCd9wbZk+kdIyIHVsw/uEeUU7
 4WXzrrvLzxFaulEAKUp3Y/vDz4BkGhyNQCs0nAQIKG8Tbb+bgL1TV0spyv7i5m1nmUoZ7SyN5tu
 nI+/B1QAm6B+EurR5JzucZeEi1gq4UrPX6KDwDJeUMWz5OtVkU22IezpxaI+/jAFyA2tuZdJYh1
 3xge4WK8oCjwXX5uE2f7bcLxgjKkO+jS5lCPdK31CV2SE+HC8I7bgV/uMfLRyeKrryyh+aaBhHY
 O/7ThZw0hOH2EnWxRFnMLM2qzsArSQG8ZGEJah1wgg=
X-Received: by 2002:a05:6000:400b:b0:460:660a:3647 with SMTP id
 ffacd0b85a97d-46074a89e32mr14757375f8f.25.1781520631912; 
 Mon, 15 Jun 2026 03:50:31 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263945sm33863674f8f.8.2026.06.15.03.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 03:50:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] arm/gicv5: Add URL to GICv5 specification
Date: Mon, 15 Jun 2026 11:50:25 +0100
Message-ID: <20260615105029.2898872-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615105029.2898872-1-peter.maydell@linaro.org>
References: <20260615105029.2898872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

The GICv5 specification has now been assigned its final document ID
for a rev A.a spec version.  This seems like a good point to add a
pointer to the spec to the main source files.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c          | 5 +++++
 target/arm/tcg/gicv5-cpuif.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 6b1dd04991..0fa3d6b601 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -4,6 +4,11 @@
  * Copyright (c) 2025 Linaro Limited
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * The IRS is defined in IHI 111701
+ * (ARM Generic Interrupt Controller Architecture Specification,
+ * GIC architecture version 5):
+ * https://developer.arm.com/documentation/111701/latest
  */
 
 #include "qemu/osdep.h"
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index dd2f696511..891cb2d3b7 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -4,6 +4,11 @@
  * Copyright (c) 2025 Linaro Limited
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * The cpu interface is defined in IHI 111701
+ * (ARM Generic Interrupt Controller Architecture Specification,
+ * GIC architecture version 5):
+ * https://developer.arm.com/documentation/111701/latest
  */
 
 #include "qemu/osdep.h"
-- 
2.43.0


