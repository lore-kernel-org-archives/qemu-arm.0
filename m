Received: by 10.25.0.147 with SMTP id 141csp182656lfa;
        Fri, 3 Mar 2017 02:42:07 -0800 (PST)
X-Received: by 10.200.52.9 with SMTP id u9mr1833812qtb.29.1488537727029;
        Fri, 03 Mar 2017 02:42:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z46si9068125qtg.20.2017.03.03.02.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Mar 2017 02:42:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjkey-0003wn-2d
	for alex.bennee@linaro.org; Fri, 03 Mar 2017 05:42:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cjkeq-0003uA-6F
	for qemu-arm@nongnu.org; Fri, 03 Mar 2017 05:41:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cjken-0001rX-7d
	for qemu-arm@nongnu.org; Fri, 03 Mar 2017 05:41:56 -0500
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:33528)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jiahuanzhang90@gmail.com>)
	id 1cjken-0001r4-1J
	for qemu-arm@nongnu.org; Fri, 03 Mar 2017 05:41:53 -0500
Received: by mail-qk0-x233.google.com with SMTP id n127so168755898qkf.0
	for <qemu-arm@nongnu.org>; Fri, 03 Mar 2017 02:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Fw0BKkMDhPhT49z7pGtqTLhfIuTYXHVEF3Gy0ql1M+Y=;
	b=PnASnFC+pnu2ZsBhqk66CX+5IoDDrpYZuf5eBFFrO9KcQ/h+P4xVEm7McqttUiCxbT
	kd85zQh/6uwWYK/QUc9jw8uVa2DQH/3RY1w2/uWS2FkpeVNXTwRkLamP0tSm7rDeN3UG
	V/E2eo0GVlBE9IKCJJBVdjTYL+xaL+AFVEH7RN5G29zRKvKirhvAC8J2b7WTPHJ9nYCk
	OwKE3USEKtsQ3bnN+luZw8GapM0/9AAM16P2CgWHL6M90ilrSwcyupcdIu3UkdRgmVTc
	Du1LLgOM2KUUy0VoxlhAlQtiAcieoUP07XivnN9pm0Ot5qC0LNAVX2y11rLLBF7VDIqV
	DMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Fw0BKkMDhPhT49z7pGtqTLhfIuTYXHVEF3Gy0ql1M+Y=;
	b=AowfYTBem+NuCbDo4ZwbCncSgU2Gxl2jfpyFU3kh+k7VL+dolW4ODENA8aYOr2f6C1
	eAcZmWV2v18RaCHhCFvD/je4iXU1WzVwhPxQxYreis9jAggfEMbTQoEC/EkhE7Z6D/sd
	OUolUTdONFrYXF3j0d3yrbLc5TLiKih6pBM2moXoH8TFDqCEoxjksxI22H+jk3zkPqzc
	GqMcSKOUDY5PWcPB5+fcv7qC4CZLwivr1E04gwaXAT5kg6IVm9/mdUmMLVNC9urBHWF/
	2LI3/VgT4czX5KZQ9QrJK1Iq3H2TvGiJ6Ke2pJkQF+5KJmbBWeQDpAya68X5ZcVLrkuD
	LBJw==
X-Gm-Message-State: AMke39kJoqGp5gfjZzQxKrAOhLp0fK0rmvio5qBxutt0teTYlxnMilWjMHDJFGWUsqQKkBLWsz0XHnZrFiTF4g==
X-Received: by 10.237.33.143 with SMTP id l15mr1802692qtc.222.1488537710393;
	Fri, 03 Mar 2017 02:41:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.70 with HTTP; Fri, 3 Mar 2017 02:41:50 -0800 (PST)
From: Jiahuan Zhang <jiahuanzhang90@gmail.com>
Date: Fri, 3 Mar 2017 11:41:50 +0100
Message-ID: <CAJy91CZ0TO2Cz70RUtMUY86hMJ+MWK9zYB7rcGgJZmdy-DbEZw@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a113d0ce6769eac0549d131e4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::233
Subject: [Qemu-arm] "No filesystem could mount root" in versatilepb with
 linux and rootfs
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
X-TUID: b093UmvztM74

