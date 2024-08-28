Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp464119nji;
        Wed, 28 Aug 2024 05:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuO0gi21JwZpml8V/qHfJ1tXeZzsWx7c7AJzUsrwsF2FGZUVCU6wVS2AVKWnqgZ3fvQIii5zKhU8Aw8w==@linaro.org
X-Received: by 2002:a05:6a21:6e4b:b0:1c4:8492:88a8 with SMTP id adf61e73a8af0-1cc89d6b9e8mr20557245637.19.1724847064305;
        Wed, 28 Aug 2024 05:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724847064; cv=none;
        d=google.com; s=arc-20160816;
        b=E1ms/xVy8/BIOyNqje5ULQw8lOhaYz6KTcweNPBPUq4vxR7u2kPPwP/+DmC0VBk6pT
         R/7YL8aOQhHzSVGLSsEJVq81zakOArTPl5RdZM1iq51qRA2R7DefSMugHt0QglPk7iL3
         GzV1JW72FlRAiL4PMGhV9XALt5rm4iJuCAQ/zCFuOHf7C6gL/ZqFj7UFwdE0kS7nPKBs
         gC6FGO09DgXwV16/LviRvJuF6UHBZVV1x0nNoeMwB4OuHJ+T5MXvmtBgq3w18vTK8iXm
         TkKMzD8s1ePnMVs7oBwxFJh0NaQC6ybw86uYXAT5ua3gnKBk0RVs0boc8ynEGzyuY2Yh
         oWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=due41j4Y+qfUxbB+ZkJMObgdCNTU1H1tzoD3bKV29mo=;
        fh=Kb1+BRdKmzhz2DyDGwWek/UC3nHyOsq14M5DTROx8JA=;
        b=rAOJMnj4BMWx1LSnvSZHGyIqCmfA0FBvWouKZGX3EknNzzKERf2ZAOAJX2KC/REn18
         hPBLBHBxGWdRhu7R6z9J6QOukrO5k9g6nSBTQej4T+ixqJ/U6ru1YgNQEZvIU93/+ZU/
         98AgCW5x+VA4lyg+g9NKDsVPmk85X7Ac7SJ70x9MP4+yEchdkdSKl9xIgvSAoUzucx+G
         FwxqD9jfKt75blnOLKLRm7a78YzZBZCvm0n9okNx6P4t9d7GOBBUioj+0685/MI7kIgd
         z8ub5jwGa0kqZtwA5SbIMxfizgNc3Cj5OmbMdNXlw+kXqsbQkZZbwip04TIXjj1cxaRN
         jtCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIeTamIF;
       spf=pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marietto2008@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <marietto2008@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71434255710sor9793979b3a.4.2024.08.28.05.11.04
        (Google Transport Security);
        Wed, 28 Aug 2024 05:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIeTamIF;
       spf=pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marietto2008@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724847063; x=1725451863; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=due41j4Y+qfUxbB+ZkJMObgdCNTU1H1tzoD3bKV29mo=;
        b=UIeTamIFuqpZahhCQEp7Oir1bVjAglukDOdXRCAlLfvIYkd0/ciajbb3oTpnjiRtzq
         JmfNIgHhgbjYa9r/ZTwWQae+AOVUDZMposUIw7QmkpB3oFbKlQ1hdLslLJnKb/kWt9gi
         ERejZJcbvecrg09Fh5expyr8d+uq6wFfgy6dXwgSBBGpcRzMe8GmJNUrphb9O39IQKEs
         6DA7WtfbvJ7jioWai2RLwlf6aPYlkHnNxFEEq1Z4ly4/i67AbILt9Hw59KStnv026eml
         tW6fz/NMnst/sTs9fWfcPhu7LTqJdiH3nN07hwkI7nNVEFwdZothwFaLCHSkutXOtnyd
         8GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724847063; x=1725451863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=due41j4Y+qfUxbB+ZkJMObgdCNTU1H1tzoD3bKV29mo=;
        b=F06+jUN3UBvygaHyp50w7lEfL3Ghs24oSJVzHJTsHOKIub/Oto4lIPIuhwlSYUGpfz
         cCCyzToINQdeV7+mVBvvcJ+0qlNZP5OI5Q/ruKQRbe2D54uJXaRICkliTq0+8A09Cj/Q
         PzN2pVTAVBs5Ia4PS3G0BrZ0euhtmkyU47cmGq8fwV5UTOKDrG0TUXwqcUxwQzpPPsqc
         MfuowYXgaIbCcc3n77ynTQ2a6aJW81yfa3RmOPi4NtEQ/Ht0hges68D0vQqjDw6u0Fhg
         7v+a+ZSc+BN76Fa1FVK70kEx8C73jAgbgVFQwCiQkbYGRIqRedD6o1wdXFT2w3R2FWYI
         xtGg==
X-Forwarded-Encrypted: i=1; AJvYcCX83tHcEvhn68MGNPu1Tm0+9c1C8cBhqbSCU7B06Ed5sF2IcCPbxv+7IA9fNeHVsbtOCVx1+AKL7hHP+g==@linaro.org
X-Gm-Message-State: AOJu0YwnTs2VyLHgVgnsOnbRbYveCzMEAdlLOGOlpnDRfm8USiqwg+vP
	u/18mMDhANTKPzBexA2UqGhvH4ePvickONJlCA6uspbig4w2tWtSB2hf5XWUZGg/XD68hcqxxtn
	yzGfbu4Ebyfu4mxut8LNUL96WSs/kEalQf5B0Hw==
X-Google-Smtp-Source: AGHT+IEW/zO5sMjJt5uZylxSZ2tdYfqTumOaL/O3x3xGpDT2sRuGC4kpd2O4CHFyN4G7PIEMwQOUPb7dJmPpsaDPWSI=
X-Received: by 2002:a05:6a20:9e4c:b0:1c6:ef05:64cd with SMTP id
 adf61e73a8af0-1cc8a0833fdmr20558842637.53.1724847061889; Wed, 28 Aug 2024
 05:11:01 -0700 (PDT)
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
 <CA+1FSigvsXe7eo17_qdKaY0Uo68u7Ep3UacooHZDNCnWJHD4+w@mail.gmail.com> <CA+1FSiiFFjp8O_D=PaGuZMj8oPYLdx5i-+Aq=S7=AZjZmb_aOw@mail.gmail.com>
In-Reply-To: <CA+1FSiiFFjp8O_D=PaGuZMj8oPYLdx5i-+Aq=S7=AZjZmb_aOw@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Wed, 28 Aug 2024 14:10:25 +0200
Message-ID: <CA+1FSih1Yv+-Cjj0rfnnV4CkLum4RESun2UiUoZm=Lfsa=PkhA@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "cc: Sergey Kambalin" <sergey.kambalin@auriga.com>, 
	qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006a7b6c0620bd40b6"
X-TUID: BDUo4pIxsvG/

--0000000000006a7b6c0620bd40b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

maybe I did some progress using these parameters :

root@Z390-AORUS-PRO-DEST:/mnt/zroot2/zroot2/OS/Android# nano start-virt6

qemu-system-aarch64 \
    -smp 4 \
    -m 2048 \
    -cpu cortex-a72 \
    -M virt \
    -kernel
/mnt/zroot2/zroot2/OS/Android/KostaKang/lineage-21.0-20240618-UNOFFICIAL-Ko=
nstaKANG-rpi4-atv/boot/Image
\
    -initrd
/mnt/zroot2/zroot2/OS/Android/KostaKang/lineage-21.0-20240618-UNOFFICIAL-Ko=
nstaKANG-rpi4-atv/boot/ramdisk-recovery.img
\
    -append "console=3DttyAMA1,384000 androidboot.hardware=3Drpi4
no_console_suspend root=3D/dev/mmcblk1p2 rootwait
androidboot.selinux=3Dpermissive loglevel=3D8" \
    -no-reboot \
    -serial tcp::5555,server,nowait,nodelay \
    -display sdl \
    -serial mon:stdio \


The LOG messages seem to be more interesting than before :


