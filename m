Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp601232lfy;
        Fri, 14 Aug 2020 09:42:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj5YgDOrAaa9/kGUyV8lZg5fnl8UN07kJKbLPcHBmoxOrkLT8PKo2MrBETC6RoefmpT/ss
X-Received: by 2002:a25:c68b:: with SMTP id k133mr5029979ybf.491.1597423346058;
        Fri, 14 Aug 2020 09:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597423346; cv=none;
        d=google.com; s=arc-20160816;
        b=mWKoaDsjfXz4L08DQOqxJ6bkDc0sQ2Ame1eXw7wwxPC48eD+WD9KoPxe3kdDQ0Izf7
         H8/DBnQmKPaBESjmoaKTkabyvw/VtgrAgBpvDgNMqUuVDVtKfgqOFVhsG//tAv+O/6aC
         ZbDVZt0HbcfKaUv3dYgYM7CwzN1tp6xUD8ndpdWOAV07mpyl26pi26yHMuPhsk0gSgS1
         p/t+xgGXbW25CL5KbwnwqqvDC8FbyY2Aka3VHiTldghhxuG5liebalFYV6XrHpFDNzbd
         4QoXCEz77uNeLg1Co8DpGPUcW4/YnknnQfbGrE45kR/XmkLG6bhgwNGm7O7PmKqWswKg
         OL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=+KRD7ihJuTfMxHUh2Xl9h6Z1MtH7Mi0HFpkbylrs4Es=;
        b=bkIFu8ny1RsRIM0LsoxWadkWdHzRAGakli+VDJEpS8RmSp/Suio8fRMGm0sp3pN0oU
         F8dkEgvLpd7bfATks1PHZOAE7F2nwR+m7I7fSPmXVBB/TXD9wf20K70UuFNgrnYANy3g
         Py6iFryaxopqVbN2zBuznVZftaYNqgAZw8S6bDonCIm1mxz/qFRAAJmurHkxX8dXGKV8
         95vDSFPk72krBJ+8d9R7/GDwWz62/X3zOuhlalM2VreYoMBqFyrks68sYLxY3LLfnBJJ
         sK8T8YKFlkQGkOWLHLfwdhRS+Vet/VwQAqaQf92BLhd2YpJA4O8GWW/6RMri+VdHKv9H
         +erQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pbuuLfhz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h141si8843720ybg.294.2020.08.14.09.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 09:42:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pbuuLfhz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6cmf-0000Di-9u
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 12:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6clW-0006uG-Jn; Fri, 14 Aug 2020 12:41:15 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6clS-0002cV-UD; Fri, 14 Aug 2020 12:41:14 -0400
Received: by mail-pj1-x1043.google.com with SMTP id kr4so4664919pjb.2;
 Fri, 14 Aug 2020 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+KRD7ihJuTfMxHUh2Xl9h6Z1MtH7Mi0HFpkbylrs4Es=;
 b=pbuuLfhz6VT+CY2YWHw7MLjevxsOOGmcmzhC+EAbwDKV8NO+bo6nKIopUV79UQvrM/
 8cs7ocIX02QpUJSg99BjCcojQ/RfbfHqqjHSGsHlmcaFaU4QiuAK7rE0GJsdhqc8tSlH
 l9wNUaP1lNz0OpUH6c4Vhwql3UZE/9xaoIauE5FynAQCSQPhv6OULPkmhvqskml+a1BN
 cbtT1oQc2tyKyMNQq0T8kJfJTax/wskXlU4LDEv3L1xJKO6hooK3XwkBDrhEYNGd31gE
 VJwxvDFZaUkq8KZR/kpTmV73UP9eSvqFYvJ0XtNXItxn3o8z5vx4BnTU0UfKwXnNHZRs
 679w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+KRD7ihJuTfMxHUh2Xl9h6Z1MtH7Mi0HFpkbylrs4Es=;
 b=Z+FOXpgbL6MEFsHqxazfPOp0PD4lFUf+9eA4GQTuznC9hw8+Q7XcDlrueOazkC5KAu
 h4gx7uYtjD/b9Tj9MaAsWKwoCLu47gdybdalLHTYzgxF9huIXbca2LoPJQ3713ZOBcSD
 CPFWJjqgkuhe0e/fOn/0Oat6/WM1jpXbfJhPJCLBCnJeWBcdn7M1MdtGAiBQyBfQUYVE
 8+piJMCnq0AbvLZfE6IONM9fj0VIDqPHRHyUxscS45WHm5WJZ5TI9Lu2EsB2XZRXKmu9
 tpaa/jTt0aDYS29rc0GqZewrU5LP4YVDhYKbqsF8mSaSpbsU9uTEe5mQ7/Eau97xZYEW
 LLtQ==
