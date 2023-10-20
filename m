Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1196418ejb;
        Fri, 20 Oct 2023 05:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9+PqHfKRx6jpjH0mO/jKXwUTQuARZDQ8bK3SJF4REhrE+MNLCYNSxM54tOhTpK8AP9fSD
X-Received: by 2002:a05:620a:2954:b0:777:68cb:9bd4 with SMTP id n20-20020a05620a295400b0077768cb9bd4mr1974976qkp.12.1697806359257;
        Fri, 20 Oct 2023 05:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697806359; cv=none;
        d=google.com; s=arc-20160816;
        b=IwOaibRQtd3vq0msqsev4BtbJmFEx3NaEl/FlRm/4jdm+r8608E2BzZ/sKdESLXZDu
         2C2lSjsumwWnvmDyngYnS3tHbbm1TCsLIqmMZqgDONbqKXxT6+fHp9lWGL10E5eRPo1U
         VKKIsNI/kjJ6+J48vnATkkIKKZhmdO1hiN85wZGgxE8luD6u/82iaKIpHEMr44T+d5VW
         /dG1rVQn1zWBNgs/BwZh0IcZAhRQwW6CUydmEGZKwdthFr8LNsCapAihTF5BSslN+ldT
         HSfJKU7/W6kq/RzGUcxBG+o43k7yuAupG4TBg/+Z0L6Wpmm2KZMp7p1Lk3CULVzdFTOn
         qa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gYmPpzQA1T4+jV1Iq/uP90fTMzDqIz3ufunNBzeO2wg=;
        fh=4pe3guiFRMn/NLMia8z8VAitsBT8GnpzdI1z5EX6kPM=;
        b=vMJpLTVJdY1Mct4lOSkCIMEhGPnIhgpRF3mBwjV10XitnHtWCrCtT+ondm4NePVZWb
         FnS+CkGxqTCad5zHumv3uQRjJqlW+MMzF8LoQMDJIeJ931t4S/L22SbQjZrhIu3sioAM
         mYvOtKqfEUTnKZNsKQnQkgW69quT0ZHJbG+5WIdrbaTcSJrHPE1c9J3eeHXO83RWA94y
         8/dkftllrCZUJRDx92gvs7b8+RlA8+uCCuSSR8CjpBGjwzFaJhDqtDx1I2p0mzsOs+id
         m9HYLDJEI8/VfKM5UlAsGuMGw87+jGn+Re/BDlMaYT3W2hKepGED34NfiWfJqA8qnrl7
         8bUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ci1LNt/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05620a214700b00775cab41eaasi1200924qkm.462.2023.10.20.05.52.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 05:52:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ci1LNt/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtozB-0001SJ-PE; Fri, 20 Oct 2023 08:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtoz9-0001EV-F9
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 08:52:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtoz7-0001F2-9q
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 08:52:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32dbbf3c782so1154884f8f.1
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697806329; x=1698411129; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gYmPpzQA1T4+jV1Iq/uP90fTMzDqIz3ufunNBzeO2wg=;
 b=ci1LNt/gTdNT1MjlVBktBs4S1NvNOAToCbM9FHWDZbuzqxOrHmSdGF0NVAqWAvAdcz
 nm1CDzlbm4R9in4cgSB+cgRKQEnuqKJpmRNUd9pL8AIR9VLJ5MAv6HPSB5xVuRGL7j1P
 SwtNNgUt4WQ1iA3ouMskT1Vtv1V9UrsCUiKzfqZxzrEz6ek4+8VK2cy3fE37ytiaDDsf
 WIHM5/fngi6GxL3+LWIFzOGHZEVKLo1j7UIXgHrxmJ3pEFis/oEg6UtYL3uec5x6Xycb
 JkOPU9XYo+tfNt3TGAsqmD11GIEWrmBuK7VQmEx55R9UwTwqvgW333NMKXwxewUDEglu
 io4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697806329; x=1698411129;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gYmPpzQA1T4+jV1Iq/uP90fTMzDqIz3ufunNBzeO2wg=;
 b=XWI2JZrMaYX/tvI2yAy8DKp0XRtFn5Iji+jUnCj2pd+Nf5A5iNSfI9ESc41bIQ7NcA
 FDG61yE3WBbLYy1wdg81fSr7BdV2BR29SsCGF0kI+NcpMacRuORQx9WRe3BlkOsLCkV7
 Ff6cfxvm37ST8EuNjeP2pdns8atT6Yqso+usXh0fG4pMSx+mHCiCDklUQjdjgklaO5Tj
 4n+Jgl1D5x8sBKutDIzrS/03sxlLMo/iGRairT+PVmzm598ZpyFYFWbO4ZoCx3dyzjBM
 jwK0cdvC+rEH1vxQ0k3yoYq7V943Y50V6NVRiCUqUKGaxpaPOSd1YQrS5cLMWhKl7nsd
 63MQ==