root@Z390-AORUS-PRO-DEST:/mnt/zroot2/zroot2/OS/Android# ./start-virt6

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@build-host)
(Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928) clang
version 18.0.0 (https://android.googlesource.com/toolchain/llvm-project
477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #1 SMP PREEMPT Tue
Jul  2 09:02:32 UTC 2024
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: linux,dummy-virt
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] NoSplit zone start for each node
[    0.000000] NoMerge zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem
0x0000000040000000-0x00000000bfffffff]
[    0.000000] cma: Reserved 8 MiB at 0x00000000bd000000 on node -1
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d31768 u126976
[    0.000000] pcpu-alloc: s87016 r8192 d31768 u126976 alloc=3D31*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: Spectre-v3a
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] CPU features: detected: Spectre-BHB
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 1742098
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or
1530923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: console=3DttyAMA1,384000
androidboot.hardware=3Drpi4 no_console_suspend root=3D/dev/mmcblk1p2 rootwa=
it
androidboot.selinux=3Dpermissive loglevel=3D8
androidboot.serialno=3D10000000abcd1234
androidboot.btmacaddr=3D11:22:33:44:55:66
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152
bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576
bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 51609=
6
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:of=
f
[    0.000000] Memory: 1998052K/2097152K available (19328K kernel code,
2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 90908K reserved, 8192K
cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.000000] ftrace: allocating 56269 entries in 220 pages
[    0.000000] ftrace: allocated 220 pages with 5 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to
nr_cpu_ids=3D4.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is
25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
contention.
[    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff
max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
[    0.000072] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps every
4398046511096ns
[    0.003415] kfence: initialized - using 2097152 bytes for 255 objects at
0x(____ptrval____)-0x(____ptrval____)
[    0.010294] Calibrating delay loop (skipped), value calculated using
timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
[    0.010468] pid_max: default: 32768 minimum: 301
[    0.012316] LSM: initializing lsm=3Dcapability,selinux,integrity
[    0.012725] SELinux:  Initializing.
[    0.016078] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes,
linear)
[    0.016140] Mountpoint-cache hash table entries: 4096 (order: 3, 32768
bytes, linear)
[    0.030412] cgroup: Disabling memory control group subsystem
[    0.048581] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    0.058399] RCU Tasks: Setting shift to 2 and lim to 1
rcu_task_cb_adjust=3D1.
[    0.058995] RCU Tasks Rude: Setting shift to 2 and lim to 1
rcu_task_cb_adjust=3D1.
[    0.059241] RCU Tasks Trace: Setting shift to 2 and lim to 1
rcu_task_cb_adjust=3D1.
[    0.060770] rcu: Hierarchical SRCU implementation.
[    0.060806] rcu:     Max phase no-delay instances is 1000.
[    0.067966] EFI services will not be available.
[    0.069136] smp: Bringing up secondary CPUs ...
[    0.073070] Detected PIPT I-cache on CPU1
[    0.074107] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.079461] Detected PIPT I-cache on CPU2
[    0.079980] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
[    0.081795] Detected PIPT I-cache on CPU3
[    0.082259] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
[    0.082755] smp: Brought up 1 node, 4 CPUs
[    0.082785] SMP: Total of 4 processors activated.
[    0.082872] CPU features: detected: 32-bit EL0 Support
[    0.082893] CPU features: detected: 32-bit EL1 Support
[    0.082947] CPU features: detected: CRC32 instructions
[    0.086896] CPU features: emulated: Privileged Access Never (PAN) using
TTBR0_EL1 switching
[    0.087196] CPU: All CPU(s) started at EL1
[    0.087478] alternatives: applying system-wide alternatives
[    0.111400] devtmpfs: initialized
[    0.122787] Enabled cp15_barrier support
[    0.123005] Enabled setend support
[    0.124388] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.124510] futex hash table entries: 1024 (order: 4, 65536 bytes,
linear)
[    0.127804] pinctrl core: initialized pinctrl subsystem
[    0.133859] DMI not present or invalid.
[    0.143968] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.155874] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
allocations
[    0.156459] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic
allocations
[    0.156805] audit: initializing netlink subsys (disabled)
[    0.159085] audit: type=3D2000 audit(0.148:1): state=3Dinitialized
audit_enabled=3D0 res=3D1
[    0.162594] thermal_sys: Registered thermal governor 'step_wise'
[    0.162937] cpuidle: using governor menu
[    0.164031] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.164971] ASID allocator initialised with 32768 entries
[    0.166421] Serial: AMBA PL011 UART driver
[    0.195802] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13,
base_baud =3D 0) is a PL011 rev1
[    0.207191] 9040000.pl011: ttyAMA1 at MMIO 0x9040000 (irq =3D 14,
base_baud =3D 0) is a PL011 rev1
[    0.208270] printk: console [ttyAMA1] enabled
[    0.227211] Modules: 2G module region forced by
RANDOMIZE_MODULE_REGION_FULL
[    0.227414] Modules: 0 pages in range for non-PLT usage
[    0.227439] Modules: 516176 pages in range for PLT usage
[    0.252423] iommu: Default domain type: Translated
[    0.252692] iommu: DMA domain TLB invalidation policy: strict mode
[    0.255246] SCSI subsystem initialized
[    0.256728] usbcore: registered new interface driver usbfs
[    0.257155] usbcore: registered new interface driver hub
[    0.257501] usbcore: registered new device driver usb
[    0.258703] mc: Linux media interface: v0.10
[    0.259091] videodev: Linux video capture interface: v2.00
[    0.260033] pps_core: LinuxPPS API ver. 1 registered
[    0.260306] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    0.260646] PTP clock support registered
[    0.263957] Advanced Linux Sound Architecture Driver Initialized.
[    0.275807] Bluetooth: Core ver 2.22
[    0.276194] NET: Registered PF_BLUETOOTH protocol family
[    0.276328] Bluetooth: HCI device and connection manager initialized
[    0.276761] Bluetooth: HCI socket layer initialized
[    0.276945] Bluetooth: L2CAP socket layer initialized
[    0.277292] Bluetooth: SCO socket layer initialized
[    0.279818] vgaarb: loaded
[    0.283189] clocksource: Switched to clocksource arch_sys_counter
[    0.289133] VFS: Disk quotas dquot_6.6.0
[    0.289446] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
bytes)
[    0.290358] FS-Cache: Loaded
[    0.291617] CacheFiles: Loaded
[    0.298740] NET: Registered PF_INET protocol family
[    0.300444] IP idents hash table entries: 32768 (order: 6, 262144 bytes,
linear)
[    0.316440] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2,
16384 bytes, linear)
[    0.316948] Table-perturb hash table entries: 65536 (order: 6, 262144
bytes, linear)
[    0.317307] TCP established hash table entries: 16384 (order: 5, 131072
bytes, linear)
[    0.318245] TCP bind hash table entries: 16384 (order: 7, 524288 bytes,
linear)
[    0.319865] TCP: Hash tables configured (established 16384 bind 16384)
[    0.323421] MPTCP token hash table entries: 2048 (order: 3, 49152 bytes,
linear)
[    0.323880] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    0.324323] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes,
linear)
[    0.326061] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.328752] PCI: CLS 0 bytes, default 64
[    0.334033] Trying to unpack rootfs image as initramfs...
[    0.336332] kvm [1]: HYP mode not available
[    0.343844] Initialise system trusted keyrings
[    0.346555] workingset: timestamp_bits=3D46 max_order=3D19 bucket_order=
=3D0
[    0.347547] zbud: loaded
[    0.357060] Key type cifs.idmap registered
[    0.358007] fuse: init (API version 7.39)
[    0.401184] Key type asymmetric registered
[    0.401438] Asymmetric key parser 'x509' registered
[    0.401856] Block layer SCSI generic (bsg) driver version 0.4 loaded
(major 244)
[    0.403283] io scheduler mq-deadline registered
[    0.403590] io scheduler kyber registered
[    0.404135] io scheduler bfq registered
[    0.419403] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000
mem_size:0x00000000(0 MiB)
[    0.474856] brd: module loaded
[    0.505166] loop: module loaded
[    0.508386] Loading iSCSI transport class v2.0-870.
[    0.518541] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for
information.
[    0.518727] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <
Jason@zx2c4.com>. All Rights Reserved.
[    0.530178] tun: Universal TUN/TAP device driver, 1.6
[    0.533835] usbcore: registered new interface driver brcmfmac
[    0.534107] usbcore: registered new device driver r8152-cfgselector
[    0.534455] usbcore: registered new interface driver r8152
[    0.534682] usbcore: registered new interface driver lan78xx
[    0.534915] usbcore: registered new interface driver asix
[    0.535376] usbcore: registered new interface driver ax88179_178a
[    0.535608] usbcore: registered new interface driver cdc_ether
[    0.535863] usbcore: registered new interface driver smsc95xx
[    0.536193] usbcore: registered new interface driver net1080
[    0.536532] usbcore: registered new interface driver cdc_subset
[    0.536771] usbcore: registered new interface driver zaurus
[    0.537039] usbcore: registered new interface driver cdc_ncm
[    0.537301] usbcore: registered new interface driver r8153_ecm
[    0.538269] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
[    0.538549] dwc_otg: FIQ enabled
[    0.538629] dwc_otg: NAK holdoff enabled
[    0.538725] dwc_otg: FIQ split-transaction FSM enabled
[    0.538906] Module dwc_common_port init
[    0.541229] usbcore: registered new interface driver cdc_acm
[    0.541356] cdc_acm: USB Abstract Control Model driver for USB modems
and ISDN adapters
[    0.542269] usbcore: registered new interface driver uas
[    0.542583] usbcore: registered new interface driver usb-storage
[    0.543322] usbcore: registered new interface driver cp210x
[    0.543681] usbserial: USB Serial support registered for cp210x
[    0.543973] usbcore: registered new interface driver pl2303
[    0.544176] usbserial: USB Serial support registered for pl2303
[    0.547458] mousedev: PS/2 mouse device common for all mice
[    0.547725] usbcore: registered new interface driver xpad
[    0.547949] usbcore: registered new interface driver usb_acecad
[    0.548186] usbcore: registered new interface driver aiptek
[    0.548462] usbcore: registered new interface driver hanwang
[    0.548692] usbcore: registered new interface driver kbtab
[    0.549180] usbcore: registered new interface driver usbtouchscreen
[    0.550460] i2c_dev: i2c /dev entries driver
[    0.553959] ir_imon_decoder: IR iMON protocol handler initialized
[    0.554110] IR JVC protocol handler initialized
[    0.554225] IR MCE Keyboard/mouse protocol handler initialized
[    0.554357] IR NEC protocol handler initialized
[    0.554476] IR RC5(x/sz) protocol handler initialized
[    0.554593] IR RC6 protocol handler initialized
[    0.554711] IR RCMM protocol handler initialized
[    0.554829] IR SANYO protocol handler initialized
[    0.555046] IR Sharp protocol handler initialized
[    0.555351] IR Sony protocol handler initialized
[    0.555469] IR XMP protocol handler initialized
[    0.556083] usbcore: registered new interface driver uvcvideo
[    0.557793] device-mapper: uevent: version 1.0.3
[    0.558904] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised:
dm-devel@redhat.com
[    0.560836] Bluetooth: HCI UART driver ver 2.3
[    0.561007] Bluetooth: HCI UART protocol H4 registered
[    0.561440] Bluetooth: HCI UART protocol Broadcom registered
[    0.563240] sdhci: Secure Digital Host Controller Interface driver
[    0.563373] sdhci: Copyright(c) Pierre Ossman
[    0.563861] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.565404] ledtrig-cpu: registered to indicate activity on CPUs
[    0.567595] hid: raw HID events driver (C) Jiri Kosina
[    0.578778] usbcore: registered new interface driver usbhid
[    0.579196] usbhid: USB HID core driver
[    0.582877] ashmem: initialized
[    0.584380] SPI driver st-accel-spi has no spi_device_id for
st,lis302dl-spi
[    0.584551] SPI driver st-accel-spi has no spi_device_id for
st,lis3lv02dl-accel
[    0.584745] SPI driver st-accel-spi has no spi_device_id for
st,lis3dh-accel
[    0.584935] SPI driver st-accel-spi has no spi_device_id for
st,lsm330d-accel
[    0.585076] SPI driver st-accel-spi has no spi_device_id for
st,lsm330dl-accel
[    0.585242] SPI driver st-accel-spi has no spi_device_id for
st,lsm330dlc-accel
[    0.585385] SPI driver st-accel-spi has no spi_device_id for
st,lis331dlh-accel
[    0.585526] SPI driver st-accel-spi has no spi_device_id for
st,lsm330-accel
[    0.585663] SPI driver st-accel-spi has no spi_device_id for
st,lsm303agr-accel
[    0.585803] SPI driver st-accel-spi has no spi_device_id for
st,lis2dh12-accel
[    0.585944] SPI driver st-accel-spi has no spi_device_id for
st,lng2dm-accel
[    0.586094] SPI driver st-accel-spi has no spi_device_id for
st,h3lis331dl-accel
[    0.586280] SPI driver st-accel-spi has no spi_device_id for
st,lis331dl-accel
[    0.586460] SPI driver st-accel-spi has no spi_device_id for
st,lsm303c-accel
[    0.587705] SPI driver st-magn-spi has no spi_device_id for
st,lis3mdl-magn
[    0.587923] SPI driver st-magn-spi has no spi_device_id for
st,lsm303agr-magn
[    0.588163] SPI driver st-magn-spi has no spi_device_id for
st,lsm9ds1-magn
[    0.588410] SPI driver st-magn-spi has no spi_device_id for
st,lsm303c-magn
[    0.596185] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
counters available
[    0.600270] usbcore: registered new interface driver snd-usb-audio
[    0.607077] Mirror/redirect action on
[    0.607525] netem: version 1.3
[    0.607614] u32 classifier
[    0.607673]     input device check on
[    0.607755]     Actions configured
[    0.615221] xt_time: kernel timezone is -0000
[    0.615693] gre: GRE over IPv4 demultiplexor driver
[    0.615911] IPv4 over IPsec tunneling driver
[    0.621107] Initializing XFRM netlink socket
[    0.621440] IPsec XFRM device driver
[    0.622363] NET: Registered PF_INET6 protocol family
[    0.635597] Segment Routing with IPv6
[    0.635871] In-situ OAM (IOAM) with IPv6
[    0.636820] mip6: Mobile IPv6
[    0.641935] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.646292] NET: Registered PF_PACKET protocol family
[    0.646553] NET: Registered PF_KEY protocol family
[    0.646756] Key type dns_resolver registered
[    0.779288] registered taskstats version 1
[    0.781971] Loading compiled-in X.509 certificates
[    0.852683] Key type .fscrypt registered
[    0.852897] Key type fscrypt-provisioning registered
[    0.864447] of_cfs_init
[    0.865145] of_cfs_init: OK
[    0.870305] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    1.478027] Freeing initrd memory: 14612K
[    1.503691] Loaded X.509 cert 'benh@debian.org:
577e021cb980e0e820821ba7b54b4961b8b4fadf'
[    1.504674] Loaded X.509 cert 'romain.perier@gmail.com:
3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
[    1.505470] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    1.506197] Loaded X.509 cert 'wens:
61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    1.512240] clk: Disabling unused clocks
[    1.512725] ALSA device list:
[    1.512871]   No soundcards found.
[    1.517373] uart-pl011 9040000.pl011: no DMA platform data
[    1.607308] Freeing unused kernel memory: 1792K
[    1.610100] Run /init as init process
[    1.610246]   with arguments:
[    1.610366]     /init
[    1.610472]   with environment:
[    1.610544]     HOME=3D/
[    1.610615]     TERM=3Dlinux
linker: Warning: "[vdso]" unused DT entry: unknown processor-specific (type
0x70000001 arg 0x0) (ignoring)
WARNING: linker: Warning: "[vdso]" unused DT entry: unknown
processor-specific (type 0x70000001 arg 0x0) (ignoring)
[    1.971090] init: init first stage started!
[    1.974290] init: ForceNormalBoot::twrp_fastboot: 1
[    1.974628] init: ForceNormalBoot::normal_boot: 0
[    1.976478] init: Unable to open /lib/modules, skipping module loading.
[    1.977251] init: ForceNormalBoot::twrp_fastboot: 1
[    1.977534] init: ForceNormalBoot::normal_boot: 0
[    1.978174] init: First stage mount skipped (recovery mode)
[    1.982840] init: [libfs_mgr]ReadFstabFromDt(): failed to read fstab
from dt
[    1.987898] init: [libfs_mgr]Warning: unknown flag: backup=3D1
[    1.988241] init: [libfs_mgr]Warning: unknown flag: wipeingui
[    2.002691] printk: init: 6 output lines suppressed due to ratelimiting
[    2.016195] linker: Warning: "[vdso]" unused DT entry: unknown
processor-specific (type 0x70000001 arg 0x0) (ignoring)
[    2.016510] WARNING: linker:
[    2.016604] Warning: "
[    2.016752] [vdso]
[    2.016889] " unused DT entry:
[    2.017021] unknown processor-specific
[    2.017168]  (type
[    2.017381] 0x70000001
[    2.017512]  arg
[    2.017647] 0x0
[    2.202622] printk: init: 2 output lines suppressed due to ratelimiting
[    2.208265] init: [libfs_mgr]Warning: unknown flag: backup=3D1
[    2.208576] init: [libfs_mgr]Warning: unknown flag: wipeingui
[    2.208914] init: [libfs_mgr]Warning: unknown flag: backup=3D1
[    2.209219] init: [libfs_mgr]Warning: unknown flag: wipeingui
[    2.209836] init: [libfs_mgr]Warning: unknown flag: backup=3D1
[    2.210125] init: [libfs_mgr]Warning: unknown flag: wipeingui
[    2.215144] init: Skipping mount of system_ext, system is not dynamic.
[    2.215880] init: Loading SELinux policy
[    2.266430] SELinux:  Permission nlmsg_getneigh in class
netlink_route_socket not defined in policy.
[    2.266759] SELinux:  Permission perfmon in class capability2 not
defined in policy.
[    2.266903] SELinux:  Permission bpf in class capability2 not defined in
policy.
[    2.267119] SELinux:  Permission checkpoint_restore in class capability2
not defined in policy.
[    2.267369] SELinux:  Permission perfmon in class cap2_userns not
defined in policy.
[    2.267524] SELinux:  Permission bpf in class cap2_userns not defined in
policy.
[    2.267653] SELinux:  Permission checkpoint_restore in class cap2_userns
not defined in policy.
[    2.267956] SELinux:  Class mctp_socket not defined in policy.
[    2.268106] SELinux:  Class anon_inode not defined in policy.
[    2.268256] SELinux:  Class io_uring not defined in policy.
[    2.268386] SELinux:  Class user_namespace not defined in policy.
[    2.268521] SELinux: the above unknown classes and permissions will be
denied
[    2.288331] SELinux:  policy capability network_peer_controls=3D1
[    2.288500] SELinux:  policy capability open_perms=3D1
[    2.288618] SELinux:  policy capability extended_socket_class=3D1
[    2.288751] SELinux:  policy capability always_check_network=3D0
[    2.288881] SELinux:  policy capability cgroup_seclabel=3D0
[    2.289005] SELinux:  policy capability nnp_nosuid_transition=3D1
[    2.289137] SELinux:  policy capability genfs_seclabel_symlinks=3D0
[    2.289319] SELinux:  policy capability ioctl_skip_cloexec=3D0
[    2.307140] audit: type=3D1403 audit(2.288:2): auid=3D4294967295
ses=3D4294967295 lsm=3Dselinux res=3D1
[    2.308695] selinux: SELinux: Loaded policy from /sepolicy
[    2.308967] selinux:
[    2.359528] printk: init: 2 output lines suppressed due to ratelimiting
[    2.556011] init: init second stage started!
[    2.776035] init: Using Android DT directory
/proc/device-tree/firmware/android/
[    2.797264] init: Couldn't load property file
'/system/etc/prop.default': open() failed: No such file or directory: No
such file or directory
[    2.846779] init: Couldn't load property file '/system/build.prop':
open() failed: No such file or directory: No such file or directory
[    2.847869] init: Couldn't load property file '/system_ext/build.prop':
open() failed: No such file or directory: No such file or directory
[    2.848540] init: Couldn't load property file '/vendor/default.prop':
open() failed: No such file or directory: No such file or directory
[    2.849165] init: Couldn't load property file '/vendor/build.prop':
open() failed: No such file or directory: No such file or directory
[    2.849830] init: Couldn't load property file '/odm/etc/build.prop':
open() failed: No such file or directory: No such file or directory
[    2.850546] init: Couldn't load property file '/product/build.prop':
open() failed: No such file or directory: No such file or directory
[    2.851394] init: Couldn't load property file '/factory/factory.prop':
open() failed: No such file or directory: No such file or directory
[    3.089359] cgroup: Disabled controller 'memory'
[    3.092460] cgroup: Unknown subsys name 'schedtune'
[    3.120187] audit: type=3D1400 audit(3.100:3): avc:  denied  { perfmon }
for  pid=3D1 comm=3D"init" capability=3D38  scontext=3Du:r:init:s0
tcontext=3Du:r:init:s0 tclass=3Dcapability2 permissive=3D1
[    3.426415] ueventd: ueventd started!
[    3.448141] selinux: SELinux: Loaded file_contexts
[    3.448414] selinux:
[    3.450283] ueventd: Parsing file /system/etc/ueventd.rc...
[    3.455379] ueventd: Parsing file /vendor/ueventd.rc...
[    3.455868] ueventd: Unable to read config file '/vendor/ueventd.rc':
open() failed: No such file or directory
[    3.456438] ueventd: Parsing file /odm/ueventd.rc...
[    3.456890] ueventd: Unable to read config file '/odm/ueventd.rc':
open() failed: No such file or directory
[    3.457440] ueventd: Parsing file /ueventd.rpi4.rc...
[    3.457909] ueventd: Unable to read config file '/ueventd.rpi4.rc':
open() failed: No such file or directory
[    4.699678] audit: type=3D1400 audit(4.684:4): avc:  denied  { entrypoin=
t
} for  pid=3D96 comm=3D"init" path=3D"/system/bin/logd" dev=3D"rootfs" ino=
=3D271
scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile permis=
sive=3D1
[    4.706631] audit: type=3D1400 audit(4.688:5): avc:  denied  { map } for
 pid=3D96 comm=3D"logd" path=3D"/system/bin/logd" dev=3D"rootfs" ino=3D271
scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile permis=
sive=3D1
[    4.707481] audit: type=3D1400 audit(4.688:6): avc:  denied  { read } fo=
r
 pid=3D96 comm=3D"logd" path=3D"/system/bin/logd" dev=3D"rootfs" ino=3D271
scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile permis=
sive=3D1
[    4.708316] audit: type=3D1400 audit(4.688:7): avc:  denied  { execute }
for  pid=3D96 comm=3D"logd" path=3D"/system/bin/logd" dev=3D"rootfs" ino=3D=
271
scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile permis=
sive=3D1
[    4.729108] audit: type=3D1400 audit(4.712:8): avc:  denied  { getattr }
for  pid=3D96 comm=3D"logd" path=3D"/system/bin/logd" dev=3D"rootfs" ino=3D=
271
scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile permis=
sive=3D1
[    4.743227] audit: type=3D1400 audit(4.724:9): avc:  denied  { read } fo=
r
 pid=3D96 comm=3D"logd" name=3D"bin" dev=3D"rootfs" ino=3D167 scontext=3Du:=
r:logd:s0
tcontext=3Du:object_r:rootfs:s0 tclass=3Ddir permissive=3D1
[    4.755432] audit: type=3D1400 audit(4.736:10): avc:  denied  { open } f=
or
 pid=3D96 comm=3D"logd" path=3D"/system/lib64/libsysutils.so" dev=3D"rootfs=
"
ino=3D6255 scontext=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3D=
file
permissive=3D1
[    4.937922] logd: Cannot read /system/etc/event-log-tags
[    4.964388] file system registered
[    4.969588] logd.auditd: start
[    4.970233] logd.klogd: 4955041232
[    5.132743] type=3D1400 audit(5.108:14): avc: denied { create } for
comm=3D"hwservicemanage" scontext=3Du:r:recovery:s0 tcontext=3Du:r:recovery=
:s0
tclass=3Dnetlink_selinux_socket permissive=3D1
[    5.136378] type=3D1400 audit(5.112:15): avc: denied { bind } for
comm=3D"hwservicemanage" scontext=3Du:r:recovery:s0 tcontext=3Du:r:recovery=
:s0
tclass=3Dnetlink_selinux_socket permissive=3D1
[    5.143332] type=3D1400 audit(5.112:16): avc: denied { read } for
comm=3D"hwservicemanage" name=3D"perms" dev=3D"selinuxfs" ino=3D67112391
scontext=3Du:r:recovery:s0 tcontext=3Du:object_r:selinuxfs:s0 tclass=3Ddir
permissive=3D1
[    5.146297] type=3D1400 audit(5.112:17): avc: denied { open } for
comm=3D"hwservicemanage" path=3D"/sys/fs/selinux/class/hwservice_manager/pe=
rms"
dev=3D"selinuxfs" ino=3D67112391 scontext=3Du:r:recovery:s0
tcontext=3Du:object_r:selinuxfs:s0 tclass=3Ddir permissive=3D1
[    5.174030] type=3D1400 audit(5.124:18): avc: denied { write } for
comm=3D"hwservicemanage" name=3D"access" dev=3D"selinuxfs" ino=3D6
scontext=3Du:r:recovery:s0 tcontext=3Du:object_r:selinuxfs:s0 tclass=3Dfile
permissive=3D1
[    5.177477] type=3D1400 audit(5.124:19): avc: denied { compute_av } for
comm=3D"hwservicemanage" scontext=3Du:r:recovery:s0
tcontext=3Du:object_r:kernel:s0 tclass=3Dsecurity permissive=3D1
[    5.181388] type=3D1400 audit(5.152:20): avc: denied { set_context_mgr }
for comm=3D"hwservicemanage" scontext=3Du:r:recovery:s0
tcontext=3Du:r:recovery:s0 tclass=3Dbinder permissive=3D1
WARNING: linker: Warning: "[vdso]" unused DT entry: unknown
processor-specific (type 0x70000001 arg 0x0) (ignoring)

console:/ #

[    7.812969] init: Service 'recovery' (pid 106) received signal 11
[    7.813381] init: Sending signal 9 to service 'recovery' (pid 106)
process group...
[    7.814694] libprocessgroup: Successfully killed process cgroup uid 0
pid 106 in 0ms
[    7.820960] init: Untracked pid 110 exited with status 1
[   10.206834] init: starting service 'recovery'...
[   10.211672] init: Created socket '/dev/socket/recovery', mode 422, user
1000, group 1000
[   10.313714] init: starting service 'adbd'...
[   10.319354] init: Created socket '/dev/socket/adbd', mode 660, user
1000, group 1000
[   10.597898] read descriptors
[   10.598630] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   10.599621] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   10.600467] read strings
[   10.613340] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   10.632907] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 1ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   11.678635] read descriptors
[   11.678883] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   11.679695] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   11.680663] read strings
[   11.760913] platform gpio-keys: deferred probe pending
[   12.761137] read descriptors
[   12.761449] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   12.761972] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   12.762607] read strings
[   13.826065] read descriptors
[   13.826428] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   13.827903] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   13.829154] read strings
[   13.833730] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   13.839092] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   13.840732] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   14.889512] read descriptors
[   14.889701] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   14.890177] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   14.890767] read strings
[   14.895430] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   14.900587] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   14.902076] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   15.224749] init: starting service 'recovery'...
[   15.228494] init: Created socket '/dev/socket/recovery', mode 422, user
1000, group 1000
[   15.681727] init: Unable to set property 'ro.twrp.boot' from uid:0 gid:0
pid:124: Read-only property was already set
[   15.686406] init: Unable to set property 'ro.twrp.version' from uid:0
gid:0 pid:124: Read-only property was already set
[   15.949039] read descriptors
[   15.949240] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   15.949733] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   15.950378] read strings
[   17.016978] read descriptors
[   17.017147] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   17.017426] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   17.017781] read strings
[   18.132636] read descriptors
[   18.133219] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   18.134486] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   18.137501] read strings
[   19.197574] read descriptors
[   19.197760] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   19.198136] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   19.198665] read strings
[   19.208502] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   19.214749] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   19.216726] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   20.237060] init: starting service 'recovery'...
[   20.240672] init: Created socket '/dev/socket/recovery', mode 422, user
1000, group 1000
[   20.282811] read descriptors
[   20.283381] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   20.283889] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   20.284536] read strings
[   20.292396] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   20.300513] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   20.302642] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   20.754865] init: Unable to set property 'ro.twrp.boot' from uid:0 gid:0
pid:131: Read-only property was already set
[   20.759553] init: Unable to set property 'ro.twrp.version' from uid:0
gid:0 pid:131: Read-only property was already set
[   21.349790] read descriptors
[   21.350005] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   21.350465] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   21.352780] read strings
[   22.423098] read descriptors
[   22.423361] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   22.423651] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   22.424144] read strings
[   23.481363] read descriptors
[   23.481606] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   23.482130] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   23.482813] read strings
[   24.553075] read descriptors
[   24.553241] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   24.553597] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   24.553975] read strings
[   24.558331] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   24.563898] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   24.565567] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   25.248962] init: starting service 'recovery'...
[   25.253276] init: Created socket '/dev/socket/recovery', mode 422, user
1000, group 1000
[   25.641207] read descriptors
[   25.641328] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   25.641616] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   25.642040] read strings
[   25.648473] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   25.669450] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 1ms and failed: symlink() failed: File exists
[   25.672542] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   25.706240] init: Unable to set property 'ro.twrp.boot' from uid:0 gid:0
pid:139: Read-only property was already set
[   25.710372] init: Unable to set property 'ro.twrp.version' from uid:0
gid:0 pid:139: Read-only property was already set
[   26.709759] read descriptors
[   26.710096] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   26.710921] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   26.712463] read strings
[   27.782228] read descriptors
[   27.782350] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   27.782569] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   27.782877] read strings
[   28.849863] read descriptors
[   28.850115] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   28.850775] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   28.852359] read strings
[   29.942409] read descriptors
[   29.942646] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   29.943232] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   29.943746] read strings
[   29.949390] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   29.955577] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   29.957043] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   30.268078] init: starting service 'recovery'...
[   30.286298] init: Created socket '/dev/socket/recovery', mode 422, user
1000, group 1000
[   30.726944] init: Unable to set property 'ro.twrp.boot' from uid:0 gid:0
pid:147: Read-only property was already set
[   30.731529] init: Unable to set property 'ro.twrp.version' from uid:0
gid:0 pid:147: Read-only property was already set
[   31.017959] read descriptors
[   31.018182] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   31.018669] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   31.019885] read strings
[   31.028871] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   31.037564] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   31.039173] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   32.092703] read descriptors
[   32.093392] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   32.093996] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   32.095530] read strings
[   33.149642] read descriptors
[   33.149854] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   33.150334] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   33.150887] read strings
[   34.230547] read descriptors
[   34.230852] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   34.233227] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   34.234420] read strings
[   35.301592] init: starting service 'recovery'...
[   35.319970] init: Created socket '/dev/socket/recovery', mode 422, user
1000, group 1000
[   35.320441] read descriptors
[   35.320589] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   35.321087] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   35.322062] read strings
[   35.382841] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   35.391787] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   35.393645] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   35.785517] init: Unable to set property 'ro.twrp.boot' from uid:0 gid:0
pid:156: Read-only property was already set
[   35.789909] init: Unable to set property 'ro.twrp.version' from uid:0
gid:0 pid:156: Read-only property was already set
[   36.421841] read descriptors
[   36.422877] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   36.426638] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   36.427376] read strings
[   36.432055] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   36.438294] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   36.440095] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   37.502771] read descriptors
[   37.502908] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   37.503568] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   37.504160] read strings
[   38.575803] read descriptors
[   38.576299] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   38.577608] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   38.578173] read strings

|console:/ #

