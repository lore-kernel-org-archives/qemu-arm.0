Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp923796nji;
        Thu, 29 Aug 2024 09:33:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWCVdiNoL2kVaN3E08Dola8PRfMFOMwsnaduzpTl+Ld6QLhJQzn7k0kPF/tLuczZ32HG9UwN1mMMZAhA==@linaro.org
X-Received: by 2002:a17:903:647:b0:205:79c:56f5 with SMTP id d9443c01a7336-2050c3777demr29333845ad.27.1724949194751;
        Thu, 29 Aug 2024 09:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724949194; cv=none;
        d=google.com; s=arc-20160816;
        b=lCpSRVJQSU0h0GudzNpKufoVWIWRiu7IVcnWNJyV0x2PZn+I19ahbx8tMjjwTmTshI
         mZEGkAn7DaAg4DOWF5mhUVkBiQt1shhaL1GE5WAlcKYC235X9d6DcHP1qVGi1U7SWhfC
         mDxPuDVXD42Rvm7kJ992fXJqrnzwor5DOXIiplvX19GVZgEDIfYL+v0xAbzkfsS3IGLT
         2GVTLfnajcOHn31PL4G6Xlt0f4pUb2FHKdUoLqle4CDEw+Ym5xhh4fXpa2chrmaq8Vn3
         mcAqVLWwss/NfnJPz1JIRGugTWBlRAUX2tZHWMNcz1onI4oMqYp5d6eE5AAYOMCNHpAB
         0vPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bKtZ9E2aN9XN/yHxvFApueRFk8vfle6YwHKOZwySZtc=;
        fh=A8OOuWaXqRC1QZ1StBcSbVLfzwXDuzGUh4NOkv44LF4=;
        b=qTz99fsHmjHBIA2hAa8zgC/No8XwyGg0bDD5GhAb+a64fD/po+1bg+QkhQSwkYwULf
         wPzGqEg49YO5BBdX/rjneBPfMNvpTS4O4wStDz7p0bkZSRYE7Qu/8xQaDCv5/jlaF2NO
         p+kDp8VsxJQEieoxUm3JdyrN+OC8IrS2zFwjfedgSGuwsTLg/vQsMBeG57LyXm+7vC4q
         11McJkURMb/VBWBEWWghYP0DzfAjUHKchakdAcQqjvepkP8+eUpK825GvLtgLgGSe/1G
         ImguqcdvdFv3HX3LwlB9YPhGrJScZOQd6TW+BLavVgH2URsNNMOe4otERzyRn9jH8eDQ
         47Sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="c/F1am6t";
       spf=pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marietto2008@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <marietto2008@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d22e72e78fsor709348a12.2.2024.08.29.09.33.14
        (Google Transport Security);
        Thu, 29 Aug 2024 09:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="c/F1am6t";
       spf=pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marietto2008@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724949194; x=1725553994; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bKtZ9E2aN9XN/yHxvFApueRFk8vfle6YwHKOZwySZtc=;
        b=c/F1am6t6qKc+LeSglYhhTMhu2kayaPTKUW1aWT3wsFja++mkuqo1XKP80yFbNu3gZ
         yz5E84YCmmT1uhNHK6NmhYy86MmTf6Y10XTf1ZKA/G8aQ+NlwYuCQ1vepvJNiKFLzb6p
         T7jr+mRXFYInjqRb1s4DA0uTYHlV1Y3m0IrpUE1NJQKkqy+O+n1Flp2Fi3eeE7eEjd7C
         uhOfC24CCh3hck+9oUTS5GLDmPE+h9gY33lxy8pbetbdx64/uo/HvZwgCg8bK3iy9hZ5
         a75+a60K7EW1X60Kj0sNbMcPe42lfXel/sXKIGSklkUnhJp98sxdZo6LwWueKrRxr3f0
         fpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949194; x=1725553994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKtZ9E2aN9XN/yHxvFApueRFk8vfle6YwHKOZwySZtc=;
        b=B3/41xQqqvZfKGLarbVvTZZ+uSqNCsDqlX0F7WlDuaW3OjBuWb/vCC9TI8FTy8PHHi
         Mag99Ph1Q38XUhFVQyWwRVeLaznbWfOTBUYM3bpW16F3PYjeLzJ++VQBbN46FLjSy7M9
         8rjuK942xBces7jEhDL9ci1QyQrp6sc4ZUFtNYyFYCgDaGPvJK/UCTtT4Nl7HBRJvHg6
         rwPG2W1SQP1EtsvRW16tDuqhP0prLmPsao4CVmtVYRyzZ3VRPzHNBonVVvB0LYxzYDBS
         R7O/DC5LNUUBzcAfRntGzmfsBhIwIy3Z43JFXqrxlNveJ6/UsXf20UvgXEkcGJJL8XvG
         /4GQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1xSrtG/Eq0hdquzthQ8ziac1X9u7UKETjLA2LDmjv0uHnTcAdjKPPQ+gFnjMptAsAvLN1B/MSihNxOA==@linaro.org
X-Gm-Message-State: AOJu0YximiuG90izr+qdmSQpjk73ILSG2xEqhhcaLxw179f2v/A4aM6w
	oNS+8aM+h2lhlNrmdozUN3LTIdbUQ3l5eTGsTIF154wt+aTk5rjQAOXbvKW923EdgpWljP+98Bn
	qL8L70PX67BIIuIjaUhILLWITLhiohmXB
X-Google-Smtp-Source: AGHT+IG1LSZoCGFxXz6HaSuWEqOhHp4dBBnuAsdXdixGldrL/w0x3z0pLJsui+5iPPdUAKBxQD+w5nWrZqkqQigdovY=
X-Received: by 2002:a17:90a:d311:b0:2cf:f3e9:d5c8 with SMTP id
 98e67ed59e1d1-2d856391d2cmr3468821a91.31.1724949192876; Thu, 29 Aug 2024
 09:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <CAFEAcA8J18z8WubfzLu-DmTp6vGwcy4D652ib-KReqNS0whMVA@mail.gmail.com>
 <CA+1FSiir=RG1BTKF29BKxmO+GWDieyW6TxzWtdEX-CYu7a+z5g@mail.gmail.com>
 <CA+1FSij3LJc9S2ChBY-pHZ8QacFt2P0ygsr9LRK9FXLyMJrorQ@mail.gmail.com>
 <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
 <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
 <CAFEAcA_zRSgFhs+kauEfkyzAYg2RwSBrkagDEoj5OCgm5j6=iQ@mail.gmail.com>
 <CA+1FSigzZxzdgTCWNRz3UGgTH5mRN8XTWWkeTU20N2ey4a+i+Q@mail.gmail.com>
 <CA+1FSigqsAx_s+-_eP0GtSi7Qq6Vcou12gHcGZwqPk1hhnXXwg@mail.gmail.com>
 <CA+1FSiiYm03SmjMaR0dLKye7j+LR4V-=u=nQu66=_aTrLVUpPg@mail.gmail.com>
 <CA+1FSigvsXe7eo17_qdKaY0Uo68u7Ep3UacooHZDNCnWJHD4+w@mail.gmail.com>
 <CA+1FSiiFFjp8O_D=PaGuZMj8oPYLdx5i-+Aq=S7=AZjZmb_aOw@mail.gmail.com> <CA+1FSih1Yv+-Cjj0rfnnV4CkLum4RESun2UiUoZm=Lfsa=PkhA@mail.gmail.com>
In-Reply-To: <CA+1FSih1Yv+-Cjj0rfnnV4CkLum4RESun2UiUoZm=Lfsa=PkhA@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Thu, 29 Aug 2024 18:32:35 +0200
Message-ID: <CA+1FSih+6cHb5c9pA-79ZP1Qvd=xTTNuVZm+Q66be3NuM8gCJQ@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "cc: Sergey Kambalin" <sergey.kambalin@auriga.com>, 
	qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e5b04e0620d507db"
X-TUID: f1ubGCUo8yQi

--000000000000e5b04e0620d507db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't understand what's the reason why it boots indefinitely :

qemu-system-aarch64 \
        -smp 4 \
        -m 2048 \
        -cpu cortex-a72 \
        -M virt \
        -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
        -display sdl,gl=3Don \
        -device usb-ehci \
        -device usb-kbd \
        -device virtio-tablet-pci \
        -usb \
        -serial stdio \
        -kernel /mnt/zroot2/zroot2/OS/Android/antmicro/img/Image \
        -initrd /mnt/zroot2/zroot2/OS/Android/antmicro/img/ramdisk.img \
        -drive
index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Android/antmic=
ro/img/system-rw.img
\
        -device virtio-blk-pci,drive=3Dsystem \
        -drive
index=3D1,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot2/zroot2/OS/Android/antmic=
ro/img/vendor-rw.img
\
        -device virtio-blk-pci,drive=3Dvendor \
        -drive
index=3D2,if=3Dnone,id=3Duserdata,file=3D/mnt/zroot2/zroot2/OS/Android/antm=
icro/img/userdata.img
\
        -device virtio-blk-pci,drive=3Duserdata \
        -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdelay=
=3D5
androidboot.hardware=3Dranchu androidboot.selinux=3Dpermissive security=3Ds=
elinux
selinux=3D1 androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160"

LOG :

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.14.307-01062-gef7460eabd6d
(build-user@build-host) (Android (5900059 based on r365631c) clang version
9.
0.8 (https://android.googlesource.com/toolchain/llvm-project
207d7abc1a2abf3ef8d4301736d6a7ebc224a290) (based on LLVM 9.0.8svn)) #1 SMP
PREEMPT Sat Feb 25 15:33:28 UTC 2023
[    0.000000] Boot CPU: AArch64 Processor [410fd083]
[    0.000000] random: crng init done
[    0.000000] Machine model: linux,dummy-virt
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] percpu: Embedded 21 pages/cpu s48664 r8192 d29160 u86016
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] ARM_SMCCC_ARCH_WORKAROUND_1 missing from firmware
[    0.000000] CPU features: enabling workaround for Spectre-BHB
[    0.000000] CPU features: enabling workaround for ARM erratum 1742098
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
516096
[    0.000000] Kernel command line: console=3DttyAMA0,38400 drm.debug=3D0x0
rootwait rootdelay=3D5 androidboot.hardware=3Dranchu androidboot.se
linux=3Dpermissive security=3Dselinux selinux=3D1 androidboot.qemu.hw.maink=
eys=3D0
androidboot.lcd.density=3D160
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152
bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576
bytes)
[    0.000000] Memory: 2042152K/2097152K available (9532K kernel code,
1172K rwdata, 2888K rodata, 2752K init, 462K bss, 55000K reserved, 0K
cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffffff8000000000 - 0xffffff8008000000   (
  128 MB)
[    0.000000]     vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (
  250 GB)
[    0.000000]       .text : 0x        (ptrval) - 0x        (ptrval)   (
 9536 KB)
[    0.000000]     .rodata : 0x        (ptrval) - 0x        (ptrval)   (
 2944 KB)
[    0.000000]       .init : 0x        (ptrval) - 0x        (ptrval)   (
 2752 KB)
[    0.000000]       .data : 0x        (ptrval) - 0x        (ptrval)   (
 1173 KB)
[    0.000000]        .bss : 0x        (ptrval) - 0x        (ptrval)   (
  463 KB)
[    0.000000]     fixed   : 0xffffffbefe7f9000 - 0xffffffbefec00000   (
 4124 KB)
[    0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (
   16 MB)
[    0.000000]     memory  : 0xffffffeb40000000 - 0xffffffebc0000000   (
 2048 MB)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=3D4.
[    0.000000]  Tasks RCU enabled.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
[    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
[    0.000127] sched_clock: 56 bits at 62MHz, resolution 16ns, wraps every
4398046511096ns
[    0.003660] Calibrating delay loop (skipped), value calculated using
timer frequency.. 125.00 BogoMIPS (lpj=3D625000)
[    0.003790] pid_max: default: 32768 minimum: 301
[    0.004630] Security Framework initialized
[    0.004762] SELinux:  Initializing.
[    0.005446] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.005495] Mountpoint-cache hash table entries: 4096 (order: 3, 32768
bytes)
[    0.030966] /cpus/cpu-map: empty cluster
[    0.073499] ASID allocator initialised with 32768 entries
[    0.101242] Hierarchical SRCU implementation.
[    0.125115] EFI services will not be available.
[    0.178497] smp: Bringing up secondary CPUs ...
[    0.245215] Detected PIPT I-cache on CPU1
[    0.248497] CPU1: Booted secondary processor [410fd083]
[    0.333392] Detected PIPT I-cache on CPU2
[    0.334213] CPU2: Booted secondary processor [410fd083]
[    0.427085] Detected PIPT I-cache on CPU3
[    0.427978] CPU3: Booted secondary processor [410fd083]
[    0.430197] smp: Brought up 1 node, 4 CPUs
[    0.430599] SMP: Total of 4 processors activated.
[    0.431315] CPU features: detected: 32-bit EL0 Support
[    0.608649] CPU: All CPU(s) started at EL1
[    0.609043] alternatives: patching kernel code
[    0.611038] CPU3: update max cpu_capacity 1024
[    0.621760] CPU3: update max cpu_capacity 1024
[    0.635915] Registered cp15_barrier emulation handler
[    0.636078] Registered setend emulation handler
[    0.637130] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.637235] futex hash table entries: 1024 (order: 5, 131072 bytes)
[    0.640203] DMI not present or invalid.
[    0.642376] NET: Registered protocol family 16
[    0.644952] schedtune: configured to support 5 boost groups
[    0.649619] cpuidle: using governor menu
[    0.650232] hw-breakpoint: found 6 breakpoint and 4 watchpoint
registers.
[    0.651821] DMA: preallocated 256 KiB pool for atomic allocations
[    0.651864] Serial: AMBA PL011 UART driver
[    0.670674] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 39,
base_baud =3D 0) is a PL011 rev1
[    0.681834] console [ttyAMA0] enabled
[    0.707955] SCSI subsystem initialized
[    0.708859] usbcore: registered new interface driver usbfs
[    0.709195] usbcore: registered new interface driver hub
[    0.709442] usbcore: registered new device driver usb
[    0.710559] dmi: Firmware registration failed.
[    0.711835] Advanced Linux Sound Architecture Driver Initialized.
[    0.721653] clocksource: Switched to clocksource arch_sys_counter
[    0.897715] VFS: Disk quotas dquot_6.6.0
[    0.898127] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
bytes)
[    0.901164] NET: Registered protocol family 2
[    0.902709] IP idents hash table entries: 32768 (order: 6, 262144 bytes)
[    0.907955] TCP established hash table entries: 16384 (order: 5, 131072
bytes)
[    0.908458] TCP bind hash table entries: 16384 (order: 6, 262144 bytes)
[    0.908976] TCP: Hash tables configured (established 16384 bind 16384)
[    0.910135] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    0.910515] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    0.912044] NET: Registered protocol family 1
[    0.919449] Trying to unpack rootfs image as initramfs...
[    0.997353] Freeing initrd memory: 772K
[    1.001719] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
counters available
[    1.004308] audit: initializing netlink subsys (disabled)
[    1.006144] audit: type=3D2000 audit(0.950:1): state=3Dinitialized
audit_enabled=3D0 res=3D1
[    1.008629] workingset: timestamp_bits=3D45 max_order=3D19 bucket_order=
=3D0
[    1.026025] Registering sdcardfs 0.1
[    1.028002] fuse init (API version 7.26)
[    1.042357] cryptomgr_test (44) used greatest stack depth: 14608 bytes
left
[    1.042770] cryptomgr_test (43) used greatest stack depth: 14376 bytes
left
[    1.062335] Block layer SCSI generic (bsg) driver version 0.4 loaded
(major 252)
[    1.062609] io scheduler noop registered
[    1.062750] io scheduler deadline registered
[    1.063215] io scheduler cfq registered (default)
[    1.063333] io scheduler mq-deadline registered
[    1.063453] io scheduler kyber registered
[    1.066175] OF: PCI: host bridge /pcie@10000000 ranges:
[    1.066655] OF: PCI:    IO 0x3eff0000..0x3effffff -> 0x00000000
[    1.067088] OF: PCI:   MEM 0x10000000..0x3efeffff -> 0x10000000
[    1.067228] OF: PCI:   MEM 0x8000000000..0xffffffffff -> 0x8000000000
[    1.068255] pci-host-generic 4010000000.pcie: ECAM at [mem
0x4010000000-0x401fffffff] for [bus 00-ff]
[    1.069325] pci-host-generic 4010000000.pcie: PCI host bridge to bus
0000:00
[    1.069606] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.069780] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    1.069921] pci_bus 0000:00: root bus resource [mem
0x10000000-0x3efeffff]
[    1.070053] pci_bus 0000:00: root bus resource [mem
0x8000000000-0xffffffffff]
[    1.079427] pci 0000:00:01.0: BAR 6: assigned [mem 0x10000000-0x1003ffff
pref]
[    1.079784] pci 0000:00:01.0: BAR 4: assigned [mem
0x8000000000-0x8000003fff 64bit pref]
[    1.080080] pci 0000:00:02.0: BAR 4: assigned [mem
0x8000004000-0x8000007fff 64bit pref]
[    1.080298] pci 0000:00:04.0: BAR 4: assigned [mem
0x8000008000-0x800000bfff 64bit pref]
[    1.080469] pci 0000:00:05.0: BAR 4: assigned [mem
0x800000c000-0x800000ffff 64bit pref]
[    1.080638] pci 0000:00:06.0: BAR 4: assigned [mem
0x8000010000-0x8000013fff 64bit pref]
[    1.080823] pci 0000:00:07.0: BAR 4: assigned [mem
0x8000014000-0x8000017fff 64bit pref]
[    1.081013] pci 0000:00:01.0: BAR 1: assigned [mem
0x10040000-0x10040fff]
[    1.081156] pci 0000:00:02.0: BAR 1: assigned [mem
0x10041000-0x10041fff]
[    1.081292] pci 0000:00:03.0: BAR 0: assigned [mem
0x10042000-0x10042fff]
[    1.081439] pci 0000:00:04.0: BAR 1: assigned [mem
0x10043000-0x10043fff]
[    1.081846] pci 0000:00:05.0: BAR 1: assigned [mem
0x10044000-0x10044fff]
[    1.082004] pci 0000:00:06.0: BAR 1: assigned [mem
0x10045000-0x10045fff]
[    1.082156] pci 0000:00:07.0: BAR 1: assigned [mem
0x10046000-0x10046fff]
[    1.082367] pci 0000:00:05.0: BAR 0: assigned [io  0x1000-0x107f]
[    1.082564] pci 0000:00:06.0: BAR 0: assigned [io  0x1080-0x10ff]
[    1.083362] pci 0000:00:07.0: BAR 0: assigned [io  0x1100-0x117f]
[    1.083504] pci 0000:00:01.0: BAR 0: assigned [io  0x1180-0x119f]
[    1.084473] pci 0000:00:03.0: enabling device (0000 -> 0002)
[    1.090474] virtio-pci 0000:00:01.0: enabling device (0000 -> 0003)
[    1.093129] virtio-pci 0000:00:02.0: enabling device (0000 -> 0002)
[    1.095580] virtio-pci 0000:00:04.0: enabling device (0000 -> 0002)
[    1.096833] virtio-pci 0000:00:05.0: enabling device (0000 -> 0003)
[    1.098208] virtio-pci 0000:00:06.0: enabling device (0000 -> 0003)
[    1.099601] virtio-pci 0000:00:07.0: enabling device (0000 -> 0003)
[    1.112180] input: QEMU Virtio Tablet as
/devices/platform/4010000000.pcie/pci0000:00/0000:00:04.0/virtio2/input/inp=
ut0

[    1.113631] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.118036] [drm] pci: virtio-gpu-pci detected at 0000:00:02.0
[    1.119474] [drm] virgl 3d acceleration not supported by host
[    1.121314] [TTM] Zone  kernel: Available graphics memory: 1021462 kiB
[    1.121663] [TTM] Initializing pool allocator
[    1.121949] [TTM] Initializing DMA pool allocator
[    1.122603] [drm] number of scanouts: 1
[    1.122701] [drm] number of cap sets: 0
[    1.138511] [drm] Initialized virtio_gpu 0.0.1 0 for virtio1 on minor 0
[    1.139496] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    1.162999] brd: module loaded
[    1.197188] loop: module loaded
[    1.245828] zram: Added device: zram0
[    1.247768] tun: Universal TUN/TAP device driver, 1.6
[    1.252484] PPP generic driver version 2.4.2
[    1.252976] PPP BSD Compression module registered
[    1.253135] PPP Deflate Compression module registered
[    1.253443] PPP MPPE Compression module registered
[    1.253575] NET: Registered protocol family 24
[    1.253689] PPTP driver version 0.8.5
[    1.258151] usbcore: registered new interface driver r8152
[    1.258339] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.258560] ehci-pci: EHCI PCI platform driver
[    1.260252] ehci-pci 0000:00:03.0: EHCI Host Controller
[    1.260786] ehci-pci 0000:00:03.0: new USB bus registered, assigned bus
number 1
[    1.262867] ehci-pci 0000:00:03.0: irq 42, io mem 0x10042000
[    1.291890] ehci-pci 0000:00:03.0: USB 2.0 started, EHCI 1.00
[    1.295507] usb usb1: New USB device found, idVendor=3D1d6b,
idProduct=3D0002
[    1.295687] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[    1.295900] usb usb1: Product: EHCI Host Controller
[    1.296024] usb usb1: Manufacturer: Linux 4.14.307-01062-gef7460eabd6d
ehci_hcd
[    1.296297] usb usb1: SerialNumber: 0000:00:03.0
[    1.298761] hub 1-0:1.0: USB hub found
[    1.299299] hub 1-0:1.0: 6 ports detected
[    1.304251] usbcore: registered new interface driver xpad
[    1.304500] usbcore: registered new interface driver usb_acecad
[    1.304722] usbcore: registered new interface driver aiptek
[    1.304946] usbcore: registered new interface driver gtco
[    1.305158] usbcore: registered new interface driver hanwang
[    1.305404] usbcore: registered new interface driver kbtab
[    1.307914] rtc-pl031 9010000.pl031: rtc core: registered pl031 as rtc0
[    1.310027] IR NEC protocol handler initialized
[    1.310171] IR RC5(x/sz) protocol handler initialized
[    1.310338] IR RC6 protocol handler initialized
[    1.310499] IR JVC protocol handler initialized
[    1.310615] IR Sony protocol handler initialized
[    1.310758] IR SANYO protocol handler initialized
[    1.310878] IR Sharp protocol handler initialized
[    1.311008] IR MCE Keyboard/mouse protocol handler initialized
[    1.311161] IR XMP protocol handler initialized
[    1.312106] device-mapper: uevent: version 1.0.3
[    1.313070] device-mapper: ioctl: 4.37.0-ioctl (2017-09-20) initialised:
dm-devel@redhat.com
[    1.313986] device-mapper: verity-avb: AVB error handler initialized
with vbmeta device:
[    1.315424] hidraw: raw HID events driver (C) Jiri Kosina
[    1.321014] usbcore: registered new interface driver usbhid
[    1.321237] usbhid: USB HID core driver
[    1.323009] ashmem: initialized
[    1.325296] netem: version 1.3
[    1.325418] u32 classifier
[    1.325495]     Actions configured
[    1.325793] Netfilter messages via NETLINK v0.30.
[    1.326931] nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
[    1.328555] ctnetlink v0.93: registering with nfnetlink.
[    1.332683] xt_time: kernel timezone is -0000
[    1.333056] gre: GRE over IPv4 demultiplexor driver
[    1.333203] IPv4 over IPsec tunneling driver
[    1.336862] ip_tables: (C) 2000-2006 Netfilter Core Team
[    1.341048] arp_tables: arp_tables: (C) 2002 David S. Miller
[    1.343068] Initializing XFRM netlink socket
[    1.343384] IPsec XFRM device driver
[    1.345168] NET: Registered protocol family 10
[    1.352648] Segment Routing with IPv6
[    1.353576] mip6: Mobile IPv6
[    1.353771] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    1.361034] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.364274] NET: Registered protocol family 17
[    1.364605] NET: Registered protocol family 15
[    1.364837] l2tp_core: L2TP core driver, V2.0
[    1.365000] l2tp_ppp: PPPoL2TP kernel driver, V2.0
[    1.365527] NET: Registered protocol family 40
[    1.367119] registered taskstats version 1
[    1.371926] console [netcon0] enabled
[    1.372070] netconsole: network logging started
[    1.372854] rtc-pl031 9010000.pl031: setting system clock to 2024-08-29
16:17:32 UTC (1724948252)
[    1.387989] OF: Duplicate name in testcase-data, renamed to
"duplicate-name#1"
[    1.392856] ### dt-test ### unittest internal error: unable to add
testdata property /aliases/name
[    1.392930] ### dt-test ### start of unittest - you will see error
messages
[    1.395161] OF: /testcase-data/phandle-tests/consumer-a: could not get
#phandle-cells-missing for /testcase-data/phandle-tests/provider1
[    1.395443] OF: /testcase-data/phandle-tests/consumer-a: could not get
#phandle-cells-missing for /testcase-data/phandle-tests/provider1
[    1.395692] OF: /testcase-data/phandle-tests/consumer-a: could not find
phandle
[    1.395876] OF: /testcase-data/phandle-tests/consumer-a: could not find
phandle
[    1.396066] OF: /testcase-data/phandle-tests/consumer-a: arguments
longer than property
[    1.396251] OF: /testcase-data/phandle-tests/consumer-a: arguments
longer than property
[    1.403169] ### dt-test ### end of unittest - 149 passed, 0 failed
[    1.403669] ALSA device list:
[    1.403777]   No soundcards found.
[    1.501102] Freeing unused kernel memory: 2752K
[    1.591837] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    1.795716] usb 1-1: New USB device found, idVendor=3D0627, idProduct=3D=
0001
[    1.796018] usb 1-1: New USB device strings: Mfr=3D1, Product=3D4,
SerialNumber=3D11
[    1.796170] usb 1-1: Product: QEMU USB Keyboard
[    1.796269] usb 1-1: Manufacturer: QEMU
[    1.796350] usb 1-1: SerialNumber: 68284-0000:00:03.0-1
[    1.812011] input: QEMU QEMU USB Keyboard as
/devices/platform/4010000000.pcie/pci0000:00/0000:00:03.0/usb1/1-1/1-1:1.0/=
0003:0627:0001.0001/input/input1

[    1.851611] init: init first stage started!
[    1.857863] init: [libfs_mgr]ReadFstabFromDt(): failed to read fstab
from dt
[    1.868774] init: Using Android DT directory
/proc/device-tree/firmware/android/
[    1.889495] hid-generic 0003:0627:0001.0001: input,hidraw0: USB HID
v1.11 Keyboard [QEMU QEMU USB Keyboard] on usb-0000:00:03.0-1/input0
[    2.322202] init: [libfs_mgr]superblock
s_max_mnt_count:65535,/dev/block/vda
[    2.323319] init: [libfs_mgr]Filesystem on /dev/block/vda was not
cleanly shutdown; state flags: 0x1, incompat feature flags: 0x2c6
[    2.364522] init: [libfs_mgr]check_fs():
mount(/dev/block/vda,/system,ext4)=3D-1: No such file or directory
[    2.367800] init: [libfs_mgr]Not running /system/bin/e2fsck on
/dev/block/vda (executable not in system image)
[    2.472699] EXT4-fs (vda): recovery complete
[    2.473539] EXT4-fs (vda): mounted filesystem with ordered data mode.
Opts: barrier=3D1
[    2.474298] init:
[libfs_mgr]__mount(source=3D/dev/block/vda,target=3D/system,type=3Dext4)=3D=
0:
Success
[    2.480449] init: Switching root to '/system'
[    2.502059] init: [libfs_mgr]superblock
s_max_mnt_count:65535,/dev/block/vdb
[    2.613275] EXT4-fs (vdb): recovery complete
[    2.613448] EXT4-fs (vdb): mounted filesystem with ordered data mode.
Opts: barrier=3D1
[    2.720161] reboot: Restarting system with command 'bootloader'

On Wed, Aug 28, 2024 at 2:10=E2=80=AFPM Mario Marietto <marietto2008@gmail.=
com>
wrote:

