Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC85CCCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:40:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEDu1-0004z4-T8; Wed, 29 Oct 2025 17:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDu0-0004yu-CW
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:40:20 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDtt-0005Xm-Po
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:40:20 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso4251215e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774003; x=1762378803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uY7fmVdMvGJL7gcl8U60RZO8Bwcu1zFyXw5gGAJaj1Q=;
 b=lCn4hB2Tbom33fj2nA/GaTb0aXlFltdbB6kg2bIdPEH9IUuqmM1XXyJYvEnApuCHNC
 rJqgYv63cTAPj+1ft9OvSoPYMnNo1JZx3/9gFpE1DzBU84o0weC10YURMv758kJpol0z
 xr8/LqGkbZWIwq2Hr0maboOs4camVJnvFef1JlB9aEzZzIQeEMF5S5/uVZPT++jF5rh0
 h3bVEfxfCK3aCNVh49yKrafjZCrK83dUuLzlSsYAe3AqucgZ5zhqg2uQcuxqP7VY8t5h
 XpiPPocW41F0iuk1/BGnvZRNzUh/ApvJ4l5dOU2DvaMHfxRKMKyw9LE4XmRYwiDGcCma
 eB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774003; x=1762378803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uY7fmVdMvGJL7gcl8U60RZO8Bwcu1zFyXw5gGAJaj1Q=;
 b=FUN7Z0jqmLpP/F7cKzrXgTtDDn72aqgQ62Z76WCOdBX0rp5FTvar+tp36AK417Cl/F
 piHlt7VUsn3PdY5OqV8Rugcfz/yP3LVSRq+ueVPyYjm4t3nvFRuwoEHE2I+VU5VxZqzj
 9MPbjdNuyI9gQwbRmU92ewPst6h9QiPLj38sZQg7crZ82dq29qYIdDCpBB9OfIrZ+3sw
 Ugp0R5Jv8mAP/q2GWaZW4CFdfSD7RVSwJjANMv91LDruxuwh6sz3t/C/T/zn49Z3bFFe
 pgmARF2lo0D0svNnw2lNte+sJyh9PHM75R5m7kgC4XPp74MFi0p8E0jaLdUHrPim3QTd
 mKvw==
X-Gm-Message-State: AOJu0Ywn5hrkATqzbdIFt4sG62KReunZJInN+Y81ObxcK1c4PeLA53fp
 Jyi/lg4IlFVbgFiQiPksehsRrIMShI0X3j+UeXM5t+lHJvRHPWgDaHFRUZqyV4euTRHg0sLdVO4
 DNnwKRW0=
X-Gm-Gg: ASbGnctBFkzWOi10PxmGYhI09LZM54sQ37ubiCiUmBuisfJn0tOmWY/Jaqu2fh0D0Xy
 vIB4mnvapTgvDcMOk//pPtUsnFCmN6it9nP9hhintmgAsGmRHDzuuJj31cg37W6UETGqy5sYD9m
 Pl8pUwCNfxxcopLhgQSdZMXibbN7NNLSoYks6NZd1p9UzbArlPGx2EN0q9TYo13Gr1RLZrPWKRH
 3XxX8QQkg9co8ya5bEmEHhXfQWPSzP44QGp48ikqUxGNKz6s/p470FZzZXaHUmMoFCB3CS8ou9F
 kcAb/5gkJ2uJT9J9sKqCmuSPCIySEdeoZNC0OPxGcrLBuqLCwONYP4hifS8qqINp5Dg4L6KzbXs
 IrP24pxNK0ALEVL9if3/RVzX+Odxixn2RfCEJ3E3jqDrX7oQLiXmZ2WITPIo3VLljgJngObhic0
 qaHSXphOBWh/KExPkJBP4G0iC31UhCeFDSFGn5x3LA5kcFCkY+fw==
X-Google-Smtp-Source: AGHT+IHHNK2TL6G+Hc9lLw6pM9stiGxKghrY/g+yqrLmhhcTpCuh2ECR/39400mVfMfO5BllRIt+Gg==
X-Received: by 2002:a05:600c:1c81:b0:477:e66:4077 with SMTP id
 5b1f17b1804b1-4771e3fb258mr48680075e9.29.1761774003037; 
 Wed, 29 Oct 2025 14:40:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289adc18sm4198735e9.6.2025.10.29.14.40.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:40:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 00/23] Misc single binary patches for 2025-10-29
Date: Wed, 29 Oct 2025 22:39:37 +0100
Message-ID: <20251029214001.99824-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

The following changes since commit e090e0312dc9030d94e38e3d98a88718d3561e4e:

  Merge tag 'pull-trivial-patches' of https://gitlab.com/mjt0k/qemu into staging (2025-10-29 10:44:15 +0100)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/single-binary-20251029

for you to fetch changes up to e5c542fa16b0a7d47070692481db301736a0ac7b:

  hw/riscv: Replace target_ulong uses (2025-10-29 19:16:24 +0100)

----------------------------------------------------------------
Various patches related to single binary work:

- Make hw/arm/ common by adding a QOM type to machines to
  tag in which binary (32 or 64-bit) they can be used.
  Convert the Virt and SBSA-Ref machines.
- Build Xen files once

----------------------------------------------------------------

Anton Johansson (1):
  hw/riscv: Replace target_ulong uses

