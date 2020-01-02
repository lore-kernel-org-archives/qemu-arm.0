Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp19055128lff;
        Thu, 2 Jan 2020 07:18:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGeAfqGunI9s9nupki0jUhA6h5uAVQgqBYpmntU78Sl01/Tt15+ELyARWIyAsR6kMGGAHs
X-Received: by 2002:aca:5745:: with SMTP id l66mr2417234oib.3.1577978329008;
        Thu, 02 Jan 2020 07:18:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577978329; cv=none;
        d=google.com; s=arc-20160816;
        b=HnBlRxM9JQTB2IqW6eWarxqBkv+Dg++OYR/60YzhlnC7Vo3h5Ovekt4njm//gyN0oG
         8++FGVC9eKIPs/LaoAeX+RdpVePMueSiiz9CITJA1Pu5Y/o1ek5csbJ/BlDJ7CUbNvBp
         ZSG/GwuJHAIfx6W5LK+uuZAuFx9lS0qe1Lp6WIXRIhy5bEFuJ8cgVJJ4YWehqcHalxhV
         BDikWP9NyyMdgpvm5PqIBwhGWQLOp2pi/aIjPvkdXe5EjvIjHS1pqosWJLingVXbcvVa
         /b8sbn0olHVpSfEkGyShoSlm7cGBGjS76G2Z3XS9K1MtO6lSNHG30mO8uq04sCwp7G1k
         snAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=bXrdUfhwOFEsEguHIvl71+7I0UnOb8Mqevv6KD5HoYo=;
        b=0BJNUlZUpLg67v1yUDc17yLWpfxPYCzbldp+vx4H1KzHQ+E/H7o4kZpc+l60Kawpjb
         Rfh++yFwzNa7C1pgQT6EWZNpe0MWENrLRvpof7oiwnToL4+uW3T+G5oGQWnDjusvGzsi
         Bx3cQaWlSsxOuoR9V1+fGp8ORkfH/SluFbBnOY/JDVpMFnFhZb4ftAJOros2Q08X3dtY
         VTTlrAaNcoUpykKomSZfq0bP3Xd56nda/jC+y2KA4hYQ/oxpYSWsXmn7oYnWhx8OVKQ0
         4MKoOWC+I02L3oqRONskXZiSg/lyknHBQaAoIJTezkVxXlcNzksfeKA380Pn0ryXXVUg
         gsrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDdtl8l3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21si24675445oic.126.2020.01.02.07.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2020 07:18:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDdtl8l3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1in2FM-0000oG-7i
	for alex.bennee@linaro.org; Thu, 02 Jan 2020 10:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <freedom.day@gmail.com>) id 1in18s-00063e-3P
 for qemu-arm@nongnu.org; Thu, 02 Jan 2020 09:08:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <freedom.day@gmail.com>) id 1in18p-0005g4-WB
 for qemu-arm@nongnu.org; Thu, 02 Jan 2020 09:08:01 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:45237)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <freedom.day@gmail.com>)
 id 1in18p-0005e0-Ml
 for qemu-arm@nongnu.org; Thu, 02 Jan 2020 09:07:59 -0500
