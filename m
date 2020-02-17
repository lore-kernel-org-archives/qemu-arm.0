Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4785630lfp;
        Sun, 16 Feb 2020 23:44:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYGfA0yh8Uhs09aWiJIFxFhi1g8e3V9BZtNSXSDU8jAWPKqfUxKNEfRiDnA0NlTCBaA36b
X-Received: by 2002:ac8:7187:: with SMTP id w7mr12421527qto.232.1581925465220;
        Sun, 16 Feb 2020 23:44:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581925465; cv=none;
        d=google.com; s=arc-20160816;
        b=cB4wtyzZzAUA++g9D9PFMeYfLNGE0yUA2hnecAYZg3Y7TKBXbTSS7plvKOUPUL8pwQ
         vxoUA9nuAjz+ZeRZeWybD2PdCVr9ib3wnW9mWg0mHTMh0Xs8nE6hO3AGGGfSIBaUJbfB
         qZQQn3MSHD/pIgb58+jZicHPfpTP79kYf3KU1w/QPpQgYpB1FoQudYtk+poBlG5oyajR
         yQV0JeNq+g8Yj+Jmg7b0vdaZq8juETcYyEmRsG+usrJide2H4o3hmIldeol53JJZ6P/o
         rlcfg8jUbLGVvfN+avYA57q/J/UJo7c1ucAdQa8kA2MPmA/mZAA+U6F0RbRWZBCzc3lO
         oLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=pCSG2O0V1jsbM7fpuRFklQI3q4hIGcYXrCWxdp2cA4U=;
        b=v3vxs1qPeJMCPuMog27IOAAM5CGGUIw71ynxIWsAj3Z2pBo7fIbMYDaIIhshG9OANX
         i1zuHS3CV7tHvfrW9d2QFkmkEApm7bYbFegmv5HtvXqNGOPTzT32acNnFyYmHoIBv4np
         059DkKN/BC2ohIe7vPS3/I/LGjua7QaQeJctZqzL0kXA/GiY1wdHDJuZQ+W7J5QxnYAy
         Qqp21c7CEnUwQo501S4CAEqU9kMNLp9FFnhi5hPBDtug24SgIFQm3NrGgxN8weBhK/QW
         CLLojFQgG87SakO9cX7FOIK1BN7p4w/OahlgD8NQCXQ9Wk5Sa4FYVZGQeLyB4wmnQrT+
         C52w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si5805127qvm.160.2020.02.16.23.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 23:44:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3b4q-0007lW-FT
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 02:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2w-0004I4-E6
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2u-0000V7-KO
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:26 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2714 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xuyandong2@huawei.com>)
 id 1j3b2q-0000Gg-FE; Mon, 17 Feb 2020 02:42:20 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 081D9DFADD86BAE88059;
 Mon, 17 Feb 2020 15:42:10 +0800 (CST)
Received: from localhost (10.175.124.177) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 15:42:03 +0800
From: Xu Yandong <xuyandong2@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH RFC 00/16] Implement Microvm for aarch64 architecture
Date: Mon, 17 Feb 2020 02:51:12 -0500
Message-ID: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
X-Originating-IP: [10.175.124.177]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: zhang.zhanghailiang@huawei.com, slp@redhat.com,
 Xu Yandong <xuyandong2@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8YZFzEjgwBNr

Implement Microvm for aarch64 architecture

This series attempts to implement microvm for aarch64
architecture.

Just like how Sergio Lopez does for implementing microvm
for x86 architecture. We remove parts of emulate devices which
are not needed in microvm, compared with normal VM,
We only keep PL011 (UART), PL031 (RTC) and virtio-mmio
devices for microvm of aarch64.

We compared the boot time between virt VM and microvm With the
follow command lines:
For microvm:
qemu-system-aarch64 \
    -cpu host \
    -smp 1,sockets=3D1,cores=3D1,threads=3D1 \
    -m 1024M \
    -machine microvm,accel=3Dkvm,gic-version=3D3 \
    -kernel vmlinux.bin \
    -drive id=3Dtest,file=3Dubuntu-rootfs.img,format=3Draw,if=3Dnone \
    -device virtio-blk-device,drive=3Dtest \
    -netdev tap,id=3Dtap0,script=3Dno,downscript=3Dno \
    -device virtio-net-device,netdev=3Dtap0 \
    -append "root=3D/dev/vda rw printk.time=3Dy" \
    -nographic
Normal VM=EF=BC=9AOnly changed the machine type to 'virt'
qemu-system-aarch64 \
    -cpu host \
    -smp 1,sockets=3D1,cores=3D1,threads=3D1 \
    -m 1024M \
    -machine virt,accel=3Dkvm,gic-version=3D3 \
    -kernel vmlinux.bin \
    -drive id=3Dtest,file=3Dubuntu-rootfs.img,format=3Draw,if=3Dnone \
    -device virtio-blk-device,drive=3Dtest \
    -netdev tap,id=3Dtap0,script=3Dno,downscript=3Dno \
    -device virtio-net-device,netdev=3Dtap0 \
    -append "root=3D/dev/vda rw printk.time=3Dy" \
    -nographic

