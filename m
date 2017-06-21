Received: by 10.25.15.197 with SMTP id 66csp317546lfp;
        Wed, 21 Jun 2017 08:52:59 -0700 (PDT)
X-Received: by 10.237.36.33 with SMTP id r30mr42954782qtc.159.1498060379363;
        Wed, 21 Jun 2017 08:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498060379; cv=none;
        d=google.com; s=arc-20160816;
        b=pOwMNe+n5dQY+Q5wd/EiJOvRIvPYa+KtStNOBoJkapDKZo8cr7NRTGcG9uGZ9IfOGe
         woVA7m4Bh3FS/zU0ye8+uJ2r5Uuy9Cz26hR6VGV5APy4hI2FmiV1z2gLq7MEXZA3xtDU
         GZlbqE+8ceh168xHXi526pSGp5SaVI8XuX+nFebcjZBklhflGHzQ/8Q6ip2mAIWqBxCS
         fLm5qsAlsd+syuvY1aC1yeGGBa0loPKlhuxQqVig4UUnovhZaco2gmbbwZ7KCsGZsImH
         TBrhQhwAAjbrnUNmizuneK+ZVITj/ulzJZZl6pla9RhhBcr9lyQLPiYLrZSJEhDtgsdl
         bJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=xwEIuhCZaSGajdKIJ5GnEMGAHHpnpDpRuxKhDSa+X4I=;
        b=nXYrPt5mYx3a/rtHZeHlRbbVtrzmVOCcSx+1pSfp/6GGPSuMZtd+Ipy2Wm1hRvJBGP
         UXOiFxJUJFqsQvWSySny1IIx+8Z/j07+dxe9ca4pAK2PKQQWT0qiRQn65/iBwHwOWY99
         3mHli9jhW7pzs5B/toBugIT7TDnTPMT3T5UHLQNhqgU5QzZnByV1E4hTb+R3D9WfE9cd
         osNti0+eb64zz42dHeJl4EL6w1G/D1oOzpoTfo+1q7CBB395Oj5r4DQKQEGivqlBXCdh
         jiV88jNK5zlkf8Yp9yaQk59G3YoIube4VqZ/tBoDEnAP43ZjCoxrPanei6yrhItv0cbQ
         9BXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=THF6t4v1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t127si14656223qkd.279.2017.06.21.08.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Jun 2017 08:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=THF6t4v1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dNhw8-0000nO-Ji
	for alex.bennee@linaro.org; Wed, 21 Jun 2017 11:52:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ragaprasanth@gmail.com>) id 1dNgZA-0006H3-30
	for qemu-arm@nongnu.org; Wed, 21 Jun 2017 10:25:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ragaprasanth@gmail.com>) id 1dNgZ7-0004HT-Il
	for qemu-arm@nongnu.org; Wed, 21 Jun 2017 10:25:08 -0400
Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233]:33349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ragaprasanth@gmail.com>)
	id 1dNgZ7-0004H1-Cz
	for qemu-arm@nongnu.org; Wed, 21 Jun 2017 10:25:05 -0400
Received: by mail-qt0-x233.google.com with SMTP id u12so158491565qth.0
	for <qemu-arm@nongnu.org>; Wed, 21 Jun 2017 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=xwEIuhCZaSGajdKIJ5GnEMGAHHpnpDpRuxKhDSa+X4I=;
	b=THF6t4v18s96ncQxGflWLW2waXmOOtnlcoFlgEopT1scRAlYf0VtxgP8ajNL2O7HjU
	pKxVRcIAL4MQnQtPkk5+8Y9MBRkiT8H0j+VyqLmEg4rfHkCu5F3nN4e6Kd0IPrqGrx1I
	uyvlmWmsLRN3dqo/7eoAuf85kxq2JnNd+IY/uMdaaoMpjDwmJ1LiG0cyAeQ7dib2Fxbv
	EdhN5pP3FUmSvopAxVnnO3C36+16dVcd6gcvqf5hPySY5b6W0CmeSRPKVaSW7ci1jHzH
	dmy8oDVp8BUBOQlfEWkVD2fLeO9B9WCyCf4szusQ+rEYy/f1AIlKdpYZEnHCdNVQDcOL
	Gbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=xwEIuhCZaSGajdKIJ5GnEMGAHHpnpDpRuxKhDSa+X4I=;
	b=IO7ML1fTlO9sQWRVEidYSlmSWCY2EUT38QnMJNszWyHRbnW3T4PvBiM4El+yE8ASZu
	jVBZHuSyTEt8sOFhV0ARIQPSoFYGEfQNOvTNEaK+0xsMGCYyybfON7QDPj+6aEANO50M
	U5mAq5u+cO8vDyB9Gv6iUon35cA9b/IIRWqZOjQIeVVDGDH3jdvum2o9O/xxV4dGGilq
	fu2dxaQFfY+oSVI3yIK5Qkkro2JhjSWqIK6Tv8+J86Rl3fqOiviSOkZM4c6gJivGCg/H
	VPxpxoHKHCRl/gXe56+HzZi66R+DRlt4g+5G3cB4TpaLRNETb6gDdYFqTZlCeuEx5l+U
	7R8w==