Received: by mail-il1-x144.google.com with SMTP id p8so34132199iln.12
 for <qemu-arm@nongnu.org>; Thu, 02 Jan 2020 06:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bXrdUfhwOFEsEguHIvl71+7I0UnOb8Mqevv6KD5HoYo=;
 b=BDdtl8l3mHHqCg9LvAWE96A7+gVdm6TkYXWjYeRl58u9lNI8iKuvYVduVvXr1bIM/C
 RmZv2Esm2mjE1TxJUTfidIFAslII5Op1TFuLKcZ0CVHwKL3Pass3vEPNEoDky1Rm+Zw4
 Nelcz4t5kHCxGhb5T8QJs2QaCXmbu6HrNGjeOvjtFRmA0eA6nJsklF8AWLImH7P4SU65
 KxzradWXa8XXm+0TU+t0SsHNkbl7UE6CAAjZwEWuIR+iWHPDWK7IcRtvfuWcPEMDjLq6
 lchpb82TKFg3sI5Enfvkk65zsyFjBD8GWG85yXX63+bbrgCsaZXDqXcYjcUbE0Udyqe1
 6S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bXrdUfhwOFEsEguHIvl71+7I0UnOb8Mqevv6KD5HoYo=;
 b=BVDCe3Pd7nK1RSZ1fabLAbC1ZeBqqm0k9HIr/BRVuyM9vXj772eHQ2mVLPzzxG4PSB
 aL3D2g9C2aWNpePRgfYWVpMmGIx77GjbXeIHaQXadqnhSnsF1irTXXsidAE9Wct24NW9
 e1Om9kxI/FB/XgFE/SXojOaxG9IhaCzUChIhqhe6NnZmWa5apdCrmW/K9MYHUyoIVggU
 TY5wCRL8A0vRTtUea46AjQtNhYozefXn/5uuRiUCVAWkjl8rBk4C1bvO1q4nLirM7aR6
 u+MSydUKfhVGJab1BEDRV2+82yy8DeVqJGECsApf/CDq24hgBRHQgGKO/8zT763NsMRr
 ixsQ==
X-Gm-Message-State: APjAAAWOgmGwuF3zuK2QhJehSpus/Ey+Bpl3z4BMphUpQWxPIg4dEr6+
 O2kh5I61a68M9kaQ7euVNQUvsCI0WwHUtefNeg7Y9vh3
X-Received: by 2002:a92:770a:: with SMTP id s10mr59708782ilc.159.1577974076495; 
 Thu, 02 Jan 2020 06:07:56 -0800 (PST)
MIME-Version: 1.0
From: Pavel Jirout <freedom.day@gmail.com>
Date: Thu, 2 Jan 2020 15:07:45 +0100
Message-ID: <CAOsbW1RbRw_j2=cm5tow9+A+FU9JW90uqALusLvhD6cqajsCkg@mail.gmail.com>
Subject: OpenBSD arm64 under qemu-system-aarch64
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004b5eaa059b28b859"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::144
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:18:42 -0500
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 51n1WpP62AJp

--0000000000004b5eaa059b28b859
Content-Type: text/plain; charset="UTF-8"

Hello,

Im experiencing a strange issue which I can only reproduce with qemu
-current (git clone from today) on aarch64 Linux with KVM enabled kernel
(MANJARO Linux 5.4.0-2-MANJARO) running on the Pinebook-pro (arm64)

When trying to boot the miniroot66.fs from OpenBSD I get the following
failures for these configurations

QEMU emulator version 4.2.50 (v4.2.0-363-gdd5b0f9549)
Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

(No KVM accel)  - and I can confirm this works fine on x86_64 Linux

/usr/local/bin/qemu-system-aarch64 \-M virt \-m 512 \-cpu cortex-a57
\-bios QEMU_EFI.fd \-drive file=miniroot65.fs,format=raw,id=drive1
\-drive file=obsd-arm64.qcow2,if=none,id=drive0,format=qcow2 \-device
virtio-blk-device,drive=drive0 \-nographic \-serial
tcp::4450,server,telnet,wait

As well as with KVM enabled a

/usr/local/bin/qemu-system-aarch64 \
    -cpu host -M virt,accel=kvm -smp 2 \
    -m 512 -nographic \
    -bios QEMU_EFI.fd \
    -drive file=miniroot66.fs,format=raw,id=drive1 \
    -drive file=disk.img,if=none,id=drive0,format=qcow2 \
    -device virtio-blk-device,drive=drive0 \
    -net nic -net tap
celeration

