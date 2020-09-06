Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2665993lfc;
        Sat, 5 Sep 2020 18:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTBWh8R8c3k4JLXa+mWUWXGOkOiGUo7GcE9B8fXsOagEoapNlraSIaALByF0/xJLC2HKTa
X-Received: by 2002:a25:1d0b:: with SMTP id d11mr19638655ybd.358.1599354515618;
        Sat, 05 Sep 2020 18:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599354515; cv=none;
        d=google.com; s=arc-20160816;
        b=DYo8y65t0F/EKyMnHS06FpJ2tb3CSTziTULEwkhRjUeas+EXVViPYzvAWURo8nuyVA
         2V23W+gwKwEEJm8LRot/64KCc05hLBzI59tPHB7NVfcF15jUmQvXcHnYT+0a9xjOuYzw
         gvx2e83q9U0v9RUuSa1eqZIZz7Fom6WRasIXEwO0FAyQpM4h8kATEePf5eaWqeWgeQh3
         FCvCwnpXDxF+2PFGjCTgFbSgjwVtbuXoV9tEPiskNCw7ze5yRWU9SEqcMhQQYxMNSbu1
         UJ7Qohz05shuIB5Q8m3q8rsQd9s0CcIWOsbR734eBCzRnPKfn767N30Bcb0mCTbGOVlv
         hbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=uNRqwkv8hT3eCpKnBnomPKbDQRB6vtwjP0a/+dQsLns=;
        b=yBXs1zZnX2X0eJPb6/75msk6RdpeRIGqUP1XnVs+OoKndlb2M4NC+5Xg6Lg9ThBBWE
         aUV48SB1AsEyURPCCuyQJGnTom9kCcs7tVEt4KvaNYqoqGo8bY00yfJKJKIb6toHgHAb
         3LVz2o+gBYirYRaUsGn6E68eQHaf8UT9665qB6o7FGaBNksKuj9/bUzbqV/AQXUHVG8r
         vr5invnGNcvXCN4tY+43TwwWNdkA5pcsibtTmXeGZtFCfymHr4mhC6wOb2Ok9GSD7TAE
         mpfFpmB5Et24IeyvlbSdgJRaOiKdKVsuYWir864L5gFlDBomfhHsLVtLKOf5Glau+hfz
         KxjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=WD0FM9dc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23si11592748ybc.448.2020.09.05.18.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 18:08:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=WD0FM9dc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEjAZ-0008JQ-0l
	for alex.bennee@linaro.org; Sat, 05 Sep 2020 21:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kEjAS-0008JD-Fg
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 21:08:28 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kEjAM-000501-9v
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 21:08:28 -0400
Received: by mail-wm1-x343.google.com with SMTP id s13so9944969wmh.4
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 18:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uNRqwkv8hT3eCpKnBnomPKbDQRB6vtwjP0a/+dQsLns=;
 b=WD0FM9dcybQ8PnYxP8TGa/02MVbknHObn8wkUrC/dqD+gk8Ggruw81/bXJ03tMmJim
 1H9Q9NifB0tPw4G45vaWL+H6xMNqinkUYvKbIDXokoveahsK6g3UllA61T5AN+D6BuQb
 dGj9+X3BkMxZFp2rEWLIqrDNbVlZJm5ShAgl4raRvM0jsV+E90Wf8o2bG5dIYYp5hud9
 deFeeaiknosopOCxWepEY15nW9kuH7zbzw+p8GSo/diHq4RtXG3DahilhA306zYp/CY2
 To8LM9VUpaTTI+4bwcYNIBESIU+MuNzcPusKAxAQiDLFdchdcdKSuGyOxak9Y3zzbPYK
 9cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uNRqwkv8hT3eCpKnBnomPKbDQRB6vtwjP0a/+dQsLns=;
 b=Ykvr3YC8OPWy+xh/5elIp1mgpNkcbVtepG3wYH7iJLEV7anh/CiEL9rBmYI22ficKk
 sHHEs+Rhyix3lSWc+NgGG0NLRlSlJUSch3inMy1isgO6mGAokqTrtosHhcocD2erz9kv
 Boz3qePztkIEw2nPb1Zvu6aDbxAkT70xT2u2S0enc9XreEi9KJcFhZkVrXcp1icPd+gH
 XaAOAGmJrqrVE30PWmpodb5qI1B4w+2oYeHm/pBs0MgcMF46cQhBX6vjUpazucEHGy05
 9k7CAbtkqPzoJKoJrU7/Lsfvx8M2HCSwhkgbCY8K2rsx+QI6pUUZZRKOnHZtGuKy+mgL
 c1OA==