X-Gm-Message-State: AKS2vOxi28hgxi4xadu6Jpn+z8lKHf+2ihumpcDBusJSBWOB3h0+e5YH
	4VrJtuSm1/KqUe/ovOdsxHLb3wknfMj+
X-Received: by 10.200.39.214 with SMTP id x22mr41399869qtx.80.1498055103091;
	Wed, 21 Jun 2017 07:25:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.82.170 with HTTP; Wed, 21 Jun 2017 07:24:42 -0700 (PDT)
From: PRASANTH R <ragaprasanth@gmail.com>
Date: Wed, 21 Jun 2017 19:54:42 +0530
Message-ID: <CAG7eodGZ+H_RuL2WfecS_rSC4hUhKomG8JbCbBJ9Vgb1gRjepQ@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="001a11402b5c4618a80552792256"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::233
X-Mailman-Approved-At: Wed, 21 Jun 2017 11:52:46 -0400
Subject: [Qemu-arm] error in booting vexpress
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YCkw9fu2uXr9

--001a11402b5c4618a80552792256
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can't boot the kernel, could anyone help me to resolve the issue?
is there any issue with the command passed?

$qemu-system-arm -M vexpress-a9 -dtb arch/arm/boot/dts/vexpress-v2p-ca9.dtb
-kernel arch/arm/boot/zImage -hda disk.img -serial stdio --append
"root=3D/dev/sda console=3DttyAMA0,115200"

WARNING: Image format was not specified for 'disk.img' and probing guessed
raw.
         Automatically detecting the format is dangerous for raw images,
