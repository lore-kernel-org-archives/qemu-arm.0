Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986305njb;
        Mon, 5 Aug 2024 13:17:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4ZJVO2mEqfm7sTjTOtNlrmRjDRB7mLjBxpQtM6kSzz9PAl+A+/HMGr/MmpcRoraTK0EA2ooSV+UqhpqV92wDO8wcWSClz
X-Received: by 2002:a81:de54:0:b0:64a:f237:e0b0 with SMTP id 00721157ae682-6895ee353eamr134889427b3.5.1722889040840;
        Mon, 05 Aug 2024 13:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889040; cv=none;
        d=google.com; s=arc-20160816;
        b=v0uxsGzZ0nSO5FqKdOwMsfulqTBfTOyht4a/5TKWscTC1Y8eFi09MEdfWXYLGngZnw
         snxB8x/iUyDyrOmC16wY+NfZupboRxZ38JpdbZiY/MruQjLJIEERb5Y+DHivDRCbhbYp
         4C2FI9XK4mhFof+KnxKwamrIpQfUZNeMMixgknBHKmXNDxYLagGIMtfKgav8zk4ELm4R
         HrW+VHbp7sftjf5MAynIn0HeHhM4gaDC98MjbhHizmg7GThgIHIWerxH1RIaliR1e814
         LZMiyPYOpkSdmldtyv1AFCyJG/txOOQcVz078CHW+DB9FFNNwt+NPkh+db5/EaTloL7i
         4uOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:mime-version:date:dkim-signature;
        bh=XerA3mOsf4a50OWNf/gGXm4sNrAu9HVWQtZ4JJlFGM4=;
        fh=VZQty/eGahdFR1Bw4dA/i2G0XvFw44wxg11p28jYqOA=;
        b=XazHIT5xgrvsmTnNW+TcABHH8DTKCnKCzH0YkwRbqSMkV0bD+OUu8uVQbyuT3GpH0j
         Ter3KasITOcy9h48pEPaYAHrgPu7ftdlc4TFJNa+BZjpYotYl6XnMUh1lepKH3D4BaIl
         fRMKOM/byTjgvA+lYKFBASYMR/44HMGs9u4OzmRfmkdYY1EOTNVrq0huW86OhPe36ZaU
         CX4+z9nPa6CvqnZUsN5AEO4EeRXy6K6JWZjNkBVr8c7MScWmyrDFeJvEtMLYF9pDy+yU
         lmrhakGufrE5FV50med5vXp2qm5jLEhm1Gv1asVrXhueHxw9op/kqNGOi6EXI5dFoTDI
         yAtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=BGQ8K97i;
       spf=pass (google.com: domain of 3udoxzgukc7cqxsfmdlldib.zljxibu.ybkkbbifkxol.lod@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3UDOxZgUKC7cqXsfmdlldib.ZljXibu.YbkkbbifkXol.lod@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3UDOxZgUKC7cqXsfmdlldib.ZljXibu.YbkkbbifkXol.lod@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 00721157ae682-68a13b8ffa4sor58949337b3.14.2024.08.05.13.17.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3udoxzgukc7cqxsfmdlldib.zljxibu.ybkkbbifkxol.lod@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=BGQ8K97i;
       spf=pass (google.com: domain of 3udoxzgukc7cqxsfmdlldib.zljxibu.ybkkbbifkxol.lod@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3UDOxZgUKC7cqXsfmdlldib.ZljXibu.YbkkbbifkXol.lod@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889040; x=1723493840; darn=linaro.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XerA3mOsf4a50OWNf/gGXm4sNrAu9HVWQtZ4JJlFGM4=;
        b=BGQ8K97iTxKSUZXoSNtjx517sOmLz7jydu6LeDXPP8/Q+FMwiilEYi9s8Gd7Uc7W+m
         lFZYeJVpWwp4uYs5oj12kLya7bVAZ8AL8UTE/sYpOS+lOkSBuhXe3K/kU4d2t78bRxqz
         WsdphpVhnLgYBh4VrTQRzE2qfw5HUfJVF1iG1MC92ExZxNRnt1YHn8mDnR5S9LzjDWlm
         F21Ab/6SSrL7l8d2mFJb1FL196njt5npvdBUOvtwhYlCybc/JlsuZh8qYjsN6rzlKPOT
         /FUq4oJJbSoL81h9F9v1pv8cdawsj899OywLklyW6julXra7ZzGFXIZy68TE7qwaHmym
         rHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889040; x=1723493840;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XerA3mOsf4a50OWNf/gGXm4sNrAu9HVWQtZ4JJlFGM4=;
        b=kQrCAqZOVVsZLbpXQ4mxYrKT4z4d3vYzo7H3JLe+xJrxZzoxCXvYsONFm05dAzRDcp
         AEIYvodhNDrP1BFDNDAyTrxRyWtnor5U0V7V4QoC/Avl6Y7jzFIvpI65zzVt+NjQH9rz
         xM3FOYT3Z/FDgnboPTcoU3w+umweUJO1+chV8W7NL1JyKDoBCrN5+kohxr7z/5yOIY0z
         9gH5d0WI1+HGMqjWVm2NMsoUWClji38wMUv3DZE11EVNDwf+Cje9JOyPEagTkpbBqoe0
         E/yXFeqZgfjFcL5ZVhU+ZZGo1bB7GhXuJ0SPDdsnk1yzGcBxaMOLn1NpxIlOuOQFKDGP
         7LVw==
X-Forwarded-Encrypted: i=1; AJvYcCWnci9SR2tlZADFhURAJhPwUkVwhOcNyNE9vTYVDaA4TyYMu4VX2cHSQY8SNLgBq5X5WQsBeHzfLS5TalNFiN28JjbAMIaL
X-Gm-Message-State: AOJu0YyLAEQc6pCH4TmxYUV8NV0dCWQdJkSZK27MMJZdeJpRIzUKU8oD
	zQ07bCJDkT1bCZR7nBKiv01bJyakrC4TqHK1p6gJ/95VRsuLlBHW4stffGhr7LV0NrTuKcv68Q=
	=
X-Google-Smtp-Source: AGHT+IGqaTTPDERThIQ2lScByzIxC7MD4g+tlWTVvyLfl5S4gKHi5XMT98i4r1gqhOcJr9iKVMbiNcbz3A==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:690c:3008:b0:68d:1d96:6a72 with SMTP id
 00721157ae682-68d1d966f02mr1246467b3.1.1722889040430; Mon, 05 Aug 2024
 13:17:20 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:16:55 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-1-tavip@google.com>
Subject: [RFC PATCH 00/23] NXP i.MX RT595, ARM SVD and device model unit tests
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: nK5ixQHmF73i

This patch set adds support for NXP's RT500 MCU [1] and the RT595
EVK[2]. More RT500 device models will be submitted in future patch sets.

The goal of this first patch set is to provide a minimal set that
allows running the NXP MCU SDK hello world example[4] and to get feedback
on a couple of new / non-standard approaches.

First, this patch set introduces a (python) tool that generates C
header files from ARM SVD files[3]. This significantly reduces the
effort to write a new device model by automatically generating:
register definitions and layout (including bit fields), register names
for easier debugging and tracing, reset register values, etc.

It also introduces unit tests for device models. To allow accessing
registers from unit tests a system bus mock is created. The main
advantage of unit tests for device models over QTest is that device
models can be tested in isolation and do not require a full qemu
machine.

[1] https://www.nxp.com/docs/en/data-sheet/IMXRT500EC.pdf
[2] https://www.nxp.com/webapp/Download?colCode=MIMXRT595EVKHUG
[3] https://arm-software.github.io/CMSIS_5/SVD/html/index.html
[4] Building and running the NXP MCU SDK hello world example

    Clone the following git repos:

    https://github.com/nxp-mcuxpresso/cmsis.git,
    https://github.com/nxp-mcuxpresso/mcux-sdk.git
    https://github.com/nxp-mcuxpresso/mcux-sdk-examples.git

    in the following directories: CMSIS, core, examples.

    cd examples/evkmimxrt595/demo_apps/hello_world/armgcc

    ARMGCC_DIR=/usr CFLAGS=-I../../../../../CMSIS/CMSIS/Core/Include \
      sh build_flash_debug.sh

    qemu-system-arm --machine rt595-evk -kernel flash_debug/hello_world.elf \
      -global armv7m.init-nsvtor=0x08001000 -global armv7m.init-svtor=0x08001000 \
      -chardev stdio,id=flexcomm0

Octavian Purdila (19):
  fifo32: add peek function
  tests/unit: add fifo test
  hw/arm: add SVD file for NXP i.MX RT595
  hw: add register access utility functions
  hw/misc: add basic flexcomm device model
  test/unit: add register access macros and functions
  test/unit: add flexcomm unit test
  hw/char: add support for flexcomm usart
  test/unit: add flexcomm usart unit test
  hw/i2c: add support for flexcomm i2c
  test/unit: add i2c-tester
  test/unit: add unit tests for flexcomm i2c
  test/unit: add spi-tester
  hw/misc: add support for RT500's clock controller
  test/unit: add unit tests for RT500's clock controller
  hw/ssi: add support for flexspi
  hw/misc: add support for RT500 reset controller
  hw/arm: add basic support for the RT500 SoC
  hw/arm: add RT595-EVK board

Sebastian Ene (2):
  hw/ssi: add support for flexcomm spi
  test/unit: add unit tests for flexcomm spi

Stefan Stanacar (1):
  scripts: add script to generate C header files from SVD XML files

Valentin Ghita (1):
  tests/unit: add system bus mock

 configure                         |      2 +-
 hw/arm/Kconfig                    |     13 +
 hw/arm/meson.build                |      4 +
 hw/arm/rt500.c                    |    348 +
 hw/arm/rt595-evk.c                |     64 +
 hw/arm/svd/MIMXRT595S_cm33.xml    | 224052 +++++++++++++++++++++++++++
 hw/arm/svd/meson.build            |     42 +
 hw/char/flexcomm_usart.c          |    302 +
 hw/char/meson.build               |      1 +
 hw/char/trace-events              |      9 +
 hw/i2c/flexcomm_i2c.c             |    224 +
 hw/i2c/meson.build                |      1 +
 hw/i2c/trace-events               |     10 +
 hw/misc/Kconfig                   |     12 +
 hw/misc/flexcomm.c                |    304 +
 hw/misc/meson.build               |      5 +
 hw/misc/rt500_clkctl0.c           |    243 +
 hw/misc/rt500_clkctl1.c           |    224 +
 hw/misc/rt500_rstctl.c            |    219 +
 hw/misc/trace-events              |     18 +
 hw/ssi/Kconfig                    |      4 +
 hw/ssi/flexcomm_spi.c             |    443 +
 hw/ssi/flexspi.c                  |    216 +
 hw/ssi/meson.build                |      2 +
 hw/ssi/trace-events               |     12 +
 include/hw/arm/rt500.h            |     49 +
 include/hw/char/flexcomm_usart.h  |     20 +
 include/hw/i2c/flexcomm_i2c.h     |     27 +
 include/hw/misc/flexcomm.h        |     92 +
 include/hw/misc/rt500_clk_freqs.h |     18 +
 include/hw/misc/rt500_clkctl0.h   |     37 +
 include/hw/misc/rt500_clkctl1.h   |     38 +
 include/hw/misc/rt500_rstctl.h    |     38 +
 include/hw/regs.h                 |     89 +
 include/hw/ssi/flexcomm_spi.h     |     20 +
 include/hw/ssi/flexspi.h          |     34 +
 include/qemu/fifo32.h             |     29 +
 meson.build                       |      4 +
 python/setup.cfg                  |      1 +
 python/tests/minreqs.txt          |      3 +
 pythondeps.toml                   |      3 +
 scripts/svd-gen-header.py         |    342 +
 tests/unit/i2c_tester.c           |    111 +
 tests/unit/i2c_tester.h           |     34 +
 tests/unit/meson.build            |     56 +-
 tests/unit/reg-utils.h            |    103 +
 tests/unit/spi_tester.c           |     60 +
 tests/unit/spi_tester.h           |     32 +
 tests/unit/sysbus-mock.c          |    314 +
 tests/unit/sysbus-mock.h          |     82 +
 tests/unit/test-fifo.c            |     98 +
 tests/unit/test-flexcomm-i2c.c    |    209 +
 tests/unit/test-flexcomm-spi.c    |    204 +
 tests/unit/test-flexcomm-usart.c  |    321 +
 tests/unit/test-flexcomm.c        |    215 +
 tests/unit/test-rt500-clkctl.c    |    270 +
 56 files changed, 229725 insertions(+), 2 deletions(-)
 create mode 100644 hw/arm/rt500.c
 create mode 100644 hw/arm/rt595-evk.c
 create mode 100644 hw/arm/svd/MIMXRT595S_cm33.xml
 create mode 100644 hw/arm/svd/meson.build
 create mode 100644 hw/char/flexcomm_usart.c
 create mode 100644 hw/i2c/flexcomm_i2c.c
 create mode 100644 hw/misc/flexcomm.c
 create mode 100644 hw/misc/rt500_clkctl0.c
 create mode 100644 hw/misc/rt500_clkctl1.c
 create mode 100644 hw/misc/rt500_rstctl.c
 create mode 100644 hw/ssi/flexcomm_spi.c
 create mode 100644 hw/ssi/flexspi.c
 create mode 100644 include/hw/arm/rt500.h
 create mode 100644 include/hw/char/flexcomm_usart.h
 create mode 100644 include/hw/i2c/flexcomm_i2c.h
 create mode 100644 include/hw/misc/flexcomm.h
 create mode 100644 include/hw/misc/rt500_clk_freqs.h
 create mode 100644 include/hw/misc/rt500_clkctl0.h
 create mode 100644 include/hw/misc/rt500_clkctl1.h
 create mode 100644 include/hw/misc/rt500_rstctl.h
 create mode 100644 include/hw/regs.h
 create mode 100644 include/hw/ssi/flexcomm_spi.h
 create mode 100644 include/hw/ssi/flexspi.h
 create mode 100755 scripts/svd-gen-header.py
 create mode 100644 tests/unit/i2c_tester.c
 create mode 100644 tests/unit/i2c_tester.h
 create mode 100644 tests/unit/reg-utils.h
 create mode 100644 tests/unit/spi_tester.c
 create mode 100644 tests/unit/spi_tester.h
 create mode 100644 tests/unit/sysbus-mock.c
 create mode 100644 tests/unit/sysbus-mock.h
 create mode 100644 tests/unit/test-fifo.c
 create mode 100644 tests/unit/test-flexcomm-i2c.c
 create mode 100644 tests/unit/test-flexcomm-spi.c
 create mode 100644 tests/unit/test-flexcomm-usart.c
 create mode 100644 tests/unit/test-flexcomm.c
 create mode 100644 tests/unit/test-rt500-clkctl.c

-- 
2.46.0.rc2.264.g509ed76dc8-goog
