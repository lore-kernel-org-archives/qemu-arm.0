Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3893194wrh;
        Tue, 7 May 2019 10:37:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXsrgqWLg2lsy6Bvs2kx1sO/qG0xxQ5KzaQNh/NcdAmXFHmmbhTLE6Cy0B4bFD1w+QX4F8
X-Received: by 2002:adf:ec04:: with SMTP id x4mr494297wrn.18.1557250637347;
        Tue, 07 May 2019 10:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557250637; cv=none;
        d=google.com; s=arc-20160816;
        b=ihdnuNt1GW/EweS8FOM07wXrcjyFwMbsm47aGQTAngKOgdCHqxk4z3msSPp3wLJ84V
         DtM5bWDIBtv1ei+e5KNA+zX7zSAXjVkYvKPh6t/DpIQfRlpFylm/z/I4f5/yVPj1wm3l
         CNdVXU2DT2DPZyD/u73nIjdQlpR1kIVZpqRjBSSpWa9lxJXiUMGZ5P6Lox93sBrk6EDG
         3i16E76rPlaJdfPa2DI7Ii2jI7OyfB89MqAPVFPXAW/2nMet1TORMod9rcltGaee6bf7
         oTaeXX8wHETIqGJNFpwPyDeHf9fINCmSozXXj+FJWATk5FwaD8KgH2i8JtacnCKHkUXj
         1yXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sl6RXXaddmIT1xy8QoQRS113lF5jDO1WDn33kxiwdlI=;
        b=RIwyX3y/pXIrB4UfReU9D8iGI5PuvIIGdLLopHIvmV5fZOD1HVQsH6ZYPJ4saW8y/7
         YROMR93xLzMm8HEISa9PBB7lOVnOY/5ktc2M2dR1ngJBWlQLNxFPG31qBF86kj/L9vvF
         jSHRfJLUqlCUhp40i+Os/HPobZOueUqczYBAWsGj+gg7HdkdwUHI4sB0ScvCexrUe4jS
         T7iepVzFo/BiCtPfaV/fwGVlGUJwnB6OuisTH2E7mlO99/og+FkGGiu3LkrNg3UtM9X5
         w/otbAtqNLrRflyBVDr3zrbPMWi9Zwew09B5dd92AYDcMAFgu8PWGwA3SJBtYh4jL9Xj
         qVTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L4XsJtpa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si10182487wrr.310.2019.05.07.10.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 10:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L4XsJtpa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:50624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO41k-00077A-Bb
	for alex.bennee@linaro.org; Tue, 07 May 2019 13:37:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas2025@gmail.com>) id 1hO41U-00074u-Hg
	for qemu-arm@nongnu.org; Tue, 07 May 2019 13:37:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas2025@gmail.com>) id 1hO41S-0003oz-9E
	for qemu-arm@nongnu.org; Tue, 07 May 2019 13:37:00 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43002)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andreas2025@gmail.com>)
	id 1hO41S-0003nT-2O
	for qemu-arm@nongnu.org; Tue, 07 May 2019 13:36:58 -0400
Received: by mail-oi1-x242.google.com with SMTP id k9so12948307oig.9
	for <qemu-arm@nongnu.org>; Tue, 07 May 2019 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sl6RXXaddmIT1xy8QoQRS113lF5jDO1WDn33kxiwdlI=;
	b=L4XsJtpa0KJT8x1VaAypHCNq6BOClHXEZ6durZjyKrb97JIw3wtDnJcyU9Gqf4960w
	ZeeAy3z180BGgt+49wccWYB4d1bvwy/352dba2De50Egzvv4qteihOcBtWjpcTJawfJW
	XP4OO32WhCOGIPi8lyA6MNomSXH/1Kx38AB6EdV1mLTpXI/I3PLGPOhX5VShpMPNYuae
	/i0cezjWaNwwds0vgHnISFwwFHv2K2PLm4Xf62Fn8i4usC3qrpKnpFgeuQbRzBOhk3KY
	nU0451DuKwUnEte30ixjOp7nSXu0iEbyAPEUlO1pSeNw4WunSNIozxgQ62spYBQXR00w
	eisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sl6RXXaddmIT1xy8QoQRS113lF5jDO1WDn33kxiwdlI=;
	b=KfaRGHaKOZD3KBacneQukBhC8p06raWJfvOffLM8mnulRoESEUw5NjOiujXDO6NiDQ
	NjEXE9r//GHmqNY4PY9IHHPW+alfT2Brtgaga882Xizc9DOoEOzu7ha0b2b/i8QhuoAL
	jyDVAdxM0NS/JM1WDeQhclV60kshKt9ET+cX8SrxjT88d/edCTqxOx+8E4ZwMMaLOaU2
	vEw0WF3mfRPXOTddeXZVHDKKaY5WmrAaon0LjYOsvO53ccbXx1BahG4vdhG96MKwzqDE
	1FN+dnlsh4temx1+dWt9pX+ifamW8ziy0wI/XAIsf9cBpYbZakv1mNL9Y8mX6EDGLQeI
	auyA==
