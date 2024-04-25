Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1278665ejb;
        Thu, 25 Apr 2024 04:03:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVT3x8xcr6Psx43IR+KHsZ4OkBkTJQsA4sEiwHQ0ca/LlVeKt13AiqXHJZCPiWIURvqG60X68dYNCQ2XYRWo14OZO83/4qZ
X-Google-Smtp-Source: AGHT+IGQtJXy0ZRgLZqqSo0QODq43WFdv530HE2YZwmn9CrEM4zO/yAV5exqdaMfC48tyTHE0pKt
X-Received: by 2002:ac8:5e06:0:b0:43a:d3a:4093 with SMTP id h6-20020ac85e06000000b0043a0d3a4093mr5837881qtx.52.1714043012072;
        Thu, 25 Apr 2024 04:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043012; cv=none;
        d=google.com; s=arc-20160816;
        b=qW4m3NKJy+nwEnp4XkZvYleiVek4QJiJ7icyD2gu0E9rkwcgDe4XxNGm9mdc9T5Y8K
         MguPpKPQrV+CrZyOpS3Ex+hMwmt4nk/BeRlh0wzzklNncbK6VLijGd8CfclrBowLkyaT
         qc+LxxKRAbqXuQ3Adas+4gy9VxiPi4VVnrxyydViJ8YqmlRSyu4JD7DOLLQya+eUFEMh
         HEneo4ABSPTG3hteGE5av/yuCN8Z3yoaOq6favGepVPJZT5Wd4Hsxu7pYDRr5ERuFcKs
         Y+ZNaisPdpIBQEXXEXNJ+pcEwTDjIz4Efr3avZ/i630nSWBhPPIVk4vItnCGHiS3pyTw
         oKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=GXxNzvp3pctM95h9IO3sLT8TUCeqLQhxyJlDys2/tCQ=;
        fh=C4doTyaNICqzXXqDAZa03S7YBSLugHHi/H2Xd458s24=;
        b=s8vWWTrL/jgEG3UQy+oL8GdQsmEyZmVlMDauLS+eHGfI/eGwc6O7wQJA/K8jpcvZI5
         FhYMgAvAqBxckzN9hix7bGRcAyRpxLTLul4o0n3VdzIZNiMS2cTNA20HulPXsTmb1f76
         nZGyakrynDOmqmT7WHtOSKWDyVqdBdE8ENn++s3R3FxbGgjxaHziTsqyUzWc6T0+s6tJ
         6ndIqcgSClsHK6EgNTKMMxRL5TAFgWrPGf77IOHdhKTGMJeXSNzSjbSjNPq4yLuY/AFF
         YDr/b864UtII7yS12o4a+88mZeQBpkrLTe3vbwlKA39d6MYAavWUGv/8fK1Fxd7jrKGl
         eRFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fWaBcAP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dh11-20020a05622a4e0b00b00437794a296esi15659935qtb.529.2024.04.25.04.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fWaBcAP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwrj-0007jf-6K; Thu, 25 Apr 2024 07:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwrd-0007fW-ML
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:02:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwrZ-00086u-Fh
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:02:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34c1a17da03so266789f8f.0
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042919; x=1714647719; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GXxNzvp3pctM95h9IO3sLT8TUCeqLQhxyJlDys2/tCQ=;
 b=fWaBcAP14DTNW7lWH+aYbK2rGwP10WIx/tHl20XK2ebWRIP9xE0KFxxsLcP8IPdl7K
 pbU5aRFNGctUdm709fl8dvBbyh435mcSnl6T3PG3ohSycWLGBaMv8lpx3u1yjEPKk9Gg
 lHP4AACa2R62iJR+4xrN7hkoG7Xc7C9G9dFw/3gGE3fFqX7gzR4qj4Ra51y6A8jZ/h0g
 WnF+gK4KXfnM0715G/PGYwD+mJGqdVzR+d2tWvCYicYLGpqN65VX5Im0gvZFKfCT2Ket
 Of1MjzzOY1/1UVH5qgKc9QR1+ZHLi2aiv8WDlbT/13o1Rlrh5E3xlXiR7LOyIVWbqY35
 FurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042919; x=1714647719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GXxNzvp3pctM95h9IO3sLT8TUCeqLQhxyJlDys2/tCQ=;
 b=tBYzBch6IVB32g8at/0RuU6NB1K5cshQ9CNZ7Q7+2k3H0EyGBVRdx5N/SZ/J4fnzpK
 UZ7dnxZ0zSw419sKTw34jiRBFjptdqceGu1w0smSTVqrzBq8TxWdVkB/JITKCV34v/CG
 ZlyX+o3y76VnHlj0UDhAHepC2jnECVb6TP+2Zabg+yUr529g2abwS3ZiDZpF346wcAzp
 wF7OCboMuYZ6lGo3P3/WIaB1HMCud7S/cXPcmBc4PMuXh78NO/e4aaxF/bCGzKml7L8K
 LTentMMXAe/TGiPi5UTI92jAql93JBa2cM/Vf3+95WTY//BtyGaxwxkhIpSpdKjDHGBt
 R+Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmlxB0YTaVvKj2hS2W9I3//g2GylgkYvRvg8GD16WZenzdeg5d99ZAqFgeJsqEXE4gUSB4/aPm5XjuNzULvS8R3SD6
X-Gm-Message-State: AOJu0Yx45nqu74imNlOaxTa6kvTJdS5s+STkhswz9WDS6elU5zfyWapr
 vmuASiAlOfEhH3p1OT1Ozs71HSRQR9n+FwfqryfHL46MMHhvyTa5swnfkWBnmwQ=
