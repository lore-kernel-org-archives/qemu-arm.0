Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1674930ejc;
        Tue, 12 Mar 2024 01:24:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQ2gktj41c7POwM9BF4WpiKGJRjYXJ+rk0hXErHoUsfOzQvlmZrNNlibfUfXWhGirWR7XmKw1WeVNyqA4WyoYk1u0m2PzG
X-Google-Smtp-Source: AGHT+IH3761H5Sa3daDDSzhCozcq7w51cwZ16dOsXRQiRnIrY3WlYnttnIse26s16sH6ykCxKDRr
X-Received: by 2002:a05:620a:560e:b0:788:30ba:98fc with SMTP id vu14-20020a05620a560e00b0078830ba98fcmr10070835qkn.43.1710231893400;
        Tue, 12 Mar 2024 01:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231893; cv=none;
        d=google.com; s=arc-20160816;
        b=JXpddpE8gmIjHMUzGTY3A2XspH7eueHN0zml4z0Cmjjy41rxkCJRP4Yf/J5VTHqUxW
         UR1PixIgmU5egd84E9f9RafJ8s84iOtFVpwsMGy8NhwIZapr2LiXiR/bMejBOkR75hAT
         UjcJVnT3BMR0hxJ0e+Mlwpf034ynm5nF9qqwL8T74Z0+AW2w7i0YvxDTz7+TDPMNZpL7
         IOHB7FTJlc8zCYTJaxHg/w2B3zxDRk4PR2fht+RJIzZ+gXaFBIwd6gcn7O4GU41+vUvz
         twUfzfKgNsGMdzyqIfVyW3y9aIR6p6kdU1jboMjrJWmCCxGv4TNgMRMt8esx7P0Cd1hm
         aMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9ThlkXWuH/LZwgUYhcSMxtjhxxhNUZ7hP3Buj6LguH0=;
        fh=+hK48+RkpcPOlP78dIpt8pF2N5VnjhdW7WD/fho3/8U=;
        b=yUeGuC5l0HXlxfRKUaUaYvRG9UukhDFLX0uI11NfLFXU7eVJTnIfCjNo+90QujwXP0
         IrEK9vVwUGG+ZDQfrZtxfXyCEec9Vi4YeP61ns8SxbO28K65Z9A2qyQBRF1Ff8gK3kDa
         i+oEdWWDiBmsG5hvnGEfZRYA276LTMsRXF39irkAkD7afQeXaxlk/qli6Iufm0PwGiSL
         jqPaDrqBcN4N39a7oy9iK77uJoGwsaz5NFV4U1MYi32Jr54hy4pi8AVJeT3j1KXlU+U5
         DX+YfeOTePqDKvyWpyabLLSZAwIwW0Ou7fau159t1eAViPxsC1nherfFulWwlncP4eS5
         JWzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bhfa8VBq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05620a440b00b007887120c8dcsi3508050qkp.421.2024.03.12.01.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bhfa8VBq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxPP-0005SM-5B; Tue, 12 Mar 2024 04:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPN-0005Q8-2Y
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:22:49 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPJ-00014e-HY
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:22:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-413318a3a29so4501805e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231763; x=1710836563; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9ThlkXWuH/LZwgUYhcSMxtjhxxhNUZ7hP3Buj6LguH0=;
 b=bhfa8VBqBmsjIWEjgspU4nAA85uO9SGQ4eQmzry3Li3gBA44GzSHj9GFjL0iYZ0IP/
 M5mOlQvHyyLwAIVF7YsYNPv7ZfSgyiHqFy//T6h5wuOU9SdyI4Irkp1WAXyBbWf/7sVg
 LKqrNsGcmBKurFTbDfgkj8ogtCm2lH8tVgB9UAp8xsZVlZvVIPywb/QTc505piQA2QOU
 2QZrh39Fj7Z8+yj8qamRZswftWpWwF338CX9fIdJhdsgei/hvYIKoCJnJz2uYUd2XyKP
 +GlwEf6t4LdpEBSlRVPK5o/fvCfN+olqVUsgUIJpKb02LbEq3hzoYoCwBLtLTDNW2+1b
 9Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231763; x=1710836563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ThlkXWuH/LZwgUYhcSMxtjhxxhNUZ7hP3Buj6LguH0=;
 b=D5nrF98xKQmkMGIpp78xZztGZLcxfecFLfBrObQlERpnsSmxCA8MX01NiFzOPHNrw/
 hDnZA5EPcoJuEGGE8MDiILQozJjg25u8eeyEsBlozqttDslA34MdibQARu1HuEm8zLaQ
 btZ4raprDvqFHZJY6EQbdtlFp/70rFSztqXHJEE0pdb6h12ICVD3lGyryk2STlTIe9Jr
 jEGRUnsrl4ucxjHpGtG2DuCsdbfXRdXgTuiVGkUsHZQOmkxWwki8yZhVw/tN94NE8JwJ
 PIGRar1sls1VTB+iql0cc18czxmoNb3PVlbYhg3XJyswSw02s7/R0wi6WYzXJOXVSUyf
 wYrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5ow6MJx1GEtWLdKWyLqKntbhBnvP5oYadvgMoZ0z1+HH2a0Nm5qO4j3IrfyShvHmUHSWGJITUlVaYFrD0H8JbRBv+
