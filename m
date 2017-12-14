Received: by 10.223.159.74 with SMTP id f10csp5756971wrg;
        Wed, 13 Dec 2017 17:29:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBovzq8B2t1++7p7zp8Tjd5HXzTWqeiFl3z5SpDIXrq/KWTNoNKVH0U2VXqkJFFEPIhbebNmk
X-Received: by 10.37.37.79 with SMTP id l76mr3142410ybl.39.1513214977561;
        Wed, 13 Dec 2017 17:29:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513214977; cv=none;
        d=google.com; s=arc-20160816;
        b=Tc2mA6C2bXxdrRKayzHRxXqsrF0Pw/n73WXKQzvX64VF/4ZH676Cz+11TiY+4s9Jvh
         rKH02Ek8yjqPHPNOL0iaartNBulgG2ox1YU7bKTk0qJmgvIFtURowAXNXcybG3ZLdaf+
         sdARJC4m2H5Fd0TNI4ufwjhTMlvJe1semzSVf//v4CLxIT8pnsPtqlwIUf24E57fucFn
         dopW4rAEfZmwk/8qldpQL1c0mtaKOczKCZmbhtrD1wJj1j+Y4TkASMCQF0Zq2GKdu6A7
         FX4Ewb/z16OnsK0jLCNquoZ7zHV6VNtFPeaEarnO1H6LsRZPXPt6EiOM1R65EFa60+UT
         xi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KlZDk7d1tZ2YrQGwQJZY9vakkb/6785IbG9xBGQFROQ=;
        b=wt98embZGDiACn1G1cWJIyqPsnSes82R/OSNYNdiDbw+6lNftPKt97894xc2/Uz0rJ
         4c9vW6wwomV7wae0EshQbSmcXpLrLs0jdy7vi1g+7cWE+BNjS8sNbFgbB+zQoLU9/5Cq
         0WRkI8jnWgxLfPqiZCJs9Lt30zz43RkkcHPfyUgik/ZqI+EtqcrtaZH4SrdLq+PpesSy
         Ny83qSErpcRgMHbDwKH5cKp1ln7MJBe1xkksdFNHfe/xpMKjetZlrXv1rVCLn7tgcOYJ
         oq21oXiAzqWmilWlvkwp/3wJwhMpfq8qPEqcvlWVVCAmiDwAld9+s4mZKvNabokz4su0
         S49g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lvToZds/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a199si601281ybg.611.2017.12.13.17.29.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 17:29:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lvToZds/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38666 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePILA-00024Y-WA
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 20:29:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIL0-00022e-2g
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 20:29:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIKy-00073K-75
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 20:29:26 -0500
Received: from mail-it0-x22c.google.com ([2607:f8b0:4001:c0b::22c]:38814)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIKu-0006zw-93; Wed, 13 Dec 2017 20:29:20 -0500
Received: by mail-it0-x22c.google.com with SMTP id r6so7323773itr.3;
	Wed, 13 Dec 2017 17:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=KlZDk7d1tZ2YrQGwQJZY9vakkb/6785IbG9xBGQFROQ=;
	b=lvToZds/ygC7wtmLvLkR1szLx6KdC2DBJ8pbu4neh8Eh1IgD2UWpyLwsZyjnOKjle2
	fbDRzmMBH772y8KzPr5O1Eq0EQTr8QBEhHgWZp1w23jD0C4kRtHD5e5ms+JkmQUNrz2h
	iFJZq6FZHiHgG+DTKpYgr0xkbGmIwht1kVzCZZufH/qMSHHT4/Kxqg1wkML6IO/8F+of
	iVzgU3WPbBxNsVeJuPVnEVvLm2aWf8beEORAFCSCNhOxjS7Qu+UX+zovxlyZcrZ0MgE2
	Skb4f7qMIDDwI//2ip9M2RNLHa9v9AkVQcJao+a3TjfZp6gLNmd6Y/Rlc9II8waZ2K0+
	v5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=KlZDk7d1tZ2YrQGwQJZY9vakkb/6785IbG9xBGQFROQ=;
	b=ryjpVBqjzAV0iFKFxFC5COAXRO+GSaHTIyGZXzhjee3CApBH9oZN/N+syf81d31ei9
	jhbsFd+6t4INO44YMUAJx57qB/5U9fKcK25tXescivkzBgjqy9Q3Ljiu52r+9JjJMMyB
	cTUhHOHSqAPu8JBSgyfmoklfyGO5SxMd/5nS2mEA0vyYEJMM1lnPzd8A2YXALlGDtk+w
	eQrpEbEMq2aOxl1q3Amq7CPhMm22Ez1S5jIpJh7eHfaMQ3HdUyqVjX/K6IQMVihoTPkM
	4/LGi/TvURcyzy53nuKF6WZ7JfSzNrREX3iQbYsiXNvlSyasENlGRv/baXZvFL9c+rb6
	n4+A==