> Hello.
>
> maybe I did some progress using these parameters :
>
> root@Z390-AORUS-PRO-DEST:/mnt/zroot2/zroot2/OS/Android# nano start-virt6
>
> qemu-system-aarch64 \
>     -smp 4 \
>     -m 2048 \
>     -cpu cortex-a72 \
>     -M virt \
>     -kernel
> /mnt/zroot2/zroot2/OS/Android/KostaKang/lineage-21.0-20240618-UNOFFICIAL-=
KonstaKANG-rpi4-atv/boot/Image
> \
>     -initrd
> /mnt/zroot2/zroot2/OS/Android/KostaKang/lineage-21.0-20240618-UNOFFICIAL-=
KonstaKANG-rpi4-atv/boot/ramdisk-recovery.img
> \
>     -append "console=3DttyAMA1,384000 androidboot.hardware=3Drpi4
> no_console_suspend root=3D/dev/mmcblk1p2 rootwait
> androidboot.selinux=3Dpermissive loglevel=3D8" \
>     -no-reboot \
>     -serial tcp::5555,server,nowait,nodelay \
>     -display sdl \
>     -serial mon:stdio \
>
>
> The LOG messages seem to be more interesting than before :
>
>
> root@Z390-AORUS-PRO-DEST:/mnt/zroot2/zroot2/OS/Android# ./start-virt6
>
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> [    0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@build-host)
> (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928) clang
> version 18.0.0 (https://android.googlesource.com/toolchain/llvm-project
> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #1 SMP PREEMPT Tue
> Jul  2 09:02:32 UTC 2024
> [    0.000000] KASLR enabled
> [    0.000000] random: crng init done
> [    0.000000] Machine model: linux,dummy-virt
> [    0.000000] efi: UEFI not found.
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] NoSplit zone start for each node
> [    0.000000] NoMerge zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
> [    0.000000] Initmem setup node 0 [mem
> 0x0000000040000000-0x00000000bfffffff]
> [    0.000000] cma: Reserved 8 MiB at 0x00000000bd000000 on node -1
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.0
> [    0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d31768 u126976
> [    0.000000] pcpu-alloc: s87016 r8192 d31768 u126976 alloc=3D31*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
> [    0.000000] Detected PIPT I-cache on CPU0
> [    0.000000] CPU features: detected: Spectre-v2
> [    0.000000] CPU features: detected: Spectre-v3a
> [    0.000000] CPU features: detected: Spectre-v4
> [    0.000000] CPU features: detected: Spectre-BHB
> [    0.000000] CPU features: kernel page table isolation forced ON by KAS=
LR
> [    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
> [    0.000000] CPU features: detected: ARM erratum 1742098
> [    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or
> 1530923
> [    0.000000] alternatives: applying boot alternatives
> [    0.000000] Kernel command line: console=3DttyAMA1,384000
> androidboot.hardware=3Drpi4 no_console_suspend root=3D/dev/mmcblk1p2 root=
wait
> androidboot.selinux=3Dpermissive loglevel=3D8
> androidboot.serialno=3D10000000abcd1234
> androidboot.btmacaddr=3D11:22:33:44:55:66
> [    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576
> bytes, linear)
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
> 516096
> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap
> free:off
> [    0.000000] Memory: 1998052K/2097152K available (19328K kernel code,
> 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 90908K reserved, 8192K
> cma-reserved)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4,=
 Nodes=3D1
> [    0.000000] ftrace: allocating 56269 entries in 220 pages
> [    0.000000] ftrace: allocated 220 pages with 5 groups
> [    0.000000] trace event string verifier disabled
> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> [    0.000000] rcu:     RCU event tracing is enabled.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to
> nr_cpu_ids=3D4.
> [    0.000000]  Trampoline variant of Tasks RCU enabled.
> [    0.000000]  Rude variant of Tasks RCU enabled.
> [    0.000000]  Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is
> 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D4
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] Root IRQ handler: gic_handle_irq
> [    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
> contention.
> [    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
> [    0.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff
> max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
> [    0.000072] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps ever=
y
> 4398046511096ns
> [    0.003415] kfence: initialized - using 2097152 bytes for 255 objects
> at 0x(____ptrval____)-0x(____ptrval____)
> [    0.010294] Calibrating delay loop (skipped), value calculated using
> timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
> [    0.010468] pid_max: default: 32768 minimum: 301
> [    0.012316] LSM: initializing lsm=3Dcapability,selinux,integrity
> [    0.012725] SELinux:  Initializing.
> [    0.016078] Mount-cache hash table entries: 4096 (order: 3, 32768
> bytes, linear)
> [    0.016140] Mountpoint-cache hash table entries: 4096 (order: 3, 32768
> bytes, linear)
> [    0.030412] cgroup: Disabling memory control group subsystem
> [    0.048581] cacheinfo: Unable to detect cache hierarchy for CPU 0
> [    0.058399] RCU Tasks: Setting shift to 2 and lim to 1
> rcu_task_cb_adjust=3D1.
> [    0.058995] RCU Tasks Rude: Setting shift to 2 and lim to 1
> rcu_task_cb_adjust=3D1.
> [    0.059241] RCU Tasks Trace: Setting shift to 2 and lim to 1
> rcu_task_cb_adjust=3D1.
> [    0.060770] rcu: Hierarchical SRCU implementation.
> [    0.060806] rcu:     Max phase no-delay instances is 1000.
> [    0.067966] EFI services will not be available.
> [    0.069136] smp: Bringing up secondary CPUs ...
> [    0.073070] Detected PIPT I-cache on CPU1
> [    0.074107] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
> [    0.079461] Detected PIPT I-cache on CPU2
> [    0.079980] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
> [    0.081795] Detected PIPT I-cache on CPU3
> [    0.082259] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
> [    0.082755] smp: Brought up 1 node, 4 CPUs
> [    0.082785] SMP: Total of 4 processors activated.
> [    0.082872] CPU features: detected: 32-bit EL0 Support
> [    0.082893] CPU features: detected: 32-bit EL1 Support
> [    0.082947] CPU features: detected: CRC32 instructions
> [    0.086896] CPU features: emulated: Privileged Access Never (PAN) usin=
g
> TTBR0_EL1 switching
> [    0.087196] CPU: All CPU(s) started at EL1
> [    0.087478] alternatives: applying system-wide alternatives
> [    0.111400] devtmpfs: initialized
> [    0.122787] Enabled cp15_barrier support
> [    0.123005] Enabled setend support
> [    0.124388] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.124510] futex hash table entries: 1024 (order: 4, 65536 bytes,
> linear)
> [    0.127804] pinctrl core: initialized pinctrl subsystem
> [    0.133859] DMI not present or invalid.
> [    0.143968] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.155874] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
> allocations
> [    0.156459] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for
> atomic allocations
> [    0.156805] audit: initializing netlink subsys (disabled)
> [    0.159085] audit: type=3D2000 audit(0.148:1): state=3Dinitialized
> audit_enabled=3D0 res=3D1
> [    0.162594] thermal_sys: Registered thermal governor 'step_wise'
> [    0.162937] cpuidle: using governor menu
> [    0.164031] hw-breakpoint: found 6 breakpoint and 4 watchpoint
> registers.
> [    0.164971] ASID allocator initialised with 32768 entries
> [    0.166421] Serial: AMBA PL011 UART driver
> [    0.195802] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13,
> base_baud =3D 0) is a PL011 rev1
> [    0.207191] 9040000.pl011: ttyAMA1 at MMIO 0x9040000 (irq =3D 14,
> base_baud =3D 0) is a PL011 rev1
> [    0.208270] printk: console [ttyAMA1] enabled
> [    0.227211] Modules: 2G module region forced by
> RANDOMIZE_MODULE_REGION_FULL
> [    0.227414] Modules: 0 pages in range for non-PLT usage
> [    0.227439] Modules: 516176 pages in range for PLT usage
> [    0.252423] iommu: Default domain type: Translated
> [    0.252692] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.255246] SCSI subsystem initialized
> [    0.256728] usbcore: registered new interface driver usbfs
> [    0.257155] usbcore: registered new interface driver hub
> [    0.257501] usbcore: registered new device driver usb
> [    0.258703] mc: Linux media interface: v0.10
> [    0.259091] videodev: Linux video capture interface: v2.00
> [    0.260033] pps_core: LinuxPPS API ver. 1 registered
> [    0.260306] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o
> Giometti <giometti@linux.it>
> [    0.260646] PTP clock support registered
> [    0.263957] Advanced Linux Sound Architecture Driver Initialized.
> [    0.275807] Bluetooth: Core ver 2.22
> [    0.276194] NET: Registered PF_BLUETOOTH protocol family
> [    0.276328] Bluetooth: HCI device and connection manager initialized
> [    0.276761] Bluetooth: HCI socket layer initialized
> [    0.276945] Bluetooth: L2CAP socket layer initialized
> [    0.277292] Bluetooth: SCO socket layer initialized
> [    0.279818] vgaarb: loaded
> [    0.283189] clocksource: Switched to clocksource arch_sys_counter
> [    0.289133] VFS: Disk quotas dquot_6.6.0
> [    0.289446] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
> bytes)
> [    0.290358] FS-Cache: Loaded
> [    0.291617] CacheFiles: Loaded
> [    0.298740] NET: Registered PF_INET protocol family
> [    0.300444] IP idents hash table entries: 32768 (order: 6, 262144
> bytes, linear)
> [    0.316440] tcp_listen_portaddr_hash hash table entries: 1024 (order:
> 2, 16384 bytes, linear)
> [    0.316948] Table-perturb hash table entries: 65536 (order: 6, 262144
> bytes, linear)
> [    0.317307] TCP established hash table entries: 16384 (order: 5, 13107=
2
> bytes, linear)
> [    0.318245] TCP bind hash table entries: 16384 (order: 7, 524288 bytes=
,
> linear)
> [    0.319865] TCP: Hash tables configured (established 16384 bind 16384)
> [    0.323421] MPTCP token hash table entries: 2048 (order: 3, 49152
> bytes, linear)
> [    0.323880] UDP hash table entries: 1024 (order: 3, 32768 bytes, linea=
r)
> [    0.324323] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes,
> linear)
> [    0.326061] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.328752] PCI: CLS 0 bytes, default 64
> [    0.334033] Trying to unpack rootfs image as initramfs...
> [    0.336332] kvm [1]: HYP mode not available
> [    0.343844] Initialise system trusted keyrings
> [    0.346555] workingset: timestamp_bits=3D46 max_order=3D19 bucket_orde=
r=3D0
> [    0.347547] zbud: loaded
> [    0.357060] Key type cifs.idmap registered
> [    0.358007] fuse: init (API version 7.39)
> [    0.401184] Key type asymmetric registered
> [    0.401438] Asymmetric key parser 'x509' registered
> [    0.401856] Block layer SCSI generic (bsg) driver version 0.4 loaded
> (major 244)
> [    0.403283] io scheduler mq-deadline registered
> [    0.403590] io scheduler kyber registered
> [    0.404135] io scheduler bfq registered
> [    0.419403] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000
> mem_size:0x00000000(0 MiB)
> [    0.474856] brd: module loaded
> [    0.505166] loop: module loaded
> [    0.508386] Loading iSCSI transport class v2.0-870.
> [    0.518541] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com
> for information.
> [    0.518727] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <
> Jason@zx2c4.com>. All Rights Reserved.
> [    0.530178] tun: Universal TUN/TAP device driver, 1.6
> [    0.533835] usbcore: registered new interface driver brcmfmac
> [    0.534107] usbcore: registered new device driver r8152-cfgselector
> [    0.534455] usbcore: registered new interface driver r8152
> [    0.534682] usbcore: registered new interface driver lan78xx
> [    0.534915] usbcore: registered new interface driver asix
> [    0.535376] usbcore: registered new interface driver ax88179_178a
> [    0.535608] usbcore: registered new interface driver cdc_ether
> [    0.535863] usbcore: registered new interface driver smsc95xx
> [    0.536193] usbcore: registered new interface driver net1080
> [    0.536532] usbcore: registered new interface driver cdc_subset
> [    0.536771] usbcore: registered new interface driver zaurus
> [    0.537039] usbcore: registered new interface driver cdc_ncm
> [    0.537301] usbcore: registered new interface driver r8153_ecm
> [    0.538269] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
> [    0.538549] dwc_otg: FIQ enabled
> [    0.538629] dwc_otg: NAK holdoff enabled
> [    0.538725] dwc_otg: FIQ split-transaction FSM enabled
> [    0.538906] Module dwc_common_port init
> [    0.541229] usbcore: registered new interface driver cdc_acm
> [    0.541356] cdc_acm: USB Abstract Control Model driver for USB modems
> and ISDN adapters
> [    0.542269] usbcore: registered new interface driver uas
> [    0.542583] usbcore: registered new interface driver usb-storage
> [    0.543322] usbcore: registered new interface driver cp210x
> [    0.543681] usbserial: USB Serial support registered for cp210x
> [    0.543973] usbcore: registered new interface driver pl2303
> [    0.544176] usbserial: USB Serial support registered for pl2303
> [    0.547458] mousedev: PS/2 mouse device common for all mice
> [    0.547725] usbcore: registered new interface driver xpad
> [    0.547949] usbcore: registered new interface driver usb_acecad
> [    0.548186] usbcore: registered new interface driver aiptek
> [    0.548462] usbcore: registered new interface driver hanwang
> [    0.548692] usbcore: registered new interface driver kbtab
> [    0.549180] usbcore: registered new interface driver usbtouchscreen
> [    0.550460] i2c_dev: i2c /dev entries driver
> [    0.553959] ir_imon_decoder: IR iMON protocol handler initialized
> [    0.554110] IR JVC protocol handler initialized
> [    0.554225] IR MCE Keyboard/mouse protocol handler initialized
> [    0.554357] IR NEC protocol handler initialized
> [    0.554476] IR RC5(x/sz) protocol handler initialized
> [    0.554593] IR RC6 protocol handler initialized
> [    0.554711] IR RCMM protocol handler initialized
> [    0.554829] IR SANYO protocol handler initialized
> [    0.555046] IR Sharp protocol handler initialized
> [    0.555351] IR Sony protocol handler initialized
> [    0.555469] IR XMP protocol handler initialized
> [    0.556083] usbcore: registered new interface driver uvcvideo
> [    0.557793] device-mapper: uevent: version 1.0.3
> [    0.558904] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01)
> initialised: dm-devel@redhat.com
> [    0.560836] Bluetooth: HCI UART driver ver 2.3
> [    0.561007] Bluetooth: HCI UART protocol H4 registered
> [    0.561440] Bluetooth: HCI UART protocol Broadcom registered
> [    0.563240] sdhci: Secure Digital Host Controller Interface driver
> [    0.563373] sdhci: Copyright(c) Pierre Ossman
> [    0.563861] sdhci-pltfm: SDHCI platform and OF driver helper
> [    0.565404] ledtrig-cpu: registered to indicate activity on CPUs
> [    0.567595] hid: raw HID events driver (C) Jiri Kosina
> [    0.578778] usbcore: registered new interface driver usbhid
> [    0.579196] usbhid: USB HID core driver
> [    0.582877] ashmem: initialized
> [    0.584380] SPI driver st-accel-spi has no spi_device_id for
> st,lis302dl-spi
> [    0.584551] SPI driver st-accel-spi has no spi_device_id for
> st,lis3lv02dl-accel
> [    0.584745] SPI driver st-accel-spi has no spi_device_id for
> st,lis3dh-accel
> [    0.584935] SPI driver st-accel-spi has no spi_device_id for
> st,lsm330d-accel
> [    0.585076] SPI driver st-accel-spi has no spi_device_id for
> st,lsm330dl-accel
> [    0.585242] SPI driver st-accel-spi has no spi_device_id for
> st,lsm330dlc-accel
> [    0.585385] SPI driver st-accel-spi has no spi_device_id for
> st,lis331dlh-accel
> [    0.585526] SPI driver st-accel-spi has no spi_device_id for
> st,lsm330-accel
> [    0.585663] SPI driver st-accel-spi has no spi_device_id for
> st,lsm303agr-accel
> [    0.585803] SPI driver st-accel-spi has no spi_device_id for
> st,lis2dh12-accel
> [    0.585944] SPI driver st-accel-spi has no spi_device_id for
> st,lng2dm-accel
> [    0.586094] SPI driver st-accel-spi has no spi_device_id for
> st,h3lis331dl-accel
> [    0.586280] SPI driver st-accel-spi has no spi_device_id for
> st,lis331dl-accel
> [    0.586460] SPI driver st-accel-spi has no spi_device_id for
> st,lsm303c-accel
> [    0.587705] SPI driver st-magn-spi has no spi_device_id for
> st,lis3mdl-magn
> [    0.587923] SPI driver st-magn-spi has no spi_device_id for
> st,lsm303agr-magn
> [    0.588163] SPI driver st-magn-spi has no spi_device_id for
> st,lsm9ds1-magn
> [    0.588410] SPI driver st-magn-spi has no spi_device_id for
> st,lsm303c-magn
> [    0.596185] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
> counters available
> [    0.600270] usbcore: registered new interface driver snd-usb-audio
> [    0.607077] Mirror/redirect action on
> [    0.607525] netem: version 1.3
> [    0.607614] u32 classifier
> [    0.607673]     input device check on
> [    0.607755]     Actions configured
> [    0.615221] xt_time: kernel timezone is -0000
> [    0.615693] gre: GRE over IPv4 demultiplexor driver
> [    0.615911] IPv4 over IPsec tunneling driver
> [    0.621107] Initializing XFRM netlink socket
> [    0.621440] IPsec XFRM device driver
> [    0.622363] NET: Registered PF_INET6 protocol family
> [    0.635597] Segment Routing with IPv6
> [    0.635871] In-situ OAM (IOAM) with IPv6
> [    0.636820] mip6: Mobile IPv6
> [    0.641935] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    0.646292] NET: Registered PF_PACKET protocol family
> [    0.646553] NET: Registered PF_KEY protocol family
> [    0.646756] Key type dns_resolver registered
> [    0.779288] registered taskstats version 1
> [    0.781971] Loading compiled-in X.509 certificates
> [    0.852683] Key type .fscrypt registered
> [    0.852897] Key type fscrypt-provisioning registered
> [    0.864447] of_cfs_init
> [    0.865145] of_cfs_init: OK
> [    0.870305] cfg80211: Loading compiled-in X.509 certificates for
> regulatory database
> [    1.478027] Freeing initrd memory: 14612K
> [    1.503691] Loaded X.509 cert 'benh@debian.org:
> 577e021cb980e0e820821ba7b54b4961b8b4fadf'
> [    1.504674] Loaded X.509 cert 'romain.perier@gmail.com:
> 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
> [    1.505470] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [    1.506197] Loaded X.509 cert 'wens:
> 61c038651aabdcf94bd0ac7ff06c7248db18c600'
> [    1.512240] clk: Disabling unused clocks
> [    1.512725] ALSA device list:
> [    1.512871]   No soundcards found.
> [    1.517373] uart-pl011 9040000.pl011: no DMA platform data
> [    1.607308] Freeing unused kernel memory: 1792K
> [    1.610100] Run /init as init process
> [    1.610246]   with arguments:
> [    1.610366]     /init
> [    1.610472]   with environment:
> [    1.610544]     HOME=3D/
> [    1.610615]     TERM=3Dlinux
> linker: Warning: "[vdso]" unused DT entry: unknown processor-specific
> (type 0x70000001 arg 0x0) (ignoring)
> WARNING: linker: Warning: "[vdso]" unused DT entry: unknown
> processor-specific (type 0x70000001 arg 0x0) (ignoring)
> [    1.971090] init: init first stage started!
> [    1.974290] init: ForceNormalBoot::twrp_fastboot: 1
> [    1.974628] init: ForceNormalBoot::normal_boot: 0
> [    1.976478] init: Unable to open /lib/modules, skipping module loading=
.
> [    1.977251] init: ForceNormalBoot::twrp_fastboot: 1
> [    1.977534] init: ForceNormalBoot::normal_boot: 0
> [    1.978174] init: First stage mount skipped (recovery mode)
> [    1.982840] init: [libfs_mgr]ReadFstabFromDt(): failed to read fstab
> from dt
> [    1.987898] init: [libfs_mgr]Warning: unknown flag: backup=3D1
> [    1.988241] init: [libfs_mgr]Warning: unknown flag: wipeingui
> [    2.002691] printk: init: 6 output lines suppressed due to ratelimitin=
g
> [    2.016195] linker: Warning: "[vdso]" unused DT entry: unknown
> processor-specific (type 0x70000001 arg 0x0) (ignoring)
> [    2.016510] WARNING: linker:
> [    2.016604] Warning: "
> [    2.016752] [vdso]
> [    2.016889] " unused DT entry:
> [    2.017021] unknown processor-specific
> [    2.017168]  (type
> [    2.017381] 0x70000001
> [    2.017512]  arg
> [    2.017647] 0x0
> [    2.202622] printk: init: 2 output lines suppressed due to ratelimitin=
g
> [    2.208265] init: [libfs_mgr]Warning: unknown flag: backup=3D1
> [    2.208576] init: [libfs_mgr]Warning: unknown flag: wipeingui
> [    2.208914] init: [libfs_mgr]Warning: unknown flag: backup=3D1
> [    2.209219] init: [libfs_mgr]Warning: unknown flag: wipeingui
> [    2.209836] init: [libfs_mgr]Warning: unknown flag: backup=3D1
> [    2.210125] init: [libfs_mgr]Warning: unknown flag: wipeingui
> [    2.215144] init: Skipping mount of system_ext, system is not dynamic.
> [    2.215880] init: Loading SELinux policy
> [    2.266430] SELinux:  Permission nlmsg_getneigh in class
> netlink_route_socket not defined in policy.
> [    2.266759] SELinux:  Permission perfmon in class capability2 not
> defined in policy.
> [    2.266903] SELinux:  Permission bpf in class capability2 not defined
> in policy.
> [    2.267119] SELinux:  Permission checkpoint_restore in class
> capability2 not defined in policy.
> [    2.267369] SELinux:  Permission perfmon in class cap2_userns not
> defined in policy.
> [    2.267524] SELinux:  Permission bpf in class cap2_userns not defined
> in policy.
> [    2.267653] SELinux:  Permission checkpoint_restore in class
> cap2_userns not defined in policy.
> [    2.267956] SELinux:  Class mctp_socket not defined in policy.
> [    2.268106] SELinux:  Class anon_inode not defined in policy.
> [    2.268256] SELinux:  Class io_uring not defined in policy.
> [    2.268386] SELinux:  Class user_namespace not defined in policy.
> [    2.268521] SELinux: the above unknown classes and permissions will be
> denied
> [    2.288331] SELinux:  policy capability network_peer_controls=3D1
> [    2.288500] SELinux:  policy capability open_perms=3D1
> [    2.288618] SELinux:  policy capability extended_socket_class=3D1
> [    2.288751] SELinux:  policy capability always_check_network=3D0
> [    2.288881] SELinux:  policy capability cgroup_seclabel=3D0
> [    2.289005] SELinux:  policy capability nnp_nosuid_transition=3D1
> [    2.289137] SELinux:  policy capability genfs_seclabel_symlinks=3D0
> [    2.289319] SELinux:  policy capability ioctl_skip_cloexec=3D0
> [    2.307140] audit: type=3D1403 audit(2.288:2): auid=3D4294967295
> ses=3D4294967295 lsm=3Dselinux res=3D1
> [    2.308695] selinux: SELinux: Loaded policy from /sepolicy
> [    2.308967] selinux:
> [    2.359528] printk: init: 2 output lines suppressed due to ratelimitin=
g
> [    2.556011] init: init second stage started!
> [    2.776035] init: Using Android DT directory
> /proc/device-tree/firmware/android/
> [    2.797264] init: Couldn't load property file
> '/system/etc/prop.default': open() failed: No such file or directory: No
> such file or directory
> [    2.846779] init: Couldn't load property file '/system/build.prop':
> open() failed: No such file or directory: No such file or directory
> [    2.847869] init: Couldn't load property file '/system_ext/build.prop'=
:
> open() failed: No such file or directory: No such file or directory
> [    2.848540] init: Couldn't load property file '/vendor/default.prop':
> open() failed: No such file or directory: No such file or directory
> [    2.849165] init: Couldn't load property file '/vendor/build.prop':
> open() failed: No such file or directory: No such file or directory
> [    2.849830] init: Couldn't load property file '/odm/etc/build.prop':
> open() failed: No such file or directory: No such file or directory
> [    2.850546] init: Couldn't load property file '/product/build.prop':
> open() failed: No such file or directory: No such file or directory
> [    2.851394] init: Couldn't load property file '/factory/factory.prop':
> open() failed: No such file or directory: No such file or directory
> [    3.089359] cgroup: Disabled controller 'memory'
> [    3.092460] cgroup: Unknown subsys name 'schedtune'
> [    3.120187] audit: type=3D1400 audit(3.100:3): avc:  denied  { perfmon=
 }
> for  pid=3D1 comm=3D"init" capability=3D38  scontext=3Du:r:init:s0
> tcontext=3Du:r:init:s0 tclass=3Dcapability2 permissive=3D1
> [    3.426415] ueventd: ueventd started!
> [    3.448141] selinux: SELinux: Loaded file_contexts
> [    3.448414] selinux:
> [    3.450283] ueventd: Parsing file /system/etc/ueventd.rc...
> [    3.455379] ueventd: Parsing file /vendor/ueventd.rc...
> [    3.455868] ueventd: Unable to read config file '/vendor/ueventd.rc':
> open() failed: No such file or directory
> [    3.456438] ueventd: Parsing file /odm/ueventd.rc...
> [    3.456890] ueventd: Unable to read config file '/odm/ueventd.rc':
> open() failed: No such file or directory
> [    3.457440] ueventd: Parsing file /ueventd.rpi4.rc...
> [    3.457909] ueventd: Unable to read config file '/ueventd.rpi4.rc':
> open() failed: No such file or directory
> [    4.699678] audit: type=3D1400 audit(4.684:4): avc:  denied  { entrypo=
int
> } for  pid=3D96 comm=3D"init" path=3D"/system/bin/logd" dev=3D"rootfs" in=
o=3D271
> scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile perm=
issive=3D1
> [    4.706631] audit: type=3D1400 audit(4.688:5): avc:  denied  { map } f=
or
>  pid=3D96 comm=3D"logd" path=3D"/system/bin/logd" dev=3D"rootfs" ino=3D27=
1
> scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile perm=
issive=3D1
> [    4.707481] audit: type=3D1400 audit(4.688:6): avc:  denied  { read } =
for
>  pid=3D96 comm=3D"logd" path=3D"/system/bin/logd" dev=3D"rootfs" ino=3D27=
1
> scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile perm=
issive=3D1
> [    4.708316] audit: type=3D1400 audit(4.688:7): avc:  denied  { execute=
 }
> for  pid=3D96 comm=3D"logd" path=3D"/system/bin/logd" dev=3D"rootfs" ino=
=3D271
> scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile perm=
issive=3D1
> [    4.729108] audit: type=3D1400 audit(4.712:8): avc:  denied  { getattr=
 }
> for  pid=3D96 comm=3D"logd" path=3D"/system/bin/logd" dev=3D"rootfs" ino=
=3D271
> scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile perm=
issive=3D1
> [    4.743227] audit: type=3D1400 audit(4.724:9): avc:  denied  { read } =
for
>  pid=3D96 comm=3D"logd" name=3D"bin" dev=3D"rootfs" ino=3D167 scontext=3D=
u:r:logd:s0
> tcontext=3Du:object_r:rootfs:s0 tclass=3Ddir permissive=3D1
> [    4.755432] audit: type=3D1400 audit(4.736:10): avc:  denied  { open }
> for  pid=3D96 comm=3D"logd" path=3D"/system/lib64/libsysutils.so" dev=3D"=
rootfs"
> ino=3D6255 scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=
=3Dfile
> permissive=3D1
> [    4.937922] logd: Cannot read /system/etc/event-log-tags
> [    4.964388] file system registered
> [    4.969588] logd.auditd: start
> [    4.970233] logd.klogd: 4955041232
> [    5.132743] type=3D1400 audit(5.108:14): avc: denied { create } for
> comm=3D"hwservicemanage" scontext=3Du:r:recovery:s0 tcontext=3Du:r:recove=
ry:s0
> tclass=3Dnetlink_selinux_socket permissive=3D1
> [    5.136378] type=3D1400 audit(5.112:15): avc: denied { bind } for
> comm=3D"hwservicemanage" scontext=3Du:r:recovery:s0 tcontext=3Du:r:recove=
ry:s0
> tclass=3Dnetlink_selinux_socket permissive=3D1
> [    5.143332] type=3D1400 audit(5.112:16): avc: denied { read } for
> comm=3D"hwservicemanage" name=3D"perms" dev=3D"selinuxfs" ino=3D67112391
> scontext=3Du:r:recovery:s0 tcontext=3Du:object_r:selinuxfs:s0 tclass=3Ddi=
r
> permissive=3D1
> [    5.146297] type=3D1400 audit(5.112:17): avc: denied { open } for
> comm=3D"hwservicemanage" path=3D"/sys/fs/selinux/class/hwservice_manager/=
perms"
> dev=3D"selinuxfs" ino=3D67112391 scontext=3Du:r:recovery:s0
> tcontext=3Du:object_r:selinuxfs:s0 tclass=3Ddir permissive=3D1
> [    5.174030] type=3D1400 audit(5.124:18): avc: denied { write } for
> comm=3D"hwservicemanage" name=3D"access" dev=3D"selinuxfs" ino=3D6
> scontext=3Du:r:recovery:s0 tcontext=3Du:object_r:selinuxfs:s0 tclass=3Dfi=
le
> permissive=3D1
> [    5.177477] type=3D1400 audit(5.124:19): avc: denied { compute_av } fo=
r
> comm=3D"hwservicemanage" scontext=3Du:r:recovery:s0
> tcontext=3Du:object_r:kernel:s0 tclass=3Dsecurity permissive=3D1
> [    5.181388] type=3D1400 audit(5.152:20): avc: denied { set_context_mgr=
 }
> for comm=3D"hwservicemanage" scontext=3Du:r:recovery:s0
> tcontext=3Du:r:recovery:s0 tclass=3Dbinder permissive=3D1
> WARNING: linker: Warning: "[vdso]" unused DT entry: unknown
> processor-specific (type 0x70000001 arg 0x0) (ignoring)
>
> console:/ #
>
> [    7.812969] init: Service 'recovery' (pid 106) received signal 11
> [    7.813381] init: Sending signal 9 to service 'recovery' (pid 106)
> process group...
> [    7.814694] libprocessgroup: Successfully killed process cgroup uid 0
> pid 106 in 0ms
> [    7.820960] init: Untracked pid 110 exited with status 1
> [   10.206834] init: starting service 'recovery'...
> [   10.211672] init: Created socket '/dev/socket/recovery', mode 422, use=
r
> 1000, group 1000
> [   10.313714] init: starting service 'adbd'...
> [   10.319354] init: Created socket '/dev/socket/adbd', mode 660, user
> 1000, group 1000
> [   10.597898] read descriptors
> [   10.598630] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   10.599621] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   10.600467] read strings
> [   10.613340] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   10.632907] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 1ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   11.678635] read descriptors
> [   11.678883] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   11.679695] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   11.680663] read strings
> [   11.760913] platform gpio-keys: deferred probe pending
> [   12.761137] read descriptors
> [   12.761449] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   12.761972] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   12.762607] read strings
> [   13.826065] read descriptors
> [   13.826428] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   13.827903] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   13.829154] read strings
> [   13.833730] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   13.839092] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   13.840732] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   14.889512] read descriptors
> [   14.889701] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   14.890177] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   14.890767] read strings
> [   14.895430] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   14.900587] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   14.902076] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   15.224749] init: starting service 'recovery'...
> [   15.228494] init: Created socket '/dev/socket/recovery', mode 422, use=
r
> 1000, group 1000
> [   15.681727] init: Unable to set property 'ro.twrp.boot' from uid:0
> gid:0 pid:124: Read-only property was already set
> [   15.686406] init: Unable to set property 'ro.twrp.version' from uid:0
> gid:0 pid:124: Read-only property was already set
> [   15.949039] read descriptors
> [   15.949240] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   15.949733] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   15.950378] read strings
> [   17.016978] read descriptors
> [   17.017147] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   17.017426] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   17.017781] read strings
> [   18.132636] read descriptors
> [   18.133219] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   18.134486] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   18.137501] read strings
> [   19.197574] read descriptors
> [   19.197760] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   19.198136] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   19.198665] read strings
> [   19.208502] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   19.214749] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   19.216726] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   20.237060] init: starting service 'recovery'...
> [   20.240672] init: Created socket '/dev/socket/recovery', mode 422, use=
r
> 1000, group 1000
> [   20.282811] read descriptors
> [   20.283381] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   20.283889] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   20.284536] read strings
> [   20.292396] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   20.300513] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   20.302642] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   20.754865] init: Unable to set property 'ro.twrp.boot' from uid:0
> gid:0 pid:131: Read-only property was already set
> [   20.759553] init: Unable to set property 'ro.twrp.version' from uid:0
> gid:0 pid:131: Read-only property was already set
> [   21.349790] read descriptors
> [   21.350005] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   21.350465] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   21.352780] read strings
> [   22.423098] read descriptors
> [   22.423361] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   22.423651] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   22.424144] read strings
> [   23.481363] read descriptors
> [   23.481606] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   23.482130] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   23.482813] read strings
> [   24.553075] read descriptors
> [   24.553241] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   24.553597] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   24.553975] read strings
> [   24.558331] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   24.563898] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   24.565567] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   25.248962] init: starting service 'recovery'...
> [   25.253276] init: Created socket '/dev/socket/recovery', mode 422, use=
r
> 1000, group 1000
> [   25.641207] read descriptors
> [   25.641328] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   25.641616] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   25.642040] read strings
> [   25.648473] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   25.669450] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 1ms and failed: symlink() failed: File exists
> [   25.672542] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   25.706240] init: Unable to set property 'ro.twrp.boot' from uid:0
> gid:0 pid:139: Read-only property was already set
> [   25.710372] init: Unable to set property 'ro.twrp.version' from uid:0
> gid:0 pid:139: Read-only property was already set
> [   26.709759] read descriptors
> [   26.710096] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   26.710921] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   26.712463] read strings
> [   27.782228] read descriptors
> [   27.782350] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   27.782569] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   27.782877] read strings
> [   28.849863] read descriptors
> [   28.850115] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   28.850775] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   28.852359] read strings
> [   29.942409] read descriptors
> [   29.942646] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   29.943232] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   29.943746] read strings
> [   29.949390] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   29.955577] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   29.957043] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   30.268078] init: starting service 'recovery'...
> [   30.286298] init: Created socket '/dev/socket/recovery', mode 422, use=
r
> 1000, group 1000
> [   30.726944] init: Unable to set property 'ro.twrp.boot' from uid:0
> gid:0 pid:147: Read-only property was already set
> [   30.731529] init: Unable to set property 'ro.twrp.version' from uid:0
> gid:0 pid:147: Read-only property was already set
> [   31.017959] read descriptors
> [   31.018182] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   31.018669] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   31.019885] read strings
> [   31.028871] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   31.037564] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   31.039173] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   32.092703] read descriptors
> [   32.093392] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   32.093996] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   32.095530] read strings
> [   33.149642] read descriptors
> [   33.149854] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   33.150334] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   33.150887] read strings
> [   34.230547] read descriptors
> [   34.230852] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   34.233227] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   34.234420] read strings
> [   35.301592] init: starting service 'recovery'...
> [   35.319970] init: Created socket '/dev/socket/recovery', mode 422, use=
r
> 1000, group 1000
> [   35.320441] read descriptors
> [   35.320589] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   35.321087] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   35.322062] read strings
> [   35.382841] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   35.391787] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   35.393645] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   35.785517] init: Unable to set property 'ro.twrp.boot' from uid:0
> gid:0 pid:156: Read-only property was already set
> [   35.789909] init: Unable to set property 'ro.twrp.version' from uid:0
> gid:0 pid:156: Read-only property was already set
> [   36.421841] read descriptors
> [   36.422877] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   36.426638] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   36.427376] read strings
> [   36.432055] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   36.438294] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   36.440095] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   37.502771] read descriptors
> [   37.502908] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   37.503568] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   37.504160] read strings
> [   38.575803] read descriptors
> [   38.576299] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   38.577608] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   38.578173] read strings
>
> |console:/ #
>
> [   39.633521] read descriptors
> [   39.633726] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   39.634107] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   39.634647] read strings
> [   40.334108] init: starting service 'recovery'...
> [   40.338087] init: Created socket '/dev/socket/recovery', mode 422, use=
r
> 1000, group 1000
> [   40.721751] read descriptors
> [   40.721951] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   40.722415] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   40.723179] read strings
> [   40.729072] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   40.742406] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   40.745270] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   40.789765] init: Unable to set property 'ro.twrp.boot' from uid:0
> gid:0 pid:164: Read-only property was already set
> [   40.793898] init: Unable to set property 'ro.twrp.version' from uid:0
> gid:0 pid:164: Read-only property was already set
> [   41.794291] read descriptors
> [   41.794526] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   41.795504] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   41.796355] read strings
> [   41.802136] init: processing action (sys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
> (/system/etc/init/hw/init.rc:208)
> [   41.807484] init: Command 'symlink
> /config/usb_gadget/g1/functions/ffs.adb
> /config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
> sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.r=
c:211)
> took 0ms and failed: symlink() failed: File exists
> [   41.809032] init: Command 'write /config/usb_gadget/g1/UDC
> ${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=
=3D1 &&
> sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed:
> property 'sys.usb.controller' doesn't exist while expanding
> '${sys.usb.controller}'
> [   42.865948] read descriptors
> [   42.866163] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   42.866523] bcdVersion must be 0x0100, stored in Little Endian order.
> Userspace driver should be fixed, accepting 0x0001 for compatibility.
> [   42.866910] read strings
>
> On Tue, Aug 27, 2024 at 3:04=E2=80=AFPM Mario Marietto <marietto2008@gmai=
l.com>
> wrote:
>
>> Hello to everyone.
>>
>> As I said before,some years ago I was able to emulate Android on my
>> Jetson Nano. It was a special version of Android,prepared by antmicro an=
d
>> the github is located here :
>>
>> https://github.com/antmicro/kvm-aosp-jetson-nano
>>
>> I would like to compile it again and try to emulate it on my Jetson Nano
>> again and on my Intel PC + Ubuntu 24.04 x64 bit.
>> I followed the tutorial again and I've been able to create the Android
>> img files below without problems :
>>
>>
>> out/target/product/generic_arm64/vendor.img
>> out/target/product/generic_arm64/system.img
>> out/target/product/generic_arm64/userdata.img
>> out/target/product/generic_arm64/ramdisk.img
>>
>> Now I need the kernel,so I tried to fetch the kernel sources to compile
>> it. Unfortunately the github is old and some links are broken.
>> I want to ask your help to fix the broken link as better as possible :
>>
>> root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo init -u
>> https://android.googlesource.com/kernel/manifest -b
>> q-common-android-4.14
>>
>> Downloading Repo source from https://gerrit.googlesource.com/git-repo
>>
>> Your identity is: ziomario <marietto2008@gmail.com>
>> If you want to change this, please re-run 'repo init' with --config-name
>>
>> repo has been initialized in /mnt/sdl1/aosp_kernel
>>
>> root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
>>
>>
>> Fetching:  0% (0/8) 0:07 | 2 jobs | 0:05 kernel/build @ buildRicezione
>> degli oggetti:  84% (14706/17
>>
>> Fetching:  0% (0/8) 0:07 | 2 jobs | 0:06 kernel/build @ buildRicezione
>> degli oggetti:  85% (14881/17
>> Ricezione degli oggetti: 100% (17506/17506), 12.23 MiB | 46.57 MiB/s,
>> fatto.
>> Risoluzione dei delta: 100% (8869/8869), fatto.
>> Fetching: 50% (4/8) 9:11 | 1 job | 9:01 kernel/common @ commonRicezione
>> degli oggetti:   0% (1/12468
>> Fetching: 50% (4/8) 9:12 | 1 job | 9:02 kernel/common @ commonRicezione
>> degli oggetti:   0% (80382/1
>> Fetching: 50% (4/8) 9:12 | 1 job | 9:03 kernel/common @ commonRicezione
>> degli oggetti:   1% (124682/
>> Fetching: 50% (4/8) 9:13 | 1 job | 9:03 kernel/common @ commonRicezione
>> degli oggetti:   1% (163592/
>> Fetching: 50% (4/8) 9:14 | 1 job | 9:04 kernel/common @ commonRicezione
>> degli oggetti:   1% (245123/
>> Fetching: 50% (4/8) 9:15 | 1 job | 9:05 kernel/common @ commonRicezione
>> degli oggetti:   2% (333147/
>> Fetching: 50% (4/8) 9:15 | 1 job | 9:06 kernel/common @ commonRicezione
>> degli oggetti:   3% (374044/
>> .....
>> Fetching: 50% (4/8) 12:06 | 1 job | 11:57 kernel/common @
>> commonRisoluzione dei delta:  98% (1023355
>> Fetching: 50% (4/8) 12:07 | 1 job | 11:58 kernel/common @
>> commonRisoluzione dei delta:  99% (1028207
>> Fetching: 50% (4/8) 12:08 | 1 job | 11:59 kernel/common @
>> commonRisoluzione dei delta: 100% (1034277
>> Risoluzione dei delta: 100% (10342775/10342775), fatto.
>>
>> Fetching: 50% (4/8) 13:44 | 1 job | 13:34 kernel/common @ common
>>
>>
>> fatal: can't find remote refs/heads/android-4.14-q
>>
>> kernel/common:
>>
>> kernel/common: sleeping 4.0 seconds before retrying
>>
>> error: Cannot fetch kernel/common from
>> https://android.googlesource.com/kernel/common
>>
>>
>> Fetching: 50% (4/8) 13:45 | 1 job | 0:01 kernel/tests @ kernel/tests
>>
>> Ricezione degli oggetti:
>>
>>
>> Ricezione degli oggetti: 100% (11797/11797), 4.91 MiB | 48.34 MiB/s,
>> fatto.
>> Risoluzione dei delta: 100% (2123/2123), fatto.
>> Fetching: 100% (8/8), done in 18m26.961s
>> Fetching:  0% (0/1) 0:04 | 1 job | 0:04 kernel/common @ common
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>>
>> kernel/common:
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> kernel/common: sleeping 4.0 seconds before retrying
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> error: Cannot fetch kernel/common from
>> https://android.googlesource.com/kernel/common
>> Fetching: 100% (1/1), done in 5.046s
>> error: Cannot checkout kernel/common: ManifestInvalidRevisionError:
>> revision android-4.14-q in kernel/common not found
>> error: in `sync`: revision android-4.14-q in kernel/common not found
>> root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
>> Fetching:  0% (0/8) 0:09 | 2 jobs | 0:07 kernel/common @ common
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>>
>> kernel/common:
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> kernel/common: sleeping 4.0 seconds before retrying
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> error: Cannot fetch kernel/common from
>> https://android.googlesource.com/kernel/common
>> Fetching: 100% (8/8), done in 12.927s
>> Fetching:  0% (0/1) 0:04 | 1 job | 0:04 kernel/common @ common
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>>
>> kernel/common:
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> kernel/common: sleeping 4.0 seconds before retrying
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> error: Cannot fetch kernel/common from
>> https://android.googlesource.com/kernel/common
>> Fetching: 100% (1/1), done in 5.008s
>> error: Cannot checkout kernel/common: ManifestInvalidRevisionError:
>> revision android-4.14-q in kernel/common not found
>> error: in `sync`: revision android-4.14-q in kernel/common not found
>> root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
>> Fetching: 50% (4/8) 0:04 | 1 job | 0:03 kernel/common @ common
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>>
>> kernel/common:
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> kernel/common: sleeping 4.0 seconds before retrying
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> error: Cannot fetch kernel/common from
>> https://android.googlesource.com/kernel/common
>> Fetching: 100% (8/8), done in 5.696s
>> Fetching:  0% (0/1) 0:04 | 1 job | 0:04 kernel/common @ common
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> kernel/common:
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> kernel/common: sleeping 4.0 seconds before retrying
>> fatal: impossibile trovare il riferimento remoto
>> refs/heads/android-4.14-q
>> error: Cannot fetch kernel/common from
>> https://android.googlesource.com/kernel/common
>> Fetching: 100% (1/1), done in 4.930s
>> error: Cannot checkout kernel/common: ManifestInvalidRevisionError:
>> revision android-4.14-q in kernel/common not found
>> error: in `sync`: revision android-4.14-q in kernel/common not found
>>
>> thanks.
>>
>>
>> On Sun, Aug 25, 2024 at 5:58=E2=80=AFPM Mario Marietto <marietto2008@gma=
il.com>
>> wrote:
>>
>>> ok,I've understood that initrd is ramdisk.img,so :
>>>
>>> qemu-system-aarch64 \
>>>         -smp 4 \
>>>         -m 2048 \
>>>         -cpu cortex-a72 \
>>>         -machine virt \
>>>         -initrd
>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG=
-rpi4-atv/boot/ramdisk.img
>>> \
>>>         -kernel
>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG=
-rpi4-atv/boot/Image
>>> \
>>>         -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>>>         -display sdl,gl=3Don \
>>>         -device usb-ehci \
>>>         -device usb-kbd \
>>>         -device virtio-tablet-pci \
>>>         -usb \
>>>         -serial stdio \
>>>         -drive
>>> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/line=
age-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/lineage-21.0-20240618-UNOF=
FICIAL-KonstaKANG-rpi4-atv.img,format=3Draw,index=3D0,media=3Ddisk
>>> \
>>>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait
>>> rootdelay=3D5 root=3D/dev/vdd1 rw"
>>>
>>> =3D=3D=3D=3D=3D=3D>
>>>
>>> [    2.862352] Run /init as init process
>>> [    3.119264] magiskinit: open /proc/bootconfig failed with 2: No such
>>> file or directory
>>> [    4.741230] init: init first stage started!
>>> [    4.754789] init: Unable to open /lib/modules, skipping module
>>> loading.
>>> [    4.788159] init: Copied ramdisk prop to
>>> /second_stage_resources/system/etc/ramdisk/build.prop
>>> [    4.804110] init: [libfstab] Using Android DT directory
>>> /proc/device-tree/firmware/android/
>>> [    4.811371] init: [libfstab] ReadFstabFromDt(): failed to read fstab
>>> from dt
>>> [    4.825409] init: [libfstab] ReadDefaultFstab(): failed to find
>>> device default fstab
>>> [    4.828176] init: Failed to create FirstStageMount : failed to read
>>> default fstab for first stage mount
>>> [    4.831564] init: FirstStageMount not available
>>> [    4.890952] init: InitFatalReboot: signal 6
>>> [    5.063207] init:   #00 pc 00000000003b7764  /init
>>> (unwindstack::AndroidLocalUnwinder::InternalUnwind(std::__1::optional<i=
nt>,
>>> unwin
>>> dstack::AndroidUnwinderData&)+96) (BuildId:
>>> 48bce72d2f0c6e6c34530a67b6b7b3be)
>>> [    5.064741] init:   #01 pc 00000000003ab4b8  /init
>>> (android::init::InitFatalReboot(int)+204) (BuildId:
>>> 48bce72d2f0c6e6c34530a67b6b7b
>>> 3be)
>>> [    5.066931] init:   #02 pc 00000000003abb48  /init
>>> (android::init::InstallRebootSignalHandlers()::$_0::__invoke(int)+32)
>>> (BuildId: 4
>>> 8bce72d2f0c6e6c34530a67b6b7b3be)
>>> [    5.068545] init:   #03 pc 0000000000000854  [vdso]
>>> [    5.069555] init:   #04 pc 000000000035285c  /init (abort+164)
>>> (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
>>> [    5.072153] init:   #05 pc 00000000003b029c  /init
>>> (android::init::InitAborter(char const*)+44) (BuildId:
>>> 48bce72d2f0c6e6c34530a67b6
>>> b7b3be)
>>> [    5.075216] init:   #06 pc 00000000003131d0  /init
>>> (android::base::SetAborter(std::__1::function<void (char
>>> const*)>&&)::$_0::__invo
>>> ke(char const*)+80) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
>>> [    5.077609] init:   #07 pc 00000000003128f4  /init
>>> (android::base::LogMessage::~LogMessage()+356) (BuildId:
>>> 48bce72d2f0c6e6c34530a67
>>> b6b7b3be)
>>> [    5.079506] init:   #08 pc 00000000003a1ec0  /init
>>> (android::init::FirstStageMain(int, char**)+13140) (BuildId:
>>> 48bce72d2f0c6e6c3453
>>> 0a67b6b7b3be)
>>> [    5.081404] init:   #09 pc 0000000000350e9c  /init
>>> (__real_libc_init(void*, void (*)(), int (*)(int, char**, char**),
>>> structors_arra
>>> y_t const*, bionic_tcb*)+688) (BuildId:
>>> 48bce72d2f0c6e6c34530a67b6b7b3be)
>>> [    5.083648] init: Reboot ending, jumping to kernel
>>> [    5.091556] reboot: Restarting system with command 'bootloader'
>>>
>>>
>>>
>>> On Sun, Aug 25, 2024 at 3:31=E2=80=AFPM Mario Marietto <marietto2008@gm=
ail.com>
>>> wrote:
>>>
>>>> The file below is called config.txt and it's available only if Android
>>>> is installed physically. I don't see it when I unpack the main img fil=
e.
>>>> Probably it is embedded inside the file 0.fat,or 1.img,who knows. Anyw=
ay,Is
>>>> useful to understand what's the name of the initrd file. Actually I tr=
ied
>>>> to use 0.fat,but I think it's wrong. Can you give a look at the file b=
elow
>>>> and tell me if it could be "ramdisk.img" ?
>>>>
>>>> # Kernel
>>>> arm_64bit=3D1
>>>> kernel=3DImage
>>>>
>>>> # Ramdisk
>>>> gpio=3D21=3Dip,pu
>>>> [gpio21=3D1]
>>>> initramfs ramdisk.img followkernel
>>>> [gpio21=3D0]
>>>> initramfs ramdisk-recovery.img followkernel
>>>> [all]
>>>>
>>>> # Audio
>>>> dtparam=3Daudio=3Don
>>>>
>>>> # Audio DAC
>>>> #dtoverlay=3Dallo-boss-dac-pcm512x-audio
>>>> #dtoverlay=3Dallo-piano-dac-pcm512x-audio
>>>> #dtoverlay=3Dallo-piano-dac-plus-pcm512x-audio
>>>> #dtoverlay=3Dhifiberry-dacplus
>>>> #dtoverlay=3Di-sabre-q2m
>>>> #dtoverlay=3Diqaudio-dac
>>>> #dtoverlay=3Djustboom-dac
>>>>
>>>> # Boot device
>>>> dtoverlay=3Dandroid-sdcard
>>>> #dtoverlay=3Dandroid-usb
>>>> #dtoverlay=3Dandroid-nvme
>>>>
>>>> # Camera
>>>> camera_auto_detect=3D1
>>>> start_x=3D1
>>>>
>>>> # CPU
>>>> arm_boost=3D1
>>>> #arm_freq=3D1500
>>>>
>>>> # Display
>>>> disable_overscan=3D1
>>>>
>>>> # Display panel
>>>> [gpio21=3D1]
>>>> #dtoverlay=3Dcutiepi-panel
>>>> #dtoverlay=3Dvc4-kms-dsi-7inch
>>>> #dtoverlay=3Dvc4-kms-dsi-lt070me05000
>>>> #dtoverlay=3Dvc4-kms-dsi-lt070me05000-v2
>>>> [all]
>>>> #dtoverlay=3Drpi-backlight
>>>>
>>>> # Fan
>>>> #dtoverlay=3Dgpio-fan
>>>> #dtoverlay=3Di2c-fan
>>>> #dtoverlay=3Drpi-poe
>>>> #dtoverlay=3Drpi-poe-plus
>>>>
>>>> # Graphics acceleration
>>>> disable_fw_kms_setup=3D1
>>>> [gpio21=3D1]
>>>> dtoverlay=3Dvc4-kms-v3d
>>>> [all]
>>>>
>>>> # I2C
>>>> dtparam=3Di2c_arm=3Don
>>>>
>>>> # I2S
>>>> #dtparam=3Di2s=3Don
>>>>
>>>> # IR
>>>> #dtoverlay=3Dgpio-ir,gpio_pin=3D18
>>>>
>>>> # Keys
>>>> #dtoverlay=3Dgpio-key,gpio=3D21,keycode=3D116,label=3D"POWER"
>>>> #dtoverlay=3Dgpio-key,gpio=3D26,keycode=3D115,label=3D"VOLUME_UP"
>>>> #dtoverlay=3Dgpio-key,gpio=3D20,keycode=3D114,label=3D"VOLUME_DOWN"
>>>>
>>>> # RTC
>>>> dtoverlay=3Di2c-rtc,ds3231
>>>>
>>>> # Sensors
>>>> #dtoverlay=3Dandroid-i2c-sensor,mpu6050
>>>>
>>>> # Serial console
>>>> #enable_uart=3D1
>>>>
>>>> # SPI
>>>> dtparam=3Dspi=3Don
>>>>
>>>> # Touchscreen
>>>>
>>>> #dtoverlay=3Dads7846,cs=3D1,penirq=3D25,penirq_pull=3D2,speed=3D50000,=
keep_vref_on=3D0,swapxy=3D0,pmax=3D255,xohms=3D150,xmin=3D200,xmax=3D3900,y=
min=3D200,ymax=3D3900
>>>> #dtoverlay=3Dedt-ft5406
>>>> #dtoverlay=3Dgoodix
>>>> #dtoverlay=3Drpi-ft5406
>>>>
>>>> # USB
>>>> dtoverlay=3Ddwc2,dr_mode=3Dperipheral
>>>> [cm4]
>>>> dtoverlay=3Ddwc2,dr_mode=3Dotg
>>>> [all]
>>>>
>>>> include config_user.txt
>>>>
>>>> On Sun, Aug 25, 2024 at 2:44=E2=80=AFPM Mario Marietto <marietto2008@g=
mail.com>
>>>> wrote:
>>>>
>>>>> Appending the root device does not change the scenario :
>>>>>
>>>>> qemu-system-aarch64 \
>>>>>         -smp 4 \
>>>>>         -m 2048 \
>>>>>         -cpu cortex-a72 \
>>>>>         -machine virt \
>>>>>         -serial stdio \
>>>>>         -initrd
>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKA=
NG-rpi4-atv/0.fat
>>>>> \
>>>>>         -kernel
>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKA=
NG-rpi4-atv/boot/Image
>>>>> \
>>>>>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait
>>>>> rootdelay=3D5 root=3D/dev/vdd1 rw"
>>>>>
>>>>>
>>>>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083=
]
>>>>> [    0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@build-hos=
t)
>>>>> (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928)
>>>>> clang version 18.0.0 (
>>>>> https://android.googlesource.com/toolchain/llvm-project
>>>>> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #
>>>>> 1 SMP PREEMPT Tue Jul  2 09:02:32 UTC 2024
>>>>> [    0.000000] KASLR enabled
>>>>> [    0.000000] random: crng init done
>>>>> [    0.000000] Machine model: linux,dummy-virt
>>>>> [    0.000000] efi: UEFI not found.
>>>>> [    0.000000] Zone ranges:
>>>>> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff]
>>>>> [    0.000000]   DMA32    empty
>>>>> [    0.000000]   Normal   empty
>>>>> [    0.000000] Movable zone start for each node
>>>>> [    0.000000] NoSplit zone start for each node
>>>>> [    0.000000] NoMerge zone start for each node
>>>>> [    0.000000] Early memory node ranges
>>>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff=
]
>>>>> [    0.000000] Initmem setup node 0 [mem
>>>>> 0x0000000040000000-0x00000000bfffffff]
>>>>> [    0.000000] cma: Reserved 8 MiB at 0x00000000bd000000 on node -1
>>>>> [    0.000000] psci: probing for conduit method from DT.
>>>>> [    0.000000] psci: PSCIv1.1 detected in firmware.
>>>>> [    0.000000] psci: Using standard PSCI v0.2 function IDs
>>>>> [    0.000000] psci: Trusted OS migration not required
>>>>> [    0.000000] psci: SMC Calling Convention v1.0
>>>>> [    0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d31768
>>>>> u126976
>>>>> [    0.000000] Detected PIPT I-cache on CPU0
>>>>> [    0.000000] CPU features: detected: Spectre-v2
>>>>> [    0.000000] CPU features: detected: Spectre-v3a
>>>>> [    0.000000] CPU features: detected: Spectre-v4
>>>>> [    0.000000] CPU features: detected: Spectre-BHB
>>>>> [    0.000000] CPU features: kernel page table isolation forced ON by
>>>>> KASLR
>>>>> [    0.000000] CPU features: detected: Kernel page table isolation
>>>>> (KPTI)
>>>>> [    0.000000] CPU features: detected: ARM erratum 1742098
>>>>> [    0.000000] CPU features: detected: ARM errata 1165522, 1319367, o=
r
>>>>> 1530923
>>>>> [    0.000000] alternatives: applying boot alternatives
>>>>> [    0.000000] Kernel command line: console=3DttyAMA0,38400
>>>>> drm.debug=3D0x0 rootwait rootdelay=3D5 root=3D/dev/vdd1 rw
>>>>> androidboot.serialno=3D100
>>>>> 00000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66
>>>>> [    0.000000] Dentry cache hash table entries: 262144 (order: 9,
>>>>> 2097152 bytes, linear)
>>>>> [    0.000000] Inode-cache hash table entries: 131072 (order: 8,
>>>>> 1048576 bytes, linear)
>>>>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
>>>>> 516096
>>>>> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap
>>>>> free:off
>>>>> [    0.000000] Memory: 1881596K/2097152K available (19328K kernel
>>>>> code, 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 207364K rese
>>>>> rved, 8192K cma-reserved)
>>>>> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=
=3D4,
>>>>> Nodes=3D1
>>>>> [    0.000000] ftrace: allocating 56269 entries in 220 pages
>>>>> [    0.000000] ftrace: allocated 220 pages with 5 groups
>>>>> [    0.000000] trace event string verifier disabled
>>>>> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>>>>> [    0.000000] rcu:     RCU event tracing is enabled.
>>>>> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to
>>>>> nr_cpu_ids=3D4.
>>>>> [    0.000000]  Trampoline variant of Tasks RCU enabled.
>>>>> [    0.000000]  Rude variant of Tasks RCU enabled.
>>>>> [    0.000000]  Tracing variant of Tasks RCU enabled.
>>>>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment dela=
y
>>>>> is 25 jiffies.
>>>>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
>>>>> nr_cpu_ids=3D4
>>>>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>>>>> [    0.000000] Root IRQ handler: gic_handle_irq
>>>>> [    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
>>>>> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
>>>>> contention.
>>>>> [    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
>>>>> [    0.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff
>>>>> max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
>>>>> [    0.000069] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps
>>>>> every 4398046511096ns
>>>>> [    0.003628] kfence: initialized - using 2097152 bytes for 255
>>>>> objects at 0x(____ptrval____)-0x(____ptrval____)
>>>>> [    0.010906] Calibrating delay loop (skipped), value calculated
>>>>> using timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
>>>>> [    0.011082] pid_max: default: 32768 minimum: 301
>>>>> [    0.013020] LSM: initializing lsm=3Dcapability,selinux,integrity
>>>>> [    0.013436] SELinux:  Initializing.
>>>>> [    0.016921] Mount-cache hash table entries: 4096 (order: 3, 32768
>>>>> bytes, linear)
>>>>> [    0.016984] Mountpoint-cache hash table entries: 4096 (order: 3,
>>>>> 32768 bytes, linear)
>>>>> [    0.031469] cgroup: Disabling memory control group subsystem
>>>>> [    0.050059] cacheinfo: Unable to detect cache hierarchy for CPU 0
>>>>> [    0.059978] RCU Tasks: Setting shift to 2 and lim to 1
>>>>> rcu_task_cb_adjust=3D1.
>>>>> [    0.060584] RCU Tasks Rude: Setting shift to 2 and lim to 1
>>>>> rcu_task_cb_adjust=3D1.
>>>>> [    0.060822] RCU Tasks Trace: Setting shift to 2 and lim to 1
>>>>> rcu_task_cb_adjust=3D1.
>>>>> [    0.062427] rcu: Hierarchical SRCU implementation.
>>>>> [    0.062463] rcu:     Max phase no-delay instances is 1000.
>>>>> [    0.068568] EFI services will not be available.
>>>>> [    0.071086] smp: Bringing up secondary CPUs ...
>>>>> [    0.074801] Detected PIPT I-cache on CPU1
>>>>> [    0.075909] CPU1: Booted secondary processor 0x0000000001
>>>>> [0x410fd083]
>>>>> [    0.081065] Detected PIPT I-cache on CPU2
>>>>> [    0.081470] CPU2: Booted secondary processor 0x0000000002
>>>>> [0x410fd083]
>>>>> [    0.083873] Detected PIPT I-cache on CPU3
>>>>> [    0.084168] CPU3: Booted secondary processor 0x0000000003
>>>>> [0x410fd083]
>>>>> [    0.084681] smp: Brought up 1 node, 4 CPUs
>>>>> [    0.084715] SMP: Total of 4 processors activated.
>>>>> [    0.084800] CPU features: detected: 32-bit EL0 Support
>>>>> [    0.084824] CPU features: detected: 32-bit EL1 Support
>>>>> [    0.084885] CPU features: detected: CRC32 instructions
>>>>> [    0.088191] CPU features: emulated: Privileged Access Never (PAN)
>>>>> using TTBR0_EL1 switching
>>>>> [    0.088512] CPU: All CPU(s) started at EL1
>>>>> [    0.088714] alternatives: applying system-wide alternatives
>>>>> [    0.113756] devtmpfs: initialized
>>>>> [    0.126262] Enabled cp15_barrier support
>>>>> [    0.126449] Enabled setend support
>>>>> [    0.127708] clocksource: jiffies: mask: 0xffffffff max_cycles:
>>>>> 0xffffffff, max_idle_ns: 7645041785100000 ns
>>>>> [    0.127840] futex hash table entries: 1024 (order: 4, 65536 bytes,
>>>>> linear)
>>>>> [    0.131302] pinctrl core: initialized pinctrl subsystem
>>>>> [    0.138216] DMI not present or invalid.
>>>>> [    0.147664] NET: Registered PF_NETLINK/PF_ROUTE protocol family
>>>>> [    0.158502] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
>>>>> allocations
>>>>> [    0.158987] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for
>>>>> atomic allocations
>>>>> [    0.159303] audit: initializing netlink subsys (disabled)
>>>>> [    0.161302] audit: type=3D2000 audit(0.148:1): state=3Dinitialized
>>>>> audit_enabled=3D0 res=3D1
>>>>> [    0.164412] thermal_sys: Registered thermal governor 'step_wise'
>>>>> [    0.164806] cpuidle: using governor menu
>>>>> [    0.165816] hw-breakpoint: found 6 breakpoint and 4 watchpoint
>>>>> registers.
>>>>> [    0.166975] ASID allocator initialised with 32768 entries
>>>>> [    0.168385] Serial: AMBA PL011 UART driver
>>>>> [    0.196712] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13,
>>>>> base_baud =3D 0) is a PL011 rev1
>>>>> [    0.198278] printk: console [ttyAMA0] enabled
>>>>> [    0.224278] Modules: 2G module region forced by
>>>>> RANDOMIZE_MODULE_REGION_FULL
>>>>> [    0.224486] Modules: 0 pages in range for non-PLT usage
>>>>> [    0.224510] Modules: 516176 pages in range for PLT usage
>>>>> [    0.241442] iommu: Default domain type: Translated
>>>>> [    0.241679] iommu: DMA domain TLB invalidation policy: strict mode
>>>>> [    0.244200] SCSI subsystem initialized
>>>>> [    0.245459] usbcore: registered new interface driver usbfs
>>>>> [    0.245841] usbcore: registered new interface driver hub
>>>>> [    0.246154] usbcore: registered new device driver usb
>>>>> [    0.247257] mc: Linux media interface: v0.10
>>>>> [    0.247617] videodev: Linux video capture interface: v2.00
>>>>> [    0.248602] pps_core: LinuxPPS API ver. 1 registered
>>>>> [    0.248700] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
>>>>> Rodolfo Giometti <giometti@linux.it>
>>>>> [    0.248967] PTP clock support registered
>>>>> [    0.251884] Advanced Linux Sound Architecture Driver Initialized.
>>>>> [    0.262663] Bluetooth: Core ver 2.22
>>>>> [    0.262960] NET: Registered PF_BLUETOOTH protocol family
>>>>> [    0.263069] Bluetooth: HCI device and connection manager
>>>>> initialized
>>>>> [    0.263344] Bluetooth: HCI socket layer initialized
>>>>> [    0.263516] Bluetooth: L2CAP socket layer initialized
>>>>> [    0.263840] Bluetooth: SCO socket layer initialized
>>>>> [    0.266790] vgaarb: loaded
>>>>> [    0.268841] clocksource: Switched to clocksource arch_sys_counter
>>>>> [    0.272056] VFS: Disk quotas dquot_6.6.0
>>>>> [    0.272284] VFS: Dquot-cache hash table entries: 512 (order 0, 409=
6
>>>>> bytes)
>>>>> [    0.273060] FS-Cache: Loaded
>>>>> [    0.278526] CacheFiles: Loaded
>>>>> [    0.287007] NET: Registered PF_INET protocol family
>>>>> [    0.288390] IP idents hash table entries: 32768 (order: 6, 262144
>>>>> bytes, linear)
>>>>> [    0.297021] tcp_listen_portaddr_hash hash table entries: 1024
>>>>> (order: 2, 16384 bytes, linear)
>>>>> [    0.297273] Table-perturb hash table entries: 65536 (order: 6,
>>>>> 262144 bytes, linear)
>>>>> [    0.297485] TCP established hash table entries: 16384 (order: 5,
>>>>> 131072 bytes, linear)
>>>>> [    0.298036] TCP bind hash table entries: 16384 (order: 7, 524288
>>>>> bytes, linear)
>>>>> [    0.298873] TCP: Hash tables configured (established 16384 bind
>>>>> 16384)
>>>>> [    0.301283] MPTCP token hash table entries: 2048 (order: 3, 49152
>>>>> bytes, linear)
>>>>> [    0.301759] UDP hash table entries: 1024 (order: 3, 32768 bytes,
>>>>> linear)
>>>>> [    0.302186] UDP-Lite hash table entries: 1024 (order: 3, 32768
>>>>> bytes, linear)
>>>>> [    0.304009] NET: Registered PF_UNIX/PF_LOCAL protocol family
>>>>> [    0.306868] PCI: CLS 0 bytes, default 64
>>>>> [    0.312145] Trying to unpack rootfs image as initramfs...
>>>>> [    0.312808] kvm [1]: HYP mode not available
>>>>> [    0.318856] rootfs image is not initramfs (invalid magic at start
>>>>> of compressed archive); looks like an initrd
>>>>> [    0.335544] Initialise system trusted keyrings
>>>>> [    0.338430] workingset: timestamp_bits=3D46 max_order=3D19
>>>>> bucket_order=3D0
>>>>> [    0.339134] zbud: loaded
>>>>> [    0.347742] Key type cifs.idmap registered
>>>>> [    0.348673] fuse: init (API version 7.39)
>>>>> [    0.386722] Key type asymmetric registered
>>>>> [    0.386992] Asymmetric key parser 'x509' registered
>>>>> [    0.387460] Block layer SCSI generic (bsg) driver version 0.4
>>>>> loaded (major 244)
>>>>> [    0.388796] io scheduler mq-deadline registered
>>>>> [    0.388954] io scheduler kyber registered
>>>>> [    0.389319] io scheduler bfq registered
>>>>> [    0.406358] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000
>>>>> mem_size:0x00000000(0 MiB)
>>>>> [    0.476330] brd: module loaded
>>>>> [    0.508286] loop: module loaded
>>>>> [    0.512092] Loading iSCSI transport class v2.0-870.
>>>>> [    0.522449] wireguard: WireGuard 1.0.0 loaded. See
>>>>> www.wireguard.com for information.
>>>>> [    0.522729] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld =
<
>>>>> Jason@zx2c4.com>. All Rights Reserved.
>>>>> [    0.538429] tun: Universal TUN/TAP device driver, 1.6
>>>>> [    0.541953] usbcore: registered new interface driver brcmfmac
>>>>> [    0.542290] usbcore: registered new device driver r8152-cfgselecto=
r
>>>>> [    0.542675] usbcore: registered new interface driver r8152
>>>>> [    0.542971] usbcore: registered new interface driver lan78xx
>>>>> [    0.543488] usbcore: registered new interface driver asix
>>>>> [    0.543810] usbcore: registered new interface driver ax88179_178a
>>>>> [    0.544134] usbcore: registered new interface driver cdc_ether
>>>>> [    0.544609] usbcore: registered new interface driver smsc95xx
>>>>> [    0.544909] usbcore: registered new interface driver net1080
>>>>> [    0.545240] usbcore: registered new interface driver cdc_subset
>>>>> [    0.545596] usbcore: registered new interface driver zaurus
>>>>> [    0.545896] usbcore: registered new interface driver cdc_ncm
>>>>> [    0.546192] usbcore: registered new interface driver r8153_ecm
>>>>> [    0.547442] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
>>>>> [    0.550591] usbcore: registered new interface driver cdc_acm
>>>>> [    0.550756] cdc_acm: USB Abstract Control Model driver for USB
>>>>> modems and ISDN adapters
>>>>> [    0.551948] usbcore: registered new interface driver uas
>>>>> [    0.552352] usbcore: registered new interface driver usb-storage
>>>>> [    0.566050] usbcore: registered new interface driver cp210x
>>>>> [    0.566791] usbserial: USB Serial support registered for cp210x
>>>>> [    0.567318] usbcore: registered new interface driver pl2303
>>>>> [    0.567653] usbserial: USB Serial support registered for pl2303
>>>>> [    0.573531] mousedev: PS/2 mouse device common for all mice
>>>>> [    0.573930] usbcore: registered new interface driver xpad
>>>>> [    0.574228] usbcore: registered new interface driver usb_acecad
>>>>> [    0.574588] usbcore: registered new interface driver aiptek
>>>>> [    0.574937] usbcore: registered new interface driver hanwang
>>>>> [    0.575292] usbcore: registered new interface driver kbtab
>>>>> [    0.577388] usbcore: registered new interface driver usbtouchscree=
n
>>>>> [    0.580179] i2c_dev: i2c /dev entries driver
>>>>> [    0.584010] ir_imon_decoder: IR iMON protocol handler initialized
>>>>> [    0.584179] IR JVC protocol handler initialized
>>>>> [    0.584296] IR MCE Keyboard/mouse protocol handler initialized
>>>>> [    0.584435] IR NEC protocol handler initialized
>>>>> [    0.584734] IR RC5(x/sz) protocol handler initialized
>>>>> [    0.584863] IR RC6 protocol handler initialized
>>>>> [    0.584991] IR RCMM protocol handler initialized
>>>>> [    0.585111] IR SANYO protocol handler initialized
>>>>> [    0.585226] IR Sharp protocol handler initialized
>>>>> [    0.585358] IR Sony protocol handler initialized
>>>>> [    0.585477] IR XMP protocol handler initialized
>>>>> [    0.586421] usbcore: registered new interface driver uvcvideo
>>>>> [    0.589015] device-mapper: uevent: version 1.0.3
>>>>> [    0.590448] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01)
>>>>> initialised: dm-devel@redhat.com
>>>>> [    0.591924] Bluetooth: HCI UART driver ver 2.3
>>>>> [    0.592106] Bluetooth: HCI UART protocol H4 registered
>>>>> [    0.592885] Bluetooth: HCI UART protocol Broadcom registered
>>>>> [    0.594293] sdhci: Secure Digital Host Controller Interface driver
>>>>> [    0.594442] sdhci: Copyright(c) Pierre Ossman
>>>>> [    0.594948] sdhci-pltfm: SDHCI platform and OF driver helper
>>>>> [    0.596987] ledtrig-cpu: registered to indicate activity on CPUs
>>>>> [    0.599350] hid: raw HID events driver (C) Jiri Kosina
>>>>> [    0.612270] usbcore: registered new interface driver usbhid
>>>>> [    0.612441] usbhid: USB HID core driver
>>>>> [    0.615743] ashmem: initialized
>>>>> [    0.617297] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lis302dl-spi
>>>>> [    0.617473] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lis3lv02dl-accel
>>>>> [    0.617626] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lis3dh-accel
>>>>> [    0.617769] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lsm330d-accel
>>>>> [    0.617919] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lsm330dl-accel
>>>>> [    0.618062] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lsm330dlc-accel
>>>>> [    0.618206] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lis331dlh-accel
>>>>> [    0.618357] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lsm330-accel
>>>>> [    0.618493] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lsm303agr-accel
>>>>> [    0.618638] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lis2dh12-accel
>>>>> [    0.618775] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lng2dm-accel
>>>>> [    0.618911] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,h3lis331dl-accel
>>>>> [    0.619056] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lis331dl-accel
>>>>> [    0.619209] SPI driver st-accel-spi has no spi_device_id for
>>>>> st,lsm303c-accel
>>>>> [    0.620207] SPI driver st-magn-spi has no spi_device_id for
>>>>> st,lis3mdl-magn
>>>>> [    0.620355] SPI driver st-magn-spi has no spi_device_id for
>>>>> st,lsm303agr-magn
>>>>> [    0.620510] SPI driver st-magn-spi has no spi_device_id for
>>>>> st,lsm9ds1-magn
>>>>> [    0.620768] SPI driver st-magn-spi has no spi_device_id for
>>>>> st,lsm303c-magn
>>>>> [    0.626130] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
>>>>> counters available
>>>>> [    0.630320] usbcore: registered new interface driver snd-usb-audio
>>>>> [    0.638439] Mirror/redirect action on
>>>>> [    0.639343] netem: version 1.3
>>>>> [    0.639435] u32 classifier
>>>>> [    0.639508]     input device check on
>>>>> [    0.639602]     Actions configured
>>>>> [    0.648469] xt_time: kernel timezone is -0000
>>>>> [    0.649096] gre: GRE over IPv4 demultiplexor driver
>>>>> [    0.649255] IPv4 over IPsec tunneling driver
>>>>> [    0.654843] Initializing XFRM netlink socket
>>>>> [    0.655213] IPsec XFRM device driver
>>>>> [    0.676037] NET: Registered PF_INET6 protocol family
>>>>> [    0.687646] Segment Routing with IPv6
>>>>> [    0.687964] In-situ OAM (IOAM) with IPv6
>>>>> [    0.689074] mip6: Mobile IPv6
>>>>> [    0.693823] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
>>>>> [    0.699298] NET: Registered PF_PACKET protocol family
>>>>> [    0.699567] NET: Registered PF_KEY protocol family
>>>>> [    0.699819] Key type dns_resolver registered
>>>>> [    0.798005] Freeing initrd memory: 131072K
>>>>> [    0.806166] registered taskstats version 1
>>>>> [    0.807819] Loading compiled-in X.509 certificates
>>>>> [    0.834497] Key type .fscrypt registered
>>>>> [    0.834641] Key type fscrypt-provisioning registered
>>>>> [    0.841634] of_cfs_init
>>>>> [    0.842079] of_cfs_init: OK
>>>>> [    0.845830] cfg80211: Loading compiled-in X.509 certificates for
>>>>> regulatory database
>>>>> [    0.876283] Loaded X.509 cert 'benh@debian.org:
>>>>> 577e021cb980e0e820821ba7b54b4961b8b4fadf'
>>>>> [    0.877632] Loaded X.509 cert 'romain.perier@gmail.com:
>>>>> 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
>>>>> [    0.878441] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>>>>> [    0.879187] Loaded X.509 cert 'wens:
>>>>> 61c038651aabdcf94bd0ac7ff06c7248db18c600'
>>>>> [    0.885017] clk: Disabling unused clocks
>>>>> [    0.885499] ALSA device list:
>>>>> [    0.885646]   No soundcards found.
>>>>> [    0.894059] uart-pl011 9000000.pl011: no DMA platform data
>>>>> [    0.895672] Waiting 5 sec before mounting root device...
>>>>> [    6.132758] RAMDISK: Couldn't find valid RAM disk image starting a=
t
>>>>> 0.
>>>>> [    6.133865] Waiting for root device /dev/vdd1...
>>>>> [   10.994096] platform gpio-keys: deferred probe pending
>>>>>
>>>>>
>>>>>
>>>>> On Sun, Aug 25, 2024 at 2:30=E2=80=AFPM Mario Marietto <marietto2008@=
gmail.com>
>>>>> wrote:
>>>>>
>>>>>> When I unpack this file :
>>>>>>
>>>>>> lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv.img
>>>>>>
>>>>>> I get these files :
>>>>>>
>>>>>> 0.fat
>>>>>> 1.img
>>>>>> 2.img
>>>>>> 3.img
>>>>>>
>>>>>> So,I assume that :
>>>>>>
>>>>>> 0.fat is : initrd
>>>>>> 1.img is : system-rw.img
>>>>>> 2.img is   :  vendor-rw.img
>>>>>> 3.img is   :  userdata.img
>>>>>>
>>>>>> If I use 0.fat as initrd,like this :
>>>>>>
>>>>>> -initrd
>>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaK=
ANG-rpi4-atv/0.fat
>>>>>>
>>>>>> I get this message :
>>>>>>
>>>>>> rootfs image is not initramfs (invalid magic at start of compressed
>>>>>> archive); looks like an initrd
>>>>>>
>>>>>> it looks like an initrd : right,it's true : it is initrd. (for this
>>>>>> reason I've assumed that 0.fat is initrd...
>>>>>>
>>>>>>
>>>>>> On Sun, Aug 25, 2024 at 1:26=E2=80=AFPM Peter Maydell <
>>>>>> peter.maydell@linaro.org> wrote:
>>>>>>
>>>>>>> On Sun, 25 Aug 2024 at 11:45, Mario Marietto <marietto2008@gmail.co=
m>
>>>>>>> wrote:
>>>>>>> >
>>>>>>> > Please look at this example :
>>>>>>> >
>>>>>>> > qemu-system-aarch64 \
>>>>>>> > -smp 4 \
>>>>>>> > -m 2048 \
>>>>>>> > -cpu cortex-a72 \
>>>>>>> > -machine virt \
>>>>>>> > -serial stdio \
>>>>>>> > -kernel
>>>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Konsta=
KANG-rpi4-atv/boot/Image
>>>>>>> \
>>>>>>>
>>>>>>> This (assuming it's the complete command line your script is
>>>>>>> running) doesn't pass any arguments telling QEMU to provide a
>>>>>>> root disk, and it doesn't pass any arguments to the kernel
>>>>>>> telling it what root disk to use...
>>>>>>>
>>>>>>> > [    0.000000] Kernel command line: console=3DttyAMA0,115200
>>>>>>> kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 roo=
twait
>>>>>>> androidboot.serialno=3D10000000abcd1234
>>>>>>> androidboot.btmacaddr=3D11:22:33:44:55:66
>>>>>>>
>>>>>>> ...so the kernel defaults to "/dev/mmcblk0p2" as its root disk
>>>>>>> because
>>>>>>> it's using the command line argument that was compiled into it...
>>>>>>>
>>>>>>> > [    0.658240] Waiting for root device /dev/mmcblk0p2...
>>>>>>>
>>>>>>> ...and then it's hanging around forever waiting for that.
>>>>>>>
>>>>>>> You need to:
>>>>>>>  (1) pass QEMU arguments telling it to provide a root fs
>>>>>>>  (2) pass the kernel arguments telling it to look for the
>>>>>>>      root fs in the place where QEMU is providing it
>>>>>>>
>>>>>>> Your other command line looks more on the right lines:
>>>>>>>
>>>>>>>         -kernel
>>>>>>>
>>>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Konsta=
KANG-rpi4-atv/boot/Image
>>>>>>> \
>>>>>>>         -initrd
>>>>>>>
>>>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Konsta=
KANG-rpi4-atv/0.fat
>>>>>>> \
>>>>>>>         -drive
>>>>>>> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/=
lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/1.img
>>>>>>> \
>>>>>>>         -device virtio-blk-pci,drive=3Dsystem \
>>>>>>>         -drive
>>>>>>> index=3D1,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot2/zroot2/OS/Linux/=
lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/2.img
>>>>>>> \
>>>>>>>         -device virtio-blk-pci,drive=3Dvendor \
>>>>>>>         -drive
>>>>>>> index=3D2,if=3Dnone,id=3Duserdata,file=3D/mnt/zroot2/zroot2/OS/Linu=
x/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/3.img
>>>>>>> \
>>>>>>>         -device virtio-blk-pci,drive=3Duserdata \
>>>>>>>
>>>>>>> though I wonder if the kernel really expects a
>>>>>>> FAT file for the initrd, given it complains:
>>>>>>>
>>>>>>> [    0.344033] Trying to unpack rootfs image as initramfs...
>>>>>>> [    0.344947] rootfs image is not initramfs (invalid magic at star=
t
>>>>>>> of compressed archive); looks like an initrd
>>>>>>>
>>>>>>> and then later
>>>>>>>
>>>>>>> [    5.905329] RAMDISK: Couldn't find valid RAM disk image starting
>>>>>>> at 0.
>>>>>>>
>>>>>>> I think if I were you I'd start by figuring out what's going on
>>>>>>> with the initrd.
>>>>>>>
>>>>>>> thanks
>>>>>>> -- PMM
>>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Mario.
>>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> Mario.
>>>>>
>>>>
>>>>
>>>> --
>>>> Mario.
>>>>
>>>
>>>
>>> --
>>> Mario.
>>>
>>
>>
>> --
>> Mario.
>>
>
>
> --
> Mario.
>


--=20
Mario.

--000000000000e5b04e0620d507db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t understand what&#39;s the reason why it b=
oots indefinitely :<br></div><div><br></div><div>qemu-system-aarch64 \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048=
 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a72 \<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -M virt \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-gpu-pci,xre=
s=3D1024,yres=3D768 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -display sdl,gl=3Don \=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -device usb-kbd \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-tabl=
et-pci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -serial stdio \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mnt/zroot2/zroo=
t2/OS/Android/antmicro/img/Image \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd /=
mnt/zroot2/zroot2/OS/Android/antmicro/img/ramdisk.img \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -drive index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zro=
ot2/OS/Android/antmicro/img/system-rw.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
-device virtio-blk-pci,drive=3Dsystem \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -dri=
ve index=3D1,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot2/zroot2/OS/Android/ant=
micro/img/vendor-rw.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk=
-pci,drive=3Dvendor \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D2,if=3D=
none,id=3Duserdata,file=3D/mnt/zroot2/zroot2/OS/Android/antmicro/img/userda=
ta.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Duser=
data \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -append &quot;console=3DttyAMA0,38400=
 drm.debug=3D0x0 rootwait rootdelay=3D5 androidboot.hardware=3Dranchu andro=
idboot.selinux=3Dpermissive security=3Dselinux selinux=3D1 androidboot.qemu=
.hw.mainkeys=3D0 androidboot.lcd.density=3D160&quot;</div><div><br></div><d=
iv>LOG :</div><div><br></div><div><span style=3D"font-family:monospace"><sp=
an style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">[ =C2=A0=C2=
=A0=C2=A00.000000] Booting Linux on physical CPU 0x0
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">[ =C2=A0=C2=A0=C2=A00.000000] Linux =
version 4.14.307-01062-gef7460eabd6d (build-user@build-host) (Android (5900=
059 based on r365631c) clang version 9.<br>0.8 (<a href=3D"https://android.=
googlesource.com/toolchain/llvm-project">https://android.googlesource.com/t=
oolchain/llvm-project</a> 207d7abc1a2abf3ef8d4301736d6a7ebc224a290) (based =
on LLVM 9.0.8svn)) #1 SMP<br> PREEMPT Sat Feb 25 15:33:28 UTC 2023
<br>[ =C2=A0=C2=A0=C2=A00.000000] Boot CPU: AArch64 Processor [410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.000000] random: crng init done
<br>[ =C2=A0=C2=A0=C2=A00.000000] Machine model: linux,dummy-virt
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: Getting EFI parameters from FDT:
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: UEFI not found.
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: probing for conduit method from DT.
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: PSCIv1.1 detected in firmware.
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: Using standard PSCI v0.2 function I=
Ds
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: Trusted OS migration not required
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: SMC Calling Convention v1.0
<br>[ =C2=A0=C2=A0=C2=A00.000000] percpu: Embedded 21 pages/cpu s48664 r819=
2 d29160 u86016
<br>[ =C2=A0=C2=A0=C2=A00.000000] Detected PIPT I-cache on CPU0
<br>[ =C2=A0=C2=A0=C2=A00.000000] ARM_SMCCC_ARCH_WORKAROUND_1 missing from =
firmware
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: enabling workaround for Spe=
ctre-BHB
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: enabling workaround for ARM=
 erratum 1742098
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: kernel page table isolation=
 forced ON by KASLR
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Kernel page table=
 isolation (KPTI)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Built 1 zonelists, mobility grouping on.=
=C2=A0 Total pages: 516096
<br>[ =C2=A0=C2=A0=C2=A00.000000] Kernel command line: console=3DttyAMA0,38=
400 drm.debug=3D0x0 rootwait rootdelay=3D5 androidboot.hardware=3Dranchu <a=
 href=3D"http://androidboot.se">androidboot.se</a><br>linux=3Dpermissive se=
curity=3Dselinux selinux=3D1 androidboot.qemu.hw.mainkeys=3D0 androidboot.l=
cd.density=3D160
<br>[ =C2=A0=C2=A0=C2=A00.000000] PID hash table entries: 4096 (order: 3, 3=
2768 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Dentry cache hash table entries: 262144 (=
order: 9, 2097152 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Inode-cache hash table entries: 131072 (o=
rder: 8, 1048576 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Memory: 2042152K/2097152K available (9532=
K kernel code, 1172K rwdata, 2888K rodata, 2752K init, 462K bss, 55000K res=
erved, 0K cma-reserved)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Virtual kernel memory layout:
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0modules : 0xfffff=
f8000000000 - 0xffffff8008000000 =C2=A0=C2=A0( =C2=A0=C2=A0128 MB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0vmalloc : 0xfffff=
f8008000000 - 0xffffffbebfff0000 =C2=A0=C2=A0( =C2=A0=C2=A0250 GB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.text=
 : 0x =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ptrval) - 0x =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ptrval) =C2=A0=C2=A0( =C2=A09536 KB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0.rodata : 0x =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ptrval) - 0x =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0(ptrval) =C2=A0=C2=A0( =C2=A02944 KB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.init=
 : 0x =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ptrval) - 0x =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ptrval) =C2=A0=C2=A0( =C2=A02752 KB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.data=
 : 0x =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ptrval) - 0x =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ptrval) =C2=A0=C2=A0( =C2=A01173 KB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0.bss : 0x =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ptrval) - 0x =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(ptrval) =C2=A0=C2=A0( =C2=A0=C2=A0463 =
KB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0fixed =C2=A0=C2=
=A0: 0xffffffbefe7f9000 - 0xffffffbefec00000 =C2=A0=C2=A0( =C2=A04124 KB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0PCI I/O : 0xfffff=
fbefee00000 - 0xffffffbeffe00000 =C2=A0=C2=A0( =C2=A0=C2=A0=C2=A016 MB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0=C2=A0=C2=A0memory =C2=A0: 0x=
ffffffeb40000000 - 0xffffffebc0000000 =C2=A0=C2=A0( =C2=A02048 MB)
<br>[ =C2=A0=C2=A0=C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D4, Nodes=3D1
<br>[ =C2=A0=C2=A0=C2=A00.000000] Preemptible hierarchical RCU implementati=
on.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0RCU restricting CPUs from NR_CPUS=
=3D64 to nr_cpu_ids=3D4.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Tasks RCU enabled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] RCU: Adjusting geometry for rcu_fanout_le=
af=3D16, nr_cpu_ids=3D4
<br>[ =C2=A0=C2=A0=C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated ir=
qs: 0
<br>[ =C2=A0=C2=A0=C2=A00.000000] GICv2m: range[mem 0x08020000-0x08020fff],=
 SPI[80:143]
<br>[ =C2=A0=C2=A0=C2=A00.000000] arch_timer: cp15 timer(s) running at 62.5=
0MHz (virt).
<br>[ =C2=A0=C2=A0=C2=A00.000000] clocksource: arch_sys_counter: mask: 0xff=
ffffffffffff max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
<br>[ =C2=A0=C2=A0=C2=A00.000127] sched_clock: 56 bits at 62MHz, resolution=
 16ns, wraps every 4398046511096ns
<br>[ =C2=A0=C2=A0=C2=A00.003660] Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 125.00 BogoMIPS (lpj=3D625000)
<br>[ =C2=A0=C2=A0=C2=A00.003790] pid_max: default: 32768 minimum: 301
<br>[ =C2=A0=C2=A0=C2=A00.004630] Security Framework initialized
<br>[ =C2=A0=C2=A0=C2=A00.004762] SELinux: =C2=A0Initializing.
<br>[ =C2=A0=C2=A0=C2=A00.005446] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.005495] Mountpoint-cache hash table entries: 4096=
 (order: 3, 32768 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.030966] /cpus/cpu-map: empty cluster
<br>[ =C2=A0=C2=A0=C2=A00.073499] ASID allocator initialised with 32768 ent=
ries
<br>[ =C2=A0=C2=A0=C2=A00.101242] Hierarchical SRCU implementation.
<br>[ =C2=A0=C2=A0=C2=A00.125115] EFI services will not be available.
<br>[ =C2=A0=C2=A0=C2=A00.178497] smp: Bringing up secondary CPUs ...
<br>[ =C2=A0=C2=A0=C2=A00.245215] Detected PIPT I-cache on CPU1
<br>[ =C2=A0=C2=A0=C2=A00.248497] CPU1: Booted secondary processor [410fd08=
3]
<br>[ =C2=A0=C2=A0=C2=A00.333392] Detected PIPT I-cache on CPU2
<br>[ =C2=A0=C2=A0=C2=A00.334213] CPU2: Booted secondary processor [410fd08=
3]
<br>[ =C2=A0=C2=A0=C2=A00.427085] Detected PIPT I-cache on CPU3
<br>[ =C2=A0=C2=A0=C2=A00.427978] CPU3: Booted secondary processor [410fd08=
3]
<br>[ =C2=A0=C2=A0=C2=A00.430197] smp: Brought up 1 node, 4 CPUs
<br>[ =C2=A0=C2=A0=C2=A00.430599] SMP: Total of 4 processors activated.
<br>[ =C2=A0=C2=A0=C2=A00.431315] CPU features: detected: 32-bit EL0 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.608649] CPU: All CPU(s) started at EL1
<br>[ =C2=A0=C2=A0=C2=A00.609043] alternatives: patching kernel code
<br>[ =C2=A0=C2=A0=C2=A00.611038] CPU3: update max cpu_capacity 1024
<br>[ =C2=A0=C2=A0=C2=A00.621760] CPU3: update max cpu_capacity 1024
<br>[ =C2=A0=C2=A0=C2=A00.635915] Registered cp15_barrier emulation handler
<br>[ =C2=A0=C2=A0=C2=A00.636078] Registered setend emulation handler
<br>[ =C2=A0=C2=A0=C2=A00.637130] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
<br>[ =C2=A0=C2=A0=C2=A00.637235] futex hash table entries: 1024 (order: 5,=
 131072 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.640203] DMI not present or invalid.
<br>[ =C2=A0=C2=A0=C2=A00.642376] NET: Registered protocol family 16
<br>[ =C2=A0=C2=A0=C2=A00.644952] schedtune: configured to support 5 boost =
groups
<br>[ =C2=A0=C2=A0=C2=A00.649619] cpuidle: using governor menu
<br>[ =C2=A0=C2=A0=C2=A00.650232] hw-breakpoint: found 6 breakpoint and 4 w=
atchpoint registers.
<br>[ =C2=A0=C2=A0=C2=A00.651821] DMA: preallocated 256 KiB pool for atomic=
 allocations
<br>[ =C2=A0=C2=A0=C2=A00.651864] Serial: AMBA PL011 UART driver
<br>[ =C2=A0=C2=A0=C2=A00.670674] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 =
(irq =3D 39, base_baud =3D 0) is a PL011 rev1
<br>[ =C2=A0=C2=A0=C2=A00.681834] console [ttyAMA0] enabled
<br>[ =C2=A0=C2=A0=C2=A00.707955] SCSI subsystem initialized
<br>[ =C2=A0=C2=A0=C2=A00.708859] usbcore: registered new interface driver =
usbfs
<br>[ =C2=A0=C2=A0=C2=A00.709195] usbcore: registered new interface driver =
hub
<br>[ =C2=A0=C2=A0=C2=A00.709442] usbcore: registered new device driver usb
<br>[ =C2=A0=C2=A0=C2=A00.710559] dmi: Firmware registration failed.
<br>[ =C2=A0=C2=A0=C2=A00.711835] Advanced Linux Sound Architecture Driver =
Initialized.
<br>[ =C2=A0=C2=A0=C2=A00.721653] clocksource: Switched to clocksource arch=
_sys_counter
<br>[ =C2=A0=C2=A0=C2=A00.897715] VFS: Disk quotas dquot_6.6.0
<br>[ =C2=A0=C2=A0=C2=A00.898127] VFS: Dquot-cache hash table entries: 512 =
(order 0, 4096 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.901164] NET: Registered protocol family 2
<br>[ =C2=A0=C2=A0=C2=A00.902709] IP idents hash table entries: 32768 (orde=
r: 6, 262144 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.907955] TCP established hash table entries: 16384=
 (order: 5, 131072 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.908458] TCP bind hash table entries: 16384 (order=
: 6, 262144 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.908976] TCP: Hash tables configured (established =
16384 bind 16384)
<br>[ =C2=A0=C2=A0=C2=A00.910135] UDP hash table entries: 1024 (order: 3, 3=
2768 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.910515] UDP-Lite hash table entries: 1024 (order:=
 3, 32768 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.912044] NET: Registered protocol family 1
<br>[ =C2=A0=C2=A0=C2=A00.919449] Trying to unpack rootfs image as initramf=
s...
<br>[ =C2=A0=C2=A0=C2=A00.997353] Freeing initrd memory: 772K
<br>[ =C2=A0=C2=A0=C2=A01.001719] hw perfevents: enabled with armv8_pmuv3 P=
MU driver, 7 counters available
<br>[ =C2=A0=C2=A0=C2=A01.004308] audit: initializing netlink subsys (disab=
led)
<br>[ =C2=A0=C2=A0=C2=A01.006144] audit: type=3D2000 audit(0.950:1): state=
=3Dinitialized audit_enabled=3D0 res=3D1
<br>[ =C2=A0=C2=A0=C2=A01.008629] workingset: timestamp_bits=3D45 max_order=
=3D19 bucket_order=3D0
<br>[ =C2=A0=C2=A0=C2=A01.026025] Registering sdcardfs 0.1
<br>[ =C2=A0=C2=A0=C2=A01.028002] fuse init (API version 7.26)
<br>[ =C2=A0=C2=A0=C2=A01.042357] cryptomgr_test (44) used greatest stack d=
epth: 14608 bytes left
<br>[ =C2=A0=C2=A0=C2=A01.042770] cryptomgr_test (43) used greatest stack d=
epth: 14376 bytes left
<br>[ =C2=A0=C2=A0=C2=A01.062335] Block layer SCSI generic (bsg) driver ver=
sion 0.4 loaded (major 252)
<br>[ =C2=A0=C2=A0=C2=A01.062609] io scheduler noop registered
<br>[ =C2=A0=C2=A0=C2=A01.062750] io scheduler deadline registered
<br>[ =C2=A0=C2=A0=C2=A01.063215] io scheduler cfq registered (default)
<br>[ =C2=A0=C2=A0=C2=A01.063333] io scheduler mq-deadline registered
<br>[ =C2=A0=C2=A0=C2=A01.063453] io scheduler kyber registered
<br>[ =C2=A0=C2=A0=C2=A01.066175] OF: PCI: host bridge /pcie@10000000 range=
s:
<br>[ =C2=A0=C2=A0=C2=A01.066655] OF: PCI: =C2=A0=C2=A0=C2=A0IO 0x3eff0000.=
.0x3effffff -&gt; 0x00000000
<br>[ =C2=A0=C2=A0=C2=A01.067088] OF: PCI: =C2=A0=C2=A0MEM 0x10000000..0x3e=
feffff -&gt; 0x10000000
<br>[ =C2=A0=C2=A0=C2=A01.067228] OF: PCI: =C2=A0=C2=A0MEM 0x8000000000..0x=
ffffffffff -&gt; 0x8000000000
<br>[ =C2=A0=C2=A0=C2=A01.068255] pci-host-generic 4010000000.pcie: ECAM at=
 [mem 0x4010000000-0x401fffffff] for [bus 00-ff]
<br>[ =C2=A0=C2=A0=C2=A01.069325] pci-host-generic 4010000000.pcie: PCI hos=
t bridge to bus 0000:00
<br>[ =C2=A0=C2=A0=C2=A01.069606] pci_bus 0000:00: root bus resource [bus 0=
0-ff]
<br>[ =C2=A0=C2=A0=C2=A01.069780] pci_bus 0000:00: root bus resource [io =
=C2=A00x0000-0xffff]
<br>[ =C2=A0=C2=A0=C2=A01.069921] pci_bus 0000:00: root bus resource [mem 0=
x10000000-0x3efeffff]
<br>[ =C2=A0=C2=A0=C2=A01.070053] pci_bus 0000:00: root bus resource [mem 0=
x8000000000-0xffffffffff]
<br>[ =C2=A0=C2=A0=C2=A01.079427] pci 0000:00:01.0: BAR 6: assigned [mem 0x=
10000000-0x1003ffff pref]
<br>[ =C2=A0=C2=A0=C2=A01.079784] pci 0000:00:01.0: BAR 4: assigned [mem 0x=
8000000000-0x8000003fff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.080080] pci 0000:00:02.0: BAR 4: assigned [mem 0x=
8000004000-0x8000007fff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.080298] pci 0000:00:04.0: BAR 4: assigned [mem 0x=
8000008000-0x800000bfff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.080469] pci 0000:00:05.0: BAR 4: assigned [mem 0x=
800000c000-0x800000ffff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.080638] pci 0000:00:06.0: BAR 4: assigned [mem 0x=
8000010000-0x8000013fff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.080823] pci 0000:00:07.0: BAR 4: assigned [mem 0x=
8000014000-0x8000017fff 64bit pref]
<br>[ =C2=A0=C2=A0=C2=A01.081013] pci 0000:00:01.0: BAR 1: assigned [mem 0x=
10040000-0x10040fff]
<br>[ =C2=A0=C2=A0=C2=A01.081156] pci 0000:00:02.0: BAR 1: assigned [mem 0x=
10041000-0x10041fff]
<br>[ =C2=A0=C2=A0=C2=A01.081292] pci 0000:00:03.0: BAR 0: assigned [mem 0x=
10042000-0x10042fff]
<br>[ =C2=A0=C2=A0=C2=A01.081439] pci 0000:00:04.0: BAR 1: assigned [mem 0x=
10043000-0x10043fff]
<br>[ =C2=A0=C2=A0=C2=A01.081846] pci 0000:00:05.0: BAR 1: assigned [mem 0x=
10044000-0x10044fff]
<br>[ =C2=A0=C2=A0=C2=A01.082004] pci 0000:00:06.0: BAR 1: assigned [mem 0x=
10045000-0x10045fff]
<br>[ =C2=A0=C2=A0=C2=A01.082156] pci 0000:00:07.0: BAR 1: assigned [mem 0x=
10046000-0x10046fff]
<br>[ =C2=A0=C2=A0=C2=A01.082367] pci 0000:00:05.0: BAR 0: assigned [io =C2=
=A00x1000-0x107f]
<br>[ =C2=A0=C2=A0=C2=A01.082564] pci 0000:00:06.0: BAR 0: assigned [io =C2=
=A00x1080-0x10ff]
<br>[ =C2=A0=C2=A0=C2=A01.083362] pci 0000:00:07.0: BAR 0: assigned [io =C2=
=A00x1100-0x117f]
<br>[ =C2=A0=C2=A0=C2=A01.083504] pci 0000:00:01.0: BAR 0: assigned [io =C2=
=A00x1180-0x119f]
<br>[ =C2=A0=C2=A0=C2=A01.084473] pci 0000:00:03.0: enabling device (0000 -=
&gt; 0002)
<br>[ =C2=A0=C2=A0=C2=A01.090474] virtio-pci 0000:00:01.0: enabling device =
(0000 -&gt; 0003)
<br>[ =C2=A0=C2=A0=C2=A01.093129] virtio-pci 0000:00:02.0: enabling device =
(0000 -&gt; 0002)
<br>[ =C2=A0=C2=A0=C2=A01.095580] virtio-pci 0000:00:04.0: enabling device =
(0000 -&gt; 0002)
<br>[ =C2=A0=C2=A0=C2=A01.096833] virtio-pci 0000:00:05.0: enabling device =
(0000 -&gt; 0003)
<br>[ =C2=A0=C2=A0=C2=A01.098208] virtio-pci 0000:00:06.0: enabling device =
(0000 -&gt; 0003)
<br>[ =C2=A0=C2=A0=C2=A01.099601] virtio-pci 0000:00:07.0: enabling device =
(0000 -&gt; 0003)
<br>[ =C2=A0=C2=A0=C2=A01.112180] input: QEMU Virtio Tablet as /devices/pla=
tform/4010000000.pcie/pci0000:00/0000:00:04.0/virtio2/input/input0
<br>[ =C2=A0=C2=A0=C2=A01.113631] Serial: 8250/16550 driver, 4 ports, IRQ s=
haring enabled
<br>[ =C2=A0=C2=A0=C2=A01.118036] [drm] pci: virtio-gpu-pci detected at 000=
0:00:02.0
<br>[ =C2=A0=C2=A0=C2=A01.119474] [drm] virgl 3d acceleration not supported=
 by host
<br>[ =C2=A0=C2=A0=C2=A01.121314] [TTM] Zone =C2=A0kernel: Available graphi=
cs memory: 1021462 kiB
<br>[ =C2=A0=C2=A0=C2=A01.121663] [TTM] Initializing pool allocator
<br>[ =C2=A0=C2=A0=C2=A01.121949] [TTM] Initializing DMA pool allocator
<br>[ =C2=A0=C2=A0=C2=A01.122603] [drm] number of scanouts: 1
<br>[ =C2=A0=C2=A0=C2=A01.122701] [drm] number of cap sets: 0
<br>[ =C2=A0=C2=A0=C2=A01.138511] [drm] Initialized virtio_gpu 0.0.1 0 for =
virtio1 on minor 0
<br>[ =C2=A0=C2=A0=C2=A01.139496] cacheinfo: Unable to detect cache hierarc=
hy for CPU 0
<br>[ =C2=A0=C2=A0=C2=A01.162999] brd: module loaded
<br>[ =C2=A0=C2=A0=C2=A01.197188] loop: module loaded
<br>[ =C2=A0=C2=A0=C2=A01.245828] zram: Added device: zram0
<br>[ =C2=A0=C2=A0=C2=A01.247768] tun: Universal TUN/TAP device driver, 1.6
<br>[ =C2=A0=C2=A0=C2=A01.252484] PPP generic driver version 2.4.2
<br>[ =C2=A0=C2=A0=C2=A01.252976] PPP BSD Compression module registered
<br>[ =C2=A0=C2=A0=C2=A01.253135] PPP Deflate Compression module registered
<br>[ =C2=A0=C2=A0=C2=A01.253443] PPP MPPE Compression module registered
<br>[ =C2=A0=C2=A0=C2=A01.253575] NET: Registered protocol family 24
<br>[ =C2=A0=C2=A0=C2=A01.253689] PPTP driver version 0.8.5
<br>[ =C2=A0=C2=A0=C2=A01.258151] usbcore: registered new interface driver =
r8152
<br>[ =C2=A0=C2=A0=C2=A01.258339] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host=
 Controller (EHCI) Driver
<br>[ =C2=A0=C2=A0=C2=A01.258560] ehci-pci: EHCI PCI platform driver
<br>[ =C2=A0=C2=A0=C2=A01.260252] ehci-pci 0000:00:03.0: EHCI Host Controll=
er
<br>[ =C2=A0=C2=A0=C2=A01.260786] ehci-pci 0000:00:03.0: new USB bus regist=
ered, assigned bus number 1
<br>[ =C2=A0=C2=A0=C2=A01.262867] ehci-pci 0000:00:03.0: irq 42, io mem 0x1=
0042000
<br>[ =C2=A0=C2=A0=C2=A01.291890] ehci-pci 0000:00:03.0: USB 2.0 started, E=
HCI 1.00
<br>[ =C2=A0=C2=A0=C2=A01.295507] usb usb1: New USB device found, idVendor=
=3D1d6b, idProduct=3D0002
<br>[ =C2=A0=C2=A0=C2=A01.295687] usb usb1: New USB device strings: Mfr=3D3=
, Product=3D2, SerialNumber=3D1
<br>[ =C2=A0=C2=A0=C2=A01.295900] usb usb1: Product: EHCI Host Controller
<br>[ =C2=A0=C2=A0=C2=A01.296024] usb usb1: Manufacturer: Linux 4.14.307-01=
062-gef7460eabd6d ehci_hcd
<br>[ =C2=A0=C2=A0=C2=A01.296297] usb usb1: SerialNumber: 0000:00:03.0
<br>[ =C2=A0=C2=A0=C2=A01.298761] hub 1-0:1.0: USB hub found
<br>[ =C2=A0=C2=A0=C2=A01.299299] hub 1-0:1.0: 6 ports detected
<br>[ =C2=A0=C2=A0=C2=A01.304251] usbcore: registered new interface driver =
xpad
<br>[ =C2=A0=C2=A0=C2=A01.304500] usbcore: registered new interface driver =
usb_acecad
<br>[ =C2=A0=C2=A0=C2=A01.304722] usbcore: registered new interface driver =
aiptek
<br>[ =C2=A0=C2=A0=C2=A01.304946] usbcore: registered new interface driver =
gtco
<br>[ =C2=A0=C2=A0=C2=A01.305158] usbcore: registered new interface driver =
hanwang
<br>[ =C2=A0=C2=A0=C2=A01.305404] usbcore: registered new interface driver =
kbtab
<br>[ =C2=A0=C2=A0=C2=A01.307914] rtc-pl031 9010000.pl031: rtc core: regist=
ered pl031 as rtc0
<br>[ =C2=A0=C2=A0=C2=A01.310027] IR NEC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A01.310171] IR RC5(x/sz) protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A01.310338] IR RC6 protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A01.310499] IR JVC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A01.310615] IR Sony protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A01.310758] IR SANYO protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A01.310878] IR Sharp protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A01.311008] IR MCE Keyboard/mouse protocol handler in=
itialized
<br>[ =C2=A0=C2=A0=C2=A01.311161] IR XMP protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A01.312106] device-mapper: uevent: version 1.0.3
<br>[ =C2=A0=C2=A0=C2=A01.313070] device-mapper: ioctl: 4.37.0-ioctl (2017-=
09-20) initialised: <a href=3D"mailto:dm-devel@redhat.com">dm-devel@redhat.=
com</a>
<br>[ =C2=A0=C2=A0=C2=A01.313986] device-mapper: verity-avb: AVB error hand=
ler initialized with vbmeta device: =C2=A0<br>[ =C2=A0=C2=A0=C2=A01.315424]=
 hidraw: raw HID events driver (C) Jiri Kosina
<br>[ =C2=A0=C2=A0=C2=A01.321014] usbcore: registered new interface driver =
usbhid
<br>[ =C2=A0=C2=A0=C2=A01.321237] usbhid: USB HID core driver
<br>[ =C2=A0=C2=A0=C2=A01.323009] ashmem: initialized
<br>[ =C2=A0=C2=A0=C2=A01.325296] netem: version 1.3
<br>[ =C2=A0=C2=A0=C2=A01.325418] u32 classifier
<br>[ =C2=A0=C2=A0=C2=A01.325495] =C2=A0=C2=A0=C2=A0=C2=A0Actions configure=
d
<br>[ =C2=A0=C2=A0=C2=A01.325793] Netfilter messages via NETLINK v0.30.
<br>[ =C2=A0=C2=A0=C2=A01.326931] nf_conntrack version 0.5.0 (16384 buckets=
, 65536 max)
<br>[ =C2=A0=C2=A0=C2=A01.328555] ctnetlink v0.93: registering with nfnetli=
nk.
<br>[ =C2=A0=C2=A0=C2=A01.332683] xt_time: kernel timezone is -0000
<br>[ =C2=A0=C2=A0=C2=A01.333056] gre: GRE over IPv4 demultiplexor driver
<br>[ =C2=A0=C2=A0=C2=A01.333203] IPv4 over IPsec tunneling driver
<br>[ =C2=A0=C2=A0=C2=A01.336862] ip_tables: (C) 2000-2006 Netfilter Core T=
eam
<br>[ =C2=A0=C2=A0=C2=A01.341048] arp_tables: arp_tables: (C) 2002 David S.=
 Miller
<br>[ =C2=A0=C2=A0=C2=A01.343068] Initializing XFRM netlink socket
<br>[ =C2=A0=C2=A0=C2=A01.343384] IPsec XFRM device driver
<br>[ =C2=A0=C2=A0=C2=A01.345168] NET: Registered protocol family 10
<br>[ =C2=A0=C2=A0=C2=A01.352648] Segment Routing with IPv6
<br>[ =C2=A0=C2=A0=C2=A01.353576] mip6: Mobile IPv6
<br>[ =C2=A0=C2=A0=C2=A01.353771] ip6_tables: (C) 2000-2006 Netfilter Core =
Team
<br>[ =C2=A0=C2=A0=C2=A01.361034] sit: IPv6, IPv4 and MPLS over IPv4 tunnel=
ing driver
<br>[ =C2=A0=C2=A0=C2=A01.364274] NET: Registered protocol family 17
<br>[ =C2=A0=C2=A0=C2=A01.364605] NET: Registered protocol family 15
<br>[ =C2=A0=C2=A0=C2=A01.364837] l2tp_core: L2TP core driver, V2.0
<br>[ =C2=A0=C2=A0=C2=A01.365000] l2tp_ppp: PPPoL2TP kernel driver, V2.0
<br>[ =C2=A0=C2=A0=C2=A01.365527] NET: Registered protocol family 40
<br>[ =C2=A0=C2=A0=C2=A01.367119] registered taskstats version 1
<br>[ =C2=A0=C2=A0=C2=A01.371926] console [netcon0] enabled
<br>[ =C2=A0=C2=A0=C2=A01.372070] netconsole: network logging started
<br>[ =C2=A0=C2=A0=C2=A01.372854] rtc-pl031 9010000.pl031: setting system c=
lock to 2024-08-29 16:17:32 UTC (1724948252)
<br>[ =C2=A0=C2=A0=C2=A01.387989] OF: Duplicate name in testcase-data, rena=
med to &quot;duplicate-name#1&quot;
<br>[ =C2=A0=C2=A0=C2=A01.392856] ### dt-test ### unittest internal error: =
unable to add testdata property /aliases/name
<br>[ =C2=A0=C2=A0=C2=A01.392930] ### dt-test ### start of unittest - you w=
ill see error messages
<br>[ =C2=A0=C2=A0=C2=A01.395161] OF: /testcase-data/phandle-tests/consumer=
-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/p=
rovider1
<br>[ =C2=A0=C2=A0=C2=A01.395443] OF: /testcase-data/phandle-tests/consumer=
-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/p=
rovider1
<br>[ =C2=A0=C2=A0=C2=A01.395692] OF: /testcase-data/phandle-tests/consumer=
-a: could not find phandle
<br>[ =C2=A0=C2=A0=C2=A01.395876] OF: /testcase-data/phandle-tests/consumer=
-a: could not find phandle
<br>[ =C2=A0=C2=A0=C2=A01.396066] OF: /testcase-data/phandle-tests/consumer=
-a: arguments longer than property
<br>[ =C2=A0=C2=A0=C2=A01.396251] OF: /testcase-data/phandle-tests/consumer=
-a: arguments longer than property
<br>[ =C2=A0=C2=A0=C2=A01.403169] ### dt-test ### end of unittest - 149 pas=
sed, 0 failed
<br>[ =C2=A0=C2=A0=C2=A01.403669] ALSA device list:
<br>[ =C2=A0=C2=A0=C2=A01.403777] =C2=A0=C2=A0No soundcards found.
<br>[ =C2=A0=C2=A0=C2=A01.501102] Freeing unused kernel memory: 2752K
<br>[ =C2=A0=C2=A0=C2=A01.591837] usb 1-1: new high-speed USB device number=
 2 using ehci-pci
<br>[ =C2=A0=C2=A0=C2=A01.795716] usb 1-1: New USB device found, idVendor=
=3D0627, idProduct=3D0001
<br>[ =C2=A0=C2=A0=C2=A01.796018] usb 1-1: New USB device strings: Mfr=3D1,=
 Product=3D4, SerialNumber=3D11
<br>[ =C2=A0=C2=A0=C2=A01.796170] usb 1-1: Product: QEMU USB Keyboard
<br>[ =C2=A0=C2=A0=C2=A01.796269] usb 1-1: Manufacturer: QEMU
<br>[ =C2=A0=C2=A0=C2=A01.796350] usb 1-1: SerialNumber: 68284-0000:00:03.0=
-1
<br>[ =C2=A0=C2=A0=C2=A01.812011] input: QEMU QEMU USB Keyboard as /devices=
/platform/4010000000.pcie/pci0000:00/0000:00:03.0/usb1/1-1/1-1:1.0/0003:062=
7:0001.0001/input/input1
<br>[ =C2=A0=C2=A0=C2=A01.851611] init: init first stage started!
<br>[ =C2=A0=C2=A0=C2=A01.857863] init: [libfs_mgr]ReadFstabFromDt(): faile=
d to read fstab from dt
<br>[ =C2=A0=C2=A0=C2=A01.868774] init: Using Android DT directory /proc/de=
vice-tree/firmware/android/
<br>[ =C2=A0=C2=A0=C2=A01.889495] hid-generic 0003:0627:0001.0001: input,hi=
draw0: USB HID v1.11 Keyboard [QEMU QEMU USB Keyboard] on usb-0000:00:03.0-=
1/input0
<br>[ =C2=A0=C2=A0=C2=A02.322202] init: [libfs_mgr]superblock s_max_mnt_cou=
nt:65535,/dev/block/vda
<br>[ =C2=A0=C2=A0=C2=A02.323319] init: [libfs_mgr]Filesystem on /dev/block=
/vda was not cleanly shutdown; state flags: 0x1, incompat feature flags: 0x=
2c6
<br>[ =C2=A0=C2=A0=C2=A02.364522] init: [libfs_mgr]check_fs(): mount(/dev/b=
lock/vda,/system,ext4)=3D-1: No such file or directory
<br>[ =C2=A0=C2=A0=C2=A02.367800] init: [libfs_mgr]Not running /system/bin/=
e2fsck on /dev/block/vda (executable not in system image)
<br>[ =C2=A0=C2=A0=C2=A02.472699] EXT4-fs (vda): recovery complete
<br>[ =C2=A0=C2=A0=C2=A02.473539] EXT4-fs (vda): mounted filesystem with or=
dered data mode. Opts: barrier=3D1
<br>[ =C2=A0=C2=A0=C2=A02.474298] init: [libfs_mgr]__mount(source=3D/dev/bl=
ock/vda,target=3D/system,type=3Dext4)=3D0: Success
<br>[ =C2=A0=C2=A0=C2=A02.480449] init: Switching root to &#39;/system&#39;
<br>[ =C2=A0=C2=A0=C2=A02.502059] init: [libfs_mgr]superblock s_max_mnt_cou=
nt:65535,/dev/block/vdb
<br>[ =C2=A0=C2=A0=C2=A02.613275] EXT4-fs (vdb): recovery complete
<br>[ =C2=A0=C2=A0=C2=A02.613448] EXT4-fs (vdb): mounted filesystem with or=
dered data mode. Opts: barrier=3D1
<br>[ =C2=A0=C2=A0=C2=A02.720161] reboot: Restarting system with command &#=
39;bootloader&#39;<br></span></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Aug 28, 2024 at 2:10=E2=80=AFPM Mario=
 Marietto &lt;<a href=3D"mailto:marietto2008@gmail.com">marietto2008@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>Hello.</div><div><br></div><div>maybe I did some p=
rogress using these parameters :</div><div><div><br></div><div>root@Z390-AO=
RUS-PRO-DEST:/mnt/zroot2/zroot2/OS/Android# nano start-virt6</div><div></di=
v><div><br></div></div><div>qemu-system-aarch64 \<br>=C2=A0 =C2=A0 -smp 4 \=
<br>=C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 -cpu cortex-a72 \<br>=C2=A0 =
=C2=A0 -M virt \<br>=C2=A0 =C2=A0 -kernel /mnt/zroot2/zroot2/OS/Android/Kos=
taKang/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \<br=
>=C2=A0 =C2=A0 -initrd /mnt/zroot2/zroot2/OS/Android/KostaKang/lineage-21.0=
-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/ramdisk-recovery.img \<br>=C2=
=A0=C2=A0=C2=A0 -append &quot;console=3DttyAMA1,384000 androidboot.hardware=
=3Drpi4 no_console_suspend root=3D/dev/mmcblk1p2 rootwait androidboot.selin=
ux=3Dpermissive loglevel=3D8&quot; \<br>=C2=A0 =C2=A0 -no-reboot \<br>=C2=
=A0 =C2=A0 -serial tcp::5555,server,nowait,nodelay \<br>=C2=A0 =C2=A0 -disp=
lay sdl \<br>=C2=A0 =C2=A0 -serial mon:stdio \</div><div><br></div><div><br=
></div><div>The LOG messages seem to be more interesting than before :</div=
><div><br></div><div><br></div><div>root@Z390-AORUS-PRO-DEST:/mnt/zroot2/zr=
oot2/OS/Android# ./start-virt6</div><br>[ =C2=A0 =C2=A00.000000] Booting Li=
nux on physical CPU 0x0000000000 [0x410fd083]<br>[ =C2=A0 =C2=A00.000000] L=
inux version 6.6.36-g01aac93821d2-v8 (kleaf@build-host) (Android (11368308,=
 +pgo, +bolt, +lto, +mlgo, based on r510928) clang version 18.0.0 (<a href=
=3D"https://android.googlesource.com/toolchain/llvm-project" target=3D"_bla=
nk">https://android.googlesource.com/toolchain/llvm-project</a> 477610d4d0d=
988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #1 SMP PREEMPT Tue Jul =C2=A02 =
09:02:32 UTC 2024<br>[ =C2=A0 =C2=A00.000000] KASLR enabled<br>[ =C2=A0 =C2=
=A00.000000] random: crng init done<br>[ =C2=A0 =C2=A00.000000] Machine mod=
el: linux,dummy-virt<br>[ =C2=A0 =C2=A00.000000] efi: UEFI not found.<br>[ =
=C2=A0 =C2=A00.000000] Zone ranges:<br>[ =C2=A0 =C2=A00.000000] =C2=A0 DMA =
=C2=A0 =C2=A0 =C2=A0[mem 0x0000000040000000-0x00000000bfffffff]<br>[ =C2=A0=
 =C2=A00.000000] =C2=A0 DMA32 =C2=A0 =C2=A0empty<br>[ =C2=A0 =C2=A00.000000=
] =C2=A0 Normal =C2=A0 empty<br>[ =C2=A0 =C2=A00.000000] Movable zone start=
 for each node<br>[ =C2=A0 =C2=A00.000000] NoSplit zone start for each node=
<br>[ =C2=A0 =C2=A00.000000] NoMerge zone start for each node<br>[ =C2=A0 =
=C2=A00.000000] Early memory node ranges<br>[ =C2=A0 =C2=A00.000000] =C2=A0=
 node =C2=A0 0: [mem 0x0000000040000000-0x00000000bfffffff]<br>[ =C2=A0 =C2=
=A00.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bffffff=
f]<br>[ =C2=A0 =C2=A00.000000] cma: Reserved 8 MiB at 0x00000000bd000000 on=
 node -1<br>[ =C2=A0 =C2=A00.000000] psci: probing for conduit method from =
DT.<br>[ =C2=A0 =C2=A00.000000] psci: PSCIv1.1 detected in firmware.<br>[ =
=C2=A0 =C2=A00.000000] psci: Using standard PSCI v0.2 function IDs<br>[ =C2=
=A0 =C2=A00.000000] psci: Trusted OS migration not required<br>[ =C2=A0 =C2=
=A00.000000] psci: SMC Calling Convention v1.0<br>[ =C2=A0 =C2=A00.000000] =
percpu: Embedded 31 pages/cpu s87016 r8192 d31768 u126976<br>[ =C2=A0 =C2=
=A00.000000] pcpu-alloc: s87016 r8192 d31768 u126976 alloc=3D31*4096<br>[ =
=C2=A0 =C2=A00.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 <br>[ =C2=A0 =C2=
=A00.000000] Detected PIPT I-cache on CPU0<br>[ =C2=A0 =C2=A00.000000] CPU =
features: detected: Spectre-v2<br>[ =C2=A0 =C2=A00.000000] CPU features: de=
tected: Spectre-v3a<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: Spe=
ctre-v4<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: Spectre-BHB<br>=
[ =C2=A0 =C2=A00.000000] CPU features: kernel page table isolation forced O=
N by KASLR<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: Kernel page =
table isolation (KPTI)<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: =
ARM erratum 1742098<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: ARM=
 errata 1165522, 1319367, or 1530923<br>[ =C2=A0 =C2=A00.000000] alternativ=
es: applying boot alternatives<br>[ =C2=A0 =C2=A00.000000] Kernel command l=
ine: console=3DttyAMA1,384000 androidboot.hardware=3Drpi4 no_console_suspen=
d root=3D/dev/mmcblk1p2 rootwait androidboot.selinux=3Dpermissive loglevel=
=3D8 androidboot.serialno=3D10000000abcd1234 androidboot.btmacaddr=3D11:22:=
33:44:55:66<br>[ =C2=A0 =C2=A00.000000] Dentry cache hash table entries: 26=
2144 (order: 9, 2097152 bytes, linear)<br>[ =C2=A0 =C2=A00.000000] Inode-ca=
che hash table entries: 131072 (order: 8, 1048576 bytes, linear)<br>[ =C2=
=A0 =C2=A00.000000] Built 1 zonelists, mobility grouping on.=C2=A0 Total pa=
ges: 516096<br>[ =C2=A0 =C2=A00.000000] mem auto-init: stack:all(zero), hea=
p alloc:off, heap free:off<br>[ =C2=A0 =C2=A00.000000] Memory: 1998052K/209=
7152K available (19328K kernel code, 2374K rwdata, 7612K rodata, 1792K init=
, 1192K bss, 90908K reserved, 8192K cma-reserved)<br>[ =C2=A0 =C2=A00.00000=
0] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, Nodes=3D1<br>=
[ =C2=A0 =C2=A00.000000] ftrace: allocating 56269 entries in 220 pages<br>[=
 =C2=A0 =C2=A00.000000] ftrace: allocated 220 pages with 5 groups<br>[ =C2=
=A0 =C2=A00.000000] trace event string verifier disabled<br>[ =C2=A0 =C2=A0=
0.000000] rcu: Preemptible hierarchical RCU implementation.<br>[ =C2=A0 =C2=
=A00.000000] rcu: =C2=A0 =C2=A0 RCU event tracing is enabled.<br>[ =C2=A0 =
=C2=A00.000000] rcu: =C2=A0 =C2=A0 RCU restricting CPUs from NR_CPUS=3D256 =
to nr_cpu_ids=3D4.<br>[ =C2=A0 =C2=A00.000000] =C2=A0Trampoline variant of =
Tasks RCU enabled.<br>[ =C2=A0 =C2=A00.000000] =C2=A0Rude variant of Tasks =
RCU enabled.<br>[ =C2=A0 =C2=A00.000000] =C2=A0Tracing variant of Tasks RCU=
 enabled.<br>[ =C2=A0 =C2=A00.000000] rcu: RCU calculated value of schedule=
r-enlistment delay is 25 jiffies.<br>[ =C2=A0 =C2=A00.000000] rcu: Adjustin=
g geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D4<br>[ =C2=A0 =C2=A00.000=
000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br>[ =C2=A0 =C2=A00.000=
000] Root IRQ handler: gic_handle_irq<br>[ =C2=A0 =C2=A00.000000] GICv2m: r=
ange[mem 0x08020000-0x08020fff], SPI[80:143]<br>[ =C2=A0 =C2=A00.000000] rc=
u: srcu_init: Setting srcu_struct sizes based on contention.<br>[ =C2=A0 =
=C2=A00.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).<br>[ =
=C2=A0 =C2=A00.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffff=
ff max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns<br>[ =C2=A0 =C2=
=A00.000072] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps every 43=
98046511096ns<br>[ =C2=A0 =C2=A00.003415] kfence: initialized - using 20971=
52 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)<br>[ =C2=
=A0 =C2=A00.010294] Calibrating delay loop (skipped), value calculated usin=
g timer frequency.. 125.00 BogoMIPS (lpj=3D250000)<br>[ =C2=A0 =C2=A00.0104=
68] pid_max: default: 32768 minimum: 301<br>[ =C2=A0 =C2=A00.012316] LSM: i=
nitializing lsm=3Dcapability,selinux,integrity<br>[ =C2=A0 =C2=A00.012725] =
SELinux: =C2=A0Initializing.<br>[ =C2=A0 =C2=A00.016078] Mount-cache hash t=
able entries: 4096 (order: 3, 32768 bytes, linear)<br>[ =C2=A0 =C2=A00.0161=
40] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linea=
r)<br>[ =C2=A0 =C2=A00.030412] cgroup: Disabling memory control group subsy=
stem<br>[ =C2=A0 =C2=A00.048581] cacheinfo: Unable to detect cache hierarch=
y for CPU 0<br>[ =C2=A0 =C2=A00.058399] RCU Tasks: Setting shift to 2 and l=
im to 1 rcu_task_cb_adjust=3D1.<br>[ =C2=A0 =C2=A00.058995] RCU Tasks Rude:=
 Setting shift to 2 and lim to 1 rcu_task_cb_adjust=3D1.<br>[ =C2=A0 =C2=A0=
0.059241] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb_adju=
st=3D1.<br>[ =C2=A0 =C2=A00.060770] rcu: Hierarchical SRCU implementation.<=
br>[ =C2=A0 =C2=A00.060806] rcu: =C2=A0 =C2=A0 Max phase no-delay instances=
 is 1000.<br>[ =C2=A0 =C2=A00.067966] EFI services will not be available.<b=
r>[ =C2=A0 =C2=A00.069136] smp: Bringing up secondary CPUs ...<br>[ =C2=A0 =
=C2=A00.073070] Detected PIPT I-cache on CPU1<br>[ =C2=A0 =C2=A00.074107] C=
PU1: Booted secondary processor 0x0000000001 [0x410fd083]<br>[ =C2=A0 =C2=
=A00.079461] Detected PIPT I-cache on CPU2<br>[ =C2=A0 =C2=A00.079980] CPU2=
: Booted secondary processor 0x0000000002 [0x410fd083]<br>[ =C2=A0 =C2=A00.=
081795] Detected PIPT I-cache on CPU3<br>[ =C2=A0 =C2=A00.082259] CPU3: Boo=
ted secondary processor 0x0000000003 [0x410fd083]<br>[ =C2=A0 =C2=A00.08275=
5] smp: Brought up 1 node, 4 CPUs<br>[ =C2=A0 =C2=A00.082785] SMP: Total of=
 4 processors activated.<br>[ =C2=A0 =C2=A00.082872] CPU features: detected=
: 32-bit EL0 Support<br>[ =C2=A0 =C2=A00.082893] CPU features: detected: 32=
-bit EL1 Support<br>[ =C2=A0 =C2=A00.082947] CPU features: detected: CRC32 =
instructions<br>[ =C2=A0 =C2=A00.086896] CPU features: emulated: Privileged=
 Access Never (PAN) using TTBR0_EL1 switching<br>[ =C2=A0 =C2=A00.087196] C=
PU: All CPU(s) started at EL1<br>[ =C2=A0 =C2=A00.087478] alternatives: app=
lying system-wide alternatives<br>[ =C2=A0 =C2=A00.111400] devtmpfs: initia=
lized<br>[ =C2=A0 =C2=A00.122787] Enabled cp15_barrier support<br>[ =C2=A0 =
=C2=A00.123005] Enabled setend support<br>[ =C2=A0 =C2=A00.124388] clocksou=
rce: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041=
785100000 ns<br>[ =C2=A0 =C2=A00.124510] futex hash table entries: 1024 (or=
der: 4, 65536 bytes, linear)<br>[ =C2=A0 =C2=A00.127804] pinctrl core: init=
ialized pinctrl subsystem<br>[ =C2=A0 =C2=A00.133859] DMI not present or in=
valid.<br>[ =C2=A0 =C2=A00.143968] NET: Registered PF_NETLINK/PF_ROUTE prot=
ocol family<br>[ =C2=A0 =C2=A00.155874] DMA: preallocated 256 KiB GFP_KERNE=
L pool for atomic allocations<br>[ =C2=A0 =C2=A00.156459] DMA: preallocated=
 256 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations<br>[ =C2=A0 =C2=A00=
.156805] audit: initializing netlink subsys (disabled)<br>[ =C2=A0 =C2=A00.=
159085] audit: type=3D2000 audit(0.148:1): state=3Dinitialized audit_enable=
d=3D0 res=3D1<br>[ =C2=A0 =C2=A00.162594] thermal_sys: Registered thermal g=
overnor &#39;step_wise&#39;<br>[ =C2=A0 =C2=A00.162937] cpuidle: using gove=
rnor menu<br>[ =C2=A0 =C2=A00.164031] hw-breakpoint: found 6 breakpoint and=
 4 watchpoint registers.<br>[ =C2=A0 =C2=A00.164971] ASID allocator initial=
ised with 32768 entries<br>[ =C2=A0 =C2=A00.166421] Serial: AMBA PL011 UART=
 driver<br>[ =C2=A0 =C2=A00.195802] 9000000.pl011: ttyAMA0 at MMIO 0x900000=
0 (irq =3D 13, base_baud =3D 0) is a PL011 rev1<br>[ =C2=A0 =C2=A00.207191]=
 9040000.pl011: ttyAMA1 at MMIO 0x9040000 (irq =3D 14, base_baud =3D 0) is =
a PL011 rev1<br>[ =C2=A0 =C2=A00.208270] printk: console [ttyAMA1] enabled<=
br>[ =C2=A0 =C2=A00.227211] Modules: 2G module region forced by RANDOMIZE_M=
ODULE_REGION_FULL<br>[ =C2=A0 =C2=A00.227414] Modules: 0 pages in range for=
 non-PLT usage<br>[ =C2=A0 =C2=A00.227439] Modules: 516176 pages in range f=
or PLT usage<br>[ =C2=A0 =C2=A00.252423] iommu: Default domain type: Transl=
ated<br>[ =C2=A0 =C2=A00.252692] iommu: DMA domain TLB invalidation policy:=
 strict mode<br>[ =C2=A0 =C2=A00.255246] SCSI subsystem initialized<br>[ =
=C2=A0 =C2=A00.256728] usbcore: registered new interface driver usbfs<br>[ =
=C2=A0 =C2=A00.257155] usbcore: registered new interface driver hub<br>[ =
=C2=A0 =C2=A00.257501] usbcore: registered new device driver usb<br>[ =C2=
=A0 =C2=A00.258703] mc: Linux media interface: v0.10<br>[ =C2=A0 =C2=A00.25=
9091] videodev: Linux video capture interface: v2.00<br>[ =C2=A0 =C2=A00.26=
0033] pps_core: LinuxPPS API ver. 1 registered<br>[ =C2=A0 =C2=A00.260306] =
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;<a=
 href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti@linux.it</a>&=
gt;<br>[ =C2=A0 =C2=A00.260646] PTP clock support registered<br>[ =C2=A0 =
=C2=A00.263957] Advanced Linux Sound Architecture Driver Initialized.<br>[ =
=C2=A0 =C2=A00.275807] Bluetooth: Core ver 2.22<br>[ =C2=A0 =C2=A00.276194]=
 NET: Registered PF_BLUETOOTH protocol family<br>[ =C2=A0 =C2=A00.276328] B=
luetooth: HCI device and connection manager initialized<br>[ =C2=A0 =C2=A00=
.276761] Bluetooth: HCI socket layer initialized<br>[ =C2=A0 =C2=A00.276945=
] Bluetooth: L2CAP socket layer initialized<br>[ =C2=A0 =C2=A00.277292] Blu=
etooth: SCO socket layer initialized<br>[ =C2=A0 =C2=A00.279818] vgaarb: lo=
aded<br>[ =C2=A0 =C2=A00.283189] clocksource: Switched to clocksource arch_=
sys_counter<br>[ =C2=A0 =C2=A00.289133] VFS: Disk quotas dquot_6.6.0<br>[ =
=C2=A0 =C2=A00.289446] VFS: Dquot-cache hash table entries: 512 (order 0, 4=
096 bytes)<br>[ =C2=A0 =C2=A00.290358] FS-Cache: Loaded<br>[ =C2=A0 =C2=A00=
.291617] CacheFiles: Loaded<br>[ =C2=A0 =C2=A00.298740] NET: Registered PF_=
INET protocol family<br>[ =C2=A0 =C2=A00.300444] IP idents hash table entri=
es: 32768 (order: 6, 262144 bytes, linear)<br>[ =C2=A0 =C2=A00.316440] tcp_=
listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes, linea=
r)<br>[ =C2=A0 =C2=A00.316948] Table-perturb hash table entries: 65536 (ord=
er: 6, 262144 bytes, linear)<br>[ =C2=A0 =C2=A00.317307] TCP established ha=
sh table entries: 16384 (order: 5, 131072 bytes, linear)<br>[ =C2=A0 =C2=A0=
0.318245] TCP bind hash table entries: 16384 (order: 7, 524288 bytes, linea=
r)<br>[ =C2=A0 =C2=A00.319865] TCP: Hash tables configured (established 163=
84 bind 16384)<br>[ =C2=A0 =C2=A00.323421] MPTCP token hash table entries: =
2048 (order: 3, 49152 bytes, linear)<br>[ =C2=A0 =C2=A00.323880] UDP hash t=
able entries: 1024 (order: 3, 32768 bytes, linear)<br>[ =C2=A0 =C2=A00.3243=
23] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)<br>[ =
=C2=A0 =C2=A00.326061] NET: Registered PF_UNIX/PF_LOCAL protocol family<br>=
[ =C2=A0 =C2=A00.328752] PCI: CLS 0 bytes, default 64<br>[ =C2=A0 =C2=A00.3=
34033] Trying to unpack rootfs image as initramfs...<br>[ =C2=A0 =C2=A00.33=
6332] kvm [1]: HYP mode not available<br>[ =C2=A0 =C2=A00.343844] Initialis=
e system trusted keyrings<br>[ =C2=A0 =C2=A00.346555] workingset: timestamp=
_bits=3D46 max_order=3D19 bucket_order=3D0<br>[ =C2=A0 =C2=A00.347547] zbud=
: loaded<br>[ =C2=A0 =C2=A00.357060] Key type cifs.idmap registered<br>[ =
=C2=A0 =C2=A00.358007] fuse: init (API version 7.39)<br>[ =C2=A0 =C2=A00.40=
1184] Key type asymmetric registered<br>[ =C2=A0 =C2=A00.401438] Asymmetric=
 key parser &#39;x509&#39; registered<br>[ =C2=A0 =C2=A00.401856] Block lay=
er SCSI generic (bsg) driver version 0.4 loaded (major 244)<br>[ =C2=A0 =C2=
=A00.403283] io scheduler mq-deadline registered<br>[ =C2=A0 =C2=A00.403590=
] io scheduler kyber registered<br>[ =C2=A0 =C2=A00.404135] io scheduler bf=
q registered<br>[ =C2=A0 =C2=A00.419403] vc-mem: phys_addr:0x00000000 mem_b=
ase=3D0x00000000 mem_size:0x00000000(0 MiB)<br>[ =C2=A0 =C2=A00.474856] brd=
: module loaded<br>[ =C2=A0 =C2=A00.505166] loop: module loaded<br>[ =C2=A0=
 =C2=A00.508386] Loading iSCSI transport class v2.0-870.<br>[ =C2=A0 =C2=A0=
0.518541] wireguard: WireGuard 1.0.0 loaded. See <a href=3D"http://www.wire=
guard.com" target=3D"_blank">www.wireguard.com</a> for information.<br>[ =
=C2=A0 =C2=A00.518727] wireguard: Copyright (C) 2015-2019 Jason A. Donenfel=
d &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com<=
/a>&gt;. All Rights Reserved.<br>[ =C2=A0 =C2=A00.530178] tun: Universal TU=
N/TAP device driver, 1.6<br>[ =C2=A0 =C2=A00.533835] usbcore: registered ne=
w interface driver brcmfmac<br>[ =C2=A0 =C2=A00.534107] usbcore: registered=
 new device driver r8152-cfgselector<br>[ =C2=A0 =C2=A00.534455] usbcore: r=
egistered new interface driver r8152<br>[ =C2=A0 =C2=A00.534682] usbcore: r=
egistered new interface driver lan78xx<br>[ =C2=A0 =C2=A00.534915] usbcore:=
 registered new interface driver asix<br>[ =C2=A0 =C2=A00.535376] usbcore: =
registered new interface driver ax88179_178a<br>[ =C2=A0 =C2=A00.535608] us=
bcore: registered new interface driver cdc_ether<br>[ =C2=A0 =C2=A00.535863=
] usbcore: registered new interface driver smsc95xx<br>[ =C2=A0 =C2=A00.536=
193] usbcore: registered new interface driver net1080<br>[ =C2=A0 =C2=A00.5=
36532] usbcore: registered new interface driver cdc_subset<br>[ =C2=A0 =C2=
=A00.536771] usbcore: registered new interface driver zaurus<br>[ =C2=A0 =
=C2=A00.537039] usbcore: registered new interface driver cdc_ncm<br>[ =C2=
=A0 =C2=A00.537301] usbcore: registered new interface driver r8153_ecm<br>[=
 =C2=A0 =C2=A00.538269] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)<b=
r>[ =C2=A0 =C2=A00.538549] dwc_otg: FIQ enabled<br>[ =C2=A0 =C2=A00.538629]=
 dwc_otg: NAK holdoff enabled<br>[ =C2=A0 =C2=A00.538725] dwc_otg: FIQ spli=
t-transaction FSM enabled<br>[ =C2=A0 =C2=A00.538906] Module dwc_common_por=
t init<br>[ =C2=A0 =C2=A00.541229] usbcore: registered new interface driver=
 cdc_acm<br>[ =C2=A0 =C2=A00.541356] cdc_acm: USB Abstract Control Model dr=
iver for USB modems and ISDN adapters<br>[ =C2=A0 =C2=A00.542269] usbcore: =
registered new interface driver uas<br>[ =C2=A0 =C2=A00.542583] usbcore: re=
gistered new interface driver usb-storage<br>[ =C2=A0 =C2=A00.543322] usbco=
re: registered new interface driver cp210x<br>[ =C2=A0 =C2=A00.543681] usbs=
erial: USB Serial support registered for cp210x<br>[ =C2=A0 =C2=A00.543973]=
 usbcore: registered new interface driver pl2303<br>[ =C2=A0 =C2=A00.544176=
] usbserial: USB Serial support registered for pl2303<br>[ =C2=A0 =C2=A00.5=
47458] mousedev: PS/2 mouse device common for all mice<br>[ =C2=A0 =C2=A00.=
547725] usbcore: registered new interface driver xpad<br>[ =C2=A0 =C2=A00.5=
47949] usbcore: registered new interface driver usb_acecad<br>[ =C2=A0 =C2=
=A00.548186] usbcore: registered new interface driver aiptek<br>[ =C2=A0 =
=C2=A00.548462] usbcore: registered new interface driver hanwang<br>[ =C2=
=A0 =C2=A00.548692] usbcore: registered new interface driver kbtab<br>[ =C2=
=A0 =C2=A00.549180] usbcore: registered new interface driver usbtouchscreen=
<br>[ =C2=A0 =C2=A00.550460] i2c_dev: i2c /dev entries driver<br>[ =C2=A0 =
=C2=A00.553959] ir_imon_decoder: IR iMON protocol handler initialized<br>[ =
=C2=A0 =C2=A00.554110] IR JVC protocol handler initialized<br>[ =C2=A0 =C2=
=A00.554225] IR MCE Keyboard/mouse protocol handler initialized<br>[ =C2=A0=
 =C2=A00.554357] IR NEC protocol handler initialized<br>[ =C2=A0 =C2=A00.55=
4476] IR RC5(x/sz) protocol handler initialized<br>[ =C2=A0 =C2=A00.554593]=
 IR RC6 protocol handler initialized<br>[ =C2=A0 =C2=A00.554711] IR RCMM pr=
otocol handler initialized<br>[ =C2=A0 =C2=A00.554829] IR SANYO protocol ha=
ndler initialized<br>[ =C2=A0 =C2=A00.555046] IR Sharp protocol handler ini=
tialized<br>[ =C2=A0 =C2=A00.555351] IR Sony protocol handler initialized<b=
r>[ =C2=A0 =C2=A00.555469] IR XMP protocol handler initialized<br>[ =C2=A0 =
=C2=A00.556083] usbcore: registered new interface driver uvcvideo<br>[ =C2=
=A0 =C2=A00.557793] device-mapper: uevent: version 1.0.3<br>[ =C2=A0 =C2=A0=
0.558904] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: <a h=
ref=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel@redhat.com</a=
><br>[ =C2=A0 =C2=A00.560836] Bluetooth: HCI UART driver ver 2.3<br>[ =C2=
=A0 =C2=A00.561007] Bluetooth: HCI UART protocol H4 registered<br>[ =C2=A0 =
=C2=A00.561440] Bluetooth: HCI UART protocol Broadcom registered<br>[ =C2=
=A0 =C2=A00.563240] sdhci: Secure Digital Host Controller Interface driver<=
br>[ =C2=A0 =C2=A00.563373] sdhci: Copyright(c) Pierre Ossman<br>[ =C2=A0 =
=C2=A00.563861] sdhci-pltfm: SDHCI platform and OF driver helper<br>[ =C2=
=A0 =C2=A00.565404] ledtrig-cpu: registered to indicate activity on CPUs<br=
>[ =C2=A0 =C2=A00.567595] hid: raw HID events driver (C) Jiri Kosina<br>[ =
=C2=A0 =C2=A00.578778] usbcore: registered new interface driver usbhid<br>[=
 =C2=A0 =C2=A00.579196] usbhid: USB HID core driver<br>[ =C2=A0 =C2=A00.582=
877] ashmem: initialized<br>[ =C2=A0 =C2=A00.584380] SPI driver st-accel-sp=
i has no spi_device_id for st,lis302dl-spi<br>[ =C2=A0 =C2=A00.584551] SPI =
driver st-accel-spi has no spi_device_id for st,lis3lv02dl-accel<br>[ =C2=
=A0 =C2=A00.584745] SPI driver st-accel-spi has no spi_device_id for st,lis=
3dh-accel<br>[ =C2=A0 =C2=A00.584935] SPI driver st-accel-spi has no spi_de=
vice_id for st,lsm330d-accel<br>[ =C2=A0 =C2=A00.585076] SPI driver st-acce=
l-spi has no spi_device_id for st,lsm330dl-accel<br>[ =C2=A0 =C2=A00.585242=
] SPI driver st-accel-spi has no spi_device_id for st,lsm330dlc-accel<br>[ =
=C2=A0 =C2=A00.585385] SPI driver st-accel-spi has no spi_device_id for st,=
lis331dlh-accel<br>[ =C2=A0 =C2=A00.585526] SPI driver st-accel-spi has no =
spi_device_id for st,lsm330-accel<br>[ =C2=A0 =C2=A00.585663] SPI driver st=
-accel-spi has no spi_device_id for st,lsm303agr-accel<br>[ =C2=A0 =C2=A00.=
585803] SPI driver st-accel-spi has no spi_device_id for st,lis2dh12-accel<=
br>[ =C2=A0 =C2=A00.585944] SPI driver st-accel-spi has no spi_device_id fo=
r st,lng2dm-accel<br>[ =C2=A0 =C2=A00.586094] SPI driver st-accel-spi has n=
o spi_device_id for st,h3lis331dl-accel<br>[ =C2=A0 =C2=A00.586280] SPI dri=
ver st-accel-spi has no spi_device_id for st,lis331dl-accel<br>[ =C2=A0 =C2=
=A00.586460] SPI driver st-accel-spi has no spi_device_id for st,lsm303c-ac=
cel<br>[ =C2=A0 =C2=A00.587705] SPI driver st-magn-spi has no spi_device_id=
 for st,lis3mdl-magn<br>[ =C2=A0 =C2=A00.587923] SPI driver st-magn-spi has=
 no spi_device_id for st,lsm303agr-magn<br>[ =C2=A0 =C2=A00.588163] SPI dri=
ver st-magn-spi has no spi_device_id for st,lsm9ds1-magn<br>[ =C2=A0 =C2=A0=
0.588410] SPI driver st-magn-spi has no spi_device_id for st,lsm303c-magn<b=
r>[ =C2=A0 =C2=A00.596185] hw perfevents: enabled with armv8_pmuv3 PMU driv=
er, 7 counters available<br>[ =C2=A0 =C2=A00.600270] usbcore: registered ne=
w interface driver snd-usb-audio<br>[ =C2=A0 =C2=A00.607077] Mirror/redirec=
t action on<br>[ =C2=A0 =C2=A00.607525] netem: version 1.3<br>[ =C2=A0 =C2=
=A00.607614] u32 classifier<br>[ =C2=A0 =C2=A00.607673] =C2=A0 =C2=A0 input=
 device check on<br>[ =C2=A0 =C2=A00.607755] =C2=A0 =C2=A0 Actions configur=
ed<br>[ =C2=A0 =C2=A00.615221] xt_time: kernel timezone is -0000<br>[ =C2=
=A0 =C2=A00.615693] gre: GRE over IPv4 demultiplexor driver<br>[ =C2=A0 =C2=
=A00.615911] IPv4 over IPsec tunneling driver<br>[ =C2=A0 =C2=A00.621107] I=
nitializing XFRM netlink socket<br>[ =C2=A0 =C2=A00.621440] IPsec XFRM devi=
ce driver<br>[ =C2=A0 =C2=A00.622363] NET: Registered PF_INET6 protocol fam=
ily<br>[ =C2=A0 =C2=A00.635597] Segment Routing with IPv6<br>[ =C2=A0 =C2=
=A00.635871] In-situ OAM (IOAM) with IPv6<br>[ =C2=A0 =C2=A00.636820] mip6:=
 Mobile IPv6<br>[ =C2=A0 =C2=A00.641935] sit: IPv6, IPv4 and MPLS over IPv4=
 tunneling driver<br>[ =C2=A0 =C2=A00.646292] NET: Registered PF_PACKET pro=
tocol family<br>[ =C2=A0 =C2=A00.646553] NET: Registered PF_KEY protocol fa=
mily<br>[ =C2=A0 =C2=A00.646756] Key type dns_resolver registered<br>[ =C2=
=A0 =C2=A00.779288] registered taskstats version 1<br>[ =C2=A0 =C2=A00.7819=
71] Loading compiled-in X.509 certificates<br>[ =C2=A0 =C2=A00.852683] Key =
type .fscrypt registered<br>[ =C2=A0 =C2=A00.852897] Key type fscrypt-provi=
sioning registered<br>[ =C2=A0 =C2=A00.864447] of_cfs_init<br>[ =C2=A0 =C2=
=A00.865145] of_cfs_init: OK<br>[ =C2=A0 =C2=A00.870305] cfg80211: Loading =
compiled-in X.509 certificates for regulatory database<br>[ =C2=A0 =C2=A01.=
478027] Freeing initrd memory: 14612K<br>[ =C2=A0 =C2=A01.503691] Loaded X.=
509 cert &#39;<a href=3D"mailto:benh@debian.org" target=3D"_blank">benh@deb=
ian.org</a>: 577e021cb980e0e820821ba7b54b4961b8b4fadf&#39;<br>[ =C2=A0 =C2=
=A01.504674] Loaded X.509 cert &#39;<a href=3D"mailto:romain.perier@gmail.c=
om" target=3D"_blank">romain.perier@gmail.com</a>: 3abbc6ec146e09d1b6016ab9=
d6cf71dd233f0328&#39;<br>[ =C2=A0 =C2=A01.505470] Loaded X.509 cert &#39;sf=
orshee: 00b28ddf47aef9cea7&#39;<br>[ =C2=A0 =C2=A01.506197] Loaded X.509 ce=
rt &#39;wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600&#39;<br>[ =C2=A0 =C2=
=A01.512240] clk: Disabling unused clocks<br>[ =C2=A0 =C2=A01.512725] ALSA =
device list:<br>[ =C2=A0 =C2=A01.512871] =C2=A0 No soundcards found.<br>[ =
=C2=A0 =C2=A01.517373] uart-pl011 9040000.pl011: no DMA platform data<br>[ =
=C2=A0 =C2=A01.607308] Freeing unused kernel memory: 1792K<br>[ =C2=A0 =C2=
=A01.610100] Run /init as init process<br>[ =C2=A0 =C2=A01.610246] =C2=A0 w=
ith arguments:<br>[ =C2=A0 =C2=A01.610366] =C2=A0 =C2=A0 /init<br>[ =C2=A0 =
=C2=A01.610472] =C2=A0 with environment:<br>[ =C2=A0 =C2=A01.610544] =C2=A0=
 =C2=A0 HOME=3D/<br>[ =C2=A0 =C2=A01.610615] =C2=A0 =C2=A0 TERM=3Dlinux<br>=
linker: Warning: &quot;[vdso]&quot; unused DT entry: unknown processor-spec=
ific (type 0x70000001 arg 0x0) (ignoring)<br>WARNING: linker: Warning: &quo=
t;[vdso]&quot; unused DT entry: unknown processor-specific (type 0x70000001=
 arg 0x0) (ignoring)<br>[ =C2=A0 =C2=A01.971090] init: init first stage sta=
rted!<br>[ =C2=A0 =C2=A01.974290] init: ForceNormalBoot::twrp_fastboot: 1<b=
r>[ =C2=A0 =C2=A01.974628] init: ForceNormalBoot::normal_boot: 0<br>[ =C2=
=A0 =C2=A01.976478] init: Unable to open /lib/modules, skipping module load=
ing.<br>[ =C2=A0 =C2=A01.977251] init: ForceNormalBoot::twrp_fastboot: 1<br=
>[ =C2=A0 =C2=A01.977534] init: ForceNormalBoot::normal_boot: 0<br>[ =C2=A0=
 =C2=A01.978174] init: First stage mount skipped (recovery mode)<br>[ =C2=
=A0 =C2=A01.982840] init: [libfs_mgr]ReadFstabFromDt(): failed to read fsta=
b from dt<br>[ =C2=A0 =C2=A01.987898] init: [libfs_mgr]Warning: unknown fla=
g: backup=3D1<br>[ =C2=A0 =C2=A01.988241] init: [libfs_mgr]Warning: unknown=
 flag: wipeingui<br>[ =C2=A0 =C2=A02.002691] printk: init: 6 output lines s=
uppressed due to ratelimiting<br>[ =C2=A0 =C2=A02.016195] linker: Warning: =
&quot;[vdso]&quot; unused DT entry: unknown processor-specific (type 0x7000=
0001 arg 0x0) (ignoring)<br>[ =C2=A0 =C2=A02.016510] WARNING: linker: <br>[=
 =C2=A0 =C2=A02.016604] Warning: &quot;<br>[ =C2=A0 =C2=A02.016752] [vdso]<=
br>[ =C2=A0 =C2=A02.016889] &quot; unused DT entry: <br>[ =C2=A0 =C2=A02.01=
7021] unknown processor-specific<br>[ =C2=A0 =C2=A02.017168] =C2=A0(type <b=
r>[ =C2=A0 =C2=A02.017381] 0x70000001<br>[ =C2=A0 =C2=A02.017512] =C2=A0arg=
 <br>[ =C2=A0 =C2=A02.017647] 0x0<br>[ =C2=A0 =C2=A02.202622] printk: init:=
 2 output lines suppressed due to ratelimiting<br>[ =C2=A0 =C2=A02.208265] =
init: [libfs_mgr]Warning: unknown flag: backup=3D1<br>[ =C2=A0 =C2=A02.2085=
76] init: [libfs_mgr]Warning: unknown flag: wipeingui<br>[ =C2=A0 =C2=A02.2=
08914] init: [libfs_mgr]Warning: unknown flag: backup=3D1<br>[ =C2=A0 =C2=
=A02.209219] init: [libfs_mgr]Warning: unknown flag: wipeingui<br>[ =C2=A0 =
=C2=A02.209836] init: [libfs_mgr]Warning: unknown flag: backup=3D1<br>[ =C2=
=A0 =C2=A02.210125] init: [libfs_mgr]Warning: unknown flag: wipeingui<br>[ =
=C2=A0 =C2=A02.215144] init: Skipping mount of system_ext, system is not dy=
namic.<br>[ =C2=A0 =C2=A02.215880] init: Loading SELinux policy<br>[ =C2=A0=
 =C2=A02.266430] SELinux: =C2=A0Permission nlmsg_getneigh in class netlink_=
route_socket not defined in policy.<br>[ =C2=A0 =C2=A02.266759] SELinux: =
=C2=A0Permission perfmon in class capability2 not defined in policy.<br>[ =
=C2=A0 =C2=A02.266903] SELinux: =C2=A0Permission bpf in class capability2 n=
ot defined in policy.<br>[ =C2=A0 =C2=A02.267119] SELinux: =C2=A0Permission=
 checkpoint_restore in class capability2 not defined in policy.<br>[ =C2=A0=
 =C2=A02.267369] SELinux: =C2=A0Permission perfmon in class cap2_userns not=
 defined in policy.<br>[ =C2=A0 =C2=A02.267524] SELinux: =C2=A0Permission b=
pf in class cap2_userns not defined in policy.<br>[ =C2=A0 =C2=A02.267653] =
SELinux: =C2=A0Permission checkpoint_restore in class cap2_userns not defin=
ed in policy.<br>[ =C2=A0 =C2=A02.267956] SELinux: =C2=A0Class mctp_socket =
not defined in policy.<br>[ =C2=A0 =C2=A02.268106] SELinux: =C2=A0Class ano=
n_inode not defined in policy.<br>[ =C2=A0 =C2=A02.268256] SELinux: =C2=A0C=
lass io_uring not defined in policy.<br>[ =C2=A0 =C2=A02.268386] SELinux: =
=C2=A0Class user_namespace not defined in policy.<br>[ =C2=A0 =C2=A02.26852=
1] SELinux: the above unknown classes and permissions will be denied<br>[ =
=C2=A0 =C2=A02.288331] SELinux: =C2=A0policy capability network_peer_contro=
ls=3D1<br>[ =C2=A0 =C2=A02.288500] SELinux: =C2=A0policy capability open_pe=
rms=3D1<br>[ =C2=A0 =C2=A02.288618] SELinux: =C2=A0policy capability extend=
ed_socket_class=3D1<br>[ =C2=A0 =C2=A02.288751] SELinux: =C2=A0policy capab=
ility always_check_network=3D0<br>[ =C2=A0 =C2=A02.288881] SELinux: =C2=A0p=
olicy capability cgroup_seclabel=3D0<br>[ =C2=A0 =C2=A02.289005] SELinux: =
=C2=A0policy capability nnp_nosuid_transition=3D1<br>[ =C2=A0 =C2=A02.28913=
7] SELinux: =C2=A0policy capability genfs_seclabel_symlinks=3D0<br>[ =C2=A0=
 =C2=A02.289319] SELinux: =C2=A0policy capability ioctl_skip_cloexec=3D0<br=
>[ =C2=A0 =C2=A02.307140] audit: type=3D1403 audit(2.288:2): auid=3D4294967=
295 ses=3D4294967295 lsm=3Dselinux res=3D1<br>[ =C2=A0 =C2=A02.308695] seli=
nux: SELinux: Loaded policy from /sepolicy<br>[ =C2=A0 =C2=A02.308967] seli=
nux: <br>[ =C2=A0 =C2=A02.359528] printk: init: 2 output lines suppressed d=
ue to ratelimiting<br>[ =C2=A0 =C2=A02.556011] init: init second stage star=
ted!<br>[ =C2=A0 =C2=A02.776035] init: Using Android DT directory /proc/dev=
ice-tree/firmware/android/<br>[ =C2=A0 =C2=A02.797264] init: Couldn&#39;t l=
oad property file &#39;/system/etc/prop.default&#39;: open() failed: No suc=
h file or directory: No such file or directory<br>[ =C2=A0 =C2=A02.846779] =
init: Couldn&#39;t load property file &#39;/system/build.prop&#39;: open() =
failed: No such file or directory: No such file or directory<br>[ =C2=A0 =
=C2=A02.847869] init: Couldn&#39;t load property file &#39;/system_ext/buil=
d.prop&#39;: open() failed: No such file or directory: No such file or dire=
ctory<br>[ =C2=A0 =C2=A02.848540] init: Couldn&#39;t load property file &#3=
9;/vendor/default.prop&#39;: open() failed: No such file or directory: No s=
uch file or directory<br>[ =C2=A0 =C2=A02.849165] init: Couldn&#39;t load p=
roperty file &#39;/vendor/build.prop&#39;: open() failed: No such file or d=
irectory: No such file or directory<br>[ =C2=A0 =C2=A02.849830] init: Could=
n&#39;t load property file &#39;/odm/etc/build.prop&#39;: open() failed: No=
 such file or directory: No such file or directory<br>[ =C2=A0 =C2=A02.8505=
46] init: Couldn&#39;t load property file &#39;/product/build.prop&#39;: op=
en() failed: No such file or directory: No such file or directory<br>[ =C2=
=A0 =C2=A02.851394] init: Couldn&#39;t load property file &#39;/factory/fac=
tory.prop&#39;: open() failed: No such file or directory: No such file or d=
irectory<br>[ =C2=A0 =C2=A03.089359] cgroup: Disabled controller &#39;memor=
y&#39;<br>[ =C2=A0 =C2=A03.092460] cgroup: Unknown subsys name &#39;schedtu=
ne&#39;<br>[ =C2=A0 =C2=A03.120187] audit: type=3D1400 audit(3.100:3): avc:=
 =C2=A0denied =C2=A0{ perfmon } for =C2=A0pid=3D1 comm=3D&quot;init&quot; c=
apability=3D38 =C2=A0scontext=3Du:r:init:s0 tcontext=3Du:r:init:s0 tclass=
=3Dcapability2 permissive=3D1<br>[ =C2=A0 =C2=A03.426415] ueventd: ueventd =
started!<br>[ =C2=A0 =C2=A03.448141] selinux: SELinux: Loaded file_contexts=
<br>[ =C2=A0 =C2=A03.448414] selinux: <br>[ =C2=A0 =C2=A03.450283] ueventd:=
 Parsing file /system/etc/ueventd.rc...<br>[ =C2=A0 =C2=A03.455379] ueventd=
: Parsing file /vendor/ueventd.rc...<br>[ =C2=A0 =C2=A03.455868] ueventd: U=
nable to read config file &#39;/vendor/ueventd.rc&#39;: open() failed: No s=
uch file or directory<br>[ =C2=A0 =C2=A03.456438] ueventd: Parsing file /od=
m/ueventd.rc...<br>[ =C2=A0 =C2=A03.456890] ueventd: Unable to read config =
file &#39;/odm/ueventd.rc&#39;: open() failed: No such file or directory<br=
>[ =C2=A0 =C2=A03.457440] ueventd: Parsing file /ueventd.rpi4.rc...<br>[ =
=C2=A0 =C2=A03.457909] ueventd: Unable to read config file &#39;/ueventd.rp=
i4.rc&#39;: open() failed: No such file or directory<br>[ =C2=A0 =C2=A04.69=
9678] audit: type=3D1400 audit(4.684:4): avc: =C2=A0denied =C2=A0{ entrypoi=
nt } for =C2=A0pid=3D96 comm=3D&quot;init&quot; path=3D&quot;/system/bin/lo=
gd&quot; dev=3D&quot;rootfs&quot; ino=3D271 scontext=3Du:r:logd:s0 tcontext=
=3Du:object_r:rootfs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0 =C2=A04.70=
6631] audit: type=3D1400 audit(4.688:5): avc: =C2=A0denied =C2=A0{ map } fo=
r =C2=A0pid=3D96 comm=3D&quot;logd&quot; path=3D&quot;/system/bin/logd&quot=
; dev=3D&quot;rootfs&quot; ino=3D271 scontext=3Du:r:logd:s0 tcontext=3Du:ob=
ject_r:rootfs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0 =C2=A04.707481] a=
udit: type=3D1400 audit(4.688:6): avc: =C2=A0denied =C2=A0{ read } for =C2=
=A0pid=3D96 comm=3D&quot;logd&quot; path=3D&quot;/system/bin/logd&quot; dev=
=3D&quot;rootfs&quot; ino=3D271 scontext=3Du:r:logd:s0 tcontext=3Du:object_=
r:rootfs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0 =C2=A04.708316] audit:=
 type=3D1400 audit(4.688:7): avc: =C2=A0denied =C2=A0{ execute } for =C2=A0=
pid=3D96 comm=3D&quot;logd&quot; path=3D&quot;/system/bin/logd&quot; dev=3D=
&quot;rootfs&quot; ino=3D271 scontext=3Du:r:logd:s0 tcontext=3Du:object_r:r=
ootfs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0 =C2=A04.729108] audit: ty=
pe=3D1400 audit(4.712:8): avc: =C2=A0denied =C2=A0{ getattr } for =C2=A0pid=
=3D96 comm=3D&quot;logd&quot; path=3D&quot;/system/bin/logd&quot; dev=3D&qu=
ot;rootfs&quot; ino=3D271 scontext=3Du:r:logd:s0 tcontext=3Du:object_r:root=
fs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0 =C2=A04.743227] audit: type=
=3D1400 audit(4.724:9): avc: =C2=A0denied =C2=A0{ read } for =C2=A0pid=3D96=
 comm=3D&quot;logd&quot; name=3D&quot;bin&quot; dev=3D&quot;rootfs&quot; in=