This is the test results:
1. Boot time
1) boot time after dropped caches(echo 3 > /proc/sys/vm/drop_caches)
normal virt Machine: 204 ms
microvm Machine: 132 ms

2) boot time with caches
normal virt Machine: 168 ms
microvm Machine: 71 ms

2. MMIO regions
normal virt Machine:
address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-0000000003ffffff (prio 0, romd): virt.flash0
    0000000004000000-0000000007ffffff (prio 0, romd): virt.flash1
    0000000008000000-000000000800ffff (prio 0, i/o): gicv3_dist
    0000000008080000-000000000809ffff (prio 0, i/o): gicv3_its
      0000000008080000-000000000808ffff (prio 0, i/o): control
      0000000008090000-000000000809ffff (prio 0, i/o): translation
    00000000080a0000-00000000080bffff (prio 0, i/o): gicv3_redist_region[=
0]
    0000000009000000-0000000009000fff (prio 0, i/o): pl011
    0000000009010000-0000000009010fff (prio 0, i/o): pl031
    0000000009020000-0000000009020007 (prio 0, i/o): fwcfg.data
    0000000009020008-0000000009020009 (prio 0, i/o): fwcfg.ctl
    0000000009020010-0000000009020017 (prio 0, i/o): fwcfg.dma
    0000000009030000-0000000009030fff (prio 0, i/o): pl061
    000000000a000000-000000000a0001ff (prio 0, i/o): virtio-mmio
 	... skipped 30 virtio-mmio region
    000000000a003e00-000000000a003fff (prio 0, i/o): virtio-mmio
    000000000c000000-000000000dffffff (prio 0, i/o): platform bus
    0000000010000000-000000003efeffff (prio 0, i/o): alias pcie-mmio @gpe=
x_mmio 0000000010000000-000000003efeffff
    000000003eff0000-000000003effffff (prio 0, i/o): gpex_ioport
      000000003eff1000-000000003eff101f (prio 1, i/o): virtio-pci
    0000000040000000-000000007fffffff (prio 0, ram): mach-virt.ram
    0000004010000000-000000401fffffff (prio 0, i/o): alias pcie-ecam @pci=
e-mmcfg-mmio 0000000000000000-000000000fffffff
    0000008000000000-000000ffffffffff (prio 0, i/o): alias pcie-mmio-high=
 @gpex_mmio 0000008000000000-000000ffffffffff

microvm Machine:
address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
  0000000008000000-000000000800ffff (prio 0, i/o): gicv3_dist
    00000000080a0000-00000000080bffff (prio 0, i/o): gicv3_redist_region[=
0]
    0000000009000000-0000000009000fff (prio 0, i/o): pl011
    0000000009010000-0000000009010fff (prio 0, i/o): pl031
    000000000a000000-000000000a0001ff (prio 0, i/o): virtio-mmio
	... skipped 30 virtio-mmio region
    000000000a003e00-000000000a003fff (prio 0, i/o): virtio-mmio
    0000000040000000-000000007fffffff (prio 0, ram): mach-virt.ram

Please review this series.

Thinks,
Xu Yandong.

Xu Yandong (16):
  hw/arm/arm: Introduce ArmMachineState and ArmMachineClass
  hw/arm: move shared fdt member to ArmMachine
  hw/arm: move shared memmap member to ArmMachine
  hw/arm: move shared irqmap member to ArmMachine
  hw/arm: move shared smp_cpus member to ArmMachine
  hw/arm/virt: split MSI related codes from create_gic
  hw/arm/virt: split virt extension related codes from create_gic
  hw/arm/virt: split secure extension related codes from create_gic
  hw/arm: move shared gic member to ArmMachine
  hw/arm: split create_gic function
  hw/arm: move shared psci_enable and claim_edge_triggered_timers member
    to ArmMachine
  hw/arm: move shared devices related functions to arm.c and export them
  hw/arm: move shared fdt related functions to arm.c and export them
  hw/arm: move shared bootinfo member to ArmMachine
  hw/arm: move shared cpu related functions to arm.c and export them
  hw/arm: Introduce the microvm machine type

 default-configs/aarch64-softmmu.mak |    2 +
 hw/arm/Kconfig                      |    7 +
 hw/arm/Makefile.objs                |    3 +-
 hw/arm/arm.c                        |  687 +++++++++++++++++
 hw/arm/microvm.c                    |  303 ++++++++
 hw/arm/virt-acpi-build.c            |   48 +-
 hw/arm/virt.c                       | 1079 +++++++--------------------
 include/hw/arm/arm.h                |  152 ++++
 include/hw/arm/microvm.h            |   40 +
 include/hw/arm/virt.h               |   86 +--
 10 files changed, 1505 insertions(+), 902 deletions(-)
 create mode 100644 hw/arm/arm.c
 create mode 100644 hw/arm/microvm.c
 create mode 100644 include/hw/arm/arm.h
 create mode 100644 include/hw/arm/microvm.h

--=20
2.18.1