X-Gm-Message-State: APjAAAXcxBc8ie9vFxQD1CxqOIx5NFX4HH2NcThCHM7TMSVa6uwZJd8y
	M5esgVV6Xsk2INGk8y+2N30COZwgeAUUAHWnyQXL1glT
X-Received: by 2002:aca:120f:: with SMTP id 15mr964556ois.46.1557250613048;
	Tue, 07 May 2019 10:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAAVaN8zqOM4Fz3NfJ1gL9-G8WCBQyBt+p+Fgnrj3kgUwx2cKiA@mail.gmail.com>
	<CAFEAcA_YU-MdnrCcSTyL3b93wTCCDzN0GcbSRe28ZPh14FPB6A@mail.gmail.com>
	<CAAVaN8xxU7ZzDZ=-TMe8_U5z8Zoiq4ny-Z1VK8bgUyAJ8YdPXg@mail.gmail.com>
	<CAFEAcA8cYs2Z2viWy9GGF=9=k--h4+cZizdSc5bpaibuAzurrQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8cYs2Z2viWy9GGF=9=k--h4+cZizdSc5bpaibuAzurrQ@mail.gmail.com>
From: Andy Ng <andreas2025@gmail.com>
Date: Tue, 7 May 2019 18:36:41 +0100
Message-ID: <CAAVaN8xLkOx6xO2_P+f8GCqApSxMr879bq-peeL_1HLCZw-MCA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] qemu-system-arm with GPU support for QT with OpenGL
 on
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aW7cxiKWIMis

