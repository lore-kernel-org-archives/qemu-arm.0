Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08493C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 11:00:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wi8x3-0006bf-Gn; Fri, 10 Jul 2026 06:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8x0-0006XD-8G
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wi8wx-0001Pu-Fv
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 06:59:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-493c7902f47so6857525e9.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783681158; x=1784285958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PzHxCXsIOILaIZXbiZCOtU/tN9ewAfAvcdvjSx7fAwY=;
 b=Oz9p/VZ7GEk7IZcAViytVng484dusrcF27axUwgHcA2YjbOdumOGMUe2dEBe1U3FdT
 rNhhMvrqPcE+0rqySJMqhPcUqVwmWUDv30s8FY8jLVAPPq0/2D9w7E3JqpCGLpZ7nOv9
 adveexRBGA2SciDjbYa+4z3u3giZ/22/fhNXlApMAV1tFqDIrBq4f1lAbIWGrnoIuJzn
 5fM0l8zImqpq9uAcBYVZ9prEAM/1iJOAPHbpoAYG0oz8E2EhamZGEhVkETRCsUJk4+cE
 Gg09f44+21wl7/1cA61Mi24FGbaRcLDZJtTjRZNJJX1CHM3G7DudJpAm1/P4zF2lC75U
 3KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783681158; x=1784285958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PzHxCXsIOILaIZXbiZCOtU/tN9ewAfAvcdvjSx7fAwY=;
 b=lah3JLTHPuFhQvwZEt09w6DDGFRrwfTk3PTFOEjf9Fio/DsiVaSRjngj+8IAtP4dsT
 VnbTKzJcqYqC52LYy1A+5gUmS66UYm8tQTEYvqTSyBUTPGdShPfGP8sWJZ1x7BryniAE
 JUk7M+vv8LeZBUYeDIN6vxKJQsoDLTcDGTsJtFnTutgQSA6lSF1XSxJkTDpnOtkHv8Vj
 7ZlNos7l4vcQZTMuCuVQXPJ++0LsJkLmOGdikjMVxZD9fFBh4xntotKsjvQwk+tAsVmI
 Fn5vjdTccMRsbLnAjtH4NQ+wcdfH9EXKgnLuK49ynUnUVR3lxoRCoYyX5MrO26LdKsWM
 wvQA==
X-Gm-Message-State: AOJu0YxZcMhXPdW/GD7LrTCoGKsHJ/L+vwxsaYidAJtmNBE6DmwzuN8e
 RnXTuJNLoTk9Q2wQMrtdwQTQECARbsCOvGn9im7gfnDVFYpFXmU7/GKtFFSKXL+ez+Ji0qxKfHy
 gmhj+oY4C9A==
X-Gm-Gg: AfdE7clGnZujDlr3hVXKfqtcGyjVrRWh9bdMJldHa+oWpvDq61qBdom4F8saktvJzgn
 2ldiqceWIz0hQsZ2eNmLWGekWFBuM7KHBTiwYvl/zhhjPGWE39YtrscbBEjItwa8B15SgrAaGjb
 NTWeLxx5RnwOXWy00ik9ei6wOq+pmj3MCDLG4N1n3QIP3NnRMXWT9fr/Q1tOscWPBQEmRkhqSxW
 8RxkEZDKmMB0/jUl8169y1RBkvTTg+VpTjDqlsR3ZJIlNwDk3PMALMIIsAnlPJPma9G5pAAkjxf
 pj4bXnC5OHQ0PbxW5A+5tmPZrLetLzVo3oNb31qkeOEUWDc/NCyWK0XLjoM982AE+LPduH2DaIU
 w3poYrtT7LsbsNuhccvVpGeWDW0IW6scYw+qo1r23dn3DM6c175fHV388+xQDmXB9B3mo1tGm3p
 gr9trNPmUeebMRcE3EHBwMkGrN7lPbWbIJAASPz7vNA4Aa9peZgX8e0Y+khUgSAYvNg7hNmkeYS
 aNF+QdUIk+rYSNqY4oSWQ==
X-Received: by 2002:a05:600c:3b26:b0:493:e3e9:85fb with SMTP id
 5b1f17b1804b1-493e685f1f6mr113555855e9.20.1783681157419; 
 Fri, 10 Jul 2026 03:59:17 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm51946175e9.1.2026.07.10.03.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 03:59:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 8/9] include/hw/arm/omap_dma.h: Move to include/hw/dma
Date: Fri, 10 Jul 2026 11:59:06 +0100
Message-ID: <20260710105907.2570621-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710105907.2570621-1-peter.maydell@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

omap_dma.h is the header file for hw/dma/omap_dma.c; it fits better
to put it in include/hw/dma/ to match where we have the .c file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap1.c                    | 2 +-
 hw/dma/omap_dma.c                 | 2 +-
 hw/dma/soc_dma.c                  | 2 +-
 include/hw/{arm => dma}/soc_dma.h | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/hw/{arm => dma}/soc_dma.h (100%)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 9e739a0712..0f78cbd410 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -32,7 +32,7 @@
 #include "hw/sd/sd.h"
 #include "system/blockdev.h"
 #include "system/system.h"
-#include "hw/arm/soc_dma.h"
+#include "hw/dma/soc_dma.h"
 #include "system/qtest.h"
 #include "system/reset.h"
 #include "system/runstate.h"
diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index 1a3ae74726..16575e73b7 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -22,7 +22,7 @@
 #include "qemu/timer.h"
 #include "hw/arm/omap.h"
 #include "hw/core/irq.h"
-#include "hw/arm/soc_dma.h"
+#include "hw/dma/soc_dma.h"
 #include "system/physmem.h"
 
 struct omap_dma_channel_s {
diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index ff890149ee..4feb22e6ea 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -22,7 +22,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "system/physmem.h"
-#include "hw/arm/soc_dma.h"
+#include "hw/dma/soc_dma.h"
 
 static void transfer_mem2mem(struct soc_dma_ch_s *ch)
 {
diff --git a/include/hw/arm/soc_dma.h b/include/hw/dma/soc_dma.h
similarity index 100%
rename from include/hw/arm/soc_dma.h
rename to include/hw/dma/soc_dma.h
-- 
2.43.0


