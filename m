Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1709085lfg;
        Sun, 1 Mar 2020 13:50:36 -0800 (PST)
X-Received: by 2002:a5d:42c6:: with SMTP id t6mr2615815wrr.394.1583099436349;
        Sun, 01 Mar 2020 13:50:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583099436; cv=none;
        d=google.com; s=arc-20160816;
        b=c9ErvqsvcyEIW8hkS86zTpai3j28NuD9y1E3x6SH7r8eX2K7Z9P7cSll0jfedJoPGr
         8a8vxrTCi0WJxs+p2OmT6KIrlm38whVJC8oarUjmQn/aRZpTdqam5nKQKNMiLjnS6WjS
         3aDGHkvPSgbu+fvz3fxUlJZ2H6mmQ4LQ23Y5Pn5xGwZmQ6il7NP2R3Cni4g+QQmJVADR
         5Vd87VFFEt6W7BOJyPAZBHNiFjN9XgtefQ74tzCuZBK3RcYYaUyybJYTWJoRvDHJ3Iro
         oaGzCl1mcTpRXMMwNephMCzfH3RiK3z26KCGetme7UnCCY4OiXnf3/lOlvCND4R8GT9q
         hO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=8FQGGCzpTRCBI7Uyr8JD1rNFQShK+SGtm1N0afW83mQ=;
        b=QJz975SDgfY+474KgXpCspgzwrZ1t7hwNGyCX4vwD5mb4RoTKPYRhO9Ct9uLhPy0B/
         WbfR5uaT4h1yLOdy6g5U33Lzz9nM1KMSg0twFU+4bbc/WAyFLPsZcc6kVXNtpu/Rqt2j
         jOcYXAQZGekaxkRDCGnzLIyjwVZeTCOpfl514wNu8RrWNiegihmUK8v687Id1Hpj5m+Y
         2eDYTIxtifpxyhqo9horIVu53PT6fNW3kTkD5Y/0YeYC7s//0i7eKmYmQ4ZkEVcN+fK6
         ip1lOwf0kSkXw8khDHeNqrdH3U5WkeR08zZ2vzYcpO+fxXX04UGwdH2dxASISC569/tq
         bxGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OlW80JAV;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l7sor4088050wru.20.2020.03.01.13.50.36
        (Google Transport Security);
        Sun, 01 Mar 2020 13:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OlW80JAV;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8FQGGCzpTRCBI7Uyr8JD1rNFQShK+SGtm1N0afW83mQ=;
        b=OlW80JAVrZviFhZY3EwxW2dxF/ARyVdIFyi2r/xs+cRH+xFwptSuVXAVOz/b3H+VjE
         41m1gvLVYz4Js/gol/YT3z+UjUvgxLUr4Y9YCIGhGYqi2QKAuf1MwQGS5qXThw2IFL9+
         YYc2OzdLN3/98LuzjgC/Tnz5tG7x/qsTibDvgPUU1U45w/TBBhGhCpkyQOV2r0wtyo0i
         yv6lMaQvIyNx/UyNbHHwg+uBqVv9uuXWqiLuMCxWpldSyv0RHU+SsXkd2dInV/Smx1fr
         pN1co1Mp8OmUJU3CfcWgkOU0po11z3EAQapyxW5S5Jo7bVIYKBy8GLER6fjgcSUL3EwY
         +9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8FQGGCzpTRCBI7Uyr8JD1rNFQShK+SGtm1N0afW83mQ=;
        b=RDfXwIx+r1pVqFxApCrBUsAs/jOJLpUfB+A+pQRO0lTg7lBrGu2nm+qToZMaKdilfF
         GBIYhCpS21E2aeO3Zq5R1JwIbgiB072P0xbndQrRd6ncw2+Z4jcd0yMx4aOzCBkActVE
         YWwKTKw1tOFcTBLjM+QE/CLsJv9WgiB/sRF4B1fvGOUh12N9G6vEdv6SCbLr+fBPD1Kr
         YKa8TYkPv087us34L1hBCT0r+nEFyyunOt7KmZA5QOUOj399RJxlAWUiHOk+Hcf+/Y70
         gHniFkP/Ddr6JNUucjmUu49v0eij1ydRurBifP8CACjc5LgK73D9WOvDTc9qPIX8T3sy
         ufzA==
