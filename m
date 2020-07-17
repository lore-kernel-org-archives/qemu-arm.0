Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2144263lfm;
        Thu, 16 Jul 2020 23:03:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQcfXnZRexXYO4q3/KdacZi4+ybz5LwcP7RbT+JbTqZ8ybYqHMO09VtnbA3loBKOpGGh1R
X-Received: by 2002:a5b:4c5:: with SMTP id u5mr11545294ybp.500.1594965803506;
        Thu, 16 Jul 2020 23:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594965803; cv=none;
        d=google.com; s=arc-20160816;
        b=FOLptD/VqhYuh789K1IMTtQbu3RmqW9wBT3jplMFlLJaDs3Qg0i9K4VlV3epuunKRx
         sZ24gVLCKs4kkV50LPgL5vcyzVa29T9Jpn7oA9db0PpzbIstFlBq4LtvoDlmFNeE5t8T
         TFc2p7iNb9IJKnDumbIA0Cz2RB0bmc0zJUzgBFH9QRFrSyOIU6Sy149AlcGLHLVNOTJB
         PHTsm83bUTUkt7C0vR1J0YMWNWHcWIREAuVKVxWmTvGq/RV0aPMnpKkWnPGsTyR9xsbO
         XT93kKwvqhri2j3Fp2WrZIHcwQ8x8NYWGR9cPMRaAnIYTzz/520pApP2Q1OHVIUzJehP
         FZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:mime-version:message-id:date:dkim-signature;
        bh=Fwosz8kLRkDiQhryGgpr4QRGBbidK4SneoP+tig4sng=;
        b=vmhq2jV9e2fg6CnXt87Ukr6Imsq1K076IbfvPASHcoeujeQ0E+mhjXMWTS4kk9G26u
         9zW3FEcx4EsVzzREAchmmqLb1ak1UghiHufApkrs7tNUke6s+tsHwk2LRZ9nxOF5UbQN
         h3sWE/IEkcTBoKL1yf2pwX+CynF5YIEbk+Pu+pAZyZ2vNS+ef/bfKg7CxCjuXkQpO6DZ
         +EC1mozzPRAupZOhqnFfd5zquP/+cX12/TKSGp4p8Ckvutfp6zvsYO90AHFhv5AmAleo
         5VDK0M8jxeR+je7OMlqtMLKnxIyRCsqhYrKw2KDlSX+fSCfKvxgvu/IB7lXKU8ZQaRbH
         SrbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=bvcw8job;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u97si7914581ybi.114.2020.07.16.23.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 23:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=bvcw8job;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwJSs-0003Ez-Pl
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 02:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Hj8RXwsKCN8ITLJOOFNPFOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--hskinnemoen.bounces.google.com>)
 id 1jwJSk-0003Ea-GC
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 02:03:14 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:34279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Hj8RXwsKCN8ITLJOOFNPFOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--hskinnemoen.bounces.google.com>)
 id 1jwJSi-0005AK-7S
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 02:03:14 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id z7so10168033ybz.1
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2020 23:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=Fwosz8kLRkDiQhryGgpr4QRGBbidK4SneoP+tig4sng=;
 b=bvcw8jobFKrwBkCKNugGqIJUUAFFaGszm8bVVx88SiJ85zV1NKpidSNc8AAF83T1Ok
 1fp4QJ7/oi3+Fp/XZVVTffQzGLGeXWYNJ+cqho54tJaSVywCBpVDavLyaG6R8RS5oxtv
 WabRdoXhU4nNkeLzTZ7eBuwsGqjqrhICnnYkUoadItZ3CaUk7/AjH4IVnvPCX7f2qC51
 XKs4EuT8jc+wKzLowWDucHbbI2i5xYEUWReurZyKHsDKSKdYBDiScbyxbT5cuivQBLGd
 +cWNh6rbKYZvm+wRRdBiF8SXbt7k8c0rL8FpJpPCjix/RJv5wLnCPpMVbg3JFooXKlkM
 2dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=Fwosz8kLRkDiQhryGgpr4QRGBbidK4SneoP+tig4sng=;
 b=Dv/VezDnG3drgtg4H8kBqs5oiNrGDoxME4mw3hgyGnbgC0fXvyVPHPcxcBEiSMBps6
 pi6YS42TNB0i71op4V3btnn6kzWfwVV4bZojhQy83py2TGfS8OxsH64ffCWgF3NQqwGK
 4hyS3r2otieDRHliOwC0U/OYmOigUxAq5PCVqMV/SP+Z84wkO/fVK30b+sIQzicboMKd
 kZPI54NpSSrI5CsB4I3Uv5KBJVLcPOn6PT9xiqip/bQRGCjf37o7CTp6Fm2I8ZVgQUgz
 c6n7wckoJHuglLcwAGB3wk2+tw4HLd+IoAJFv2ernTMmnaRBWK3CCHD9Yw3DiYBxTipS
 G/+g==