o=3D167 scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Ddir=
 permissive=3D1<br>[ =C2=A0 =C2=A04.755432] audit: type=3D1400 audit(4.736:=
10): avc: =C2=A0denied =C2=A0{ open } for =C2=A0pid=3D96 comm=3D&quot;logd&=
quot; path=3D&quot;/system/lib64/libsysutils.so&quot; dev=3D&quot;rootfs&qu=
ot; ino=3D6255 scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclas=
s=3Dfile permissive=3D1<br>[ =C2=A0 =C2=A04.937922] logd: Cannot read /syst=
em/etc/event-log-tags<br>[ =C2=A0 =C2=A04.964388] file system registered<br=
>[ =C2=A0 =C2=A04.969588] logd.auditd: start<br>[ =C2=A0 =C2=A04.970233] lo=
gd.klogd: 4955041232<br>[ =C2=A0 =C2=A05.132743] type=3D1400 audit(5.108:14=
): avc: denied { create } for comm=3D&quot;hwservicemanage&quot; scontext=
=3Du:r:recovery:s0 tcontext=3Du:r:recovery:s0 tclass=3Dnetlink_selinux_sock=
et permissive=3D1<br>[ =C2=A0 =C2=A05.136378] type=3D1400 audit(5.112:15): =
avc: denied { bind } for comm=3D&quot;hwservicemanage&quot; scontext=3Du:r:=
recovery:s0 tcontext=3Du:r:recovery:s0 tclass=3Dnetlink_selinux_socket perm=
issive=3D1<br>[ =C2=A0 =C2=A05.143332] type=3D1400 audit(5.112:16): avc: de=
nied { read } for comm=3D&quot;hwservicemanage&quot; name=3D&quot;perms&quo=
t; dev=3D&quot;selinuxfs&quot; ino=3D67112391 scontext=3Du:r:recovery:s0 tc=
ontext=3Du:object_r:selinuxfs:s0 tclass=3Ddir permissive=3D1<br>[ =C2=A0 =
=C2=A05.146297] type=3D1400 audit(5.112:17): avc: denied { open } for comm=
=3D&quot;hwservicemanage&quot; path=3D&quot;/sys/fs/selinux/class/hwservice=
_manager/perms&quot; dev=3D&quot;selinuxfs&quot; ino=3D67112391 scontext=3D=
u:r:recovery:s0 tcontext=3Du:object_r:selinuxfs:s0 tclass=3Ddir permissive=
=3D1<br>[ =C2=A0 =C2=A05.174030] type=3D1400 audit(5.124:18): avc: denied {=
 write } for comm=3D&quot;hwservicemanage&quot; name=3D&quot;access&quot; d=
