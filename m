Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5E9CD4F5B
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLhq-0007nZ-6C; Tue, 19 May 2026 10:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLho-0007ms-8K
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLhl-0007dR-S7
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4585a116a4aso3003601f8f.3
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779201956; x=1779806756; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mjEY0DrBky3++IIp6Xm8/05zq+4Q//C1o6qyRCvDS9w=;
 b=n4B7/28gQjRfve2JG/uIbkagz47hC4L7Vjj/8D5Pbw2eYoLjMg0luaASCjxiCsoStk
 Df27xUY9Crpqn3Bni1FKVk62u0uU8ARsQzaL42Xp5Sota/WrbuoApJZp8HW4DwPDG1nk
 Yv2linC30/KxXN3IYP+UHpPf5A/lJn1HcElAUJflwrO1kYB6nh2JJDDaCNhujgKauMZs
 D12r9HaRQyg9QikfiykcqFFsNDP4UhjvWdmLwf7ly7n8RijRfmbNZxNtXU36QoeQKjUh
 1quYhpX+LF6LPknyN7PVkGjafg6Vha7P1HLVBXHquaMDvQIZxPcPGzj23N6Lz27qDuc2
 2IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779201956; x=1779806756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjEY0DrBky3++IIp6Xm8/05zq+4Q//C1o6qyRCvDS9w=;
 b=ECxzaFCzwtmnkqLmXuUz+hrzdupvrNYvutKYKV5LYv51SaVbODILHS7aF5JmmUwrl6
 opaBmkf2ctzSH34+NfOiiTezbhXJ7PqyrpfFsgGhJdqmkMF19TrE2mie6LKBaD87+14l
 MdHW+GhEDmXBiBLEdd4JlvPV3H4Y2yaPInrfjIu7BwsuUVPb0VTjoJVunUxacYBEd5q4
 yY0o7VeeEb5dXIFj/NBxiJKT6qks2bmTrMIdY8s5VvOCI3asgwr9slxbEUe//xNbXulp
 wb5aQVTei6plWq0c2tfvgI5Rob1r67IW2LennX0weJzKyh0Wlqbwmt5LcbD239/b1NJB
 6gFg==
X-Gm-Message-State: AOJu0Yx1IddfkuJWIgxM4iFMZPTtjOa6xz9lTE/uUYmpszy/UWNa7BWc
 hfNtp6nPYYFeJSPmiRz2D7RshhbNUmSgajkrk8lM2ujnAHfejVmTRCpbXK8hVjHy1Lc=
X-Gm-Gg: Acq92OEdZD9kGC0gqQOGzLrbuTheoZFULyAB66NZeHKP9F3SjmrfLYRaHsvjkuBoti5
 e23yrWOIH16ulCAQLzrmdieOzU0jaek/jaMhb5W75rDOHV/Ai72uTgA4mgKDRIvdsJom0+cS8cn
 TDFXOUOOOJNsNnVB4n9USpQmEwwm5Vdni+UaB7WgSz+BfdEtH68Q3Bk/+WwlWRzIlWmwPNqCBh5
 2cYdr56Snjypu5f6jlHGE2dV+zajZ+zZu93r2sh429BCqeiiPSf5cUWmCVcyPnM9DYEzQFkIINf
 Iy8NWkUf/ueDuc8Xed637yfseAsg6LbeRlquXH8SqtG31Wut/PrLn3La/W+qm1AHY2GRg+swSIH
 ZmA0U4BECGLuOM0qWfdPY4/M3E+ehkS7DIYkE167p/QK7As/R7nYuNTdH81zR5M4ULHH4/npMQ7
 DWCx4Uhzq2a0ZfM92iZCt7uwFl8K2uBfuwlFn4EYplY5RSiYswMYfp5AntiBRx4IM8ZTYbzw/J
X-Received: by 2002:a05:6000:1845:b0:43d:309b:9c4f with SMTP id
 ffacd0b85a97d-45e5c57d2fdmr32015944f8f.6.1779201955427; 
 Tue, 19 May 2026 07:45:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe13b4sm46621957f8f.28.2026.05.19.07.45.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:45:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 00/18] single-binary: Make hw/arm/ common
Date: Tue, 19 May 2026 16:45:35 +0200
Message-ID: <20260519144553.91483-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Series fully reviewed.

Since v7:
- Rebased on top of 8d3e31c0d57 (IDAU interface)

Since v6:
- Do not initialize Aspeed CPU in SoC realize (cdrx)

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

Matthew Penney (1):
  tests/qtest: fix discarded const qualifier warning

Philippe Mathieu-Daudé (17):
  hw/arm/raspi: Initialize 64-bit CPU types during DeviceRealize()
  hw/arm/raspi: Build objects once
  hw/arm/aspeed: Do not realize 64-bit CPU types under QTest
  hw/arm/aspeed: Build objects once
  hw/arm/meson: Remove now unused arm_ss[] source set
  target/arm: Introduce common system/user meson source set
  target/arm: Build gdbstub64.o as common object
  target/arm: Build cpu64.o as common object
  target/arm: Extract common code related to 'max' CPU
  target/arm: Use make_ccsidr(LEGACY) in 32 bit 'max' CPU type
  target/arm: Implement DBGDEVID* registers in max AArch32 CPU
  target/arm: Only set %kvm_target when KVM is enabled
  target/arm: Factor aarch64_aa32_a57_init() out
  target/arm: Re-use common aarch64_aa32_a57_init() helper
  target/arm: Define 'max' CPU type in cpu-max.c
  target/arm: Build cpu32-system.o as common object
  target/arm: Build cpu-max.c once

 target/arm/internals.h                     |   2 +
 hw/arm/aspeed_ast27x0.c                    |  14 ++
 hw/arm/bcm2836.c                           |  14 +-
 hw/arm/raspi.c                             |   4 -
 target/arm/cpu-max.c                       | 241 +++++++++++++++++++++
 target/arm/cpu64.c                         |  80 +------
 target/arm/tcg/{cpu32.c => cpu32-system.c} | 174 +--------------
 target/arm/tcg/stubs32.c                   |  10 +
 tests/qtest/libqtest.c                     |   2 +-
 hw/arm/meson.build                         |  15 +-
 target/arm/meson.build                     |  26 ++-
 target/arm/tcg/meson.build                 |  57 ++---
 12 files changed, 319 insertions(+), 320 deletions(-)
 create mode 100644 target/arm/cpu-max.c
 rename target/arm/tcg/{cpu32.c => cpu32-system.c} (81%)

-- 
2.53.0