In both cases I get the following error during boot
BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
BdsDxe: failed to load Boot0002 "UEFI Misc Device 2" from
VenHw(837DCA9E-E874-4D82-B29A-23FE0E23D1E2,003E000A00000000): Not
Found
BdsDxe: loading Boot0003 "UEFI Misc Device 3" from PciRoot(0x0)/Pci(0x2,0x0)
BdsDxe: starting Boot0003 "UEFI Misc Device 3" from PciRoot(0x0)/Pci(0x2,0x0)
disks: sd0* sd1 sd2
>> OpenBSD/arm64 BOOTAA64 0.20
boot>
cannot open sd0a:/etc/random.seed: No such file or directory
booting sd0a:/bsd: 2236692+624680+8770560+742368
[180638+109+523200+202041]=0xfefeb0
FACP APIC GTDT MCFG SPCR IORT
type 0x2 pa 0x40000000 va 0x0 pages 0x4000 attr 0x8
type 0x7 pa 0x44000000 va 0x0 pages 0x13746 attr 0x8
type 0x2 pa 0x57746000 va 0x0 pages 0xd11 attr 0x8
type 0x1 pa 0x58457000 va 0x0 pages 0x29 attr 0x8
type 0x9 pa 0x58480000 va 0x0 pages 0x70 attr 0x8
type 0x2 pa 0x584f0000 va 0x0 pages 0x20 attr 0x8
type 0x9 pa 0x58510000 va 0x0 pages 0x20 attr 0x8
type 0x5 pa 0x58530000 va 0xa3863000 pages 0x80 attr 0x8000000000000008
type 0x6 pa 0x585b0000 va 0xa38e3000 pages 0xf0 attr 0x8000000000000008
type 0x5 pa 0x586a0000 va 0xa39d3000 pages 0xb0 attr 0x8000000000000008
type 0x7 pa 0x58750000 va 0x0 pages 0xba6 attr 0x8
type 0x4 pa 0x592f6000 va 0x0 pages 0x234e attr 0x8
type 0x7 pa 0x5b644000 va 0x0 pages 0x2e6 attr 0x8
type 0x3 pa 0x5b92a000 va 0x0 pages 0x2f6 attr 0x8
type 0x5 pa 0x5bc20000 va 0xa6f53000 pages 0x190 attr 0x8000000000000008
type 0x6 pa 0x5bdb0000 va 0xa70e3000 pages 0x250 attr 0x8000000000000008
type 0x7 pa 0x5c000000 va 0x0 pages 0x1f attr 0x8
type 0x4 pa 0x5c01f000 va 0x0 pages 0x1 attr 0x8
type 0x7 pa 0x5c020000 va 0x0 pages 0x3816 attr 0x8
type 0x4 pa 0x5f836000 va 0x0 pages 0x21 attr 0x8
type 0x3 pa 0x5f857000 va 0x0 pages 0x35 attr 0x8
type 0x4 pa 0x5f88c000 va 0x0 pages 0x660 attr 0x8
type 0x3 pa 0x5feec000 va 0x0 pages 0x4 attr 0x8
type 0x4 pa 0x5fef0000 va 0x0 pages 0x101 attr 0x8
type 0x3 pa 0x5fff1000 va 0x0 pages 0xa attr 0x8
type 0x4 pa 0x5fffb000 va 0x0 pages 0x5 attr 0x8
type 0xb pa 0x4000000 va 0xa7333000 pages 0x4000 attr 0x8000000000000001
type 0xb pa 0x9010000 va 0xab333000 pages 0x1 attr 0x8000000000000001
Copyright (c) 1982, 1986, 1989, 1991, 1993
        The Regents of the University of California.  All rights reserved.
Copyright (c) 1995-2020 OpenBSD. All rights reserved.  https://www.OpenBSD.org

OpenBSD 6.6-current (RAMDISK) #391: Wed Jan  1 15:07:58 MST 2020
    deraadt@arm64.openbsd.org:/usr/src/sys/arch/arm64/compile/RAMDISK
real mem  = 467693568 (446MB)
avail mem = 420577280 (401MB)
mainbus0 at root: ACPI
cpu0 at mainbus0 mpidr 0: ARM Cortex-A72 r0p2
cpu0: 48KB 64b/line 3-way L1 PIPT I-cache, 32KB 64b/line 2-way L1 D-cache
cpu0: 1024KB 64b/line 16-way L2 cache
efi0 at mainbus0: UEFI 2.7
efi0: EDK II rev 0x10000
psci0 at mainbus0: PSCI 1.0, SMCCC 1.1
ampintc0 at mainbus0 nirq 288, ncpu 2: "interrupt-controller"
ampintcmsi0 at ampintc0: nspi 1073741824
panic: malloc: allocation too large, type = 2, size = 8589934592