X-Gm-Message-State: APjAAAXFNnm0LdEhf+RJaeif3ciUi0TNQ4/gyYEy2/3kiHxXvlji3QQB
	clXjZ8mIDS/20L1+9q8iBbI=
X-Google-Smtp-Source: APXvYqxpHPUOKA6Urdwt3ZM157u6D83+F0RHBhm2nkfaIfqvftAoMlht21UoyzVLGGJRXHNCAu5OlQ==
X-Received: by 2002:a5d:414d:: with SMTP id c13mr15380815wrq.40.1583099435904;
        Sun, 01 Mar 2020 13:50:35 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id e8sm25033124wrr.69.2020.03.01.13.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 13:50:35 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	philmd@redhat.com,
	b.galvani@gmail.com,
	jasowang@redhat.com,
	alex.bennee@linaro.org,
	imammedo@redhat.com,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH v6 00/18] Add Allwinner H3 SoC and Orange Pi PC Machine
Date: Sun,  1 Mar 2020 22:50:11 +0100
Message-Id: <20200301215029.15196-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HljtFa/v8xmL

Dear QEMU developers,

Hereby I would like to contribute the following set of patches to QEMU
which add support for the Allwinner H3 System on Chip and the
Orange Pi PC machine. The following features and devices are supported:

 * SMP (Quad Core Cortex A7)
 * Generic Interrupt Controller configuration
 * SRAM mappings
 * SDRAM controller
 * Real Time Clock
 * Timer device (re-used from Allwinner A10)
 * UART
 * SD/MMC storage controller
 * EMAC ethernet
 * USB 2.0 interfaces
 * Clock Control Unit
 * System Control module
 * Security Identifier device

Functionality related to graphical output such as HDMI, GPU,
Display Engine and audio are not included. Recently released
mainline Linux kernels (4.19 up to latest master), mainline U-Boot
and NetBSD 9.0 are known to work.

For full details on how to use the Orange Pi PC machine, see the file
docs/orangepi.rst which is included as a patch in this series.

The contents of this patch series is available on Github at:

  https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v6

The followings are currently known issues in this series:

  - RTC date & time is not persistent
  - boot0 custom Allwinner bootloader not yet working
  - Watchdog not yet implemented, affects U-Boot 'reset' and shutdown/reboot
     -> This is part of the existing A10 timer that needs to be generalized first

Looking forward to your review comments. I will do my best
to update the patches where needed.

===== CHANGELOG =====
v6:
 * hw/arm/orangepi.c: remove usage of memory_region_allocate_system_memory and OrangePiState
 * hw/misc/allwinner-cpucfg.c: add missing break statement in write function after REG_CLK_GATING

v5: https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04525.html
    https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v5

v4: https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg03960.html
    https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v4

v3: https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg01534.html
    https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v3

v2: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg03265.html
    https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v2

v1: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg00320.html
    https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v1

With kind regards,

Niek Linnenbank

Niek Linnenbank (13):
  hw/arm: add Allwinner H3 System-on-Chip
  hw/arm: add Xunlong Orange Pi PC machine
  hw/arm/allwinner-h3: add Clock Control Unit
  hw/arm/allwinner-h3: add USB host controller
  hw/arm/allwinner-h3: add System Control module
  hw/arm/allwinner: add CPU Configuration module
  hw/arm/allwinner: add Security Identifier device
  hw/arm/allwinner: add SD/MMC host controller
  hw/arm/allwinner-h3: add EMAC ethernet device
  hw/arm/allwinner-h3: add Boot ROM support
  hw/arm/allwinner-h3: add SDRAM controller device
  hw/arm/allwinner: add RTC device support
  docs: add Orange Pi PC document

