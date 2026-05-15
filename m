Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C5ECD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:12:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtG4-0005R5-4a; Fri, 15 May 2026 10:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtFy-0005QO-TI
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtFx-0003xR-5s
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:14 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso98626805e9.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854272; x=1779459072; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+U9wwPM1Xta3FX+ZaXH8IQr8ni1ssktAw0s7odT+ws=;
 b=lukLWVzGVMJxVuS+YTssa4GNWEX+OJfyD/85GN65301HIJGLj6oGyGVMuDRyF9d01G
 0Sp1031rZmu67EewpPKIQr0ZTgUH6S1OpEdcdeR209+O4M+C8EM0JScFwqwwsE6RPJpw
 IzBsHGmL/lnPGHkhFXWagWq+8UJW/i+OKXjJ4qqBodinf35x0hrS8bBbTVZc5+nvu5AT
 h2O/E2SxpQnzRu2bvUuxvSVf9/dL1kg7cmzO1HYp6cBkt4pRJ025bZntsGgWURX6WurF
 zek1cSCTZIykTLgvjn7Sc4C1cDz7Pg25Q6IJ3rHvDapmqU0Ov1/LaJH6rvtIQm36hb3s
 1VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854272; x=1779459072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R+U9wwPM1Xta3FX+ZaXH8IQr8ni1ssktAw0s7odT+ws=;
 b=gddAjn+iV35BOP7vmMZW0vlcrLjm/JV3To+aBw66KIY1qIDwVkrUHN/kiTEOzsIsGH
 UVNIHhIutw8qeCwxADTRDNGzlduI6gnA84WWyqSjQJJva6AekgYvJcho7y/LRVSNqKDT
 BxAkKx2QyjfxQxSXQXVK1etUqw26MlEdGwTdIn98v5X1k3hW3MmOtNqotskkzfBy//EA
 uQd8H0qBU5y2D8S67Z2fZrurE2jdg4oXr07Lgn4NgDQ3OArHM7CpzMqZ9CcM0UDhDa1p
 TWfYuZT3H3l/abLMJwIAdPgno6xa5WU/Qwujy6vnH4Xtt/taKKTHAeuICWftOgQ+zUBI
 Dv/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9lj2kDq5px2YseqZrSRCcjBCr5oE2qA++ChzT+y7+43IGU8Ca6TdDOmWJpyMgzFcMqWz+ubi9Itw==@nongnu.org
X-Gm-Message-State: AOJu0YwuOiQrqNR0O2QCvIGkH3YyfPRlrMzwmX9mQherrHbhLZjHrfys
 VogBoH5k8IEoyNn6KNGoLJrdWl3EDPNl3ab5Gt7j4kNbYu3hVn1wHENO+/1/fQNHHG0=
X-Gm-Gg: Acq92OF3Irp8Q4z5Sp5hj1SACvLF2RWh+h+H0E0ZaTNbHI8SDuHIx5WGQ9KlIR5lQr2
 DyR3h3o2mTyfjWog11sGiLL19w3tLfXcZ2Wkyz1iB4R/Y+qBVPl92A0/NamDH1WZ5CGLx1IiU6W
 D5YGLacV8xWf4ohMTQeMZJi5o5SGE7wALNPr1jHGcsue42Jh8Hif1slJ6NTYN12mWXzd9pyjcH1
 9a7S6jnb2mXyjd8KDq3vW/x57QUDyj4OJ2BinwpNyMH8F7vuaP0GlbuKRFuKuXoE9PbsTDC5C+Z
 4lRuyUn52WDi0eIwczMjHxGhIFFihX8J+/Kq3OXKDzeJIP5wUX7rlvYBtI2xou6zCFPFceeYi5Q
 MtjZo2iq7tFtSnEqngx0CQxGqcjtxOJ+eg1fBVXP62DcHRJTkKZEUIipW5msHFu/UOxC5KiCxbr
 ybypFv4+j1f+HgRARcO1wqefBw3Goup5JPD/+NkkmbVG4AgVb83iLgnCzr219MA6hZapOYCwxLW
 rdZIlkUPq0=
X-Received: by 2002:a05:600c:181c:b0:48f:d5b2:7c1a with SMTP id
 5b1f17b1804b1-48fe60eca66mr37497555e9.13.1778854271541; 
 Fri, 15 May 2026 07:11:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fead1c364sm16398215e9.8.2026.05.15.07.11.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:11:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 05/20] hw/arm/aspeed: Build objects once
Date: Fri, 15 May 2026 16:10:16 +0200
Message-ID: <20260515141032.3271-6-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Commit 064f1ce95fe ("hw/arm/aspeed: Split AST2700 EVB
machine into a separate source file for maintainability")
remove the last TARGET_AARCH64 use.

Now than Aspeed machines can be filtered when running a
qemu-system-arm or qemu-system-aarch64 binary, we can
compile the aspeed.c file once, moving it from arm_ss[]
source set to arm_common_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 144e4827660..7c3d66f4378 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -43,7 +43,7 @@ arm_common_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'x
 arm_common_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
-arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+arm_common_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed.c',
   'aspeed_soc_common.c',
   'aspeed_ast2400.c',
@@ -66,8 +66,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast2600_gb200nvl.c',
   'aspeed_ast2600_rainier.c',
   'aspeed_ast10x0.c',
-  'aspeed_ast10x0_evb.c'))
-arm_common_ss.add(when: ['CONFIG_ASPEED_SOC', 'TARGET_AARCH64'], if_true: files(
+  'aspeed_ast10x0_evb.c',
   'aspeed_ast1700.c',
   'aspeed_ast27x0.c',
   'aspeed_ast27x0_evb.c',
-- 
2.53.0