The operating system has halted.
Please press any key to reboot.

Again this only happens on aarch64 system, everything works as
expected on x86_64

Linux. Also I can boot with no problems on aarch64 via
qemu-system-aarch64 (KVM)

NetBSD, FreeBSD, RHEL8, Centos8, Ubuntu18.10

--0000000000004b5eaa059b28b859
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Im experiencing a str=
ange issue which I can only reproduce with qemu -current (git clone from to=
day) on aarch64 Linux with KVM enabled kernel (MANJARO Linux 5.4.0-2-MANJAR=
O) running on the Pinebook-pro (arm64) <br></div><div><br></div><div>When t=
rying to boot the miniroot66.fs from OpenBSD I get the following failures f=
or these configurations <br></div><div><br></div><div><span style=3D"font-f=
amily:monospace">QEMU emulator version 4.2.50 (v4.2.0-363-gdd5b0f9549)<br>C=
opyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers</spa=
n><br></div><div><br></div><div>(No KVM accel)=C2=A0 - and I can confirm th=
is works fine on x86_64 Linux <br></div><div></div><div><pre><span class=3D=
"gmail-nv">/usr/local/bin/qemu</span><span class=3D"gmail-o">-</span><span =
class=3D"gmail-nv">system</span><span class=3D"gmail-o">-</span><span class=
=3D"gmail-nv">aarch64</span> \
<span class=3D"gmail-o">-</span><span class=3D"gmail-nv">M</span> <span cla=
ss=3D"gmail-nv">virt</span> \
<span class=3D"gmail-o">-</span><span class=3D"gmail-nv">m</span> <span cla=
ss=3D"gmail-mi">512</span> \
<span class=3D"gmail-o">-</span><span class=3D"gmail-nv">cpu</span> <span c=
lass=3D"gmail-nv">cortex</span><span class=3D"gmail-o">-</span><span class=
=3D"gmail-nv">a57</span> \
<span class=3D"gmail-o">-</span><span class=3D"gmail-nv">bios</span> <span =
class=3D"gmail-nv">QEMU_EFI</span>.<span class=3D"gmail-nv">fd</span> \
<span class=3D"gmail-o">-</span><span class=3D"gmail-nv">drive</span> <span=
 class=3D"gmail-nv">file</span><span class=3D"gmail-o">=3D</span><span clas=
s=3D"gmail-nv">miniroot65</span>.<span class=3D"gmail-nv">fs</span>,<span c=
lass=3D"gmail-nv">format</span><span class=3D"gmail-o">=3D</span><span clas=
s=3D"gmail-nv">raw</span>,<span class=3D"gmail-nv">id</span><span class=3D"=
gmail-o">=3D</span><span class=3D"gmail-nv">drive1</span> \
<span class=3D"gmail-o">-</span><span class=3D"gmail-nv">drive</span> <span=
 class=3D"gmail-nv">file</span><span class=3D"gmail-o">=3D</span><span clas=
s=3D"gmail-nv">obsd</span><span class=3D"gmail-o">-</span><span class=3D"gm=
ail-nv">arm64</span>.<span class=3D"gmail-nv">qcow2</span>,<span class=3D"g=
mail-k">if</span><span class=3D"gmail-o">=3D</span><span class=3D"gmail-nv"=
>none</span>,<span class=3D"gmail-nv">id</span><span class=3D"gmail-o">=3D<=
/span><span class=3D"gmail-nv">drive0</span>,<span class=3D"gmail-nv">forma=
t</span><span class=3D"gmail-o">=3D</span><span class=3D"gmail-nv">qcow2</s=
pan> \
<span class=3D"gmail-o">-</span><span class=3D"gmail-nv">device</span> <spa=
n class=3D"gmail-nv">virtio</span><span class=3D"gmail-o">-</span><span cla=
ss=3D"gmail-nv">blk</span><span class=3D"gmail-o">-</span><span class=3D"gm=
ail-nv">device</span>,<span class=3D"gmail-nv">drive</span><span class=3D"g=
mail-o">=3D</span><span class=3D"gmail-nv">drive0</span> \
<span class=3D"gmail-o">-</span><span class=3D"gmail-nv">nographic</span> \
<span class=3D"gmail-o">-</span><span class=3D"gmail-nv">serial</span> <spa=
n class=3D"gmail-nv">tcp</span>::<span class=3D"gmail-mi">4450</span>,<span=
 class=3D"gmail-nv">server</span>,<span class=3D"gmail-nv">telnet</span>,<s=