[   39.633521] read descriptors
[   39.633726] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   39.634107] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   39.634647] read strings
[   40.334108] init: starting service 'recovery'...
[   40.338087] init: Created socket '/dev/socket/recovery', mode 422, user
1000, group 1000
[   40.721751] read descriptors
[   40.721951] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   40.722415] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   40.723179] read strings
[   40.729072] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   40.742406] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   40.745270] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   40.789765] init: Unable to set property 'ro.twrp.boot' from uid:0 gid:0
pid:164: Read-only property was already set
[   40.793898] init: Unable to set property 'ro.twrp.version' from uid:0
gid:0 pid:164: Read-only property was already set
[   41.794291] read descriptors
[   41.794526] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   41.795504] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   41.796355] read strings
[   41.802136] init: processing action (sys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1) from
(/system/etc/init/hw/init.rc:208)
[   41.807484] init: Command 'symlink
/config/usb_gadget/g1/functions/ffs.adb
/config/usb_gadget/g1/configs/b.1/f1' action=3Dsys.usb.config=3Dadb &&
sys.usb.configfs=3D1 && sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:=
211)
took 0ms and failed: symlink() failed: File exists
[   41.809032] init: Command 'write /config/usb_gadget/g1/UDC
${sys.usb.controller}' action=3Dsys.usb.config=3Dadb && sys.usb.configfs=3D=
1 &&
sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed=
:
property 'sys.usb.controller' doesn't exist while expanding
'${sys.usb.controller}'
[   42.865948] read descriptors
[   42.866163] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   42.866523] bcdVersion must be 0x0100, stored in Little Endian order.
Userspace driver should be fixed, accepting 0x0001 for compatibility.
[   42.866910] read strings

On Tue, Aug 27, 2024 at 3:04=E2=80=AFPM Mario Marietto <marietto2008@gmail.=
com>
wrote:

> Hello to everyone.
>
> As I said before,some years ago I was able to emulate Android on my Jetso=
n
> Nano. It was a special version of Android,prepared by antmicro and the
> github is located here :
>
> https://github.com/antmicro/kvm-aosp-jetson-nano
>
> I would like to compile it again and try to emulate it on my Jetson Nano
> again and on my Intel PC + Ubuntu 24.04 x64 bit.
> I followed the tutorial again and I've been able to create the Android im=
g
> files below without problems :
>
>
> out/target/product/generic_arm64/vendor.img
> out/target/product/generic_arm64/system.img
> out/target/product/generic_arm64/userdata.img
> out/target/product/generic_arm64/ramdisk.img
>
> Now I need the kernel,so I tried to fetch the kernel sources to compile
> it. Unfortunately the github is old and some links are broken.
> I want to ask your help to fix the broken link as better as possible :
>
> root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo init -u
> https://android.googlesource.com/kernel/manifest -b q-common-android-4.14
>
> Downloading Repo source from https://gerrit.googlesource.com/git-repo
>
> Your identity is: ziomario <marietto2008@gmail.com>
> If you want to change this, please re-run 'repo init' with --config-name
>
> repo has been initialized in /mnt/sdl1/aosp_kernel
>
> root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
>
>
> Fetching:  0% (0/8) 0:07 | 2 jobs | 0:05 kernel/build @ buildRicezione
> degli oggetti:  84% (14706/17
>
> Fetching:  0% (0/8) 0:07 | 2 jobs | 0:06 kernel/build @ buildRicezione
> degli oggetti:  85% (14881/17
> Ricezione degli oggetti: 100% (17506/17506), 12.23 MiB | 46.57 MiB/s,
> fatto.
> Risoluzione dei delta: 100% (8869/8869), fatto.
> Fetching: 50% (4/8) 9:11 | 1 job | 9:01 kernel/common @ commonRicezione
> degli oggetti:   0% (1/12468
> Fetching: 50% (4/8) 9:12 | 1 job | 9:02 kernel/common @ commonRicezione
> degli oggetti:   0% (80382/1
> Fetching: 50% (4/8) 9:12 | 1 job | 9:03 kernel/common @ commonRicezione
> degli oggetti:   1% (124682/
> Fetching: 50% (4/8) 9:13 | 1 job | 9:03 kernel/common @ commonRicezione
> degli oggetti:   1% (163592/
> Fetching: 50% (4/8) 9:14 | 1 job | 9:04 kernel/common @ commonRicezione
> degli oggetti:   1% (245123/
> Fetching: 50% (4/8) 9:15 | 1 job | 9:05 kernel/common @ commonRicezione
> degli oggetti:   2% (333147/
> Fetching: 50% (4/8) 9:15 | 1 job | 9:06 kernel/common @ commonRicezione
> degli oggetti:   3% (374044/
> .....
> Fetching: 50% (4/8) 12:06 | 1 job | 11:57 kernel/common @
> commonRisoluzione dei delta:  98% (1023355
> Fetching: 50% (4/8) 12:07 | 1 job | 11:58 kernel/common @
> commonRisoluzione dei delta:  99% (1028207
> Fetching: 50% (4/8) 12:08 | 1 job | 11:59 kernel/common @
> commonRisoluzione dei delta: 100% (1034277
> Risoluzione dei delta: 100% (10342775/10342775), fatto.
>
> Fetching: 50% (4/8) 13:44 | 1 job | 13:34 kernel/common @ common
>
>
> fatal: can't find remote refs/heads/android-4.14-q
>
> kernel/common:
>
> kernel/common: sleeping 4.0 seconds before retrying
>
> error: Cannot fetch kernel/common from
> https://android.googlesource.com/kernel/common
>
>
> Fetching: 50% (4/8) 13:45 | 1 job | 0:01 kernel/tests @ kernel/tests
>
> Ricezione degli oggetti:
>
>
> Ricezione degli oggetti: 100% (11797/11797), 4.91 MiB | 48.34 MiB/s,
> fatto.
> Risoluzione dei delta: 100% (2123/2123), fatto.
> Fetching: 100% (8/8), done in 18m26.961s
> Fetching:  0% (0/1) 0:04 | 1 job | 0:04 kernel/common @ common
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
>
> kernel/common:
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> kernel/common: sleeping 4.0 seconds before retrying
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> error: Cannot fetch kernel/common from
> https://android.googlesource.com/kernel/common
> Fetching: 100% (1/1), done in 5.046s
> error: Cannot checkout kernel/common: ManifestInvalidRevisionError:
> revision android-4.14-q in kernel/common not found
> error: in `sync`: revision android-4.14-q in kernel/common not found
> root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
> Fetching:  0% (0/8) 0:09 | 2 jobs | 0:07 kernel/common @ common
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
>
> kernel/common:
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> kernel/common: sleeping 4.0 seconds before retrying
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> error: Cannot fetch kernel/common from
> https://android.googlesource.com/kernel/common
> Fetching: 100% (8/8), done in 12.927s
> Fetching:  0% (0/1) 0:04 | 1 job | 0:04 kernel/common @ common
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
>
> kernel/common:
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> kernel/common: sleeping 4.0 seconds before retrying
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> error: Cannot fetch kernel/common from
> https://android.googlesource.com/kernel/common
> Fetching: 100% (1/1), done in 5.008s
> error: Cannot checkout kernel/common: ManifestInvalidRevisionError:
> revision android-4.14-q in kernel/common not found
> error: in `sync`: revision android-4.14-q in kernel/common not found
> root@Z390-AORUS-PRO-DEST:/mnt/sdl1/aosp_kernel# repo sync
> Fetching: 50% (4/8) 0:04 | 1 job | 0:03 kernel/common @ common
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
>
> kernel/common:
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> kernel/common: sleeping 4.0 seconds before retrying
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> error: Cannot fetch kernel/common from
> https://android.googlesource.com/kernel/common
> Fetching: 100% (8/8), done in 5.696s
> Fetching:  0% (0/1) 0:04 | 1 job | 0:04 kernel/common @ common
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> kernel/common:
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> kernel/common: sleeping 4.0 seconds before retrying
> fatal: impossibile trovare il riferimento remoto refs/heads/android-4.14-=
q
> error: Cannot fetch kernel/common from
> https://android.googlesource.com/kernel/common
> Fetching: 100% (1/1), done in 4.930s
> error: Cannot checkout kernel/common: ManifestInvalidRevisionError:
> revision android-4.14-q in kernel/common not found
> error: in `sync`: revision android-4.14-q in kernel/common not found
>
> thanks.
>
>
> On Sun, Aug 25, 2024 at 5:58=E2=80=AFPM Mario Marietto <marietto2008@gmai=
l.com>
> wrote:
>
>> ok,I've understood that initrd is ramdisk.img,so :
>>
>> qemu-system-aarch64 \
>>         -smp 4 \
>>         -m 2048 \
>>         -cpu cortex-a72 \
>>         -machine virt \
>>         -initrd
>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/boot/ramdisk.img
>> \
>>         -kernel
>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/boot/Image
>> \
>>         -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>>         -display sdl,gl=3Don \
>>         -device usb-ehci \
>>         -device usb-kbd \
>>         -device virtio-tablet-pci \
>>         -usb \
>>         -serial stdio \
>>         -drive
>> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/linea=
ge-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/lineage-21.0-20240618-UNOFF=
ICIAL-KonstaKANG-rpi4-atv.img,format=3Draw,index=3D0,media=3Ddisk
>> \
>>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootde=
lay=3D5
>> root=3D/dev/vdd1 rw"
>>
>> =3D=3D=3D=3D=3D=3D>
>>
>> [    2.862352] Run /init as init process
>> [    3.119264] magiskinit: open /proc/bootconfig failed with 2: No such
>> file or directory
>> [    4.741230] init: init first stage started!
>> [    4.754789] init: Unable to open /lib/modules, skipping module
>> loading.
>> [    4.788159] init: Copied ramdisk prop to
>> /second_stage_resources/system/etc/ramdisk/build.prop
>> [    4.804110] init: [libfstab] Using Android DT directory
>> /proc/device-tree/firmware/android/
>> [    4.811371] init: [libfstab] ReadFstabFromDt(): failed to read fstab
>> from dt
>> [    4.825409] init: [libfstab] ReadDefaultFstab(): failed to find devic=
e
>> default fstab
>> [    4.828176] init: Failed to create FirstStageMount : failed to read
>> default fstab for first stage mount
>> [    4.831564] init: FirstStageMount not available
>> [    4.890952] init: InitFatalReboot: signal 6
>> [    5.063207] init:   #00 pc 00000000003b7764  /init
>> (unwindstack::AndroidLocalUnwinder::InternalUnwind(std::__1::optional<in=
t>,
>> unwin
>> dstack::AndroidUnwinderData&)+96) (BuildId:
>> 48bce72d2f0c6e6c34530a67b6b7b3be)
>> [    5.064741] init:   #01 pc 00000000003ab4b8  /init
>> (android::init::InitFatalReboot(int)+204) (BuildId:
>> 48bce72d2f0c6e6c34530a67b6b7b
>> 3be)
>> [    5.066931] init:   #02 pc 00000000003abb48  /init
>> (android::init::InstallRebootSignalHandlers()::$_0::__invoke(int)+32)
>> (BuildId: 4
>> 8bce72d2f0c6e6c34530a67b6b7b3be)
>> [    5.068545] init:   #03 pc 0000000000000854  [vdso]
>> [    5.069555] init:   #04 pc 000000000035285c  /init (abort+164)
>> (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
>> [    5.072153] init:   #05 pc 00000000003b029c  /init
>> (android::init::InitAborter(char const*)+44) (BuildId:
>> 48bce72d2f0c6e6c34530a67b6
>> b7b3be)
>> [    5.075216] init:   #06 pc 00000000003131d0  /init
>> (android::base::SetAborter(std::__1::function<void (char
>> const*)>&&)::$_0::__invo
>> ke(char const*)+80) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be)
>> [    5.077609] init:   #07 pc 00000000003128f4  /init
>> (android::base::LogMessage::~LogMessage()+356) (BuildId:
>> 48bce72d2f0c6e6c34530a67
>> b6b7b3be)
>> [    5.079506] init:   #08 pc 00000000003a1ec0  /init
>> (android::init::FirstStageMain(int, char**)+13140) (BuildId:
>> 48bce72d2f0c6e6c3453
>> 0a67b6b7b3be)
>> [    5.081404] init:   #09 pc 0000000000350e9c  /init
>> (__real_libc_init(void*, void (*)(), int (*)(int, char**, char**),
>> structors_arra
>> y_t const*, bionic_tcb*)+688) (BuildId: 48bce72d2f0c6e6c34530a67b6b7b3be=
)
>> [    5.083648] init: Reboot ending, jumping to kernel
>> [    5.091556] reboot: Restarting system with command 'bootloader'
>>
>>
>>
>> On Sun, Aug 25, 2024 at 3:31=E2=80=AFPM Mario Marietto <marietto2008@gma=
il.com>
>> wrote:
>>
>>> The file below is called config.txt and it's available only if Android
>>> is installed physically. I don't see it when I unpack the main img file=
.
>>> Probably it is embedded inside the file 0.fat,or 1.img,who knows. Anywa=
y,Is
>>> useful to understand what's the name of the initrd file. Actually I tri=
ed
>>> to use 0.fat,but I think it's wrong. Can you give a look at the file be=
low
>>> and tell me if it could be "ramdisk.img" ?
>>>
>>> # Kernel
>>> arm_64bit=3D1
>>> kernel=3DImage
>>>
>>> # Ramdisk
>>> gpio=3D21=3Dip,pu
>>> [gpio21=3D1]
>>> initramfs ramdisk.img followkernel
>>> [gpio21=3D0]
>>> initramfs ramdisk-recovery.img followkernel
>>> [all]
>>>
>>> # Audio
>>> dtparam=3Daudio=3Don
>>>
>>> # Audio DAC
>>> #dtoverlay=3Dallo-boss-dac-pcm512x-audio
>>> #dtoverlay=3Dallo-piano-dac-pcm512x-audio
>>> #dtoverlay=3Dallo-piano-dac-plus-pcm512x-audio
>>> #dtoverlay=3Dhifiberry-dacplus
>>> #dtoverlay=3Di-sabre-q2m
>>> #dtoverlay=3Diqaudio-dac
>>> #dtoverlay=3Djustboom-dac
>>>
>>> # Boot device
>>> dtoverlay=3Dandroid-sdcard
>>> #dtoverlay=3Dandroid-usb
>>> #dtoverlay=3Dandroid-nvme
>>>
>>> # Camera
>>> camera_auto_detect=3D1
>>> start_x=3D1
>>>
>>> # CPU
>>> arm_boost=3D1
>>> #arm_freq=3D1500
>>>
>>> # Display
>>> disable_overscan=3D1
>>>
>>> # Display panel
>>> [gpio21=3D1]
>>> #dtoverlay=3Dcutiepi-panel
>>> #dtoverlay=3Dvc4-kms-dsi-7inch
>>> #dtoverlay=3Dvc4-kms-dsi-lt070me05000
>>> #dtoverlay=3Dvc4-kms-dsi-lt070me05000-v2
>>> [all]
>>> #dtoverlay=3Drpi-backlight
>>>
>>> # Fan
>>> #dtoverlay=3Dgpio-fan
>>> #dtoverlay=3Di2c-fan
>>> #dtoverlay=3Drpi-poe
>>> #dtoverlay=3Drpi-poe-plus
>>>
>>> # Graphics acceleration
>>> disable_fw_kms_setup=3D1
>>> [gpio21=3D1]
>>> dtoverlay=3Dvc4-kms-v3d
>>> [all]
>>>
>>> # I2C
>>> dtparam=3Di2c_arm=3Don
>>>
>>> # I2S
>>> #dtparam=3Di2s=3Don
>>>
>>> # IR
>>> #dtoverlay=3Dgpio-ir,gpio_pin=3D18
>>>
>>> # Keys
>>> #dtoverlay=3Dgpio-key,gpio=3D21,keycode=3D116,label=3D"POWER"
>>> #dtoverlay=3Dgpio-key,gpio=3D26,keycode=3D115,label=3D"VOLUME_UP"
>>> #dtoverlay=3Dgpio-key,gpio=3D20,keycode=3D114,label=3D"VOLUME_DOWN"
>>>
>>> # RTC
>>> dtoverlay=3Di2c-rtc,ds3231
>>>
>>> # Sensors
>>> #dtoverlay=3Dandroid-i2c-sensor,mpu6050
>>>
>>> # Serial console
>>> #enable_uart=3D1
>>>
>>> # SPI
>>> dtparam=3Dspi=3Don
>>>
>>> # Touchscreen
>>>
>>> #dtoverlay=3Dads7846,cs=3D1,penirq=3D25,penirq_pull=3D2,speed=3D50000,k=
eep_vref_on=3D0,swapxy=3D0,pmax=3D255,xohms=3D150,xmin=3D200,xmax=3D3900,ym=
in=3D200,ymax=3D3900
>>> #dtoverlay=3Dedt-ft5406
>>> #dtoverlay=3Dgoodix
>>> #dtoverlay=3Drpi-ft5406
>>>
>>> # USB
>>> dtoverlay=3Ddwc2,dr_mode=3Dperipheral
>>> [cm4]
>>> dtoverlay=3Ddwc2,dr_mode=3Dotg
>>> [all]
>>>
>>> include config_user.txt
>>>
>>> On Sun, Aug 25, 2024 at 2:44=E2=80=AFPM Mario Marietto <marietto2008@gm=
ail.com>
>>> wrote:
>>>
>>>> Appending the root device does not change the scenario :
>>>>
>>>> qemu-system-aarch64 \
>>>>         -smp 4 \
>>>>         -m 2048 \
>>>>         -cpu cortex-a72 \
>>>>         -machine virt \
>>>>         -serial stdio \
>>>>         -initrd
>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/0.fat
>>>> \
>>>>         -kernel
>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/boot/Image
>>>> \
>>>>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait
>>>> rootdelay=3D5 root=3D/dev/vdd1 rw"
>>>>
>>>>
>>>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
>>>> [    0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@build-host=
)
>>>> (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928)
>>>> clang version 18.0.0 (
>>>> https://android.googlesource.com/toolchain/llvm-project
>>>> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #
>>>> 1 SMP PREEMPT Tue Jul  2 09:02:32 UTC 2024
>>>> [    0.000000] KASLR enabled
>>>> [    0.000000] random: crng init done
>>>> [    0.000000] Machine model: linux,dummy-virt
>>>> [    0.000000] efi: UEFI not found.
>>>> [    0.000000] Zone ranges:
>>>> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff]
>>>> [    0.000000]   DMA32    empty
>>>> [    0.000000]   Normal   empty
>>>> [    0.000000] Movable zone start for each node
>>>> [    0.000000] NoSplit zone start for each node
>>>> [    0.000000] NoMerge zone start for each node
>>>> [    0.000000] Early memory node ranges
>>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
>>>> [    0.000000] Initmem setup node 0 [mem
>>>> 0x0000000040000000-0x00000000bfffffff]
>>>> [    0.000000] cma: Reserved 8 MiB at 0x00000000bd000000 on node -1
>>>> [    0.000000] psci: probing for conduit method from DT.
>>>> [    0.000000] psci: PSCIv1.1 detected in firmware.
>>>> [    0.000000] psci: Using standard PSCI v0.2 function IDs
>>>> [    0.000000] psci: Trusted OS migration not required
>>>> [    0.000000] psci: SMC Calling Convention v1.0
>>>> [    0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d31768
>>>> u126976
>>>> [    0.000000] Detected PIPT I-cache on CPU0
>>>> [    0.000000] CPU features: detected: Spectre-v2
>>>> [    0.000000] CPU features: detected: Spectre-v3a
>>>> [    0.000000] CPU features: detected: Spectre-v4
>>>> [    0.000000] CPU features: detected: Spectre-BHB
>>>> [    0.000000] CPU features: kernel page table isolation forced ON by
>>>> KASLR
>>>> [    0.000000] CPU features: detected: Kernel page table isolation
>>>> (KPTI)
>>>> [    0.000000] CPU features: detected: ARM erratum 1742098
>>>> [    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or
>>>> 1530923
>>>> [    0.000000] alternatives: applying boot alternatives
>>>> [    0.000000] Kernel command line: console=3DttyAMA0,38400 drm.debug=
=3D0x0
>>>> rootwait rootdelay=3D5 root=3D/dev/vdd1 rw androidboot.serialno=3D100
>>>> 00000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66
>>>> [    0.000000] Dentry cache hash table entries: 262144 (order: 9,
>>>> 2097152 bytes, linear)
>>>> [    0.000000] Inode-cache hash table entries: 131072 (order: 8,
>>>> 1048576 bytes, linear)
>>>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
>>>> 516096
>>>> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap
>>>> free:off
>>>> [    0.000000] Memory: 1881596K/2097152K available (19328K kernel code=
,
>>>> 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 207364K rese
>>>> rved, 8192K cma-reserved)
>>>> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=
=3D4,
>>>> Nodes=3D1
>>>> [    0.000000] ftrace: allocating 56269 entries in 220 pages
>>>> [    0.000000] ftrace: allocated 220 pages with 5 groups
>>>> [    0.000000] trace event string verifier disabled
>>>> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>>>> [    0.000000] rcu:     RCU event tracing is enabled.
>>>> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to
>>>> nr_cpu_ids=3D4.
>>>> [    0.000000]  Trampoline variant of Tasks RCU enabled.
>>>> [    0.000000]  Rude variant of Tasks RCU enabled.
>>>> [    0.000000]  Tracing variant of Tasks RCU enabled.
>>>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
>>>> is 25 jiffies.
>>>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
>>>> nr_cpu_ids=3D4
>>>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>>>> [    0.000000] Root IRQ handler: gic_handle_irq
>>>> [    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
>>>> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
>>>> contention.
>>>> [    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
>>>> [    0.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff
>>>> max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
>>>> [    0.000069] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps
>>>> every 4398046511096ns
>>>> [    0.003628] kfence: initialized - using 2097152 bytes for 255
>>>> objects at 0x(____ptrval____)-0x(____ptrval____)
>>>> [    0.010906] Calibrating delay loop (skipped), value calculated usin=
g
>>>> timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
>>>> [    0.011082] pid_max: default: 32768 minimum: 301
>>>> [    0.013020] LSM: initializing lsm=3Dcapability,selinux,integrity
>>>> [    0.013436] SELinux:  Initializing.
>>>> [    0.016921] Mount-cache hash table entries: 4096 (order: 3, 32768
>>>> bytes, linear)
>>>> [    0.016984] Mountpoint-cache hash table entries: 4096 (order: 3,
>>>> 32768 bytes, linear)
>>>> [    0.031469] cgroup: Disabling memory control group subsystem
>>>> [    0.050059] cacheinfo: Unable to detect cache hierarchy for CPU 0
>>>> [    0.059978] RCU Tasks: Setting shift to 2 and lim to 1
>>>> rcu_task_cb_adjust=3D1.
>>>> [    0.060584] RCU Tasks Rude: Setting shift to 2 and lim to 1
>>>> rcu_task_cb_adjust=3D1.
>>>> [    0.060822] RCU Tasks Trace: Setting shift to 2 and lim to 1
>>>> rcu_task_cb_adjust=3D1.
>>>> [    0.062427] rcu: Hierarchical SRCU implementation.
>>>> [    0.062463] rcu:     Max phase no-delay instances is 1000.
>>>> [    0.068568] EFI services will not be available.
>>>> [    0.071086] smp: Bringing up secondary CPUs ...
>>>> [    0.074801] Detected PIPT I-cache on CPU1
>>>> [    0.075909] CPU1: Booted secondary processor 0x0000000001
>>>> [0x410fd083]
>>>> [    0.081065] Detected PIPT I-cache on CPU2
>>>> [    0.081470] CPU2: Booted secondary processor 0x0000000002
>>>> [0x410fd083]
>>>> [    0.083873] Detected PIPT I-cache on CPU3
>>>> [    0.084168] CPU3: Booted secondary processor 0x0000000003
>>>> [0x410fd083]
>>>> [    0.084681] smp: Brought up 1 node, 4 CPUs
>>>> [    0.084715] SMP: Total of 4 processors activated.
>>>> [    0.084800] CPU features: detected: 32-bit EL0 Support
>>>> [    0.084824] CPU features: detected: 32-bit EL1 Support
>>>> [    0.084885] CPU features: detected: CRC32 instructions
>>>> [    0.088191] CPU features: emulated: Privileged Access Never (PAN)
>>>> using TTBR0_EL1 switching
>>>> [    0.088512] CPU: All CPU(s) started at EL1
>>>> [    0.088714] alternatives: applying system-wide alternatives
>>>> [    0.113756] devtmpfs: initialized
>>>> [    0.126262] Enabled cp15_barrier support
>>>> [    0.126449] Enabled setend support
>>>> [    0.127708] clocksource: jiffies: mask: 0xffffffff max_cycles:
>>>> 0xffffffff, max_idle_ns: 7645041785100000 ns
>>>> [    0.127840] futex hash table entries: 1024 (order: 4, 65536 bytes,
>>>> linear)
>>>> [    0.131302] pinctrl core: initialized pinctrl subsystem
>>>> [    0.138216] DMI not present or invalid.
>>>> [    0.147664] NET: Registered PF_NETLINK/PF_ROUTE protocol family
>>>> [    0.158502] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
>>>> allocations
>>>> [    0.158987] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for
>>>> atomic allocations
>>>> [    0.159303] audit: initializing netlink subsys (disabled)
>>>> [    0.161302] audit: type=3D2000 audit(0.148:1): state=3Dinitialized
>>>> audit_enabled=3D0 res=3D1
>>>> [    0.164412] thermal_sys: Registered thermal governor 'step_wise'
>>>> [    0.164806] cpuidle: using governor menu
>>>> [    0.165816] hw-breakpoint: found 6 breakpoint and 4 watchpoint
>>>> registers.
>>>> [    0.166975] ASID allocator initialised with 32768 entries
>>>> [    0.168385] Serial: AMBA PL011 UART driver
>>>> [    0.196712] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13,
>>>> base_baud =3D 0) is a PL011 rev1
>>>> [    0.198278] printk: console [ttyAMA0] enabled
>>>> [    0.224278] Modules: 2G module region forced by
>>>> RANDOMIZE_MODULE_REGION_FULL
>>>> [    0.224486] Modules: 0 pages in range for non-PLT usage
>>>> [    0.224510] Modules: 516176 pages in range for PLT usage
>>>> [    0.241442] iommu: Default domain type: Translated
>>>> [    0.241679] iommu: DMA domain TLB invalidation policy: strict mode
>>>> [    0.244200] SCSI subsystem initialized
>>>> [    0.245459] usbcore: registered new interface driver usbfs
>>>> [    0.245841] usbcore: registered new interface driver hub
>>>> [    0.246154] usbcore: registered new device driver usb
>>>> [    0.247257] mc: Linux media interface: v0.10
>>>> [    0.247617] videodev: Linux video capture interface: v2.00
>>>> [    0.248602] pps_core: LinuxPPS API ver. 1 registered
>>>> [    0.248700] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
>>>> Rodolfo Giometti <giometti@linux.it>
>>>> [    0.248967] PTP clock support registered
>>>> [    0.251884] Advanced Linux Sound Architecture Driver Initialized.
>>>> [    0.262663] Bluetooth: Core ver 2.22
>>>> [    0.262960] NET: Registered PF_BLUETOOTH protocol family
>>>> [    0.263069] Bluetooth: HCI device and connection manager initialize=
d
>>>> [    0.263344] Bluetooth: HCI socket layer initialized
>>>> [    0.263516] Bluetooth: L2CAP socket layer initialized
>>>> [    0.263840] Bluetooth: SCO socket layer initialized
>>>> [    0.266790] vgaarb: loaded
>>>> [    0.268841] clocksource: Switched to clocksource arch_sys_counter
>>>> [    0.272056] VFS: Disk quotas dquot_6.6.0
>>>> [    0.272284] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
>>>> bytes)
>>>> [    0.273060] FS-Cache: Loaded
>>>> [    0.278526] CacheFiles: Loaded
>>>> [    0.287007] NET: Registered PF_INET protocol family
>>>> [    0.288390] IP idents hash table entries: 32768 (order: 6, 262144
>>>> bytes, linear)
>>>> [    0.297021] tcp_listen_portaddr_hash hash table entries: 1024
>>>> (order: 2, 16384 bytes, linear)
>>>> [    0.297273] Table-perturb hash table entries: 65536 (order: 6,
>>>> 262144 bytes, linear)
>>>> [    0.297485] TCP established hash table entries: 16384 (order: 5,
>>>> 131072 bytes, linear)
>>>> [    0.298036] TCP bind hash table entries: 16384 (order: 7, 524288
>>>> bytes, linear)
>>>> [    0.298873] TCP: Hash tables configured (established 16384 bind
>>>> 16384)
>>>> [    0.301283] MPTCP token hash table entries: 2048 (order: 3, 49152
>>>> bytes, linear)
>>>> [    0.301759] UDP hash table entries: 1024 (order: 3, 32768 bytes,
>>>> linear)
>>>> [    0.302186] UDP-Lite hash table entries: 1024 (order: 3, 32768
>>>> bytes, linear)
>>>> [    0.304009] NET: Registered PF_UNIX/PF_LOCAL protocol family
>>>> [    0.306868] PCI: CLS 0 bytes, default 64
>>>> [    0.312145] Trying to unpack rootfs image as initramfs...
>>>> [    0.312808] kvm [1]: HYP mode not available
>>>> [    0.318856] rootfs image is not initramfs (invalid magic at start o=
f
>>>> compressed archive); looks like an initrd
>>>> [    0.335544] Initialise system trusted keyrings
>>>> [    0.338430] workingset: timestamp_bits=3D46 max_order=3D19
>>>> bucket_order=3D0
>>>> [    0.339134] zbud: loaded
>>>> [    0.347742] Key type cifs.idmap registered
>>>> [    0.348673] fuse: init (API version 7.39)
>>>> [    0.386722] Key type asymmetric registered
>>>> [    0.386992] Asymmetric key parser 'x509' registered
>>>> [    0.387460] Block layer SCSI generic (bsg) driver version 0.4 loade=
d
>>>> (major 244)
>>>> [    0.388796] io scheduler mq-deadline registered
>>>> [    0.388954] io scheduler kyber registered
>>>> [    0.389319] io scheduler bfq registered
>>>> [    0.406358] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000
>>>> mem_size:0x00000000(0 MiB)
>>>> [    0.476330] brd: module loaded
>>>> [    0.508286] loop: module loaded
>>>> [    0.512092] Loading iSCSI transport class v2.0-870.
>>>> [    0.522449] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.co=
m
>>>> for information.
>>>> [    0.522729] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <
>>>> Jason@zx2c4.com>. All Rights Reserved.
>>>> [    0.538429] tun: Universal TUN/TAP device driver, 1.6
>>>> [    0.541953] usbcore: registered new interface driver brcmfmac
>>>> [    0.542290] usbcore: registered new device driver r8152-cfgselector
>>>> [    0.542675] usbcore: registered new interface driver r8152
>>>> [    0.542971] usbcore: registered new interface driver lan78xx
>>>> [    0.543488] usbcore: registered new interface driver asix
>>>> [    0.543810] usbcore: registered new interface driver ax88179_178a
>>>> [    0.544134] usbcore: registered new interface driver cdc_ether
>>>> [    0.544609] usbcore: registered new interface driver smsc95xx
>>>> [    0.544909] usbcore: registered new interface driver net1080
>>>> [    0.545240] usbcore: registered new interface driver cdc_subset
>>>> [    0.545596] usbcore: registered new interface driver zaurus
>>>> [    0.545896] usbcore: registered new interface driver cdc_ncm
>>>> [    0.546192] usbcore: registered new interface driver r8153_ecm
>>>> [    0.547442] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
>>>> [    0.550591] usbcore: registered new interface driver cdc_acm
>>>> [    0.550756] cdc_acm: USB Abstract Control Model driver for USB
>>>> modems and ISDN adapters
>>>> [    0.551948] usbcore: registered new interface driver uas
>>>> [    0.552352] usbcore: registered new interface driver usb-storage
>>>> [    0.566050] usbcore: registered new interface driver cp210x
>>>> [    0.566791] usbserial: USB Serial support registered for cp210x
>>>> [    0.567318] usbcore: registered new interface driver pl2303
>>>> [    0.567653] usbserial: USB Serial support registered for pl2303
>>>> [    0.573531] mousedev: PS/2 mouse device common for all mice
>>>> [    0.573930] usbcore: registered new interface driver xpad
>>>> [    0.574228] usbcore: registered new interface driver usb_acecad
>>>> [    0.574588] usbcore: registered new interface driver aiptek
>>>> [    0.574937] usbcore: registered new interface driver hanwang
>>>> [    0.575292] usbcore: registered new interface driver kbtab
>>>> [    0.577388] usbcore: registered new interface driver usbtouchscreen
>>>> [    0.580179] i2c_dev: i2c /dev entries driver
>>>> [    0.584010] ir_imon_decoder: IR iMON protocol handler initialized
>>>> [    0.584179] IR JVC protocol handler initialized
>>>> [    0.584296] IR MCE Keyboard/mouse protocol handler initialized
>>>> [    0.584435] IR NEC protocol handler initialized
>>>> [    0.584734] IR RC5(x/sz) protocol handler initialized
>>>> [    0.584863] IR RC6 protocol handler initialized
>>>> [    0.584991] IR RCMM protocol handler initialized
>>>> [    0.585111] IR SANYO protocol handler initialized
>>>> [    0.585226] IR Sharp protocol handler initialized
>>>> [    0.585358] IR Sony protocol handler initialized
>>>> [    0.585477] IR XMP protocol handler initialized
>>>> [    0.586421] usbcore: registered new interface driver uvcvideo
>>>> [    0.589015] device-mapper: uevent: version 1.0.3
>>>> [    0.590448] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01)
>>>> initialised: dm-devel@redhat.com
>>>> [    0.591924] Bluetooth: HCI UART driver ver 2.3
>>>> [    0.592106] Bluetooth: HCI UART protocol H4 registered
>>>> [    0.592885] Bluetooth: HCI UART protocol Broadcom registered
>>>> [    0.594293] sdhci: Secure Digital Host Controller Interface driver
>>>> [    0.594442] sdhci: Copyright(c) Pierre Ossman
>>>> [    0.594948] sdhci-pltfm: SDHCI platform and OF driver helper
>>>> [    0.596987] ledtrig-cpu: registered to indicate activity on CPUs
>>>> [    0.599350] hid: raw HID events driver (C) Jiri Kosina
>>>> [    0.612270] usbcore: registered new interface driver usbhid
>>>> [    0.612441] usbhid: USB HID core driver
>>>> [    0.615743] ashmem: initialized
>>>> [    0.617297] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lis302dl-spi
>>>> [    0.617473] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lis3lv02dl-accel
>>>> [    0.617626] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lis3dh-accel
>>>> [    0.617769] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lsm330d-accel
>>>> [    0.617919] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lsm330dl-accel
>>>> [    0.618062] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lsm330dlc-accel
>>>> [    0.618206] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lis331dlh-accel
>>>> [    0.618357] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lsm330-accel
>>>> [    0.618493] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lsm303agr-accel
>>>> [    0.618638] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lis2dh12-accel
>>>> [    0.618775] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lng2dm-accel
>>>> [    0.618911] SPI driver st-accel-spi has no spi_device_id for
>>>> st,h3lis331dl-accel
>>>> [    0.619056] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lis331dl-accel
>>>> [    0.619209] SPI driver st-accel-spi has no spi_device_id for
>>>> st,lsm303c-accel
>>>> [    0.620207] SPI driver st-magn-spi has no spi_device_id for
>>>> st,lis3mdl-magn
>>>> [    0.620355] SPI driver st-magn-spi has no spi_device_id for
>>>> st,lsm303agr-magn
>>>> [    0.620510] SPI driver st-magn-spi has no spi_device_id for
>>>> st,lsm9ds1-magn
>>>> [    0.620768] SPI driver st-magn-spi has no spi_device_id for
>>>> st,lsm303c-magn
>>>> [    0.626130] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
>>>> counters available
>>>> [    0.630320] usbcore: registered new interface driver snd-usb-audio
>>>> [    0.638439] Mirror/redirect action on
>>>> [    0.639343] netem: version 1.3
>>>> [    0.639435] u32 classifier
>>>> [    0.639508]     input device check on
>>>> [    0.639602]     Actions configured
>>>> [    0.648469] xt_time: kernel timezone is -0000
>>>> [    0.649096] gre: GRE over IPv4 demultiplexor driver
>>>> [    0.649255] IPv4 over IPsec tunneling driver
>>>> [    0.654843] Initializing XFRM netlink socket
>>>> [    0.655213] IPsec XFRM device driver
>>>> [    0.676037] NET: Registered PF_INET6 protocol family
>>>> [    0.687646] Segment Routing with IPv6
>>>> [    0.687964] In-situ OAM (IOAM) with IPv6
>>>> [    0.689074] mip6: Mobile IPv6
>>>> [    0.693823] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
>>>> [    0.699298] NET: Registered PF_PACKET protocol family
>>>> [    0.699567] NET: Registered PF_KEY protocol family
>>>> [    0.699819] Key type dns_resolver registered
>>>> [    0.798005] Freeing initrd memory: 131072K
>>>> [    0.806166] registered taskstats version 1
>>>> [    0.807819] Loading compiled-in X.509 certificates
>>>> [    0.834497] Key type .fscrypt registered
>>>> [    0.834641] Key type fscrypt-provisioning registered
>>>> [    0.841634] of_cfs_init
>>>> [    0.842079] of_cfs_init: OK
>>>> [    0.845830] cfg80211: Loading compiled-in X.509 certificates for
>>>> regulatory database
>>>> [    0.876283] Loaded X.509 cert 'benh@debian.org:
>>>> 577e021cb980e0e820821ba7b54b4961b8b4fadf'
>>>> [    0.877632] Loaded X.509 cert 'romain.perier@gmail.com:
>>>> 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
>>>> [    0.878441] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>>>> [    0.879187] Loaded X.509 cert 'wens:
>>>> 61c038651aabdcf94bd0ac7ff06c7248db18c600'
>>>> [    0.885017] clk: Disabling unused clocks
>>>> [    0.885499] ALSA device list:
>>>> [    0.885646]   No soundcards found.
>>>> [    0.894059] uart-pl011 9000000.pl011: no DMA platform data
>>>> [    0.895672] Waiting 5 sec before mounting root device...
>>>> [    6.132758] RAMDISK: Couldn't find valid RAM disk image starting at
>>>> 0.
>>>> [    6.133865] Waiting for root device /dev/vdd1...
>>>> [   10.994096] platform gpio-keys: deferred probe pending
>>>>
>>>>
>>>>
>>>> On Sun, Aug 25, 2024 at 2:30=E2=80=AFPM Mario Marietto <marietto2008@g=
mail.com>
>>>> wrote:
>>>>
>>>>> When I unpack this file :
>>>>>
>>>>> lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv.img
>>>>>
>>>>> I get these files :
>>>>>
>>>>> 0.fat
>>>>> 1.img
>>>>> 2.img
>>>>> 3.img
>>>>>
>>>>> So,I assume that :
>>>>>
>>>>> 0.fat is : initrd
>>>>> 1.img is : system-rw.img
>>>>> 2.img is   :  vendor-rw.img
>>>>> 3.img is   :  userdata.img
>>>>>
>>>>> If I use 0.fat as initrd,like this :
>>>>>
>>>>> -initrd
>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKA=
NG-rpi4-atv/0.fat
>>>>>
>>>>> I get this message :
>>>>>
>>>>> rootfs image is not initramfs (invalid magic at start of compressed
>>>>> archive); looks like an initrd
>>>>>
>>>>> it looks like an initrd : right,it's true : it is initrd. (for this
>>>>> reason I've assumed that 0.fat is initrd...
>>>>>
>>>>>
>>>>> On Sun, Aug 25, 2024 at 1:26=E2=80=AFPM Peter Maydell <
>>>>> peter.maydell@linaro.org> wrote:
>>>>>
>>>>>> On Sun, 25 Aug 2024 at 11:45, Mario Marietto <marietto2008@gmail.com=
>
>>>>>> wrote:
>>>>>> >
>>>>>> > Please look at this example :
>>>>>> >
>>>>>> > qemu-system-aarch64 \
>>>>>> > -smp 4 \
>>>>>> > -m 2048 \
>>>>>> > -cpu cortex-a72 \
>>>>>> > -machine virt \
>>>>>> > -serial stdio \
>>>>>> > -kernel
>>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaK=
ANG-rpi4-atv/boot/Image
>>>>>> \
>>>>>>
>>>>>> This (assuming it's the complete command line your script is
>>>>>> running) doesn't pass any arguments telling QEMU to provide a
>>>>>> root disk, and it doesn't pass any arguments to the kernel
>>>>>> telling it what root disk to use...
>>>>>>
>>>>>> > [    0.000000] Kernel command line: console=3DttyAMA0,115200
>>>>>> kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 root=
wait
>>>>>> androidboot.serialno=3D10000000abcd1234
>>>>>> androidboot.btmacaddr=3D11:22:33:44:55:66
>>>>>>
>>>>>> ...so the kernel defaults to "/dev/mmcblk0p2" as its root disk becau=
se
>>>>>> it's using the command line argument that was compiled into it...
>>>>>>
>>>>>> > [    0.658240] Waiting for root device /dev/mmcblk0p2...
>>>>>>
>>>>>> ...and then it's hanging around forever waiting for that.
>>>>>>
>>>>>> You need to:
>>>>>>  (1) pass QEMU arguments telling it to provide a root fs
>>>>>>  (2) pass the kernel arguments telling it to look for the
>>>>>>      root fs in the place where QEMU is providing it
>>>>>>
>>>>>> Your other command line looks more on the right lines:
>>>>>>
>>>>>>         -kernel
>>>>>>
>>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaK=
ANG-rpi4-atv/boot/Image
>>>>>> \
>>>>>>         -initrd
>>>>>>
>>>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaK=
ANG-rpi4-atv/0.fat
>>>>>> \
>>>>>>         -drive
>>>>>> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/l=
ineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/1.img
>>>>>> \
>>>>>>         -device virtio-blk-pci,drive=3Dsystem \
>>>>>>         -drive
>>>>>> index=3D1,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot2/zroot2/OS/Linux/l=
ineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/2.img
>>>>>> \
>>>>>>         -device virtio-blk-pci,drive=3Dvendor \
>>>>>>         -drive
>>>>>> index=3D2,if=3Dnone,id=3Duserdata,file=3D/mnt/zroot2/zroot2/OS/Linux=
/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/3.img
>>>>>> \
>>>>>>         -device virtio-blk-pci,drive=3Duserdata \
>>>>>>
>>>>>> though I wonder if the kernel really expects a
>>>>>> FAT file for the initrd, given it complains:
>>>>>>
>>>>>> [    0.344033] Trying to unpack rootfs image as initramfs...
>>>>>> [    0.344947] rootfs image is not initramfs (invalid magic at start
>>>>>> of compressed archive); looks like an initrd
>>>>>>
>>>>>> and then later
>>>>>>
>>>>>> [    5.905329] RAMDISK: Couldn't find valid RAM disk image starting
>>>>>> at 0.
>>>>>>
>>>>>> I think if I were you I'd start by figuring out what's going on
>>>>>> with the initrd.
>>>>>>
>>>>>> thanks
>>>>>> -- PMM
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

--0000000000006a7b6c0620bd40b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello.</div><div><br></div><div>maybe I did some prog=
ress using these parameters :</div><div><div><br></div><div>root@Z390-AORUS=
-PRO-DEST:/mnt/zroot2/zroot2/OS/Android# nano start-virt6</div><div></div><=
div><br></div></div><div>qemu-system-aarch64 \<br>=C2=A0 =C2=A0 -smp 4 \<br=
>=C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 -cpu cortex-a72 \<br>=C2=A0 =C2=
=A0 -M virt \<br>=C2=A0 =C2=A0 -kernel /mnt/zroot2/zroot2/OS/Android/KostaK=
ang/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \<br>=
=C2=A0 =C2=A0 -initrd /mnt/zroot2/zroot2/OS/Android/KostaKang/lineage-21.0-=
20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/ramdisk-recovery.img \<br>=C2=
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
=3D"https://android.googlesource.com/toolchain/llvm-project">https://androi=
d.googlesource.com/toolchain/llvm-project</a> 477610d4d0d988e69dbc3fae4fe86=
bff3f07f2b5), LLD 18.0.0) #1 SMP PREEMPT Tue Jul =C2=A02 09:02:32 UTC 2024<=
br>[ =C2=A0 =C2=A00.000000] KASLR enabled<br>[ =C2=A0 =C2=A00.000000] rando=
m: crng init done<br>[ =C2=A0 =C2=A00.000000] Machine model: linux,dummy-vi=
rt<br>[ =C2=A0 =C2=A00.000000] efi: UEFI not found.<br>[ =C2=A0 =C2=A00.000=
000] Zone ranges:<br>[ =C2=A0 =C2=A00.000000] =C2=A0 DMA =C2=A0 =C2=A0 =C2=
=A0[mem 0x0000000040000000-0x00000000bfffffff]<br>[ =C2=A0 =C2=A00.000000] =
=C2=A0 DMA32 =C2=A0 =C2=A0empty<br>[ =C2=A0 =C2=A00.000000] =C2=A0 Normal =
=C2=A0 empty<br>[ =C2=A0 =C2=A00.000000] Movable zone start for each node<b=
r>[ =C2=A0 =C2=A00.000000] NoSplit zone start for each node<br>[ =C2=A0 =C2=
=A00.000000] NoMerge zone start for each node<br>[ =C2=A0 =C2=A00.000000] E=
arly memory node ranges<br>[ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [=
mem 0x0000000040000000-0x00000000bfffffff]<br>[ =C2=A0 =C2=A00.000000] Init=
mem setup node 0 [mem 0x0000000040000000-0x00000000bfffffff]<br>[ =C2=A0 =
=C2=A00.000000] cma: Reserved 8 MiB at 0x00000000bd000000 on node -1<br>[ =
=C2=A0 =C2=A00.000000] psci: probing for conduit method from DT.<br>[ =C2=
=A0 =C2=A00.000000] psci: PSCIv1.1 detected in firmware.<br>[ =C2=A0 =C2=A0=
0.000000] psci: Using standard PSCI v0.2 function IDs<br>[ =C2=A0 =C2=A00.0=
00000] psci: Trusted OS migration not required<br>[ =C2=A0 =C2=A00.000000] =
psci: SMC Calling Convention v1.0<br>[ =C2=A0 =C2=A00.000000] percpu: Embed=
ded 31 pages/cpu s87016 r8192 d31768 u126976<br>[ =C2=A0 =C2=A00.000000] pc=
pu-alloc: s87016 r8192 d31768 u126976 alloc=3D31*4096<br>[ =C2=A0 =C2=A00.0=
00000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 <br>[ =C2=A0 =C2=A00.000000] Det=
ected PIPT I-cache on CPU0<br>[ =C2=A0 =C2=A00.000000] CPU features: detect=
ed: Spectre-v2<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: Spectre-=
v3a<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: Spectre-v4<br>[ =C2=
=A0 =C2=A00.000000] CPU features: detected: Spectre-BHB<br>[ =C2=A0 =C2=A00=
.000000] CPU features: kernel page table isolation forced ON by KASLR<br>[ =
=C2=A0 =C2=A00.000000] CPU features: detected: Kernel page table isolation =
(KPTI)<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: ARM erratum 1742=
098<br>[ =C2=A0 =C2=A00.000000] CPU features: detected: ARM errata 1165522,=
 1319367, or 1530923<br>[ =C2=A0 =C2=A00.000000] alternatives: applying boo=
t alternatives<br>[ =C2=A0 =C2=A00.000000] Kernel command line: console=3Dt=
tyAMA1,384000 androidboot.hardware=3Drpi4 no_console_suspend root=3D/dev/mm=
cblk1p2 rootwait androidboot.selinux=3Dpermissive loglevel=3D8 androidboot.=
serialno=3D10000000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66<br>[ =
=C2=A0 =C2=A00.000000] Dentry cache hash table entries: 262144 (order: 9, 2=
097152 bytes, linear)<br>[ =C2=A0 =C2=A00.000000] Inode-cache hash table en=
tries: 131072 (order: 8, 1048576 bytes, linear)<br>[ =C2=A0 =C2=A00.000000]=
 Built 1 zonelists, mobility grouping on.=C2=A0 Total pages: 516096<br>[ =
=C2=A0 =C2=A00.000000] mem auto-init: stack:all(zero), heap alloc:off, heap=
 free:off<br>[ =C2=A0 =C2=A00.000000] Memory: 1998052K/2097152K available (=
19328K kernel code, 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 9090=
8K reserved, 8192K cma-reserved)<br>[ =C2=A0 =C2=A00.000000] SLUB: HWalign=
=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, Nodes=3D1<br>[ =C2=A0 =C2=A00=
.000000] ftrace: allocating 56269 entries in 220 pages<br>[ =C2=A0 =C2=A00.=
000000] ftrace: allocated 220 pages with 5 groups<br>[ =C2=A0 =C2=A00.00000=
0] trace event string verifier disabled<br>[ =C2=A0 =C2=A00.000000] rcu: Pr=
eemptible hierarchical RCU implementation.<br>[ =C2=A0 =C2=A00.000000] rcu:=
 =C2=A0 =C2=A0 RCU event tracing is enabled.<br>[ =C2=A0 =C2=A00.000000] rc=
u: =C2=A0 =C2=A0 RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D4.=
<br>[ =C2=A0 =C2=A00.000000] =C2=A0Trampoline variant of Tasks RCU enabled.=
<br>[ =C2=A0 =C2=A00.000000] =C2=A0Rude variant of Tasks RCU enabled.<br>[ =
=C2=A0 =C2=A00.000000] =C2=A0Tracing variant of Tasks RCU enabled.<br>[ =C2=
=A0 =C2=A00.000000] rcu: RCU calculated value of scheduler-enlistment delay=
 is 25 jiffies.<br>[ =C2=A0 =C2=A00.000000] rcu: Adjusting geometry for rcu=
_fanout_leaf=3D16, nr_cpu_ids=3D4<br>[ =C2=A0 =C2=A00.000000] NR_IRQS: 64, =
nr_irqs: 64, preallocated irqs: 0<br>[ =C2=A0 =C2=A00.000000] Root IRQ hand=
ler: gic_handle_irq<br>[ =C2=A0 =C2=A00.000000] GICv2m: range[mem 0x0802000=
0-0x08020fff], SPI[80:143]<br>[ =C2=A0 =C2=A00.000000] rcu: srcu_init: Sett=
ing srcu_struct sizes based on contention.<br>[ =C2=A0 =C2=A00.000000] arch=
_timer: cp15 timer(s) running at 62.50MHz (virt).<br>[ =C2=A0 =C2=A00.00000=
0] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff max_cycles: 0x1cd=
42e208c, max_idle_ns: 881590405314 ns<br>[ =C2=A0 =C2=A00.000072] sched_clo=
ck: 57 bits at 63MHz, resolution 16ns, wraps every 4398046511096ns<br>[ =C2=
=A0 =C2=A00.003415] kfence: initialized - using 2097152 bytes for 255 objec=
ts at 0x(____ptrval____)-0x(____ptrval____)<br>[ =C2=A0 =C2=A00.010294] Cal=
ibrating delay loop (skipped), value calculated using timer frequency.. 125=
.00 BogoMIPS (lpj=3D250000)<br>[ =C2=A0 =C2=A00.010468] pid_max: default: 3=
2768 minimum: 301<br>[ =C2=A0 =C2=A00.012316] LSM: initializing lsm=3Dcapab=
ility,selinux,integrity<br>[ =C2=A0 =C2=A00.012725] SELinux: =C2=A0Initiali=
zing.<br>[ =C2=A0 =C2=A00.016078] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)<br>[ =C2=A0 =C2=A00.016140] Mountpoint-cache ha=
sh table entries: 4096 (order: 3, 32768 bytes, linear)<br>[ =C2=A0 =C2=A00.=
030412] cgroup: Disabling memory control group subsystem<br>[ =C2=A0 =C2=A0=
0.048581] cacheinfo: Unable to detect cache hierarchy for CPU 0<br>[ =C2=A0=
 =C2=A00.058399] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adj=
ust=3D1.<br>[ =C2=A0 =C2=A00.058995] RCU Tasks Rude: Setting shift to 2 and=
 lim to 1 rcu_task_cb_adjust=3D1.<br>[ =C2=A0 =C2=A00.059241] RCU Tasks Tra=
ce: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=3D1.<br>[ =C2=A0 =C2=
=A00.060770] rcu: Hierarchical SRCU implementation.<br>[ =C2=A0 =C2=A00.060=
806] rcu: =C2=A0 =C2=A0 Max phase no-delay instances is 1000.<br>[ =C2=A0 =
=C2=A00.067966] EFI services will not be available.<br>[ =C2=A0 =C2=A00.069=
136] smp: Bringing up secondary CPUs ...<br>[ =C2=A0 =C2=A00.073070] Detect=
ed PIPT I-cache on CPU1<br>[ =C2=A0 =C2=A00.074107] CPU1: Booted secondary =
processor 0x0000000001 [0x410fd083]<br>[ =C2=A0 =C2=A00.079461] Detected PI=
PT I-cache on CPU2<br>[ =C2=A0 =C2=A00.079980] CPU2: Booted secondary proce=
ssor 0x0000000002 [0x410fd083]<br>[ =C2=A0 =C2=A00.081795] Detected PIPT I-=
cache on CPU3<br>[ =C2=A0 =C2=A00.082259] CPU3: Booted secondary processor =
0x0000000003 [0x410fd083]<br>[ =C2=A0 =C2=A00.082755] smp: Brought up 1 nod=
e, 4 CPUs<br>[ =C2=A0 =C2=A00.082785] SMP: Total of 4 processors activated.=
<br>[ =C2=A0 =C2=A00.082872] CPU features: detected: 32-bit EL0 Support<br>=
[ =C2=A0 =C2=A00.082893] CPU features: detected: 32-bit EL1 Support<br>[ =
=C2=A0 =C2=A00.082947] CPU features: detected: CRC32 instructions<br>[ =C2=
=A0 =C2=A00.086896] CPU features: emulated: Privileged Access Never (PAN) u=
sing TTBR0_EL1 switching<br>[ =C2=A0 =C2=A00.087196] CPU: All CPU(s) starte=
d at EL1<br>[ =C2=A0 =C2=A00.087478] alternatives: applying system-wide alt=
ernatives<br>[ =C2=A0 =C2=A00.111400] devtmpfs: initialized<br>[ =C2=A0 =C2=
=A00.122787] Enabled cp15_barrier support<br>[ =C2=A0 =C2=A00.123005] Enabl=
ed setend support<br>[ =C2=A0 =C2=A00.124388] clocksource: jiffies: mask: 0=
xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns<br>[ =C2=
=A0 =C2=A00.124510] futex hash table entries: 1024 (order: 4, 65536 bytes, =
linear)<br>[ =C2=A0 =C2=A00.127804] pinctrl core: initialized pinctrl subsy=
stem<br>[ =C2=A0 =C2=A00.133859] DMI not present or invalid.<br>[ =C2=A0 =
=C2=A00.143968] NET: Registered PF_NETLINK/PF_ROUTE protocol family<br>[ =
=C2=A0 =C2=A00.155874] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic=
 allocations<br>[ =C2=A0 =C2=A00.156459] DMA: preallocated 256 KiB GFP_KERN=
EL|GFP_DMA pool for atomic allocations<br>[ =C2=A0 =C2=A00.156805] audit: i=
nitializing netlink subsys (disabled)<br>[ =C2=A0 =C2=A00.159085] audit: ty=
pe=3D2000 audit(0.148:1): state=3Dinitialized audit_enabled=3D0 res=3D1<br>=
[ =C2=A0 =C2=A00.162594] thermal_sys: Registered thermal governor &#39;step=
_wise&#39;<br>[ =C2=A0 =C2=A00.162937] cpuidle: using governor menu<br>[ =
=C2=A0 =C2=A00.164031] hw-breakpoint: found 6 breakpoint and 4 watchpoint r=
egisters.<br>[ =C2=A0 =C2=A00.164971] ASID allocator initialised with 32768=
 entries<br>[ =C2=A0 =C2=A00.166421] Serial: AMBA PL011 UART driver<br>[ =
=C2=A0 =C2=A00.195802] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13=
, base_baud =3D 0) is a PL011 rev1<br>[ =C2=A0 =C2=A00.207191] 9040000.pl01=
1: ttyAMA1 at MMIO 0x9040000 (irq =3D 14, base_baud =3D 0) is a PL011 rev1<=
br>[ =C2=A0 =C2=A00.208270] printk: console [ttyAMA1] enabled<br>[ =C2=A0 =
=C2=A00.227211] Modules: 2G module region forced by RANDOMIZE_MODULE_REGION=
_FULL<br>[ =C2=A0 =C2=A00.227414] Modules: 0 pages in range for non-PLT usa=
ge<br>[ =C2=A0 =C2=A00.227439] Modules: 516176 pages in range for PLT usage=
<br>[ =C2=A0 =C2=A00.252423] iommu: Default domain type: Translated<br>[ =
=C2=A0 =C2=A00.252692] iommu: DMA domain TLB invalidation policy: strict mo=
de<br>[ =C2=A0 =C2=A00.255246] SCSI subsystem initialized<br>[ =C2=A0 =C2=
=A00.256728] usbcore: registered new interface driver usbfs<br>[ =C2=A0 =C2=
=A00.257155] usbcore: registered new interface driver hub<br>[ =C2=A0 =C2=
=A00.257501] usbcore: registered new device driver usb<br>[ =C2=A0 =C2=A00.=
258703] mc: Linux media interface: v0.10<br>[ =C2=A0 =C2=A00.259091] videod=
ev: Linux video capture interface: v2.00<br>[ =C2=A0 =C2=A00.260033] pps_co=
re: LinuxPPS API ver. 1 registered<br>[ =C2=A0 =C2=A00.260306] pps_core: So=
ftware ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;<a href=3D"mai=
lto:giometti@linux.it">giometti@linux.it</a>&gt;<br>[ =C2=A0 =C2=A00.260646=
] PTP clock support registered<br>[ =C2=A0 =C2=A00.263957] Advanced Linux S=
ound Architecture Driver Initialized.<br>[ =C2=A0 =C2=A00.275807] Bluetooth=
: Core ver 2.22<br>[ =C2=A0 =C2=A00.276194] NET: Registered PF_BLUETOOTH pr=
otocol family<br>[ =C2=A0 =C2=A00.276328] Bluetooth: HCI device and connect=
ion manager initialized<br>[ =C2=A0 =C2=A00.276761] Bluetooth: HCI socket l=
ayer initialized<br>[ =C2=A0 =C2=A00.276945] Bluetooth: L2CAP socket layer =
initialized<br>[ =C2=A0 =C2=A00.277292] Bluetooth: SCO socket layer initial=
ized<br>[ =C2=A0 =C2=A00.279818] vgaarb: loaded<br>[ =C2=A0 =C2=A00.283189]=
 clocksource: Switched to clocksource arch_sys_counter<br>[ =C2=A0 =C2=A00.=
289133] VFS: Disk quotas dquot_6.6.0<br>[ =C2=A0 =C2=A00.289446] VFS: Dquot=
-cache hash table entries: 512 (order 0, 4096 bytes)<br>[ =C2=A0 =C2=A00.29=
0358] FS-Cache: Loaded<br>[ =C2=A0 =C2=A00.291617] CacheFiles: Loaded<br>[ =
=C2=A0 =C2=A00.298740] NET: Registered PF_INET protocol family<br>[ =C2=A0 =
=C2=A00.300444] IP idents hash table entries: 32768 (order: 6, 262144 bytes=
, linear)<br>[ =C2=A0 =C2=A00.316440] tcp_listen_portaddr_hash hash table e=
ntries: 1024 (order: 2, 16384 bytes, linear)<br>[ =C2=A0 =C2=A00.316948] Ta=
ble-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)<br>[=
 =C2=A0 =C2=A00.317307] TCP established hash table entries: 16384 (order: 5=
, 131072 bytes, linear)<br>[ =C2=A0 =C2=A00.318245] TCP bind hash table ent=
ries: 16384 (order: 7, 524288 bytes, linear)<br>[ =C2=A0 =C2=A00.319865] TC=
P: Hash tables configured (established 16384 bind 16384)<br>[ =C2=A0 =C2=A0=
0.323421] MPTCP token hash table entries: 2048 (order: 3, 49152 bytes, line=
ar)<br>[ =C2=A0 =C2=A00.323880] UDP hash table entries: 1024 (order: 3, 327=
68 bytes, linear)<br>[ =C2=A0 =C2=A00.324323] UDP-Lite hash table entries: =
1024 (order: 3, 32768 bytes, linear)<br>[ =C2=A0 =C2=A00.326061] NET: Regis=
tered PF_UNIX/PF_LOCAL protocol family<br>[ =C2=A0 =C2=A00.328752] PCI: CLS=
 0 bytes, default 64<br>[ =C2=A0 =C2=A00.334033] Trying to unpack rootfs im=
age as initramfs...<br>[ =C2=A0 =C2=A00.336332] kvm [1]: HYP mode not avail=
able<br>[ =C2=A0 =C2=A00.343844] Initialise system trusted keyrings<br>[ =
=C2=A0 =C2=A00.346555] workingset: timestamp_bits=3D46 max_order=3D19 bucke=
t_order=3D0<br>[ =C2=A0 =C2=A00.347547] zbud: loaded<br>[ =C2=A0 =C2=A00.35=
7060] Key type cifs.idmap registered<br>[ =C2=A0 =C2=A00.358007] fuse: init=
 (API version 7.39)<br>[ =C2=A0 =C2=A00.401184] Key type asymmetric registe=
red<br>[ =C2=A0 =C2=A00.401438] Asymmetric key parser &#39;x509&#39; regist=
ered<br>[ =C2=A0 =C2=A00.401856] Block layer SCSI generic (bsg) driver vers=
ion 0.4 loaded (major 244)<br>[ =C2=A0 =C2=A00.403283] io scheduler mq-dead=
line registered<br>[ =C2=A0 =C2=A00.403590] io scheduler kyber registered<b=
r>[ =C2=A0 =C2=A00.404135] io scheduler bfq registered<br>[ =C2=A0 =C2=A00.=
419403] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000 mem_size:0x00000=
000(0 MiB)<br>[ =C2=A0 =C2=A00.474856] brd: module loaded<br>[ =C2=A0 =C2=
=A00.505166] loop: module loaded<br>[ =C2=A0 =C2=A00.508386] Loading iSCSI =
transport class v2.0-870.<br>[ =C2=A0 =C2=A00.518541] wireguard: WireGuard =
1.0.0 loaded. See <a href=3D"http://www.wireguard.com">www.wireguard.com</a=
> for information.<br>[ =C2=A0 =C2=A00.518727] wireguard: Copyright (C) 201=
5-2019 Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c=
4.com</a>&gt;. All Rights Reserved.<br>[ =C2=A0 =C2=A00.530178] tun: Univer=
sal TUN/TAP device driver, 1.6<br>[ =C2=A0 =C2=A00.533835] usbcore: registe=
red new interface driver brcmfmac<br>[ =C2=A0 =C2=A00.534107] usbcore: regi=
stered new device driver r8152-cfgselector<br>[ =C2=A0 =C2=A00.534455] usbc=
ore: registered new interface driver r8152<br>[ =C2=A0 =C2=A00.534682] usbc=
ore: registered new interface driver lan78xx<br>[ =C2=A0 =C2=A00.534915] us=
bcore: registered new interface driver asix<br>[ =C2=A0 =C2=A00.535376] usb=
core: registered new interface driver ax88179_178a<br>[ =C2=A0 =C2=A00.5356=
08] usbcore: registered new interface driver cdc_ether<br>[ =C2=A0 =C2=A00.=
535863] usbcore: registered new interface driver smsc95xx<br>[ =C2=A0 =C2=
=A00.536193] usbcore: registered new interface driver net1080<br>[ =C2=A0 =
=C2=A00.536532] usbcore: registered new interface driver cdc_subset<br>[ =
=C2=A0 =C2=A00.536771] usbcore: registered new interface driver zaurus<br>[=
 =C2=A0 =C2=A00.537039] usbcore: registered new interface driver cdc_ncm<br=
>[ =C2=A0 =C2=A00.537301] usbcore: registered new interface driver r8153_ec=
m<br>[ =C2=A0 =C2=A00.538269] dwc_otg: version 3.00a 10-AUG-2012 (platform =
bus)<br>[ =C2=A0 =C2=A00.538549] dwc_otg: FIQ enabled<br>[ =C2=A0 =C2=A00.5=
38629] dwc_otg: NAK holdoff enabled<br>[ =C2=A0 =C2=A00.538725] dwc_otg: FI=
Q split-transaction FSM enabled<br>[ =C2=A0 =C2=A00.538906] Module dwc_comm=
on_port init<br>[ =C2=A0 =C2=A00.541229] usbcore: registered new interface =
driver cdc_acm<br>[ =C2=A0 =C2=A00.541356] cdc_acm: USB Abstract Control Mo=
del driver for USB modems and ISDN adapters<br>[ =C2=A0 =C2=A00.542269] usb=
core: registered new interface driver uas<br>[ =C2=A0 =C2=A00.542583] usbco=
re: registered new interface driver usb-storage<br>[ =C2=A0 =C2=A00.543322]=
 usbcore: registered new interface driver cp210x<br>[ =C2=A0 =C2=A00.543681=
] usbserial: USB Serial support registered for cp210x<br>[ =C2=A0 =C2=A00.5=
43973] usbcore: registered new interface driver pl2303<br>[ =C2=A0 =C2=A00.=
544176] usbserial: USB Serial support registered for pl2303<br>[ =C2=A0 =C2=
=A00.547458] mousedev: PS/2 mouse device common for all mice<br>[ =C2=A0 =
=C2=A00.547725] usbcore: registered new interface driver xpad<br>[ =C2=A0 =
=C2=A00.547949] usbcore: registered new interface driver usb_acecad<br>[ =
=C2=A0 =C2=A00.548186] usbcore: registered new interface driver aiptek<br>[=
 =C2=A0 =C2=A00.548462] usbcore: registered new interface driver hanwang<br=
>[ =C2=A0 =C2=A00.548692] usbcore: registered new interface driver kbtab<br=
>[ =C2=A0 =C2=A00.549180] usbcore: registered new interface driver usbtouch=
screen<br>[ =C2=A0 =C2=A00.550460] i2c_dev: i2c /dev entries driver<br>[ =
=C2=A0 =C2=A00.553959] ir_imon_decoder: IR iMON protocol handler initialize=
d<br>[ =C2=A0 =C2=A00.554110] IR JVC protocol handler initialized<br>[ =C2=
=A0 =C2=A00.554225] IR MCE Keyboard/mouse protocol handler initialized<br>[=
 =C2=A0 =C2=A00.554357] IR NEC protocol handler initialized<br>[ =C2=A0 =C2=
=A00.554476] IR RC5(x/sz) protocol handler initialized<br>[ =C2=A0 =C2=A00.=
554593] IR RC6 protocol handler initialized<br>[ =C2=A0 =C2=A00.554711] IR =
RCMM protocol handler initialized<br>[ =C2=A0 =C2=A00.554829] IR SANYO prot=
ocol handler initialized<br>[ =C2=A0 =C2=A00.555046] IR Sharp protocol hand=
ler initialized<br>[ =C2=A0 =C2=A00.555351] IR Sony protocol handler initia=
lized<br>[ =C2=A0 =C2=A00.555469] IR XMP protocol handler initialized<br>[ =
=C2=A0 =C2=A00.556083] usbcore: registered new interface driver uvcvideo<br=
>[ =C2=A0 =C2=A00.557793] device-mapper: uevent: version 1.0.3<br>[ =C2=A0 =
=C2=A00.558904] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised=
: <a href=3D"mailto:dm-devel@redhat.com">dm-devel@redhat.com</a><br>[ =C2=
=A0 =C2=A00.560836] Bluetooth: HCI UART driver ver 2.3<br>[ =C2=A0 =C2=A00.=
561007] Bluetooth: HCI UART protocol H4 registered<br>[ =C2=A0 =C2=A00.5614=
40] Bluetooth: HCI UART protocol Broadcom registered<br>[ =C2=A0 =C2=A00.56=
3240] sdhci: Secure Digital Host Controller Interface driver<br>[ =C2=A0 =
=C2=A00.563373] sdhci: Copyright(c) Pierre Ossman<br>[ =C2=A0 =C2=A00.56386=
1] sdhci-pltfm: SDHCI platform and OF driver helper<br>[ =C2=A0 =C2=A00.565=
404] ledtrig-cpu: registered to indicate activity on CPUs<br>[ =C2=A0 =C2=
=A00.567595] hid: raw HID events driver (C) Jiri Kosina<br>[ =C2=A0 =C2=A00=
.578778] usbcore: registered new interface driver usbhid<br>[ =C2=A0 =C2=A0=
0.579196] usbhid: USB HID core driver<br>[ =C2=A0 =C2=A00.582877] ashmem: i=
nitialized<br>[ =C2=A0 =C2=A00.584380] SPI driver st-accel-spi has no spi_d=
evice_id for st,lis302dl-spi<br>[ =C2=A0 =C2=A00.584551] SPI driver st-acce=
l-spi has no spi_device_id for st,lis3lv02dl-accel<br>[ =C2=A0 =C2=A00.5847=
45] SPI driver st-accel-spi has no spi_device_id for st,lis3dh-accel<br>[ =
=C2=A0 =C2=A00.584935] SPI driver st-accel-spi has no spi_device_id for st,=
lsm330d-accel<br>[ =C2=A0 =C2=A00.585076] SPI driver st-accel-spi has no sp=
i_device_id for st,lsm330dl-accel<br>[ =C2=A0 =C2=A00.585242] SPI driver st=
-accel-spi has no spi_device_id for st,lsm330dlc-accel<br>[ =C2=A0 =C2=A00.=
585385] SPI driver st-accel-spi has no spi_device_id for st,lis331dlh-accel=
<br>[ =C2=A0 =C2=A00.585526] SPI driver st-accel-spi has no spi_device_id f=
or st,lsm330-accel<br>[ =C2=A0 =C2=A00.585663] SPI driver st-accel-spi has =
no spi_device_id for st,lsm303agr-accel<br>[ =C2=A0 =C2=A00.585803] SPI dri=
ver st-accel-spi has no spi_device_id for st,lis2dh12-accel<br>[ =C2=A0 =C2=
=A00.585944] SPI driver st-accel-spi has no spi_device_id for st,lng2dm-acc=
el<br>[ =C2=A0 =C2=A00.586094] SPI driver st-accel-spi has no spi_device_id=
 for st,h3lis331dl-accel<br>[ =C2=A0 =C2=A00.586280] SPI driver st-accel-sp=
i has no spi_device_id for st,lis331dl-accel<br>[ =C2=A0 =C2=A00.586460] SP=
I driver st-accel-spi has no spi_device_id for st,lsm303c-accel<br>[ =C2=A0=
 =C2=A00.587705] SPI driver st-magn-spi has no spi_device_id for st,lis3mdl=
-magn<br>[ =C2=A0 =C2=A00.587923] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303agr-magn<br>[ =C2=A0 =C2=A00.588163] SPI driver st-magn-spi=
 has no spi_device_id for st,lsm9ds1-magn<br>[ =C2=A0 =C2=A00.588410] SPI d=
river st-magn-spi has no spi_device_id for st,lsm303c-magn<br>[ =C2=A0 =C2=
=A00.596185] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7 counters=
 available<br>[ =C2=A0 =C2=A00.600270] usbcore: registered new interface dr=
iver snd-usb-audio<br>[ =C2=A0 =C2=A00.607077] Mirror/redirect action on<br=
>[ =C2=A0 =C2=A00.607525] netem: version 1.3<br>[ =C2=A0 =C2=A00.607614] u3=
2 classifier<br>[ =C2=A0 =C2=A00.607673] =C2=A0 =C2=A0 input device check o=
n<br>[ =C2=A0 =C2=A00.607755] =C2=A0 =C2=A0 Actions configured<br>[ =C2=A0 =
=C2=A00.615221] xt_time: kernel timezone is -0000<br>[ =C2=A0 =C2=A00.61569=
3] gre: GRE over IPv4 demultiplexor driver<br>[ =C2=A0 =C2=A00.615911] IPv4=
 over IPsec tunneling driver<br>[ =C2=A0 =C2=A00.621107] Initializing XFRM =
netlink socket<br>[ =C2=A0 =C2=A00.621440] IPsec XFRM device driver<br>[ =
=C2=A0 =C2=A00.622363] NET: Registered PF_INET6 protocol family<br>[ =C2=A0=
 =C2=A00.635597] Segment Routing with IPv6<br>[ =C2=A0 =C2=A00.635871] In-s=
itu OAM (IOAM) with IPv6<br>[ =C2=A0 =C2=A00.636820] mip6: Mobile IPv6<br>[=
 =C2=A0 =C2=A00.641935] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver=
<br>[ =C2=A0 =C2=A00.646292] NET: Registered PF_PACKET protocol family<br>[=
 =C2=A0 =C2=A00.646553] NET: Registered PF_KEY protocol family<br>[ =C2=A0 =
=C2=A00.646756] Key type dns_resolver registered<br>[ =C2=A0 =C2=A00.779288=
] registered taskstats version 1<br>[ =C2=A0 =C2=A00.781971] Loading compil=
ed-in X.509 certificates<br>[ =C2=A0 =C2=A00.852683] Key type .fscrypt regi=
stered<br>[ =C2=A0 =C2=A00.852897] Key type fscrypt-provisioning registered=
<br>[ =C2=A0 =C2=A00.864447] of_cfs_init<br>[ =C2=A0 =C2=A00.865145] of_cfs=
_init: OK<br>[ =C2=A0 =C2=A00.870305] cfg80211: Loading compiled-in X.509 c=
ertificates for regulatory database<br>[ =C2=A0 =C2=A01.478027] Freeing ini=
trd memory: 14612K<br>[ =C2=A0 =C2=A01.503691] Loaded X.509 cert &#39;<a hr=
ef=3D"mailto:benh@debian.org">benh@debian.org</a>: 577e021cb980e0e820821ba7=
b54b4961b8b4fadf&#39;<br>[ =C2=A0 =C2=A01.504674] Loaded X.509 cert &#39;<a=
 href=3D"mailto:romain.perier@gmail.com">romain.perier@gmail.com</a>: 3abbc=
6ec146e09d1b6016ab9d6cf71dd233f0328&#39;<br>[ =C2=A0 =C2=A01.505470] Loaded=
 X.509 cert &#39;sforshee: 00b28ddf47aef9cea7&#39;<br>[ =C2=A0 =C2=A01.5061=
97] Loaded X.509 cert &#39;wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600&#=
39;<br>[ =C2=A0 =C2=A01.512240] clk: Disabling unused clocks<br>[ =C2=A0 =
=C2=A01.512725] ALSA device list:<br>[ =C2=A0 =C2=A01.512871] =C2=A0 No sou=
ndcards found.<br>[ =C2=A0 =C2=A01.517373] uart-pl011 9040000.pl011: no DMA=
 platform data<br>[ =C2=A0 =C2=A01.607308] Freeing unused kernel memory: 17=
92K<br>[ =C2=A0 =C2=A01.610100] Run /init as init process<br>[ =C2=A0 =C2=
=A01.610246] =C2=A0 with arguments:<br>[ =C2=A0 =C2=A01.610366] =C2=A0 =C2=
=A0 /init<br>[ =C2=A0 =C2=A01.610472] =C2=A0 with environment:<br>[ =C2=A0 =
=C2=A01.610544] =C2=A0 =C2=A0 HOME=3D/<br>[ =C2=A0 =C2=A01.610615] =C2=A0 =
=C2=A0 TERM=3Dlinux<br>linker: Warning: &quot;[vdso]&quot; unused DT entry:=
 unknown processor-specific (type 0x70000001 arg 0x0) (ignoring)<br>WARNING=
: linker: Warning: &quot;[vdso]&quot; unused DT entry: unknown processor-sp=
ecific (type 0x70000001 arg 0x0) (ignoring)<br>[ =C2=A0 =C2=A01.971090] ini=
t: init first stage started!<br>[ =C2=A0 =C2=A01.974290] init: ForceNormalB=
oot::twrp_fastboot: 1<br>[ =C2=A0 =C2=A01.974628] init: ForceNormalBoot::no=
rmal_boot: 0<br>[ =C2=A0 =C2=A01.976478] init: Unable to open /lib/modules,=
 skipping module loading.<br>[ =C2=A0 =C2=A01.977251] init: ForceNormalBoot=
::twrp_fastboot: 1<br>[ =C2=A0 =C2=A01.977534] init: ForceNormalBoot::norma=
l_boot: 0<br>[ =C2=A0 =C2=A01.978174] init: First stage mount skipped (reco=
very mode)<br>[ =C2=A0 =C2=A01.982840] init: [libfs_mgr]ReadFstabFromDt(): =
failed to read fstab from dt<br>[ =C2=A0 =C2=A01.987898] init: [libfs_mgr]W=
arning: unknown flag: backup=3D1<br>[ =C2=A0 =C2=A01.988241] init: [libfs_m=
gr]Warning: unknown flag: wipeingui<br>[ =C2=A0 =C2=A02.002691] printk: ini=
t: 6 output lines suppressed due to ratelimiting<br>[ =C2=A0 =C2=A02.016195=
] linker: Warning: &quot;[vdso]&quot; unused DT entry: unknown processor-sp=
ecific (type 0x70000001 arg 0x0) (ignoring)<br>[ =C2=A0 =C2=A02.016510] WAR=
NING: linker: <br>[ =C2=A0 =C2=A02.016604] Warning: &quot;<br>[ =C2=A0 =C2=
=A02.016752] [vdso]<br>[ =C2=A0 =C2=A02.016889] &quot; unused DT entry: <br=
>[ =C2=A0 =C2=A02.017021] unknown processor-specific<br>[ =C2=A0 =C2=A02.01=
7168] =C2=A0(type <br>[ =C2=A0 =C2=A02.017381] 0x70000001<br>[ =C2=A0 =C2=
=A02.017512] =C2=A0arg <br>[ =C2=A0 =C2=A02.017647] 0x0<br>[ =C2=A0 =C2=A02=
.202622] printk: init: 2 output lines suppressed due to ratelimiting<br>[ =
=C2=A0 =C2=A02.208265] init: [libfs_mgr]Warning: unknown flag: backup=3D1<b=
r>[ =C2=A0 =C2=A02.208576] init: [libfs_mgr]Warning: unknown flag: wipeingu=
i<br>[ =C2=A0 =C2=A02.208914] init: [libfs_mgr]Warning: unknown flag: backu=
p=3D1<br>[ =C2=A0 =C2=A02.209219] init: [libfs_mgr]Warning: unknown flag: w=
ipeingui<br>[ =C2=A0 =C2=A02.209836] init: [libfs_mgr]Warning: unknown flag=
: backup=3D1<br>[ =C2=A0 =C2=A02.210125] init: [libfs_mgr]Warning: unknown =
flag: wipeingui<br>[ =C2=A0 =C2=A02.215144] init: Skipping mount of system_=
ext, system is not dynamic.<br>[ =C2=A0 =C2=A02.215880] init: Loading SELin=
ux policy<br>[ =C2=A0 =C2=A02.266430] SELinux: =C2=A0Permission nlmsg_getne=
igh in class netlink_route_socket not defined in policy.<br>[ =C2=A0 =C2=A0=
2.266759] SELinux: =C2=A0Permission perfmon in class capability2 not define=
d in policy.<br>[ =C2=A0 =C2=A02.266903] SELinux: =C2=A0Permission bpf in c=
lass capability2 not defined in policy.<br>[ =C2=A0 =C2=A02.267119] SELinux=
: =C2=A0Permission checkpoint_restore in class capability2 not defined in p=
olicy.<br>[ =C2=A0 =C2=A02.267369] SELinux: =C2=A0Permission perfmon in cla=
ss cap2_userns not defined in policy.<br>[ =C2=A0 =C2=A02.267524] SELinux: =
=C2=A0Permission bpf in class cap2_userns not defined in policy.<br>[ =C2=
=A0 =C2=A02.267653] SELinux: =C2=A0Permission checkpoint_restore in class c=
ap2_userns not defined in policy.<br>[ =C2=A0 =C2=A02.267956] SELinux: =C2=
=A0Class mctp_socket not defined in policy.<br>[ =C2=A0 =C2=A02.268106] SEL=
inux: =C2=A0Class anon_inode not defined in policy.<br>[ =C2=A0 =C2=A02.268=
256] SELinux: =C2=A0Class io_uring not defined in policy.<br>[ =C2=A0 =C2=
=A02.268386] SELinux: =C2=A0Class user_namespace not defined in policy.<br>=
[ =C2=A0 =C2=A02.268521] SELinux: the above unknown classes and permissions=
 will be denied<br>[ =C2=A0 =C2=A02.288331] SELinux: =C2=A0policy capabilit=
y network_peer_controls=3D1<br>[ =C2=A0 =C2=A02.288500] SELinux: =C2=A0poli=
cy capability open_perms=3D1<br>[ =C2=A0 =C2=A02.288618] SELinux: =C2=A0pol=
icy capability extended_socket_class=3D1<br>[ =C2=A0 =C2=A02.288751] SELinu=
x: =C2=A0policy capability always_check_network=3D0<br>[ =C2=A0 =C2=A02.288=
881] SELinux: =C2=A0policy capability cgroup_seclabel=3D0<br>[ =C2=A0 =C2=
=A02.289005] SELinux: =C2=A0policy capability nnp_nosuid_transition=3D1<br>=
[ =C2=A0 =C2=A02.289137] SELinux: =C2=A0policy capability genfs_seclabel_sy=
mlinks=3D0<br>[ =C2=A0 =C2=A02.289319] SELinux: =C2=A0policy capability ioc=
tl_skip_cloexec=3D0<br>[ =C2=A0 =C2=A02.307140] audit: type=3D1403 audit(2.=
288:2): auid=3D4294967295 ses=3D4294967295 lsm=3Dselinux res=3D1<br>[ =C2=
=A0 =C2=A02.308695] selinux: SELinux: Loaded policy from /sepolicy<br>[ =C2=
=A0 =C2=A02.308967] selinux: <br>[ =C2=A0 =C2=A02.359528] printk: init: 2 o=
utput lines suppressed due to ratelimiting<br>[ =C2=A0 =C2=A02.556011] init=
: init second stage started!<br>[ =C2=A0 =C2=A02.776035] init: Using Androi=
d DT directory /proc/device-tree/firmware/android/<br>[ =C2=A0 =C2=A02.7972=
64] init: Couldn&#39;t load property file &#39;/system/etc/prop.default&#39=
;: open() failed: No such file or directory: No such file or directory<br>[=
 =C2=A0 =C2=A02.846779] init: Couldn&#39;t load property file &#39;/system/=
build.prop&#39;: open() failed: No such file or directory: No such file or =
directory<br>[ =C2=A0 =C2=A02.847869] init: Couldn&#39;t load property file=
 &#39;/system_ext/build.prop&#39;: open() failed: No such file or directory=
: No such file or directory<br>[ =C2=A0 =C2=A02.848540] init: Couldn&#39;t =
load property file &#39;/vendor/default.prop&#39;: open() failed: No such f=
ile or directory: No such file or directory<br>[ =C2=A0 =C2=A02.849165] ini=
t: Couldn&#39;t load property file &#39;/vendor/build.prop&#39;: open() fai=
led: No such file or directory: No such file or directory<br>[ =C2=A0 =C2=
=A02.849830] init: Couldn&#39;t load property file &#39;/odm/etc/build.prop=
&#39;: open() failed: No such file or directory: No such file or directory<=
br>[ =C2=A0 =C2=A02.850546] init: Couldn&#39;t load property file &#39;/pro=
duct/build.prop&#39;: open() failed: No such file or directory: No such fil=
e or directory<br>[ =C2=A0 =C2=A02.851394] init: Couldn&#39;t load property=
 file &#39;/factory/factory.prop&#39;: open() failed: No such file or direc=
tory: No such file or directory<br>[ =C2=A0 =C2=A03.089359] cgroup: Disable=
d controller &#39;memory&#39;<br>[ =C2=A0 =C2=A03.092460] cgroup: Unknown s=
ubsys name &#39;schedtune&#39;<br>[ =C2=A0 =C2=A03.120187] audit: type=3D14=
00 audit(3.100:3): avc: =C2=A0denied =C2=A0{ perfmon } for =C2=A0pid=3D1 co=
mm=3D&quot;init&quot; capability=3D38 =C2=A0scontext=3Du:r:init:s0 tcontext=
=3Du:r:init:s0 tclass=3Dcapability2 permissive=3D1<br>[ =C2=A0 =C2=A03.4264=
15] ueventd: ueventd started!<br>[ =C2=A0 =C2=A03.448141] selinux: SELinux:=
 Loaded file_contexts<br>[ =C2=A0 =C2=A03.448414] selinux: <br>[ =C2=A0 =C2=
=A03.450283] ueventd: Parsing file /system/etc/ueventd.rc...<br>[ =C2=A0 =
=C2=A03.455379] ueventd: Parsing file /vendor/ueventd.rc...<br>[ =C2=A0 =C2=
=A03.455868] ueventd: Unable to read config file &#39;/vendor/ueventd.rc&#3=
9;: open() failed: No such file or directory<br>[ =C2=A0 =C2=A03.456438] ue=
ventd: Parsing file /odm/ueventd.rc...<br>[ =C2=A0 =C2=A03.456890] ueventd:=
 Unable to read config file &#39;/odm/ueventd.rc&#39;: open() failed: No su=
ch file or directory<br>[ =C2=A0 =C2=A03.457440] ueventd: Parsing file /uev=
entd.rpi4.rc...<br>[ =C2=A0 =C2=A03.457909] ueventd: Unable to read config =
file &#39;/ueventd.rpi4.rc&#39;: open() failed: No such file or directory<b=
r>[ =C2=A0 =C2=A04.699678] audit: type=3D1400 audit(4.684:4): avc: =C2=A0de=
nied =C2=A0{ entrypoint } for =C2=A0pid=3D96 comm=3D&quot;init&quot; path=
=3D&quot;/system/bin/logd&quot; dev=3D&quot;rootfs&quot; ino=3D271 scontext=
=3Du:r:logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile permissive=3D1=
<br>[ =C2=A0 =C2=A04.706631] audit: type=3D1400 audit(4.688:5): avc: =C2=A0=
denied =C2=A0{ map } for =C2=A0pid=3D96 comm=3D&quot;logd&quot; path=3D&quo=
t;/system/bin/logd&quot; dev=3D&quot;rootfs&quot; ino=3D271 scontext=3Du:r:=
logd:s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile permissive=3D1<br>[ =
=C2=A0 =C2=A04.707481] audit: type=3D1400 audit(4.688:6): avc: =C2=A0denied=
 =C2=A0{ read } for =C2=A0pid=3D96 comm=3D&quot;logd&quot; path=3D&quot;/sy=
stem/bin/logd&quot; dev=3D&quot;rootfs&quot; ino=3D271 scontext=3Du:r:logd:=
s0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0=
 =C2=A04.708316] audit: type=3D1400 audit(4.688:7): avc: =C2=A0denied =C2=
=A0{ execute } for =C2=A0pid=3D96 comm=3D&quot;logd&quot; path=3D&quot;/sys=
tem/bin/logd&quot; dev=3D&quot;rootfs&quot; ino=3D271 scontext=3Du:r:logd:s=
0 tcontext=3Du:object_r:rootfs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0 =
=C2=A04.729108] audit: type=3D1400 audit(4.712:8): avc: =C2=A0denied =C2=A0=
{ getattr } for =C2=A0pid=3D96 comm=3D&quot;logd&quot; path=3D&quot;/system=
/bin/logd&quot; dev=3D&quot;rootfs&quot; ino=3D271 scontext=3Du:r:logd:s0 t=
context=3Du:object_r:rootfs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0 =C2=
=A04.743227] audit: type=3D1400 audit(4.724:9): avc: =C2=A0denied =C2=A0{ r=
ead } for =C2=A0pid=3D96 comm=3D&quot;logd&quot; name=3D&quot;bin&quot; dev=
=3D&quot;rootfs&quot; ino=3D167 scontext=3Du:r:logd:s0 tcontext=3Du:object_=
r:rootfs:s0 tclass=3Ddir permissive=3D1<br>[ =C2=A0 =C2=A04.755432] audit: =
type=3D1400 audit(4.736:10): avc: =C2=A0denied =C2=A0{ open } for =C2=A0pid=
=3D96 comm=3D&quot;logd&quot; path=3D&quot;/system/lib64/libsysutils.so&quo=
t; dev=3D&quot;rootfs&quot; ino=3D6255 scontext=3Du:r:logd:s0 tcontext=3Du:=
object_r:rootfs:s0 tclass=3Dfile permissive=3D1<br>[ =C2=A0 =C2=A04.937922]=
 logd: Cannot read /system/etc/event-log-tags<br>[ =C2=A0 =C2=A04.964388] f=
ile system registered<br>[ =C2=A0 =C2=A04.969588] logd.auditd: start<br>[ =
=C2=A0 =C2=A04.970233] logd.klogd: 4955041232<br>[ =C2=A0 =C2=A05.132743] t=
ype=3D1400 audit(5.108:14): avc: denied { create } for comm=3D&quot;hwservi=
cemanage&quot; scontext=3Du:r:recovery:s0 tcontext=3Du:r:recovery:s0 tclass=
=3Dnetlink_selinux_socket permissive=3D1<br>[ =C2=A0 =C2=A05.136378] type=
=3D1400 audit(5.112:15): avc: denied { bind } for comm=3D&quot;hwserviceman=
age&quot; scontext=3Du:r:recovery:s0 tcontext=3Du:r:recovery:s0 tclass=3Dne=
tlink_selinux_socket permissive=3D1<br>[ =C2=A0 =C2=A05.143332] type=3D1400=
 audit(5.112:16): avc: denied { read } for comm=3D&quot;hwservicemanage&quo=
t; name=3D&quot;perms&quot; dev=3D&quot;selinuxfs&quot; ino=3D67112391 scon=
text=3Du:r:recovery:s0 tcontext=3Du:object_r:selinuxfs:s0 tclass=3Ddir perm=
issive=3D1<br>[ =C2=A0 =C2=A05.146297] type=3D1400 audit(5.112:17): avc: de=
nied { open } for comm=3D&quot;hwservicemanage&quot; path=3D&quot;/sys/fs/s=
elinux/class/hwservice_manager/perms&quot; dev=3D&quot;selinuxfs&quot; ino=
=3D67112391 scontext=3Du:r:recovery:s0 tcontext=3Du:object_r:selinuxfs:s0 t=
class=3Ddir permissive=3D1<br>[ =C2=A0 =C2=A05.174030] type=3D1400 audit(5.=
124:18): avc: denied { write } for comm=3D&quot;hwservicemanage&quot; name=
=3D&quot;access&quot; dev=3D&quot;selinuxfs&quot; ino=3D6 scontext=3Du:r:re=
covery:s0 tcontext=3Du:object_r:selinuxfs:s0 tclass=3Dfile permissive=3D1<b=
r>[ =C2=A0 =C2=A05.177477] type=3D1400 audit(5.124:19): avc: denied { compu=
te_av } for comm=3D&quot;hwservicemanage&quot; scontext=3Du:r:recovery:s0 t=
context=3Du:object_r:kernel:s0 tclass=3Dsecurity permissive=3D1<br>[ =C2=A0=
 =C2=A05.181388] type=3D1400 audit(5.152:20): avc: denied { set_context_mgr=
 } for comm=3D&quot;hwservicemanage&quot; scontext=3Du:r:recovery:s0 tconte=
xt=3Du:r:recovery:s0 tclass=3Dbinder permissive=3D1<br>WARNING: linker: War=
ning: &quot;[vdso]&quot; unused DT entry: unknown processor-specific (type =
0x70000001 arg 0x0) (ignoring)<br><br>console:/ # <br><br>[ =C2=A0 =C2=A07.=
812969] init: Service &#39;recovery&#39; (pid 106) received signal 11<br>[ =
=C2=A0 =C2=A07.813381] init: Sending signal 9 to service &#39;recovery&#39;=
 (pid 106) process group...<br>[ =C2=A0 =C2=A07.814694] libprocessgroup: Su=
ccessfully killed process cgroup uid 0 pid 106 in 0ms<br>[ =C2=A0 =C2=A07.8=
20960] init: Untracked pid 110 exited with status 1<br>[ =C2=A0 10.206834] =
init: starting service &#39;recovery&#39;...<br>[ =C2=A0 10.211672] init: C=
reated socket &#39;/dev/socket/recovery&#39;, mode 422, user 1000, group 10=
00<br>[ =C2=A0 10.313714] init: starting service &#39;adbd&#39;...<br>[ =C2=
=A0 10.319354] init: Created socket &#39;/dev/socket/adbd&#39;, mode 660, u=
ser 1000, group 1000<br>[ =C2=A0 10.597898] read descriptors<br>[ =C2=A0 10=
.598630] bcdVersion must be 0x0100, stored in Little Endian order. Userspac=
e driver should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 1=
0.599621] bcdVersion must be 0x0100, stored in Little Endian order. Userspa=
ce driver should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 =
10.600467] read strings<br>[ =C2=A0 10.613340] init: processing action (sys=
.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.re=
ady=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 10.632907] init=
: Command &#39;write /config/usb_gadget/g1/UDC ${sys.usb.controller}&#39; a=
ction=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys=
.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 1ms and failed: p=
roperty &#39;sys.usb.controller&#39; doesn&#39;t exist while expanding &#39=
;${sys.usb.controller}&#39;<br>[ =C2=A0 11.678635] read descriptors<br>[ =
=C2=A0 11.678883] bcdVersion must be 0x0100, stored in Little Endian order.=
 Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>[=
 =C2=A0 11.679695] bcdVersion must be 0x0100, stored in Little Endian order=
. Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>=
[ =C2=A0 11.680663] read strings<br>[ =C2=A0 11.760913] platform gpio-keys:=
 deferred probe pending<br>[ =C2=A0 12.761137] read descriptors<br>[ =C2=A0=
 12.761449] bcdVersion must be 0x0100, stored in Little Endian order. Users=
pace driver should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=
=A0 12.761972] bcdVersion must be 0x0100, stored in Little Endian order. Us=
erspace driver should be fixed, accepting 0x0001 for compatibility.<br>[ =
=C2=A0 12.762607] read strings<br>[ =C2=A0 13.826065] read descriptors<br>[=
 =C2=A0 13.826428] bcdVersion must be 0x0100, stored in Little Endian order=
. Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>=
[ =C2=A0 13.827903] bcdVersion must be 0x0100, stored in Little Endian orde=
r. Userspace driver should be fixed, accepting 0x0001 for compatibility.<br=
>[ =C2=A0 13.829154] read strings<br>[ =C2=A0 13.833730] init: processing a=
ction (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.=
usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 13.83=
9092] init: Command &#39;symlink /config/usb_gadget/g1/functions/ffs.adb /c=
onfig/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;=
&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/in=
it/hw/init.rc:211) took 0ms and failed: symlink() failed: File exists<br>[ =
=C2=A0 13.840732] init: Command &#39;write /config/usb_gadget/g1/UDC ${sys.=
usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.confi=
gfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) =
took 0ms and failed: property &#39;sys.usb.controller&#39; doesn&#39;t exis=
t while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 14.889512] re=
ad descriptors<br>[ =C2=A0 14.889701] bcdVersion must be 0x0100, stored in =
Little Endian order. Userspace driver should be fixed, accepting 0x0001 for=
 compatibility.<br>[ =C2=A0 14.890177] bcdVersion must be 0x0100, stored in=
 Little Endian order. Userspace driver should be fixed, accepting 0x0001 fo=