X-Gm-Message-State: AKGB3mJ8MADCDsjWYnbhp6+ZpDikNBcNfaelheDXiWrQyoOC2LFnDnXZ
	SJyo7BvcFq+fmfFGS/gZzrj/4834PVTMKK7GVvQ=
X-Received: by 10.107.174.222 with SMTP id n91mr5137282ioo.43.1513214959445;
	Wed, 13 Dec 2017 17:29:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.183.19 with HTTP; Wed, 13 Dec 2017 17:29:18 -0800 (PST)
In-Reply-To: <20171213232025.24503-1-f4bug@amsat.org>
References: <20171213232025.24503-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 13 Dec 2017 22:29:18 -0300
X-Google-Sender-Auth: 9UKjJ4hS_Yxbiy9p4GVNVKhRdeA
Message-ID: <CAAdtpL5n_VyDgn4=_ikuwTfznJ7ZUTmp5irAtD-FxEmDVf7Vpg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>, 
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Prasad J Pandit <pjp@fedoraproject.org>, 
	Clement Deschamps <clement.deschamps@antfield.fr>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::22c
Subject: Re: [Qemu-arm] [PATCH 00/26] SDCard housekeeping
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Eric Blake <eblake@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Fam Zheng <famz@redhat.com>, Isaac Lozano <109lozanoi@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wiJ+CKfzPOkf

attaching a more complete boot log.

> Once this series applied, booting some Linux on a vexpress-a9 with few
> sd*command traces enabled result in this outputs (which result useful to
> understand/fix the different SD implementations):

$ cat /tmp/events
sd*command*
sdcard_set_mode
sdcard_read_block