pan class=3D"gmail-k">wait<br><br></span></pre><pre><span class=3D"gmail-k"=
><span style=3D"font-family:arial,sans-serif">As well as with KVM enabled a=
</span><br><br>/usr/local/bin/qemu-system-aarch64 \<br>=C2=A0 =C2=A0 -cpu h=
ost -M virt,accel=3Dkvm -smp 2 \<br>=C2=A0 =C2=A0 -m 512 -nographic \<br>=
=C2=A0 =C2=A0 -bios QEMU_EFI.fd \<br>=C2=A0 =C2=A0 -drive file=3Dminiroot66=
.fs,format=3Draw,id=3Ddrive1 \<br>=C2=A0 =C2=A0 -drive file=3Ddisk.img,if=
=3Dnone,id=3Ddrive0,format=3Dqcow2 \<br>=C2=A0 =C2=A0 -device virtio-blk-de=
vice,drive=3Ddrive0 \<br>=C2=A0 =C2=A0 -net nic -net tap <br>celeration <br=
><br></span></pre><pre><span class=3D"gmail-k">In both cases I get the foll=
owing error during boot <br>BdsDxe: failed to load Boot0001 &quot;UEFI Misc=
 Device&quot; from VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Foun=
d<br>BdsDxe: failed to load Boot0002 &quot;UEFI Misc Device 2&quot; from Ve=
nHw(837DCA9E-E874-4D82-B29A-23FE0E23D1E2,003E000A00000000): Not Found<br>Bd=
sDxe: loading Boot0003 &quot;UEFI Misc Device 3&quot; from PciRoot(0x0)/Pci=
(0x2,0x0)<br>BdsDxe: starting Boot0003 &quot;UEFI Misc Device 3&quot; from =
PciRoot(0x0)/Pci(0x2,0x0)<br>disks: sd0* sd1 sd2<br>&gt;&gt; OpenBSD/arm64 =
BOOTAA64 0.20<br>boot&gt; <br>cannot open sd0a:/etc/random.seed: No such fi=
le or directory<br>booting sd0a:/bsd: 2236692+624680+8770560+742368 [180638=
+109+523200+202041]=3D0xfefeb0<br>FACP APIC GTDT MCFG SPCR IORT <br>type 0x=
2 pa 0x40000000 va 0x0 pages 0x4000 attr 0x8<br>type 0x7 pa 0x44000000 va 0=
x0 pages 0x13746 attr 0x8<br>type 0x2 pa 0x57746000 va 0x0 pages 0xd11 attr=
 0x8<br>type 0x1 pa 0x58457000 va 0x0 pages 0x29 attr 0x8<br>type 0x9 pa 0x=
58480000 va 0x0 pages 0x70 attr 0x8<br>type 0x2 pa 0x584f0000 va 0x0 pages =
0x20 attr 0x8<br>type 0x9 pa 0x58510000 va 0x0 pages 0x20 attr 0x8<br>type =
0x5 pa 0x58530000 va 0xa3863000 pages 0x80 attr 0x8000000000000008<br>type =
0x6 pa 0x585b0000 va 0xa38e3000 pages 0xf0 attr 0x8000000000000008<br>type =
0x5 pa 0x586a0000 va 0xa39d3000 pages 0xb0 attr 0x8000000000000008<br>type =
0x7 pa 0x58750000 va 0x0 pages 0xba6 attr 0x8<br>type 0x4 pa 0x592f6000 va =
0x0 pages 0x234e attr 0x8<br>type 0x7 pa 0x5b644000 va 0x0 pages 0x2e6 attr=
 0x8<br>type 0x3 pa 0x5b92a000 va 0x0 pages 0x2f6 attr 0x8<br>type 0x5 pa 0=