X-Gm-Message-State: AOAM533SSxC5MoyyeYLt4IfrXvfHeiTpu9lR8r4Ye7m2Mou45D2Yy8qW
 38utlUHw12h5u1Wbtl5V0G0h7Q==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr13894906wme.136.1599354500402; 
 Sat, 05 Sep 2020 18:08:20 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:7853:73ff:fecf:b3e3])
 by smtp.gmail.com with ESMTPSA id v3sm19452423wmh.6.2020.09.05.18.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 18:08:19 -0700 (PDT)
Date: Sun, 6 Sep 2020 02:08:11 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 00/16] hw/riscv: Add Microchip PolarFire SoC Icicle
 Kit board support
Message-ID: <20200906010811.GA1546@vanye>
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NSflt0ujYKcy

On Tue, Sep 01, 2020 at 09:38:55 +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This adds support for Microchip PolarFire SoC Icicle Kit board.
> The Icicle Kit board integrates a PolarFire SoC, with one SiFive's
> E51 plus four U54 cores and many on-chip peripherals and an FPGA.
> 
> For more details about Microchip PolarFire SoC, please see:
> https://www.microsemi.com/product-directory/soc-fpgas/5498-polarfire-soc-fpga
> 
> The Icicle Kit board information can be found here:
> https://www.microsemi.com/existing-parts/parts/152514
> 
> Unlike SiFive FU540, the RISC-V core resect vector is at 0x20220000.
> The RISC-V CPU and HART codes has been updated to set the core's
> reset vector based on a configurable property from machine codes.
> 
> The following perepherals are created as an unimplemented device:
> 
> - Bus Error Uint 0/1/2/3/4
> - L2 cache controller
> - SYSREG
> - MPUCFG
> - IOSCBCFG
> - GPIO
> 
> The following perepherals are emulated:
> - SiFive CLINT
> - SiFive PLIC
> - PolarFire SoC Multi-Mode UART
> - SiFive PDMA
> - Cadence eMMC/SDHCI controller
> - Cadence Gigabit Ethernet MAC
> 
> The BIOS image used by this machine is hss.bin, aka Hart Software
> Services, which can be built from:
> https://github.com/polarfire-soc/hart-software-services
> 
> To launch this machine:
> $ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
>     -bios path/to/hss.bin -sd path/to/sdcard.img \
>     -nic tap,ifname=tap,script=no,model=cadence_gem \
>     -display none -serial stdio \
>     -chardev socket,id=serial1,path=serial1.sock,server,wait \
>     -serial chardev:serial1

I finally got around to building the sd image from
https://github.com/polarfire-soc/polarfire-soc-buildroot-sdk,
and I can successfully boot to prompt using that, and the (hacked)
hss.bin I verified previously - also with this v3.

However, unless I add the "-nic user,model=cadence_gem \" shown in
https://wiki.qemu.org/Documentation/Platforms/RISCV#Microchip_PolarFire_SoC_Icicle_Kit
but not here, I do not have functioning networking. (It is not obvious
to me why this is needed.)

> The memory is set to 1 GiB by default to match the hardware.

Which hardware is this?
https://www.crowdsupply.com/microchip/polarfire-soc-icicle-kit lists
2GiB.

> A sanity check on ram size is performed in the machine init routine
> to prompt user to increase the RAM size to > 1 GiB when less than
> 1 GiB ram is detected.

There is currently no visible effect in firmware from setting memory size to >
1GiB (hss says 1GB, u-boot says 1GB, Linux sees 1GB).
Are there any plans to address this in future versions?

Best Regards,

Leif

