Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3B0C83F0F
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 22:11:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZGV9-00029f-Vl; Tue, 08 Jul 2025 18:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGC5-0003Jc-88
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:49:42 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGC0-0002ty-Mf
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 17:49:39 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so32499745e9.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 14:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752011374; x=1752616174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2TPssIGpA26FxAQRYqaDNvET5x0SuwepHaZsGlb/dBw=;
 b=JLzY3OL1QHHf8V6O5czWUXG+866YXlOfYEnhPO8Jkw1P/eeyngMWER0GDyLyabKcCE
 1utfK6NDDf8q5/u4UGgx7LpkxEZsA1/JdNs1LWYR/TnCGLUsx12EfZ5zo9hDo7AQuOar
 FSXk1emS2DVBS6WbDVpHHMf8r2wCTHX9HQeh/CHuPZJVDTGivBUJV8MzfBV8Fa1jFQ2a
 B5AjIcD+IBWqzgjS8OJ5O065iPWBd1cKvqTnhJGs5GXTaSbIjQXUg2tJS/LlhN4bbMGy
 4dtxdvhxLbz+aPoFt3XeiSFxJKHMhEd49TIfg33ADTKmlMMfsk6iWpUTW+elmrmsFIn2
 V+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752011374; x=1752616174;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2TPssIGpA26FxAQRYqaDNvET5x0SuwepHaZsGlb/dBw=;
 b=BpyRqnqRvui9QRYqg0qX1OlciK1YiOY7O0pm18riabG6bxxG75426p1eA7j9c6ssOa
 66KWrMDHEKzTevtc5dt+K7dDAc0DWKaCJ3xMplkO7bgbm8uo4caSAsSD50h5V91FDy4R
 c9B+BYO8vAkXpaVeTJHyKeFhRIt9BrEirfqAmDz0iSySHswyoSmFFg0kjRDRL9TIaW+1
 VKqmfnd76Y1Q6QtY0JzweejyrCBDZP12qgHXlThTqeOXT3RYxOvePh2grQyCSuQwTjFT
 OyXbFdic3P+mvfjKxiXmz6/y35kkbAOH5YEp/WhD+tQELLv5gH51L+cW8Z9hBC7jC2lN
 /jig==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8AG9Ni/ARN5fbExUsyPoA7b1ciUrN0R8XIC1k3M767kYb/LDYM4uIxyGGVkTAcLcZKFF/gqo4Ig==@nongnu.org
X-Gm-Message-State: AOJu0Ywt02MJH3onqx8fw145sTxKAOWg8X0s4fNQzvq9msmISDcF2EKa
 TKoEv5ayW6xi4yVXdA1+us+FI1cGWXzCCsxRxpcOOUMNQuZU4pQntYB7YehYsoZbX4Y=
X-Gm-Gg: ASbGncuzQy1wpmMC2a24TORy5U7tMNj5BQSx/dZuROhc66sn+RELdjbmt9HoMad06Bg
 nf/VB6cf/IZGkLLB2mHF2VztrY50USy29lyUq7Mc5aZafmXMFpSud92QogFLWCHIJ8auaSGe2WQ
 GPI2AK4nUGijzUT472DTGP7Y+hpMOWixUS4Cw9Nv5q9XBgTwDl6VhCu83jl9jvZX8ur2PJTWde+
 RJTp0pf4wEpI5V0dVdC71LwG0HGO2aQaaHeKUYqJ35xoLdyhAJtCtJL00Mul3eIjUHHSzUtdj2x
 pD8coQ0+gc0o5ETchfJxyBb7TEzFGhRNklhsKF2/P7tD30L+hHui4IaRKw0/6mJYTVeElI/3NTg
 j26o3euYtJH8eRZ4nmtPeu+zpJTL8yvsuz9Kj
X-Google-Smtp-Source: AGHT+IECnQy8a/pNsmle0teIaY8bm8tVZJN3JkeuFQQKRFkJMHybmXrieGz5GX9W1JJE3Jt7cI3S8A==
X-Received: by 2002:a05:600c:6745:b0:453:8042:ba9a with SMTP id
 5b1f17b1804b1-454d367340fmr10191195e9.28.1752011374251; 
 Tue, 08 Jul 2025 14:49:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d506120fsm680505e9.17.2025.07.08.14.49.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 14:49:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v8 0/8] target-info: Add more API for VirtIO cleanups
Date: Tue,  8 Jul 2025 23:49:09 +0200
Message-ID: <20250708214918.70076-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
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