write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions.
pulseaudio: set_sink_input_volume() failed
pulseaudio: Reason: Invalid argument
pulseaudio: set_sink_input_mute() failed
pulseaudio: Reason: Invalid argument
Warning: Orphaned drive without device:
id=3Dscsi0-hd0,file=3Ddisk.img,if=3Dscsi,bus=3D0,unit=3D0
Booting Linux on physical CPU 0x0
Initializing cgroup subsys cpuset
Linux version 4.4.0 (gcc version 4.9.4 ) #1 SMP Wed Jun 21 18:58:22 IST 201=
7
CPU: ARMv7 Processor [410fc090] revision 0 (ARMv7), cr=3D10c5387d
CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine model: V2P-CA9
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
PERCPU: Embedded 12 pages/cpu @87ebe000 s18240 r8192 d22720 u49152
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: root=3D/dev/sda console=3DttyAMA0,115200
log_buf_len individual max cpu contribution: 4096 bytes
log_buf_len total cpu_extra contributions: 12288 bytes
log_buf_len min size: 16384 bytes
log_buf_len: 32768 bytes
early log buf free: 14980(91%)
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 122728K/131072K available (4856K kernel code, 156K rwdata, 1388K
rodata, 288K init, 153K bss, 8344K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0x88800000 - 0xff800000   (1904 MB)
    lowmem  : 0x80000000 - 0x88000000   ( 128 MB)
    modules : 0x7f000000 - 0x80000000   (  16 MB)
      .text : 0x80008000 - 0x80621404   (6246 kB)
      .init : 0x80622000 - 0x8066a000   ( 288 kB)
      .data : 0x8066a000 - 0x80691060   ( 157 kB)
       .bss : 0x80694000 - 0x806ba47c   ( 154 kB)
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, Nodes=3D1
Hierarchical RCU implementation.
Build-time adjustment of leaf fanout to 32.
RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D4.
RCU: Adjusting geometry for rcu_fanout_leaf=3D32, nr_cpu_ids=3D4
NR_IRQS:16 nr_irqs:16 16
GIC CPU mask not found - kernel will fail to boot.
GIC CPU mask not found - kernel will fail to boot.
L2C: platform modifies aux control register: 0x02020000 -> 0x02420000
L2C: DT/platform modifies aux control register: 0x02020000 -> 0x02420000
L2C-310 enabling early BRESP for Cortex-A9
L2C-310 full line of zeros enabled for Cortex-A9
L2C-310 dynamic clock gating disabled, standby mode disabled
L2C-310 cache controller enabled, 8 ways, 128 kB
L2C-310: CACHE_ID 0x410000c8, AUX_CTRL 0x46420001
smp_twd: clock not found -2
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
clocksource: arm,sp804: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 1911260446275 ns
Console: colour dummy device 80x30
Calibrating local timer... 96.84MHz.
Calibrating delay loop... 712.29 BogoMIPS (lpj=3D3561472)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
Setting up static identity map for 0x60008280 - 0x600082d8
Brought up 1 CPUs
SMP: Total of 1 processors activated (712.29 BogoMIPS).
CPU: All CPU(s) started in SVC mode.
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:
19112604462750000 ns
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cpuidle: using governor menu
of_amba_device_create(): amba_device_add() failed (-19) for
/memory-controller@100e0000
of_amba_device_create(): amba_device_add() failed (-19) for
/memory-controller@100e1000
of_amba_device_create(): amba_device_add() failed (-19) for
/watchdog@100e5000
of_amba_device_create(): amba_device_add() failed (-19) for
/smb/motherboard/iofpga@7,00000000/sysctl@01000
of_amba_device_create(): amba_device_add() failed (-19) for
/smb/motherboard/iofpga@7,00000000/wdt@0f000
hw-breakpoint: debug architecture 0x4 unsupported.
Serial: AMBA PL011 UART driver
10009000.uart: ttyAMA0 at MMIO 0x10009000 (irq =3D 38, base_baud =3D 0) is =
a
PL011 rev1
console [ttyAMA0] enabled
1000a000.uart: ttyAMA1 at MMIO 0x1000a000 (irq =3D 39, base_baud =3D 0) is =
a
PL011 rev1
1000b000.uart: ttyAMA2 at MMIO 0x1000b000 (irq =3D 40, base_baud =3D 0) is =
a
PL011 rev1
1000c000.uart: ttyAMA3 at MMIO 0x1000c000 (irq =3D 41, base_baud =3D 0) is =
a
PL011 rev1
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
Advanced Linux Sound Architecture Driver Initialized.
clocksource: Switched to clocksource arm,sp804
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 1, 8192 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 1, 8192 bytes)
UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
hw perfevents: enabled with armv7_cortex_a9 PMU driver, 1 counters availabl=
e
futex hash table entries: 1024 (order: 4, 65536 bytes)
squashfs: version 4.0 (2009/01/31) Phillip Lougher
jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
9p: Installing v9fs 9p2000 file system support
io scheduler noop registered (default)
clcd-pl11x 10020000.clcd: PL111 rev2 at 0x10020000
clcd-pl11x 10020000.clcd: /clcd@10020000 hardware, 1024x768@59 display
Console: switching to colour frame buffer device 128x48
clcd-pl11x 1001f000.clcd: PL111 rev2 at 0x1001f000
clcd-pl11x 1001f000.clcd: /smb/motherboard/iofpga@7,00000000/clcd@1f000
hardware, 640x480@59 display
40000000.flash: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
0x000000 Chip ID 0x000000
Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
40000000.flash: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID
0x000000 Chip ID 0x000000
Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
Concatenating MTD devices:
(0): "40000000.flash"
(1): "40000000.flash"
into device "40000000.flash"
libphy: smsc911x-mdio: probed
smsc911x 4e000000.ethernet eth0: attached PHY driver [Generic PHY]
(mii_bus:phy_addr=3D4e000000.etherne:01, irq=3D-1)
smsc911x 4e000000.ethernet eth0: MAC Address:
isp1760 4f000000.usb: bus width: 32, oc: digital
isp1760 4f000000.usb: NXP ISP1760 USB Host Controller
isp1760 4f000000.usb: new USB bus registered, assigned bus number 1
isp1760 4f000000.usb: Scratch test failed.
isp1760 4f000000.usb: can't setup: -19
isp1760 4f000000.usb: USB bus 1 deregistered
usbcore: registered new interface driver usb-storage
mousedev: PS/2 mouse device common for all mice
rtc-pl031 10017000.rtc: rtc core: registered pl031 as rtc0
mmci-pl18x 10005000.mmci: Got CD GPIO
mmci-pl18x 10005000.mmci: Got WP GPIO
mmci-pl18x 10005000.mmci: No vqmmc regulator found
mmci-pl18x 10005000.mmci: mmc0: PL181 manf 41 rev0 at 0x10005000 irq 34,35
(pio)
ledtrig-cpu: registered to indicate activity on CPUs
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
aaci-pl041 10004000.aaci: ARM AC'97 Interface PL041 rev0 at 0x10004000, irq
33
aaci-pl041 10004000.aaci: FIFO 512 entries
oprofile: using arm/armv7-ca9
NET: Registered protocol family 17
9pnet: Installing 9P2000 support
Registering SWP/SWPB emulation handler
rtc-pl031 10017000.rtc: setting system clock to 2017-06-21 13:32:42 UTC
(1498051962)
ALSA device list:
  #0: ARM AC'97 Interface PL041 rev0 at 0x10004000, irq 33
