Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294296lfc;
        Wed, 11 Mar 2020 15:19:04 -0700 (PDT)
X-Received: by 2002:a1c:1b51:: with SMTP id b78mr871631wmb.8.1583965144353;
        Wed, 11 Mar 2020 15:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965144; cv=none;
        d=google.com; s=arc-20160816;
        b=c3pdXW9a5dFCc8bs5WG0212PWrSNQSwpcWbz0oFSJn+PasbbtbK5aftPN6idropvu1
         E51w6JDpq7kHIxEBqF33Fm+A7VujLXmw5Bb8+KQTzw9uE/N5p50SRhZ8/zP0eAZxy4xq
         Gzv1od+4a8DpP6hmWgJKB5RBcemXieuqwBkZtV1Fm2XCukq1ALd4pBfea30fy86Pui3i
         7yZzZ1KsQwPBNcSz01ELfUgehGa1fDATi/3EJiP1Ldz16O5k1X8lr09ZogwDpNZMu6x+
         wS6T87yS3T08E9XEMMLAEBwR6rP3oxtiNJVoNJQZg/KkilF2eazsCCQ/+8TxbC1hD9hk
         f1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=c35f1rDGvPHKyuTytbQ2vfYuWvGKvBDCH4Yc9uo6TqE=;
        b=VJSbUcvPR7oMMV0ez9pgE/sL+CM+uKHz6h0Juzkk/NEUkJhaI6yUW11MEx0t86ITO8
         Yy8kpk+HtTITPpECRQovCF3hVqv7JQfXUSjxbEKWVTY4u5iU17YJ/BhuK7S16RiSFGyX
         R/iAqMLwHK+XHc5buce5eZHCOoGayfX//yelDahDZFahOafATLV2naKOBXutGjpmnHfN
         4XNP+IX/10b7yXeYVCbAXoBG61vXc1l6Ig6IOn+YB6o12rbVnFbblrQSNsMBooqAvnOU
         pC1Oi48evgRaysVc57YaElCn85L5PRMmtlxwJOqQJyUWLl9clGf3Y1+EpRjpqi8r60hu
         EnxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWw3j3qR;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g202sor2064293wmg.24.2020.03.11.15.19.04
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWw3j3qR;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c35f1rDGvPHKyuTytbQ2vfYuWvGKvBDCH4Yc9uo6TqE=;
        b=jWw3j3qR6NPt2lDt3erDSAYq3SHkuwwvnIg1klXMmahMO+rqUKe8Y/Ty5GhloKMxKD
         m3RWfzMGfiKT2faCirMSdtlFwWAw5UOVVcWJ+67GLMhy7oI33u+PWAY90UGR1IIThksN
         i6MbzzidxrLC/c04nHB57jK4XjJKqt7K0Gi0z3AjPn4K5Ts3i84rXkRiyKoKTFVoapZa
         pXcCDOvmw0Z8vM4yx418rPpb/5YjJL+bsq6xmSrnhhJ9VyICoSnSWdFA748URF9ne5lH
         vTyEc/aNbdnFm6lG92y9TY1SXEPbR2Z61zS/b6P9lUwb/GonFI5hlJj6ZlA67gcGALLQ
         SXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c35f1rDGvPHKyuTytbQ2vfYuWvGKvBDCH4Yc9uo6TqE=;
        b=f94nSw5qnnx1qhr1QOeBbgXUCOnkYAmtSsTOJodcNFzsZID/0qv+7WNt45qsMdRui4
         OvUXwlxh8AltFpml5b+IFABz6AsaNNJDZNzRpDKhhB9kAO0GWYXinCes42PEm7AfEOIB
         u+nR3JmoPmaSsyAWTenMsUpMtUWnXsMAeJq/OiBsW/7xj6vp5iHK1ZH6tdZIEAkB1u2w
         H9ctSLcOYq9hBHVX49CySoDbfH2nss9AiIkjBskCf9y2YwuIGiVR+PRGfVAOfLLwJ0pg
         4QP9w0DH+CEuhPkFNjFnAunbOUht8klZKtijGAU6Bj95z7g/rzAHFuqPBr2wmyb+kUiR
         jWaA==
X-Gm-Message-State: ANhLgQ3lGlvR1eOCcW8l0V0Oh8kp1J6eFr9cHScbygTF1e4g6x3CJgTV
	q/d0CRvuGoqaiokwC1oxxrnZuz94
X-Google-Smtp-Source: ADFU+vt7cXndHJxG7snUWiWC3JPyTuihEFjsZc8RKIG2yohbPG6dB2piWK5zNL3pvH+GHvBU31lUow==
X-Received: by 2002:a7b:cd13:: with SMTP id f19mr911286wmj.10.1583965143858;
        Wed, 11 Mar 2020 15:19:03 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:03 -0700 (PDT)
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
Subject: [PATCH v8 00/18] Add Allwinner H3 SoC and Orange Pi PC Machine
Date: Wed, 11 Mar 2020 23:18:36 +0100
Message-Id: <20200311221854.30370-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3uLa7oXFDQW4

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

  https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v8

The followings are currently known issues in this series:

  - RTC date & time is not persistent
  - boot0 custom Allwinner bootloader not yet working
  - Watchdog not yet implemented, affects U-Boot 'reset' and shutdown/reboot
     -> This is part of the existing A10 timer that needs to be generalized first

Looking forward to your review comments. I will do my best
to update the patches where needed.

===== CHANGELOG =====
v8:
 * hw/arm/allwinner-h3.c: use g_autofree for buffer variable in BootROM setup function
 * hw/arm/orangepi.c: use warn_report to give warning to user when overriding SID without H3 SoC prefix

v7: https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg02864.html
    https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v7

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
 hw/arm/allwinner-h3.c                  | 465 +++++++++++++
 hw/arm/cubieboard.c                    |  15 +
 hw/arm/orangepi.c                      | 130 ++++
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
 40 files changed, 5416 insertions(+)
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