--001a113d0ce6769eac0549d131e4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi there,

I have a problem when running qemu to build a system with versatilepb,
linux zImage and rootfs. the qemu cmdl is as follows.

../qemu/build/arm-softmmu/qemu-system-arm.exe -M versatilepb -kernel zImage
-dtb versatile-pb.dtb -initrd ramfs.gz -nographic -append "console=3DttyAMA=
0
root=3D/dev/ram0"

However, the running result is the same as the case without the initrd
file, which is "Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(1,0)".

The kernel is configured with versatile_defconfig, ramfs.gz is created by
busybox 1.25.1. I am using QEMU 2.8.50 and Linux 4.7.

The whole booting message is in the end of the message.

I see "vpb_sic_write: Bad register offset 0x2c". Is it a qemu issue? Or
something i did is wrong or not enough?

Please help. Thanks in advance.

Best,
Jiahuan



$ ../qemu/build/arm-softmmu/qemu-system-arm.exe -M versatilepb -kernel
zImage -dtb versatile-pb.dtb -initrd ramfs.gz -nographic -append
"console=3DttyAMA0 root=3D/dev/ram0"
trying to register pipe
pipe registerd
dsound: Could not initialize DirectSoundCapture
dsound: Reason: No sound driver is available for use, or the given GUID is
not a valid DirectSound device ID
Uncompressing Linux... done, booting the kernel.
vpb_sic_write: Bad register offset 0x2c
Booting Linux on physical CPU 0x0
Linux version 4.7.0 (jiahuan@jiahuan-VirtualBox) (gcc version 4.9.3
20141031 (prerelease) (Linaro GCC 2014.11) ) #1 Fri Mar 3 09:53:20 CET 2017
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00093177
CPU: VIVT data cache, VIVT instruction cache
Machine model: ARM Versatile PB
Memory policy: Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: console=3DttyAMA0 root=3D/dev/ram0
PID hash table entries: 512 (order: -1, 2048 bytes)
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Memory: 124224K/131072K available (3321K kernel code, 115K rwdata, 920K
rodata, 156K init, 130K bss, 6848K reserved, 0K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xc8800000 - 0xff800000   ( 880 MB)
    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
    modules : 0xbf000000 - 0xc0000000   (  16 MB)
      .text : 0xc0008000 - 0xc042ca68   (4243 kB)
      .init : 0xc042d000 - 0xc0454000   ( 156 kB)
      .data : 0xc0454000 - 0xc0470f00   ( 116 kB)
       .bss : 0xc0470f00 - 0xc0491728   ( 131 kB)
NR_IRQS:16 nr_irqs:16 16
VIC @c8800000: id 0x00041190, vendor 0x41
FPGA IRQ chip 0 "intc" @ c8802000, 20 irqs, parent IRQ: 47
clocksource: arm,sp804: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 1911260446275 ns
sched_clock: 32 bits at 1000kHz, resolution 1000ns, wraps every
2147483647500ns
sched_clock: 32 bits at 24MHz, resolution 41ns, wraps every 89478484971ns
Console: colour dummy device 80x30
Calibrating delay loop... 769.63 BogoMIPS (lpj=3D3848192)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x8400 - 0x8458
VFP support v0.3: implementor 41 architecture 1 part 10 variant 9 rev 0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:
19112604462750000 ns
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
of_amba_device_create(): amba_device_add() failed (-19) for
/amba/smc@10100000
of_amba_device_create(): amba_device_add() failed (-19) for
/amba/mpmc@10110000
of_amba_device_create(): amba_device_add() failed (-19) for
/amba/sctl@101e0000
of_amba_device_create(): amba_device_add() failed (-19) for
/amba/watchdog@101e1000
of_amba_device_create(): amba_device_add() failed (-19) for
/amba/sci@101f0000
of_amba_device_create(): amba_device_add() failed (-19) for
/amba/ssp@101f4000
of_amba_device_create(): amba_device_add() failed (-19) for
/amba/fpga/sci@a000
Serial: AMBA PL011 UART driver
101f1000.uart: ttyAMA0 at MMIO 0x101f1000 (irq =3D 28, base_baud =3D 0) is =
a
PL011 rev1
console [ttyAMA0] enabled
101f2000.uart: ttyAMA1 at MMIO 0x101f2000 (irq =3D 29, base_baud =3D 0) is =
a
PL011 rev1
101f3000.uart: ttyAMA2 at MMIO 0x101f3000 (irq =3D 30, base_baud =3D 0) is =
a
PL011 rev1
uart-pl011 10009000.uart: aliased and non-aliased serial devices found in
device tree. Serial port enumeration may be unpredictable.
10009000.uart: ttyAMA3 at MMIO 0x10009000 (irq =3D 54, base_baud =3D 0) is =
a
PL011 rev1
clocksource: Switched to clocksource arm,sp804
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 940K (c4000000 - c40eb000)
NetWinder Floating Point Emulator V0.97 (double precision)
futex hash table entries: 256 (order: -1, 3072 bytes)
workingset: timestamp_bits=3D29 max_order=3D15 bucket_order=3D0
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
pl061_gpio 101e4000.gpio: PL061 GPIO chip @0x101e4000 registered
pl061_gpio 101e5000.gpio: PL061 GPIO chip @0x101e5000 registered
pl061_gpio 101e6000.gpio: PL061 GPIO chip @0x101e6000 registered
pl061_gpio 101e7000.gpio: PL061 GPIO chip @0x101e7000 registered
clcd-pl11x dev:20: PL110 rev0 at 0x10120000
clcd-pl11x dev:20: Versatile hardware, VGA display
Console: switching to colour frame buffer device 80x60
brd: module loaded
smc91x.c: v1.1, sep 22 2004 by Nicolas Pitre <nico@fluxnic.net>
smc91x 10010000.net eth0: SMC91C11xFD (rev 1) at c8a66000 IRQ 41
smc91x 10010000.net eth0: Ethernet addr: 52:54:00:12:34:56
mousedev: PS/2 mouse device common for all mice
rtc-ds1307 0-0068: rtc core: registered ds1338 as rtc0
rtc-ds1307 0-0068: 56 bytes nvram
versatile reboot driver registered
mmci-pl18x fpga:05: mmc0: PL181 manf 41 rev0 at 0x10005000 irq 59,60 (pio)
mmci-pl18x fpga:0b: mmc1: PL181 manf 41 rev0 at 0x1000b000 irq 49,50 (pio)
input: AT Raw Set 2 keyboard as /devices/platform/amba/amba:
fpga/10006000.kmi/serio0/input/input0
leds-syscon 10000000.core-module:led@08.0: registered LED versatile:0
leds-syscon 10000000.core-module:led@08.1: registered LED versatile:1
leds-syscon 10000000.core-module:led@08.2: registered LED versatile:2
leds-syscon 10000000.core-module:led@08.3: registered LED versatile:3
leds-syscon 10000000.core-module:led@08.4: registered LED versatile:4
leds-syscon 10000000.core-module:led@08.5: registered LED versatile:5
leds-syscon 10000000.core-module:led@08.6: registered LED versatile:6
leds-syscon 10000000.core-module:led@08.7: registered LED versatile:7
ledtrig-cpu: registered to indicate activity on CPUs
NET: Registered protocol family 17
rtc-ds1307 0-0068: setting system clock to 2017-03-03 09:53:29 UTC
(1488534809)
input: ImExPS/2 BYD TouchPad as /devices/platform/amba/amba:
fpga/10007000.kmi/serio1/input/input2
List of all partitions:
0100            4096 ram0  (driver?)
0101            4096 ram1  (driver?)
0102            4096 ram2  (driver?)
0103            4096 ram3  (driver?)
0104            4096 ram4  (driver?)
0105            4096 ram5  (driver?)
0106            4096 ram6  (driver?)
0107            4096 ram7  (driver?)
0108            4096 ram8  (driver?)
0109            4096 ram9  (driver?)
010a            4096 ram10  (driver?)
010b            4096 ram11  (driver?)
010c            4096 ram12  (driver?)
010d            4096 ram13  (driver?)
010e            4096 ram14  (driver?)
010f            4096 ram15  (driver?)
No filesystem could mount root, tried:  ext2 cramfs minix romfs
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(1,0)
CPU: 0 PID: 1 Comm: swapper Not tainted 4.7.0 #1
Hardware name: ARM-Versatile (Device Tree Support)
[<c001b1f4>] (unwind_backtrace) from [<c001861c>] (show_stack+0x10/0x14)
[<c001861c>] (show_stack) from [<c006f9e8>] (panic+0xb4/0x228)
[<c006f9e8>] (panic) from [<c042e1a0>] (mount_block_root+0x20c/0x284)
[<c042e1a0>] (mount_block_root) from [<c042e40c>] (mount_root+0xf8/0x124)
[<c042e40c>] (mount_root) from [<c042e598>] (prepare_namespace+0x160/0x1b4)
[<c042e598>] (prepare_namespace) from [<c042ddb4>]
(kernel_init_freeable+0x184/0x1cc)
[<c042ddb4>] (kernel_init_freeable) from [<c0329700>] (kernel_init+0x8/0xf8=
)
[<c0329700>] (kernel_init) from [<c0014e30>] (ret_from_fork+0x14/0x24)
---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(1,0)

--001a113d0ce6769eac0549d131e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi there,</div><div><br></div><div>I have a problem w=
hen running qemu to build a system with versatilepb, linux zImage and rootf=
s. the qemu cmdl is as follows.</div><div><br></div><div>../qemu/build/arm-=
softmmu/<wbr>qemu-system-arm.exe -M versatilepb -kernel zImage -dtb versati=
le-pb.dtb -initrd ramfs.gz -nographic -append &quot;console=3DttyAMA0 root=
=3D/dev/ram0&quot;</div><div><br></div><div>However, the running result is =
the same as the case without the initrd file, which is &quot;Kernel panic -=
 not syncing: VFS: Unable to mount root fs on unknown-block(1,0)&quot;.</di=
v><div><br></div><div>The kernel is configured with versatile_defconfig, ra=
mfs.gz is created by busybox 1.25.1. I am using QEMU 2.8.50 and Linux 4.7.<=
/div><div><br></div><div>The whole booting message is in the end of the mes=
sage.</div><div><br></div><div>I see &quot;<font size=3D"1">vpb_sic_write: =
Bad register offset 0x2c<span></span></font>&quot;. Is it a qemu issue? Or =
something i did is wrong or not enough?</div><div><br></div><div>Please hel=
p. Thanks in advance.</div><div><br></div><div>Best,</div><div>Jiahuan</div=
><div><br></div><div><br></div><div><div><font size=3D"1"><span><span><span=
><br></span></span></span></font></div><div><font size=3D"1">$ ../qemu/buil=
d/arm-softmmu/<wbr>qemu-system-arm.exe -M versatilepb -kernel zImage -dtb v=
ersatile-pb.dtb -initrd ramfs.gz -nographic -append &quot;console=3DttyAMA0=
 root=3D/dev/ram0&quot;<br>trying to register pipe<br>pipe registerd<br>dso=
und: Could not initialize DirectSoundCapture<br>dsound: Reason: No sound dr=
iver is available for use, or the given GUID is not a valid DirectSound dev=
ice ID<br>Uncompressing Linux... done, booting the kernel.<br>vpb_sic_write=
: Bad register offset 0x2c<br>Booting Linux on physical CPU 0x0<br>Linux ve=
rsion 4.7.0 (jiahuan@jiahuan-VirtualBox) (gcc version 4.9.3 20141031 (prere=
lease) (Linaro GCC 2014.11) ) #1 Fri Mar 3 09:53:20 CET 2017<br>CPU: ARM926=
EJ-S [41069265] revision 5 (ARMv5TEJ), cr=3D00093177<br>CPU: VIVT data cach=
e, VIVT instruction cache<br>Machine model: ARM Versatile PB<br>Memory poli=
cy: Data cache writeback<br>Built 1 zonelists in Zone order, mobility group=
ing on.=C2=A0 Total pages: 32512<br>Kernel command line: console=3DttyAMA0 =
root=3D/dev/ram0<br>PID hash table entries: 512 (order: -1, 2048 bytes)<br>=
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)<br>Inode-cac=
he hash table entries: 8192 (order: 3, 32768 bytes)<br>Memory: 124224K/1310=
72K available (3321K kernel code, 115K rwdata, 920K rodata, 156K init, 130K=
 bss, 6848K reserved, 0K cma-reserved)<br>Virtual kernel memory layout:<br>=
