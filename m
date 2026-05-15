Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AC3CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:11:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtFV-0005JE-RG; Fri, 15 May 2026 10:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtFR-0005IW-UA
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:10:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtFP-0003Wb-TF
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:10:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso106321135e9.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854235; x=1779459035; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HjG9jXk9Y7xF/r7rXvbclYL1C1gwLdDpnd1wum19lhM=;
 b=zv+5ymd5OJ/MhJSeYoIUvL4q7wfpns667zl/Bnw23JK790uu8XCvcKKyeDGPcHZ5xN
 yzJv28akj5KiuWbRBUaibiPZ8Sc0zMCaoGJ1kL/q9NDD5/KDurf4up9ypBkDooJSsgtW
 mXXkl5Y4W2epMah/ic08vFDqLK9Cnrcc836jwxk7PbN2GrJuhG55Zwep5zcgRFpjPTVV
 QRY95K82Aa0rRZU8XO/23H6O+0JTUFochl6wpqS18I90p6TxM0tm0dgeup6B5V03dEBB
 rs/8SxOBKUe7Rzct7oPepzOElEM2F/DwHvx5eBuCeh9HyBgeVdM73iuFRaCwFqpOS+A0
 gkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854235; x=1779459035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjG9jXk9Y7xF/r7rXvbclYL1C1gwLdDpnd1wum19lhM=;
 b=CSJFzE1mWAXnE66DPGDQieqpvHSD7IaUtZIkzyA+lHL1T3h8yPXBTMR40ZFBCCi6/3
 WYcLWPYv0jnXIUz81Lc726d4ldLX0BYGq5qc+1vUgrz2OX0Sj4jv3hUj6CDlSND4l8+n
 XUOgdLzLP6i7al8bjBB2aX3s/cFc4oKE54eejWdcalsVK1m7egr74Vp0UcCV97GtqRor
 FQMk1c2CcjZARA4Bp7BG6smJENzI17EMOFO6CxWD4REodhQi1aFf2BCyGNlLuUcI1AyS
 RSlu84ydX086RSEdLusqzQbSVX1WTbXzzEaZxq3BT1JmIaWWQ74zDWLZdDl7rvXufGAT
 TOHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9yyJ8NFjPLW6v8ZRnJIb2oQy/KPdGmJKZOdFL2BXj4npXeV25DHyZkZxzyCtfCw0yrYf4gAUlNA==@nongnu.org
X-Gm-Message-State: AOJu0YwRvcvbJEWYy4U/oZPNIvCgHo2OOa0qRvvYcWT454h+wKLaZoqg
 V71Ng2y3EHZO6HKxjv3OgToNO3iC/pVHGU+J66Dld58jFAWSi8yekFwQVzxhBQYX990=
X-Gm-Gg: Acq92OGTWYrR5mxqi72rQPG2evCnPzZXxGNn8goFPypCbbJb44i/cbF68ViMCxSRT5J
 i/Ucspa/HbR0G3yzKE0EtdRuWdZcO2kF015OCjHfqA6z7d64IuXhlw7m04dSFNPjAY3UHVtTJo8
 o2Qf6qvuTWQtD+iL0zjj2FHzSn2ATFxi1znb1UUj3SqfDhRsKLJWJ9zE4Lr9ejI3Wt7zcJSs34o
 76TOt9uAExIwbeRnzVrJEJUAhPbg7rKBkUhy+6d4Q9Po4NZrwW3tYi9DPcxLLjwrIPOTR2Hh8IE
 1WTJqLp+YilrgSoafJ2e/HIb+qyANBaVBb4vN9AfH/Y2PmiW/CvuTnw4qA7fKkwuH9ak8X1lGNW
 iv/0IJjcNBf0upvJElkinrq7A6gfE7P/saoFBRSaYwclrfas9QOiRla7fPsw+sAn+mdlexm+OQS
 nYom4ysgPgTNnuq5Nm4FrDujLpsyMI8seKq6O32t+qBTMQJd9DEiGbosrMCvkVasaqt54s0aVQ
