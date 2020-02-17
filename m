Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518530lfp;
        Mon, 17 Feb 2020 15:24:27 -0800 (PST)
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr1277118wmj.133.1581981866943;
        Mon, 17 Feb 2020 15:24:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981866; cv=none;
        d=google.com; s=arc-20160816;
        b=XudxPO8ELC/QPZ3E05odQ479wyyvZMFp4s+/w89UWrTh/A5LiBhaH+eRJhdqBUk5SJ
         pu0ditY6iYSiUV0lIX0d9WxOLUlb2ezs8mnYqt9c4x3A3U7R/V02WnFFuYAFo0si7mQL
         F4/Pfo2+LZpaYARYksncUM5pd1WebXhdMFs0tksuGGs2Sh+1vyukggdMwD9kuHNgPwVz
         ompDvsgEGnFsn35VeFPCLlRw1e8dzbQUwHhjasAmUtrWTQ/2uzI4hK4jm1Jpt6z0GTrp
         1SWL39VOv9tmvWZ7o+KZnSD/jUC+ROj6TDfd5QIgxLoZ86LU9ZRg588fhC8SPxsayO8W
         pQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=b3b7kBz00LpGCYA81YDLxYiAvamTgoNcDsjIy7fcIFk=;
        b=U/4QpTlKUzIPREzHyVxG51xSwV0jcyLI13bWoNFrfDoiCKeVZZ9WeuGwfSz7vwajl3
         Wg7ptQxITQqge2bBUh643uC+wdNBBqoPYC79o/DaV3omh0JKui2CLhTf2HLVKliAftZS
         JHeme0621hPztRB/2q9VCBGvbg+Npb2/HHly6R03T7xm5WASeseM1f4uqWcEDJcRHRKD
         SwL1MNexzdxva6MBvFg33udm8iRhyYjRnnz6IvFJJOzacEOMZwFGli/eB5zLFmEksiOp
         NISVR9hPAQ5Y1wTwuMnLsjwTblBKxAOMRaouiNEWP5ZbeWPilelR9A2cnbQ09zymYwFu
         +8mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TZGkiWkk;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h5sor1325192wrv.64.2020.02.17.15.24.26
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:26 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=TZGkiWkk;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3b7kBz00LpGCYA81YDLxYiAvamTgoNcDsjIy7fcIFk=;
        b=TZGkiWkkvv6mUJEciJzw5v3xmVLy68FEegTnf9PPuCa9F4b5N9Ux9Islqrqk3TKo2p
         2f5WBo7ErAIgTLNrqzWS8dZC31gCl/u5b5G9BfKT2ItF3I7LbPrzzxKqupICNkeTZxi+
         elPDV2J0EUAjYnamufpL4x9S84qEiHz2iYF+uc8b6oZRlbDoLjkU8o58KKfEfH3ZoiEL
         JS1uRHSVCiP4jozVLdTituP3QKi/ih3WzA5kyuTY9GBofwz9C8SwHEirSyizxeHaob7p
         pak1m+pUg2wFvx079bFOHW7MKVOi4BphvP8zNSWfufykqbPYXSBujK3yWjc6uT7ORrsZ
         QpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3b7kBz00LpGCYA81YDLxYiAvamTgoNcDsjIy7fcIFk=;
        b=WRVUuXCP3wciPDy9iNIE0PWruTeCURNO8oPjAqMCJE5UbAHRM+OGchkzxN0EVR/VOx
         Fv81Jxs6Vksj9/5jlx/s/ElA0xOj/YG2hHQnip9nBrMgp/ihYLCnu/91MYXNK2S/Er7g
         0+pot9jaxc4IFvbwe/ihQrQlIEv64l5a9pYkFoYCMwaTAGnY6KaenXsm8mTle5ayFZPv
         hg/QPHu+lgZyujj1XbG7EThZYmPxJWBqaItebLDTirwdUkAKPXHh609kKbLGvLdrxp0b
         el7PFzfiTIRMSwXHEzTBCxk/bB5fLfe5ZCZS8FmU/+4zGfrE4o/lyj3FbrAHbdtYdw1A
         bJRA==