X-Gm-Message-State: AOJu0Ywa5hvD6v/Bn2caJXYYDGx7lIS9BAxJPFKemctmQB/mV4en0Ibr
 DV3WCtuGIZi9ZBYJQtE0/zHk5w==
X-Received: by 2002:a5d:46c9:0:b0:32d:de87:1085 with SMTP id
 g9-20020a5d46c9000000b0032dde871085mr4509571wrs.10.1697806329477; 
 Fri, 20 Oct 2023 05:52:09 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b003fbe4cecc3bsm6968035wmo.16.2023.10.20.05.52.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 05:52:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: 
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 00/46] Misc HW/UI patches for 2023-10-19
Date: Fri, 20 Oct 2023 14:51:47 +0200
Message-ID: <20231020125201.49361-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U94afUjdN0r6

The following changes since commit 0d239e513e0117e66fa739fb71a43b9383a108ff:

  Merge tag 'pull-lu-20231018' of https://gitlab.com/rth7680/qemu into staging (2023-10-19 10:20:57 -0700)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/hw-misc-20231020

for you to fetch changes up to 9f1b100236223d073915b8eedac3089ec64f8a6e:

  ui/input: Constify QemuInputHandler structure (2023-10-20 14:46:07 +0200)

Since v1:
- Dropped PC_SPEAKER patch
- Added MAINTAINERS::util/qemu-timer-common.c patch

----------------------------------------------------------------
Misc hardware patch queue

- MAINTAINERS updates (Zoltan, Thomas)
- Fix cutils::get_relocated_path on Windows host (Akihiko)
- Housekeeping in Memory APIs (Marc-André)
- SDHCI fix for SDMA transfer (Lu, Jianxian)
- Various QOM/QDev/SysBus cleanups (Philippe)
- Constify QemuInputHandler structure (Philippe)

----------------------------------------------------------------

Akihiko Odaki (1):
  cutils: Fix get_relocated_path on Windows

BALATON Zoltan (1):
  MAINTAINERS: Split vt82c686 out of fuloong2e

Lu Gao (1):
  hw/sd/sdhci: Block Size Register bits [14:12] is lost

Luc Michel (1):
  mailmap: update email addresses for Luc Michel

Marc-André Lureau (2):
  memory: drop needless argument
  memory: follow Error API guidelines

Philippe Mathieu-Daudé (36):
  buildsys: Only display Objective-C information when Objective-C is
    used
  hw/mips/malta: Use sdram_type enum from 'hw/i2c/smbus_eeprom.h'
  hw/mips: Merge 'hw/mips/cpudevs.h' with 'target/mips/cpu.h'
  hw/misc/mips_itu: Declare itc_reconfigure() in 'hw/misc/mips_itu.h'
  hw/misc/mips_itu: Make MIPSITUState target agnostic
  hw/pci-host/sh_pcic: Declare CPU QOM types using DEFINE_TYPES() macro
  hw/pci-host/sh_pcic: Correct PCI host / devfn#0 function names
  hw/pci-host/sh_pcic: Replace magic value by proper definition
  hw/sparc64/ebus: Access memory regions via pci_address_space_io()
  hw/acpi/pcihp: Clean up global variable shadowing in acpi_pcihp_init()
  hw/pci: Clean up global variable shadowing of address_space_io
    variable
  hw/s390x: Clean up global variable shadowing in
    quiesce_powerdown_req()
  hw/intc/apic: Use ERRP_GUARD() in apic_common_realize()
  hw/ppc/spapr_vio: Realize SPAPR_VIO_BRIDGE device before accessing it
  hw/ppc/pnv_xscom: Rename pnv_xscom_realize(Error **) ->
    pnv_xscom_init()
  hw/ppc/pnv_xscom: Move sysbus_mmio_map() call within pnv_xscom_init()
  hw/ppc/pnv_xscom: Do not use SysBus API to map local MMIO region
  hw/ppc/pnv: Do not use SysBus API to map local MMIO region
  hw/intc/spapr_xive: Move sysbus_init_mmio() calls around
  hw/intc/spapr_xive: Do not use SysBus API to map local MMIO region
  hw/i386/amd_iommu: Do not use SysBus API to map local MMIO region
  hw/i386/intel_iommu: Do not use SysBus API to map local MMIO region
  hw/misc/allwinner-dramc: Move sysbus_mmio_map call from init ->
    realize
  hw/misc/allwinner-dramc: Do not use SysBus API to map local MMIO
    region
  hw/pci-host/bonito: Do not use SysBus API to map local MMIO region
  hw/acpi: Realize ACPI_GED sysbus device before accessing it
  hw/arm/virt: Realize ARM_GICV2M sysbus device before accessing it
  hw/isa: Realize ISA bridge device before accessing it
  hw/s390x/css-bridge: Realize sysbus device before accessing it
  hw/virtio/virtio-pmem: Replace impossible check by assertion
  hw/block/vhost-user-blk: Use DEVICE() / VIRTIO_DEVICE() macros
  hw/display/virtio-gpu: Use VIRTIO_DEVICE() macro
  hw/scsi/virtio-scsi: Use VIRTIO_SCSI_COMMON() macro
  hw/dma: Declare link using static DEFINE_PROP_LINK() macro
  hw/net: Declare link using static DEFINE_PROP_LINK() macro
  ui/input: Constify QemuInputHandler structure

