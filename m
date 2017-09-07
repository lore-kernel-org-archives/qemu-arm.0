Received: by 10.223.172.38 with SMTP id v35csp739360wrc;
        Thu, 7 Sep 2017 14:44:52 -0700 (PDT)
X-Received: by 10.200.54.240 with SMTP id b45mr1104383qtc.264.1504820692516;
        Thu, 07 Sep 2017 14:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504820692; cv=none;
        d=google.com; s=arc-20160816;
        b=TnPasgCgGEWPzCfCb6QaufdqylYD9VzWTi9W2KguH925Sis6eIIaBd0XPn2rHikw7Z
         KDH7dk9fsfpZdLIaLbyy7fzW4Mqvr4lZUjBUD8SxxeE8ZrzmGN/b/cnDu3ak2YQgBgMA
         O6nF0glVqJQKFadYo35eWKKLMa1sKSC4oJS+cxe6jb8T2enexeIOodIIvAwKBxfLGXpS
         62lZwdK5iSlf8YDZBXV70EiyjFZSALHJva0bkuJcME5U+wyJX98p3541bmgIGWYS0MoC
         zBJeG32Aq75CBtsmlUplm5kGwizfBt96Ej1NejXZK/8RObs8fsMSyOhl15XXt5Wo9fb1
         ZHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=uS0TBca4vW+9/bKtWLDe3N0AN8cuMpjCCs9W9BviKt4=;
        b=Gd8qOEASNKlQSOEIIBot4arVz3WLGaM3IY4xtKXGeDVfmjlrjojbL72GntgL6rbTpz
         iYqhrBUMTMBv85UeiS78DGFqH65i67IP/D6Ae1gUGp0wzBXLuot+i2tjqmu3GNdhcWdY
         HOouj8AYenYevqUNS4SkAyFLR2CrVVRSLKiLnWTc4n//ZoE2dHdSH156iIh+dU+rOz8J
         yevhEq2m47TfxbDN6eP0k7FxRXTUtmPmsAQmsHs36/pLjOhJvg0S+T/eu3LsL9qyUm1f
         ykrdPVNM6O98VLapd9UO8aGfjeOXuQ4KJQKSYgV6QgmYwfMhaMX+OOEgAHRBegb7wrpf
         JbNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u86rZu0s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w62si340478qte.439.2017.09.07.14.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 14:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u86rZu0s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq4bS-0005zm-75
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 17:44:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dq4bJ-0005xe-S2
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 17:44:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dq4bD-0000G8-U3
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 17:44:41 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dq4bD-0000Fb-OB; Thu, 07 Sep 2017 17:44:35 -0400
Received: by mail-qt0-x244.google.com with SMTP id p55so570423qtc.2;
	Thu, 07 Sep 2017 14:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uS0TBca4vW+9/bKtWLDe3N0AN8cuMpjCCs9W9BviKt4=;
	b=u86rZu0sG0lB5B0UxUYppmmYEQ6wxarGpRh5lO1l9qkuH1QipNL9FdZ4oOTVR7YAhi
	pl5vIw6iKMlp4YqhN+NDnXdFa3YUoY9669bDyG4zkzL4UZ/MpVtHXSZSzDH+y1Vi3hVo
	eRUPbafnixKv9CJoCyeGNwZmlJtcqB7Sl+a1iY2qQRr1WqQY5/CHnmGEGl3Bd/dRrJjg
	jATLS3RpYo7ZdbQGNTxDi1akFzc6PH4sycjnoZfDz3pqAQhwx85AP7NeIvNmzDwTiv1a
	mO9y/kS+yTziZ9+nbrQqntYIw/+5V9VKJs44AXrpjbBlOl59jb+eNwc6lbgmAegms3gY
	FNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uS0TBca4vW+9/bKtWLDe3N0AN8cuMpjCCs9W9BviKt4=;
	b=PsbsyYuRh6CqkkQhT3L76br+iY2yaELQT1TXQTKzdvOKZB6SUNSeHcWO/wD6+k6W4S
	AF8md//BksbWQqTT82nV/xGkLSoJvmO2q/CRl637z+WxHBaCtOZGIWe6/zU31oNC55SB
	10/73P+kA6TdNTSII0PoCBj02DXfIp6eE7BH0o7TBjQC8FJc6Vrv+a/3SDZoQB1JJTcZ
	AqynctF+yTIiMaQN0u6S1CdtKO5QGiUQ815Zc6m9vunJvn1CpFjYqwyNY1QX6h0A5Ba3
	7rEabJ/HNl4VnkuYVZt81L+x/Ic3IDxVsKriAqONz6gaIoIDKlHuScJPL51GmRjwPpgm
	htFQ==
