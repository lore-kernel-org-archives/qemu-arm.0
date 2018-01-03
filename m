Received: by 10.223.134.117 with SMTP id 50csp12128073wrw;
        Wed, 3 Jan 2018 08:43:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBotEnUUgWo58wtRxVzSVwKo1eEGZo6mZv4Yoz/cISBHNv3mR7vfifKAp+i20tpun0ASDj6b1
X-Received: by 10.13.226.209 with SMTP id l200mr1837668ywe.103.1514997801215;
        Wed, 03 Jan 2018 08:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514997801; cv=none;
        d=google.com; s=arc-20160816;
        b=owDSydoahIwf0q3eOep815pjarWlKwvOEsPf6q02Y2L4vhwtUaf9O456PUuGJ/w12D
         TNfRz03F5SvWWITHSzsz7jj3BoKp/WT3fxnoUAfM5q445qAwJSK4iPWTR/1vRDIZ4a2l
         D/QfRmbwuRcOjDC3i7r+D73vWnwoBK3CC7i3Ag1g9kVv/Z4mWIjcGXdgK9D1pbqXwqwv
         ooXtAePxt2FEyoI0nKc5UYPDDx1UvG3nQBO2tMHsDpaKYWLrLueJvuA7gA7FccvIoUEB
         y8JHLwh/7rWCshKjdOsoqgqQN7j9Xmq+HzMqzRMCxlaYsGdAJ2RYMZzyoSvUoNa8hQHG
         LrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=HnxRhJBDNM6Hl0SALI00PdhHSXUVbbCkrCxCDdTQWgo=;
        b=bgrH4jaqxa0HKNYoxjM+Yrd1ZucGU8u2GgJ4cY+fIcdarVAnDRw8VX996dTiiDK7cs
         NsPrKcueiaogDSXCutLFr7/SyFBqogHVeG7bOsF52jxmTL1exB1ezdy6w6N5nTVj76Y/
         YnKGMOP96g9AaOb0AbbZeSxkDTtJKvF50pO1rN+exzNPmQd3RGtRGYxouCPBGfhcGR0j
         k7OTzpNsx0sc8qIiQxRPz7ZdsUYSfhAWZgsMIRaUvqM4Yj3mpjOcYtgxC45oT+ed9P7D
         8mNzqF0OwZB33sh+Jt3zTPkVqlmzVLVKwVpjyRjhdU4I2sKNxqiPbvNQqY8GWKvA2771
         alcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UI8SW2MB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y19si292173yby.482.2018.01.03.08.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:43:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UI8SW2MB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWm8O-0006aQ-L1
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:43:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWm6d-0005eZ-GI
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWm6Y-0007fJ-JY
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:41:31 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWm6Y-0007er-E6; Wed, 03 Jan 2018 11:41:26 -0500
Received: by mail-qk0-x242.google.com with SMTP id p13so2232501qke.4;
	Wed, 03 Jan 2018 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HnxRhJBDNM6Hl0SALI00PdhHSXUVbbCkrCxCDdTQWgo=;
	b=UI8SW2MBu/BpEGQpdMRpaKOydh+AcixJICO0jsbTijswRaeSCt7Q88XDtoMC6qo4GV
	KZhoGEEJtWf74w/xEqZEzQG9pLzbnlUSnp+j+Q4T/pW9onU0cbuAiizFf1XCibyO/K5x
	CrU9e4oQF8IZd+xyOSeODFazlPG1ezT1PMZY0ARPqq4oU+y02dcdKwxxM7STvmbCvpVE
	69io8A2jOmcAODfWGm6vZcbF7gX30Zju6yArnnzcMhZcdtyXCq6y1Xyt+uu9zVAT48Zf
	Y4ig2wz7WCRN9ycUC0j6xcCnhmVIbuS3Ss7UjnSxuRQrbj5wcaOGKuyAaslIHoc1aT/n
	7z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=HnxRhJBDNM6Hl0SALI00PdhHSXUVbbCkrCxCDdTQWgo=;
	b=HGKX2I45AwvNCKsovsH+61N9yNGgj87W584WV+VdlZV2y03I6CRTB2Jsacc14Xi+xM
	DEHeaog+tds6s/NpX4QtuPVOsFANbLjl/VufCCK98ctLnlKFhmdi/q2R6bAzfI1LIdSl
	k4AfrYEmDALtVpLR5/Wp9wPmEmV06YDaX/SExtNWEY+4b7CcMrWtmbqFBbM34WyuaBdW
	LEz3AosSeEylTfKptidXUZV6u1mCl1obt06WqnvaHV5Sc7jgCIJCmNUYOgjv8fKt4V0C
	1Tj6XsS2LbR/ujo7IxNFPK6Dqt/6bpYZDBgI0ySerKP8H0fYXa6XXExnvEXa39Skyy89
	lPsg==