=C2=A0=C2=A0=C2=A0 vector=C2=A0 : 0xffff0000 - 0xffff1000=C2=A0=C2=A0 (=C2=
=A0=C2=A0 4 kB)<br>=C2=A0=C2=A0=C2=A0 fixmap=C2=A0 : 0xffc00000 - 0xfff0000=
0=C2=A0=C2=A0 (3072 kB)<br>=C2=A0=C2=A0=C2=A0 vmalloc : 0xc8800000 - 0xff80=
0000=C2=A0=C2=A0 ( 880 MB)<br>=C2=A0=C2=A0=C2=A0 lowmem=C2=A0 : 0xc0000000 =
- 0xc8000000=C2=A0=C2=A0 ( 128 MB)<br>=C2=A0=C2=A0=C2=A0 modules : 0xbf0000=
00 - 0xc0000000=C2=A0=C2=A0 (=C2=A0 16 MB)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .text : 0xc0008000 - 0xc042ca68=C2=A0=C2=A0 (4243 kB)<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .init : 0xc042d000 - 0xc0454000=C2=A0=C2=A0 ( 156 kB)<br=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .data : 0xc0454000 - 0xc0470f00=C2=A0=C2=A0=
 ( 116 kB)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss : 0xc0470f00 - 0xc0=
