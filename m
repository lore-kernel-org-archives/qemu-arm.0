Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1226542lfc;
        Tue, 10 Mar 2020 14:32:11 -0700 (PDT)
X-Received: by 2002:a5d:6191:: with SMTP id j17mr9600833wru.323.1583875931045;
        Tue, 10 Mar 2020 14:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583875931; cv=none;
        d=google.com; s=arc-20160816;
        b=ikMDNrLwc++EJDl8PBfrC2SZiGR3ri3IpZC+yqlFaTYON0xiviG3HwOuGMdBSz/yUo
         SeucKkLhAj/nuV0uUAcUrIdCXGdmxFYnbNDwLJVn/k6M4+vgh8gdZDGdGDCWRYWm+Lrm
         J6Eeg9FiMuE74i7pfIHnp0eh1nXBBU2dF+JsucAS1Uc3OdMIJuuUVVFKhUPYt3cLOcNU
         3huk1q83iRgKiAEY3f3gtB3+W6duwekscOsjJ/n4hsWP2uZWL+D74r6MwlSZbLqogcRr
         q6QckmgovZb9s1d7iKMrcd9QhEYfPCWKsGAk6h0oY4v45pXSklriw7mVbCeP0JvY/CTf
         HNSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=bTP3m04W19DHRbF7HJDAwJz9ToGGdfJLmzi/E7yzn7k=;
        b=lbxOLYWhF/wVFPi5H8ebnnsPGgCfHkNIN+E9ijC9YMAb5JAbE8tKlvFVbmmsm6iWvl
         OM9DwWczfGUbat6mmAMQaiB8BTPhOAjiL5YDq6C3LhfH2Hz7usxBHJXJ9u5T54zW2tyz
         dOHF5dE+9BBW6AY6WuKgoE+Y/xhszKn0VF0eGptUkmqVZlfOro2wgxlgPyuJHe+jpbep
         xCiiXUXM69McJmJCS4nYZ4/zhXc365JYLUnNft3ipo42UtpgEyH1IrF7BkKoEbtM9ElM
         bF5ef0srbHNsAn3EQikz0zHqndRdNxS/MAavcSXvLsjR1bJ2aLKvM06pSqjBhCh/HVOJ
         Zwtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EDFnYK8h;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 139sor2686789wme.12.2020.03.10.14.32.10
        (Google Transport Security);
        Tue, 10 Mar 2020 14:32:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EDFnYK8h;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bTP3m04W19DHRbF7HJDAwJz9ToGGdfJLmzi/E7yzn7k=;
        b=EDFnYK8h0agMq2oc2zgkg7NqAAPMSTqlH6hnTUSu0iZsHx9OczjN9GIJqDmsGDTTJd
         RPjffaHe/D5y1DDuc7MQ9wfcgWZzOhnpNr+dEninTilThr7L65UHmAXWreHhN2iFGb7F
         wB924v34ahb3Fd1YitFKgtiHIuCk1+/iyT7OJChn80bHBO9YeijTuQYJN1RKNT62oK0T
         MFiZYOJQ64Nr/3sWIkxQFtJUXKtnFV0wdEJXjtG5KQvdkZZMob87kq7KMLQIbcpetywM
         448iW1f24PeNVMhnb3RdQlBmUR7p0WA91VLLN/vkV+ASjDVCHpcOZKB7UKs+t5uxo5KT
         LnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bTP3m04W19DHRbF7HJDAwJz9ToGGdfJLmzi/E7yzn7k=;
        b=Oep/hiGOnftYzcqfhL1JCHmbol6Mxe7og5Z10uZblVAspi+LZR5CyCUtFmU1VGssbr
         9fp71RLvTXNxsdZ+XQCBbqdqE4F6o9Y+SMdjitYPV+N30ciOIdAxR44UxXzmkJeuKhxq
         5h++NB/1oPwPpn7aLEHT708N0HsrACGsamhQfmsAE0UFhmGOZOjPDEuZumN/r0gsTiuo
         ugScM+C7nPu1VurxiSALfpGT9aV5BE/Nup2HL8bZYH4AfoBo4RQgonVwLIHO4Tmc2PaW
         hMOyG7q9NG7reU4GWgGK8SiGJR8brlSEpLVjygw30q2y+2CXtKObHICpqNZCuO+2B4Y2
         LhLQ==
X-Gm-Message-State: ANhLgQ3MCOY+MG3lyi3b70JWoXFe3IMiuAxDjVXbToeQ50ryAbtkfCY3
	nH/z32tyb53GZs45GiSwZLs=
X-Google-Smtp-Source: ADFU+vvAxiZLvxthQzGO71nhdNWLjLCuZlUJFa3qRbopUsjsadiPvoEvpHhi+K7vBoax7LH/FN2i+w==
X-Received: by 2002:a1c:62c5:: with SMTP id w188mr628792wmb.112.1583875930591;
        Tue, 10 Mar 2020 14:32:10 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id 2sm32803580wrf.79.2020.03.10.14.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:32:10 -0700 (PDT)
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
Subject: [PATCH v7 00/18] Add Allwinner H3 SoC and Orange Pi PC Machine
Date: Tue, 10 Mar 2020 22:31:45 +0100
Message-Id: <20200310213203.18730-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dhaiBrlY8myh

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
docs/system/orangepi.rst which is included as a patch in this series.

The contents of this patch series is available on Github at:

  https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v7

The followings are currently known issues in this series:

  - RTC date & time is not persistent
  - boot0 custom Allwinner bootloader not yet working
  - Watchdog not yet implemented, affects U-Boot 'reset' and shutdown/reboot
     -> This is part of the existing A10 timer that needs to be generalized first

Looking forward to your review comments. I will do my best
to update the patches where needed.

===== CHANGELOG =====
v7:
 * tests/acceptances/boot_linux_console.py: extend test_arm_orangepi_sd with checks for ethernet device
 * docs/system/orangepi.rst: moved from docs/ top level to docs/system/
 * docs/system/orangepi.rst: correct indentation and section headers to resolve sphinx parse errors
 * docs/system/orangepi.rst: add .. code-block:: bash for each code example
 * docs/system/target-arm.rst: include the orangepi.rst file
 * hw/misc/allwinner-cpucfg.c: use arm_feature(&target_cpu->env, ARM_FEATURE_AARCH64) to fill target_aa64 for 64-bit compatibility
 * hw/arm/orangepi.c: use object_property_add_child to add H3 SoC object to machine and use object_unref, to avoid memory leak on exit

v6: https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg00046.html
    https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v6

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

 docs/system/orangepi.rst               | 253 +++++++
 docs/system/target-arm.rst             |   2 +
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
 hw/arm/orangepi.c                      | 131 ++++
 hw/misc/allwinner-cpucfg.c             | 282 ++++++++
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
 tests/acceptance/boot_linux_console.py | 230 +++++++
 40 files changed, 5418 insertions(+)
 create mode 100644 docs/system/orangepi.rst
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