ev=3D&quot;selinuxfs&quot; ino=3D6 scontext=3Du:r:recovery:s0 tcontext=3Du:=
object_r:selinuxfs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0 =C2=A05.1774=
77] type=3D1400 audit(5.124:19): avc: denied { compute_av } for comm=3D&quo=
t;hwservicemanage&quot; scontext=3Du:r:recovery:s0 tcontext=3Du:object_r:ke=
rnel:s0 tclass=3Dsecurity permissive=3D1<br>[ =C2=A0 =C2=A05.181388] type=
=3D1400 audit(5.152:20): avc: denied { set_context_mgr } for comm=3D&quot;h=
wservicemanage&quot; scontext=3Du:r:recovery:s0 tcontext=3Du:r:recovery:s0 =
tclass=3Dbinder permissive=3D1<br>WARNING: linker: Warning: &quot;[vdso]&qu=
ot; unused DT entry: unknown processor-specific (type 0x70000001 arg 0x0) (=
ignoring)<br><br>console:/ # <br><br>[ =C2=A0 =C2=A07.812969] init: Service=
 &#39;recovery&#39; (pid 106) received signal 11<br>[ =C2=A0 =C2=A07.813381=
] init: Sending signal 9 to service &#39;recovery&#39; (pid 106) process gr=
oup...<br>[ =C2=A0 =C2=A07.814694] libprocessgroup: Successfully killed pro=
cess cgroup uid 0 pid 106 in 0ms<br>[ =C2=A0 =C2=A07.820960] init: Untracke=
d pid 110 exited with status 1<br>[ =C2=A0 10.206834] init: starting servic=
e &#39;recovery&#39;...<br>[ =C2=A0 10.211672] init: Created socket &#39;/d=
ev/socket/recovery&#39;, mode 422, user 1000, group 1000<br>[ =C2=A0 10.313=
714] init: starting service &#39;adbd&#39;...<br>[ =C2=A0 10.319354] init: =
Created socket &#39;/dev/socket/adbd&#39;, mode 660, user 1000, group 1000<=
br>[ =C2=A0 10.597898] read descriptors<br>[ =C2=A0 10.598630] bcdVersion m=
ust be 0x0100, stored in Little Endian order. Userspace driver should be fi=
xed, accepting 0x0001 for compatibility.<br>[ =C2=A0 10.599621] bcdVersion =
must be 0x0100, stored in Little Endian order. Userspace driver should be f=
ixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 10.600467] read strin=
gs<br>[ =C2=A0 10.613340] init: processing action (sys.usb.config=3Dadb &am=
p;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) from (/syste=
m/etc/init/hw/init.rc:208)<br>[ =C2=A0 10.632907] init: Command &#39;write =
/config/usb_gadget/g1/UDC ${sys.usb.controller}&#39; action=3Dsys.usb.confi=
g=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/=
system/etc/init/hw/init.rc:212) took 1ms and failed: property &#39;sys.usb.=
controller&#39; doesn&#39;t exist while expanding &#39;${sys.usb.controller=
}&#39;<br>[ =C2=A0 11.678635] read descriptors<br>[ =C2=A0 11.678883] bcdVe=
rsion must be 0x0100, stored in Little Endian order. Userspace driver shoul=
d be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 11.679695] bcdV=
ersion must be 0x0100, stored in Little Endian order. Userspace driver shou=
ld be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 11.680663] rea=
d strings<br>[ =C2=A0 11.760913] platform gpio-keys: deferred probe pending=
<br>[ =C2=A0 12.761137] read descriptors<br>[ =C2=A0 12.761449] bcdVersion =
must be 0x0100, stored in Little Endian order. Userspace driver should be f=
ixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 12.761972] bcdVersion=
 must be 0x0100, stored in Little Endian order. Userspace driver should be =
fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 12.762607] read stri=
ngs<br>[ =C2=A0 13.826065] read descriptors<br>[ =C2=A0 13.826428] bcdVersi=
on must be 0x0100, stored in Little Endian order. Userspace driver should b=
e fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 13.827903] bcdVers=
ion must be 0x0100, stored in Little Endian order. Userspace driver should =
be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 13.829154] read s=
trings<br>[ =C2=A0 13.833730] init: processing action (sys.usb.config=3Dadb=
 &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) from (/s=
ystem/etc/init/hw/init.rc:208)<br>[ =C2=A0 13.839092] init: Command &#39;sy=
mlink /config/usb_gadget/g1/functions/ffs.adb /config/usb_gadget/g1/configs=
/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 =
&amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:211) took 0ms=
 and failed: symlink() failed: File exists<br>[ =C2=A0 13.840732] init: Com=
mand &#39;write /config/usb_gadget/g1/UDC ${sys.usb.controller}&#39; action=
=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.=
ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed: proper=
ty &#39;sys.usb.controller&#39; doesn&#39;t exist while expanding &#39;${sy=
s.usb.controller}&#39;<br>[ =C2=A0 14.889512] read descriptors<br>[ =C2=A0 =
14.889701] bcdVersion must be 0x0100, stored in Little Endian order. Usersp=
ace driver should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0=
 14.890177] bcdVersion must be 0x0100, stored in Little Endian order. Users=
