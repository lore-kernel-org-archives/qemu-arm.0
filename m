Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25FDCD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:04:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXyl-00007i-1S; Fri, 22 May 2026 18:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxo-0007ka-UI
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxl-0008Dp-Cm
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-36a8ee1e28cso467163a91.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487404; x=1780092204; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eX9nT6P6ieYs1JPdLRJX+B2w+q8WWuzFbgrsBLUu95o=;
 b=M5/fxxyRbGkepskaeAjAMmLKnHINrNTelLH0SPLez83EPyockyTkLJpr+2U3ILOt6Q
 iVX/ajBblg3uSvTBnKoDjMuXyGaiummgZSnrwxlQOH0AsLF9SKz0smM78hMF+NHYjEyB
 GQBAWmPIfSqZ3CnckfeL+jgiPyUQZFMpYIKew2bcxT9fHmg/aH6riUiOhZtDJmxOuMoB
 pVSFDUNqFoAnMWkqdmiHh4QEwd+scO9GCUpNgHdxc5bIYNNaRt/Qjn33nGhEthuf5m6x
 sqM/wWtoxJfY6sX/rtdERzM+7/msN4fzqOc6PP+eWCAwYUJ4MZSs3sqT1gakEPnUSp6D
 ohgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487404; x=1780092204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eX9nT6P6ieYs1JPdLRJX+B2w+q8WWuzFbgrsBLUu95o=;
 b=W/oeJwyLZyfBKaMoemhdLAcWOymsOC8xg2Ki4beSXTts3tiv/XzrFCdgU3G/9fSfG4
 3o5IFXtcjDdJIYqBVs/AkOEXeW96DXHV8M6Ki5P/6kbTGWap2Qw47MPvxXCuIMY7b7HL
 F1M31JByMlY2wp1yXNpi/v2LBCb+60lEA0DDVq+Po8V+AOJYpIqUBcieeZTAoaZIlx6a
 zLX2Yd+4h1BzdS8OQdypDKZN2h5x3lZ2icZvR6CdOfYNsFM8e78ikioDtqKYgx6jwfNJ
 tlfv0B6EqpmdBhOE48wTZIXjwrDxj//GmCAVjwaN+amKjO+ScUUaZnNTgIV8rca/ZIMn
 hUJg==
X-Gm-Message-State: AOJu0YwMQf8ti9IHFiPZ9/tyazzEQerJt6YUWL3cY4JDNt3Jmq4YSGZI
 oT8VgEkQD8sLTvWwViDbl2QCHvYQ6RTp042/UzOFm/Am7SJasAioS+8MD2XDNEw4P2VOUavzi5V
 e6mp+
X-Gm-Gg: Acq92OE/8XBa5xU9DKm9MMC9Fl91xW1ibRjIezxBtBL4PTYRuroeoc+J96XQARD0E+A
 Ssbpx0UIzoawyKE3v1pHZLo7rK8CqZDAEEpbOCWaWPD4u5oDjOlj1modAQHGJBk5m1mJqAgisXh
 m1TxZSSgwWDoyEvMLdIAlPgfi/qJvfmbLPRySsvIW6E4n5LTByQEFEBFlKFpNBtWUs7YxRGNzY8
 958HZ407lSKCBzRcCnRH2tTSCsCLC2OxcandJAKk6o2i9p5xjSkzJ/IoysTYxqI6VSUrA8mJY+U
 WX/qgH2s4lVzI+mk6CvFAnCqwZQEQ9kH40KOsfttVSEIIl5CRsGAMW1BoV17Sy5vX62c/7Jtb19
 FcDZM8mNSGNDGR8fxNdNfqYC6lqYmbJ0T66Y2mee+VE3BAhrxa0A623UOsWQWBZubk04oLB6RRe
 2dh8fdsVG1NkZ7paPxrU1zbpvRnk4lroNpCBvXG3oZ3WMlGSd2yA==
X-Received: by 2002:a17:90b:564f:b0:368:ed92:6f3 with SMTP id
 98e67ed59e1d1-36a677ce506mr4642084a91.18.1779487403930; 
 Fri, 22 May 2026 15:03:23 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 15/64] target/arm: Dump FPMR when present
Date: Fri, 22 May 2026 15:02:17 -0700
Message-ID: <20260522220306.235200-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 84b2cc70e2..facd4def38 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -972,8 +972,12 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, "    FPU disabled\n");
         return;
     }
-    qemu_fprintf(f, "     FPCR=%08x FPSR=%08x\n",
+    qemu_fprintf(f, "     FPCR=%08x FPSR=%08x",
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
+    if (cpu_isar_feature(aa64_fpmr, cpu)) {
+        qemu_fprintf(f, " FPMR=0x%" PRIx64, env->vfp.fpmr);
+    }
+    qemu_fprintf(f, "\n");
 
     if (cpu_isar_feature(aa64_sme, cpu) && FIELD_EX64(env->svcr, SVCR, SM)) {
         sve = sme_exception_el(env, el) == 0;
-- 
2.43.0