input: AT Raw Set 2 keyboard as
/devices/platform/smb/smb:motherboard/smb:motherboard:iofpga@7
,00000000/10006000.kmi/serio0/input/input0
input: ImExPS/2 Generic Explorer Mouse as
/devices/platform/smb/smb:motherboard/smb:motherboard:iofpga@7
,00000000/10007000.kmi/serio1/input/input2
VFS: Cannot open root device "sda" or unknown-block(0,0): error -6
Please append a correct "root=3D" boot option; here are the available
partitions:
1f00          131072 mtdblock0  (driver?)
1f01           32768 mtdblock1  (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.4.0 #1
Hardware name: ARM-Versatile Express
[<800163bc>] (unwind_backtrace) from [<80012eb8>] (show_stack+0x10/0x14)
[<80012eb8>] (show_stack) from [<80240140>] (dump_stack+0x88/0x98)
[<80240140>] (dump_stack) from [<800a4808>] (panic+0x9c/0x204)
[<800a4808>] (panic) from [<80623250>] (mount_block_root+0x1c0/0x25c)
[<80623250>] (mount_block_root) from [<80623408>] (mount_root+0x11c/0x124)
[<80623408>] (mount_root) from [<80623568>] (prepare_namespace+0x158/0x1a0)
[<80623568>] (prepare_namespace) from [<80622eec>]
(kernel_init_freeable+0x268/0x278)
[<80622eec>] (kernel_init_freeable) from [<8049a96c>] (kernel_init+0x8/0xe8=
)
[<8049a96c>] (kernel_init) from [<8000f4f8>] (ret_from_fork+0x14/0x3c)
---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

Thanks & Regards,

--001a11402b5c4618a80552792256
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can&#39;t boot the kernel, could anyone help me to resol=
ve the issue?<div>is there any issue with the command passed?</div><div><br=
 clear=3D"all"><div><div class=3D"gmail_signature"><div dir=3D"ltr"><div di=
r=3D"ltr">$qemu-system-arm -M vexpress-a9 -dtb arch/arm/boot/dts/vexpress-v=
2p-ca9.dtb -kernel arch/arm/boot/zImage -hda disk.img -serial stdio --appen=
d &quot;root=3D/dev/sda console=3DttyAMA0,115200&quot;</div><div dir=3D"ltr=
"><br></div><div dir=3D"ltr">WARNING: Image format was not specified for &#=
39;disk.img&#39; and probing guessed raw.</div><div dir=3D"ltr">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Automatically detecting the format is dangerous for=
 raw images, write operations on block 0 will be restricted.</div><div dir=
=3D"ltr">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Specify the &#39;raw&#39; format=
 explicitly to remove the restrictions.</div><div dir=3D"ltr">pulseaudio: s=
et_sink_input_volume() failed</div><div dir=3D"ltr">pulseaudio: Reason: Inv=
alid argument</div><div dir=3D"ltr">pulseaudio: set_sink_input_mute() faile=
d</div><div dir=3D"ltr">pulseaudio: Reason: Invalid argument</div><div dir=
=3D"ltr">Warning: Orphaned drive without device: id=3Dscsi0-hd0,file=3Ddisk=
.img,if=3Dscsi,bus=3D0,unit=3D0</div><div dir=3D"ltr">Booting Linux on phys=
ical CPU 0x0</div><div dir=3D"ltr">Initializing cgroup subsys cpuset</div><=
div dir=3D"ltr">Linux version 4.4.0 (gcc version 4.9.4 ) #1 SMP Wed Jun 21 =
18:58:22 IST 2017</div><div dir=3D"ltr">CPU: ARMv7 Processor [410fc090] rev=
ision 0 (ARMv7), cr=3D10c5387d</div><div dir=3D"ltr">CPU: PIPT / VIPT nonal=
iasing data cache, VIPT nonaliasing instruction cache</div><div dir=3D"ltr"=
>Machine model: V2P-CA9</div><div dir=3D"ltr">Memory policy: Data cache wri=
teback</div><div dir=3D"ltr">CPU: All CPU(s) started in SVC mode.</div><div=
 dir=3D"ltr">PERCPU: Embedded 12 pages/cpu @87ebe000 s18240 r8192 d22720 u4=
9152</div><div dir=3D"ltr">Built 1 zonelists in Zone order, mobility groupi=
ng on.=C2=A0 Total pages: 32512</div><div dir=3D"ltr">Kernel command line: =
root=3D/dev/sda console=3DttyAMA0,115200</div><div dir=3D"ltr">log_buf_len =
individual max cpu contribution: 4096 bytes</div><div dir=3D"ltr">log_buf_l=
en total cpu_extra contributions: 12288 bytes</div><div dir=3D"ltr">log_buf=
_len min size: 16384 bytes</div><div dir=3D"ltr">log_buf_len: 32768 bytes</=
div><div dir=3D"ltr">early log buf free: 14980(91%)</div><div dir=3D"ltr">P=
ID hash table entries: 512 (order: -1, 2048 bytes)</div><div dir=3D"ltr">De=
ntry cache hash table entries: 16384 (order: 4, 65536 bytes)</div><div dir=
=3D"ltr">Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)</div>=
<div dir=3D"ltr">Memory: 122728K/131072K available (4856K kernel code, 156K=
 rwdata, 1388K rodata, 288K init, 153K bss, 8344K reserved, 0K cma-reserved=
)</div><div dir=3D"ltr">Virtual kernel memory layout:</div><div dir=3D"ltr"=
>=C2=A0 =C2=A0 vector =C2=A0: 0xffff0000 - 0xffff1000 =C2=A0 ( =C2=A0 4 kB)=
</div><div dir=3D"ltr">=C2=A0 =C2=A0 fixmap =C2=A0: 0xffc00000 - 0xfff00000=
 =C2=A0 (3072 kB)</div><div dir=3D"ltr">=C2=A0 =C2=A0 vmalloc : 0x88800000 =
