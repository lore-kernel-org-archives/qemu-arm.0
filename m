Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F086EC8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:03:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZEWn-0000Ra-Lv; Tue, 08 Jul 2025 16:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCPv-0002cl-TG
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:48:03 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCOm-00055O-Sg
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:47:34 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ae3b37207easo865205066b.2
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 10:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996790; x=1752601590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0z6zuLyqS0wcOglQ1OI6Oqu0dEI4wR6AUI75p1DD0Uo=;
 b=o1Gp5Mt0yaYnWhe3hIYJCqYV594k8kUNkcry5ykTh88PiKqzl6tv+Mus2VNdTm8kzF
 +rxwIXIHdXuDSBhIOVXJQ8bj10EJWCfpn4I5R4BapQa3t2vla0/29P+rASTX3LNqi/jd
 sycK6VkexUxtKHONi1ZpIp6zOlF8e9nvLuGkAaE5lgyzvHyfmY5SrluUlniz4KC6aPg8
 Qn6hW6b1YbaAtPvjbdlUdvWZ0IamurdvboZ8EIF8dqOZQzEZlBSVq3C3hWck3FPYAITZ
 px7/E3L7EUmJ5L9xtauBDZT24vYkUk4m3lX1icoqbGulx42zqKGZQ2O3xV14a3oXdxR1
 +zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996790; x=1752601590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0z6zuLyqS0wcOglQ1OI6Oqu0dEI4wR6AUI75p1DD0Uo=;
 b=eNzEGwskKwjOSiqn28uzTtH3WAuslj6wYfdgcttAGpVH8nWXcOc2blVd+MiwzrlV1J
 3bVsgh+X4FxWboXoodTuaeDI74paFclKVPWnXAMNTt6ZoUQcdy/NnShvDaVjEUENI9Uv
 uPWXGXl5jz+ntPegINfTr2DKqrzRw9jkzZv1W1UxlQS3eSEX2y0Wr8Y5r5c50rrPl/aU
 yuLf2iDAT07yWT/9AQyCwBFjpN5Xr3iwnb0zoxJv9lOe7ZFerlrtKB+sSFsqvj7rITvB
 zbAhEPQDlvkIHSlGMfEIMlQOvixGriZ1W+CtqVKm+lt/NyG+qWHM0ceM+6vQGLQmFU7K
 nnMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcvvesr/qFeStYqLqSUcrsUkOINxwwFm7RgKWtllbpwjazxtWn9yfhvA9c1IwoWPfgcrO9minYRg==@nongnu.org
X-Gm-Message-State: AOJu0YytQlzvshFtzGJcdNt1CkFDbGj0fqWohmNxCssiKZkKp2HbmBQx
 k4N0G2Lm8vguPuMA3u+tuOqIE4i6C8xesSFkijFYJt6jUPnd8XuRrdchhyMNlCQZDcSzDQk8d4j
 MY4m2
X-Gm-Gg: ASbGncs7TEeKSplVwdgXJqFPkyCrUtN0okYAC7N1g604bpSEVQGn1foZHC5bs9K/jFr
 EPafDQUgeK8uoTiHJImMcw48cN320iBRzl1WQTjghlvHqeafhQ6KtOTYcqdAEX295PAne7OE5nF
 oGJi04hII+skCinEsZJAs+5GwUGgKcNPvkY/BM2CXHwkhPG3WYcGJSVA+RJElJby+IMHGvlUCc6
 qxTfOE6nPJm1jQTp5TgVWfTV5179cBysqFvs6wE5GSb+3lgMbXhLjuOrf3j5DSbdcYLTVDdkgJk
 dUayMERM4EkbHqQGqe9+Bb/u/ZIhAMcASv1ZOCuFS+6R02t1mMZ4Gon4KsE1EexcmADxof1g5EU
 Ck3IJZxNnz047klrEaQVqu/v2u9LvilEUgDcW
X-Google-Smtp-Source: AGHT+IEkM94DyDOhgiUDQ9k45sEVeJR3CEVz04SErlMrGPWV3l1ZeWIqAHV0z7YC5n5AAcZlrdCrwA==
X-Received: by 2002:a05:600c:3acf:b0:451:edc8:7806 with SMTP id
 5b1f17b1804b1-454d367a0d1mr4240105e9.32.1751995210633; 
 Tue, 08 Jul 2025 10:20:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd49841dsm21584835e9.0.2025.07.08.10.19.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:20:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v7 0/8] target-info: Add more API for VirtIO cleanups
Date: Tue,  8 Jul 2025 19:19:40 +0200
Message-ID: <20250708171949.62500-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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
 include/gdbstub/helpers.h             | 15 ++---
 include/qemu/bswap.h                  | 73 +++++++++++++++++++++++
 include/qemu/target-info-impl.h       |  6 +-
 include/qemu/target-info-qapi.h       | 29 ++++++++++
 include/qemu/target-info.h            | 10 +++-
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
 53 files changed, 191 insertions(+), 146 deletions(-)
 create mode 100644 include/qemu/target-info-qapi.h

-- 
2.49.0