x5bc20000 va 0xa6f53000 pages 0x190 attr 0x8000000000000008<br>type 0x6 pa =
0x5bdb0000 va 0xa70e3000 pages 0x250 attr 0x8000000000000008<br>type 0x7 pa=
 0x5c000000 va 0x0 pages 0x1f attr 0x8<br>type 0x4 pa 0x5c01f000 va 0x0 pag=
es 0x1 attr 0x8<br>type 0x7 pa 0x5c020000 va 0x0 pages 0x3816 attr 0x8<br>t=
ype 0x4 pa 0x5f836000 va 0x0 pages 0x21 attr 0x8<br>type 0x3 pa 0x5f857000 =
va 0x0 pages 0x35 attr 0x8<br>type 0x4 pa 0x5f88c000 va 0x0 pages 0x660 att=
r 0x8<br>type 0x3 pa 0x5feec000 va 0x0 pages 0x4 attr 0x8<br>type 0x4 pa 0x=
5fef0000 va 0x0 pages 0x101 attr 0x8<br>type 0x3 pa 0x5fff1000 va 0x0 pages=
 0xa attr 0x8<br>type 0x4 pa 0x5fffb000 va 0x0 pages 0x5 attr 0x8<br>type 0=
xb pa 0x4000000 va 0xa7333000 pages 0x4000 attr 0x8000000000000001<br>type =
0xb pa 0x9010000 va 0xab333000 pages 0x1 attr 0x8000000000000001<br>Copyrig=
ht (c) 1982, 1986, 1989, 1991, 1993<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 The Rege=
nts of the University of California.=C2=A0 All rights reserved.<br>Copyrigh=
t (c) 1995-2020 OpenBSD. All rights reserved. =C2=A0<a href=3D"https://www.=
OpenBSD.org">https://www.OpenBSD.org</a><br><br>OpenBSD 6.6-current (RAMDIS=
K) #391: Wed Jan =C2=A01 15:07:58 MST 2020<br>=C2=A0 =C2=A0 deraadt@arm64.o=
penbsd.org:/usr/src/sys/arch/arm64/compile/RAMDISK<br>real mem =C2=A0=3D 46=
7693568 (446MB)<br>avail mem =3D 420577280 (401MB)<br>mainbus0 at root: ACP=
I<br>cpu0 at mainbus0 mpidr 0: ARM Cortex-A72 r0p2<br>cpu0: 48KB 64b/line 3=
-way L1 PIPT I-cache, 32KB 64b/line 2-way L1 D-cache<br>cpu0: 1024KB 64b/li=
ne 16-way L2 cache<br>efi0 at mainbus0: UEFI 2.7<br>efi0: EDK II rev 0x1000=
0<br>psci0 at mainbus0: PSCI 1.0, SMCCC 1.1<br>ampintc0 at mainbus0 nirq 28=
8, ncpu 2: &quot;interrupt-controller&quot;<br>ampintcmsi0 at ampintc0: nsp=
i 1073741824<br>panic: malloc: allocation too large, type =3D 2, size =3D 8=
589934592<br><br><br>The operating system has halted.<br>Please press any k=
ey to reboot.<br><br></span></pre><pre><span class=3D"gmail-k">Again this o=
nly happens on aarch64 system, everything works as expected on x86_64 <br><=
/span></pre><pre><span class=3D"gmail-k">Linux. Also I can boot with no pro=
blems on aarch64 via qemu-system-aarch64 (KVM) <br></span></pre><pre><span =
class=3D"gmail-k">NetBSD, FreeBSD, RHEL8, Centos8, Ubuntu18.10 <br></span><=
/pre></div></div>

--0000000000004b5eaa059b28b859--
