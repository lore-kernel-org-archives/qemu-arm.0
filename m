Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89EFF436BB
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 16:45:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDmID-0003QI-2c; Fri, 17 Apr 2026 12:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmI2-0003NL-RY
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:34 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmI1-0004rt-7T
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4887fd35e60so5847765e9.2
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776444211; x=1777049011; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEJIxMfFA7t/v3vI4nCMmg8KNvTmqFUhyW5+C81my/8=;
 b=k+9SaIuBYqdBYx7SbXPgUvgAkB9LjnvX8MAQ8xyx0Qv3oiNv3lozFhqNGZxDMDIoad
 F9W5PdPjxZ5HYtdp0yjoxO1MsFKgSyH3mR4871lZ5DraGgJ8kqFFqVgZfDsgPlPRAAn8
 RqovLjxu2u0OAcPUVSgWnSq3tWDEut6xnrcioneqbUQv89OXEHKP6hqeh7ARdS3nVfY5
 x+Dhw9TpdoI04MRhXW3lJSDL6KTiVte0HUdWcqhr0jmg7bPH5cQ/0Uv2jE45/XixDxO6
 YCEu0Vk8XROWvDRgdBgHKRoU3EAlpbV0/jrRPAAfBokk4JzlgmnbDlraAkBqm1fZaL3V
 XbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776444211; x=1777049011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pEJIxMfFA7t/v3vI4nCMmg8KNvTmqFUhyW5+C81my/8=;
 b=n3b57xe4L/4bEfSmgJYoeFXh+91fW7dknto4JrK2vMElBpGMtvaZdCwPN4XchbygWQ
 LgRaadjLZ3YGUXp/yIcgS+yg7kC8J4wC3nAw/EVivOZ3iW9rM22AzPjCZDS7vq6P6z15
 Nsio4INLdGRVw1FrhTPLKR1u510LtFSY5aLdpts8MRfXP6HdBaTn+IXx1RGjMgmVwGKr
 /irObOG9UbuXyps9EJ5czpSiEEYvE5NefgBTNfZxCXCY144R/YdRyo5iZ0NI5vb5tH/J
 B9nA9GYrdSlJp/l/hBL4eJDPjggaD2Ci1zbCVfYEKy0apNHDMw/JTEdFeRiAETVAyZ1U
 LEGg==
X-Gm-Message-State: AOJu0Yy1KKuXZlKtHtoSnqphd31+8Nry0RJVIvCAOBo/22NnuYyHFFZ7
 H4CF32496r3pAxUkSwZi13sRg6SZ/tOtr0ILxB3MQc4cmDoDiTLWN/V35/KBjQnrk/w=
X-Gm-Gg: AeBDietyFfk2lz2mHCDD4mQzzAZXf9Aq0fdkOFwyU3CSAOfo3mfyz2CWjqZ1XjaEFHW
 XZc36qFIjDxbbjGqtDwl51BEEPoiYNZ6oObnvnLC7IctjsG26IIeCi0g/DeUvz66/ryAjbxz5lp
 WeOXmWiNXMcn49Pt1EFB+BdE3H0ZLFOeIcSlFaPAy2NK/GTHULagAkvGMW7WQLzpfLUAOpCj9zl
 //WxOpQeAO1JUBCsJmx12oit8JkCFP58E7XpOgCUv2xBiwIWxj2QCfvu4Z6eQOBTtoEYEh1UPed
 TRI5Q12Gulp54j8YlkEp4Gajwf4foMnEju/xVPRfETfRx71EQCO25ArcOSGrxFRbSD9rqtqTphe
 nsVvdqOxB78vxDZ7eoaVSHCSn3EmhGP4MselM1zTRbmdNkU3Qn+SYxmyl/8D/7NERTUTmz8ILa3
 D0jzBeXB7MrBx37NCBI5S6m1AwdsS1Evy2vg==
X-Received: by 2002:a05:600d:8451:b0:487:20ee:bef6 with SMTP id
 5b1f17b1804b1-488fb745684mr44735925e9.11.1776444211560; 
 Fri, 17 Apr 2026 09:43:31 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1070bfsm58149815e9.7.2026.04.17.09.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 09:43:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A02705F9CD;
 Fri, 17 Apr 2026 17:43:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/7] tests/tcg: convert aarch64 feat-xs test to use helpers
Date: Fri, 17 Apr 2026 17:43:22 +0100
Message-ID: <20260417164328.1009132-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260417164328.1009132-1-alex.bennee@linaro.org>
References: <20260417164328.1009132-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/feat-xs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/aarch64/system/feat-xs.c b/tests/tcg/aarch64/system/feat-xs.c
index f310fc837e0..e2324cef1af 100644
--- a/tests/tcg/aarch64/system/feat-xs.c
+++ b/tests/tcg/aarch64/system/feat-xs.c
@@ -8,12 +8,12 @@
 
 #include <minilib.h>
 #include <stdint.h>
+#include "sysregs.h"
 
 int main(void)
 {
-    uint64_t isar1;
+    uint64_t isar1 = read_sysreg(id_aa64isar1_el1);
 
-    asm volatile ("mrs %0, id_aa64isar1_el1" : "=r"(isar1));
     if (((isar1 >> 56) & 0xf) < 1) {
         ml_printf("FEAT_XS not supported by CPU");
         return 1;
-- 
2.47.3