491728=C2=A0=C2=A0 ( 131 kB)<br>NR_IRQS:16 nr_irqs:16 16<br>VIC @c8800000: =
id 0x00041190, vendor 0x41<br>FPGA IRQ chip 0 &quot;intc&quot; @ c8802000, =
20 irqs, parent IRQ: 47<br>clocksource: arm,sp804: mask: 0xffffffff max_cyc=
les: 0xffffffff, max_idle_ns: 1911260446275 ns<br>sched_clock: 32 bits at 1=
000kHz, resolution 1000ns, wraps every 2147483647500ns<br>sched_clock: 32 b=
its at 24MHz, resolution 41ns, wraps every 89478484971ns<br>Console: colour=
 dummy device 80x30<br>Calibrating delay loop... 769.63 BogoMIPS (lpj=3D384=
8192)<br>pid_max: default: 32768 minimum: 301<br>Mount-cache hash table ent=
ries: 1024 (order: 0, 4096 bytes)<br>Mountpoint-cache hash table entries: 1=
024 (order: 0, 4096 bytes)<br>CPU: Testing write buffer coherency: ok<br>Se=
tting up static identity map for 0x8400 - 0x8458<br>VFP support v0.3: imple=
mentor 41 architecture 1 part 10 variant 9 rev 0<br>clocksource: jiffies: m=
ask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns<b=
r>NET: Registered protocol family 16<br>DMA: preallocated 256 KiB pool for =
atomic coherent allocations<br>of_amba_device_create(): amba_device_add() f=
ailed (-19) for /amba/smc@10100000<br>of_amba_device_create(): amba_device_=
add() failed (-19) for /amba/mpmc@10110000<br>of_amba_device_create(): amba=
_device_add() failed (-19) for /amba/sctl@101e0000<br>of_amba_device_create=
(): amba_device_add() failed (-19) for /amba/watchdog@101e1000<br>of_amba_d=
evice_create(): amba_device_add() failed (-19) for /amba/sci@101f0000<br>of=
_amba_device_create(): amba_device_add() failed (-19) for /amba/ssp@101f400=
0<br>of_amba_device_create(): amba_device_add() failed (-19) for /amba/fpga=
/sci@a000<br>Serial: AMBA PL011 UART driver<br>101f1000.uart: ttyAMA0 at MM=
IO 0x101f1000 (irq =3D 28, base_baud =3D 0) is a PL011 rev1<br>console [tty=
AMA0] enabled<br>101f2000.uart: ttyAMA1 at MMIO 0x101f2000 (irq =3D 29, bas=
e_baud =3D 0) is a PL011 rev1<br>101f3000.uart: ttyAMA2 at MMIO 0x101f3000 =
(irq =3D 30, base_baud =3D 0) is a PL011 rev1<br>uart-pl011 10009000.uart: =
aliased and non-aliased serial devices found in device tree. Serial port en=
umeration may be unpredictable.<br>10009000.uart: ttyAMA3 at MMIO 0x1000900=
0 (irq =3D 54, base_baud =3D 0) is a PL011 rev1<br>clocksource: Switched to=
 clocksource arm,sp804<br>NET: Registered protocol family 2<br>TCP establis=