r compatibility.<br>[ =C2=A0 14.890767] read strings<br>[ =C2=A0 14.895430]=
 init: processing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=
=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:20=
8)<br>[ =C2=A0 14.900587] init: Command &#39;symlink /config/usb_gadget/g1/=
functions/ffs.adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.us=
b.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=
=3D1 (/system/etc/init/hw/init.rc:211) took 0ms and failed: symlink() faile=
d: File exists<br>[ =C2=A0 14.902076] init: Command &#39;write /config/usb_=
gadget/g1/UDC ${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp=
;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/i=
nit/hw/init.rc:212) took 0ms and failed: property &#39;sys.usb.controller&#=
39; doesn&#39;t exist while expanding &#39;${sys.usb.controller}&#39;<br>[ =
=C2=A0 15.224749] init: starting service &#39;recovery&#39;...<br>[ =C2=A0 =
15.228494] init: Created socket &#39;/dev/socket/recovery&#39;, mode 422, u=
ser 1000, group 1000<br>[ =C2=A0 15.681727] init: Unable to set property &#=
39;ro.twrp.boot&#39; from uid:0 gid:0 pid:124: Read-only property was alrea=
dy set<br>[ =C2=A0 15.686406] init: Unable to set property &#39;ro.twrp.ver=
sion&#39; from uid:0 gid:0 pid:124: Read-only property was already set<br>[=
 =C2=A0 15.949039] read descriptors<br>[ =C2=A0 15.949240] bcdVersion must =