> HSS output is on the first serial port (stdio) and U-Boot/Linux
> outputs on the 2nd serial port. OpenSBI outputs on a random serial
> port due to the lottery mechanism used during the multi-core boot.
> 
> Please check the QEMU WiKi page for the target specific information:
> https://wiki.qemu.org/Documentation/Platforms/RISCV#Microchip_PolarFire_SoC_Icicle_Kit
> 
> Changes in v3:
> - rebase on qemu/master
> - change MCHP_PFSOC_DMA to SIFIVE_PDMA
> - use the correct (Object *) to set the 'phy-addr' in xlnx-zynqmp.c
> 
> Changes in v2:
> - change to update hw/char/meson.build
> - add impl.min_access_size and impl.max_access_size as part of
>   MemoryRegionOps and remove the allignment check
> - change to update hw/sd/meson.build
> - change the name to "generic-sdhci" when calling object_initialize_child()
> - add a container MR to simplify out-of-bounds access checks
> - do not initialize TYPE_SYSBUS_SDHCI in the SoC instance_init(),
>   instead move that to the cadence_sdhci model
> - do not access generic-sdhci's state directly,
>   instead move that to the cadence_sdhci model
> - change to update hw/dma/meson.build
> - rename the file names to sifive_pdma.[c|h]
> - update irq number to 8 per the SiFive FU540 manual
> - fix the register offset for channel 1/2/3 in the read/write ops
> - connect 8 IRQs to the PLIC
> - change "phy-addr" default value to BOARD_PHY_ADDRESS
> 
> Bin Meng (16):
>   target/riscv: cpu: Add a new 'resetvec' property
>   hw/riscv: hart: Add a new 'resetvec' property
>   target/riscv: cpu: Set reset vector based on the configured property
>     value
>   hw/riscv: Initial support for Microchip PolarFire SoC Icicle Kit board
>   hw/char: Add Microchip PolarFire SoC MMUART emulation
>   hw/riscv: microchip_pfsoc: Connect 5 MMUARTs
>   hw/sd: Add Cadence SDHCI emulation
>   hw/riscv: microchip_pfsoc: Connect a Cadence SDHCI controller and an
>     SD card
>   hw/dma: Add SiFive platform DMA controller emulation
>   hw/riscv: microchip_pfsoc: Connect a DMA controller
>   hw/net: cadence_gem: Add a new 'phy-addr' property
>   hw/arm: xlnx: Set all boards' GEM 'phy-addr' property value to 23
>   hw/riscv: microchip_pfsoc: Connect 2 Cadence GEMs
>   hw/riscv: microchip_pfsoc: Hook GPIO controllers
>   hw/riscv: clint: Avoid using hard-coded timebase frequency
>   hw/riscv: sifive_u: Connect a DMA controller
> 
>  default-configs/riscv64-softmmu.mak |   1 +
>  include/hw/char/mchp_pfsoc_mmuart.h |  61 +++++
>  include/hw/dma/sifive_pdma.h        |  57 +++++
>  include/hw/net/cadence_gem.h        |   2 +
>  include/hw/riscv/microchip_pfsoc.h  | 133 +++++++++++
>  include/hw/riscv/riscv_hart.h       |   1 +
>  include/hw/riscv/sifive_clint.h     |   4 +-
>  include/hw/riscv/sifive_u.h         |  11 +
>  include/hw/sd/cadence_sdhci.h       |  47 ++++
>  target/riscv/cpu.h                  |   7 +-
>  hw/arm/xilinx_zynq.c                |   1 +
>  hw/arm/xlnx-versal.c                |   1 +
>  hw/arm/xlnx-zynqmp.c                |   2 +
>  hw/char/mchp_pfsoc_mmuart.c         |  86 +++++++
>  hw/dma/sifive_pdma.c                | 313 ++++++++++++++++++++++++++
>  hw/net/cadence_gem.c                |   7 +-
>  hw/riscv/microchip_pfsoc.c          | 437 ++++++++++++++++++++++++++++++++++++
>  hw/riscv/opentitan.c                |   1 +
>  hw/riscv/riscv_hart.c               |   3 +
>  hw/riscv/sifive_clint.c             |  26 ++-
>  hw/riscv/sifive_e.c                 |   4 +-
>  hw/riscv/sifive_u.c                 |  35 ++-
>  hw/riscv/spike.c                    |   3 +-
>  hw/riscv/virt.c                     |   3 +-
>  hw/sd/cadence_sdhci.c               | 193 ++++++++++++++++
>  target/riscv/cpu.c                  |   8 +-
>  target/riscv/cpu_helper.c           |   4 +-
>  target/riscv/csr.c                  |   4 +-
>  MAINTAINERS                         |   9 +
>  hw/char/Kconfig                     |   3 +
>  hw/char/meson.build                 |   1 +
>  hw/dma/Kconfig                      |   3 +
>  hw/dma/meson.build                  |   1 +
>  hw/riscv/Kconfig                    |  10 +
>  hw/riscv/meson.build                |   1 +
>  hw/sd/Kconfig                       |   4 +
>  hw/sd/meson.build                   |   1 +
>  37 files changed, 1459 insertions(+), 29 deletions(-)
>  create mode 100644 include/hw/char/mchp_pfsoc_mmuart.h
>  create mode 100644 include/hw/dma/sifive_pdma.h
>  create mode 100644 include/hw/riscv/microchip_pfsoc.h
>  create mode 100644 include/hw/sd/cadence_sdhci.h
>  create mode 100644 hw/char/mchp_pfsoc_mmuart.c
>  create mode 100644 hw/dma/sifive_pdma.c
>  create mode 100644 hw/riscv/microchip_pfsoc.c
>  create mode 100644 hw/sd/cadence_sdhci.c
> 
> -- 
> 2.7.4
> 
> 