$ qemu-system-arm \
  -M vexpress-a9 \
  -kernel vmlinuz-3.2.0-4-vexpress -initrd initrd.img-3.2.0-4-vexpress \
  -drive if=sd,cache=unsafe,file=a10-debian-server-2gb.2014-02-17.img \
  -append "root=/dev/mmcblk0p2 console=ttyAMA0 console=tty" -nographic \
  -trace events=/tmp/events
Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0
[    0.000000] Linux version 3.2.0-4-vexpress
(debian-kernel@lists.debian.org) (gcc version 4.6.3 (Debian 4.6.3-12)
) #1 SMP Debian 3.2.35-2
[    0.000000] CPU: ARMv7 Processor [410fc090] revision 0 (ARMv7), cr=10c5387d
[    0.000000] Machine: ARM-Versatile Express
[    0.000000] Kernel command line: root=/dev/mmcblk0p2
console=ttyAMA0 console=tty
[    0.000000] Memory: 128MB = 128MB total
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [tty0] enabled
[    0.319496] Brought up 1 CPUs
[    0.319905] SMP: Total of 1 processors activated (617.67 BogoMIPS).
[    0.444966] Serial: AMBA PL011 UART driver
[    0.450544] mb:uart0: ttyAMA0 at MMIO 0x10009000 (irq = 37) is a PL011 rev1
[    0.481078] console [ttyAMA0] enabled
[    3.081225] mmci-pl18x mb:mmci: mmc0: PL181 manf 41 rev0 at
0x10005000 irq 41,42 (pio)
86.660802:sdcard_set_mode inactive -> card_identification (state: idle)
86.660815:sdcard_normal_command         IO_RW_DIRECT/ CMD52 arg
0x00000c00 (state idle)
86.660829:sdcard_command_response (no response) (state idle)
86.689998:sdcard_normal_command         IO_RW_DIRECT/ CMD52 arg
0x80000c08 (state idle)
86.690014:sdcard_command_response (no response) (state idle)
86.692380:sdcard_normal_command        GO_IDLE_STATE/ CMD00 arg
0x00000000 (state idle)
86.692392:sdcard_command_response (no response) (state idle)
86.695229:sdcard_normal_command         SEND_IF_COND/ CMD08 arg
0x000001aa (state idle)
86.695247:sdcard_command_response 00 00 01 aa  (state idle)
86.695887:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg
0x00000000 (state idle)
86.695898:sdcard_command_response (no response) (state idle)
86.696065:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg
0x00000000 (state idle)
86.696072:sdcard_command_response (no response) (state idle)
86.696198:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg
0x00000000 (state idle)
86.696207:sdcard_command_response (no response) (state idle)
86.696311:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg
0x00000000 (state idle)
86.696320:sdcard_command_response (no response) (state idle)
[    3.298428] mmc0: host does not support reading read-only switch.
assuming write-enable.
86.697384:sdcard_command_response 00 40 01 20  (state idle)
86.697639:sdcard_app_command         SD_SEND_OP_COND/ACMD41 arg
0x00000000 (state idle)
86.697656:sdcard_command_response 40 ff ff 00  (state idle)
86.699975:sdcard_normal_command        GO_IDLE_STATE/ CMD00 arg
0x00000000 (state idle)
86.700000:sdcard_command_response (no response) (state idle)
86.732420:sdcard_normal_command         SEND_IF_COND/ CMD08 arg
0x000001aa (state idle)
86.732460:sdcard_command_response 00 00 01 aa  (state idle)
86.732700:sdcard_command_response 00 00 01 20  (state idle)
86.732812:sdcard_app_command         SD_SEND_OP_COND/ACMD41 arg
0x40300000 (state idle)
86.732825:sdcard_command_response c0 ff ff 00  (state ready)
86.733272:sdcard_normal_command         ALL_SEND_CID/ CMD02 arg
0x00000000 (state ready)
86.733307:sdcard_command_response aa 58 59 51 45 4d 55 21 01 de ad be
ef 00 62 19  (state identification)
86.734086:sdcard_normal_command   SEND_RELATIVE_ADDR/ CMD03 arg
0x00000000 (state identification)
86.734107:sdcard_command_response 45 67 05 00  (state standby)
86.734573:sdcard_set_mode card_identification -> data_transfer (state: standby)
86.734580:sdcard_normal_command             SEND_CSD/ CMD09 arg
0x45670000 (state standby)
86.734593:sdcard_command_response 40 0e 00 32 5b 59 00 00 0d 47 7f 80
0a 40 00 00  (state standby)
86.735447:sdcard_normal_command SELECT/DESELECT_CARD/ CMD07 arg
0x45670000 (state standby)
86.735462:sdcard_command_response 00 00 07 00  (state transfer)
86.735917:sdcard_command_response 00 00 09 20  (state transfer)
86.737808:sdcard_app_command                SEND_SCR/ACMD51 arg
0x00000000 (state transfer)
86.737818:sdcard_command_response 00 00 09 20  (state sendingdata)
86.739778:sdcard_command_response 00 00 09 20  (state transfer)
86.740004:sdcard_app_command               SD_STATUS/ACMD13 arg
0x00000000 (state transfer)
86.740011:sdcard_command_response 00 00 09 20  (state sendingdata)
[    3.319526] mmc0: new SDHC card at address 4567
[    3.401452] mmcblk0: mmc0:4567 QEMU! 1.66 GiB
86.939168:sdcard_normal_command  READ_MULTIPLE_BLOCK/ CMD18 arg
0x00000000 (state transfer)
86.939198:sdcard_command_response 00 00 09 00  (state sendingdata)
86.939201:sdcard_read_block addr 0x00000000 size 0x200
86.939768:sdcard_read_block addr 0x00000200 size 0x200
86.940137:sdcard_read_block addr 0x00000400 size 0x200
86.940549:sdcard_read_block addr 0x00000600 size 0x200
86.940918:sdcard_read_block addr 0x00000800 size 0x200
86.941506:sdcard_read_block addr 0x00000a00 size 0x200
86.941796:sdcard_read_block addr 0x00000c00 size 0x200
86.942080:sdcard_read_block addr 0x00000e00 size 0x200
86.942451:sdcard_normal_command    STOP_TRANSMISSION/ CMD12 arg
0x00000000 (state sendingdata)
86.942463:sdcard_command_response 00 00 0b 00  (state transfer)
[    3.522382]  mmcblk0: p1 p2
88.022437:sdcard_normal_command          SEND_STATUS/ CMD13 arg
0x45670000 (state transfer)
88.022459:sdcard_command_response 00 00 09 00  (state transfer)
89.025296:sdcard_normal_command          SEND_STATUS/ CMD13 arg
0x45670000 (state transfer)
89.025315:sdcard_command_response 00 00 09 00  (state transfer)
[    5.777261] udevd[45]: starting version 175
90.032049:sdcard_normal_command          SEND_STATUS/ CMD13 arg
0x45670000 (state transfer)
90.032069:sdcard_command_response 00 00 09 00  (state transfer)
91.032126:sdcard_normal_command          SEND_STATUS/ CMD13 arg
0x45670000 (state transfer)
91.032148:sdcard_command_response 00 00 09 00  (state transfer)
91.854517:sdcard_normal_command  READ_MULTIPLE_BLOCK/ CMD18 arg
0x00351f80 (state transfer)
91.854547:sdcard_command_response 00 00 09 00  (state sendingdata)
91.854550:sdcard_read_block addr 0x6a3f0000 size 0x200
91.856100:sdcard_read_block addr 0x6a3f0200 size 0x200
91.856393:sdcard_read_block addr 0x6a3f0400 size 0x200
91.856692:sdcard_read_block addr 0x6a3f0600 size 0x200
91.857342:sdcard_read_block addr 0x6a3f0800 size 0x200
91.857652:sdcard_read_block addr 0x6a3f0a00 size 0x200
91.857955:sdcard_read_block addr 0x6a3f0c00 size 0x200
91.858256:sdcard_read_block addr 0x6a3f0e00 size 0x200
91.858979:sdcard_normal_command    STOP_TRANSMISSION/ CMD12 arg
0x00000000 (state sendingdata)
91.858990:sdcard_command_response 00 00 0b 00  (state transfer)
92.003670:sdcard_normal_command  READ_MULTIPLE_BLOCK/ CMD18 arg
0x00351ff0 (state transfer)
92.003692:sdcard_command_response 00 00 09 00  (state sendingdata)
92.003696:sdcard_read_block addr 0x6a3fe000 size 0x200
92.004126:sdcard_read_block addr 0x6a3fe200 size 0x200
92.004418:sdcard_read_block addr 0x6a3fe400 size 0x200
92.004704:sdcard_read_block addr 0x6a3fe600 size 0x200
92.005011:sdcard_read_block addr 0x6a3fe800 size 0x200
92.005313:sdcard_read_block addr 0x6a3fea00 size 0x200
92.005665:sdcard_read_block addr 0x6a3fec00 size 0x200
92.006023:sdcard_read_block addr 0x6a3fee00 size 0x200
92.006466:sdcard_normal_command    STOP_TRANSMISSION/ CMD12 arg
0x00000000 (state sendingdata)
92.006481:sdcard_command_response 00 00 0b 00  (state transfer)
92.022454:sdcard_normal_command  READ_MULTIPLE_BLOCK/ CMD18 arg
0x00000000 (state transfer)
92.022488:sdcard_command_response 00 00 09 00  (state sendingdata)
92.022497:sdcard_read_block addr 0x00000000 size 0x200
92.023021:sdcard_read_block addr 0x00000200 size 0x200
92.023436:sdcard_read_block addr 0x00000400 size 0x200
92.023841:sdcard_read_block addr 0x00000600 size 0x200
92.024179:sdcard_read_block addr 0x00000800 size 0x200
92.024555:sdcard_read_block addr 0x00000a00 size 0x200
92.024849:sdcard_read_block addr 0x00000c00 size 0x200
92.025151:sdcard_read_block addr 0x00000e00 size 0x200
92.025507:sdcard_normal_command    STOP_TRANSMISSION/ CMD12 arg
0x00000000 (state sendingdata)
92.025518:sdcard_command_response 00 00 0b 00  (state transfer)
92.043359:sdcard_normal_command          SEND_STATUS/ CMD13 arg
0x45670000 (state transfer)
92.043403:sdcard_command_response 00 00 09 00  (state transfer)
92.071967:sdcard_normal_command  READ_MULTIPLE_BLOCK/ CMD18 arg
0x00000008 (state transfer)
92.072003:sdcard_command_response 00 00 09 00  (state sendingdata)
92.072008:sdcard_read_block addr 0x00001000 size 0x200
92.072429:sdcard_read_block addr 0x00001200 size 0x200
92.072763:sdcard_read_block addr 0x00001400 size 0x200
92.073064:sdcard_read_block addr 0x00001600 size 0x200
92.073383:sdcard_read_block addr 0x00001800 size 0x200
92.073670:sdcard_read_block addr 0x00001a00 size 0x200
92.073949:sdcard_read_block addr 0x00001c00 size 0x200
92.074224:sdcard_read_block addr 0x00001e00 size 0x200
92.074552:sdcard_normal_command    STOP_TRANSMISSION/ CMD12 arg
0x00000000 (state sendingdata)
92.074562:sdcard_command_response 00 00 0b 00  (state transfer)
92.093569:sdcard_normal_command  READ_MULTIPLE_BLOCK/ CMD18 arg
0x00351ff8 (state transfer)
92.093590:sdcard_command_response 00 00 09 00  (state sendingdata)
92.093596:sdcard_read_block addr 0x6a3ff000 size 0x200
92.093994:sdcard_read_block addr 0x6a3ff200 size 0x200
92.094281:sdcard_read_block addr 0x6a3ff400 size 0x200
92.094568:sdcard_read_block addr 0x6a3ff600 size 0x200
92.094843:sdcard_read_block addr 0x6a3ff800 size 0x200
92.095118:sdcard_read_block addr 0x6a3ffa00 size 0x200
92.095389:sdcard_read_block addr 0x6a3ffc00 size 0x200
92.095654:sdcard_read_block addr 0x6a3ffe00 size 0x200
qemu-system-arm: terminating on signal 15 from pid 12630 (killall)