X-Received: by 2002:adf:fdc2:0:b0:34a:572b:40f9 with SMTP id
 i2-20020adffdc2000000b0034a572b40f9mr4927027wrs.8.1714042919464; 
 Thu, 25 Apr 2024 04:01:59 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5d4d11000000b0034bb61cc5efsm4234704wrt.24.2024.04.25.04.01.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:01:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Philippe =?unknown-8bit?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/22] Misc HW patches for 2024-04-25
Date: Thu, 25 Apr 2024 13:01:33 +0200
Message-ID: <20240425110157.20328-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mG6nf2sJJ+az

The following changes since commit 85b597413d4370cb168f711192eaef2eb70535ac:

  Merge tag 'housekeeping-20240424' of https://github.com/philmd/qemu into staging (2024-04-24 11:49:57 -0700)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/hw-misc-20240425

for you to fetch changes up to 098de99aad1aa911b4950b47b55d2e2bcc4f9c0c:

  hw/core: Support module-id in numa configuration (2024-04-25 12:48:12 +0200)

2 checkpatch issues:

- one spurious:
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

- one deliberately ignored in a python script:
ERROR: line over 90 characters

----------------------------------------------------------------
Misc HW patch queue

- Script to compare machines compat_props[] (Maksim)
- Introduce 'module' CPU topology level (Zhao)
- Various cleanups (Thomas, Zhao, Inès, Bernhard)

----------------------------------------------------------------

Bernhard Beschow (1):
  hw/i386/pc_sysfw: Remove unused parameter from pc_isa_bios_init()

Inès Varhol (1):
  hw/misc : Correct 5 spaces indents in stm32l4x5_exti

Maksim Davydov (4):
  qom: add default value
  qmp: add dump machine type compatibility properties
  python/qemu/machine: add method to retrieve QEMUMachine::binary field
  scripts: add script to compare compatibility properties

Philippe Mathieu-Daudé (7):
  hw/core: Remove check on NEED_CPU_H in tcg-cpu-ops.h
  target/i386: Move APIC related code to cpu-apic.c
  hw/misc/applesmc: Simplify DeviceReset handler
  hw/misc/imx: Replace sprintf() by snprintf()
  hw/riscv/virt: Replace sprintf by g_strdup_printf
  hw/elf_ops: Rename elf_ops.h -> elf_ops.h.inc
  hw/xtensa: Include missing 'exec/cpu-common.h' in 'bootparam.h'

Thomas Huth (2):
  hw: Fix problem with the A*MPCORE switches in the Kconfig files
  hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER device

Zhao Liu (7):
  hw/cxl/cxl-cdat: Make ct3_load_cdat() return boolean
  hw/cxl/cxl-cdat: Make ct3_build_cdat() return boolean
  hw/cxl/cxl-cdat: Make cxl_doe_cdat_init() return boolean
  hw/core/machine: Introduce the module as a CPU topology level
  hw/core/machine: Support modules in -smp
  hw/core: Introduce module-id as the topology subindex
  hw/core: Support module-id in numa configuration

 MAINTAINERS                             |   5 +
 qapi/machine.json                       |  74 +++-
 hw/xtensa/bootparam.h                   |   2 +
 include/hw/boards.h                     |   4 +
 include/hw/core/tcg-cpu-ops.h           |   3 -
 include/hw/cxl/cxl_component.h          |   2 +-
 include/hw/{elf_ops.h => elf_ops.h.inc} |   0
 bsd-user/elfload.c                      |   2 +-
 hw/core/loader.c                        |   4 +-
 hw/core/machine-hmp-cmds.c              |   4 +
 hw/core/machine-qmp-cmds.c              |  23 +-
 hw/core/machine-smp.c                   |  41 +-
 hw/core/machine.c                       |  18 +
 hw/cxl/cxl-cdat.c                       |  28 +-
 hw/i386/pc_sysfw.c                      |   5 +-
 hw/mem/cxl_type3.c                      |   3 +-
 hw/misc/applesmc.c                      |  36 +-
 hw/misc/imx25_ccm.c                     |   2 +-
 hw/misc/imx31_ccm.c                     |   2 +-
 hw/misc/imx6_ccm.c                      |   4 +-
 hw/misc/imx6_src.c                      |   2 +-
 hw/misc/imx6ul_ccm.c                    |   4 +-
 hw/misc/imx7_src.c                      |   2 +-
 hw/misc/stm32l4x5_exti.c                |   8 +-
 hw/net/imx_fec.c                        |   2 +-
 hw/pci-bridge/cxl_upstream.c            |   3 +-
 hw/riscv/virt.c                         |  17 +-
 hw/ssi/imx_spi.c                        |   2 +-
 linux-user/elfload.c                    |   2 +-
 qom/qom-qmp-cmds.c                      |   1 +
 system/vl.c                             |   3 +
 target/i386/cpu-apic.c                  | 112 ++++++
 target/i386/cpu-sysemu.c                |  77 ----
 target/i386/monitor.c                   |  25 --
 tests/qtest/fuzz/qos_fuzz.c             |   2 +-
 hw/Kconfig                              |   1 +
 hw/arm/Kconfig                          |  18 +-
 hw/cpu/Kconfig                          |  15 +-
 hw/cpu/meson.build                      |   3 +-
 hw/riscv/Kconfig                        |   2 +
 python/qemu/machine/machine.py          |   5 +
 scripts/compare-machine-types.py        | 486 ++++++++++++++++++++++++
 target/i386/meson.build                 |   1 +
 43 files changed, 858 insertions(+), 197 deletions(-)
 rename include/hw/{elf_ops.h => elf_ops.h.inc} (100%)
 create mode 100644 target/i386/cpu-apic.c
 create mode 100755 scripts/compare-machine-types.py

-- 
2.41.0