Thomas Huth (4):
  MAINTAINERS: Add hw/input/lasips2.c to the HPPA machine section
  MAINTAINERS: Add include/hw/intc/loongson_liointc.h to the Loongson-3
    virt section
  MAINTAINERS: Add include/hw/openrisc/ to the OpenRISC section
  MAINTAINERS: Extend entry to cover util/qemu-timer-common.c, too

 MAINTAINERS                         | 18 +++++++--
 meson.build                         |  6 ++-
 include/hw/acpi/pcihp.h             |  2 +-
 include/hw/core/cpu.h               |  4 +-
 include/hw/core/sysemu-cpu-ops.h    |  2 +-
 include/hw/mips/cpudevs.h           | 14 -------
 include/hw/misc/mips_itu.h          |  4 +-
 include/hw/pci/pci.h                |  9 ++---
 include/hw/ppc/pnv_xscom.h          |  2 +-
 include/hw/virtio/virtio-input.h    |  2 +-
 include/sysemu/memory_mapping.h     |  2 +-
 include/ui/input.h                  |  2 +-
 target/i386/cpu.h                   |  2 +-
 target/mips/cpu.h                   |  7 ++--
 chardev/msmouse.c                   |  2 +-
 chardev/wctablet.c                  |  2 +-
 hw/acpi/pcihp.c                     |  5 +--
 hw/arm/virt.c                       |  5 +--
 hw/block/vhost-user-blk.c           |  4 +-
 hw/char/escc.c                      |  2 +-
 hw/core/cpu-sysemu.c                |  6 +--
 hw/display/virtio-gpu.c             |  2 +-
 hw/display/xenfb.c                  |  6 +--
 hw/dma/xilinx_axidma.c              |  6 +--
 hw/dma/xlnx-zdma.c                  |  7 +---
 hw/dma/xlnx_csu_dma.c               | 13 ++-----
 hw/i386/amd_iommu.c                 |  5 +--
 hw/i386/intel_iommu.c               |  5 +--
 hw/i386/microvm.c                   |  2 +-
 hw/input/adb-kbd.c                  |  2 +-
 hw/input/hid.c                      |  6 +--
 hw/input/ps2.c                      |  4 +-
 hw/input/virtio-input-hid.c         |  8 ++--
 hw/intc/apic_common.c               |  4 ++
 hw/intc/spapr_xive.c                | 12 +++---
 hw/isa/isa-bus.c                    | 11 +++++-
 hw/loongarch/virt.c                 |  2 +-
 hw/mips/cps.c                       |  1 -
 hw/mips/fuloong2e.c                 |  1 -
 hw/mips/jazz.c                      |  1 -
 hw/mips/loongson3_virt.c            |  1 -
 hw/mips/malta.c                     |  3 +-
 hw/mips/mips_int.c                  |  1 -
 hw/mips/mipssim.c                   |  1 -
 hw/misc/allwinner-r40-dramc.c       | 20 +++++-----
 hw/misc/mips_itu.c                  |  4 +-
 hw/net/cadence_gem.c                |  7 +---
 hw/pci-host/bonito.c                | 30 +++++++--------
 hw/pci-host/sh_pci.c                | 57 +++++++++++++----------------
 hw/pci/pci.c                        | 25 +++++--------
 hw/ppc/pnv.c                        | 26 +++----------
 hw/ppc/pnv_xscom.c                  |  5 +--
 hw/ppc/spapr_vio.c                  |  3 +-
 hw/s390x/css-bridge.c               |  7 ++--
 hw/s390x/sclpquiesce.c              |  8 ++--
 hw/scsi/virtio-scsi.c               |  2 +-
 hw/sd/sdhci.c                       | 15 ++++++--
 hw/sparc64/sun4u.c                  |  8 ++--
 hw/virtio/virtio-pmem.c             |  5 +--
 system/memory_mapping.c             | 17 ++++-----
 target/i386/arch_memory_mapping.c   |  6 ++-
 target/mips/sysemu/cp0_timer.c      |  1 -
 target/mips/tcg/sysemu/cp0_helper.c |  1 +
 target/mips/tcg/sysemu/tlb_helper.c |  1 -
 ui/input-legacy.c                   |  2 +-
 ui/input.c                          |  4 +-
 ui/vdagent.c                        |  2 +-
 util/cutils.c                       | 18 +++++----
 .mailmap                            |  3 ++
 69 files changed, 222 insertions(+), 261 deletions(-)
 delete mode 100644 include/hw/mips/cpudevs.h

-- 
2.41.0

