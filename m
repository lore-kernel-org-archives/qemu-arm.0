Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B09A106ACEE
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 22:47:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0ooF-0002az-Fq; Thu, 12 Mar 2026 18:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w0ooE-0002aL-Bq
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 18:47:14 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w0ooC-0003Zr-9w
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 18:47:14 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-82976220e97so911457b3a.3
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773355631; x=1773960431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PFvmr/rrzoLHUjOFxspMh0UbKJXeRxAJ0yXljP/5wCg=;
 b=s9Fmy7oln6ve0b7r5FHR19LYB5J+flOt4uKyKDtV9hB4KfjHVM8Bs18nJpy+79uH31
 2cnC1Uo3Rf1JILqKFtgpdcx0LSXlZMZO32k7wQ/GaXy+f8n6B4dvAf7oTrg+g78uTJdR
 IwrBrmpF9RdlUWGpZf8sFrVaqQxytH8p5Gc7tpXLuKNYim2Z1mACq3ALSjrLGlUbjpsY
 cu0E8wanbzuwdFygql9gPgNvtxiYxcPjPEeLsnp5y5KbtiRG7O9HWXnhK2bwo/kSrISe
 Z3V0QTeMya6jwCgA2C8lFK+zxPrrS0JXzDZfexgKEIj+u3hbbW6YTSjXT9q9ELxDwWoc
 Gd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773355631; x=1773960431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PFvmr/rrzoLHUjOFxspMh0UbKJXeRxAJ0yXljP/5wCg=;
 b=dK2E9sF/CdcK+wLlT5d+WxUj1xYPycx9WrByQoF1qB0/9PQlERDLMdXIaC8ODYwXLV
 xf1B3SXRJ/q3yPkD03eGsLJ3MhhNh+tI/CfgMYwKx8MOUWoTdF62gqjM75iqopa5h0y6
 8pw7y2fj2IT3tZZgasT2sKZvvRR36+rQmJ5+7q4S55VdM+4deb0/fyqpyUNtN2LmWAJe
 kl1E2kFN9Y5/+xdY9WV0oglLLSzppcNAOlJ5CrwmJYMh2CV9UaGDTCyhaNhmaYUULZrv
 igSljMrGOuAVYzBPsYuWJvBt8iz9nIna/O3Zzlc9x+50LPivQsnNM2/GZQUTpm6L+ArZ
 cMlg==
X-Gm-Message-State: AOJu0YyxUWOg5uJe1gofaJJuuYXWpNFyKB46R9YnKFpyoZCIhw9aOB6l
 iuUP/kARjoO+dIida2BagEi7iAxWJslYYeXIDXoMdG3DS7PeRGcDzwz6qkWy9BwHkDU=
X-Gm-Gg: ATEYQzylE8uuWPEVNRDziqIX4pwb9ZXzJFPahiXiidbcC9Plu3BWbTxLutb+mEkFj3x
 gXsMJUjAOD3BisnwPust2kPMdqyU2TlOwc8qJAJQxeBdS5laOEIuU6tHK4kd1htbuRWodspi/pO
 n/K13L555QpchBnAVoS8kYh9Z0B7r0GTJkgCG0HtiFxU9G5znESIqI8bapZosfGtdKLKV4h1703
 B82vmRhJ9lwwHOdx7ybkJDxd7cTt76OxQaT3GjmQiVR2o7cTH6Ful21EhasyaWp6bRWbQrABoyh
 pypef81puJMiHvLMTPi2CJufa+PXmZyNQoaenikQ2myXPHLqxhrVYIintkJkMJvInvVR7aQ3Gc8
 aAjjcQHIyeTRXz5eA3d43MeeARc+i34IFVRleg+dL1aXYIBJ53W0mxEEqQq9VBPOoDCjUwLO2ah
 cBPDoVYvQfFmQbCXhAWT53BYBkT2/3HjhXqlAnZnoMH/7eU4xvjXE8HWMSRETlgYNaYHtW2PGnw
 v0A
X-Received: by 2002:a05:6a00:1992:b0:823:16b2:2498 with SMTP id
 d2e1a72fcca58-82a198ac1ffmr768489b3a.36.1773355630699; 
 Thu, 12 Mar 2026 15:47:10 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a0725be23sm3992698b3a.15.2026.03.12.15.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 15:47:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 philmd@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 2/2] hw/misc/allwinner-cpucfg.c: make compilation unit common
Date: Thu, 12 Mar 2026 15:47:02 -0700
Message-ID: <20260312224702.1608408-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312224702.1608408-1-pierrick.bouvier@linaro.org>
References: <20260312224702.1608408-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
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

include "target/arm/cpu.h" is needed because of:
bool target_aa64 = arm_feature(cpu_env(target_cpu), ARM_FEATURE_AARCH64);

This file is reused between various allwinner boards, including 32 and
64 bits cpus.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/misc/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 96b6705b7d0..392d30b1423 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -46,7 +46,7 @@ system_ss.add(when: 'CONFIG_ALLWINNER_SRAMC', if_true: files('allwinner-sramc.c'
 system_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true: files('allwinner-a10-ccm.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_A10_DRAMC', if_true: files('allwinner-a10-dramc.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-ccu.c'))
-specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-sysctrl.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sid.c'))
-- 
2.47.3