- 0xff800000 =C2=A0 (1904 MB)</div><div dir=3D"ltr">=C2=A0 =C2=A0 lowmem =
=C2=A0: 0x80000000 - 0x88000000 =C2=A0 ( 128 MB)</div><div dir=3D"ltr">=C2=
=A0 =C2=A0 modules : 0x7f000000 - 0x80000000 =C2=A0 ( =C2=A016 MB)</div><di=
v dir=3D"ltr">=C2=A0 =C2=A0 =C2=A0 .text : 0x80008000 - 0x80621404 =C2=A0 (=
6246 kB)</div><div dir=3D"ltr">=C2=A0 =C2=A0 =C2=A0 .init : 0x80622000 - 0x=
8066a000 =C2=A0 ( 288 kB)</div><div dir=3D"ltr">=C2=A0 =C2=A0 =C2=A0 .data =
: 0x8066a000 - 0x80691060 =C2=A0 ( 157 kB)</div><div dir=3D"ltr">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0.bss : 0x80694000 - 0x806ba47c =C2=A0 ( 154 kB)</div><div =
dir=3D"ltr">SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, Node=
s=3D1</div><div dir=3D"ltr">Hierarchical RCU implementation.</div><div dir=
=3D"ltr"><span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</=
span>Build-time adjustment of leaf fanout to 32.</div><div dir=3D"ltr"><spa=
n class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>RCU rest=
ricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D4.</div><div dir=3D"ltr">RCU:=
 Adjusting geometry for rcu_fanout_leaf=3D32, nr_cpu_ids=3D4</div><div dir=
=3D"ltr">NR_IRQS:16 nr_irqs:16 16</div><div dir=3D"ltr">GIC CPU mask not fo=
und - kernel will fail to boot.</div><div dir=3D"ltr">GIC CPU mask not foun=
d - kernel will fail to boot.</div><div dir=3D"ltr">L2C: platform modifies =
aux control register: 0x02020000 -&gt; 0x02420000</div><div dir=3D"ltr">L2C=
: DT/platform modifies aux control register: 0x02020000 -&gt; 0x02420000</d=
iv><div dir=3D"ltr">L2C-310 enabling early BRESP for Cortex-A9</div><div di=
r=3D"ltr">L2C-310 full line of zeros enabled for Cortex-A9</div><div dir=3D=
"ltr">L2C-310 dynamic clock gating disabled, standby mode disabled</div><di=
v dir=3D"ltr">L2C-310 cache controller enabled, 8 ways, 128 kB</div><div di=
r=3D"ltr">L2C-310: CACHE_ID 0x410000c8, AUX_CTRL 0x46420001</div><div dir=
=3D"ltr">smp_twd: clock not found -2</div><div dir=3D"ltr">sched_clock: 32 =
bits at 24MHz, resolution 41ns, wraps every 89478484971ns</div><div dir=3D"=
ltr">clocksource: arm,sp804: mask: 0xffffffff max_cycles: 0xffffffff, max_i=
dle_ns: 1911260446275 ns</div><div dir=3D"ltr">Console: colour dummy device=
 80x30</div><div dir=3D"ltr">Calibrating local timer... 96.84MHz.</div><div=
 dir=3D"ltr">Calibrating delay loop... 712.29 BogoMIPS (lpj=3D3561472)</div=