Philippe Mathieu-Daudé (22):
  hw/arm: Register TYPE_TARGET_ARM/AARCH64_MACHINE QOM interfaces
  hw/core: Allow ARM/Aarch64 binaries to use the 'none' machine
  hw/arm: Add DEFINE_MACHINE_ARM() / DEFINE_MACHINE_AARCH64() macros
  hw/arm: Filter machine types for qemu-system-arm/aarch64 binaries
  meson: Prepare to accept per-binary TargetInfo structure
    implementation
  config/target: Implement per-binary TargetInfo structure (ARM,
    AARCH64)
  hw/arm/virt: Register valid CPU types dynamically
  hw/arm/virt: Check accelerator availability at runtime
  qemu/target_info: Add target_arm() helper
  qemu/target_info: Add target_aarch64() helper
  qemu/target_info: Add target_base_arm() helper
  hw/arm/virt: Replace TARGET_AARCH64 -> target_aarch64()
  hw/arm/virt: Get default CPU type at runtime
  hw/arm/sbsa-ref: Include missing 'cpu.h' header
  hw/arm/sbsa-ref: Build only once
  hw/arm/virt-acpi-build: Include missing 'cpu.h' header
  hw/arm/virt-acpi-build: Build only once
  hw/arm/virt: Build only once
  hw/arm/meson: Move Xen files to arm_common_ss[]
  hw/xen: Use BITS_PER_BYTE & MAKE_64BIT_MASK() in req_size_bits()
  hw/xen: Replace target_ulong by agnostic target_long_bits()
  hw/xen: Build only once

 MAINTAINERS                       |  1 +
 meson.build                       | 10 ++++-
 include/hw/arm/machines-qom.h     | 46 +++++++++++++++++++
 include/qemu/target-info.h        | 21 +++++++++
 configs/targets/aarch64-softmmu.c | 26 +++++++++++
 configs/targets/arm-softmmu.c     | 26 +++++++++++
 hw/arm/aspeed.c                   | 27 ++++++++++-
 hw/arm/aspeed_ast27x0-fc.c        |  2 +
 hw/arm/b-l475e-iot01a.c           |  2 +
 hw/arm/bananapi_m2u.c             |  3 +-
 hw/arm/collie.c                   |  2 +
 hw/arm/cubieboard.c               |  3 +-
 hw/arm/digic_boards.c             |  3 +-
 hw/arm/exynos4_boards.c           |  3 ++
 hw/arm/fby35.c                    |  2 +
 hw/arm/highbank.c                 |  3 ++
 hw/arm/imx25_pdk.c                |  3 +-
 hw/arm/imx8mp-evk.c               |  4 +-
 hw/arm/integratorcp.c             |  3 +-
 hw/arm/kzm.c                      |  3 +-
 hw/arm/mcimx6ul-evk.c             |  4 +-
 hw/arm/mcimx7d-sabre.c            |  4 +-
 hw/arm/microbit.c                 |  2 +
 hw/arm/mps2-tz.c                  |  5 +++
 hw/arm/mps2.c                     |  5 +++
 hw/arm/mps3r.c                    |  2 +
 hw/arm/msf2-som.c                 |  3 +-
 hw/arm/musca.c                    |  3 ++
 hw/arm/musicpal.c                 |  3 +-
 hw/arm/netduino2.c                |  3 +-
 hw/arm/netduinoplus2.c            |  3 +-
 hw/arm/npcm7xx_boards.c           |  6 +++
 hw/arm/npcm8xx_boards.c           |  2 +
 hw/arm/olimex-stm32-h405.c        |  3 +-
 hw/arm/omap_sx1.c                 |  3 ++
 hw/arm/orangepi.c                 |  3 +-
 hw/arm/raspi.c                    |  6 +++
 hw/arm/raspi4b.c                  |  2 +
 hw/arm/realview.c                 |  5 +++
 hw/arm/sabrelite.c                |  3 +-
 hw/arm/sbsa-ref.c                 |  3 ++
 hw/arm/stellaris.c                |  3 ++
 hw/arm/stm32vldiscovery.c         |  3 +-
 hw/arm/versatilepb.c              |  3 ++
 hw/arm/vexpress.c                 |  3 ++
 hw/arm/virt-acpi-build.c          |  1 +
 hw/arm/virt.c                     | 74 ++++++++++++++++++-------------
 hw/arm/xilinx_zynq.c              |  2 +
 hw/arm/xlnx-versal-virt.c         |  3 ++
 hw/arm/xlnx-zcu102.c              |  2 +
 hw/core/null-machine.c            |  6 ++-
 hw/riscv/riscv-iommu.c            |  6 ++-
 hw/riscv/riscv_hart.c             |  2 +-
 hw/xen/xen-hvm-common.c           |  9 ++--
 target-info-qom.c                 | 24 ++++++++++
 target-info.c                     | 21 +++++++++
 target/arm/machine.c              | 18 ++++++++
 configs/targets/meson.build       |  5 +++
 hw/arm/meson.build                |  8 ++--
 hw/xen/meson.build                | 22 ++++-----
 60 files changed, 406 insertions(+), 75 deletions(-)
 create mode 100644 include/hw/arm/machines-qom.h
 create mode 100644 configs/targets/aarch64-softmmu.c
 create mode 100644 configs/targets/arm-softmmu.c
 create mode 100644 target-info-qom.c
 create mode 100644 configs/targets/meson.build

-- 
2.51.0