X-Received: by 2002:a05:600c:4692:b0:483:7903:c3b1 with SMTP id
 5b1f17b1804b1-48fe6325978mr60010255e9.20.1778854235339; 
 Fri, 15 May 2026 07:10:35 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53804aesm60695385e9.15.2026.05.15.07.10.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:10:34 -0700 (PDT)
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
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 00/20] single-binary: Make hw/arm/ common
Date: Fri, 15 May 2026 16:10:11 +0200
Message-ID: <20260515141032.3271-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Since v5:
- Unify 'max' CPU type (rth, pm215)

Since v4:
- Add DEFINE_MACHINE_WITH_INTERFACES (Zoltan)
- Use GPtrArray for get_valid_cpu_type (Richard)
- Define InterfaceInfo[] arrays (Richard)
- Collect R-b tags

Since v3:
- QAPI structure renamed as QemuTargetInfo
- MachineClass::get_valid_cpu_types() runtime
- target_aarch64() checking SysEmuTarget value
- Remove CONFIG_TCG #ifdef'ry in hw/arm/

Since v2:
- More comments from Pierrick addressed
- Use GList to register valid CPUs list
- Remove all TARGET_AARCH64 uses in hw/arm/

Since v1:
- Dropped unrelated / irrelevant patches
- Addressed Pierrick comments
- Added R-b tag
- Only considering machines, not CPUs.

Available here, based on my pending patch queue:
https://gitlab.com/philmd/qemu/-/tags/single-binary-hw-arm-rfc-v5

Philippe Mathieu-Daudé (20):
  hw/arm: Build ARM/HVF GICv3 stub once
  hw/arm/raspi: Initialize 64-bit CPU types during DeviceRealize()
  hw/arm/raspi: Build objects once
  hw/arm/aspeed: Initialize 64-bit CPU types during DeviceRealize()
  hw/arm/aspeed: Build objects once
  hw/arm/meson: Remove now unused arm_ss[] source set
  target/arm: Introduce common system/user meson source set
  target/arm: Build gdbstub64.o as common object
  target/arm: Build cpu64.o as common object
  target/arm: Restrict IDAU interface to TCG namespace
  target/arm: Rename Aarch64-specific methods
  target/arm: Extract common code related to 'max' CPU
  target/arm: Use make_ccsidr(LEGACY) in 32 bit 'max' CPU type
  target/arm: Implement DBGDEVID* registers in max AArch32 CPU
  target/arm: Only set %kvm_target when KVM is enabled
  target/arm: Factor aarch64_aa32_a57_init() out
  target/arm: Re-use common aarch64_aa32_a57_init() helper
  target/arm: Define 'max' CPU type in cpu-max.c
  target/arm: Build cpu32-system.o as common object
  target/arm: Build cpu-max.c once

 include/hw/arm/armv7m.h                    |   2 +-
 include/hw/misc/tz-msc.h                   |   2 +-
 target/arm/internals.h                     |  10 +-
 target/arm/{ => tcg}/idau.h                |   4 +-
 hw/arm/armv7m.c                            |   2 +-
 hw/arm/aspeed_ast27x0.c                    |   7 +-
 hw/arm/bcm2836.c                           |  14 +-
 hw/arm/raspi.c                             |   4 -
 target/arm/cpu-max.c                       | 241 +++++++++++++++++++++
 target/arm/cpu.c                           |  10 +-
 target/arm/cpu32-stubs.c                   |   8 +-
 target/arm/cpu64.c                         |  92 +-------
 target/arm/ptw.c                           |   2 +-
 target/arm/tcg/cpu-v7m.c                   |  11 +
 target/arm/tcg/{cpu32.c => cpu32-system.c} | 191 +---------------
 target/arm/tcg/stubs32.c                   |  10 +
 hw/arm/meson.build                         |  15 +-
 hw/intc/meson.build                        |   2 +-
 target/arm/meson.build                     |  26 ++-
 target/arm/tcg/meson.build                 |  60 ++---
 20 files changed, 349 insertions(+), 364 deletions(-)
 rename target/arm/{ => tcg}/idau.h (97%)
 create mode 100644 target/arm/cpu-max.c
 rename target/arm/tcg/{cpu32.c => cpu32-system.c} (80%)

-- 
2.53.0


