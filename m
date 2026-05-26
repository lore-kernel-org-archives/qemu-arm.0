Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077B6CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 20:39:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRyXU-0000tz-62; Tue, 26 May 2026 16:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyXL-0000kI-Mx
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyXJ-0007Av-9i
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so80670325e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 13:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779827880; x=1780432680; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVB05P7puZs3LFLDZbqNcDYns16Vx3D3vfqn0WFuQ6U=;
 b=oYxdaNJzvBCFlJe2awLzgd6KPZ6Fh6gk+Wut6xXjpRWDSUEhhOLqEjVyD6f3gsxTNW
 oruISzh4JCH8ns3wBQ7pJ13RQOd+ogA44mbPhqz9lswVsm81ZIVkQI3r2x2enttSNuQQ
 6o+gieTjlmCGuAnHvRWnn49XS2X13NegDLdHAm8KGx3N2pET7yUKyhLDofv2vfp1G5kL
 LOwO6i88rRmMC8BYH6+eCKcf1XlXWsc/4JWE73+Y+0cP3Y+K2rcOuTX5plLqWefXX5Yn
 OWFltkjbjrCvYiRvEUGUiiRa21H4yRCay2eAkHAyFLAO+3Im2L7YH7ezycgYbItQ1IqI
 Phcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779827880; x=1780432680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aVB05P7puZs3LFLDZbqNcDYns16Vx3D3vfqn0WFuQ6U=;
 b=tRYVanlWcaNoRavJf5aWrlkwswMeDrr25PEwzIRxLVGyiEtrzesNVIbCjQidSgOa4q
 buv80IM+xPjraOBjM8OoKuX5SW14hsABPZm/i29swpzFKTEXCEUfk5joL83XPbb1lynh
 S7tsgOZIayCE9vleqviyVU0p9DOify5/CM5AKVErf0JYM3iTIAv2nRjMyGdhRSNzfRnE
 3X7IGnxYyc3Uyr15FmtlxdniHW7ikqRufnzNWbf8KGYZL7ibHqU8WZH00VsrvlMYPUl7
 fht/9u1/xvaH6CbDWjX833XQmp4Q6CuUUl+ExCTRt1fLuvqISvLqTdfBWTRC5aXXp+r6
 LBVw==
X-Gm-Message-State: AOJu0YzEGVvB2saEfJtyjyCIBThljdt+IbZyUTfd4s3/gze1piiH7gmf
 Fu7zE7k/UcLpSsMaylfomMfAu6VpEayi+I/wihVpA6oIjkckJclGNraG7enzkaRVMkGtAfiHLSL
 AP9gVaqHMSw==
X-Gm-Gg: Acq92OF2jsZo/bgZUn2EqNpM17363E3vULYULT3K2lZEKlt5R2CmDLu/XJ5pwZcl5gI
 AIRWeqTEdYVPNL9coWDBmlLrMbyTQZBwYqwC8YyqN38FLyivm7s6VAy26fU/6lsFeJ3rjJIPTDE
 QwrSj52AKaXbw0lG0uRYc04v4F4Tq0j2FHPzY7zq4gCfaXCyDX99aIrwvIraTadTWvRyK7e+Xwv
 +GZfb94atqM7uN1jmg3VUibhJnNvQ1aSUTwikKI0IuLOUMJPwRM5nOLAbV4Rrf2WtMhK+4KLacw
 a31O9fF8QOT9SuOBL87yzN+k8GgixWzTYG7V+gkvx8PSCYLDJj8XBa9woAqlthJpFuYA1fUXUbo
 bwmJ4qAUNjfzE28NQS4VoMWx4iy7+AKnDnISWaD4HL5zDZbUZKI1M9arzhPnMfhCSSHSVduA1TK
 TwM7sLhQk8OE1SpnI2CKHHfGP8LXnw7k0Tb1csReak3N/3BBP8A/8NSV7Jtj7BjvvzUw==
X-Received: by 2002:a05:600c:8599:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-490424acb4cmr269218925e9.8.1779827879962; 
 Tue, 26 May 2026 13:37:59 -0700 (PDT)
Received: from m17.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490809c785asm1379765e9.32.2026.05.26.13.37.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 May 2026 13:37:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 05/17] hw/arm/meson: Remove now unused arm_ss[] source set
Date: Tue, 26 May 2026 22:37:10 +0200
Message-ID: <20260526203722.79463-6-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526203722.79463-1-philmd@linaro.org>
References: <20260526203722.79463-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 22e8ad924a2..8f66a80e10e 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,4 +1,3 @@
-arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_common_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_common_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
@@ -111,5 +110,4 @@ arm_common_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 
 arm_common_ss.add(files('boot.c'))
 
-hw_arch += {'arm': arm_ss}
 hw_common_arch += {'arm': arm_common_ss}
-- 
2.53.0