X-Gm-Message-State: APjAAAUZgAJu8DLM8cZZ8YgqPppF729yndS8mpKl727Owuijmu+Kz0Su
	lP1B83vLSi+TQzhe5jIu1m0=
X-Google-Smtp-Source: APXvYqzM6yaY5PSwwJVYgeXICAjUxHuDmWfArtxgn40ZNi0wLS8TnPVy370UH7NyyCtzCfwPObhPiQ==
X-Received: by 2002:adf:f986:: with SMTP id f6mr25443065wrr.182.1581981866440;
        Mon, 17 Feb 2020 15:24:26 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:25 -0800 (PST)
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
Subject: [PATCH v5 00/18] Add Allwinner H3 SoC and Orange Pi PC Machine
Date: Tue, 18 Feb 2020 00:23:53 +0100
Message-Id: <20200217232411.30096-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /KYFrRf9+nWC

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
 * EMAC ethernet connectivity
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

  https://github.com/nieklinnenbank/qemu/tree/allwinner-h3-v5

The followings are currently known issues in this series:

  - RTC date & time is not persistent
  - boot0 custom Allwinner bootloader not yet working
  - Watchdog not yet implemented, affects U-Boot 'reset' and shutdown/reboot
     -> This is part of the existing A10 timer that needs to be generalized first

Looking forward to your review comments. I will do my best
to update the patches where needed.

===== CHANGELOG =====
v5:
 * hw/arm/allwinner-h3.c: correct comment for dc->user_creatable = false
 * hw/arm/allwinner-h3.c: rename usb[0-3] to usb[0-3]-phy in unimplemented array
 * hw/arm/allwinner-h3.c: remove unneeded check for rom_size > blk_size in bootrom_setup()
 * hw/arm/allwinner-h3.c: remove errp parameter and directl use error_fatal in bootrom_setup()
 * hw/arm/Kconfig: add USB_OHCI, USB_EHCI_SYSBUS, SD to ALLWINNER_H3 item (for --without-default-devices)
 * hw/misc/allwinner-cpucfg.c: add entry_addr to VMState for migration
 * hw/misc/allwinner-sid.c: add identifier to VMState for migration
 * hw/misc/allwinner-sid.c: use ldl_be_p() to set rdkey value
 * hw/arm/orangepi.c: add comment about always using a default fixed SID identifier
 * hw/arm/orangepi.c: add check for SID identifier override, to allow -global override by the user
 * hw/arm/orangepi.c: print warning if SID identifier does not include H3 prefix
 * hw/arm/orangepi.c: move 1GiB RAM check between checks for BIOS and CPU type
 * include/hw/misc/allwinner-h3-ccu.h: rename AW_H3_CCU_REGS_MAXADDR to AW_H3_CCU_IOSIZE with value 0x400
 * hw/misc/allwinner-h3-ccu.c: use AW_H3_CCU_IOSIZE with range in switch(offset) in read/write
 * hw/rtc/allwinner-rtc.c: add 'base-year' property in AwRtcState (replaces previous year_offset)
 * hw/sd/allwinner-sdhost.c: set AUTOCMD interrupt flag in auto_stop() function only
 * hw/sd/allwinner-sdhost.c: set SDIO_INTR and INT_SUMMARY interrupt flags in dma() function
 * docs/orangepi.rst: add machine options section, which documents available machine/device specific properties
 * docs/orangepi.rst: updated NetBSD 9 instructions with new image URL, -global options and extend SD image command
 * hw/*/allwinner*.c: use device_class_set_props() to set DeviceClass properties
 * tests/acceptance/boot_linux_console.py: add check for 7z program using avocado's find_command()
 * tests/acceptance/boot_linux_console.py: adapt NetBSD test to use NetBSD 9.0 final release
 * tests/acceptance/boot_linux_console.py: adapt NetBSD test to use -global allwinner-rtc.base-year=2000

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
 hw/arm/orangepi.c                      | 134 ++++
 hw/misc/allwinner-cpucfg.c             | 270 ++++++++
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
 39 files changed, 5374 insertions(+)
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
