Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1197950ejb;
        Fri, 20 Oct 2023 05:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRhsuCBumzvLgGaNUu2Cls8W32eAp3EUnXJcb1WY74zj66M8uSd3Hm+5q/SmqnMkJDFKzx
X-Received: by 2002:ac8:5a46:0:b0:419:5162:5e04 with SMTP id o6-20020ac85a46000000b0041951625e04mr1482423qta.43.1697806534767;
        Fri, 20 Oct 2023 05:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697806534; cv=none;
        d=google.com; s=arc-20160816;
        b=xa84hc3i0wKj5C5ajVXFB1jKtXrV/HGC9Et3pUnXXvBWATDzhZmoP1eR//9COHioHq
         pTsPxKE7aWto0Grjv2kkh/qxCwWEpbH+1D7QUPnj8p/gsowSgZxq6zCxj59bPzyAeLRc
         +kczC8av2hCCLlXNi6ccYmp7VFKkKM8SiDHvpks/J1aqnYs6Z5PU4kftQ4IhRYOE6cLx
         /viVr1paYZeZXifHvpOArq3oPiyva/Dvmit5O4dz6sJPnp6U0wZb4ebeZ6LVEb22oHuu
         OR/jLslEtXH3vLq/4RO84hu7f0bKUmvg1sx1GufeX1Vw1Hr2dG7nFFn4epMqivmxFKzg
         zldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:to:references:cc:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9hw7HkiTNzj85z9L8QGhIY1A6LuiA6eNsu10HcWRzTw=;
        fh=OfrMF/Sgl4+dHUpCrDLVivGMSCjeBihnREKrnNXaGCY=;
        b=V2jSuF8g2QnIVC7aB0D2GaTl8QqN/RFdWQj1uKMV11Xq6BDbmCkJ4qXrLjWrQ7fk4H
         iXfl1qIkzl8SRCD1AFYbHF7utRIkN7IXfUySEMCV2vzS2qZ8bWpKFb7/fpMn8NBJlwRV
         BjDDEzaQR1J5U82e0KthPYN4Hln/Xq6WiFJSck3PhNQhb0VutO07MJwbPqjWbrDC5Gq8
         +Uv0KMJdDzjhabfYOGO95llag+sOL4UYt0CXWSkbYYUkndYYeW1AGLeaGxQNZtODk63J
         L+ftg/Ab9dTV3mGyZoAc01/QM+mceRAEhSiQTaGlqj+113Om7v4Uym9ETRtbzaQbsuaZ
         iBiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QUnApw4t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020ac8584c000000b0041ccdd2519esi1228276qth.687.2023.10.20.05.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 05:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QUnApw4t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtp21-0004Rn-17; Fri, 20 Oct 2023 08:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtp1z-0004QZ-Eh
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 08:55:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtp1w-00027I-J6
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 08:55:11 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32daeed7771so549195f8f.3
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697806505; x=1698411305; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:to:references:cc
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9hw7HkiTNzj85z9L8QGhIY1A6LuiA6eNsu10HcWRzTw=;
 b=QUnApw4tCjR5KfQ5bHme2GtQEAbHMSmKUWivTuhFxgzPUYtgFckSoEQ7WJfhpHlngN
 iuwbJI+r8IiIsb0ThoJhaCRVt9an45sW34dsmD+oKZ2ELs0ah938E1NXM1/tuu9kJW9M
 hen4qPVZmy9mx5bLzGpwbDgC3jpZyVN3/nukAhfBwQV5olnTJOq9Czbgnbl/7JtzObdR
 r+MBpjQtTgqjF04Op1qv4YLoHbF8ozpHcRLNw5bPk705Hjfaj8nN/Of5f/+E+GuAcMIF
 G6pulm6UkUYpmZXH1jzjzfuFsZaTEKMSPGCLtC64pcCNN5G6oQ31aQPlVofpCsefZLK6
 ii9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697806505; x=1698411305;
 h=content-transfer-encoding:in-reply-to:from:to:references:cc
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9hw7HkiTNzj85z9L8QGhIY1A6LuiA6eNsu10HcWRzTw=;
 b=UezwMipsj/af99nM01IunPgpKkzDYh60z2svO5z4MESHiRtc1HM+wIes192zFjOiAz
 naD2J4kLmZhnB9FmlUIZ0+5JCZdgTenEex9EIi4qmkNh0D0434z5uA1fwDfm7r1o4cTX
 GoQWUbYHEup+v5kWAOabRXvtwROm3/ZAvZOCTEKFpoZx5P+a8i/OcryRw2ABCEsk2r4u
 ICTOxsATmHffFpB5SIrzXwMXWGZYK+iroXoIeXuWhg7TEQzfYiQD/K8180jwr0NgYynH
 H4kswpA1nmiwWmT78PfNsWDHn2xVVuAE0+QtB3mQlTjFwQ5TsNSVfmxxtt/+Qp++A9J7
 e6hA==