Philippe Mathieu-Daudé (5):
  tests/boot_linux_console: Add a quick test for the OrangePi PC board
  tests/boot_linux_console: Add initrd test for the Orange Pi PC board
  tests/boot_linux_console: Add a SD card test for the OrangePi PC board
  tests/boot_linux_console: Add a SLOW test booting Ubuntu on OrangePi
    PC
  tests/boot_linux_console: Test booting NetBSD via U-Boot on OrangePi
    PC

 docs/orangepi.rst                      | 226 +++++++
 default-configs/arm-softmmu.mak        |   1 +
 hw/usb/hcd-ehci.h                      |   1 +
 include/hw/arm/allwinner-a10.h         |   4 +
 include/hw/arm/allwinner-h3.h          | 161 +++++
 include/hw/misc/allwinner-cpucfg.h     |  52 ++
 include/hw/misc/allwinner-h3-ccu.h     |  66 ++
 include/hw/misc/allwinner-h3-dramc.h   | 106 +++
 include/hw/misc/allwinner-h3-sysctrl.h |  67 ++
 include/hw/misc/allwinner-sid.h        |  60 ++
 include/hw/net/allwinner-sun8i-emac.h  |  99 +++
 include/hw/rtc/allwinner-rtc.h         | 134 ++++
 include/hw/sd/allwinner-sdhost.h       | 135 ++++
 hw/arm/allwinner-a10.c                 |  19 +
 hw/arm/allwinner-h3.c                  | 466 +++++++++++++
 hw/arm/cubieboard.c                    |  15 +
 hw/arm/orangepi.c                      | 128 ++++
 hw/misc/allwinner-cpucfg.c             | 271 ++++++++
 hw/misc/allwinner-h3-ccu.c             | 242 +++++++
 hw/misc/allwinner-h3-dramc.c           | 358 ++++++++++
 hw/misc/allwinner-h3-sysctrl.c         | 140 ++++
 hw/misc/allwinner-sid.c                | 168 +++++
 hw/net/allwinner-sun8i-emac.c          | 871 +++++++++++++++++++++++++
 hw/rtc/allwinner-rtc.c                 | 411 ++++++++++++
 hw/sd/allwinner-sdhost.c               | 854 ++++++++++++++++++++++++
 hw/usb/hcd-ehci-sysbus.c               |  17 +
 MAINTAINERS                            |   9 +
 hw/arm/Kconfig                         |  12 +
 hw/arm/Makefile.objs                   |   1 +
 hw/misc/Makefile.objs                  |   5 +
 hw/misc/trace-events                   |  19 +
 hw/net/Kconfig                         |   3 +
 hw/net/Makefile.objs                   |   1 +
 hw/net/trace-events                    |  10 +
 hw/rtc/Makefile.objs                   |   1 +
 hw/rtc/trace-events                    |   4 +
 hw/sd/Makefile.objs                    |   1 +
 hw/sd/trace-events                     |   7 +
 tests/acceptance/boot_linux_console.py | 224 +++++++
 39 files changed, 5369 insertions(+)
 create mode 100644 docs/orangepi.rst
 create mode 100644 include/hw/arm/allwinner-h3.h
 create mode 100644 include/hw/misc/allwinner-cpucfg.h
 create mode 100644 include/hw/misc/allwinner-h3-ccu.h
 create mode 100644 include/hw/misc/allwinner-h3-dramc.h
 create mode 100644 include/hw/misc/allwinner-h3-sysctrl.h
 create mode 100644 include/hw/misc/allwinner-sid.h
 create mode 100644 include/hw/net/allwinner-sun8i-emac.h
 create mode 100644 include/hw/rtc/allwinner-rtc.h
 create mode 100644 include/hw/sd/allwinner-sdhost.h
 create mode 100644 hw/arm/allwinner-h3.c
 create mode 100644 hw/arm/orangepi.c
 create mode 100644 hw/misc/allwinner-cpucfg.c
 create mode 100644 hw/misc/allwinner-h3-ccu.c
 create mode 100644 hw/misc/allwinner-h3-dramc.c
 create mode 100644 hw/misc/allwinner-h3-sysctrl.c
 create mode 100644 hw/misc/allwinner-sid.c
 create mode 100644 hw/net/allwinner-sun8i-emac.c
 create mode 100644 hw/rtc/allwinner-rtc.c
 create mode 100644 hw/sd/allwinner-sdhost.c

-- 
2.17.1