pace driver should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=
=A0 14.890767] read strings<br>[ =C2=A0 14.895430] init: processing action =
(sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ff=
s.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 14.900587] =
init: Command &#39;symlink /config/usb_gadget/g1/functions/ffs.adb /config/=
usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; =
sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/=
init.rc:211) took 0ms and failed: symlink() failed: File exists<br>[ =C2=A0=
 14.902076] init: Command &#39;write /config/usb_gadget/g1/UDC ${sys.usb.co=
ntroller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D=
1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0=
ms and failed: property &#39;sys.usb.controller&#39; doesn&#39;t exist whil=
e expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 15.224749] init: st=
arting service &#39;recovery&#39;...<br>[ =C2=A0 15.228494] init: Created s=
ocket &#39;/dev/socket/recovery&#39;, mode 422, user 1000, group 1000<br>[ =
=C2=A0 15.681727] init: Unable to set property &#39;ro.twrp.boot&#39; from =
uid:0 gid:0 pid:124: Read-only property was already set<br>[ =C2=A0 15.6864=
06] init: Unable to set property &#39;ro.twrp.version&#39; from uid:0 gid:0=
 pid:124: Read-only property was already set<br>[ =C2=A0 15.949039] read de=
scriptors<br>[ =C2=A0 15.949240] bcdVersion must be 0x0100, stored in Littl=
e Endian order. Userspace driver should be fixed, accepting 0x0001 for comp=
atibility.<br>[ =C2=A0 15.949733] bcdVersion must be 0x0100, stored in Litt=
le Endian order. Userspace driver should be fixed, accepting 0x0001 for com=
patibility.<br>[ =C2=A0 15.950378] read strings<br>[ =C2=A0 17.016978] read=
 descriptors<br>[ =C2=A0 17.017147] bcdVersion must be 0x0100, stored in Li=
ttle Endian order. Userspace driver should be fixed, accepting 0x0001 for c=
ompatibility.<br>[ =C2=A0 17.017426] bcdVersion must be 0x0100, stored in L=
ittle Endian order. Userspace driver should be fixed, accepting 0x0001 for =
compatibility.<br>[ =C2=A0 17.017781] read strings<br>[ =C2=A0 18.132636] r=
ead descriptors<br>[ =C2=A0 18.133219] bcdVersion must be 0x0100, stored in=
 Little Endian order. Userspace driver should be fixed, accepting 0x0001 fo=
r compatibility.<br>[ =C2=A0 18.134486] bcdVersion must be 0x0100, stored i=
n Little Endian order. Userspace driver should be fixed, accepting 0x0001 f=
or compatibility.<br>[ =C2=A0 18.137501] read strings<br>[ =C2=A0 19.197574=
] read descriptors<br>[ =C2=A0 19.197760] bcdVersion must be 0x0100, stored=
 in Little Endian order. Userspace driver should be fixed, accepting 0x0001=
 for compatibility.<br>[ =C2=A0 19.198136] bcdVersion must be 0x0100, store=
d in Little Endian order. Userspace driver should be fixed, accepting 0x000=
1 for compatibility.<br>[ =C2=A0 19.198665] read strings<br>[ =C2=A0 19.208=
502] init: processing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.confi=
gfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc=
:208)<br>[ =C2=A0 19.214749] init: Command &#39;symlink /config/usb_gadget/=
g1/functions/ffs.adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys=
.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.re=
ady=3D1 (/system/etc/init/hw/init.rc:211) took 0ms and failed: symlink() fa=
iled: File exists<br>[ =C2=A0 19.216726] init: Command &#39;write /config/u=
sb_gadget/g1/UDC ${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &=
amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/et=
c/init/hw/init.rc:212) took 0ms and failed: property &#39;sys.usb.controlle=
r&#39; doesn&#39;t exist while expanding &#39;${sys.usb.controller}&#39;<br=
>[ =C2=A0 20.237060] init: starting service &#39;recovery&#39;...<br>[ =C2=
=A0 20.240672] init: Created socket &#39;/dev/socket/recovery&#39;, mode 42=
2, user 1000, group 1000<br>[ =C2=A0 20.282811] read descriptors<br>[ =C2=
=A0 20.283381] bcdVersion must be 0x0100, stored in Little Endian order. Us=
erspace driver should be fixed, accepting 0x0001 for compatibility.<br>[ =
=C2=A0 20.283889] bcdVersion must be 0x0100, stored in Little Endian order.=
 Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>[=
 =C2=A0 20.284536] read strings<br>[ =C2=A0 20.292396] init: processing act=
ion (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.us=
b.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 20.3005=
13] init: Command &#39;symlink /config/usb_gadget/g1/functions/ffs.adb /con=
fig/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&a=
mp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init=
/hw/init.rc:211) took 0ms and failed: symlink() failed: File exists<br>[ =
=C2=A0 20.302642] init: Command &#39;write /config/usb_gadget/g1/UDC ${sys.=
usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.confi=
gfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) =
took 0ms and failed: property &#39;sys.usb.controller&#39; doesn&#39;t exis=
t while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 20.754865] in=
it: Unable to set property &#39;ro.twrp.boot&#39; from uid:0 gid:0 pid:131:=
 Read-only property was already set<br>[ =C2=A0 20.759553] init: Unable to =
set property &#39;ro.twrp.version&#39; from uid:0 gid:0 pid:131: Read-only =
property was already set<br>[ =C2=A0 21.349790] read descriptors<br>[ =C2=
=A0 21.350005] bcdVersion must be 0x0100, stored in Little Endian order. Us=
erspace driver should be fixed, accepting 0x0001 for compatibility.<br>[ =
=C2=A0 21.350465] bcdVersion must be 0x0100, stored in Little Endian order.=
 Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>[=
 =C2=A0 21.352780] read strings<br>[ =C2=A0 22.423098] read descriptors<br>=