X-Gm-Message-State: AHPjjUinb56Yt4ikRLXNtRUq8dr4OVygY4bl2+SdbQYZt/YFynfESHoE
	IeL1zYPMyQz9Tw==
X-Google-Smtp-Source: AOwi7QDsXKs9AtGiIyyIWegKRR044Ylyz/bIKR0c2gMvG5i/bS1ZCCENJ54+bg0CKJbhnc4V9XwpNw==
X-Received: by 10.200.36.215 with SMTP id t23mr1086611qtt.185.1504820674823;
	Thu, 07 Sep 2017 14:44:34 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	i124sm215276qkf.84.2017.09.07.14.44.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 14:44:33 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2b183ac5-36d8-1da6-cbac-4c6366f23261@amsat.org>
Date: Thu, 7 Sep 2017 18:44:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 0/5] Add support for
 Smartfusion2 SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 26oSq8791rYF

Hi Subbaraya,

very good work!

On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
> Hi Qemu-devel,
> 
> I am trying to add Smartfusion2 SoC.
> SoC is from Microsemi and System on Module(SOM)
> board is from Emcraft systems. Smartfusion2 has hardened
> Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
> At the moment only system timer, sysreg and SPI
> controller are modelled.
> 
> Testing:
> ./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial mon:stdio \
> -kernel u-boot.bin -display none -drive file=spi.bin,if=mtd,format=raw

"-M emcraft-sf2" ;)

U-Boot 2010.03-00147-g7da5092 (Jul 03 2017 - 09:04:50)

CPU  : SmartFusion2 SoC (Cortex-M3 Hard IP)
Freqs: CORTEX-M3=142MHz,PCLK0=71MHz,PCLK1=71MHz
Board: M2S-FG484-SOM Rev 1A, www.emcraft.com
DRAM:  64 MB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   M2S_MAC
Hit any key to stop autoboot:  0
16384 KiB S25FL128P_64K at 0:0 is now current device
## Booting kernel from Legacy Image at a0007fc0 ...
    Image Name:   dtskernel
    Image Type:   ARM Linux Kernel Image (uncompressed)
    Data Size:    2664224 Bytes =  2.5 MB
    Load Address: a0008000
    Entry Point:  a0008001
    Verifying Checksum ... OK
    Loading Kernel Image ... OK
OK

Starting kernel ...

NVIC: Bad read offset 0xd74
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.5.0-00001-g3aa90e8-dirty 
(sundeep@sundeep-Vostro-3458) (gcc version 5.4.0 (GCC) ) #102 PREEMPT 
Tue May 16 19:43:40 IST 2017
[    0.000000] CPU: ARMv7-M [410fc231] revision 1 (ARMv7M), cr=00000000
[    0.000000] CPU: unknown data cache, unknown instruction cache
[    0.000000] Machine model: Microsemi SmartFusion 2 development board
[    0.000000] Kernel command line: console=ttyS0,115200n8 panic=10 
mem=64M@0xa0000000 earlyprintk
[    0.000000] Memory: 62204K/65536K available (1472K kernel code, 73K 
rwdata, 652K rodata, 400K init, 120K bss, 3332K reserved, 0K cma-reserved)
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.001178] sched_clock: 32 bits at 83MHz, resolution 12ns, wraps 
every 25873297401ns
[    0.003085] clocksource: msf2_clocksource: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 23027234290 ns
[    0.009732] timer at 40004000, irq=16
[    0.014475] Calibrating delay loop... 442.36 BogoMIPS (lpj=2211840)
[    0.653685] Serial: 8250/16550 driver, 1 ports, IRQ sharing disabled
[    0.690789] console [ttyS0] disabled
[    0.696659] 40000000.serial: ttyS0 at MMIO 0x40000000 (irq = 17, 
base_baud = 5187500) is a 16550
[    0.702725] console [ttyS0] enabled
[    0.826251] Freeing unused kernel memory: 400K (a021c000 - a0280000)
init started: BusyBox v1.24.1 (2017-05-15 09:57:00 IST)
~ #