X-Gm-Message-State: AOAM531D51Bu53dBvmI9dSzFyCg/wkho5Uc89NthRBAigrycsm+BoA0+
 K0QzffBf0xL/7j6wQwcZFQ5ZdhS7WdGsc38Ucg==
X-Received: by 2002:a25:d843:: with SMTP id p64mr13026140ybg.68.1594965790330; 
 Thu, 16 Jul 2020 23:03:10 -0700 (PDT)
Date: Thu, 16 Jul 2020 23:02:45 -0700
Message-Id: <20200717060258.1602319-1-hskinnemoen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v6 00/13] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC machines
From: Havard Skinnemoen <hskinnemoen@google.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3Hj8RXwsKCN8ITLJOOFNPFOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LCJvJU2OtkdO

I also pushed this and the previous two patchsets to my qemu fork on github=
.
The branches are named npcm7xx-v[1-6].

  https://github.com/hskinnemoen/qemu

This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs to =
boot
an OpenBMC image built for quanta-gsj. This includes device models for:

  - Global Configuration Registers
  - Clock Control
  - Timers
  - Fuses
  - Memory Controller
  - Flash Controller

These modules, along with the existing Cortex A9 CPU cores and built-in
peripherals, are integrated into a NPCM730 or NPCM750 SoC, which in turn fo=
rm
the foundation for the quanta-gsj and npcm750-evb machines, respectively. T=
he
two SoCs are very similar; the only difference is that NPCM730 is missing s=
ome
peripherals that NPCM750 has, and which are not considered essential for
datacenter use (e.g. graphics controllers). For more information, see

https://www.nuvoton.com/products/cloud-computing/ibmc/

Both quanta-gsj and npcm750-evb correspond to real boards supported by Open=
BMC.
At the end of the series, qemu can boot an OpenBMC image built for one of t=
hese
boards with some minor modifications.

The patches in this series were developed by Google and reviewed by Nuvoton=
. We
will be maintaining the machine and peripheral support together.

The data sheet for these SoCs is not generally available. Please let me kno=
w if
more comments are needed to understand the device behavior.

Changes since v5:

  - Boot ROM included, as a git submodule and a binary blob, and loaded by
    default, so the -bios option is usually not necessary anymore.
  - Two acceptance tests added (openbmc image boot, and direct kernel boot)=
.
  - npcm7xx_load_kernel() moved to SoC code.
  - NPCM7XX_TIMER_REF_HZ definition moved to CLK header.
  - Comments added clarifying available SPI flash chip selects.
  - Error handling adjustments:
      - Errors from CPU and GCR realization are propagated through the SoC
        since they may be triggered by user-configurable parameters.
      - Machine init uses error_fatal instead of error_abort for SoC
        realization flash init. This makes error messages more helpful.
      - Comments added to indicate whether peripherals may fail to realize.
      - Use ERRP_GUARD() instead of Error *err when possible.
  - Default CPU type is now set, and attempting to set it to anything else
    will fail.
  - Format string fixes (use HWADDR_PRIx, etc.)
  - Simplified memory size encoding and error checking in npcm7xx_gcr.
  - Encapsulate non-obvious pointer subtraction into helper functions in th=
e
    FIU and TIMER modules.
  - Incorporate review feedback into the FIU module:
      - Add select/deselect trace events.
      - Use npcm7xx_fiu_{de,}select() consistently.
      - Use extract/deposit in more places for consistency.
      - Use -Wimplicit-fallthrough compatible fallthrough comments.
      - Use qdev_init_gpio_out_named instead of sysbus_init_irq for chip
        selects.
  - Incorporate review feedback into the TIMER module:
      - Assert that we never pause a timer that has already expired, instea=