I have tried a linaro kernel 4.9 stable with multi_v7_defconfig. I
have activated manually the viirtio-gpu but I cant get it to work

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.9.130 (andy@ely) (gcc version 7.2.1
20171011 (Linaro GCC 7.2-2017.11-rc1) ) #4 SMP Tue May 7 14:42:49 BST
2019
[    0.000000] CPU: ARMv7 Processor [412fc0f1] revision 1 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt:Machine model: linux,dummy-virt
[    0.000000] OF: fdt:Ignoring memory range 0x100000000 - 0x140000000
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 64 MiB at 0xfb800000
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv0.2 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] percpu: Embedded 14 pages/cpu @ee7e4000 s26508 r8192
d22644 u57344
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 784895
[    0.000000] Kernel command line:
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Memory: 3034788K/3145724K available (10240K kernel
code, 1128K rwdata, 3976K rodata, 2048K init, 351K bss, 45400K
reserved, 65536K cma-reserved, 2293756K highmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xf0800000 - 0xff800000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf0000000   ( 768 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0208000 - 0xc0d00000   (11232 kB)
[    0.000000]       .init : 0xc1200000 - 0xc1400000   (2048 kB)
[    0.000000]       .data : 0xc1400000 - 0xc151a2e0   (1129 kB)
[    0.000000]        .bss : 0xc151c000 - 0xc1573c78   ( 352 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]     Build-time adjustment of leaf fanout to 32.
[    0.000000]     RCU restricting CPUs from NR_CPUS=16 to nr_cpu_ids=1.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=32, nr_cpu_ids=1
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
[    0.000000] arm_arch_timer: Architected cp15 timer(s) running at
62.50MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
[    0.000154] sched_clock: 56 bits at 62MHz, resolution 16ns, wraps
every 4398046511096ns
[    0.000291] Switching to timer-based delay loop, resolution 16ns
[    0.007818] Console: colour dummy device 80x30
[    0.009765] console [tty0] enabled
[    0.010373] Calibrating delay loop (skipped), value calculated
using timer frequency.. 125.00 BogoMIPS (lpj=312500)
[    0.010695] pid_max: default: 32768 minimum: 301
[    0.012158] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.012233] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.023417] CPU: Testing write buffer coherency: ok
[    0.033499] /cpus/cpu@0 missing clock-frequency property
[    0.033787] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.034097] Setting up static identity map for 0x40300000 - 0x40300098
[    0.046098] EFI services will not be available.
[    0.048700] Brought up 1 CPUs
[    0.049436] SMP: Total of 1 processors activated (125.00 BogoMIPS).
[    0.049534] CPU: All CPU(s) started in SVC mode.
[    0.092377] devtmpfs: initialized
[    0.100416] VFP support v0.3: implementor 41 architecture 4 part 30
variant f rev 0
[    0.116768] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 9556302231375000 ns
[    0.118161] futex hash table entries: 256 (order: 2, 16384 bytes)
[    0.124426] pinctrl core: initialized pinctrl subsystem
[    0.143138] NET: Registered protocol family 16
[    0.151949] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.157336] cpuidle: using governor menu
[    0.157717] No ATAGs?
[    0.158241] hw-breakpoint: found 5 (+1 reserved) breakpoint and 4
watchpoint registers.
[    0.158391] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.162680] Serial: AMBA PL011 UART driver
[    0.197734] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq = 54,
base_baud = 0) is a PL011 rev1
[    0.212122] console [ttyAMA0] enabled
[    0.260321] vgaarb: loaded
[    0.262828] SCSI subsystem initialized
[    0.265079] usbcore: registered new interface driver usbfs
[    0.265564] usbcore: registered new interface driver hub
[    0.265970] usbcore: registered new device driver usb
[    0.268639] pps_core: LinuxPPS API ver. 1 registered
[    0.268856] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.269491] PTP clock support registered
[    0.270156] EDAC MC: Ver: 3.0.0
[    0.283236] clocksource: Switched to clocksource arch_sys_counter
[    0.309872] NET: Registered protocol family 2
[    0.316706] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
[    0.317230] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
[    0.317960] TCP: Hash tables configured (established 8192 bind 8192)
[    0.318916] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.319409] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.321451] NET: Registered protocol family 1
[    0.325657] RPC: Registered named UNIX socket transport module.
[    0.325971] RPC: Registered udp transport module.
[    0.326169] RPC: Registered tcp transport module.
[    0.326367] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.342327] workingset: timestamp_bits=30 max_order=20 bucket_order=0
[    0.363180] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.366228] NFS: Registering the id_resolver key type
[    0.367328] Key type id_resolver registered
[    0.367772] Key type id_legacy registered
[    0.368370] ntfs: driver 2.1.32 [Flags: R/O].
[    0.376987] bounce: pool size: 64 pages
[    0.378076] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 248)
[    0.378560] io scheduler noop registered
[    0.378787] io scheduler deadline registered
[    0.379407] io scheduler cfq registered (default)
[    0.387363] libphy: mdio_driver_register: phy-bcm-ns2-pci
[    0.403111] pl061_gpio 9030000.pl061: PL061 GPIO chip @0x09030000 registered
[    0.407859] OF: PCI: host bridge /pcie@10000000 ranges:
[    0.408526] OF: PCI:    IO 0x3eff0000..0x3effffff -> 0x00000000
[    0.409095] OF: PCI:   MEM 0x10000000..0x3efeffff -> 0x10000000
[    0.410638] pci-host-generic 3f000000.pcie: ECAM at [mem
0x3f000000-0x3fffffff] for [bus 00-0f]
[    0.411947] pci-host-generic 3f000000.pcie: PCI host bridge to bus 0000:00
[    0.412562] pci_bus 0000:00: root bus resource [bus 00-0f]
[    0.412914] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.413188] pci_bus 0000:00: root bus resource [mem 0x10000000-0x3efeffff]
[    0.419634] PCI: bus0: Fast back to back transfers disabled
[    0.422011] pci 0000:00:01.0: BAR 6: assigned [mem
0x10000000-0x1003ffff pref]
[    0.422937] pci 0000:00:01.0: BAR 4: assigned [mem
0x10040000-0x10043fff 64bit pref]
[    0.423476] pci 0000:00:02.0: BAR 4: assigned [mem
0x10044000-0x10047fff 64bit pref]
[    0.423802] pci 0000:00:01.0: BAR 1: assigned [mem 0x10048000-0x10048fff]
[    0.424065] pci 0000:00:02.0: BAR 1: assigned [mem 0x10049000-0x10049fff]
[    0.424342] pci 0000:00:02.0: BAR 0: assigned [io  0x1000-0x107f]
[    0.424607] pci 0000:00:01.0: BAR 0: assigned [io  0x1080-0x109f]
[    0.442171] virtio-pci 0000:00:01.0: enabling device (0100 -> 0103)
[    0.444848] virtio-pci 0000:00:02.0: enabling device (0100 -> 0103)
[    0.572243] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.578152] SuperH (H)SCI(F) driver initialized
[    0.580088] msm_serial: driver initialized
[    0.580595] STMicroelectronics ASC driver initialized
[    0.586758] [drm] Initialized
[    0.639793] brd: module loaded
[    0.655068] loop: module loaded
[    0.683481] libphy: Fixed MDIO Bus: probed
[    0.690118] CAN device driver interface
[    0.693527] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    0.693786] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.694190] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
[    0.694463] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.700199] pegasus: v0.9.3 (2013/04/25), Pegasus/Pegasus II USB
Ethernet driver
[    0.700674] usbcore: registered new interface driver pegasus
[    0.701091] usbcore: registered new interface driver asix
[    0.701409] usbcore: registered new interface driver ax88179_178a
[    0.701773] usbcore: registered new interface driver cdc_ether
[    0.702183] usbcore: registered new interface driver smsc75xx
[    0.702835] usbcore: registered new interface driver smsc95xx
[    0.703174] usbcore: registered new interface driver net1080
[    0.703534] usbcore: registered new interface driver cdc_subset
[    0.703878] usbcore: registered new interface driver zaurus
[    0.704267] usbcore: registered new interface driver cdc_ncm
[    0.707807] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.708120] ehci-pci: EHCI PCI platform driver
[    0.708524] ehci-platform: EHCI generic platform driver
[    0.709107] ehci-orion: EHCI orion driver
[    0.709510] SPEAr-ehci: EHCI SPEAr driver
[    0.709936] ehci-st: EHCI STMicroelectronics driver
[    0.710442] ehci-exynos: EHCI EXYNOS driver
[    0.710959] ehci-atmel: EHCI Atmel driver
[    0.711488] tegra-ehci: Tegra EHCI driver
[    0.711989] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.712354] ohci-pci: OHCI PCI platform driver
[    0.713006] ohci-platform: OHCI generic platform driver
[    0.713568] ohci-omap3: OHCI OMAP3 driver
[    0.713974] SPEAr-ohci: OHCI SPEAr driver
[    0.714389] ohci-st: OHCI STMicroelectronics driver
[    0.714815] ohci-atmel: OHCI Atmel driver
[    0.716424] usbcore: registered new interface driver usb-storage
[    0.720647] mousedev: PS/2 mouse device common for all mice
[    0.727601] rtc-pl031 9010000.pl031: rtc core: registered pl031 as rtc0
[    0.730149] i2c /dev entries driver
[    0.749467] sdhci: Secure Digital Host Controller Interface driver
[    0.749766] sdhci: Copyright(c) Pierre Ossman
[    0.752299] Synopsys Designware Multimedia Card Interface Driver
[    0.754528] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.759022] ledtrig-cpu: registered to indicate activity on CPUs
[    0.760195] usbcore: registered new interface driver usbhid
[    0.760428] usbhid: USB HID core driver
[    0.768143] NET: Registered protocol family 10
[    0.774826] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.778291] NET: Registered protocol family 17
[    0.778651] can: controller area network core (rev 20120528 abi 9)
[    0.779533] NET: Registered protocol family 29
[    0.779778] can: raw protocol (rev 20120528)
[    0.780010] can: broadcast manager protocol (rev 20161123 t)
[    0.780282] can: netlink gateway (rev 20130117) max_hops=1
[    0.781606] Key type dns_resolver registered
[    0.781976] ThumbEE CPU extension supported.
[    0.782218] Registering SWP/SWPB emulation handler
[    0.794116] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    0.796870] rtc-pl031 9010000.pl031: setting system clock to
2019-05-07 17:22:21 UTC (1557249741)