X-Gm-Message-State: AOAM531cT4Ji+WxYjmrk+VXvPE5q6meXSAOQWYKHWXRUorCm+Wzqq5/P
 mSrDoeknU10xDKEE78sYPhE=
X-Received: by 2002:a17:90b:1254:: with SMTP id
 gx20mr3116424pjb.117.1597423267836; 
 Fri, 14 Aug 2020 09:41:07 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id 16sm9836332pfi.161.2020.08.14.09.41.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:41:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 00/18] hw/riscv: Add Microchip PolarFire SoC Icicle Kit board
 support
Date: Sat, 15 Aug 2020 00:40:38 +0800
Message-Id: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-block@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eEHqTOYmAUB0

From: Bin Meng <bin.meng@windriver.com>

This adds support for Microchip PolarFire SoC Icicle Kit board.
The Icicle Kit board integrates a PolarFire SoC, with one SiFive's
E51 plus four U54 cores and many on-chip peripherals and an FPGA.

For more details about Microchip PolarFire Soc, please see:
https://www.microsemi.com/product-directory/soc-fpgas/5498-polarfire-soc-fpga

The Icicle Kit board information can be found here:
https://www.microsemi.com/existing-parts/parts/152514

Unlike SiFive FU540, the RISC-V core resect vector is at 0x20220000.
The RISC-V CPU and HART codes has been updated to set the core's
reset vector based on a configurable property from machine codes.

The following perepherals are created as an unimplemented device:

- Bus Error Uint 0/1/2/3/4
- L2 cache controller
- SYSREG
- MPUCFG
- IOSCBCFG
- GPIO

The following perepherals are emulated:
- SiFive CLINT
- SiFive PLIC
- PolarFire SoC Multi-Mode UART
- PolarFire SoC DMA
- Cadence eMMC/SDHCI controller
- Cadence Gigabit Ethernet MAC

Some bugs in the SD card codes are fixed during the development.

The BIOS image used by this machine is hss.bin, aka Hart Software
Services, which can be built from:
https://github.com/polarfire-soc/hart-software-services

To launch this machine:
$ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
    -bios path/to/hss.bin -sd path/to/sdcard.img \
    -nic tap,ifname=tap,script=no,model=cadence_gem \
    -display none -serial stdio \
    -chardev socket,id=serial1,path=serial1.sock,server,wait \
    -serial chardev:serial1

The memory is set to 1 GiB by default to match the hardware.
A sanity check on ram size is performed in the machine init routine
to prompt user to increase the RAM size to > 1 GiB when less than
1 GiB ram is detected.

HSS output is on the first serial port (stdio) and U-Boot/Linux
outputs on the 2nd serial port. OpenSBI outputs on a random serial
port due to the lottery mechanism used during the multi-core boot.