d of
        trying to handle it. This should be safe since QEMU_CLOCK_VIRTUAL i=
s
        stopped while this code is running.
      - Simplify the switch blocks in the read and write handlers.

I made a change to error out if a flash drive was not specified, but revert=
ed
it because it caused make check to fail (qom-test). When specifying a NULL
block device, the m25p flash device initializes its in-memory storage with =
0xff
and doesn't attempt to write anything back. This seems correct to me.

Changes since v4:

  - OTP cleanups suggested by Philippe Mathieu-Daud=C3=A9.
      - Added fuse array definitions based on public Nuvoton bootblock code=
.
      - Moved class structure to .c file since it's only used internally.
      - Readability improvements.
  - Split the first patch and folded parts of it into three other patches s=
o
    that CONFIG_NPCM7XX is only enabled after the initial NPCM7xx machine
    support is added.
  - DRAM init moved to machine init code.
  - Consistently use lower-case hex literals.
  - Switched to fine-grained unimplemented devices, based on public bootblo=
ck
    source code. Added a tiny SRAM that got left out previously.
  - Simplified error handling in npcm7xx_realize() since the board code wil=
l
    abort anyway, and SoCs are not hot-pluggable.

Changes since v3:

  - License headers are now GPL v2-or-later throughout.
  - Added vmstate throughout (except the memory controller, which doesn't
    really have any state worth saving). Successfully booted a gsj image
    with two stop/savevm/quit/loadvm cycles along the way.
      - JFFS2 really doesn't like it if I let qemu keep running after savev=
m,
        and then jump back in time with loadvm. I assume this is expected.
  - Fixed an error API violation in npcm7xx_realize, removed pointless erro=
r
    check after object_property_set_link().
  - Switched the OTP device to use an embedded array instead of a g_malloc0=
'd
    one because I couldn't figure out how to set up vmstate for the latter.

Changes since v2:

  - Simplified the MAINTAINERS entry.
  - Added link to OpenPOWER jenkins for gsj BMC images.
  - Reverted the smpboot change, back to byte swapping.
  - Adapted to upstream API changes:
      - sysbus_init_child_obj -> object_initialize_child
      - object_property_set_bool -> qdev_realize / sysbus_realize
      - ssi_create_slave_no_init -> qdev_new
      - qdev_init_nofail -> qdev_realize_and_unref
      - ssi_auto_connect_slaves removed
  - Moved Boot ROM loading from soc to machine init.
  - Plumbed power-on-straps property from GCR to the machine init code so i=