X-Gm-Message-State: AKGB3mIEeZIp/KRQcF7/uOOwuFxPZ9rEuO8V1U0WwKYYmR1S/t1Qrbei
	fyglIA7QbrbRTqT47JgMUjM=
X-Received: by 10.55.103.20 with SMTP id b20mr2460837qkc.224.1514997685399;
	Wed, 03 Jan 2018 08:41:25 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id a67sm846643qkg.64.2018.01.03.08.41.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:41:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Wed,  3 Jan 2018 13:41:15 -0300
Message-Id: <20180103164117.11850-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH 0/2] pxa2xx_timer: ignore incorrect registers
 access to use U-Boot
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HFvNkRoyPHl9

Hi,

tiny patches that allow to boot a Gumstix Connex board and use U-Boot.

Using https://wiki.gumstix.com/index.php/Making_qemu_images#Connex
Linux kernel also booting but crashes entering userland:

    $ arm-softmmu/qemu-system-arm -M connex -nographic -pflash cflash.img
    pxa2xx_clkcfg_write: CPU frequency change attempt
    pxa2xx_timer_write: incorrect reg 0xd8 (value 0x000000c9)
    pxa2xx_timer_write: incorrect reg 0x98 (value 0x00000001)
    pxa2xx_timer_write: incorrect reg 0x58 (value 0x00000001)


    U-Boot 1.2.0 (May 10 2008 - 21:17:19) - PXA270@400 MHz - 1604

    *** Welcome to Gumstix ***

    DRAM:  256 MB
    Flash: 16 MB
    Using default environment

    Hit any key to stop autoboot:  0 
    Instruction Cache is ON
    Copying kernel to 0xa2000000 from 0x00f00000 (length 0x00100000)...done
    ## Booting image at a2000000 ...
       Image Name:   Angstrom/2.6.21/gumstix-custom-c
       Image Type:   ARM Linux Kernel Image (uncompressed)
       Data Size:    1041252 Bytes = 1016.8 kB
       Load Address: a0008000
       Entry Point:  a0008000
    OK

    Starting kernel ...

    Linux version 2.6.21 (otto@otto) (gcc version 4.1.2) #1 PREEMPT Mon May 12 14:33:32 PDT 2008
    CPU: XScale-PXA255 [69052d00] revision 0 (ARMv5TE), cr=00007977
    Machine: The Gumstix Platform
    Memory policy: ECC disabled, Data cache writeback
    Memory clock: 0.00MHz (*0)
    Run Mode clock: 0.00MHz (*0)
    Turbo Mode clock: 0.00MHz (*2.0, active)
    CPU0: D VIVT write-back cache
    CPU0: I cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
    CPU0: D cache: 16384 bytes, associativity 64, 32 byte lines, 8 sets
    Built 1 zonelists.  Total pages: 65024
    Kernel command line: console=ttyS0,115200n8 root=1f01 rootfstype=jffs2 reboot=cold,hard
    PID hash table entries: 1024 (order: 10, 4096 bytes)
    Console: colour dummy device 80x30
    Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
    Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
    Memory: 256MB = 256MB total
    Memory: 257536KB available (1884K code, 191K data, 144K init)
    Mount-cache hash table entries: 512
    CPU: Testing write buffer coherency: ok
    NET: Registered protocol family 16
    Time: pxa_timer clocksource has been installed.
    NET: Registered protocol family 2
    IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
    TCP established hash table entries: 8192 (order: 4, 65536 bytes)
    TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
    TCP: Hash tables configured (established 8192 bind 8192)
    TCP reno registered
    JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2006 Red Hat, Inc.
    io scheduler noop registered
    io scheduler cfq registered (default)
    Console: switching to colour frame buffer device 80x24
    pxa2xx-uart.0: ttyS0 at MMIO 0x40100000 (irq = 15) is a FFUART
    pxa2xx-uart.1: ttyS1 at MMIO 0x40200000 (irq = 14) is a BTUART
    pxa2xx-uart.2: ttyS2 at MMIO 0x40700000 (irq = 13) is a STUART
    pxa2xx-uart.3: ttyS3 at MMIO 0x41600000 (irq = 0) is a HWUART
    Probing Gumstix Flash ROM at physical address 0x00000000 (16-bit bankwidth)
    Gumstix Flash ROM: Found 1 x16 devices at 0x0 in 16-bit bank
     Intel/Sharp Extended Query Table at 0x0031
    Using buffer write method
    Using static partitions on Gumstix Flash ROM
    Creating 3 MTD partitions on "Gumstix Flash ROM":
    0x00000000-0x00040000 : "Bootloader"
    0x00040000-0x00f00000 : "RootFS"
    0x00f00000-0x01000000 : "Kernel"
    TCP cubic registered
    NET: Registered protocol family 1
    NET: Registered protocol family 17
    XScale DSP coprocessor detected.
    VFS: Mounted root (jffs2 filesystem).
    Freeing init memory: 144K
    INIT: version 2.86 booting
    qemu-system-arm: Trying to execute code outside RAM or ROM at 0x000618e8
    This usually means one of the following happened:

    (1) You told QEMU to execute a kernel for the wrong machine type, and it crashed on startup (eg trying to run a raspberry pi kernel on a versatilepb QEMU machine)
    (2) You didn't give QEMU a kernel or BIOS filename at all, and QEMU executed a ROM full of no-op instructions until it fell off the end
    (3) Your guest kernel has a bug and crashed by jumping off into nowhere

    This is almost always one of the first two, so check your command line and that you are using the right type of kernel for this machine.
    If you think option (3) is likely then you can try debugging your guest with the -d debug options; in particular -d guest_errors will cause the log to include a dump of the guest register state at this point.

    Execution cannot continue; stopping here.

    qemu: fatal: Trying to execute code outside RAM or ROM at 0x000618e8
    R00=00000000 R01=be9acd04 R02=000bd818 R03=000b1d78
    R04=000bd838 R05=000bd80c R06=00000001 R07=000bda88
    R08=00000000 R09=00000000 R10=401d7000 R11=00000000
    R12=00000000 R13=be9aca38 R14=000876b8 R15=000618e8
    PSR=60000010 -ZC- A usr32
    FPSCR: 00000000

Regards,

Phil.

Philippe Mathieu-Daudé (2):
  hw/timer/pxa2xx_timer: replace hw_error() -> qemu_log_mask()
  hw/sd/pxa2xx_mmci: add read/write() trace events

 hw/sd/pxa2xx_mmci.c     | 63 +++++++++++++++++++++++++++++++------------------
 hw/timer/pxa2xx_timer.c | 13 ++++++++--
 hw/sd/trace-events      |  4 ++++
 3 files changed, 55 insertions(+), 25 deletions(-)

-- 
2.15.1