Bin Meng (18):
  target/riscv: cpu: Add a new 'resetvec' property
  hw/riscv: hart: Add a new 'resetvec' property
  target/riscv: cpu: Set reset vector based on the configured property
    value
  hw/riscv: Initial support for Microchip PolarFire SoC Icicle Kit board
  hw/char: Add Microchip PolarFire SoC MMUART emulation
  hw/riscv: microchip_pfsoc: Connect 5 MMUARTs
  hw/sd: sd: Fix incorrect populated function switch status data
    structure
  hw/sd: sd: Correctly set the high capacity bit
  hw/sd: sdhci: Make sdhci_poweron_reset() internal visible
  hw/sd: Add Cadence SDHCI emulation
  hw/riscv: microchip_pfsoc: Connect a Cadence SDHCI controller and an
    SD card
  hw/dma: Add Microchip PolarFire Soc DMA controller emulation
  hw/riscv: microchip_pfsoc: Connect a DMA controller
  hw/net: cadence_gem: Add a new 'phy-addr' property
  hw/riscv: microchip_pfsoc: Connect 2 Cadence GEMs
  hw/riscv: microchip_pfsoc: Hook GPIO controllers
  hw/riscv: clint: Avoid using hard-coded timebase frequency
  hw/riscv: microchip_pfsoc: Document the software used for testing

 MAINTAINERS                         |  11 +
 default-configs/riscv64-softmmu.mak |   1 +
 hw/char/Kconfig                     |   3 +
 hw/char/Makefile.objs               |   1 +
 hw/char/mchp_pfsoc_mmuart.c         |  82 +++++++
 hw/dma/Kconfig                      |   3 +
 hw/dma/Makefile.objs                |   1 +
 hw/dma/mchp_pfsoc_dma.c             | 322 +++++++++++++++++++++++++
 hw/net/cadence_gem.c                |   7 +-
 hw/riscv/Kconfig                    |   9 +
 hw/riscv/Makefile.objs              |   1 +
 hw/riscv/microchip_pfsoc.c          | 456 ++++++++++++++++++++++++++++++++++++
 hw/riscv/opentitan.c                |   1 +
 hw/riscv/riscv_hart.c               |   3 +
 hw/riscv/sifive_clint.c             |  25 +-
 hw/riscv/sifive_e.c                 |   4 +-
 hw/riscv/sifive_u.c                 |   5 +-
 hw/riscv/spike.c                    |   2 +-
 hw/riscv/virt.c                     |   3 +-
 hw/sd/Kconfig                       |   4 +
 hw/sd/Makefile.objs                 |   1 +
 hw/sd/cadence_sdhci.c               | 162 +++++++++++++
 hw/sd/sd.c                          |   8 +-
 hw/sd/sdhci-internal.h              |   1 +
 hw/sd/sdhci.c                       |   2 +-
 include/hw/char/mchp_pfsoc_mmuart.h |  61 +++++
 include/hw/dma/mchp_pfsoc_dma.h     |  57 +++++
 include/hw/net/cadence_gem.h        |   2 +
 include/hw/riscv/microchip_pfsoc.h  | 125 ++++++++++
 include/hw/riscv/riscv_hart.h       |   1 +
 include/hw/riscv/sifive_clint.h     |   3 +-
 include/hw/sd/cadence_sdhci.h       |  65 +++++
 target/riscv/cpu.c                  |   8 +-
 target/riscv/cpu.h                  |   7 +-
 target/riscv/cpu_helper.c           |   4 +-
 target/riscv/csr.c                  |   4 +-
 36 files changed, 1424 insertions(+), 31 deletions(-)
 create mode 100644 hw/char/mchp_pfsoc_mmuart.c
 create mode 100644 hw/dma/mchp_pfsoc_dma.c
 create mode 100644 hw/riscv/microchip_pfsoc.c
 create mode 100644 hw/sd/cadence_sdhci.c
 create mode 100644 include/hw/char/mchp_pfsoc_mmuart.h
 create mode 100644 include/hw/dma/mchp_pfsoc_dma.h
 create mode 100644 include/hw/riscv/microchip_pfsoc.h
 create mode 100644 include/hw/sd/cadence_sdhci.h

-- 
2.7.4