(qemu) info mtree
address-space: cpu-memory
   0000000000000000-ffffffffffffffff (prio 0, i/o): armv7m-container
     0000000000000000-ffffffffffffffff (prio -1, i/o): system
       0000000000000000-000000000003ffff (prio 0, i/o): alias 
MSF2.eNVM.alias @MSF2.eNVM 0000000000000000-000000000003ffff
       0000000020000000-000000002000ffff (prio 0, ram): MSF2.eSRAM
       0000000040000000-000000004000001f (prio 0, i/o): serial
       0000000040001000-000000004000103f (prio 0, i/o): mss-spi
       0000000040004000-000000004000402f (prio 0, i/o): mss-timer
       0000000040011000-000000004001103f (prio 0, i/o): mss-spi
       0000000040038000-00000000400382ff (prio 0, i/o): msf2-sysreg
       0000000060000000-000000006003ffff (prio 0, rom): MSF2.eNVM
       00000000a0000000-00000000a3ffffff (prio 0, ram): ddr-ram
     0000000022000000-0000000023ffffff (prio 0, i/o): bitband
     0000000042000000-0000000043ffffff (prio 0, i/o): bitband
     00000000e000e000-00000000e000efff (prio 0, i/o): nvic
       00000000e000e000-00000000e000efff (prio 0, i/o): nvic_sysregs
       00000000e000e010-00000000e000e0ef (prio 1, i/o): systick

(qemu) info qtree
bus: main-system-bus
   type System
   dev: msf2-soc, id ""
     part-name = "M2S010"
     eNVM-size = 262144 (0x40000)
     eSRAM-size = 65536 (0x10000)
     m3clk = 142000000 (0x876bf80)
     apb0div = 2 (0x2)
     apb1div = 2 (0x2)
   dev: mss-spi, id ""
     gpio-out "sysbus-irq" 2
     mmio 0000000040011000/0000000000000040
     bus: spi
       type SSI
   dev: mss-spi, id ""
     gpio-out "sysbus-irq" 2
     mmio 0000000040001000/0000000000000040
     bus: spi
       type SSI
       dev: s25sl12801, id ""
         gpio-in "ssi-gpio-cs" 1
         nonvolatile-cfg = 36863 (0x8fff)
         spansion-cr1nv = 0 (0x0)
         spansion-cr2nv = 1 (0x1)
         spansion-cr3nv = 2 (0x2)
         spansion-cr4nv = 16 (0x10)
         drive = "mtd0"
   dev: mss-timer, id ""
     gpio-out "sysbus-irq" 2
     clock-frequency = 71000000 (0x43b5fc0)
     mmio 0000000040004000/0000000000000030
   dev: msf2-sysreg, id ""
     apb0divisor = 2 (0x2)
     apb1divisor = 2 (0x2)
     mmio 0000000040038000/0000000000000300

So far:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Just some comments (no need to fix):

M2S-FG484-SOM> reset
resetting ...
M2S-FG484-SOM>

Hmm no reset, I was expecting some unimp/guest-error warning.

M2S-FG484-SOM> tftpboot
m2s_eth_init: FIFO initialization timeout
*** m2s_mac_dump_regs FIFO init:
  DMA TX CTRL=00000000;DESC=00000000;STAT=00000000
  DMA RX CTRL=00000000;DESC=00000000;STAT=00000000
  DMA IRQ 00000000/00000000
  CFG1=00000000;CFG2=00000000;IFG=00000000;HD=00000000;MFL=00000000
  IFCTRL=00000000;IFSTAT=00000000;ADR1=00000000;ADR2=00000000
  FIFO CFG 00000000/00000000/00000000/00000000/00000000/00000000/
  FIFO ACC 
00000000/00000000/00000000/00000000/00000000/00000000/00000000/00000000/

(same unimp/guest-error warning)

M2S-FG484-SOM> sf erase 0 0x1000
UNHANDLED EXCEPTION: HARD FAULT
   R0	= 00000072  R1	= 00000072
   R2	= 09fa3af0  R3	= 004c8000
   R12	= 00000004  LR	= 00000a27
   PC	= 0000ec98  PSR	= 01000000