[ =C2=A0 22.423361] bcdVersion must be 0x0100, stored in Little Endian orde=
r. Userspace driver should be fixed, accepting 0x0001 for compatibility.<br=
>[ =C2=A0 22.423651] bcdVersion must be 0x0100, stored in Little Endian ord=
er. Userspace driver should be fixed, accepting 0x0001 for compatibility.<b=
r>[ =C2=A0 22.424144] read strings<br>[ =C2=A0 23.481363] read descriptors<=
br>[ =C2=A0 23.481606] bcdVersion must be 0x0100, stored in Little Endian o=
rder. Userspace driver should be fixed, accepting 0x0001 for compatibility.=
<br>[ =C2=A0 23.482130] bcdVersion must be 0x0100, stored in Little Endian =
order. Userspace driver should be fixed, accepting 0x0001 for compatibility=
.<br>[ =C2=A0 23.482813] read strings<br>[ =C2=A0 24.553075] read descripto=
rs<br>[ =C2=A0 24.553241] bcdVersion must be 0x0100, stored in Little Endia=
n order. Userspace driver should be fixed, accepting 0x0001 for compatibili=
ty.<br>[ =C2=A0 24.553597] bcdVersion must be 0x0100, stored in Little Endi=
an order. Userspace driver should be fixed, accepting 0x0001 for compatibil=
ity.<br>[ =C2=A0 24.553975] read strings<br>[ =C2=A0 24.558331] init: proce=
ssing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&am=
p; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=
=A0 24.563898] init: Command &#39;symlink /config/usb_gadget/g1/functions/f=
fs.adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3D=
adb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/syst=
em/etc/init/hw/init.rc:211) took 0ms and failed: symlink() failed: File exi=
sts<br>[ =C2=A0 24.565567] init: Command &#39;write /config/usb_gadget/g1/U=
DC ${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.=
usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init=
.rc:212) took 0ms and failed: property &#39;sys.usb.controller&#39; doesn&#=
39;t exist while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 25.2=
48962] init: starting service &#39;recovery&#39;...<br>[ =C2=A0 25.253276] =
init: Created socket &#39;/dev/socket/recovery&#39;, mode 422, user 1000, g=
roup 1000<br>[ =C2=A0 25.641207] read descriptors<br>[ =C2=A0 25.641328] bc=
dVersion must be 0x0100, stored in Little Endian order. Userspace driver sh=
ould be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 25.641616] b=
cdVersion must be 0x0100, stored in Little Endian order. Userspace driver s=
hould be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 25.642040] =
read strings<br>[ =C2=A0 25.648473] init: processing action (sys.usb.config=
=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) fr=
om (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 25.669450] init: Command &=
#39;symlink /config/usb_gadget/g1/functions/ffs.adb /config/usb_gadget/g1/c=
onfigs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configf=
s=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:211) to=
ok 1ms and failed: symlink() failed: File exists<br>[ =C2=A0 25.672542] ini=
t: Command &#39;write /config/usb_gadget/g1/UDC ${sys.usb.controller}&#39; =
action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sy=
s.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed: =
property &#39;sys.usb.controller&#39; doesn&#39;t exist while expanding &#3=
9;${sys.usb.controller}&#39;<br>[ =C2=A0 25.706240] init: Unable to set pro=
perty &#39;ro.twrp.boot&#39; from uid:0 gid:0 pid:139: Read-only property w=
as already set<br>[ =C2=A0 25.710372] init: Unable to set property &#39;ro.=
twrp.version&#39; from uid:0 gid:0 pid:139: Read-only property was already =
set<br>[ =C2=A0 26.709759] read descriptors<br>[ =C2=A0 26.710096] bcdVersi=
on must be 0x0100, stored in Little Endian order. Userspace driver should b=
e fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 26.710921] bcdVers=
ion must be 0x0100, stored in Little Endian order. Userspace driver should =
be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 26.712463] read s=
trings<br>[ =C2=A0 27.782228] read descriptors<br>[ =C2=A0 27.782350] bcdVe=
rsion must be 0x0100, stored in Little Endian order. Userspace driver shoul=
d be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 27.782569] bcdV=
ersion must be 0x0100, stored in Little Endian order. Userspace driver shou=
ld be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 27.782877] rea=
d strings<br>[ =C2=A0 28.849863] read descriptors<br>[ =C2=A0 28.850115] bc=
dVersion must be 0x0100, stored in Little Endian order. Userspace driver sh=
ould be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 28.850775] b=
cdVersion must be 0x0100, stored in Little Endian order. Userspace driver s=
hould be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 28.852359] =
read strings<br>[ =C2=A0 29.942409] read descriptors<br>[ =C2=A0 29.942646]=
 bcdVersion must be 0x0100, stored in Little Endian order. Userspace driver=
 should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 29.943232=
] bcdVersion must be 0x0100, stored in Little Endian order. Userspace drive=
r should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 29.94374=
6] read strings<br>[ =C2=A0 29.949390] init: processing action (sys.usb.con=
fig=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1)=
 from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 29.955577] init: Comman=
d &#39;symlink /config/usb_gadget/g1/functions/ffs.adb /config/usb_gadget/g=
1/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.conf=
igfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:211)=
 took 0ms and failed: symlink() failed: File exists<br>[ =C2=A0 29.957043] =
init: Command &#39;write /config/usb_gadget/g1/UDC ${sys.usb.controller}&#3=
9; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp;=
 sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and faile=
d: property &#39;sys.usb.controller&#39; doesn&#39;t exist while expanding =
&#39;${sys.usb.controller}&#39;<br>[ =C2=A0 30.268078] init: starting servi=
ce &#39;recovery&#39;...<br>[ =C2=A0 30.286298] init: Created socket &#39;/=
dev/socket/recovery&#39;, mode 422, user 1000, group 1000<br>[ =C2=A0 30.72=
6944] init: Unable to set property &#39;ro.twrp.boot&#39; from uid:0 gid:0 =
pid:147: Read-only property was already set<br>[ =C2=A0 30.731529] init: Un=
able to set property &#39;ro.twrp.version&#39; from uid:0 gid:0 pid:147: Re=
ad-only property was already set<br>[ =C2=A0 31.017959] read descriptors<br=
>[ =C2=A0 31.018182] bcdVersion must be 0x0100, stored in Little Endian ord=
er. Userspace driver should be fixed, accepting 0x0001 for compatibility.<b=
r>[ =C2=A0 31.018669] bcdVersion must be 0x0100, stored in Little Endian or=
der. Userspace driver should be fixed, accepting 0x0001 for compatibility.<=
br>[ =C2=A0 31.019885] read strings<br>[ =C2=A0 31.028871] init: processing=
 action (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sy=
s.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 31.=
037564] init: Command &#39;symlink /config/usb_gadget/g1/functions/ffs.adb =
/config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &am=
p;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/=
init/hw/init.rc:211) took 0ms and failed: symlink() failed: File exists<br>=
[ =C2=A0 31.039173] init: Command &#39;write /config/usb_gadget/g1/UDC ${sy=
s.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.con=
figfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212=
) took 0ms and failed: property &#39;sys.usb.controller&#39; doesn&#39;t ex=
ist while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 32.092703] =
read descriptors<br>[ =C2=A0 32.093392] bcdVersion must be 0x0100, stored i=
n Little Endian order. Userspace driver should be fixed, accepting 0x0001 f=
or compatibility.<br>[ =C2=A0 32.093996] bcdVersion must be 0x0100, stored =
in Little Endian order. Userspace driver should be fixed, accepting 0x0001 =
for compatibility.<br>[ =C2=A0 32.095530] read strings<br>[ =C2=A0 33.14964=
2] read descriptors<br>[ =C2=A0 33.149854] bcdVersion must be 0x0100, store=
d in Little Endian order. Userspace driver should be fixed, accepting 0x000=
1 for compatibility.<br>[ =C2=A0 33.150334] bcdVersion must be 0x0100, stor=
ed in Little Endian order. Userspace driver should be fixed, accepting 0x00=
01 for compatibility.<br>[ =C2=A0 33.150887] read strings<br>[ =C2=A0 34.23=
0547] read descriptors<br>[ =C2=A0 34.230852] bcdVersion must be 0x0100, st=
ored in Little Endian order. Userspace driver should be fixed, accepting 0x=
0001 for compatibility.<br>[ =C2=A0 34.233227] bcdVersion must be 0x0100, s=
tored in Little Endian order. Userspace driver should be fixed, accepting 0=
x0001 for compatibility.<br>[ =C2=A0 34.234420] read strings<br>[ =C2=A0 35=
.301592] init: starting service &#39;recovery&#39;...<br>[ =C2=A0 35.319970=
] init: Created socket &#39;/dev/socket/recovery&#39;, mode 422, user 1000,=
 group 1000<br>[ =C2=A0 35.320441] read descriptors<br>[ =C2=A0 35.320589] =
bcdVersion must be 0x0100, stored in Little Endian order. Userspace driver =
should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 35.321087]=
 bcdVersion must be 0x0100, stored in Little Endian order. Userspace driver=
 should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 35.322062=
] read strings<br>[ =C2=A0 35.382841] init: processing action (sys.usb.conf=
ig=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) =
from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 35.391787] init: Command=
 &#39;symlink /config/usb_gadget/g1/functions/ffs.adb /config/usb_gadget/g1=
/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.confi=
gfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:211) =
took 0ms and failed: symlink() failed: File exists<br>[ =C2=A0 35.393645] i=
nit: Command &#39;write /config/usb_gadget/g1/UDC ${sys.usb.controller}&#39=
; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; =
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
: property &#39;sys.usb.controller&#39; doesn&#39;t exist while expanding &=
#39;${sys.usb.controller}&#39;<br>[ =C2=A0 35.785517] init: Unable to set p=
roperty &#39;ro.twrp.boot&#39; from uid:0 gid:0 pid:156: Read-only property=
 was already set<br>[ =C2=A0 35.789909] init: Unable to set property &#39;r=
o.twrp.version&#39; from uid:0 gid:0 pid:156: Read-only property was alread=
y set<br>[ =C2=A0 36.421841] read descriptors<br>[ =C2=A0 36.422877] bcdVer=
sion must be 0x0100, stored in Little Endian order. Userspace driver should=
 be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 36.426638] bcdVe=
rsion must be 0x0100, stored in Little Endian order. Userspace driver shoul=
d be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 36.427376] read=
 strings<br>[ =C2=A0 36.432055] init: processing action (sys.usb.config=3Da=
db &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) from (=
/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 36.438294] init: Command &#39;=
symlink /config/usb_gadget/g1/functions/ffs.adb /config/usb_gadget/g1/confi=
gs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D=
1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:211) took 0=
ms and failed: symlink() failed: File exists<br>[ =C2=A0 36.440095] init: C=
ommand &#39;write /config/usb_gadget/g1/UDC ${sys.usb.controller}&#39; acti=
on=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.us=
b.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed: prop=
erty &#39;sys.usb.controller&#39; doesn&#39;t exist while expanding &#39;${=
sys.usb.controller}&#39;<br>[ =C2=A0 37.502771] read descriptors<br>[ =C2=
=A0 37.502908] bcdVersion must be 0x0100, stored in Little Endian order. Us=
erspace driver should be fixed, accepting 0x0001 for compatibility.<br>[ =
=C2=A0 37.503568] bcdVersion must be 0x0100, stored in Little Endian order.=
 Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>[=
 =C2=A0 37.504160] read strings<br>[ =C2=A0 38.575803] read descriptors<br>=
[ =C2=A0 38.576299] bcdVersion must be 0x0100, stored in Little Endian orde=
r. Userspace driver should be fixed, accepting 0x0001 for compatibility.<br=
>[ =C2=A0 38.577608] bcdVersion must be 0x0100, stored in Little Endian ord=
er. Userspace driver should be fixed, accepting 0x0001 for compatibility.<b=
r>[ =C2=A0 38.578173] read strings<br><br>|console:/ # <br><br>[ =C2=A0 39.=
633521] read descriptors<br>[ =C2=A0 39.633726] bcdVersion must be 0x0100, =
stored in Little Endian order. Userspace driver should be fixed, accepting =
0x0001 for compatibility.<br>[ =C2=A0 39.634107] bcdVersion must be 0x0100,=
 stored in Little Endian order. Userspace driver should be fixed, accepting=
 0x0001 for compatibility.<br>[ =C2=A0 39.634647] read strings<br>[ =C2=A0 =
40.334108] init: starting service &#39;recovery&#39;...<br>[ =C2=A0 40.3380=
87] init: Created socket &#39;/dev/socket/recovery&#39;, mode 422, user 100=
0, group 1000<br>[ =C2=A0 40.721751] read descriptors<br>[ =C2=A0 40.721951=
] bcdVersion must be 0x0100, stored in Little Endian order. Userspace drive=
r should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 40.72241=
5] bcdVersion must be 0x0100, stored in Little Endian order. Userspace driv=
er should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 40.7231=
79] read strings<br>[ =C2=A0 40.729072] init: processing action (sys.usb.co=
nfig=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1=
) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 40.742406] init: Comma=
nd &#39;symlink /config/usb_gadget/g1/functions/ffs.adb /config/usb_gadget/=
g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.con=
figfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:211=
) took 0ms and failed: symlink() failed: File exists<br>[ =C2=A0 40.745270]=
 init: Command &#39;write /config/usb_gadget/g1/UDC ${sys.usb.controller}&#=
39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp=
; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and fail=
ed: property &#39;sys.usb.controller&#39; doesn&#39;t exist while expanding=
 &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 40.789765] init: Unable to set=
 property &#39;ro.twrp.boot&#39; from uid:0 gid:0 pid:164: Read-only proper=
ty was already set<br>[ =C2=A0 40.793898] init: Unable to set property &#39=
;ro.twrp.version&#39; from uid:0 gid:0 pid:164: Read-only property was alre=
ady set<br>[ =C2=A0 41.794291] read descriptors<br>[ =C2=A0 41.794526] bcdV=
ersion must be 0x0100, stored in Little Endian order. Userspace driver shou=
ld be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 41.795504] bcd=
Version must be 0x0100, stored in Little Endian order. Userspace driver sho=
uld be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 41.796355] re=
ad strings<br>[ =C2=A0 41.802136] init: processing action (sys.usb.config=
=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) fr=
om (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 41.807484] init: Command &=
#39;symlink /config/usb_gadget/g1/functions/ffs.adb /config/usb_gadget/g1/c=
onfigs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configf=
s=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:211) to=
ok 0ms and failed: symlink() failed: File exists<br>[ =C2=A0 41.809032] ini=
t: Command &#39;write /config/usb_gadget/g1/UDC ${sys.usb.controller}&#39; =
action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sy=
s.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed: =
property &#39;sys.usb.controller&#39; doesn&#39;t exist while expanding &#3=
9;${sys.usb.controller}&#39;<br>[ =C2=A0 42.865948] read descriptors<br>[ =
=C2=A0 42.866163] bcdVersion must be 0x0100, stored in Little Endian order.=
 Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>[=
 =C2=A0 42.866523] bcdVersion must be 0x0100, stored in Little Endian order=
. Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>=
[ =C2=A0 42.866910] read strings<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 27, 2024 at 3:04=E2=80=AFPM=
 Mario Marietto &lt;<a href=3D"mailto:marietto2008@gmail.com" target=3D"_bl=
ank">marietto2008@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello to everyone.</div><d=
iv><br></div><div>As I said before,some years ago I was able to emulate And=
roid on my Jetson Nano. It was a special version of Android,prepared by ant=
micro and the github is located here :</div><div><br></div><div><a href=3D"=
https://github.com/antmicro/kvm-aosp-jetson-nano" target=3D"_blank">https:/=
/github.com/antmicro/kvm-aosp-jetson-nano</a></div><div><br></div><div>I wo=
uld like to compile it again and try to emulate it on my Jetson Nano again =
and on my Intel PC + Ubuntu 24.04 x64 bit. <br></div><div>I followed the tu=
torial again and I&#39;ve been able to create the Android img files below w=
ithout problems :<br></div><div><pre><code><br>out/target/product/generic_a=
rm64/vendor.img
out/target/product/generic_arm64/system.img
out/target/product/generic_arm64/userdata.img
out/target/product/generic_arm64/ramdisk.img<br><br></code></pre><div>Now I=
 need the kernel,so I tried to fetch the kernel sources to compile it. Unfo=
rtunately the github is old and some links are broken. <br></div><div>I wan=
t to ask your help to fix the broken link as better as possible :</div><div=
><br></div><div><blockquote><span style=3D"font-family:monospace">root@Z390=
-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo init -u <a href=3D"https://andr=
oid.googlesource.com/kernel" target=3D"_blank">https://android.googlesource=
.com/kernel</a></span><span style=3D"font-family:monospace">/manifest -b q-=
common-android-4.14
</span></blockquote><blockquote><span style=3D"font-family:monospace">Downl=
oading Repo source from <a href=3D"https://gerrit.googlesource.com/git-repo=
" target=3D"_blank">https://gerrit.googlesource.com/git-repo</a>
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">Your identity is: ziomario=
 &lt;<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">marietto20=
08@gmail.com</a>&gt;
</span><br><span style=3D"font-family:monospace">If you want to change this=
, please re-run &#39;repo init&#39; with --config-name
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace"></span></blockquote><block=
quote><span style=3D"font-family:monospace">repo has been initialized in /m=
nt/sdl1/aosp_kernel<br><br></span></blockquote><blockquote><span style=3D"f=
ont-family:monospace">
</span></blockquote><blockquote><span style=3D"font-family:monospace"></spa=
n></blockquote><blockquote><span style=3D"font-family:monospace">root@Z390-=
AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
</span><br><span style=3D"font-family:monospace"></span></blockquote><block=
quote><span style=3D"font-family:monospace"><br></span></blockquote><blockq=
uote><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/8) 0:07 | =
2 jobs | 0:05 kernel/build @ buildRicezione degli oggetti: =C2=A084% (14706=
/17</span></blockquote><blockquote><span style=3D"font-family:monospace"></=
span></blockquote><blockquote><span style=3D"font-family:monospace">Fetchin=
g: =C2=A00% (0/8) 0:07 | 2 jobs | 0:06 kernel/build @ buildRicezione degli =
oggetti: =C2=A085% (14881/17</span><br><span style=3D"font-family:monospace=
">Ricezione degli oggetti: 100% (17506/17506), 12.23 MiB | 46.57 MiB/s, fat=
to.
</span><br><span style=3D"font-family:monospace">Risoluzione dei delta: 100=
% (8869/8869), fatto.
</span><br><span style=3D"font-family:monospace">Fetching: 50% (4/8) 9:11 |=
 1 job | 9:01 kernel/common @ commonRicezione degli oggetti: =C2=A0=C2=A00%=
 (1/12468</span><br><span style=3D"font-family:monospace">Fetching: 50% (4/=
8) 9:12 | 1 job | 9:02 kernel/common @ commonRicezione degli oggetti: =C2=
=A0=C2=A00% (80382/1</span><br><span style=3D"font-family:monospace">Fetchi=
ng: 50% (4/8) 9:12 | 1 job | 9:03 kernel/common @ commonRicezione degli ogg=
etti: =C2=A0=C2=A01% (124682/</span><br><span style=3D"font-family:monospac=
e">Fetching: 50% (4/8) 9:13 | 1 job | 9:03 kernel/common @ commonRicezione =
degli oggetti: =C2=A0=C2=A01% (163592/</span><br><span style=3D"font-family=
:monospace">Fetching: 50% (4/8) 9:14 | 1 job | 9:04 kernel/common @ commonR=
icezione degli oggetti: =C2=A0=C2=A01% (245123/</span><br><span style=3D"fo=
nt-family:monospace">Fetching: 50% (4/8) 9:15 | 1 job | 9:05 kernel/common =
@ commonRicezione degli oggetti: =C2=A0=C2=A02% (333147/</span><br><span st=
yle=3D"font-family:monospace">Fetching: 50% (4/8) 9:15 | 1 job | 9:06 kerne=
l/common @ commonRicezione degli oggetti: =C2=A0=C2=A03% (374044/</span><br=
><span style=3D"font-family:monospace">.....</span><br><span style=3D"font-=
family:monospace">Fetching: 50% (4/8) 12:06 | 1 job | 11:57 kernel/common @=
 commonRisoluzione dei delta: =C2=A098% (1023355</span><br><span style=3D"f=
ont-family:monospace">Fetching: 50% (4/8) 12:07 | 1 job | 11:58 kernel/comm=
on @ commonRisoluzione dei delta: =C2=A099% (1028207</span><br><span style=
=3D"font-family:monospace">Fetching: 50% (4/8) 12:08 | 1 job | 11:59 kernel=
/common @ commonRisoluzione dei delta: 100% (1034277</span><br><span style=
=3D"font-family:monospace">Risoluzione dei delta: 100% (10342775/10342775),=
 fatto.
</span><br><span style=3D"font-family:monospace"></span></blockquote><block=
quote><span style=3D"font-family:monospace">Fetching: 50% (4/8) 13:44 | 1 j=
ob | 13:34 kernel/common @ common</span></blockquote><blockquote><span styl=
e=3D"font-family:monospace"><br></span></blockquote><blockquote><span style=
=3D"font-family:monospace"></span></blockquote><blockquote><span style=3D"f=
ont-family:monospace">fatal: can&#39;t find remote refs/heads/android-4.14-=
q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace"></span><br><span style=3D"=
font-family:monospace">kernel/common: sleeping 4.0 seconds before retrying
</span><br><span style=3D"font-family:monospace"></span><br><span style=3D"=
font-family:monospace"><span style=3D"color:rgb(178,24,24);background-color=
:rgb(255,255,255)">error: Cannot fetch kernel/common from <a href=3D"https:=
//android.googlesource.com/kernel/common" target=3D"_blank">https://android=
.googlesource.com/kernel/common</a></span><span style=3D"color:rgb(0,0,0);b=
ackground-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace"></span></blockquote=
><blockquote><span style=3D"font-family:monospace"><br></span></blockquote>=
<blockquote><span style=3D"font-family:monospace">Fetching: 50% (4/8) 13:45=
 | 1 job | 0:01 kernel/tests @ kernel/tests</span></blockquote><blockquote>=
<span style=3D"font-family:monospace">Ricezione degli oggetti: =C2=A0=C2=A0=
</span></blockquote><blockquote><span style=3D"font-family:monospace"><br><=
/span></blockquote><blockquote><span style=3D"font-family:monospace"></span=
></blockquote><blockquote><span style=3D"font-family:monospace">Ricezione d=
egli oggetti: 100% (11797/11797), 4.91 MiB | 48.34 MiB/s, fatto.
</span><br><span style=3D"font-family:monospace">Risoluzione dei delta: 100=
% (2123/2123), fatto.
</span><br><span style=3D"font-family:monospace">Fetching: 100% (8/8), done=
 in 18m26.961s
</span><br><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/1) 0=
:04 | 1 job | 0:04 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (1/1=
), done in 5.046s
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot checkout kernel/=
common: ManifestInvalidRevisionError: revision android-4.14-q in kerne</spa=
n>l/common not found<span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">
</span></span><br><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(178,24,24);background-color:rgb(255,255,255)">error: in `sync`: revis=
ion android-4.14-q in kernel/common not found</span><span style=3D"color:rg=
b(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">root@Z390-AORUS-PRO=
-DEST:/mnt/sdl1/aosp_kernel# repo sync
</span><br><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/8) 0=
:09 | 2 jobs | 0:07 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (8/8=
), done in 12.927s
</span><br><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/1) 0=
:04 | 1 job | 0:04 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (1/1=
), done in 5.008s
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot checkout kernel/=
common: ManifestInvalidRevisionError: revision android-4.14-q in kerne</spa=
n>l/common not found<span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">
</span></span><br><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(178,24,24);background-color:rgb(255,255,255)">error: in `sync`: revis=
ion android-4.14-q in kernel/common not found</span><span style=3D"color:rg=
b(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">root@Z390-AORUS-PRO=
-DEST:/mnt/sdl1/aosp_kernel# repo sync
</span><br><span style=3D"font-family:monospace">Fetching: 50% (4/8) 0:04 |=
 1 job | 0:03 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">
</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (8/8=
), done in 5.696s
</span><br><span style=3D"font-family:monospace">Fetching: =C2=A00% (0/1) 0=
:04 | 1 job | 0:04 kernel/common @ common
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q

</span><br><span style=3D"font-family:monospace">kernel/common:
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace">kernel/common: sleeping 4.=
0 seconds before retrying
</span><br><span style=3D"font-family:monospace">fatal: impossibile trovare=
 il riferimento remoto refs/heads/android-4.14-q
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot fetch kernel/com=
mon from <a href=3D"https://android.googlesource.com/kernel/common" target=
=3D"_blank">https://android.googlesource.com/kernel/common</a></span><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span></span><br><span style=3D"font-family:monospace">Fetching: 100% (1/1=
), done in 4.930s
</span><br><span style=3D"font-family:monospace"><span style=3D"color:rgb(1=
78,24,24);background-color:rgb(255,255,255)">error: Cannot checkout kernel/=
common: ManifestInvalidRevisionError: revision android-4.14-q in kerne</spa=
n>l/common not found<span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">
</span></span><br><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(178,24,24);background-color:rgb(255,255,255)">error: in `sync`: revis=
ion android-4.14-q in kernel/common not found</span></span></blockquote></d=
iv><div>thanks.<br></div><pre></pre></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 25, 2024 at 5:58=E2=
=80=AFPM Mario Marietto &lt;<a href=3D"mailto:marietto2008@gmail.com" targe=
t=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>ok,I&#39;ve unders=
tood that initrd is ramdisk.img,so : <br></div><div><br></div><div>qemu-sys=
tem-aarch64 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a72 \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -machine virt \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
-initrd /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Konsta=
KANG-rpi4-atv/boot/ramdisk.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mn=
t/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-a=
tv/boot/Image \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-gpu-pci,xres=
=3D1024,yres=3D768 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -display sdl,gl=3Don \<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -device usb-kbd \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-tabl=
et-pci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -serial stdio \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D0,if=3Dno=
ne,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNO=
FFICIAL-KonstaKANG-rpi4-atv/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv.img,format=3Draw,index=3D0,media=3Ddisk \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdela=
y=3D5 root=3D/dev/vdd1 rw&quot;</div><div><br></div><div>=3D=3D=3D=3D=3D=3D=
&gt;<br></div><div><span style=3D"font-family:monospace"><span style=3D"col=
or:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></span></div><d=
iv><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);ba=
ckground-color:rgb(255,255,255)">[ =C2=A0=C2=A0=C2=A02.862352] Run /init as=
 init process
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">[ =C2=A0=C2=A0=C2=A03.119264] magisk=
init: open /proc/bootconfig failed with 2: No such file or directory
<br>[ =C2=A0=C2=A0=C2=A04.741230] init: init first stage started!
<br>[ =C2=A0=C2=A0=C2=A04.754789] init: Unable to open /lib/modules, skippi=
ng module loading.
<br>[ =C2=A0=C2=A0=C2=A04.788159] init: Copied ramdisk prop to /second_stag=
e_resources/system/etc/ramdisk/build.prop
<br>[ =C2=A0=C2=A0=C2=A04.804110] init: [libfstab] Using Android DT directo=
ry /proc/device-tree/firmware/android/
<br>[ =C2=A0=C2=A0=C2=A04.811371] init: [libfstab] ReadFstabFromDt(): faile=
d to read fstab from dt
<br>[ =C2=A0=C2=A0=C2=A04.825409] init: [libfstab] ReadDefaultFstab(): fail=
ed to find device default fstab
<br>[ =C2=A0=C2=A0=C2=A04.828176] init: Failed to create FirstStageMount : =
failed to read default fstab for first stage mount
<br>[ =C2=A0=C2=A0=C2=A04.831564] init: FirstStageMount not available
<br>[ =C2=A0=C2=A0=C2=A04.890952] init: InitFatalReboot: signal 6
<br>[ =C2=A0=C2=A0=C2=A05.063207] init: =C2=A0=C2=A0#00 pc 00000000003b7764=
 =C2=A0/init (unwindstack::AndroidLocalUnwinder::InternalUnwind(std::__1::o=
ptional&lt;int&gt;, unwin<br>dstack::AndroidUnwinderData&amp;)+96) (BuildId=
: 48bce72d2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.064741] init: =C2=A0=C2=A0#01 pc 00000000003ab4b8=
 =C2=A0/init (android::init::InitFatalReboot(int)+204) (BuildId: 48bce72d2f=
0c6e6c34530a67b6b7b<br>3be)
<br>[ =C2=A0=C2=A0=C2=A05.066931] init: =C2=A0=C2=A0#02 pc 00000000003abb48=
 =C2=A0/init (android::init::InstallRebootSignalHandlers()::$_0::__invoke(i=
nt)+32) (BuildId: 4<br>8bce72d2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.068545] init: =C2=A0=C2=A0#03 pc 0000000000000854=
 =C2=A0[vdso]
<br>[ =C2=A0=C2=A0=C2=A05.069555] init: =C2=A0=C2=A0#04 pc 000000000035285c=
 =C2=A0/init (abort+164) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.072153] init: =C2=A0=C2=A0#05 pc 00000000003b029c=
 =C2=A0/init (android::init::InitAborter(char const*)+44) (BuildId: 48bce72=
d2f0c6e6c34530a67b6<br>b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.075216] init: =C2=A0=C2=A0#06 pc 00000000003131d0=
 =C2=A0/init (android::base::SetAborter(std::__1::function&lt;void (char co=
nst*)&gt;&amp;&amp;)::$_0::__invo<br>ke(char const*)+80) (BuildId: 48bce72d=
2f0c6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.077609] init: =C2=A0=C2=A0#07 pc 00000000003128f4=
 =C2=A0/init (android::base::LogMessage::~LogMessage()+356) (BuildId: 48bce=
72d2f0c6e6c34530a67<br>b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.079506] init: =C2=A0=C2=A0#08 pc 00000000003a1ec0=
 =C2=A0/init (android::init::FirstStageMain(int, char**)+13140) (BuildId: 4=
8bce72d2f0c6e6c3453<br>0a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.081404] init: =C2=A0=C2=A0#09 pc 0000000000350e9c=
 =C2=A0/init (__real_libc_init(void*, void (*)(), int (*)(int, char**, char=
**), structors_arra<br>y_t const*, bionic_tcb*)+688) (BuildId: 48bce72d2f0c=
6e6c34530a67b6b7b3be)
<br>[ =C2=A0=C2=A0=C2=A05.083648] init: Reboot ending, jumping to kernel
<br>[ =C2=A0=C2=A0=C2=A05.091556] reboot: Restarting system with command &#=
39;bootloader&#39;<br>
<br><br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 25, 2024 at 3:31=E2=80=AFPM Mario Marietto &lt;=
<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div>The file below is called config.txt and it&#39=
;s available only if=20
Android is installed physically. I don&#39;t see it when I unpack the main=
=20
img file. Probably it is embedded inside the file 0.fat,or 1.img,who=20
knows. Anyway,Is useful to understand what&#39;s the name of the initrd=20
file. Actually I tried to use 0.fat,but I think it&#39;s wrong. Can you giv=
e
 a look at the file below and tell me if it could be &quot;ramdisk.img&quot=
; ? <br></div><div><br></div><div># Kernel</div>arm_64bit=3D1<br>kernel=3DI=
mage<br><br># Ramdisk<br>gpio=3D21=3Dip,pu<br>[gpio21=3D1]<br>initramfs ram=
disk.img followkernel<br>[gpio21=3D0]<br>initramfs ramdisk-recovery.img fol=
lowkernel<br>[all]<br><br># Audio<br>dtparam=3Daudio=3Don<br><br># Audio DA=
C<br>#dtoverlay=3Dallo-boss-dac-pcm512x-audio<br>#dtoverlay=3Dallo-piano-da=
c-pcm512x-audio<br>#dtoverlay=3Dallo-piano-dac-plus-pcm512x-audio<br>#dtove=
rlay=3Dhifiberry-dacplus<br>#dtoverlay=3Di-sabre-q2m<br>#dtoverlay=3Diqaudi=
o-dac<br>#dtoverlay=3Djustboom-dac<br><br># Boot device<br>dtoverlay=3Dandr=
oid-sdcard<br>#dtoverlay=3Dandroid-usb<br>#dtoverlay=3Dandroid-nvme<br><br>=
# Camera<br>camera_auto_detect=3D1<br>start_x=3D1<br><br># CPU<br>arm_boost=
=3D1<br>#arm_freq=3D1500<br><br># Display<br>disable_overscan=3D1<br><br># =
Display panel<br>[gpio21=3D1]<br>#dtoverlay=3Dcutiepi-panel<br>#dtoverlay=
=3Dvc4-kms-dsi-7inch<br>#dtoverlay=3Dvc4-kms-dsi-lt070me05000<br>#dtoverlay=
=3Dvc4-kms-dsi-lt070me05000-v2<br>[all]<br>#dtoverlay=3Drpi-backlight<br><b=
r># Fan<br>#dtoverlay=3Dgpio-fan<br>#dtoverlay=3Di2c-fan<br>#dtoverlay=3Drp=
i-poe<br>#dtoverlay=3Drpi-poe-plus<br><br># Graphics acceleration<br>disabl=
e_fw_kms_setup=3D1<br>[gpio21=3D1]<br>dtoverlay=3Dvc4-kms-v3d<br>[all]<br><=
br># I2C<br>dtparam=3Di2c_arm=3Don<br><br># I2S<br>#dtparam=3Di2s=3Don<br><=
br># IR<br>#dtoverlay=3Dgpio-ir,gpio_pin=3D18<br><br># Keys<br>#dtoverlay=
=3Dgpio-key,gpio=3D21,keycode=3D116,label=3D&quot;POWER&quot;<br>#dtoverlay=
=3Dgpio-key,gpio=3D26,keycode=3D115,label=3D&quot;VOLUME_UP&quot;<br>#dtove=
rlay=3Dgpio-key,gpio=3D20,keycode=3D114,label=3D&quot;VOLUME_DOWN&quot;<br>=
<br># RTC<br>dtoverlay=3Di2c-rtc,ds3231<br><br># Sensors<br>#dtoverlay=3Dan=
droid-i2c-sensor,mpu6050<br><br># Serial console<br>#enable_uart=3D1<br><br=
># SPI<br>dtparam=3Dspi=3Don<br><br># Touchscreen<br>#dtoverlay=3Dads7846,c=
s=3D1,penirq=3D25,penirq_pull=3D2,speed=3D50000,keep_vref_on=3D0,swapxy=3D0=
,pmax=3D255,xohms=3D150,xmin=3D200,xmax=3D3900,ymin=3D200,ymax=3D3900<br>#d=
toverlay=3Dedt-ft5406<br>#dtoverlay=3Dgoodix<br>#dtoverlay=3Drpi-ft5406<br>=
<br># USB<br>dtoverlay=3Ddwc2,dr_mode=3Dperipheral<br>[cm4]<br>dtoverlay=3D=
dwc2,dr_mode=3Dotg<br>[all]<br><br>include config_user.txt</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 25, 2=
024 at 2:44=E2=80=AFPM Mario Marietto &lt;<a href=3D"mailto:marietto2008@gm=
ail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Appe=
nding the root device does not change the scenario :</div><div><br></div><d=
iv>qemu-system-aarch64 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-a=
72 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -machine virt \<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -serial stdio \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd /mnt/zroot2/=
zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/0.fat =
\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mnt/zroot2/zroot2/OS/Linux/lineag=
e-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0 roo=
twait rootdelay=3D5 root=3D/dev/vdd1 rw&quot;</div><div><br></div><div><br>=
</div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(0=
,0,0);background-color:rgb(255,255,255)">[ =C2=A0=C2=A0=C2=A00.000000] Boot=
ing Linux on physical CPU 0x0000000000 [0x410fd083]
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace">[ =C2=A0=C2=A0=C2=A00.000000] Linux =
version 6.6.36-g01aac93821d2-v8 (kleaf@build-host) (Android (11368308, +pgo=
, +bolt, +lto, +mlgo, based on r510928)<br> clang version 18.0.0 (<a href=
=3D"https://android.googlesource.com/toolchain/llvm-project" target=3D"_bla=
nk">https://android.googlesource.com/toolchain/llvm-project</a> 477610d4d0d=
988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #<br>1 SMP PREEMPT Tue Jul =C2=
=A02 09:02:32 UTC 2024
<br>[ =C2=A0=C2=A0=C2=A00.000000] KASLR enabled
<br>[ =C2=A0=C2=A0=C2=A00.000000] random: crng init done
<br>[ =C2=A0=C2=A0=C2=A00.000000] Machine model: linux,dummy-virt
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: UEFI not found.
<br>[ =C2=A0=C2=A0=C2=A00.000000] Zone ranges:
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0[mem 0x0000000040000000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA32 =C2=A0=C2=A0=C2=A0empty
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0Normal =C2=A0=C2=A0empty
<br>[ =C2=A0=C2=A0=C2=A00.000000] Movable zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] NoSplit zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] NoMerge zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] Early memory node ranges
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
00000040000000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] Initmem setup node 0 [mem 0x0000000040000=
000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] cma: Reserved 8 MiB at 0x00000000bd000000=
 on node -1
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: probing for conduit method from DT.
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: PSCIv1.1 detected in firmware.
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: Using standard PSCI v0.2 function I=
Ds
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: Trusted OS migration not required
<br>[ =C2=A0=C2=A0=C2=A00.000000] psci: SMC Calling Convention v1.0
<br>[ =C2=A0=C2=A0=C2=A00.000000] percpu: Embedded 31 pages/cpu s87016 r819=
2 d31768 u126976
<br>[ =C2=A0=C2=A0=C2=A00.000000] Detected PIPT I-cache on CPU0
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v2
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v3a
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v4
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-BHB
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: kernel page table isolation=
 forced ON by KASLR
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Kernel page table=
 isolation (KPTI)
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: ARM erratum 17420=
98
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: ARM errata 116552=
2, 1319367, or 1530923
<br>[ =C2=A0=C2=A0=C2=A00.000000] alternatives: applying boot alternatives
<br>[ =C2=A0=C2=A0=C2=A00.000000] Kernel command line: console=3DttyAMA0,38=
400 drm.debug=3D0x0 rootwait rootdelay=3D5 root=3D/dev/vdd1 rw androidboot.=
serialno=3D100<br>00000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66
<br>[ =C2=A0=C2=A0=C2=A00.000000] Dentry cache hash table entries: 262144 (=
order: 9, 2097152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Inode-cache hash table entries: 131072 (o=
rder: 8, 1048576 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Built 1 zonelists, mobility grouping on.=
=C2=A0 Total pages: 516096
<br>[ =C2=A0=C2=A0=C2=A00.000000] mem auto-init: stack:all(zero), heap allo=
c:off, heap free:off
<br>[ =C2=A0=C2=A0=C2=A00.000000] Memory: 1881596K/2097152K available (1932=
8K kernel code, 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 207364K =
rese<br>rved, 8192K cma-reserved)
<br>[ =C2=A0=C2=A0=C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D4, Nodes=3D1
<br>[ =C2=A0=C2=A0=C2=A00.000000] ftrace: allocating 56269 entries in 220 p=
ages
<br>[ =C2=A0=C2=A0=C2=A00.000000] ftrace: allocated 220 pages with 5 groups
<br>[ =C2=A0=C2=A0=C2=A00.000000] trace event string verifier disabled
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: Preemptible hierarchical RCU impleme=
ntation.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: =C2=A0=C2=A0=C2=A0=C2=A0RCU event tr=
acing is enabled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: =C2=A0=C2=A0=C2=A0=C2=A0RCU restrict=
ing CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D4.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Trampoline variant of Tasks RCU ena=
bled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Rude variant of Tasks RCU enabled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Tracing variant of Tasks RCU enable=
d.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: RCU calculated value of scheduler-en=
listment delay is 25 jiffies.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: Adjusting geometry for rcu_fanout_le=
af=3D16, nr_cpu_ids=3D4
<br>[ =C2=A0=C2=A0=C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated ir=
qs: 0
<br>[ =C2=A0=C2=A0=C2=A00.000000] Root IRQ handler: gic_handle_irq
<br>[ =C2=A0=C2=A0=C2=A00.000000] GICv2m: range[mem 0x08020000-0x08020fff],=
 SPI[80:143]
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: srcu_init: Setting srcu_struct sizes=
 based on contention.
<br>[ =C2=A0=C2=A0=C2=A00.000000] arch_timer: cp15 timer(s) running at 62.5=
0MHz (virt).
<br>[ =C2=A0=C2=A0=C2=A00.000000] clocksource: arch_sys_counter: mask: 0x1f=
fffffffffffff max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
<br>[ =C2=A0=C2=A0=C2=A00.000069] sched_clock: 57 bits at 63MHz, resolution=
 16ns, wraps every 4398046511096ns
<br>[ =C2=A0=C2=A0=C2=A00.003628] kfence: initialized - using 2097152 bytes=
 for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
<br>[ =C2=A0=C2=A0=C2=A00.010906] Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
<br>[ =C2=A0=C2=A0=C2=A00.011082] pid_max: default: 32768 minimum: 301
<br>[ =C2=A0=C2=A0=C2=A00.013020] LSM: initializing lsm=3Dcapability,selinu=
x,integrity
<br>[ =C2=A0=C2=A0=C2=A00.013436] SELinux: =C2=A0Initializing.
<br>[ =C2=A0=C2=A0=C2=A00.016921] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.016984] Mountpoint-cache hash table entries: 4096=
 (order: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.031469] cgroup: Disabling memory control group su=
bsystem
<br>[ =C2=A0=C2=A0=C2=A00.050059] cacheinfo: Unable to detect cache hierarc=
hy for CPU 0
<br>[ =C2=A0=C2=A0=C2=A00.059978] RCU Tasks: Setting shift to 2 and lim to =
1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.060584] RCU Tasks Rude: Setting shift to 2 and li=
m to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.060822] RCU Tasks Trace: Setting shift to 2 and l=
im to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.062427] rcu: Hierarchical SRCU implementation.
<br>[ =C2=A0=C2=A0=C2=A00.062463] rcu: =C2=A0=C2=A0=C2=A0=C2=A0Max phase no=
-delay instances is 1000.
<br>[ =C2=A0=C2=A0=C2=A00.068568] EFI services will not be available.
<br>[ =C2=A0=C2=A0=C2=A00.071086] smp: Bringing up secondary CPUs ...
<br>[ =C2=A0=C2=A0=C2=A00.074801] Detected PIPT I-cache on CPU1
<br>[ =C2=A0=C2=A0=C2=A00.075909] CPU1: Booted secondary processor 0x000000=
0001 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.081065] Detected PIPT I-cache on CPU2
<br>[ =C2=A0=C2=A0=C2=A00.081470] CPU2: Booted secondary processor 0x000000=
0002 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.083873] Detected PIPT I-cache on CPU3
<br>[ =C2=A0=C2=A0=C2=A00.084168] CPU3: Booted secondary processor 0x000000=
0003 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.084681] smp: Brought up 1 node, 4 CPUs
<br>[ =C2=A0=C2=A0=C2=A00.084715] SMP: Total of 4 processors activated.
<br>[ =C2=A0=C2=A0=C2=A00.084800] CPU features: detected: 32-bit EL0 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.084824] CPU features: detected: 32-bit EL1 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.084885] CPU features: detected: CRC32 instruction=
s
<br>[ =C2=A0=C2=A0=C2=A00.088191] CPU features: emulated: Privileged Access=
 Never (PAN) using TTBR0_EL1 switching
<br>[ =C2=A0=C2=A0=C2=A00.088512] CPU: All CPU(s) started at EL1
<br>[ =C2=A0=C2=A0=C2=A00.088714] alternatives: applying system-wide altern=
atives
<br>[ =C2=A0=C2=A0=C2=A00.113756] devtmpfs: initialized
<br>[ =C2=A0=C2=A0=C2=A00.126262] Enabled cp15_barrier support
<br>[ =C2=A0=C2=A0=C2=A00.126449] Enabled setend support
<br>[ =C2=A0=C2=A0=C2=A00.127708] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
<br>[ =C2=A0=C2=A0=C2=A00.127840] futex hash table entries: 1024 (order: 4,=
 65536 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.131302] pinctrl core: initialized pinctrl subsyst=
em
<br>[ =C2=A0=C2=A0=C2=A00.138216] DMI not present or invalid.
<br>[ =C2=A0=C2=A0=C2=A00.147664] NET: Registered PF_NETLINK/PF_ROUTE proto=
col family
<br>[ =C2=A0=C2=A0=C2=A00.158502] DMA: preallocated 256 KiB GFP_KERNEL pool=
 for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.158987] DMA: preallocated 256 KiB GFP_KERNEL|GFP_=