><div dir=3D"ltr">pid_max: default: 32768 minimum: 301</div><div dir=3D"ltr=
">Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)</div><div dir=
=3D"ltr">Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)</=
div><div dir=3D"ltr">CPU: Testing write buffer coherency: ok</div><div dir=
=3D"ltr">CPU0: thread -1, cpu 0, socket 0, mpidr 80000000</div><div dir=3D"=
ltr">Setting up static identity map for 0x60008280 - 0x600082d8</div><div d=
ir=3D"ltr">Brought up 1 CPUs</div><div dir=3D"ltr">SMP: Total of 1 processo=
rs activated (712.29 BogoMIPS).</div><div dir=3D"ltr">CPU: All CPU(s) start=
ed in SVC mode.</div><div dir=3D"ltr">devtmpfs: initialized</div><div dir=
=3D"ltr">VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 =
rev 0</div><div dir=3D"ltr">clocksource: jiffies: mask: 0xffffffff max_cycl=
es: 0xffffffff, max_idle_ns: 19112604462750000 ns</div><div dir=3D"ltr">NET=
: Registered protocol family 16</div><div dir=3D"ltr">DMA: preallocated 256=
 KiB pool for atomic coherent allocations</div><div dir=3D"ltr">cpuidle: us=
ing governor ladder</div><div dir=3D"ltr">cpuidle: using governor menu</div=
><div dir=3D"ltr">of_amba_device_create(): amba_device_add() failed (-19) f=
or /memory-controller@100e0000</div><div dir=3D"ltr">of_amba_device_create(=
): amba_device_add() failed (-19) for /memory-controller@100e1000</div><div=
 dir=3D"ltr">of_amba_device_create(): amba_device_add() failed (-19) for /w=
atchdog@100e5000</div><div dir=3D"ltr">of_amba_device_create(): amba_device=
_add() failed (-19) for /smb/motherboard/iofpga@7,00000000/sysctl@01000</di=
v><div dir=3D"ltr">of_amba_device_create(): amba_device_add() failed (-19) =
for /smb/motherboard/iofpga@7,00000000/wdt@0f000</div><div dir=3D"ltr">hw-b=
reakpoint: debug architecture 0x4 unsupported.</div><div dir=3D"ltr">Serial=
: AMBA PL011 UART driver</div><div dir=3D"ltr">10009000.uart: ttyAMA0 at MM=
IO 0x10009000 (irq =3D 38, base_baud =3D 0) is a PL011 rev1</div><div dir=
=3D"ltr">console [ttyAMA0] enabled</div><div dir=3D"ltr">1000a000.uart: tty=
AMA1 at MMIO 0x1000a000 (irq =3D 39, base_baud =3D 0) is a PL011 rev1</div>=
<div dir=3D"ltr">1000b000.uart: ttyAMA2 at MMIO 0x1000b000 (irq =3D 40, bas=
e_baud =3D 0) is a PL011 rev1</div><div dir=3D"ltr">1000c000.uart: ttyAMA3 =
at MMIO 0x1000c000 (irq =3D 41, base_baud =3D 0) is a PL011 rev1</div><div =
dir=3D"ltr">SCSI subsystem initialized</div><div dir=3D"ltr">usbcore: regis=
tered new interface driver usbfs</div><div dir=3D"ltr">usbcore: registered =
new interface driver hub</div><div dir=3D"ltr">usbcore: registered new devi=
ce driver usb</div><div dir=3D"ltr">Advanced Linux Sound Architecture Drive=
r Initialized.</div><div dir=3D"ltr">clocksource: Switched to clocksource a=
rm,sp804</div><div dir=3D"ltr">NET: Registered protocol family 2</div><div =
dir=3D"ltr">TCP established hash table entries: 1024 (order: 0, 4096 bytes)=
</div><div dir=3D"ltr">TCP bind hash table entries: 1024 (order: 1, 8192 by=
tes)</div><div dir=3D"ltr">TCP: Hash tables configured (established 1024 bi=
nd 1024)</div><div dir=3D"ltr">UDP hash table entries: 256 (order: 1, 8192 =
bytes)</div><div dir=3D"ltr">UDP-Lite hash table entries: 256 (order: 1, 81=
92 bytes)</div><div dir=3D"ltr">NET: Registered protocol family 1</div><div=
 dir=3D"ltr">RPC: Registered named UNIX socket transport module.</div><div =