[hang]
IN:
0x0000029e:  e7fe       b.n     0x29e


> 
> Binaries u-boot.bin and spi.bin are at:
> https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
> 
> U-boot is from Emcraft with modified
>      - SPI driver not to use PDMA.
>      - ugly hack to pass dtb to kernel in r1.
> @
> https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git
> 
> Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource
> driver added by myself @
> https://github.com/Subbaraya-Sundeep/linux.git
> 
> v8:
> 	memory_region_init_ram to memory_region_init_rom in soc
> 	%s/emcraft_sf2_init/emcraft_sf2_s2s010_init/g in som
> 	Added mc->ignore_memory_transaction_failures = true in som
> 		as per latest commit.
> 	Code simplifications as suggested by Alistair in sysreg and ssi.
> 
> v7:
> 	Removed vmstate_register_ram_global as per latest commit
> 	Moved header files to C which are local to C source files
> 	Removed abort() from msf2-sysreg.c
> 	Added VMStateDescription in mss-timer.c
> 
> v6:
>      Moved some defines from header files to source files
>      Added properties m3clk, apb0div, apb0div1 properties
>      to soc.
>      Added properties apb0divisor, apb1divisor to sysreg
>      Update system_clock_source in msf2-soc.c
>      Changed machine name smartfusion2-som->emcraft-sf2
> 
> v5
>      As per Philippe comments:
>          Added abort in Sysreg if guest tries to remap memory
>          other than default mapping.
>          Use of CONFIG_MSF2 in Makefile for soc.c
>          Fixed incorrect logic in timer model.
>          Renamed msf2-timer.c -> mss-timer.c
>                  msf2-spi.c -> mss-spi.c also type names
>          Renamed function msf2_init->emcraft_sf2_init in msf2-som.c
>          Added part-name,eNVM-size,eSRAM-size,pclk0 and pclk1
>              properties to soc.
>          Pass soc part-name,memory size and clock rate properties from som.
> v4:
>      Fixed build failure by using PRIx macros.
> v3:
>      Added SoC file and board file as per Alistair comments.
> v2:
>      Added SPI controller so that u-boot loads kernel from spi flash.
> v1:
>      Initial patch set with timer and sysreg
> 
> Thanks,
> Sundeep
> 
> 
> Subbaraya Sundeep (5):
>    msf2: Add Smartfusion2 System timer
>    msf2: Microsemi Smartfusion2 System Register block
>    msf2: Add Smartfusion2 SPI controller
>    msf2: Add Smartfusion2 SoC
>    msf2: Add Emcraft's Smartfusion2 SOM kit
> 
>   default-configs/arm-softmmu.mak |   1 +
>   hw/arm/Makefile.objs            |   1 +
>   hw/arm/msf2-soc.c               | 218 ++++++++++++++++++++++
>   hw/arm/msf2-som.c               |  95 ++++++++++
>   hw/misc/Makefile.objs           |   1 +
>   hw/misc/msf2-sysreg.c           | 195 +++++++++++++++++++
>   hw/ssi/Makefile.objs            |   1 +
>   hw/ssi/mss-spi.c                | 404 ++++++++++++++++++++++++++++++++++++++++
>   hw/timer/Makefile.objs          |   1 +
>   hw/timer/mss-timer.c            | 289 ++++++++++++++++++++++++++++
>   include/hw/arm/msf2-soc.h       |  66 +++++++
>   include/hw/misc/msf2-sysreg.h   |  78 ++++++++
>   include/hw/ssi/mss-spi.h        |  58 ++++++
>   include/hw/timer/mss-timer.h    |  64 +++++++
>   14 files changed, 1472 insertions(+)
>   create mode 100644 hw/arm/msf2-soc.c
>   create mode 100644 hw/arm/msf2-som.c
>   create mode 100644 hw/misc/msf2-sysreg.c
>   create mode 100644 hw/ssi/mss-spi.c
>   create mode 100644 hw/timer/mss-timer.c
>   create mode 100644 include/hw/arm/msf2-soc.h
>   create mode 100644 include/hw/misc/msf2-sysreg.h
>   create mode 100644 include/hw/ssi/mss-spi.h
>   create mode 100644 include/hw/timer/mss-timer.h
> 