t
    can be properly initialized. Turns out npcm750 memory init doesn't work
    without this. npcm730 is fine either way, though I'm not sure why.
  - Reworked the flash init code so it looks more like aspeed (i.e. the fla=
sh
    device gets added even if there's no drive).

Changes since v1 (requested by reviewers):

  - Clarify the source of CLK reset values.
  - Made smpboot a constant byte array, eliinated byte swapping.
  - NPCM7xxState now stores an array of ARMCPUs, not pointers to ARMCPUs.
  - Clarify why EL3 is disabled.
  - Introduce NPCM7XX_NUM_IRQ constant.
  - Set the number of CPUs according to SoC variant, and disallow command l=
ine
    overrides (i.e. you can no longer override the number of CPUs with the =
-smp
    parameter). This is trying to follow the spirit of
    https://patchwork.kernel.org/patch/11595407/.
  - Switch register operations to DEVICE_LITTLE_ENDIAN throughout.
  - Machine documentation added (new patch).

Changes since v1 to support flash booting:

  - GCR reset value changes to get past memory initialization when booting
    from flash (patches 2 and 5):
      - INTCR2 now indicates that the DDR controller is initialized.
      - INTCR3 is initialized according to DDR memory size. A realize()
	method was implemented to achieve this.
  - Refactor the machine initialization a bit to make it easier to drop in
    machine-specific flash initialization (patch 6).
  - Extend the series with additional patches to enable booting from flash:
      - Boot ROM (through the -bios option).
      - OTP (fuse) controller.
      - Memory Controller stub (just enough to skip memory training).
      - Flash controller.
      - Board-specific flash initialization.

Thanks for reviewing,

Havard

Havard Skinnemoen (13):
  hw/misc: Add NPCM7xx System Global Control Registers device model
  hw/misc: Add NPCM7xx Clock Controller device model
  hw/timer: Add NPCM7xx Timer device model
  hw/arm: Add NPCM730 and NPCM750 SoC models
  hw/arm: Add two NPCM7xx-based machines
  roms: Add virtual Boot ROM for NPCM7xx SoCs
  hw/arm: Load -bios image as a boot ROM for npcm7xx
  hw/nvram: NPCM7xx OTP device model
  hw/mem: Stubbed out NPCM7xx Memory Controller model
  hw/ssi: NPCM7xx Flash Interface Unit device model
  hw/arm: Wire up BMC boot flash for npcm750-evb and quanta-gsj
  docs/system: Add Nuvoton machine documentation
  tests/acceptance: console boot tests for quanta-gsj

 docs/system/arm/nuvoton.rst            |  90 +++++
 docs/system/target-arm.rst             |   1 +
 Makefile                               |   1 +
 default-configs/arm-softmmu.mak        |   1 +
 include/hw/arm/npcm7xx.h               | 111 +++++
 include/hw/mem/npcm7xx_mc.h            |  36 ++
 include/hw/misc/npcm7xx_clk.h          |  72 ++++
 include/hw/misc/npcm7xx_gcr.h          |  76 ++++
 include/hw/nvram/npcm7xx_otp.h         |  88 ++++
 include/hw/ssi/npcm7xx_fiu.h           | 100 +++++
 include/hw/timer/npcm7xx_timer.h       |  96 +++++
 hw/arm/npcm7xx.c                       | 500 +++++++++++++++++++++++
 hw/arm/npcm7xx_boards.c                | 195 +++++++++
 hw/mem/npcm7xx_mc.c                    |  84 ++++
 hw/misc/npcm7xx_clk.c                  | 234 +++++++++++
 hw/misc/npcm7xx_gcr.c                  | 227 +++++++++++
 hw/nvram/npcm7xx_otp.c                 | 424 +++++++++++++++++++
 hw/ssi/npcm7xx_fiu.c                   | 539 +++++++++++++++++++++++++
 hw/timer/npcm7xx_timer.c               | 489 ++++++++++++++++++++++
 .gitmodules                            |   3 +
 MAINTAINERS                            |   8 +
 hw/arm/Kconfig                         |   9 +
 hw/arm/Makefile.objs                   |   1 +
 hw/mem/Makefile.objs                   |   1 +
 hw/misc/Makefile.objs                  |   2 +
 hw/misc/trace-events                   |   8 +
 hw/nvram/Makefile.objs                 |   1 +
 hw/ssi/Makefile.objs                   |   1 +
 hw/ssi/trace-events                    |  11 +
 hw/timer/Makefile.objs                 |   1 +
 hw/timer/trace-events                  |   5 +
 pc-bios/npcm7xx_bootrom.bin            | Bin 0 -> 768 bytes
 roms/Makefile                          |   7 +
 roms/vbootrom                          |   1 +
 tests/acceptance/boot_linux_console.py |  65 +++
 35 files changed, 3488 insertions(+)
 create mode 100644 docs/system/arm/nuvoton.rst
 create mode 100644 include/hw/arm/npcm7xx.h
 create mode 100644 include/hw/mem/npcm7xx_mc.h
 create mode 100644 include/hw/misc/npcm7xx_clk.h
 create mode 100644 include/hw/misc/npcm7xx_gcr.h
 create mode 100644 include/hw/nvram/npcm7xx_otp.h
 create mode 100644 include/hw/ssi/npcm7xx_fiu.h
 create mode 100644 include/hw/timer/npcm7xx_timer.h
 create mode 100644 hw/arm/npcm7xx.c
 create mode 100644 hw/arm/npcm7xx_boards.c
 create mode 100644 hw/mem/npcm7xx_mc.c
 create mode 100644 hw/misc/npcm7xx_clk.c
 create mode 100644 hw/misc/npcm7xx_gcr.c
 create mode 100644 hw/nvram/npcm7xx_otp.c
 create mode 100644 hw/ssi/npcm7xx_fiu.c
 create mode 100644 hw/timer/npcm7xx_timer.c
 create mode 100644 pc-bios/npcm7xx_bootrom.bin
 create mode 160000 roms/vbootrom

--=20
2.28.0.rc0.105.gf9edc3c819-goog