dir=3D"ltr">RPC: Registered udp transport module.</div><div dir=3D"ltr">RPC=
: Registered tcp transport module.</div><div dir=3D"ltr">RPC: Registered tc=
p NFSv4.1 backchannel transport module.</div><div dir=3D"ltr">hw perfevents=
: enabled with armv7_cortex_a9 PMU driver, 1 counters available</div><div d=
ir=3D"ltr">futex hash table entries: 1024 (order: 4, 65536 bytes)</div><div=
 dir=3D"ltr">squashfs: version 4.0 (2009/01/31) Phillip Lougher</div><div d=
ir=3D"ltr">jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.</div><=
div dir=3D"ltr">9p: Installing v9fs 9p2000 file system support</div><div di=
r=3D"ltr">io scheduler noop registered (default)</div><div dir=3D"ltr">clcd=
-pl11x 10020000.clcd: PL111 rev2 at 0x10020000</div><div dir=3D"ltr">clcd-p=
l11x 10020000.clcd: /clcd@10020000 hardware, 1024x768@59 display</div><div =
dir=3D"ltr">Console: switching to colour frame buffer device 128x48</div><d=
iv dir=3D"ltr">clcd-pl11x 1001f000.clcd: PL111 rev2 at 0x1001f000</div><div=
 dir=3D"ltr">clcd-pl11x 1001f000.clcd: /smb/motherboard/iofpga@7,00000000/c=
lcd@1f000 hardware, 640x480@59 display</div><div dir=3D"ltr">40000000.flash=
: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID 0x000000 Chip =
ID 0x000000</div><div dir=3D"ltr">Intel/Sharp Extended Query Table at 0x003=
1</div><div dir=3D"ltr">Using buffer write method</div><div dir=3D"ltr">400=
00000.flash: Found 2 x16 devices at 0x0 in 32-bit bank. Manufacturer ID 0x0=
00000 Chip ID 0x000000</div><div dir=3D"ltr">Intel/Sharp Extended Query Tab=
le at 0x0031</div><div dir=3D"ltr">Using buffer write method</div><div dir=
=3D"ltr">Concatenating MTD devices:</div><div dir=3D"ltr">(0): &quot;400000=
00.flash&quot;</div><div dir=3D"ltr">(1): &quot;40000000.flash&quot;</div><=
div dir=3D"ltr">into device &quot;40000000.flash&quot;</div><div dir=3D"ltr=
">libphy: smsc911x-mdio: probed</div><div dir=3D"ltr">smsc911x 4e000000.eth=
ernet eth0: attached PHY driver [Generic PHY] (mii_bus:phy_addr=3D4e000000.=
etherne:01, irq=3D-1)</div><div dir=3D"ltr">smsc911x 4e000000.ethernet eth0=
: MAC Address:=C2=A0</div><div dir=3D"ltr">isp1760 4f000000.usb: bus width:=
 32, oc: digital</div><div dir=3D"ltr">isp1760 4f000000.usb: NXP ISP1760 US=
B Host Controller</div><div dir=3D"ltr">isp1760 4f000000.usb: new USB bus r=
egistered, assigned bus number 1</div><div dir=3D"ltr">isp1760 4f000000.usb=
: Scratch test failed.</div><div dir=3D"ltr">isp1760 4f000000.usb: can&#39;=
t setup: -19</div><div dir=3D"ltr">isp1760 4f000000.usb: USB bus 1 deregist=
ered</div><div dir=3D"ltr">usbcore: registered new interface driver usb-sto=
rage</div><div dir=3D"ltr">mousedev: PS/2 mouse device common for all mice<=
/div><div dir=3D"ltr">rtc-pl031 10017000.rtc: rtc core: registered pl031 as=
 rtc0</div><div dir=3D"ltr">mmci-pl18x 10005000.mmci: Got CD GPIO</div><div=
 dir=3D"ltr">mmci-pl18x 10005000.mmci: Got WP GPIO</div><div dir=3D"ltr">mm=