X-Gm-Message-State: AOJu0Yx9fNy+CTHgW+nloB/op5qtgdtP9x2/REdTapKtUJKKFYlFjfF8
 WLqGMdtzdCIOlX7UgmkXy5Tzu/x5qPfMr4xv/xJYZZHJh3bIkHjejik6IYWrUjw=
X-Received: by 2002:a05:600c:518b:b0:413:38f6:c62c with SMTP id
 fa11-20020a05600c518b00b0041338f6c62cmr609523wmb.1.1710231762803; 
 Tue, 12 Mar 2024 01:22:42 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b00413079f9065sm11717694wmq.8.2024.03.12.01.22.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:22:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/13] Misc HW patches for 2024-03-12
Date: Tue, 12 Mar 2024 09:22:25 +0100
Message-ID: <20240312082239.69696-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aDJKBVVomV2c

The following changes since commit 7489f7f3f81dcb776df8c1b9a9db281fc21bf05f:

  Merge tag 'hw-misc-20240309' of https://github.com/philmd/qemu into staging (2024-03-09 20:12:21 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/hw-misc-20240312

for you to fetch changes up to afc8b05cea14b2eea6f1eaa640f74b21486fca48:

  docs/about/deprecated.rst: Move SMP configurations item to system emulator section (2024-03-12 09:19:04 +0100)

----------------------------------------------------------------
Misc HW patch queue

- Rename hw/ide/ahci-internal.h for consistency (Zoltan)
- More convenient PCI hotplug trace events (Vladimir)
- Short CLI option to add drives for sam460ex machine (Zoltan)
- More missing ERRP_GUARD() macros (Zhao)
- Avoid faulting when unmapped I/O BAR is accessed on SPARC EBUS (Mark)
- Remove unused includes in hw/core/ (Zhao)
- New PCF8574 GPIO over I2C model (Dmitriy)
- Require ObjC on Darwin macOS by default (Peter)
- Corrected "-smp parameter=1" placement in docs/ (Zhao)

----------------------------------------------------------------

BALATON Zoltan (2):
  hw/ide/ahci: Rename ahci_internal.h to ahci-internal.h
  hw/ppc/sam460ex: Support short options for adding drives

Dmitriy Sharikhin (1):
  hw/gpio: introduce pcf8574 driver

Mark Cave-Ayland (1):
  sun4u: remap ebus BAR0 to use unassigned_io_ops instead of alias to
    PCI IO space

Peter Maydell (1):
  meson.build: Always require an objc compiler on macos hosts

Vladimir Sementsov-Ogievskiy (1):
  hw/pci: add some convenient trace-events for pcie and shpc hotplug

Zhao Liu (7):
  hw/core/loader-fit: Fix missing ERRP_GUARD() for error_prepend()
  hw/core/qdev-properties-system: Fix missing ERRP_GUARD() for
    error_prepend()
  hw/misc/ivshmem: Fix missing ERRP_GUARD() for error_prepend()
  hw/core: Cleanup unused included headers in cpu-common.c
  hw/core: Cleanup unused included header in machine-qmp-cmds.c
  hw/core: Cleanup unused included headers in numa.c
  docs/about/deprecated.rst: Move SMP configurations item to system
    emulator section

 MAINTAINERS                                 |   6 +
 docs/about/deprecated.rst                   |  20 +--
 meson.build                                 |   2 +-
 hw/ide/{ahci_internal.h => ahci-internal.h} |   0
 include/hw/gpio/pcf8574.h                   |  15 ++
 hw/core/cpu-common.c                        |   4 -
 hw/core/loader-fit.c                        |   2 +
 hw/core/machine-qmp-cmds.c                  |   1 -
 hw/core/numa.c                              |   2 -
 hw/core/qdev-properties-system.c            |   1 +
 hw/gpio/pcf8574.c                           | 162 ++++++++++++++++++++
 hw/ide/ahci.c                               |   2 +-
 hw/ide/ich.c                                |   2 +-
 hw/misc/ivshmem.c                           |   1 +
 hw/pci/pcie.c                               |  56 +++++++
 hw/pci/shpc.c                               |  46 ++++++
 hw/ppc/sam460ex.c                           |  24 ++-
 hw/sparc64/sun4u.c                          |   9 +-
 hw/gpio/Kconfig                             |   4 +
 hw/gpio/meson.build                         |   1 +
 hw/pci/trace-events                         |   6 +
 21 files changed, 339 insertions(+), 27 deletions(-)
 rename hw/ide/{ahci_internal.h => ahci-internal.h} (100%)
 create mode 100644 include/hw/gpio/pcf8574.h
 create mode 100644 hw/gpio/pcf8574.c

-- 
2.41.0

