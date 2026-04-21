Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC51F588C9
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:18:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Rx-0008Io-SR; Tue, 21 Apr 2026 01:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RE-0007xk-JB
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RA-0006Mf-On
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:19 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2b24fcc2b5dso24160005ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748453; x=1777353253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bB3Celgz6ONoUj0JAK8UxtldJtL9rndv5ruwK3rAIow=;
 b=JUNR62jvpAyaM6oxISq/E1DwYmDJ/vCVU22hcjJKyI4uK4Fg8Ydfla14X0WzjZaJu5
 R7HDEFX13jN0zXbOn52IxN6HmJHi78ZUui6/WxJGLQ2XxPDwtIXxbrSLrIjRzeVGv90o
 zVsRGuLGpHr+bu/d+tRiCdC8N4XITgcmVMxjgvmyy4t8Mf9Milh7393fnM6k7qQocSsN
 3simJIVzaIfaiD1Ickqxp6ZUKteS0gOTvc20no8ZpWqhgFObwDVX/hZI1BdakcNM0mX7
 bZ94s5GQJfDUYL4WqTYJcKpb/Bt/AVuXfvCB951JiG+z8ZF7qsna2z5+W1tbVqLrDRvW
 +jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748453; x=1777353253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bB3Celgz6ONoUj0JAK8UxtldJtL9rndv5ruwK3rAIow=;
 b=Y0QUpB2snMQv2ezXRIu6gOZzIOWgtScabDyQy28Jpg/nU4nd6tff7QQeDTIMTlVwji
 3QjyhaC8P9LDhTiPBALOxGyaKhBSYgEv6KFzT3uud8/LX2zl5QcjjJhoxuY2VinYQQUW
 fjI45jfOUdCWRGIc3jGwgU5gh5bch0If956EnuRPep8DHpW7Z3NlHye9PjMmDBA+dvEL
 UbFvFx2iJbwlZ45iggIThN/kGwuHeUK1HpzrZLy0PYm7iP1G9htY+5yJMH8dltcXfZu+
 tELHBv6QA2UFXThgOs+ah4zi6FatMZ4jRu8BSOgPFned4cR5Aqz34lMtDMHIENrhX9Sl
 8zGg==
X-Gm-Message-State: AOJu0YwMEQxD5h1zwZ1+Yi3eru7O59VgBrIOBngFbqNCTa2jk8VxDCKk
 HF1IWzxeu6yORS7eku8MaI8/Qx/iF8c800FSQG6MgATYWWaiWCiZ7ly+JaOZw7zw1zI=
X-Gm-Gg: AeBDiet2udkFQzAUhoyRH0IZHdAH836TfSig3IGn/Y6XQzUCSs+jWJhu9J/Z3DvM+MG
 7bKUhlHxhElN1wbZaYz0RjpbqH4dic1JWL4XOeqfdvB2BL2895ILxl5Sys1Qg3B/dmPa5+AgD1+
 m85ivOtdeZveAEwgcCSQFMybTe+JGkKMnrK2qfBWLgAxbAJF47OFTIqCfdr6dYmpf3U5Y+htO/v
 AdGMaCpuPbbxw/h7pjifjuV1gU0RdNdc24/vihOOEtIomra6aic25w1H680MWDrhFn/Qe0vR0UL
 xZ9zYPwmoMPQFbe7IN1TEodWfJhYBVmr8GJB3QIJb3Dz6wqg+IAqcxSZ0zkqC7Svp7ZgvSHiN1W
 ih1JqGr6cqTKMwSlZteGuxguBm3lKxiwX31vyAsy0G+9ePEBqP7exRWq1IEM1WA5jyOItXALaxB
 N/k1zkhjojI718Ag6qC3LEh5wVzS0j9P9edBBwG7Fg
X-Received: by 2002:a17:902:7003:b0:2b0:bed1:46f7 with SMTP id
 d9443c01a7336-2b5f9fdfb9bmr116830295ad.37.1776748453334; 
 Mon, 20 Apr 2026 22:14:13 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/37] target/arm: Update SCTLR bits for FEAT_FPMR
Date: Tue, 21 Apr 2026 15:13:18 +1000
Message-ID: <20260421051346.41106-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 38deea01bc..deab811ba4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1459,6 +1459,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
 #define SCTLR_CMOW    (1ULL << 32) /* FEAT_CMOW */
 #define SCTLR_MSCEN   (1ULL << 33) /* FEAT_MOPS */
+#define SCTLR_EnFPM   (1ULL << 34) /* FEAT_FPMR */
 #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
 #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
 #define SCTLR_ITFSB   (1ULL << 37) /* v8.5-MemTag */
-- 
2.43.0