X-Gm-Message-State: AOJu0YxNWdLdbmiWwqeCJloeH0yCppLZMDUJTLCHTR7PszG4Cp9IYLX1
 0DimK7ELr/QD/G2cfZzDHmNOoA==
X-Received: by 2002:a5d:43c3:0:b0:32d:9fc9:d14a with SMTP id
 v3-20020a5d43c3000000b0032d9fc9d14amr1400118wrr.12.1697806504905; 
 Fri, 20 Oct 2023 05:55:04 -0700 (PDT)
Received: from [192.168.69.115] (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 f4-20020a5d50c4000000b0032da319a27asm1665601wrt.9.2023.10.20.05.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 05:55:04 -0700 (PDT)
Message-ID: <d6900cfb-328b-bd96-e323-bda62e8557ac@linaro.org>
Date: Fri, 20 Oct 2023 14:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PULL v2 00/46] Misc HW/UI patches for 2023-10-19
Content-Language: en-US
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org
References: <20231020125201.49361-1-philmd@linaro.org>
To: QEMU Developers <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231020125201.49361-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=unavailable autolearn_force=no
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
X-TUID: /C9Rj+F0CV9+

Grr, I forgot to Cc qemu-devel@ ...

On 20/10/23 14:51, Philippe Mathieu-Daudé wrote:
> The following changes since commit 0d239e513e0117e66fa739fb71a43b9383a108ff:
> 
>    Merge tag 'pull-lu-20231018' of https://gitlab.com/rth7680/qemu into staging (2023-10-19 10:20:57 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/hw-misc-20231020
> 
> for you to fetch changes up to 9f1b100236223d073915b8eedac3089ec64f8a6e:
> 
>    ui/input: Constify QemuInputHandler structure (2023-10-20 14:46:07 +0200)
> 
> Since v1:
> - Dropped PC_SPEAKER patch
> - Added MAINTAINERS::util/qemu-timer-common.c patch
> 
> ----------------------------------------------------------------
> Misc hardware patch queue
> 
> - MAINTAINERS updates (Zoltan, Thomas)
> - Fix cutils::get_relocated_path on Windows host (Akihiko)
> - Housekeeping in Memory APIs (Marc-André)
> - SDHCI fix for SDMA transfer (Lu, Jianxian)
> - Various QOM/QDev/SysBus cleanups (Philippe)
> - Constify QemuInputHandler structure (Philippe)
> 
> ----------------------------------------------------------------
> 
> Akihiko Odaki (1):
>    cutils: Fix get_relocated_path on Windows
> 
> BALATON Zoltan (1):
>    MAINTAINERS: Split vt82c686 out of fuloong2e
> 
> Lu Gao (1):
>    hw/sd/sdhci: Block Size Register bits [14:12] is lost
> 
> Luc Michel (1):
>    mailmap: update email addresses for Luc Michel
> 
> Marc-André Lureau (2):
>    memory: drop needless argument
>    memory: follow Error API guidelines
> 
> Philippe Mathieu-Daudé (36):
>    buildsys: Only display Objective-C information when Objective-C is
>      used
>    hw/mips/malta: Use sdram_type enum from 'hw/i2c/smbus_eeprom.h'
>    hw/mips: Merge 'hw/mips/cpudevs.h' with 'target/mips/cpu.h'
>    hw/misc/mips_itu: Declare itc_reconfigure() in 'hw/misc/mips_itu.h'
>    hw/misc/mips_itu: Make MIPSITUState target agnostic
>    hw/pci-host/sh_pcic: Declare CPU QOM types using DEFINE_TYPES() macro
>    hw/pci-host/sh_pcic: Correct PCI host / devfn#0 function names
>    hw/pci-host/sh_pcic: Replace magic value by proper definition
>    hw/sparc64/ebus: Access memory regions via pci_address_space_io()
>    hw/acpi/pcihp: Clean up global variable shadowing in acpi_pcihp_init()
>    hw/pci: Clean up global variable shadowing of address_space_io
>      variable
>    hw/s390x: Clean up global variable shadowing in
>      quiesce_powerdown_req()
>    hw/intc/apic: Use ERRP_GUARD() in apic_common_realize()
>    hw/ppc/spapr_vio: Realize SPAPR_VIO_BRIDGE device before accessing it
>    hw/ppc/pnv_xscom: Rename pnv_xscom_realize(Error **) ->
>      pnv_xscom_init()
>    hw/ppc/pnv_xscom: Move sysbus_mmio_map() call within pnv_xscom_init()
>    hw/ppc/pnv_xscom: Do not use SysBus API to map local MMIO region
>    hw/ppc/pnv: Do not use SysBus API to map local MMIO region
>    hw/intc/spapr_xive: Move sysbus_init_mmio() calls around
>    hw/intc/spapr_xive: Do not use SysBus API to map local MMIO region
>    hw/i386/amd_iommu: Do not use SysBus API to map local MMIO region
>    hw/i386/intel_iommu: Do not use SysBus API to map local MMIO region
>    hw/misc/allwinner-dramc: Move sysbus_mmio_map call from init ->
>      realize
>    hw/misc/allwinner-dramc: Do not use SysBus API to map local MMIO
>      region
>    hw/pci-host/bonito: Do not use SysBus API to map local MMIO region
>    hw/acpi: Realize ACPI_GED sysbus device before accessing it
>    hw/arm/virt: Realize ARM_GICV2M sysbus device before accessing it
>    hw/isa: Realize ISA bridge device before accessing it
>    hw/s390x/css-bridge: Realize sysbus device before accessing it
>    hw/virtio/virtio-pmem: Replace impossible check by assertion
>    hw/block/vhost-user-blk: Use DEVICE() / VIRTIO_DEVICE() macros
>    hw/display/virtio-gpu: Use VIRTIO_DEVICE() macro
>    hw/scsi/virtio-scsi: Use VIRTIO_SCSI_COMMON() macro
>    hw/dma: Declare link using static DEFINE_PROP_LINK() macro
>    hw/net: Declare link using static DEFINE_PROP_LINK() macro
>    ui/input: Constify QemuInputHandler structure
> 
> Thomas Huth (4):
>    MAINTAINERS: Add hw/input/lasips2.c to the HPPA machine section
>    MAINTAINERS: Add include/hw/intc/loongson_liointc.h to the Loongson-3
>      virt section
>    MAINTAINERS: Add include/hw/openrisc/ to the OpenRISC section
>    MAINTAINERS: Extend entry to cover util/qemu-timer-common.c, too
> 
>   MAINTAINERS                         | 18 +++++++--
>   meson.build                         |  6 ++-
>   include/hw/acpi/pcihp.h             |  2 +-
>   include/hw/core/cpu.h               |  4 +-
>   include/hw/core/sysemu-cpu-ops.h    |  2 +-
>   include/hw/mips/cpudevs.h           | 14 -------
>   include/hw/misc/mips_itu.h          |  4 +-
>   include/hw/pci/pci.h                |  9 ++---
>   include/hw/ppc/pnv_xscom.h          |  2 +-
>   include/hw/virtio/virtio-input.h    |  2 +-
>   include/sysemu/memory_mapping.h     |  2 +-
>   include/ui/input.h                  |  2 +-
>   target/i386/cpu.h                   |  2 +-
>   target/mips/cpu.h                   |  7 ++--
>   chardev/msmouse.c                   |  2 +-
>   chardev/wctablet.c                  |  2 +-
>   hw/acpi/pcihp.c                     |  5 +--
>   hw/arm/virt.c                       |  5 +--
>   hw/block/vhost-user-blk.c           |  4 +-
>   hw/char/escc.c                      |  2 +-
>   hw/core/cpu-sysemu.c                |  6 +--
>   hw/display/virtio-gpu.c             |  2 +-
>   hw/display/xenfb.c                  |  6 +--
>   hw/dma/xilinx_axidma.c              |  6 +--
>   hw/dma/xlnx-zdma.c                  |  7 +---
>   hw/dma/xlnx_csu_dma.c               | 13 ++-----
>   hw/i386/amd_iommu.c                 |  5 +--
>   hw/i386/intel_iommu.c               |  5 +--
>   hw/i386/microvm.c                   |  2 +-
>   hw/input/adb-kbd.c                  |  2 +-
>   hw/input/hid.c                      |  6 +--
>   hw/input/ps2.c                      |  4 +-
>   hw/input/virtio-input-hid.c         |  8 ++--
>   hw/intc/apic_common.c               |  4 ++
>   hw/intc/spapr_xive.c                | 12 +++---
>   hw/isa/isa-bus.c                    | 11 +++++-
>   hw/loongarch/virt.c                 |  2 +-
>   hw/mips/cps.c                       |  1 -
>   hw/mips/fuloong2e.c                 |  1 -
>   hw/mips/jazz.c                      |  1 -
>   hw/mips/loongson3_virt.c            |  1 -
>   hw/mips/malta.c                     |  3 +-
>   hw/mips/mips_int.c                  |  1 -
>   hw/mips/mipssim.c                   |  1 -
>   hw/misc/allwinner-r40-dramc.c       | 20 +++++-----
>   hw/misc/mips_itu.c                  |  4 +-
>   hw/net/cadence_gem.c                |  7 +---
>   hw/pci-host/bonito.c                | 30 +++++++--------
>   hw/pci-host/sh_pci.c                | 57 +++++++++++++----------------
>   hw/pci/pci.c                        | 25 +++++--------
>   hw/ppc/pnv.c                        | 26 +++----------
>   hw/ppc/pnv_xscom.c                  |  5 +--
>   hw/ppc/spapr_vio.c                  |  3 +-
>   hw/s390x/css-bridge.c               |  7 ++--
>   hw/s390x/sclpquiesce.c              |  8 ++--
>   hw/scsi/virtio-scsi.c               |  2 +-
>   hw/sd/sdhci.c                       | 15 ++++++--
>   hw/sparc64/sun4u.c                  |  8 ++--
>   hw/virtio/virtio-pmem.c             |  5 +--
>   system/memory_mapping.c             | 17 ++++-----
>   target/i386/arch_memory_mapping.c   |  6 ++-
>   target/mips/sysemu/cp0_timer.c      |  1 -
>   target/mips/tcg/sysemu/cp0_helper.c |  1 +
>   target/mips/tcg/sysemu/tlb_helper.c |  1 -
>   ui/input-legacy.c                   |  2 +-
>   ui/input.c                          |  4 +-
>   ui/vdagent.c                        |  2 +-
>   util/cutils.c                       | 18 +++++----
>   .mailmap                            |  3 ++
>   69 files changed, 222 insertions(+), 261 deletions(-)
>   delete mode 100644 include/hw/mips/cpudevs.h
> 