be 0x0100, stored in Little Endian order. Userspace driver should be fixed,=
 accepting 0x0001 for compatibility.<br>[ =C2=A0 15.949733] bcdVersion must=
 be 0x0100, stored in Little Endian order. Userspace driver should be fixed=
, accepting 0x0001 for compatibility.<br>[ =C2=A0 15.950378] read strings<b=
r>[ =C2=A0 17.016978] read descriptors<br>[ =C2=A0 17.017147] bcdVersion mu=
st be 0x0100, stored in Little Endian order. Userspace driver should be fix=
ed, accepting 0x0001 for compatibility.<br>[ =C2=A0 17.017426] bcdVersion m=
ust be 0x0100, stored in Little Endian order. Userspace driver should be fi=
xed, accepting 0x0001 for compatibility.<br>[ =C2=A0 17.017781] read string=
s<br>[ =C2=A0 18.132636] read descriptors<br>[ =C2=A0 18.133219] bcdVersion=
 must be 0x0100, stored in Little Endian order. Userspace driver should be =
fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 18.134486] bcdVersio=
n must be 0x0100, stored in Little Endian order. Userspace driver should be=
 fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 18.137501] read str=
ings<br>[ =C2=A0 19.197574] read descriptors<br>[ =C2=A0 19.197760] bcdVers=
ion must be 0x0100, stored in Little Endian order. Userspace driver should =
be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 19.198136] bcdVer=
sion must be 0x0100, stored in Little Endian order. Userspace driver should=
 be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 19.198665] read =
strings<br>[ =C2=A0 19.208502] init: processing action (sys.usb.config=3Dad=
b &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) from (/=
system/etc/init/hw/init.rc:208)<br>[ =C2=A0 19.214749] init: Command &#39;s=
ymlink /config/usb_gadget/g1/functions/ffs.adb /config/usb_gadget/g1/config=
s/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1=
 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:211) took 0m=