My qemu-system-arm command looks like:

qemu-system-arm -m 4G -M virt,highmem=off -hda debian.qcow2 -net
nic,model=virtio -net user,hostfwd=tcp::2222-:22  -kernel /tmp/zImage
 -device virtio-gpu-device -display gtk,gl=on -serial stdio

I don't see any messages of virtio-gpu in the kernel logs, I have
compiled it statically in the kernel.



On Mon, May 6, 2019 at 6:50 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 5 May 2019 at 18:46, Andy Ng <andreas2025@gmail.com> wrote:
> > But I get the error "Guest has not initialised the display (yet)"
>
> This just means that the guest OS has not done anything
> to draw to the screen. The problem is almost certainly
> in the configuration of the guest (ie either the kernel has
> not got the support compiled in for the pci controller or
> the virtio subsystem or the virtio-gpu, or it's not configured
> to try to use it for a console). Check the kernel logs to
> see if the guest has successfully probed for the pci
> controller and whether it knows about the virtio devices
> plugged into it.
>
> PS: -device virtio-blk-device is using virtio-mmio,
> but -device virtio-gpu is using virtio-pci. It should be
> possible to use both at once, but it's a bit weird --
> usually you'd just use one of them (virtio-pci is
> recommended).
>
> thanks
> -- PMM
