Received: by 10.223.134.117 with SMTP id 50csp12453426wrw;
        Wed, 3 Jan 2018 14:43:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBouOSdwx24fCBgiSAUs/F+0cMLD9rWT57wNVt8cCt/ZSv1kMfmMsxtPmwz/21Ti1i7sZcOze
X-Received: by 10.37.178.141 with SMTP id k13mr2663690ybj.287.1515019425209;
        Wed, 03 Jan 2018 14:43:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515019425; cv=none;
        d=google.com; s=arc-20160816;
        b=jAQNLVATIUDiRKQlgwBzxJ3C0vsXGr7cHM6PBx+sDjnsI3J0kjFZbZx2kS0S7g3iCb
         Yz3IOpQPdaLixITIn+XRJY/zmp8ATZwV+hrumNj93bsi6+FFNqiGbN6Qw89WZPmufVXU
         5yS72z6d3zfw0A59KaGSV5dyZ4KXEn0qBQE0DIviQYZSXw+FgIKlPr5zEk2SmKYGTbjn
         E3LcnkN9T2k/qAnfEhSnA7Be4bD6CWxksPtLtF8Q2ldYdIWpV5e6GNubi9EQ1Lb34sW2
         n7SEf6IV4jY7IZ6jIDbq2f2bVDmpVD8ltjTblHDIv78k7zBFBSsxiA+VBT9TYGo0WNNU
         vvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=EJaJVAgW0ar+n5JNgKIHbv3qRBIbFWosygsIMFI7zK0=;
        b=bYZ/ctrJh9RBjrQgHTvdWOuLtut5I9Ve00Kqcs8kV7+vM+A4lCzfNBj0SSIUlLRYwX
         cYIkjpPyKdrGLYU4L3oo32oM8raaD27WePM4h4+szaqHmh9UVrV3T0etzTsOrInHVnM1
         sBz0sBzaSPKPBTyDU5AdHo5KU2jeUEV7Cv7e3c7uoWcbzSdyoUQeuOp/GZR0fHFiEmJC
         CPWnenV1yeQMcY7AhtZos4ExHqc2haTVomMXS+FRaZ+J/28fezyoZDVUFaJtcaj1imFr
         vyLNchu2b0SrabFQGE7Yocr8GEWcTRl4dauWJqhYNcNieJBw++be3CGlEAOkzrOBhLNd
         LnHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W8oSKMHR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x7si416877ybx.760.2018.01.03.14.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 14:43:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W8oSKMHR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWrlA-0006Kb-J6
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 17:43:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrjl-0005Dp-Ie
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 17:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrji-0002Gj-TU
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 17:42:17 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:32808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrji-0002Fz-Nl; Wed, 03 Jan 2018 17:42:14 -0500
Received: by mail-qk0-x243.google.com with SMTP id x7so3470382qkb.0;
	Wed, 03 Jan 2018 14:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EJaJVAgW0ar+n5JNgKIHbv3qRBIbFWosygsIMFI7zK0=;
	b=W8oSKMHR79m1wzwiz28ZVMeLJARMVVuyDibPT6cSH8IaT/hyNuG/slqrXYyeiIbfO4
	NhCUsxIty//h7MQ1rkyvuGtca3yc6oWNDYCfHk6iplm9FbUKzGms2WY0nwDWX3o47jqc
	v3EmbHgpM1VhsPEqHiFXNHdtumVojm5UaRMZ7g0hZcayDckYa68Qub9xFzOcpMckyCXJ
	9YV8CsFRoMhxyBpnwYSb63xjOeQo/B3soJntVp4bn5qpoigmXLI75h7X0eFVnNdJ/LYS
	ZVL1gutVPphUWxq3s58FWgHWGaJiVoRdi4IbnP17A32VSgTquRq8YluiT872HKZdIXeb
	Bx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=EJaJVAgW0ar+n5JNgKIHbv3qRBIbFWosygsIMFI7zK0=;
	b=iMM+qofz148g5jmRqgVSC28Yk+SKTxbzB0Xmr/AWRGyoU537AmjIe6OLPPy5GTtyJ4
	l1FRBdkxCtNXkJlFvLy75OnTftrMeqryhWWSMpmZORhZkRzJV0s3E4YYx9rxpqrrbBVI
	XWNnBWlpYRERvN0O28DTxKIsVyyhC7l9H7l1tstr+i0lagZtO1zoA2HxEqEOQwKVOsrl
	sfggdDV+27vfQE01IHMAat8jemUp6j3j7Gu7Gc9RWW0prj+taKzXM1+EX0jDW69cAxlI
	+kQRZvUbjFXfmudZgIv55a+lU4Ubr5vefsHn1AUGTjOh+730/1kTdYhBJpuKhWhS2hGi
	sykA==
X-Gm-Message-State: AKGB3mKyBDcdM0EE1wP2dPfF0u/2yzYAva6zEcjdSS2UO6Ime3124UGL
	VU7HxkqbcmVEYH6Z7pauOhs=
X-Received: by 10.55.130.133 with SMTP id e127mr3888789qkd.279.1515019334014; 
	Wed, 03 Jan 2018 14:42:14 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	f13sm1325127qke.47.2018.01.03.14.42.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 14:42:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Wed,  3 Jan 2018 19:42:06 -0300
Message-Id: <20180103224208.30291-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v2 0/2] pxa2xx_timer: ignore incorrect
 registers access to use U-Boot
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
X-TUID: Z9urwCgdyr1W

since v1:
- fixed qemu_log_mask() lines indentation (Alistair)
- added Alistair's R-b

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

 hw/sd/pxa2xx_mmci.c     | 77 +++++++++++++++++++++++++++++++------------------
 hw/timer/pxa2xx_timer.c | 17 +++++++++--
 hw/sd/trace-events      |  4 +++
 3 files changed, 68 insertions(+), 30 deletions(-)

-- 
2.15.1