DMA pool for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.159303] audit: initializing netlink subsys (disab=
led)
<br>[ =C2=A0=C2=A0=C2=A00.161302] audit: type=3D2000 audit(0.148:1): state=
=3Dinitialized audit_enabled=3D0 res=3D1
<br>[ =C2=A0=C2=A0=C2=A00.164412] thermal_sys: Registered thermal governor =
&#39;step_wise&#39;
<br>[ =C2=A0=C2=A0=C2=A00.164806] cpuidle: using governor menu
<br>[ =C2=A0=C2=A0=C2=A00.165816] hw-breakpoint: found 6 breakpoint and 4 w=
atchpoint registers.
<br>[ =C2=A0=C2=A0=C2=A00.166975] ASID allocator initialised with 32768 ent=
ries
<br>[ =C2=A0=C2=A0=C2=A00.168385] Serial: AMBA PL011 UART driver
<br>[ =C2=A0=C2=A0=C2=A00.196712] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 =
(irq =3D 13, base_baud =3D 0) is a PL011 rev1
<br>[ =C2=A0=C2=A0=C2=A00.198278] printk: console [ttyAMA0] enabled
<br>[ =C2=A0=C2=A0=C2=A00.224278] Modules: 2G module region forced by RANDO=
MIZE_MODULE_REGION_FULL
<br>[ =C2=A0=C2=A0=C2=A00.224486] Modules: 0 pages in range for non-PLT usa=
ge
<br>[ =C2=A0=C2=A0=C2=A00.224510] Modules: 516176 pages in range for PLT us=
age
<br>[ =C2=A0=C2=A0=C2=A00.241442] iommu: Default domain type: Translated
<br>[ =C2=A0=C2=A0=C2=A00.241679] iommu: DMA domain TLB invalidation policy=
: strict mode
<br>[ =C2=A0=C2=A0=C2=A00.244200] SCSI subsystem initialized
<br>[ =C2=A0=C2=A0=C2=A00.245459] usbcore: registered new interface driver =
usbfs
<br>[ =C2=A0=C2=A0=C2=A00.245841] usbcore: registered new interface driver =
hub
<br>[ =C2=A0=C2=A0=C2=A00.246154] usbcore: registered new device driver usb
<br>[ =C2=A0=C2=A0=C2=A00.247257] mc: Linux media interface: v0.10
<br>[ =C2=A0=C2=A0=C2=A00.247617] videodev: Linux video capture interface: =
v2.00
<br>[ =C2=A0=C2=A0=C2=A00.248602] pps_core: LinuxPPS API ver. 1 registered
<br>[ =C2=A0=C2=A0=C2=A00.248700] pps_core: Software ver. 5.3.6 - Copyright=
 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it" target=
=3D"_blank">giometti@linux.it</a>&gt;
<br>[ =C2=A0=C2=A0=C2=A00.248967] PTP clock support registered
<br>[ =C2=A0=C2=A0=C2=A00.251884] Advanced Linux Sound Architecture Driver =
Initialized.
<br>[ =C2=A0=C2=A0=C2=A00.262663] Bluetooth: Core ver 2.22
<br>[ =C2=A0=C2=A0=C2=A00.262960] NET: Registered PF_BLUETOOTH protocol fam=
ily
<br>[ =C2=A0=C2=A0=C2=A00.263069] Bluetooth: HCI device and connection mana=
ger initialized
<br>[ =C2=A0=C2=A0=C2=A00.263344] Bluetooth: HCI socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.263516] Bluetooth: L2CAP socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.263840] Bluetooth: SCO socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.266790] vgaarb: loaded
<br>[ =C2=A0=C2=A0=C2=A00.268841] clocksource: Switched to clocksource arch=
_sys_counter
<br>[ =C2=A0=C2=A0=C2=A00.272056] VFS: Disk quotas dquot_6.6.0
<br>[ =C2=A0=C2=A0=C2=A00.272284] VFS: Dquot-cache hash table entries: 512 =
(order 0, 4096 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.273060] FS-Cache: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.278526] CacheFiles: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.287007] NET: Registered PF_INET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.288390] IP idents hash table entries: 32768 (orde=
r: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.297021] tcp_listen_portaddr_hash hash table entri=
es: 1024 (order: 2, 16384 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.297273] Table-perturb hash table entries: 65536 (=
order: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.297485] TCP established hash table entries: 16384=
 (order: 5, 131072 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.298036] TCP bind hash table entries: 16384 (order=
: 7, 524288 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.298873] TCP: Hash tables configured (established =
16384 bind 16384)
<br>[ =C2=A0=C2=A0=C2=A00.301283] MPTCP token hash table entries: 2048 (ord=
er: 3, 49152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.301759] UDP hash table entries: 1024 (order: 3, 3=
2768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.302186] UDP-Lite hash table entries: 1024 (order:=
 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.304009] NET: Registered PF_UNIX/PF_LOCAL protocol=
 family
<br>[ =C2=A0=C2=A0=C2=A00.306868] PCI: CLS 0 bytes, default 64
<br>[ =C2=A0=C2=A0=C2=A00.312145] Trying to unpack rootfs image as initramf=
s...
<br>[ =C2=A0=C2=A0=C2=A00.312808] kvm [1]: HYP mode not available
<br>[ =C2=A0=C2=A0=C2=A00.318856] rootfs image is not initramfs (invalid ma=
gic at start of compressed archive); looks like an initrd
<br>[ =C2=A0=C2=A0=C2=A00.335544] Initialise system trusted keyrings
<br>[ =C2=A0=C2=A0=C2=A00.338430] workingset: timestamp_bits=3D46 max_order=
=3D19 bucket_order=3D0
<br>[ =C2=A0=C2=A0=C2=A00.339134] zbud: loaded
<br>[ =C2=A0=C2=A0=C2=A00.347742] Key type cifs.idmap registered
<br>[ =C2=A0=C2=A0=C2=A00.348673] fuse: init (API version 7.39)
<br>[ =C2=A0=C2=A0=C2=A00.386722] Key type asymmetric registered
<br>[ =C2=A0=C2=A0=C2=A00.386992] Asymmetric key parser &#39;x509&#39; regi=
stered
<br>[ =C2=A0=C2=A0=C2=A00.387460] Block layer SCSI generic (bsg) driver ver=
sion 0.4 loaded (major 244)
<br>[ =C2=A0=C2=A0=C2=A00.388796] io scheduler mq-deadline registered
<br>[ =C2=A0=C2=A0=C2=A00.388954] io scheduler kyber registered
<br>[ =C2=A0=C2=A0=C2=A00.389319] io scheduler bfq registered
<br>[ =C2=A0=C2=A0=C2=A00.406358] vc-mem: phys_addr:0x00000000 mem_base=3D0=
x00000000 mem_size:0x00000000(0 MiB)
<br>[ =C2=A0=C2=A0=C2=A00.476330] brd: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.508286] loop: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.512092] Loading iSCSI transport class v2.0-870.
<br>[ =C2=A0=C2=A0=C2=A00.522449] wireguard: WireGuard 1.0.0 loaded. See <a=
 href=3D"http://www.wireguard.com" target=3D"_blank">www.wireguard.com</a> =
for information.
<br>[ =C2=A0=C2=A0=C2=A00.522729] wireguard: Copyright (C) 2015-2019 Jason =
A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason=
@zx2c4.com</a>&gt;. All Rights Reserved.
<br>[ =C2=A0=C2=A0=C2=A00.538429] tun: Universal TUN/TAP device driver, 1.6
<br>[ =C2=A0=C2=A0=C2=A00.541953] usbcore: registered new interface driver =
brcmfmac
<br>[ =C2=A0=C2=A0=C2=A00.542290] usbcore: registered new device driver r81=
52-cfgselector
<br>[ =C2=A0=C2=A0=C2=A00.542675] usbcore: registered new interface driver =
r8152
<br>[ =C2=A0=C2=A0=C2=A00.542971] usbcore: registered new interface driver =
lan78xx
<br>[ =C2=A0=C2=A0=C2=A00.543488] usbcore: registered new interface driver =
asix
<br>[ =C2=A0=C2=A0=C2=A00.543810] usbcore: registered new interface driver =
ax88179_178a
<br>[ =C2=A0=C2=A0=C2=A00.544134] usbcore: registered new interface driver =
cdc_ether
<br>[ =C2=A0=C2=A0=C2=A00.544609] usbcore: registered new interface driver =
smsc95xx
<br>[ =C2=A0=C2=A0=C2=A00.544909] usbcore: registered new interface driver =
net1080
<br>[ =C2=A0=C2=A0=C2=A00.545240] usbcore: registered new interface driver =
cdc_subset
<br>[ =C2=A0=C2=A0=C2=A00.545596] usbcore: registered new interface driver =
zaurus
<br>[ =C2=A0=C2=A0=C2=A00.545896] usbcore: registered new interface driver =
cdc_ncm
<br>[ =C2=A0=C2=A0=C2=A00.546192] usbcore: registered new interface driver =
r8153_ecm
<br>[ =C2=A0=C2=A0=C2=A00.547442] dwc_otg: version 3.00a 10-AUG-2012 (platf=
orm bus)
<br>[ =C2=A0=C2=A0=C2=A00.550591] usbcore: registered new interface driver =
cdc_acm
<br>[ =C2=A0=C2=A0=C2=A00.550756] cdc_acm: USB Abstract Control Model drive=
r for USB modems and ISDN adapters
<br>[ =C2=A0=C2=A0=C2=A00.551948] usbcore: registered new interface driver =
uas
<br>[ =C2=A0=C2=A0=C2=A00.552352] usbcore: registered new interface driver =
usb-storage
<br>[ =C2=A0=C2=A0=C2=A00.566050] usbcore: registered new interface driver =
cp210x
<br>[ =C2=A0=C2=A0=C2=A00.566791] usbserial: USB Serial support registered =
for cp210x
<br>[ =C2=A0=C2=A0=C2=A00.567318] usbcore: registered new interface driver =
pl2303
<br>[ =C2=A0=C2=A0=C2=A00.567653] usbserial: USB Serial support registered =
for pl2303
<br>[ =C2=A0=C2=A0=C2=A00.573531] mousedev: PS/2 mouse device common for al=
l mice
<br>[ =C2=A0=C2=A0=C2=A00.573930] usbcore: registered new interface driver =
xpad
<br>[ =C2=A0=C2=A0=C2=A00.574228] usbcore: registered new interface driver =
usb_acecad
<br>[ =C2=A0=C2=A0=C2=A00.574588] usbcore: registered new interface driver =
aiptek
<br>[ =C2=A0=C2=A0=C2=A00.574937] usbcore: registered new interface driver =
hanwang
<br>[ =C2=A0=C2=A0=C2=A00.575292] usbcore: registered new interface driver =
kbtab
<br>[ =C2=A0=C2=A0=C2=A00.577388] usbcore: registered new interface driver =
usbtouchscreen
<br>[ =C2=A0=C2=A0=C2=A00.580179] i2c_dev: i2c /dev entries driver
<br>[ =C2=A0=C2=A0=C2=A00.584010] ir_imon_decoder: IR iMON protocol handler=
 initialized
<br>[ =C2=A0=C2=A0=C2=A00.584179] IR JVC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584296] IR MCE Keyboard/mouse protocol handler in=
itialized
<br>[ =C2=A0=C2=A0=C2=A00.584435] IR NEC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584734] IR RC5(x/sz) protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584863] IR RC6 protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.584991] IR RCMM protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585111] IR SANYO protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585226] IR Sharp protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585358] IR Sony protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.585477] IR XMP protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.586421] usbcore: registered new interface driver =
uvcvideo
<br>[ =C2=A0=C2=A0=C2=A00.589015] device-mapper: uevent: version 1.0.3
<br>[ =C2=A0=C2=A0=C2=A00.590448] device-mapper: ioctl: 4.48.0-ioctl (2023-=
03-01) initialised: <a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank=
">dm-devel@redhat.com</a>
<br>[ =C2=A0=C2=A0=C2=A00.591924] Bluetooth: HCI UART driver ver 2.3
<br>[ =C2=A0=C2=A0=C2=A00.592106] Bluetooth: HCI UART protocol H4 registere=
d
<br>[ =C2=A0=C2=A0=C2=A00.592885] Bluetooth: HCI UART protocol Broadcom reg=
istered
<br>[ =C2=A0=C2=A0=C2=A00.594293] sdhci: Secure Digital Host Controller Int=
erface driver
<br>[ =C2=A0=C2=A0=C2=A00.594442] sdhci: Copyright(c) Pierre Ossman
<br>[ =C2=A0=C2=A0=C2=A00.594948] sdhci-pltfm: SDHCI platform and OF driver=
 helper
<br>[ =C2=A0=C2=A0=C2=A00.596987] ledtrig-cpu: registered to indicate activ=
ity on CPUs
<br>[ =C2=A0=C2=A0=C2=A00.599350] hid: raw HID events driver (C) Jiri Kosin=
a
<br>[ =C2=A0=C2=A0=C2=A00.612270] usbcore: registered new interface driver =
usbhid
<br>[ =C2=A0=C2=A0=C2=A00.612441] usbhid: USB HID core driver
<br>[ =C2=A0=C2=A0=C2=A00.615743] ashmem: initialized
<br>[ =C2=A0=C2=A0=C2=A00.617297] SPI driver st-accel-spi has no spi_device=
_id for st,lis302dl-spi
<br>[ =C2=A0=C2=A0=C2=A00.617473] SPI driver st-accel-spi has no spi_device=
_id for st,lis3lv02dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.617626] SPI driver st-accel-spi has no spi_device=
_id for st,lis3dh-accel
<br>[ =C2=A0=C2=A0=C2=A00.617769] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330d-accel
<br>[ =C2=A0=C2=A0=C2=A00.617919] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.618062] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dlc-accel
<br>[ =C2=A0=C2=A0=C2=A00.618206] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dlh-accel
<br>[ =C2=A0=C2=A0=C2=A00.618357] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330-accel
<br>[ =C2=A0=C2=A0=C2=A00.618493] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303agr-accel
<br>[ =C2=A0=C2=A0=C2=A00.618638] SPI driver st-accel-spi has no spi_device=
_id for st,lis2dh12-accel
<br>[ =C2=A0=C2=A0=C2=A00.618775] SPI driver st-accel-spi has no spi_device=
_id for st,lng2dm-accel
<br>[ =C2=A0=C2=A0=C2=A00.618911] SPI driver st-accel-spi has no spi_device=
_id for st,h3lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.619056] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.619209] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303c-accel
<br>[ =C2=A0=C2=A0=C2=A00.620207] SPI driver st-magn-spi has no spi_device_=
id for st,lis3mdl-magn
<br>[ =C2=A0=C2=A0=C2=A00.620355] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303agr-magn
<br>[ =C2=A0=C2=A0=C2=A00.620510] SPI driver st-magn-spi has no spi_device_=
id for st,lsm9ds1-magn
<br>[ =C2=A0=C2=A0=C2=A00.620768] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303c-magn
<br>[ =C2=A0=C2=A0=C2=A00.626130] hw perfevents: enabled with armv8_pmuv3 P=
MU driver, 7 counters available
<br>[ =C2=A0=C2=A0=C2=A00.630320] usbcore: registered new interface driver =
snd-usb-audio
<br>[ =C2=A0=C2=A0=C2=A00.638439] Mirror/redirect action on
<br>[ =C2=A0=C2=A0=C2=A00.639343] netem: version 1.3
<br>[ =C2=A0=C2=A0=C2=A00.639435] u32 classifier
<br>[ =C2=A0=C2=A0=C2=A00.639508] =C2=A0=C2=A0=C2=A0=C2=A0input device chec=
k on
<br>[ =C2=A0=C2=A0=C2=A00.639602] =C2=A0=C2=A0=C2=A0=C2=A0Actions configure=
d
<br>[ =C2=A0=C2=A0=C2=A00.648469] xt_time: kernel timezone is -0000
<br>[ =C2=A0=C2=A0=C2=A00.649096] gre: GRE over IPv4 demultiplexor driver
<br>[ =C2=A0=C2=A0=C2=A00.649255] IPv4 over IPsec tunneling driver
<br>[ =C2=A0=C2=A0=C2=A00.654843] Initializing XFRM netlink socket
<br>[ =C2=A0=C2=A0=C2=A00.655213] IPsec XFRM device driver
<br>[ =C2=A0=C2=A0=C2=A00.676037] NET: Registered PF_INET6 protocol family
<br>[ =C2=A0=C2=A0=C2=A00.687646] Segment Routing with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.687964] In-situ OAM (IOAM) with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.689074] mip6: Mobile IPv6
<br>[ =C2=A0=C2=A0=C2=A00.693823] sit: IPv6, IPv4 and MPLS over IPv4 tunnel=
ing driver
<br>[ =C2=A0=C2=A0=C2=A00.699298] NET: Registered PF_PACKET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.699567] NET: Registered PF_KEY protocol family
<br>[ =C2=A0=C2=A0=C2=A00.699819] Key type dns_resolver registered
<br>[ =C2=A0=C2=A0=C2=A00.798005] Freeing initrd memory: 131072K
<br>[ =C2=A0=C2=A0=C2=A00.806166] registered taskstats version 1
<br>[ =C2=A0=C2=A0=C2=A00.807819] Loading compiled-in X.509 certificates
<br>[ =C2=A0=C2=A0=C2=A00.834497] Key type .fscrypt registered
<br>[ =C2=A0=C2=A0=C2=A00.834641] Key type fscrypt-provisioning registered
<br>[ =C2=A0=C2=A0=C2=A00.841634] of_cfs_init
<br>[ =C2=A0=C2=A0=C2=A00.842079] of_cfs_init: OK
<br>[ =C2=A0=C2=A0=C2=A00.845830] cfg80211: Loading compiled-in X.509 certi=
ficates for regulatory database
<br>[ =C2=A0=C2=A0=C2=A00.876283] Loaded X.509 cert &#39;<a href=3D"mailto:=
benh@debian.org" target=3D"_blank">benh@debian.org</a>: 577e021cb980e0e8208=
21ba7b54b4961b8b4fadf&#39;
<br>[ =C2=A0=C2=A0=C2=A00.877632] Loaded X.509 cert &#39;<a href=3D"mailto:=
romain.perier@gmail.com" target=3D"_blank">romain.perier@gmail.com</a>: 3ab=
bc6ec146e09d1b6016ab9d6cf71dd233f0328&#39;
<br>[ =C2=A0=C2=A0=C2=A00.878441] Loaded X.509 cert &#39;sforshee: 00b28ddf=
47aef9cea7&#39;
<br>[ =C2=A0=C2=A0=C2=A00.879187] Loaded X.509 cert &#39;wens: 61c038651aab=
dcf94bd0ac7ff06c7248db18c600&#39;
<br>[ =C2=A0=C2=A0=C2=A00.885017] clk: Disabling unused clocks
<br>[ =C2=A0=C2=A0=C2=A00.885499] ALSA device list:
<br>[ =C2=A0=C2=A0=C2=A00.885646] =C2=A0=C2=A0No soundcards found.
<br>[ =C2=A0=C2=A0=C2=A00.894059] uart-pl011 9000000.pl011: no DMA platform=
 data
<br>[ =C2=A0=C2=A0=C2=A00.895672] Waiting 5 sec before mounting root device=
...
<br>[ =C2=A0=C2=A0=C2=A06.132758] RAMDISK: Couldn&#39;t find valid RAM disk=
 image starting at 0.
<br>[ =C2=A0=C2=A0=C2=A06.133865] Waiting for root device /dev/vdd1...
<br>[ =C2=A0=C2=A010.994096] platform gpio-keys: deferred probe pending<br>
<br><br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 25, 2024 at 2:30=E2=80=AFPM Mario Marietto &lt;=
<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span st=
yle=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">When I unpack th=
is file :</span></span></div><div><span style=3D"font-family:monospace"><sp=
an style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span>=
</span></div><div><span style=3D"font-family:monospace"><span style=3D"colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">lineage-21.0-20240618-UNOFF=
ICIAL-KonstaKANG-rpi4-atv.img</span></span></div><div><span style=3D"font-f=
amily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,2=
55,255)"><br></span></span></div><div><span style=3D"font-family:monospace"=
><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">I get t=
hese files :</span></span></div><div><span style=3D"font-family:monospace">=
<span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></sp=
an></span></div><div><span style=3D"font-family:monospace"><span style=3D"c=
olor:rgb(0,0,0);background-color:rgb(255,255,255)">0.fat</span><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br>1.img<span style=3D"color:rgb(0,0,0);background-color:rgb(255,25=
5,255)">
</span><br>2.img
<br>3.img</span></div><div><span style=3D"font-family:monospace"><br></span=
></div><div><span style=3D"font-family:monospace">So,I assume that :</span>=
</div><div><span style=3D"font-family:monospace"><br></span></div><div><spa=
n style=3D"font-family:monospace">0.fat is : initrd</span></div><div><span =
style=3D"font-family:monospace">1.img is : </span>system-rw.img<br>2.img is=
=C2=A0=C2=A0 :=C2=A0 vendor-rw.img<br>3.img is=C2=A0=C2=A0 :=C2=A0 userdata=
.img</div><div><br></div><div>If I use 0.fat as initrd,like this :</div><di=
v><br></div><div><span style=3D"font-family:monospace"><span style=3D"color=
:rgb(24,178,178);background-color:rgb(255,255,255)">-initrd /mnt/zroot2/zro=
ot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/0.fat</sp=
an></span></div><div><span style=3D"font-family:monospace"><span style=3D"c=
olor:rgb(24,178,178);background-color:rgb(255,255,255)"><br></span></span><=
/div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(24=
,178,178);background-color:rgb(255,255,255)">I get this message :</span></s=
pan></div><div><span style=3D"font-family:monospace"><span style=3D"color:r=
gb(24,178,178);background-color:rgb(255,255,255)"><br></span></span></div><=
div><span>rootfs image is not initramfs (invalid magic at start of compress=
ed archive); looks like an initrd</span></div><div><span><br></span></div><=
div><span>it looks like an initrd : right,it&#39;s true : it is initrd. (fo=
r this reason I&#39;ve assumed that 0.fat is initrd...</span></div><div><sp=
an><br></span></div><div><span style=3D"font-family:monospace"></span></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, Aug 25, 2024 at 1:26=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Su=
n, 25 Aug 2024 at 11:45, Mario Marietto &lt;<a href=3D"mailto:marietto2008@=
gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Please look at this example :<br>
&gt;<br>
&gt; qemu-system-aarch64 \<br>
&gt; -smp 4 \<br>
&gt; -m 2048 \<br>
&gt; -cpu cortex-a72 \<br>
&gt; -machine virt \<br>
&gt; -serial stdio \<br>
&gt; -kernel /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-K=
onstaKANG-rpi4-atv/boot/Image \<br>
<br>
This (assuming it&#39;s the complete command line your script is<br>
running) doesn&#39;t pass any arguments telling QEMU to provide a<br>
root disk, and it doesn&#39;t pass any arguments to the kernel<br>
telling it what root disk to use...<br>
<br>
&gt; [=C2=A0 =C2=A0 0.000000] Kernel command line: console=3DttyAMA0,115200=
 kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rootwait a=
ndroidboot.serialno=3D10000000abcd1234 androidboot.btmacaddr=3D11:22:33:44:=
55:66<br>
<br>
...so the kernel defaults to &quot;/dev/mmcblk0p2&quot; as its root disk be=
cause<br>
it&#39;s using the command line argument that was compiled into it...<br>
<br>
&gt; [=C2=A0 =C2=A0 0.658240] Waiting for root device /dev/mmcblk0p2...<br>
<br>
...and then it&#39;s hanging around forever waiting for that.<br>
<br>
You need to:<br>
=C2=A0(1) pass QEMU arguments telling it to provide a root fs<br>
=C2=A0(2) pass the kernel arguments telling it to look for the<br>
=C2=A0 =C2=A0 =C2=A0root fs in the place where QEMU is providing it<br>
<br>
Your other command line looks more on the right lines:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel<br>
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/boot/Image<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd<br>
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/0.fat<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D0,if=3Dnone,id=3Dsystem,file=3D/=
mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4=
-atv/1.img<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dsystem \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D1,if=3Dnone,id=3Dvendor,file=3D/=
mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4=
-atv/2.img<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dvendor \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D2,if=3Dnone,id=3Duserdata,file=
=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/3.img<br>
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Duserdata \<br>
<br>
though I wonder if the kernel really expects a<br>
FAT file for the initrd, given it complains:<br>
<br>
[=C2=A0 =C2=A0 0.344033] Trying to unpack rootfs image as initramfs...<br>
[=C2=A0 =C2=A0 0.344947] rootfs image is not initramfs (invalid magic at st=
art<br>
of compressed archive); looks like an initrd<br>
<br>
and then later<br>
<br>
[=C2=A0 =C2=A0 5.905329] RAMDISK: Couldn&#39;t find valid RAM disk image st=
arting at 0.<br>
<br>
I think if I were you I&#39;d start by figuring out what&#39;s going on<br>
with the initrd.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000e5b04e0620d507db--