ci-pl18x 10005000.mmci: No vqmmc regulator found</div><div dir=3D"ltr">mmci=
-pl18x 10005000.mmci: mmc0: PL181 manf 41 rev0 at 0x10005000 irq 34,35 (pio=
)</div><div dir=3D"ltr">ledtrig-cpu: registered to indicate activity on CPU=
s</div><div dir=3D"ltr">usbcore: registered new interface driver usbhid</di=
v><div dir=3D"ltr">usbhid: USB HID core driver</div><div dir=3D"ltr">aaci-p=
l041 10004000.aaci: ARM AC&#39;97 Interface PL041 rev0 at 0x10004000, irq 3=
3</div><div dir=3D"ltr">aaci-pl041 10004000.aaci: FIFO 512 entries</div><di=
v dir=3D"ltr">oprofile: using arm/armv7-ca9</div><div dir=3D"ltr">NET: Regi=
stered protocol family 17</div><div dir=3D"ltr">9pnet: Installing 9P2000 su=
pport</div><div dir=3D"ltr">Registering SWP/SWPB emulation handler</div><di=
v dir=3D"ltr">rtc-pl031 10017000.rtc: setting system clock to 2017-06-21 13=
:32:42 UTC (1498051962)</div><div dir=3D"ltr">ALSA device list:</div><div d=
ir=3D"ltr">=C2=A0 #0: ARM AC&#39;97 Interface PL041 rev0 at 0x10004000, irq=
 33</div><div dir=3D"ltr">input: AT Raw Set 2 keyboard as /devices/platform=
/smb/smb:motherboard/smb:motherboard:iofpga@7,00000000/10006000.kmi/serio0/=
input/input0</div><div dir=3D"ltr">input: ImExPS/2 Generic Explorer Mouse a=
s /devices/platform/smb/smb:motherboard/smb:motherboard:iofpga@7,00000000/1=
0007000.kmi/serio1/input/input2</div><div dir=3D"ltr">VFS: Cannot open root=
 device &quot;sda&quot; or unknown-block(0,0): error -6</div><div dir=3D"lt=
r">Please append a correct &quot;root=3D&quot; boot option; here are the av=
ailable partitions:</div><div dir=3D"ltr">1f00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0131072 mtdblock0 =C2=A0(driver?)</div><div dir=3D"ltr">1f01 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 32768 mtdblock1 =C2=A0(driver?)</div><div dir=
=3D"ltr">Kernel panic - not syncing: VFS: Unable to mount root fs on unknow=
n-block(0,0)</div><div dir=3D"ltr">CPU: 0 PID: 1 Comm: swapper/0 Not tainte=
d 4.4.0 #1</div><div dir=3D"ltr">Hardware name: ARM-Versatile Express</div>=
<div dir=3D"ltr">[&lt;800163bc&gt;] (unwind_backtrace) from [&lt;80012eb8&g=
t;] (show_stack+0x10/0x14)</div><div dir=3D"ltr">[&lt;80012eb8&gt;] (show_s=
tack) from [&lt;80240140&gt;] (dump_stack+0x88/0x98)</div><div dir=3D"ltr">=
[&lt;80240140&gt;] (dump_stack) from [&lt;800a4808&gt;] (panic+0x9c/0x204)<=
/div><div dir=3D"ltr">[&lt;800a4808&gt;] (panic) from [&lt;80623250&gt;] (m=
ount_block_root+0x1c0/0x25c)</div><div dir=3D"ltr">[&lt;80623250&gt;] (moun=
t_block_root) from [&lt;80623408&gt;] (mount_root+0x11c/0x124)</div><div di=
r=3D"ltr">[&lt;80623408&gt;] (mount_root) from [&lt;80623568&gt;] (prepare_=
namespace+0x158/0x1a0)</div><div dir=3D"ltr">[&lt;80623568&gt;] (prepare_na=
mespace) from [&lt;80622eec&gt;] (kernel_init_freeable+0x268/0x278)</div><d=
iv dir=3D"ltr">[&lt;80622eec&gt;] (kernel_init_freeable) from [&lt;8049a96c=
&gt;] (kernel_init+0x8/0xe8)</div><div dir=3D"ltr">[&lt;8049a96c&gt;] (kern=
el_init) from [&lt;8000f4f8&gt;] (ret_from_fork+0x14/0x3c)</div><div dir=3D=
"ltr">---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on =
unknown-block(0,0)</div><div><br></div></div><div dir=3D"ltr">Thanks &amp; =
Regards,<div><br></div></div></div></div>
</div></div>

--001a11402b5c4618a80552792256--