hed hash table entries: 1024 (order: 0, 4096 bytes)<br>TCP bind hash table =
entries: 1024 (order: 0, 4096 bytes)<br>TCP: Hash tables configured (establ=
ished 1024 bind 1024)<br>UDP hash table entries: 256 (order: 0, 4096 bytes)=
<br>UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)<br>NET: Registe=
red protocol family 1<br>RPC: Registered named UNIX socket transport module=
.<br>RPC: Registered udp transport module.<br>RPC: Registered tcp transport=
 module.<br>RPC: Registered tcp NFSv4.1 backchannel transport module.<br>Tr=
ying to unpack rootfs image as initramfs...<br>Freeing initrd memory: 940K =
(c4000000 - c40eb000)<br>NetWinder Floating Point Emulator V0.97 (double pr=
ecision)<br>futex hash table entries: 256 (order: -1, 3072 bytes)<br>workin=
gset: timestamp_bits=3D29 max_order=3D15 bucket_order=3D0<br>Installing knf=
sd (copyright (C) 1996 <a href=3D"mailto:okir@monad.swb.de" target=3D"_blan=
k">okir@monad.swb.de</a>).<br>jffs2: version 2.2. (NAND) =C2=A9 2001-2006 R=
ed Hat, Inc.<br>romfs: ROMFS MTD (C) 2007 Red Hat, Inc.<br>Block layer SCSI=
 generic (bsg) driver version 0.4 loaded (major 252)<br>io scheduler noop r=
egistered<br>io scheduler deadline registered<br>io scheduler cfq registere=
d (default)<br>pl061_gpio 101e4000.gpio: PL061 GPIO chip @0x101e4000 regist=
ered<br>pl061_gpio 101e5000.gpio: PL061 GPIO chip @0x101e5000 registered<br=
>pl061_gpio 101e6000.gpio: PL061 GPIO chip @0x101e6000 registered<br>pl061_=
gpio 101e7000.gpio: PL061 GPIO chip @0x101e7000 registered<br>clcd-pl11x de=
v:20: PL110 rev0 at 0x10120000<br>clcd-pl11x dev:20: Versatile hardware, VG=
A display<br>Console: switching to colour frame buffer device 80x60<br>brd:=
 module loaded<br>smc91x.c: v1.1, sep 22 2004 by Nicolas Pitre &lt;<a href=
=3D"mailto:nico@fluxnic.net" target=3D"_blank">nico@fluxnic.net</a>&gt;<br>=
smc91x <a href=3D"http://10010000.net/" target=3D"_blank">10010000.net</a> =
eth0: SMC91C11xFD (rev 1) at c8a66000 IRQ 41</font></div><div><font size=3D=
"1">smc91x <a href=3D"http://10010000.net/" target=3D"_blank">10010000.net<=
/a> eth0: Ethernet addr: 52:54:00:12:34:56<br>mousedev: PS/2 mouse device c=
ommon for all mice<br>rtc-ds1307 0-0068: rtc core: registered ds1338 as rtc=
0<br>rtc-ds1307 0-0068: 56 bytes nvram<br>versatile reboot driver registere=
d<br>mmci-pl18x fpga:05: mmc0: PL181 manf 41 rev0 at 0x10005000 irq 59,60 (=
pio)<br>mmci-pl18x fpga:0b: mmc1: PL181 manf 41 rev0 at 0x1000b000 irq 49,5=
0 (pio)<br>input: AT Raw Set 2 keyboard as /devices/platform/amba/amba:<wbr=
>fpga/10006000.kmi/serio0/<wbr>input/input0<br>leds-syscon 10000000.core-mo=
dule:led@08.0: registered LED versatile:0<br>leds-syscon 10000000.core-modu=
le:led@08.1: registered LED versatile:1<br>leds-syscon 10000000.core-module=
:led@08.2: registered LED versatile:2<br>leds-syscon 10000000.core-module:l=
ed@08.3: registered LED versatile:3<br>leds-syscon 10000000.core-module:led=
@08.4: registered LED versatile:4<br>leds-syscon 10000000.core-module:led@0=
8.5: registered LED versatile:5<br>leds-syscon 10000000.core-module:led@08.=
6: registered LED versatile:6<br>leds-syscon 10000000.core-module:led@08.7:=
 registered LED versatile:7<br>ledtrig-cpu: registered to indicate activity=
 on CPUs<br>NET: Registered protocol family 17<br>rtc-ds1307 0-0068: settin=
g system clock to 2017-03-03 09:53:29 UTC (1488534809)<br>input: ImExPS/2 B=
YD TouchPad as /devices/platform/amba/amba:<wbr>fpga/10007000.kmi/serio1/<w=
br>input/input2<br>List of all partitions:<br>0100=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 ram0=C2=A0 (driver?)<br>010=
1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 ra=
m1=C2=A0 (driver?)<br>0102=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 4096 ram2=C2=A0 (driver?)<br>0103=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 ram3=C2=A0 (driver?)<br>=
0104=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096=
 ram4=C2=A0 (driver?)<br>0105=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 4096 ram5=C2=A0 (driver?)<br>0106=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 ram6=C2=A0 (driver?)<=
br>0107=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4=
096 ram7=C2=A0 (driver?)<br>0108=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 4096 ram8=C2=A0 (driver?)<br>0109=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 ram9=C2=A0 (driver=
?)<br>010a=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 4096 ram10=C2=A0 (driver?)<br>010b=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 ram11=C2=A0 (driver?)<br>010c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 ram12=C2=A0 =
(driver?)<br>010d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 4096 ram13=C2=A0 (driver?)<br>010e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 ram14=C2=A0 (driver?)<br>010f=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 ram15=
=C2=A0 (driver?)<br>No filesystem could mount root, tried:=C2=A0 ext2 cramf=
s minix romfs<br>Kernel panic - not syncing: VFS: Unable to mount root fs o=
n unknown-block(1,0)<br>CPU: 0 PID: 1 Comm: swapper Not tainted 4.7.0 #1<br=
>Hardware name: ARM-Versatile (Device Tree Support)<br>[&lt;c001b1f4&gt;] (=
unwind_backtrace) from [&lt;c001861c&gt;] (show_stack+0x10/0x14)<br>[&lt;c0=
01861c&gt;] (show_stack) from [&lt;c006f9e8&gt;] (panic+0xb4/0x228)<br>[&lt=
;c006f9e8&gt;] (panic) from [&lt;c042e1a0&gt;] (mount_block_root+0x20c/0x28=
4)<br>[&lt;c042e1a0&gt;] (mount_block_root) from [&lt;c042e40c&gt;] (mount_=
root+0xf8/0x124)<br>[&lt;c042e40c&gt;] (mount_root) from [&lt;c042e598&gt;]=
 (prepare_namespace+0x160/<wbr>0x1b4)<br>[&lt;c042e598&gt;] (prepare_namesp=
ace) from [&lt;c042ddb4&gt;] (kernel_init_freeable+0x184/<wbr>0x1cc)<br>[&l=
t;c042ddb4&gt;] (kernel_init_freeable) from [&lt;c0329700&gt;] (kernel_init=
+0x8/0xf8)<br>[&lt;c0329700&gt;] (kernel_init) from [&lt;c0014e30&gt;] (ret=
_from_fork+0x14/0x24)<br>---[ end Kernel panic - not syncing: VFS: Unable t=
o mount root fs on unknown-block(1,0)<span><span><span><span></span></span>=
</span></span></font></div></div></div>

--001a113d0ce6769eac0549d131e4--
