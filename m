Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A99C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 22:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZGV1-0001Zw-D8; Tue, 08 Jul 2025 18:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGFh-0000Ev-Oy
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:53:25 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGFf-0003Gy-Nz
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:53:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-454ac069223so2013385e9.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752011602; x=1752616402; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2TPssIGpA26FxAQRYqaDNvET5x0SuwepHaZsGlb/dBw=;
 b=R5tmyu6jw0k7bmpGfapDkjnao/mxUO/aF+36losbOSb9p/7ZaAgQNSwXOMz/o56iyB
 uorfAyzIu72/GCPah90ae9KT6Doc2DPPFcpgTsWvqI0BqunlS9jxt9byHSZxOHJQfity
 CtIuQwiCQMcQP+F647uPvjCIgusokqOpL0JM77xnHWkbCUayiCOVim+U5ig2JUpByLWH
 ZWhsKdIv/jUFjyriWRYRbfKzWJaD8H48Ecv9h73ix/f8wG+I5TkVIxU1LFCzYZirZoaM
 RZcKk4apAHQT2/AZ+FBNuRWocss4TDGBAXXMzD/O3efT9NcaMvqqCgQthGUTU1bjNZUS
 5zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752011602; x=1752616402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2TPssIGpA26FxAQRYqaDNvET5x0SuwepHaZsGlb/dBw=;
 b=akF/AiWRBBB2ZzdRTo85L72Wal1igemCcQbtfJIqe6UsTx/Qtt/qa3Ru8xpQpkdHFH
 JaoxnrCDMgM4OVZyVhnxsiNpyE0Ch81J0YRtQeL8/xjssrhD5rGsq0/iiKCJVFR0IDqw
 ppK9b5u2OtE4MFIqrPBMnofKdlze/No63gXwHBI1S1BCSnU0dyb0Uj6Nzkvvjol7xhJ7
 tY9XhsgoY4rI9sM3VxLRldsjz5CqrxTwoleGNBzsoPSP1h8+YHe0DOxtwrU0pjzuZ7Mk
 6KkV7GOqq/4qTlW0e1Yy8cD7JnlZXPDNUKKX341utvg2slE6T1ZXhRQeaSoHHJVn34fF
 0Hng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzC52VmIKMa30YopmZVbpovMLROdVhsLaG6pA8mobW/Z4Fc+MbbSjlClI8Keo+5i0vR5jEvRy3BQ==@nongnu.org
X-Gm-Message-State: AOJu0YxjBv4bmkU6J8imZqjrL3eKvc4XDpfXLz4fV74dwbwO78MxszBE
 NIRaP5WrUboCBfm9xwqamgLW1oCpacs/6An9blPCo9cMdpFosdKLrktC8rch0hQFWQ8=
X-Gm-Gg: ASbGnct596SlOfYA8EUGSwmGbidrPJROFVwmy9ntCpwJktG2dqKVZmhFzhzKEmMcddm
 IW7YklB0ifCouTM2pEyijU0YaIa1t8A8A8yDIh06g5lao7TPnIVa4D4LSfbH0EJMOMf8YXAqc9G
 8hZaMhWqrB7HBZsByvttyguPevyzT+nZOFrAPm2UM2TWHhSg55+n51C/NHtrqNPGaBaA+vUVVgW
 crg4a8kvySnVHabb6ku1hLhjaJdPc6Nd0lw1Z33BGpPk95KJWNNkx8Hml8FDWWQGTrm3Vj+HfLU
 3yJG6wPhFZwNeDmnHxwZt9E056KhzafwHN9deVKtq6D1NCiwq4aybiVVNIO9FLPAwbR3kohAEzk
 zXGUupDOVtEvv3f+2DCcZOVpbFImiP2iVf/SDxoUfyw==
X-Google-Smtp-Source: AGHT+IEjdelwxQhXd1I8ToSkdR3VaKppylpa+rOXe44mXLwPksCz4NJzqKAhZkGCFwJ9WJROVEjuHg==
X-Received: by 2002:a05:6000:4805:b0:3a4:f7e7:3630 with SMTP id
 ffacd0b85a97d-3b5de113fd1mr3777892f8f.15.1752011602076; 
 Tue, 08 Jul 2025 14:53:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285c919sm14074983f8f.92.2025.07.08.14.53.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 14:53:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 RESEND v8 0/8] target-info: Add more API for VirtIO
 cleanups