s and failed: symlink() failed: File exists<br>[ =C2=A0 19.216726] init: Co=
mmand &#39;write /config/usb_gadget/g1/UDC ${sys.usb.controller}&#39; actio=
n=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb=
.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) took 0ms and failed: prope=
rty &#39;sys.usb.controller&#39; doesn&#39;t exist while expanding &#39;${s=
ys.usb.controller}&#39;<br>[ =C2=A0 20.237060] init: starting service &#39;=
recovery&#39;...<br>[ =C2=A0 20.240672] init: Created socket &#39;/dev/sock=
et/recovery&#39;, mode 422, user 1000, group 1000<br>[ =C2=A0 20.282811] re=
ad descriptors<br>[ =C2=A0 20.283381] bcdVersion must be 0x0100, stored in =
Little Endian order. Userspace driver should be fixed, accepting 0x0001 for=
 compatibility.<br>[ =C2=A0 20.283889] bcdVersion must be 0x0100, stored in=
 Little Endian order. Userspace driver should be fixed, accepting 0x0001 fo=
r compatibility.<br>[ =C2=A0 20.284536] read strings<br>[ =C2=A0 20.292396]=
 init: processing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=
=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:20=
8)<br>[ =C2=A0 20.300513] init: Command &#39;symlink /config/usb_gadget/g1/=
functions/ffs.adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.us=
b.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=
=3D1 (/system/etc/init/hw/init.rc:211) took 0ms and failed: symlink() faile=
d: File exists<br>[ =C2=A0 20.302642] init: Command &#39;write /config/usb_=
gadget/g1/UDC ${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp=
;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/i=
nit/hw/init.rc:212) took 0ms and failed: property &#39;sys.usb.controller&#=
39; doesn&#39;t exist while expanding &#39;${sys.usb.controller}&#39;<br>[ =
=C2=A0 20.754865] init: Unable to set property &#39;ro.twrp.boot&#39; from =
uid:0 gid:0 pid:131: Read-only property was already set<br>[ =C2=A0 20.7595=
53] init: Unable to set property &#39;ro.twrp.version&#39; from uid:0 gid:0=
 pid:131: Read-only property was already set<br>[ =C2=A0 21.349790] read de=
scriptors<br>[ =C2=A0 21.350005] bcdVersion must be 0x0100, stored in Littl=
e Endian order. Userspace driver should be fixed, accepting 0x0001 for comp=
atibility.<br>[ =C2=A0 21.350465] bcdVersion must be 0x0100, stored in Litt=
le Endian order. Userspace driver should be fixed, accepting 0x0001 for com=
patibility.<br>[ =C2=A0 21.352780] read strings<br>[ =C2=A0 22.423098] read=
 descriptors<br>[ =C2=A0 22.423361] bcdVersion must be 0x0100, stored in Li=
ttle Endian order. Userspace driver should be fixed, accepting 0x0001 for c=
ompatibility.<br>[ =C2=A0 22.423651] bcdVersion must be 0x0100, stored in L=
ittle Endian order. Userspace driver should be fixed, accepting 0x0001 for =
compatibility.<br>[ =C2=A0 22.424144] read strings<br>[ =C2=A0 23.481363] r=
ead descriptors<br>[ =C2=A0 23.481606] bcdVersion must be 0x0100, stored in=
 Little Endian order. Userspace driver should be fixed, accepting 0x0001 fo=
r compatibility.<br>[ =C2=A0 23.482130] bcdVersion must be 0x0100, stored i=
n Little Endian order. Userspace driver should be fixed, accepting 0x0001 f=
or compatibility.<br>[ =C2=A0 23.482813] read strings<br>[ =C2=A0 24.553075=
] read descriptors<br>[ =C2=A0 24.553241] bcdVersion must be 0x0100, stored=
 in Little Endian order. Userspace driver should be fixed, accepting 0x0001=
 for compatibility.<br>[ =C2=A0 24.553597] bcdVersion must be 0x0100, store=
d in Little Endian order. Userspace driver should be fixed, accepting 0x000=
1 for compatibility.<br>[ =C2=A0 24.553975] read strings<br>[ =C2=A0 24.558=
331] init: processing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.confi=
gfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc=
:208)<br>[ =C2=A0 24.563898] init: Command &#39;symlink /config/usb_gadget/=
g1/functions/ffs.adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys=
.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.re=
ady=3D1 (/system/etc/init/hw/init.rc:211) took 0ms and failed: symlink() fa=
iled: File exists<br>[ =C2=A0 24.565567] init: Command &#39;write /config/u=
sb_gadget/g1/UDC ${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &=
amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/et=
c/init/hw/init.rc:212) took 0ms and failed: property &#39;sys.usb.controlle=
r&#39; doesn&#39;t exist while expanding &#39;${sys.usb.controller}&#39;<br=
>[ =C2=A0 25.248962] init: starting service &#39;recovery&#39;...<br>[ =C2=
=A0 25.253276] init: Created socket &#39;/dev/socket/recovery&#39;, mode 42=
2, user 1000, group 1000<br>[ =C2=A0 25.641207] read descriptors<br>[ =C2=
=A0 25.641328] bcdVersion must be 0x0100, stored in Little Endian order. Us=
erspace driver should be fixed, accepting 0x0001 for compatibility.<br>[ =
=C2=A0 25.641616] bcdVersion must be 0x0100, stored in Little Endian order.=
 Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>[=
 =C2=A0 25.642040] read strings<br>[ =C2=A0 25.648473] init: processing act=
ion (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.us=
b.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0 25.6694=
50] init: Command &#39;symlink /config/usb_gadget/g1/functions/ffs.adb /con=
fig/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb &amp;&a=
mp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init=
/hw/init.rc:211) took 1ms and failed: symlink() failed: File exists<br>[ =
=C2=A0 25.672542] init: Command &#39;write /config/usb_gadget/g1/UDC ${sys.=
usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.confi=
gfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc:212) =
took 0ms and failed: property &#39;sys.usb.controller&#39; doesn&#39;t exis=
t while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 25.706240] in=
it: Unable to set property &#39;ro.twrp.boot&#39; from uid:0 gid:0 pid:139:=
 Read-only property was already set<br>[ =C2=A0 25.710372] init: Unable to =
set property &#39;ro.twrp.version&#39; from uid:0 gid:0 pid:139: Read-only =
property was already set<br>[ =C2=A0 26.709759] read descriptors<br>[ =C2=
=A0 26.710096] bcdVersion must be 0x0100, stored in Little Endian order. Us=
erspace driver should be fixed, accepting 0x0001 for compatibility.<br>[ =
=C2=A0 26.710921] bcdVersion must be 0x0100, stored in Little Endian order.=
 Userspace driver should be fixed, accepting 0x0001 for compatibility.<br>[=
 =C2=A0 26.712463] read strings<br>[ =C2=A0 27.782228] read descriptors<br>=
[ =C2=A0 27.782350] bcdVersion must be 0x0100, stored in Little Endian orde=
r. Userspace driver should be fixed, accepting 0x0001 for compatibility.<br=
>[ =C2=A0 27.782569] bcdVersion must be 0x0100, stored in Little Endian ord=
er. Userspace driver should be fixed, accepting 0x0001 for compatibility.<b=
r>[ =C2=A0 27.782877] read strings<br>[ =C2=A0 28.849863] read descriptors<=
br>[ =C2=A0 28.850115] bcdVersion must be 0x0100, stored in Little Endian o=
rder. Userspace driver should be fixed, accepting 0x0001 for compatibility.=
<br>[ =C2=A0 28.850775] bcdVersion must be 0x0100, stored in Little Endian =
order. Userspace driver should be fixed, accepting 0x0001 for compatibility=
.<br>[ =C2=A0 28.852359] read strings<br>[ =C2=A0 29.942409] read descripto=
rs<br>[ =C2=A0 29.942646] bcdVersion must be 0x0100, stored in Little Endia=
n order. Userspace driver should be fixed, accepting 0x0001 for compatibili=
ty.<br>[ =C2=A0 29.943232] bcdVersion must be 0x0100, stored in Little Endi=
an order. Userspace driver should be fixed, accepting 0x0001 for compatibil=
ity.<br>[ =C2=A0 29.943746] read strings<br>[ =C2=A0 29.949390] init: proce=
ssing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&am=
p; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=
=A0 29.955577] init: Command &#39;symlink /config/usb_gadget/g1/functions/f=
fs.adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3D=
adb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/syst=
em/etc/init/hw/init.rc:211) took 0ms and failed: symlink() failed: File exi=
sts<br>[ =C2=A0 29.957043] init: Command &#39;write /config/usb_gadget/g1/U=
DC ${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.=
usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init=
.rc:212) took 0ms and failed: property &#39;sys.usb.controller&#39; doesn&#=
39;t exist while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 30.2=
68078] init: starting service &#39;recovery&#39;...<br>[ =C2=A0 30.286298] =
init: Created socket &#39;/dev/socket/recovery&#39;, mode 422, user 1000, g=
roup 1000<br>[ =C2=A0 30.726944] init: Unable to set property &#39;ro.twrp.=
boot&#39; from uid:0 gid:0 pid:147: Read-only property was already set<br>[=
 =C2=A0 30.731529] init: Unable to set property &#39;ro.twrp.version&#39; f=
rom uid:0 gid:0 pid:147: Read-only property was already set<br>[ =C2=A0 31.=
017959] read descriptors<br>[ =C2=A0 31.018182] bcdVersion must be 0x0100, =
stored in Little Endian order. Userspace driver should be fixed, accepting =
0x0001 for compatibility.<br>[ =C2=A0 31.018669] bcdVersion must be 0x0100,=
 stored in Little Endian order. Userspace driver should be fixed, accepting=
 0x0001 for compatibility.<br>[ =C2=A0 31.019885] read strings<br>[ =C2=A0 =
31.028871] init: processing action (sys.usb.config=3Dadb &amp;&amp; sys.usb=
.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/i=
nit.rc:208)<br>[ =C2=A0 31.037564] init: Command &#39;symlink /config/usb_g=
adget/g1/functions/ffs.adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=
=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.=
ffs.ready=3D1 (/system/etc/init/hw/init.rc:211) took 0ms and failed: symlin=
k() failed: File exists<br>[ =C2=A0 31.039173] init: Command &#39;write /co=
nfig/usb_gadget/g1/UDC ${sys.usb.controller}&#39; action=3Dsys.usb.config=
=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/s=
ystem/etc/init/hw/init.rc:212) took 0ms and failed: property &#39;sys.usb.c=
ontroller&#39; doesn&#39;t exist while expanding &#39;${sys.usb.controller}=
&#39;<br>[ =C2=A0 32.092703] read descriptors<br>[ =C2=A0 32.093392] bcdVer=
sion must be 0x0100, stored in Little Endian order. Userspace driver should=
 be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 32.093996] bcdVe=
rsion must be 0x0100, stored in Little Endian order. Userspace driver shoul=
d be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 32.095530] read=
 strings<br>[ =C2=A0 33.149642] read descriptors<br>[ =C2=A0 33.149854] bcd=
Version must be 0x0100, stored in Little Endian order. Userspace driver sho=
uld be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 33.150334] bc=
dVersion must be 0x0100, stored in Little Endian order. Userspace driver sh=
ould be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 33.150887] r=
ead strings<br>[ =C2=A0 34.230547] read descriptors<br>[ =C2=A0 34.230852] =
bcdVersion must be 0x0100, stored in Little Endian order. Userspace driver =
should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 34.233227]=
 bcdVersion must be 0x0100, stored in Little Endian order. Userspace driver=
 should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 34.234420=
] read strings<br>[ =C2=A0 35.301592] init: starting service &#39;recovery&=
#39;...<br>[ =C2=A0 35.319970] init: Created socket &#39;/dev/socket/recove=
ry&#39;, mode 422, user 1000, group 1000<br>[ =C2=A0 35.320441] read descri=
ptors<br>[ =C2=A0 35.320589] bcdVersion must be 0x0100, stored in Little En=
dian order. Userspace driver should be fixed, accepting 0x0001 for compatib=
ility.<br>[ =C2=A0 35.321087] bcdVersion must be 0x0100, stored in Little E=
ndian order. Userspace driver should be fixed, accepting 0x0001 for compati=
bility.<br>[ =C2=A0 35.322062] read strings<br>[ =C2=A0 35.382841] init: pr=
ocessing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;=
&amp; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =
=C2=A0 35.391787] init: Command &#39;symlink /config/usb_gadget/g1/function=
s/ffs.adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=
=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/s=
ystem/etc/init/hw/init.rc:211) took 0ms and failed: symlink() failed: File =
exists<br>[ =C2=A0 35.393645] init: Command &#39;write /config/usb_gadget/g=
1/UDC ${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; s=
ys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/i=
nit.rc:212) took 0ms and failed: property &#39;sys.usb.controller&#39; does=
n&#39;t exist while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 3=
5.785517] init: Unable to set property &#39;ro.twrp.boot&#39; from uid:0 gi=
d:0 pid:156: Read-only property was already set<br>[ =C2=A0 35.789909] init=
: Unable to set property &#39;ro.twrp.version&#39; from uid:0 gid:0 pid:156=
: Read-only property was already set<br>[ =C2=A0 36.421841] read descriptor=
s<br>[ =C2=A0 36.422877] bcdVersion must be 0x0100, stored in Little Endian=
 order. Userspace driver should be fixed, accepting 0x0001 for compatibilit=
y.<br>[ =C2=A0 36.426638] bcdVersion must be 0x0100, stored in Little Endia=
n order. Userspace driver should be fixed, accepting 0x0001 for compatibili=
ty.<br>[ =C2=A0 36.427376] read strings<br>[ =C2=A0 36.432055] init: proces=
sing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp=
; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0=
 36.438294] init: Command &#39;symlink /config/usb_gadget/g1/functions/ffs.=
adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb=
 &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/=
etc/init/hw/init.rc:211) took 0ms and failed: symlink() failed: File exists=
<br>[ =C2=A0 36.440095] init: Command &#39;write /config/usb_gadget/g1/UDC =
${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb=
.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc=
:212) took 0ms and failed: property &#39;sys.usb.controller&#39; doesn&#39;=
t exist while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 37.5027=
71] read descriptors<br>[ =C2=A0 37.502908] bcdVersion must be 0x0100, stor=
ed in Little Endian order. Userspace driver should be fixed, accepting 0x00=
01 for compatibility.<br>[ =C2=A0 37.503568] bcdVersion must be 0x0100, sto=
red in Little Endian order. Userspace driver should be fixed, accepting 0x0=
001 for compatibility.<br>[ =C2=A0 37.504160] read strings<br>[ =C2=A0 38.5=
75803] read descriptors<br>[ =C2=A0 38.576299] bcdVersion must be 0x0100, s=
tored in Little Endian order. Userspace driver should be fixed, accepting 0=
x0001 for compatibility.<br>[ =C2=A0 38.577608] bcdVersion must be 0x0100, =
stored in Little Endian order. Userspace driver should be fixed, accepting =
0x0001 for compatibility.<br>[ =C2=A0 38.578173] read strings<br><br>|conso=
le:/ # <br><br>[ =C2=A0 39.633521] read descriptors<br>[ =C2=A0 39.633726] =
bcdVersion must be 0x0100, stored in Little Endian order. Userspace driver =
should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 39.634107]=
 bcdVersion must be 0x0100, stored in Little Endian order. Userspace driver=
 should be fixed, accepting 0x0001 for compatibility.<br>[ =C2=A0 39.634647=
] read strings<br>[ =C2=A0 40.334108] init: starting service &#39;recovery&=
#39;...<br>[ =C2=A0 40.338087] init: Created socket &#39;/dev/socket/recove=
ry&#39;, mode 422, user 1000, group 1000<br>[ =C2=A0 40.721751] read descri=
ptors<br>[ =C2=A0 40.721951] bcdVersion must be 0x0100, stored in Little En=
dian order. Userspace driver should be fixed, accepting 0x0001 for compatib=
ility.<br>[ =C2=A0 40.722415] bcdVersion must be 0x0100, stored in Little E=
ndian order. Userspace driver should be fixed, accepting 0x0001 for compati=
bility.<br>[ =C2=A0 40.723179] read strings<br>[ =C2=A0 40.729072] init: pr=
ocessing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;=
&amp; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =
=C2=A0 40.742406] init: Command &#39;symlink /config/usb_gadget/g1/function=
s/ffs.adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=
=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/s=
ystem/etc/init/hw/init.rc:211) took 0ms and failed: symlink() failed: File =
exists<br>[ =C2=A0 40.745270] init: Command &#39;write /config/usb_gadget/g=
1/UDC ${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; s=
ys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/i=
nit.rc:212) took 0ms and failed: property &#39;sys.usb.controller&#39; does=
n&#39;t exist while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 4=
0.789765] init: Unable to set property &#39;ro.twrp.boot&#39; from uid:0 gi=
d:0 pid:164: Read-only property was already set<br>[ =C2=A0 40.793898] init=
: Unable to set property &#39;ro.twrp.version&#39; from uid:0 gid:0 pid:164=
: Read-only property was already set<br>[ =C2=A0 41.794291] read descriptor=
s<br>[ =C2=A0 41.794526] bcdVersion must be 0x0100, stored in Little Endian=
 order. Userspace driver should be fixed, accepting 0x0001 for compatibilit=
y.<br>[ =C2=A0 41.795504] bcdVersion must be 0x0100, stored in Little Endia=
n order. Userspace driver should be fixed, accepting 0x0001 for compatibili=
ty.<br>[ =C2=A0 41.796355] read strings<br>[ =C2=A0 41.802136] init: proces=
sing action (sys.usb.config=3Dadb &amp;&amp; sys.usb.configfs=3D1 &amp;&amp=
; sys.usb.ffs.ready=3D1) from (/system/etc/init/hw/init.rc:208)<br>[ =C2=A0=
 41.807484] init: Command &#39;symlink /config/usb_gadget/g1/functions/ffs.=
adb /config/usb_gadget/g1/configs/b.1/f1&#39; action=3Dsys.usb.config=3Dadb=
 &amp;&amp; sys.usb.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/=
etc/init/hw/init.rc:211) took 0ms and failed: symlink() failed: File exists=
<br>[ =C2=A0 41.809032] init: Command &#39;write /config/usb_gadget/g1/UDC =
${sys.usb.controller}&#39; action=3Dsys.usb.config=3Dadb &amp;&amp; sys.usb=
.configfs=3D1 &amp;&amp; sys.usb.ffs.ready=3D1 (/system/etc/init/hw/init.rc=
:212) took 0ms and failed: property &#39;sys.usb.controller&#39; doesn&#39;=
t exist while expanding &#39;${sys.usb.controller}&#39;<br>[ =C2=A0 42.8659=
48] read descriptors<br>[ =C2=A0 42.866163] bcdVersion must be 0x0100, stor=
ed in Little Endian order. Userspace driver should be fixed, accepting 0x00=
01 for compatibility.<br>[ =C2=A0 42.866523] bcdVersion must be 0x0100, sto=
red in Little Endian order. Userspace driver should be fixed, accepting 0x0=
001 for compatibility.<br>[ =C2=A0 42.866910] read strings<br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 2=
7, 2024 at 3:04=E2=80=AFPM Mario Marietto &lt;<a href=3D"mailto:marietto200=
8@gmail.com">marietto2008@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello to everyone.=
</div><div><br></div><div>As I said before,some years ago I was able to emu=
late Android on my Jetson Nano. It was a special version of Android,prepare=
d by antmicro and the github is located here :</div><div><br></div><div><a =
href=3D"https://github.com/antmicro/kvm-aosp-jetson-nano" target=3D"_blank"=
>https://github.com/antmicro/kvm-aosp-jetson-nano</a></div><div><br></div><=
div>I would like to compile it again and try to emulate it on my Jetson Nan=
o again and on my Intel PC + Ubuntu 24.04 x64 bit. <br></div><div>I followe=
d the tutorial again and I&#39;ve been able to create the Android img files=
 below without problems :<br></div><div><pre><code><br>out/target/product/g=
eneric_arm64/vendor.img
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

--0000000000006a7b6c0620bd40b6--