Date: Tue,  8 Jul 2025 23:53:11 +0200
Message-ID: <20250708215320.70426-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Missing review: #6 (gdbstub)

Since v7:
- Fixed e.g. typo
- Keep "do *not* use target_big_endian()" warning
- Do not use tswap() in gdbstub

Since v6:
- Added R-b tags
- Fixed typos
- Dropped "Introduce target_base_arch()" because unused so far
- Dropped unrelated patches

Philippe Mathieu-Daudé (8):
  target/qmp: Use target_cpu_type()
  qemu/target-info: Factor target_arch() out
  qemu/target-info: Add %target_arch field to TargetInfo
  qemu/target-info: Add target_endian_mode()
  qemu: Convert target_words_bigendian() to TargetInfo API
  gdbstub/helpers: Replace TARGET_BIG_ENDIAN -> target_big_endian()
  qemu: Declare all load/store helper in 'qemu/bswap.h'
  hw/virtio: Build various files once

 include/exec/tswap.h                  | 83 +--------------------------
 include/gdbstub/helpers.h             | 48 ++++++++++------
 include/qemu/bswap.h                  | 73 +++++++++++++++++++++++
 include/qemu/target-info-impl.h       |  6 +-
 include/qemu/target-info-qapi.h       | 29 ++++++++++
 include/qemu/target-info.h            | 14 ++++-
 include/system/memory.h               |  1 -
 include/user/abitypes.h               |  1 -
 target/ppc/mmu-hash64.h               |  2 -
 cpu-target.c                          |  7 ---
 hw/acpi/bios-linker-loader.c          |  2 -
 hw/arm/allwinner-r40.c                |  1 -
 hw/arm/boot.c                         |  2 +
 hw/arm/npcm7xx.c                      |  2 +-
 hw/block/hd-geometry.c                |  1 -
 hw/char/riscv_htif.c                  |  1 -
 hw/core/cpu-system.c                  |  2 +-
 hw/core/machine-qmp-cmds.c            |  8 +--
 hw/cxl/cxl-events.c                   |  2 -
 hw/display/artist.c                   |  1 +
 hw/display/ati.c                      |  1 +
 hw/display/vga.c                      |  2 +-
 hw/net/can/ctucan_core.c              |  1 -
 hw/net/lan9118.c                      |  1 +
 hw/net/rtl8139.c                      |  1 +
 hw/net/vmxnet3.c                      |  1 -
 hw/pci-host/gt64120.c                 |  1 +
 hw/pci-host/pnv_phb3.c                |  1 +
 hw/pci-host/pnv_phb4.c                |  1 +
 hw/pci-host/ppce500.c                 |  1 -
 hw/pci-host/sh_pci.c                  |  1 -
 hw/s390x/s390-pci-inst.c              |  1 +
 hw/sensor/lsm303dlhc_mag.c            |  1 -
 hw/smbios/smbios.c                    |  1 +
 hw/vfio/migration-multifd.c           |  1 -
 hw/virtio/virtio-config-io.c          |  1 -
 hw/virtio/virtio-pci.c                |  1 +
 hw/virtio/virtio.c                    |  2 +-
 hw/vmapple/virtio-blk.c               |  1 -
 system/memory.c                       |  1 +
 system/qtest.c                        |  1 +
 target-info-stub.c                    |  2 +
 target-info.c                         | 23 ++++++++
 target/arm/arm-qmp-cmds.c             |  3 +-
 target/arm/cpu.c                      |  1 -
 target/i386/tcg/system/excp_helper.c  |  1 -
 target/i386/xsave_helper.c            |  1 -
 target/loongarch/loongarch-qmp-cmds.c |  3 +-
 target/mips/system/mips-qmp-cmds.c    |  3 +-
 target/riscv/vector_helper.c          |  1 -
 tests/tcg/plugins/mem.c               |  1 +
 hw/block/meson.build                  |  6 +-
 hw/virtio/meson.build                 | 20 ++++---
 53 files changed, 218 insertions(+), 156 deletions(-)
 create mode 100644 include/qemu/target-info-qapi.h

-- 
2.49.0


