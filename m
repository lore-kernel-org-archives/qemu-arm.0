Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp723193njb;
        Sun, 25 Aug 2024 03:46:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlpRTAPLIA7oH5LOuoS2y13fwy4GipEZN/QZGomv3VA9OYKF6pqzlFU5St/9tsBMsSl1cYFbBqJGib7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGT0l3lcwt0rKYPqsAXvIt7vhADJr+KnXDEl3kguGmwKEIyujkFLFUwNpLGNrk6/2t36YC9
X-Received: by 2002:a05:6102:c52:b0:492:a16e:c83 with SMTP id ada2fe7eead31-498f46053c5mr8677871137.18.1724582781679;
        Sun, 25 Aug 2024 03:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724582781; cv=none;
        d=google.com; s=arc-20160816;
        b=xYqnLbE00uibPrv6GMcQ/3IcJXM8q33fC9hOLA64cOCRtvPGXBsvjj5UlCtvdYbKYj
         amRAv+gjT//UmrjEsBV9hCm7JZEipc3N4JMcyNe1/aJ/9gYANpZtz/NTkG8EFv6D/6zH
         6oXm+bamgWVcmVsvEl5+iYdoQy5qckBCJFAr6L4TL6ak0Ghfdo8DHbNfw4lsRpRcpajz
         gF5q1ibx2IHmMsFjyVHfOGF66dpAILRQsfM6HH4v5bbIHwnFvIYzlv70EaLhZHTJPie7
         GKNc0wf3KD5z8PZapz4HXpdhBoccq1VIPW8WllQ36TjDFcEXwtGMJO+BoD+2iw6teGK6
         lQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9wb+zZSKpa0c8yPTQNrUsrvYh/PHWOUSUquv4ySHEM0=;
        fh=62oDtTbbHt7veJXgWSUQq3P7Qx1BF12sGbUg+ofluSc=;
        b=yKaeOo5xaiTKoEz/d4TYZox/BvuFlT7wXHF1zNEf7pZAWL150y2ZHDmOrQSm/d9Uu9
         Q7UN/p0nWI+zsWDJHv9vGaM5SlsF7zskWVsngjVP2Wi4UL/Urnoq4yIfkkklK43jEOOV
         m/2/nM1M2O/VYtX43Pwr9MzGQ6XlWjxicJH5O/p8Xrk+gAG5xqyWYgzUc1YuAc/ndswH
         F/d3upMP1+YuDbDV5INmxmGZpzO8i0XvVpFfLm5KWFDUm+3YJ227Ta0le91qVE7aU/xM
         TlEYdAPTFL2JtPR103n6e1Xhc1w/fsGkt09XrC6l02+80sUb0elesRpDWmB2f4SnkbF+
         HQhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20230601 header.b=Bv5dxoZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f328eddsi865925285a.67.2024.08.25.03.46.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2024 03:46:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20230601 header.b=Bv5dxoZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siAkd-0005np-6d; Sun, 25 Aug 2024 06:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1siAkX-0005m7-EA; Sun, 25 Aug 2024 06:45:37 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1siAkO-0001yL-HD; Sun, 25 Aug 2024 06:45:33 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-70949118d26so3368877a34.0; 
 Sun, 25 Aug 2024 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724582723; x=1725187523; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=De1uybD/9aXJ2IWwK1pvBeyAEC8ss+XR9RSSbH5cXn4=;
 b=Bv5dxoZbFO9ENOnD2fHpUuZrZTveeVRtKwTjl5PQtAOivnaC95e7y9nIdtgkN0pOfC
 0n2AgyyrlrrNOoAHly33rKSrOqPIbBXSIkIM4FeBVqt+7mp2/y/vzateXHSo+KyuuSRO
 OLSR3oFk0cshedlxjpUKMlPqsC/WUIqhYdq9IWDf3z7n65uQs/5WNOmS4QJ1fpD4gz/p
 CS+iQwRFuGTvS0KwN0lyIDvlTDdyViBRLKUu70X3CHXgjX2RIa0X//1pyQ0uob+eTEX6
 3hLsZ4h0fpM3DJLWfVzZ0ga8MDHfhsr4Di7bUIuU5n8mdLjWmNq8E0x77j6hZfK2Kj96
 fjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724582723; x=1725187523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=De1uybD/9aXJ2IWwK1pvBeyAEC8ss+XR9RSSbH5cXn4=;
 b=UOfKkluLWJL89+mryaOKssR1T2c2LWdraVgyy8llmhRyfK4mxZUkG1l8sFGRXiA0+Y
 kLmvsRleHgSQzhI8dVHmqq0NtqZZkz9/azNOJEcfauC88gTglMzfUkQKww7jlI9w46bm
 mSHxqD8SYOuQX1DA/OnlOFwarGRLHw8ypmIOrQRtQfXhGfDzbAPnDnNj+AYiXSzFRSlo
 1FHYCqhPeCdv68Hin2exXRBZoqrEo/gnE6GS6P8/NWtDoKlzSrAv22EoUbaPGte4PvBd
 A+aESyrz5GY0wb2FcO/DM5a7DEpitMucii0sspCOQ2D4fq32dtKFs3MquHmslBEwh+cn
 9PYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXuI78AlHVKi46Fsaj+JV23q+XlkQCBz8Mxt2DcHndifBJbpaJ4g8tW3noNruKxmda4s758dA3bA==@nongnu.org
X-Gm-Message-State: AOJu0YywB9yVj+LsHEZwX2Krvv5ezPgEJ00Qn/lteRM/YvswAOAe65Nt
 CVnKJkhF49fQDFWiJlu/tmXq5uGA0iMWnHa8pUUI9EQgdwUXJG17XrLVwXWJWAVBIEMu+t6DNBF
 vbfEuPLANen+7SgJ07KFZf94QJmA=
X-Received: by 2002:a05:6830:498b:b0:708:b344:fed8 with SMTP id
 46e09a7af769-70e0ec2a5ddmr8696651a34.33.1724582722117; Sun, 25 Aug 2024
 03:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <CAFEAcA8J18z8WubfzLu-DmTp6vGwcy4D652ib-KReqNS0whMVA@mail.gmail.com>
 <CA+1FSiir=RG1BTKF29BKxmO+GWDieyW6TxzWtdEX-CYu7a+z5g@mail.gmail.com>
 <CA+1FSij3LJc9S2ChBY-pHZ8QacFt2P0ygsr9LRK9FXLyMJrorQ@mail.gmail.com>
 <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
In-Reply-To: <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Sun, 25 Aug 2024 12:44:44 +0200
Message-ID: <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm <qemu-arm@nongnu.org>,
 "cc: Sergey Kambalin" <sergey.kambalin@auriga.com>
Cc: qemu-discuss@nongnu.org
Content-Type: multipart/related; boundary="0000000000008b2e9306207fb4e0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=marietto2008@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SC6uQ0b8TeNj

--0000000000008b2e9306207fb4e0
Content-Type: multipart/alternative; boundary="0000000000008b2e9206207fb4df"

--0000000000008b2e9206207fb4df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please look at this example :

qemu-system-aarch64 \
-smp 4 \
-m 2048 \
-cpu cortex-a72 \
-machine virt \
-serial stdio \
-kernel
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/boot/Image
\

Minimal parameters,I'm just declaring only the kernel image. Nothing is
changed on the LOG,I see the same errors as before when I have used much
more parameters :

# ./start-virt5

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
[    0.000000] Kernel command line: console=3DttyAMA0,115200
kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rootwait
androidboot.serialno=3D10000000abcd1234
androidboot.btmacaddr=3D11:22:33:44:55:66
[    0.000000] Unknown kernel command line parameters
"kgdboc=3DttyAMA0,115200", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152
bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576
bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
516096
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap
free:off
[    0.000000] Memory: 2012668K/2097152K available (19328K kernel code,
2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 76292K reserved, 8192K
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
[    0.000071] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps every
4398046511096ns
[    0.003139] kfence: initialized - using 2097152 bytes for 255 objects at
0x(____ptrval____)-0x(____ptrval____)
[    0.009556] Calibrating delay loop (skipped), value calculated using
timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
[    0.009721] pid_max: default: 32768 minimum: 301
[    0.011333] LSM: initializing lsm=3Dcapability,selinux,integrity
[    0.011882] SELinux:  Initializing.
[    0.014953] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes,
linear)
[    0.015004] Mountpoint-cache hash table entries: 4096 (order: 3, 32768
bytes, linear)
[    0.028903] cgroup: Disabling memory control group subsystem
[    0.044127] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    0.055591] RCU Tasks: Setting shift to 2 and lim to 1
rcu_task_cb_adjust=3D1.
[    0.056195] RCU Tasks Rude: Setting shift to 2 and lim to 1
rcu_task_cb_adjust=3D1.
[    0.056413] RCU Tasks Trace: Setting shift to 2 and lim to 1
rcu_task_cb_adjust=3D1.
[    0.057942] rcu: Hierarchical SRCU implementation.
[    0.057978] rcu:     Max phase no-delay instances is 1000.
[    0.063709] EFI services will not be available.
[    0.066123] smp: Bringing up secondary CPUs ...
[    0.069475] Detected PIPT I-cache on CPU1
[    0.070497] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.075278] Detected PIPT I-cache on CPU2
[    0.075664] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
[    0.077315] Detected PIPT I-cache on CPU3
[    0.077701] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
[    0.078503] smp: Brought up 1 node, 4 CPUs
[    0.078535] SMP: Total of 4 processors activated.
[    0.078618] CPU features: detected: 32-bit EL0 Support
[    0.078639] CPU features: detected: 32-bit EL1 Support
[    0.078692] CPU features: detected: CRC32 instructions
[    0.082264] CPU features: emulated: Privileged Access Never (PAN) using
TTBR0_EL1 switching
[    0.082568] CPU: All CPU(s) started at EL1
[    0.082757] alternatives: applying system-wide alternatives
[    0.103246] devtmpfs: initialized
[    0.113968] Enabled cp15_barrier support
[    0.114152] Enabled setend support
[    0.115323] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.115525] futex hash table entries: 1024 (order: 4, 65536 bytes,
linear)
[    0.118633] pinctrl core: initialized pinctrl subsystem
[    0.125027] DMI not present or invalid.
[    0.133298] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.143477] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
allocations
[    0.143918] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic
allocations
[    0.144245] audit: initializing netlink subsys (disabled)
[    0.146479] audit: type=3D2000 audit(0.136:1): state=3Dinitialized
audit_enabled=3D0 res=3D1
[    0.149316] thermal_sys: Registered thermal governor 'step_wise'
[    0.150306] cpuidle: using governor menu
[    0.151238] hw-breakpoint: found 6 breakpoint and 4 watchpoint
registers.
[    0.152145] ASID allocator initialised with 32768 entries
[    0.153376] Serial: AMBA PL011 UART driver
[    0.179358] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13,
base_baud =3D 0) is a PL011 rev1
[    0.180892] printk: console [ttyAMA0] enabled
[    0.205877] Modules: 2G module region forced by
RANDOMIZE_MODULE_REGION_FULL
[    0.206071] Modules: 0 pages in range for non-PLT usage
[    0.206095] Modules: 516176 pages in range for PLT usage
[    0.224045] iommu: Default domain type: Translated
[    0.224267] iommu: DMA domain TLB invalidation policy: strict mode
[    0.226610] SCSI subsystem initialized
[    0.227852] usbcore: registered new interface driver usbfs
[    0.228223] usbcore: registered new interface driver hub
[    0.228569] usbcore: registered new device driver usb
[    0.229674] mc: Linux media interface: v0.10
[    0.230096] videodev: Linux video capture interface: v2.00
[    0.230911] pps_core: LinuxPPS API ver. 1 registered
[    0.231027] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    0.231314] PTP clock support registered
[    0.234098] Advanced Linux Sound Architecture Driver Initialized.
[    0.244169] Bluetooth: Core ver 2.22
[    0.244431] NET: Registered PF_BLUETOOTH protocol family
[    0.244548] Bluetooth: HCI device and connection manager initialized
[    0.244842] Bluetooth: HCI socket layer initialized
[    0.245020] Bluetooth: L2CAP socket layer initialized
[    0.245318] Bluetooth: SCO socket layer initialized
[    0.247459] vgaarb: loaded
[    0.249822] clocksource: Switched to clocksource arch_sys_counter
[    0.255768] VFS: Disk quotas dquot_6.6.0
[    0.256035] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
bytes)
[    0.257031] FS-Cache: Loaded
[    0.257688] CacheFiles: Loaded
[    0.261910] NET: Registered PF_INET protocol family
[    0.263464] IP idents hash table entries: 32768 (order: 6, 262144 bytes,
linear)
[    0.271657] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2,
16384 bytes, linear)
[    0.271957] Table-perturb hash table entries: 65536 (order: 6, 262144
bytes, linear)
[    0.272216] TCP established hash table entries: 16384 (order: 5, 131072
bytes, linear)
[    0.272749] TCP bind hash table entries: 16384 (order: 7, 524288 bytes,
linear)
[    0.273363] TCP: Hash tables configured (established 16384 bind 16384)
[    0.275787] MPTCP token hash table entries: 2048 (order: 3, 49152 bytes,
linear)
[    0.276240] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    0.276658] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes,
linear)
[    0.278798] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.287059] PCI: CLS 0 bytes, default 64
[    0.297697] kvm [1]: HYP mode not available
[    0.302345] Initialise system trusted keyrings
[    0.304248] workingset: timestamp_bits=3D46 max_order=3D19 bucket_order=
=3D0
[    0.304758] zbud: loaded
[    0.310976] Key type cifs.idmap registered
[    0.311491] fuse: init (API version 7.39)
[    0.351372] Key type asymmetric registered
[    0.351613] Asymmetric key parser 'x509' registered
[    0.351962] Block layer SCSI generic (bsg) driver version 0.4 loaded
(major 244)
[    0.352963] io scheduler mq-deadline registered
[    0.353128] io scheduler kyber registered
[    0.353437] io scheduler bfq registered
[    0.363898] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000
mem_size:0x00000000(0 MiB)
[    0.402259] brd: module loaded
[    0.418089] loop: module loaded
[    0.420241] Loading iSCSI transport class v2.0-870.
[    0.427196] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for
information.
[    0.427354] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <
Jason@zx2c4.com>. All Rights Reserved.
[    0.435022] tun: Universal TUN/TAP device driver, 1.6
[    0.437176] usbcore: registered new interface driver brcmfmac
[    0.437378] usbcore: registered new device driver r8152-cfgselector
[    0.437693] usbcore: registered new interface driver r8152
[    0.437903] usbcore: registered new interface driver lan78xx
[    0.438084] usbcore: registered new interface driver asix
[    0.438277] usbcore: registered new interface driver ax88179_178a
[    0.438486] usbcore: registered new interface driver cdc_ether
[    0.438681] usbcore: registered new interface driver smsc95xx
[    0.438863] usbcore: registered new interface driver net1080
[    0.439044] usbcore: registered new interface driver cdc_subset
[    0.439237] usbcore: registered new interface driver zaurus
[    0.439473] usbcore: registered new interface driver cdc_ncm
[    0.439662] usbcore: registered new interface driver r8153_ecm
[    0.440473] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
[    0.442573] usbcore: registered new interface driver cdc_acm
[    0.442696] cdc_acm: USB Abstract Control Model driver for USB modems
and ISDN adapters
[    0.443567] usbcore: registered new interface driver uas
[    0.443824] usbcore: registered new interface driver usb-storage
[    0.444306] usbcore: registered new interface driver cp210x
[    0.444659] usbserial: USB Serial support registered for cp210x
[    0.445019] usbcore: registered new interface driver pl2303
[    0.445175] usbserial: USB Serial support registered for pl2303
[    0.447976] mousedev: PS/2 mouse device common for all mice
[    0.448213] usbcore: registered new interface driver xpad
[    0.448388] usbcore: registered new interface driver usb_acecad
[    0.448592] usbcore: registered new interface driver aiptek
[    0.448788] usbcore: registered new interface driver hanwang
[    0.449127] usbcore: registered new interface driver kbtab
[    0.449589] usbcore: registered new interface driver usbtouchscreen
[    0.450511] i2c_dev: i2c /dev entries driver
[    0.453390] ir_imon_decoder: IR iMON protocol handler initialized
[    0.453604] IR JVC protocol handler initialized
[    0.453751] IR MCE Keyboard/mouse protocol handler initialized
[    0.453892] IR NEC protocol handler initialized
[    0.454010] IR RC5(x/sz) protocol handler initialized
[    0.454135] IR RC6 protocol handler initialized
[    0.454249] IR RCMM protocol handler initialized
[    0.454371] IR SANYO protocol handler initialized
[    0.454495] IR Sharp protocol handler initialized
[    0.454599] IR Sony protocol handler initialized
[    0.454718] IR XMP protocol handler initialized
[    0.455214] usbcore: registered new interface driver uvcvideo
[    0.456506] device-mapper: uevent: version 1.0.3
[    0.457363] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised:
dm-devel@redhat.com
[    0.460387] Bluetooth: HCI UART driver ver 2.3
[    0.460608] Bluetooth: HCI UART protocol H4 registered
[    0.460922] Bluetooth: HCI UART protocol Broadcom registered
[    0.462046] sdhci: Secure Digital Host Controller Interface driver
[    0.462168] sdhci: Copyright(c) Pierre Ossman
[    0.462522] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.463971] ledtrig-cpu: registered to indicate activity on CPUs
[    0.465818] hid: raw HID events driver (C) Jiri Kosina
[    0.472959] usbcore: registered new interface driver usbhid
[    0.473097] usbhid: USB HID core driver
[    0.475184] ashmem: initialized
[    0.476041] SPI driver st-accel-spi has no spi_device_id for
st,lis302dl-spi
[    0.476176] SPI driver st-accel-spi has no spi_device_id for
st,lis3lv02dl-accel
[    0.476309] SPI driver st-accel-spi has no spi_device_id for
st,lis3dh-accel
[    0.476450] SPI driver st-accel-spi has no spi_device_id for
st,lsm330d-accel
[    0.476590] SPI driver st-accel-spi has no spi_device_id for
st,lsm330dl-accel
[    0.476732] SPI driver st-accel-spi has no spi_device_id for
st,lsm330dlc-accel
[    0.476871] SPI driver st-accel-spi has no spi_device_id for
st,lis331dlh-accel
[    0.476998] SPI driver st-accel-spi has no spi_device_id for
st,lsm330-accel
[    0.477133] SPI driver st-accel-spi has no spi_device_id for
st,lsm303agr-accel
[    0.477269] SPI driver st-accel-spi has no spi_device_id for
st,lis2dh12-accel
[    0.477412] SPI driver st-accel-spi has no spi_device_id for
st,lng2dm-accel
[    0.477651] SPI driver st-accel-spi has no spi_device_id for
st,h3lis331dl-accel
[    0.477840] SPI driver st-accel-spi has no spi_device_id for
st,lis331dl-accel
[    0.477999] SPI driver st-accel-spi has no spi_device_id for
st,lsm303c-accel
[    0.478632] SPI driver st-magn-spi has no spi_device_id for
st,lis3mdl-magn
[    0.478764] SPI driver st-magn-spi has no spi_device_id for
st,lsm303agr-magn
[    0.478903] SPI driver st-magn-spi has no spi_device_id for
st,lsm9ds1-magn
[    0.479039] SPI driver st-magn-spi has no spi_device_id for
st,lsm303c-magn
[    0.482658] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
counters available
[    0.485716] usbcore: registered new interface driver snd-usb-audio
[    0.491439] Mirror/redirect action on
[    0.491810] netem: version 1.3
[    0.491899] u32 classifier
[    0.491958]     input device check on
[    0.492038]     Actions configured
[    0.498627] xt_time: kernel timezone is -0000
[    0.499003] gre: GRE over IPv4 demultiplexor driver
[    0.499124] IPv4 over IPsec tunneling driver
[    0.503052] Initializing XFRM netlink socket
[    0.503344] IPsec XFRM device driver
[    0.504136] NET: Registered PF_INET6 protocol family
[    0.513495] Segment Routing with IPv6
[    0.513876] In-situ OAM (IOAM) with IPv6
[    0.514776] mip6: Mobile IPv6
[    0.517513] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.520787] NET: Registered PF_PACKET protocol family
[    0.521015] NET: Registered PF_KEY protocol family
[    0.521228] Key type dns_resolver registered
[    0.575122] registered taskstats version 1
[    0.576644] Loading compiled-in X.509 certificates
[    0.601039] Key type .fscrypt registered
[    0.601162] Key type fscrypt-provisioning registered
[    0.607940] of_cfs_init
[    0.608331] of_cfs_init: OK
[    0.611621] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    0.639334] Loaded X.509 cert 'benh@debian.org:
577e021cb980e0e820821ba7b54b4961b8b4fadf'
[    0.640294] Loaded X.509 cert 'romain.perier@gmail.com:
3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
[    0.641075] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    0.641986] Loaded X.509 cert 'wens:
61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    0.647015] clk: Disabling unused clocks
[    0.647673] ALSA device list:
[    0.647835]   No soundcards found.
[    0.653451] uart-pl011 9000000.pl011: no DMA platform data
[    0.658240] Waiting for root device /dev/mmcblk0p2...
[   10.740382] platform gpio-keys: deferred probe pending

What does this mean ? That the kernel expects a different root device
than mmcblk0p2.
So,in my opinion,mmcblk0p2 is wrong.
How can I determine the correct name of the device to boot ?

On Sun, Aug 25, 2024 at 2:23=E2=80=AFAM Mario Marietto <marietto2008@gmail.=
com>
wrote:

> Sorry again,I was forgot to add  "root=3D/dev/xxxx"
>
> so :
>
> qemu-system-aarch64 \
>         -smp 4 \
>         -m 2048 \
>         -cpu cortex-a72 \
>         -M virt \
>         -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>         -display sdl,gl=3Don \
>         -device usb-ehci \
>         -device usb-kbd \
>         -device virtio-tablet-pci \
>         -usb \
>         -serial stdio \
>         -kernel
> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-r=
pi4-atv/boot/Image
> \
>         -initrd
> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-r=
pi4-atv/0.fat
> \
>         -drive
> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/lineag=
e-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/1.img
> \
>         -device virtio-blk-pci,drive=3Dsystem \
>         -drive
> index=3D1,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot2/zroot2/OS/Linux/lineag=
e-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/2.img
> \
>         -device virtio-blk-pci,drive=3Dvendor \
>         -drive
> index=3D2,if=3Dnone,id=3Duserdata,file=3D/mnt/zroot2/zroot2/OS/Linux/line=
age-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/3.img
> \
>         -device virtio-blk-pci,drive=3Duserdata \
>
> and I've added the parameter "/dev/vdd1"
>
>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdel=
ay=3D5
> androidboot.hardware=3Dranchu root=3D/dev/vdd1 androidboot.selinux=3Dperm=
issive
> security=3Dselinux selinux=3D1 androidboot.qemu.hw.mainkeys=3D0
> androidboot.lcd.density=3D160"
>
> and this is what happened :
>
> root@Z390-AORUS-PRO-DEST:/mnt/zroot2/zroot2/OS/Linux# ./start-virt5
>
> WARNING: Image format was not specified for
> '/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/1.img'
> an
> d probing guessed raw.
>         Automatically detecting the format is dangerous for raw images,
> write operations on block 0 will be restricted.
>         Specify the 'raw' format explicitly to remove the restrictions.
> WARNING: Image format was not specified for
> '/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/2.img'
> an
> d probing guessed raw.
>         Automatically detecting the format is dangerous for raw images,
> write operations on block 0 will be restricted.
>         Specify the 'raw' format explicitly to remove the restrictions.
> WARNING: Image format was not specified for
> '/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/3.img'
> an
> d probing guessed raw.
>         Automatically detecting the format is dangerous for raw images,
> write operations on block 0 will be restricted.
>         Specify the 'raw' format explicitly to remove the restrictions.
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> [    0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@build-host)
> (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928)
> clang version 18.0.0 (
> https://android.googlesource.com/toolchain/llvm-project
> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #
> 1 SMP PREEMPT Tue Jul  2 09:02:32 UTC 2024
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
> [    0.000000] Detected PIPT I-cache on CPU0
> [    0.000000] CPU features: detected: Spectre-v2
> [    0.000000] CPU features: detected: Spectre-v3a
> [    0.000000] CPU features: detected: Spectre-v4
> [    0.000000] CPU features: detected: Spectre-BHB
> [    0.000000] CPU features: kernel page table isolation forced ON by
> KASLR
> [    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
> [    0.000000] CPU features: detected: ARM erratum 1742098
> [    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or
> 1530923
> [    0.000000] alternatives: applying boot alternatives
> [    0.000000] Kernel command line: console=3DttyAMA0,38400 drm.debug=3D0=
x0
> rootwait rootdelay=3D5 androidboot.hardware=3Dranchu root=3D/dev/vdd1
> androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1
> androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160 androidboo=
t.seria
> lno=3D10000000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66
> [    0.000000] Unknown kernel command line parameters "selinux=3D1", will=
 be
> passed to user space.
> [    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576
> bytes, linear)
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
> 516096
> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap
> free:off
> [    0.000000] Memory: 1881596K/2097152K available (19328K kernel code,
> 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 207364K rese
> rved, 8192K cma-reserved)
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
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
> nr_cpu_ids=3D4
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
> [    0.003288] kfence: initialized - using 2097152 bytes for 255 objects
> at 0x(____ptrval____)-0x(____ptrval____)
> [    0.009736] Calibrating delay loop (skipped), value calculated using
> timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
> [    0.009901] pid_max: default: 32768 minimum: 301
> [    0.011751] LSM: initializing lsm=3Dcapability,selinux,integrity
> [    0.012149] SELinux:  Initializing.
> [    0.015241] Mount-cache hash table entries: 4096 (order: 3, 32768
> bytes, linear)
> [    0.015291] Mountpoint-cache hash table entries: 4096 (order: 3, 32768
> bytes, linear)
> [    0.029324] cgroup: Disabling memory control group subsystem
> [    0.046905] cacheinfo: Unable to detect cache hierarchy for CPU 0
> [    0.055879] RCU Tasks: Setting shift to 2 and lim to 1
> rcu_task_cb_adjust=3D1.
> [    0.057302] RCU Tasks Rude: Setting shift to 2 and lim to 1
> rcu_task_cb_adjust=3D1.
> [    0.057526] RCU Tasks Trace: Setting shift to 2 and lim to 1
> rcu_task_cb_adjust=3D1.
> [    0.058950] rcu: Hierarchical SRCU implementation.
> [    0.058985] rcu:     Max phase no-delay instances is 1000.
> [    0.064733] EFI services will not be available.
> [    0.066555] smp: Bringing up secondary CPUs ...
> [    0.070034] Detected PIPT I-cache on CPU1
> [    0.071060] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
> [    0.075718] Detected PIPT I-cache on CPU2
> [    0.076075] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
> [    0.078211] Detected PIPT I-cache on CPU3
> [    0.078636] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
> [    0.079116] smp: Brought up 1 node, 4 CPUs
> [    0.079163] SMP: Total of 4 processors activated.
> [    0.079251] CPU features: detected: 32-bit EL0 Support
> [    0.079271] CPU features: detected: 32-bit EL1 Support
> [    0.079324] CPU features: detected: CRC32 instructions
> [    0.083017] CPU features: emulated: Privileged Access Never (PAN) usin=
g
> TTBR0_EL1 switching
> [    0.083324] CPU: All CPU(s) started at EL1
> [    0.083510] alternatives: applying system-wide alternatives
> [    0.103839] devtmpfs: initialized
> [    0.114587] Enabled cp15_barrier support
> [    0.114791] Enabled setend support
> [    0.116261] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.116383] futex hash table entries: 1024 (order: 4, 65536 bytes,
> linear)
> [    0.119461] pinctrl core: initialized pinctrl subsystem
> [    0.125884] DMI not present or invalid.
> [    0.137528] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.147620] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
> allocations
> [    0.148124] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for
> atomic allocations
> [    0.148401] audit: initializing netlink subsys (disabled)
> [    0.150600] audit: type=3D2000 audit(0.140:1): state=3Dinitialized
> audit_enabled=3D0 res=3D1
> [    0.153487] thermal_sys: Registered thermal governor 'step_wise'
> [    0.153778] cpuidle: using governor menu
> [    0.154757] hw-breakpoint: found 6 breakpoint and 4 watchpoint
> registers.
> [    0.155610] ASID allocator initialised with 32768 entries
> [    0.156847] Serial: AMBA PL011 UART driver
> [    0.182586] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13,
> base_baud =3D 0) is a PL011 rev1
> [    0.184036] printk: console [ttyAMA0] enabled
> [    0.209695] Modules: 2G module region forced by
> RANDOMIZE_MODULE_REGION_FULL
> [    0.209894] Modules: 0 pages in range for non-PLT usage
> [    0.209917] Modules: 516176 pages in range for PLT usage
> [    0.254528] iommu: Default domain type: Translated
> [    0.254775] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.256959] SCSI subsystem initialized
> [    0.258135] usbcore: registered new interface driver usbfs
> [    0.258564] usbcore: registered new interface driver hub
> [    0.258829] usbcore: registered new device driver usb
> [    0.259862] mc: Linux media interface: v0.10
> [    0.260179] videodev: Linux video capture interface: v2.00
> [    0.260947] pps_core: LinuxPPS API ver. 1 registered
> [    0.261059] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o
> Giometti <giometti@linux.it>
> [    0.261325] PTP clock support registered
> [    0.267784] Advanced Linux Sound Architecture Driver Initialized.
> [    0.278021] Bluetooth: Core ver 2.22
> [    0.278284] NET: Registered PF_BLUETOOTH protocol family
> [    0.278491] Bluetooth: HCI device and connection manager initialized
> [    0.278832] Bluetooth: HCI socket layer initialized
> [    0.279154] Bluetooth: L2CAP socket layer initialized
> [    0.279509] Bluetooth: SCO socket layer initialized
> [    0.289357] vgaarb: loaded
> [    0.291652] clocksource: Switched to clocksource arch_sys_counter
> [    0.304601] VFS: Disk quotas dquot_6.6.0
> [    0.305286] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
> bytes)
> [    0.307149] FS-Cache: Loaded
> [    0.309071] CacheFiles: Loaded
> [    0.317193] NET: Registered PF_INET protocol family
> [    0.318660] IP idents hash table entries: 32768 (order: 6, 262144
> bytes, linear)
> [    0.326093] tcp_listen_portaddr_hash hash table entries: 1024 (order:
> 2, 16384 bytes, linear)
> [    0.326598] Table-perturb hash table entries: 65536 (order: 6, 262144
> bytes, linear)
> [    0.326875] TCP established hash table entries: 16384 (order: 5, 13107=
2
> bytes, linear)
> [    0.327916] TCP bind hash table entries: 16384 (order: 7, 524288 bytes=
,
> linear)
> [    0.328717] TCP: Hash tables configured (established 16384 bind 16384)
> [    0.330789] MPTCP token hash table entries: 2048 (order: 3, 49152
> bytes, linear)
> [    0.331272] UDP hash table entries: 1024 (order: 3, 32768 bytes,
> linear)
> [    0.331840] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes,
> linear)
> [    0.333529] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.336012] PCI: CLS 0 bytes, default 64
> [    0.340601] kvm [1]: HYP mode not available
> [    0.344033] Trying to unpack rootfs image as initramfs...
> [    0.344947] rootfs image is not initramfs (invalid magic at start of
> compressed archive); looks like an initrd
> [    0.351077] Initialise system trusted keyrings
> [    0.353062] workingset: timestamp_bits=3D46 max_order=3D19 bucket_orde=
r=3D0
> [    0.353682] zbud: loaded
> [    0.361534] Key type cifs.idmap registered
> [    0.362434] fuse: init (API version 7.39)
> [    0.398148] Key type asymmetric registered
> [    0.398433] Asymmetric key parser 'x509' registered
> [    0.398918] Block layer SCSI generic (bsg) driver version 0.4 loaded
> (major 244)
> [    0.400130] io scheduler mq-deadline registered
> [    0.400288] io scheduler kyber registered
> [    0.400649] io scheduler bfq registered
> [    0.416082] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000
> mem_size:0x00000000(0 MiB)
> [    0.477796] brd: module loaded
> [    0.516082] loop: module loaded
> [    0.519143] Loading iSCSI transport class v2.0-870.
> [    0.527568] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com
> for information.
> [    0.527819] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <
> Jason@zx2c4.com>. All Rights Reserved.
> [    0.538731] tun: Universal TUN/TAP device driver, 1.6
> [    0.541589] usbcore: registered new interface driver brcmfmac
> [    0.541866] usbcore: registered new device driver r8152-cfgselector
> [    0.542137] usbcore: registered new interface driver r8152
> [    0.542409] usbcore: registered new interface driver lan78xx
> [    0.542644] usbcore: registered new interface driver asix
> [    0.542883] usbcore: registered new interface driver ax88179_178a
> [    0.543185] usbcore: registered new interface driver cdc_ether
> [    0.543558] usbcore: registered new interface driver smsc95xx
> [    0.543784] usbcore: registered new interface driver net1080
> [    0.544049] usbcore: registered new interface driver cdc_subset
> [    0.544340] usbcore: registered new interface driver zaurus
> [    0.544632] usbcore: registered new interface driver cdc_ncm
> [    0.544909] usbcore: registered new interface driver r8153_ecm
> [    0.546053] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
> [    0.548482] usbcore: registered new interface driver cdc_acm
> [    0.548670] cdc_acm: USB Abstract Control Model driver for USB modems
> and ISDN adapters
> [    0.549653] usbcore: registered new interface driver uas
> [    0.550010] usbcore: registered new interface driver usb-storage
> [    0.550594] usbcore: registered new interface driver cp210x
> [    0.550995] usbserial: USB Serial support registered for cp210x
> [    0.551297] usbcore: registered new interface driver pl2303
> [    0.551740] usbserial: USB Serial support registered for pl2303
> [    0.554998] mousedev: PS/2 mouse device common for all mice
> [    0.555316] usbcore: registered new interface driver xpad
> [    0.555738] usbcore: registered new interface driver usb_acecad
> [    0.556054] usbcore: registered new interface driver aiptek
> [    0.556428] usbcore: registered new interface driver hanwang
> [    0.556701] usbcore: registered new interface driver kbtab
> [    0.557253] usbcore: registered new interface driver usbtouchscreen
> [    0.558607] i2c_dev: i2c /dev entries driver
> [    0.563208] ir_imon_decoder: IR iMON protocol handler initialized
> [    0.563376] IR JVC protocol handler initialized
> [    0.563702] IR MCE Keyboard/mouse protocol handler initialized
> [    0.563867] IR NEC protocol handler initialized
> [    0.564042] IR RC5(x/sz) protocol handler initialized
> [    0.564153] IR RC6 protocol handler initialized
> [    0.564261] IR RCMM protocol handler initialized
> [    0.564381] IR SANYO protocol handler initialized
> [    0.564544] IR Sharp protocol handler initialized
> [    0.564655] IR Sony protocol handler initialized
> [    0.564774] IR XMP protocol handler initialized
> [    0.565552] usbcore: registered new interface driver uvcvideo
> [    0.567197] device-mapper: uevent: version 1.0.3
> [    0.568668] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01)
> initialised: dm-devel@redhat.com
> [    0.570048] Bluetooth: HCI UART driver ver 2.3
> [    0.570243] Bluetooth: HCI UART protocol H4 registered
> [    0.570633] Bluetooth: HCI UART protocol Broadcom registered
> [    0.571948] sdhci: Secure Digital Host Controller Interface driver
> [    0.572068] sdhci: Copyright(c) Pierre Ossman
> [    0.572585] sdhci-pltfm: SDHCI platform and OF driver helper
> [    0.574315] ledtrig-cpu: registered to indicate activity on CPUs
> [    0.576835] hid: raw HID events driver (C) Jiri Kosina
> [    0.586764] usbcore: registered new interface driver usbhid
> [    0.586903] usbhid: USB HID core driver
> [    0.589619] ashmem: initialized
> [    0.590820] SPI driver st-accel-spi has no spi_device_id for
> st,lis302dl-spi
> [    0.590958] SPI driver st-accel-spi has no spi_device_id for
> st,lis3lv02dl-accel
> [    0.591087] SPI driver st-accel-spi has no spi_device_id for
> st,lis3dh-accel
> [    0.591215] SPI driver st-accel-spi has no spi_device_id for
> st,lsm330d-accel
> [    0.591369] SPI driver st-accel-spi has no spi_device_id for
> st,lsm330dl-accel
> [    0.591703] SPI driver st-accel-spi has no spi_device_id for
> st,lsm330dlc-accel
> [    0.591861] SPI driver st-accel-spi has no spi_device_id for
> st,lis331dlh-accel
> [    0.592008] SPI driver st-accel-spi has no spi_device_id for
> st,lsm330-accel
> [    0.592138] SPI driver st-accel-spi has no spi_device_id for
> st,lsm303agr-accel
> [    0.592291] SPI driver st-accel-spi has no spi_device_id for
> st,lis2dh12-accel
> [    0.592439] SPI driver st-accel-spi has no spi_device_id for
> st,lng2dm-accel
> [    0.592583] SPI driver st-accel-spi has no spi_device_id for
> st,h3lis331dl-accel
> [    0.592723] SPI driver st-accel-spi has no spi_device_id for
> st,lis331dl-accel
> [    0.592869] SPI driver st-accel-spi has no spi_device_id for
> st,lsm303c-accel
> [    0.593667] SPI driver st-magn-spi has no spi_device_id for
> st,lis3mdl-magn
> [    0.593802] SPI driver st-magn-spi has no spi_device_id for
> st,lsm303agr-magn
> [    0.593937] SPI driver st-magn-spi has no spi_device_id for
> st,lsm9ds1-magn
> [    0.594067] SPI driver st-magn-spi has no spi_device_id for
> st,lsm303c-magn
> [    0.598178] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
> counters available
> [    0.601694] usbcore: registered new interface driver snd-usb-audio
> [    0.608955] Mirror/redirect action on
> [    0.609389] netem: version 1.3
> [    0.609524] u32 classifier
> [    0.609579]     input device check on
> [    0.609655]     Actions configured
> [    0.616553] xt_time: kernel timezone is -0000
> [    0.616968] gre: GRE over IPv4 demultiplexor driver
> [    0.617157] IPv4 over IPsec tunneling driver
> [    0.621789] Initializing XFRM netlink socket
> [    0.622080] IPsec XFRM device driver
> [    0.622964] NET: Registered PF_INET6 protocol family
> [    0.632975] Segment Routing with IPv6
> [    0.633254] In-situ OAM (IOAM) with IPv6
> [    0.634281] mip6: Mobile IPv6
> [    0.637517] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    0.641524] NET: Registered PF_PACKET protocol family
> [    0.641880] NET: Registered PF_KEY protocol family
> [    0.642090] Key type dns_resolver registered
> [    0.723004] Freeing initrd memory: 131072K
> [    0.726147] registered taskstats version 1
> [    0.728209] Loading compiled-in X.509 certificates
> [    0.766647] Key type .fscrypt registered
> [    0.766772] Key type fscrypt-provisioning registered
> [    0.774312] of_cfs_init
> [    0.774711] of_cfs_init: OK
> [    0.778079] cfg80211: Loading compiled-in X.509 certificates for
> regulatory database
> [    0.804531] Loaded X.509 cert 'benh@debian.org:
> 577e021cb980e0e820821ba7b54b4961b8b4fadf'
> [    0.805402] Loaded X.509 cert 'romain.perier@gmail.com:
> 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
> [    0.806133] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [    0.806799] Loaded X.509 cert 'wens:
> 61c038651aabdcf94bd0ac7ff06c7248db18c600'
> [    0.812604] clk: Disabling unused clocks
> [    0.813045] ALSA device list:
> [    0.813166]   No soundcards found.
> [    0.819946] uart-pl011 9000000.pl011: no DMA platform data
> [    0.821300] Waiting 5 sec before mounting root device...
> [    5.905329] RAMDISK: Couldn't find valid RAM disk image starting at 0.
> [    5.906225] Waiting for root device /dev/vdd1...
> [   11.028260] platform gpio-keys: deferred probe pending
>
> it seems that the only error is produced by this argument : root=3D/dev/v=
dd1
>
> On Sun, Aug 25, 2024 at 1:59=E2=80=AFAM Mario Marietto <marietto2008@gmai=
l.com>
> wrote:
>
>> Sorry for the mistake,but the log reported on my previous email message
>> is produced from these parameters :
>>
>> qemu-system-aarch64 \
>>         -smp 4 \
>>         -m 2048 \
>>         -cpu cortex-a72 \
>>         -M virt \
>>         -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>>         -display sdl,gl=3Don \
>>         -device usb-ehci \
>>         -device usb-kbd \
>>         -device virtio-tablet-pci \
>>         -usb \
>>         -serial stdio \
>>         -kernel
>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/boot/Image
>> \
>>         -initrd
>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/0.fat
>> \
>>         -drive
>> index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/Linux/linea=
ge-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/1.img
>> \
>>         -device virtio-blk-pci,drive=3Dsystem \
>>         -drive
>> index=3D1,if=3Dnone,id=3Dvendor,file=3D/mnt/zroot2/zroot2/OS/Linux/linea=
ge-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/2.img
>> \
>>         -device virtio-blk-pci,drive=3Dvendor \
>>         -drive
>> index=3D2,if=3Dnone,id=3Duserdata,file=3D/mnt/zroot2/zroot2/OS/Linux/lin=
eage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/3.img
>> \
>>         -device virtio-blk-pci,drive=3Duserdata \
>>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootde=
lay=3D5
>> androidboot.hardware=3Dranchu androidboot.selinux=3Dpermissive security=
=3Dselinux
>> selinux=3D1 androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D1=
60"
>>
>> I've copied and pasted the wrong parameters,sorry.
>>
>> On Sun, Aug 25, 2024 at 1:54=E2=80=AFAM Mario Marietto <marietto2008@gma=
il.com>
>> wrote:
>>
>>> >So first up, this is as far as I know "uncharted territory"
>>> >in that I'm not aware of anybody who's booted full Android on
>>> >any (upstream) QEMU board model. (If there's anybody on-list
>>> >who *has* done this, please speak up!
>>>
>>> Me. On 2021,after several months of research,I've just been able to
>>> boot this version of Android :
>>>
>>>
>>> https://github.com/antmicro/kvm-aosp-jetson-nano
>>>
>>>
>>> on my jetson nano board using qemu / kvm configured like this :
>>>
>>>
>>> qemu-system-aarch64 \
>>>         -enable-kvm \
>>>         -smp 4 \
>>>         -m 2048 \
>>>         -cpu host \
>>>         -M virt \
>>>         -device virtio-gpu-pci,xres=3D1024,yres=3D768 \
>>>         -display sdl,gl=3Don \
>>>         -device usb-ehci \
>>>         -device usb-kbd \
>>>         -device virtio-tablet-pci \
>>>         -usb \
>>>         -serial stdio \
>>>         -kernel Image \
>>>         -initrd ramdisk.img \
>>>         -drive index=3D0,if=3Dnone,id=3Dsystem,file=3Dsystem-rw.img \
>>>         -device virtio-blk-pci,drive=3Dsystem \
>>>         -drive index=3D1,if=3Dnone,id=3Dvendor,file=3Dvendor-rw.img \
>>>         -device virtio-blk-pci,drive=3Dvendor \
>>>         -drive index=3D2,if=3Dnone,id=3Duserdata,file=3Duserdata.img \
>>>         -device virtio-blk-pci,drive=3Duserdata \
>>>         -append "console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait
>>> rootdelay=3D5 androidboot.hardware=3Dranchu androidboot.selinux=3Dpermi=
ssive
>>> security=3Dselinux selinux=3D1 androidboot.qemu.hw.mainkeys=3D0
>>> androidboot.lcd.density=3D160"
>>>
>>>
>>> here we go :
>>>
>>>
>>> [image: unnamed.jpg]
>>>
>>> So,I imagine that I should use the same parameters or closer parameters
>>> to those used on 2021,like the following ones :
>>>
>>>
>>> qemu-system-aarch64 \
>>>     -m 2048 \
>>>     -cpu cortex-a72 \
>>>     -M virt,gic-version=3D2 \
>>>     -drive
>>> if=3Dpflash,format=3Draw,file=3D/usr/local/share/qemu/edk2-aarch64-code=
.fd \
>>>     -drive
>>> if=3Dpflash,format=3Draw,file=3D/usr/local/share/qemu/edk2-arm-vars.fd =
\
>>>     -kernel
>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG=
-rpi4-atv/boot/Image
>>> \
>>>     -append 'console=3DttyAMA0,38400 keep_bootcon earlycon=3Dpl011,0x90=
00000
>>> androidboot.hardware=3Dranchu root=3D/dev/vdd1' \
>>>     -dtb
>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG=
-rpi4-atv/boot/bcm2711-rpi-4-b.dtb
>>> \
>>>     -drive
>>> file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Kon=
staKANG-rpi4-atv/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv.img,f=
ormat=3Draw,index=3D0,media=3Ddisk
>>> \
>>>     -device virtio-gpu-pci \
>>>     -device qemu-xhci \
>>>     -device usb-kbd \
>>>     -device usb-mouse \
>>>     -netdev user,id=3Dmynet \
>>>     -device virtio-net-pci,netdev=3Dmynet \
>>>     -serial stdio \
>>>     -no-reboot \
>>>     -d unimp,guest_errors \
>>>     -smp cores=3D4 \
>>>     -device qemu-xhci,id=3Dxhci,addr=3D0x5 \
>>>     -device usb-mouse,bus=3Dxhci.0 \
>>>     -device usb-kbd,bus=3Dxhci.0
>>>
>>> My impression is that they are more correct than the previous ones,what
>>> do you think ?
>>>
>>> root@Z390-AORUS-PRO-DEST:/mnt/zroot2/zroot2/OS/Linux# ./start-virt5
>>>
>>> WARNING: Image format was not specified for
>>> '/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/1.img'
>>> and probing guessed raw.
>>>         Automatically detecting the format is dangerous for raw images,
>>> write operations on block 0 will be restricted.
>>>         Specify the 'raw' format explicitly to remove the restrictions.
>>>
>>> WARNING: Image format was not specified for
>>> '/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/2.img'
>>> and probing guessed raw.
>>>         Automatically detecting the format is dangerous for raw images,
>>> write operations on block 0 will be restricted.
>>>         Specify the 'raw' format explicitly to remove the restrictions.
>>>
>>> WARNING: Image format was not specified for
>>> '/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/3.img'
>>> and probing guessed raw.
>>>         Automatically detecting the format is dangerous for raw images,
>>> write operations on block 0 will be restricted.
>>>         Specify the 'raw' format explicitly to remove the restrictions.
>>>
>>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
>>> [    0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@build-host)
>>> (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928)clang
>>> version 18.0.0 (https://android.googlesource.com/toolchain/llvm-project
>>> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #1 SMP PREEMPT T=
ue
>>> Jul  2 09:02:32 UTC 2024
>>> [    0.000000] KASLR enabled
>>> [    0.000000] random: crng init done
>>> [    0.000000] Machine model: linux,dummy-virt
>>> [    0.000000] efi: UEFI not found.
>>> [    0.000000] Zone ranges:
>>> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff]
>>> [    0.000000]   DMA32    empty
>>> [    0.000000]   Normal   empty
>>> [    0.000000] Movable zone start for each node
>>> [    0.000000] NoSplit zone start for each node
>>> [    0.000000] NoMerge zone start for each node
>>> [    0.000000] Early memory node ranges
>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
>>> [    0.000000] Initmem setup node 0 [mem
>>> 0x0000000040000000-0x00000000bfffffff]
>>> [    0.000000] cma: Reserved 8 MiB at 0x00000000bd000000 on node -1
>>> [    0.000000] psci: probing for conduit method from DT.
>>> [    0.000000] psci: PSCIv1.1 detected in firmware.
>>> [    0.000000] psci: Using standard PSCI v0.2 function IDs
>>> [    0.000000] psci: Trusted OS migration not required
>>> [    0.000000] psci: SMC Calling Convention v1.0
>>> [    0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d31768 u12697=
6
>>> [    0.000000] Detected PIPT I-cache on CPU0
>>> [    0.000000] CPU features: detected: Spectre-v2
>>> [    0.000000] CPU features: detected: Spectre-v3a
>>> [    0.000000] CPU features: detected: Spectre-v4
>>> [    0.000000] CPU features: detected: Spectre-BHB
>>> [    0.000000] CPU features: kernel page table isolation forced ON by
>>> KASLR
>>> [    0.000000] CPU features: detected: Kernel page table isolation
>>> (KPTI)
>>> [    0.000000] CPU features: detected: ARM erratum 1742098
>>> [    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or
>>> 1530923
>>> [    0.000000] alternatives: applying boot alternatives
>>> [    0.000000] Kernel command line: console=3DttyAMA0,38400 drm.debug=
=3D0x0
>>> rootwait rootdelay=3D5 androidboot.hardware=3Dranchu
>>> androidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1
>>> androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160
>>> androidboot.serialno=3D10000000abcd1234
>>> androidboot.btmacaddr=3D11:22:33:44:55:66
>>> [    0.000000] Unknown kernel command line parameters "selinux=3D1", wi=
ll
>>> be passed to user space.
>>> [    0.000000] Dentry cache hash table entries: 262144 (order: 9,
>>> 2097152 bytes, linear)
>>> [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 104857=
6
>>> bytes, linear)
>>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
>>> 516096
>>> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap
>>> free:off
>>> [    0.000000] Memory: 1881596K/2097152K available (19328K kernel code,
>>> 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 207364K reserved, 81=
92K
>>> cma-reserved)
>>> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
4,
>>> Nodes=3D1
>>> [    0.000000] ftrace: allocating 56269 entries in 220 pages
>>> [    0.000000] ftrace: allocated 220 pages with 5 groups
>>> [    0.000000] trace event string verifier disabled
>>> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>>> [    0.000000] rcu:     RCU event tracing is enabled.
>>> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to
>>> nr_cpu_ids=3D4.
>>> [    0.000000]  Trampoline variant of Tasks RCU enabled.
>>> [    0.000000]  Rude variant of Tasks RCU enabled.
>>> [    0.000000]  Tracing variant of Tasks RCU enabled.
>>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
>>> is 25 jiffies.
>>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
>>> nr_cpu_ids=3D4
>>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>>> [    0.000000] Root IRQ handler: gic_handle_irq
>>> [    0.000000] GICv2m: range[mem 0x08020000-0x08020fff], SPI[80:143]
>>> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
>>> contention.
>>> [    0.000000] arch_timer: cp15 timer(s) running at 62.50MHz (virt).
>>> [    0.000000] clocksource: arch_sys_counter: mask: 0x1ffffffffffffff
>>> max_cycles: 0x1cd42e208c, max_idle_ns: 881590405314 ns
>>> [    0.000069] sched_clock: 57 bits at 63MHz, resolution 16ns, wraps
>>> every 4398046511096ns
>>> [    0.003202] kfence: initialized - using 2097152 bytes for 255 object=
s
>>> at 0x(____ptrval____)-0x(____ptrval____)
>>> [    0.010267] Calibrating delay loop (skipped), value calculated using
>>> timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
>>> [    0.010436] pid_max: default: 32768 minimum: 301
>>> [    0.012350] LSM: initializing lsm=3Dcapability,selinux,integrity
>>> [    0.012758] SELinux:  Initializing.
>>> [    0.016675] Mount-cache hash table entries: 4096 (order: 3, 32768
>>> bytes, linear)
>>> [    0.016734] Mountpoint-cache hash table entries: 4096 (order: 3,
>>> 32768 bytes, linear)
>>> [    0.030817] cgroup: Disabling memory control group subsystem
>>> [    0.049765] cacheinfo: Unable to detect cache hierarchy for CPU 0
>>> [    0.060209] RCU Tasks: Setting shift to 2 and lim to 1
>>> rcu_task_cb_adjust=3D1.
>>> [    0.060803] RCU Tasks Rude: Setting shift to 2 and lim to 1
>>> rcu_task_cb_adjust=3D1.
>>> [    0.061039] RCU Tasks Trace: Setting shift to 2 and lim to 1
>>> rcu_task_cb_adjust=3D1.
>>> [    0.062716] rcu: Hierarchical SRCU implementation.
>>> [    0.062754] rcu:     Max phase no-delay instances is 1000.
>>> [    0.069399] EFI services will not be available.
>>> [    0.071153] smp: Bringing up secondary CPUs ...
>>> [    0.079351] Detected PIPT I-cache on CPU1
>>> [    0.080469] CPU1: Booted secondary processor 0x0000000001
>>> [0x410fd083]
>>> [    0.085912] Detected PIPT I-cache on CPU2
>>> [    0.086684] CPU2: Booted secondary processor 0x0000000002
>>> [0x410fd083]
>>> [    0.089073] Detected PIPT I-cache on CPU3
>>> [    0.089828] CPU3: Booted secondary processor 0x0000000003
>>> [0x410fd083]
>>> [    0.090326] smp: Brought up 1 node, 4 CPUs
>>> [    0.090357] SMP: Total of 4 processors activated.
>>> [    0.090450] CPU features: detected: 32-bit EL0 Support
>>> [    0.090471] CPU features: detected: 32-bit EL1 Support
>>> [    0.090527] CPU features: detected: CRC32 instructions
>>> [    0.094597] CPU features: emulated: Privileged Access Never (PAN)
>>> using TTBR0_EL1 switching
>>> [    0.094900] CPU: All CPU(s) started at EL1
>>> [    0.095086] alternatives: applying system-wide alternatives
>>> [    0.117729] devtmpfs: initialized
>>> [    0.128846] Enabled cp15_barrier support
>>> [    0.129028] Enabled setend support
>>> [    0.132524] clocksource: jiffies: mask: 0xffffffff max_cycles:
>>> 0xffffffff, max_idle_ns: 7645041785100000 ns
>>> [    0.132773] futex hash table entries: 1024 (order: 4, 65536 bytes,
>>> linear)
>>> [    0.136092] pinctrl core: initialized pinctrl subsystem
>>> [    0.142750] DMI not present or invalid.
>>> [    0.162991] NET: Registered PF_NETLINK/PF_ROUTE protocol family
>>> [    0.174108] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
>>> allocations
>>> [    0.175101] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for
>>> atomic allocations
>>> [    0.175422] audit: initializing netlink subsys (disabled)
>>> [    0.177740] audit: type=3D2000 audit(0.156:1): state=3Dinitialized
>>> audit_enabled=3D0 res=3D1
>>> [    0.180968] thermal_sys: Registered thermal governor 'step_wise'
>>> [    0.181282] cpuidle: using governor menu
>>> [    0.182303] hw-breakpoint: found 6 breakpoint and 4 watchpoint
>>> registers.
>>> [    0.183259] ASID allocator initialised with 32768 entries
>>> [    0.184629] Serial: AMBA PL011 UART driver
>>> [    0.211469] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 (irq =3D 13,
>>> base_baud =3D 0) is a PL011 rev1
>>> [    0.213104] printk: console [ttyAMA0] enabled
>>> [    0.238159] Modules: 2G module region forced by
>>> RANDOMIZE_MODULE_REGION_FULL
>>> [    0.238355] Modules: 0 pages in range for non-PLT usage
>>> [    0.238379] Modules: 516176 pages in range for PLT usage
>>> [    0.257283] iommu: Default domain type: Translated
>>> [    0.257533] iommu: DMA domain TLB invalidation policy: strict mode
>>> [    0.260201] SCSI subsystem initialized
>>> [    0.261520] usbcore: registered new interface driver usbfs
>>> [    0.261986] usbcore: registered new interface driver hub
>>> [    0.262329] usbcore: registered new device driver usb
>>> [    0.263464] mc: Linux media interface: v0.10
>>> [    0.263810] videodev: Linux video capture interface: v2.00
>>> [    0.264708] pps_core: LinuxPPS API ver. 1 registered
>>> [    0.264818] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
>>> Rodolfo Giometti <giometti@linux.it>
>>> [    0.265083] PTP clock support registered
>>> [    0.268294] Advanced Linux Sound Architecture Driver Initialized.
>>> [    0.280703] Bluetooth: Core ver 2.22
>>> [    0.281023] NET: Registered PF_BLUETOOTH protocol family
>>> [    0.281133] Bluetooth: HCI device and connection manager initialized
>>> [    0.281493] Bluetooth: HCI socket layer initialized
>>> [    0.281664] Bluetooth: L2CAP socket layer initialized
>>> [    0.281959] Bluetooth: SCO socket layer initialized
>>> [    0.284803] vgaarb: loaded
>>> [    0.287063] clocksource: Switched to clocksource arch_sys_counter
>>> [    0.291943] VFS: Disk quotas dquot_6.6.0
>>> [    0.292819] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
>>> bytes)
>>> [    0.294620] FS-Cache: Loaded
>>> [    0.297327] CacheFiles: Loaded
>>> [    0.306599] NET: Registered PF_INET protocol family
>>> [    0.311097] IP idents hash table entries: 32768 (order: 6, 262144
>>> bytes, linear)
>>> [    0.330285] tcp_listen_portaddr_hash hash table entries: 1024 (order=
:
>>> 2, 16384 bytes, linear)
>>> [    0.330900] Table-perturb hash table entries: 65536 (order: 6, 26214=
4
>>> bytes, linear)
>>> [    0.331678] TCP established hash table entries: 16384 (order: 5,
>>> 131072 bytes, linear)
>>> [    0.333233] TCP bind hash table entries: 16384 (order: 7, 524288
>>> bytes, linear)
>>> [    0.334433] TCP: Hash tables configured (established 16384 bind
>>> 16384)
>>> [    0.336757] MPTCP token hash table entries: 2048 (order: 3, 49152
>>> bytes, linear)
>>> [    0.337244] UDP hash table entries: 1024 (order: 3, 32768 bytes,
>>> linear)
>>> [    0.337671] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes=
,
>>> linear)
>>> [    0.339476] NET: Registered PF_UNIX/PF_LOCAL protocol family
>>> [    0.342269] PCI: CLS 0 bytes, default 64
>>> [    0.346671] Trying to unpack rootfs image as initramfs...
>>> [    0.348009] kvm [1]: HYP mode not available
>>> [    0.352285] rootfs image is not initramfs (invalid magic at start of
>>> compressed archive); looks like an initrd
>>> [    0.354672] Initialise system trusted keyrings
>>> [    0.360053] workingset: timestamp_bits=3D46 max_order=3D19 bucket_or=
der=3D0
>>> [    0.360812] zbud: loaded
>>> [    0.368584] Key type cifs.idmap registered
>>> [    0.369302] fuse: init (API version 7.39)
>>> [    0.420389] Key type asymmetric registered
>>> [    0.420653] Asymmetric key parser 'x509' registered
>>> [    0.421094] Block layer SCSI generic (bsg) driver version 0.4 loaded
>>> (major 244)
>>> [    0.422211] io scheduler mq-deadline registered
>>> [    0.422382] io scheduler kyber registered
>>> [    0.422760] io scheduler bfq registered
>>> [    0.440485] vc-mem: phys_addr:0x00000000 mem_base=3D0x00000000
>>> mem_size:0x00000000(0 MiB)
>>> [    0.513713] brd: module loaded
>>> [    0.543067] loop: module loaded
>>> [    0.546895] Loading iSCSI transport class v2.0-870.
>>> [    0.557492] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com
>>> for information.
>>> [    0.557673] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <
>>> Jason@zx2c4.com>. All Rights Reserved.
>>> [    0.571442] tun: Universal TUN/TAP device driver, 1.6
>>> [    0.575425] usbcore: registered new interface driver brcmfmac
>>> [    0.575658] usbcore: registered new device driver r8152-cfgselector
>>> [    0.575862] usbcore: registered new interface driver r8152
>>> [    0.576092] usbcore: registered new interface driver lan78xx
>>> [    0.576358] usbcore: registered new interface driver asix
>>> [    0.576574] usbcore: registered new interface driver ax88179_178a
>>> [    0.576804] usbcore: registered new interface driver cdc_ether
>>> [    0.577018] usbcore: registered new interface driver smsc95xx
>>> [    0.577259] usbcore: registered new interface driver net1080
>>> [    0.577463] usbcore: registered new interface driver cdc_subset
>>> [    0.577669] usbcore: registered new interface driver zaurus
>>> [    0.577908] usbcore: registered new interface driver cdc_ncm
>>> [    0.578128] usbcore: registered new interface driver r8153_ecm
>>> [    0.579387] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
>>> [    0.582601] usbcore: registered new interface driver cdc_acm
>>> [    0.582843] cdc_acm: USB Abstract Control Model driver for USB modem=
s
>>> and ISDN adapters
>>> [    0.583872] usbcore: registered new interface driver uas
>>> [    0.584212] usbcore: registered new interface driver usb-storage
>>> [    0.584797] usbcore: registered new interface driver cp210x
>>> [    0.585143] usbserial: USB Serial support registered for cp210x
>>> [    0.585439] usbcore: registered new interface driver pl2303
>>> [    0.585628] usbserial: USB Serial support registered for pl2303
>>> [    0.591320] mousedev: PS/2 mouse device common for all mice
>>> [    0.591580] usbcore: registered new interface driver xpad
>>> [    0.591790] usbcore: registered new interface driver usb_acecad
>>> [    0.592003] usbcore: registered new interface driver aiptek
>>> [    0.592267] usbcore: registered new interface driver hanwang
>>> [    0.592478] usbcore: registered new interface driver kbtab
>>> [    0.592943] usbcore: registered new interface driver usbtouchscreen
>>> [    0.596243] i2c_dev: i2c /dev entries driver
>>> [    0.599617] ir_imon_decoder: IR iMON protocol handler initialized
>>> [    0.599754] IR JVC protocol handler initialized
>>> [    0.599866] IR MCE Keyboard/mouse protocol handler initialized
>>> [    0.600007] IR NEC protocol handler initialized
>>> [    0.600119] IR RC5(x/sz) protocol handler initialized
>>> [    0.600277] IR RC6 protocol handler initialized
>>> [    0.600386] IR RCMM protocol handler initialized
>>> [    0.600537] IR SANYO protocol handler initialized
>>> [    0.600679] IR Sharp protocol handler initialized
>>> [    0.600828] IR Sony protocol handler initialized
>>> [    0.600970] IR XMP protocol handler initialized
>>> [    0.602445] usbcore: registered new interface driver uvcvideo
>>> [    0.604269] device-mapper: uevent: version 1.0.3
>>> [    0.605494] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01)
>>> initialised: dm-devel@redhat.com
>>> [    0.607202] Bluetooth: HCI UART driver ver 2.3
>>> [    0.607385] Bluetooth: HCI UART protocol H4 registered
>>> [    0.608478] Bluetooth: HCI UART protocol Broadcom registered
>>> [    0.609583] sdhci: Secure Digital Host Controller Interface driver
>>> [    0.609699] sdhci: Copyright(c) Pierre Ossman
>>> [    0.610073] sdhci-pltfm: SDHCI platform and OF driver helper
>>> [    0.611758] ledtrig-cpu: registered to indicate activity on CPUs
>>> [    0.615166] hid: raw HID events driver (C) Jiri Kosina
>>> [    0.625886] usbcore: registered new interface driver usbhid
>>> [    0.626055] usbhid: USB HID core driver
>>> [    0.629897] ashmem: initialized
>>> [    0.631207] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis302dl-spi
>>> [    0.631408] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis3lv02dl-accel
>>> [    0.631612] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis3dh-accel
>>> [    0.631804] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm330d-accel
>>> [    0.631999] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm330dl-accel
>>> [    0.632222] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm330dlc-accel
>>> [    0.632415] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis331dlh-accel
>>> [    0.632620] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm330-accel
>>> [    0.632804] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm303agr-accel
>>> [    0.632998] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis2dh12-accel
>>> [    0.633228] SPI driver st-accel-spi has no spi_device_id for
>>> st,lng2dm-accel
>>> [    0.633403] SPI driver st-accel-spi has no spi_device_id for
>>> st,h3lis331dl-accel
>>> [    0.633602] SPI driver st-accel-spi has no spi_device_id for
>>> st,lis331dl-accel
>>> [    0.633794] SPI driver st-accel-spi has no spi_device_id for
>>> st,lsm303c-accel
>>> [    0.638237] SPI driver st-magn-spi has no spi_device_id for
>>> st,lis3mdl-magn
>>> [    0.638436] SPI driver st-magn-spi has no spi_device_id for
>>> st,lsm303agr-magn
>>> [    0.638621] SPI driver st-magn-spi has no spi_device_id for
>>> st,lsm9ds1-magn
>>> [    0.638884] SPI driver st-magn-spi has no spi_device_id for
>>> st,lsm303c-magn
>>> [    0.656684] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
>>> counters available
>>> [    0.660735] usbcore: registered new interface driver snd-usb-audio
>>> [    0.668585] Mirror/redirect action on
>>> [    0.669031] netem: version 1.3
>>> [    0.669155] u32 classifier
>>> [    0.669252]     input device check on
>>> [    0.669365]     Actions configured
>>> [    0.679397] xt_time: kernel timezone is -0000
>>> [    0.679908] gre: GRE over IPv4 demultiplexor driver
>>> [    0.680074] IPv4 over IPsec tunneling driver
>>> [    0.684348] Initializing XFRM netlink socket
>>> [    0.684688] IPsec XFRM device driver
>>> [    0.685605] NET: Registered PF_INET6 protocol family
>>> [    0.697074] Segment Routing with IPv6
>>> [    0.697747] In-situ OAM (IOAM) with IPv6
>>> [    0.699188] mip6: Mobile IPv6
>>> [    0.702708] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
>>> [    0.707357] NET: Registered PF_PACKET protocol family
>>> [    0.707660] NET: Registered PF_KEY protocol family
>>> [    0.707937] Key type dns_resolver registered
>>> [    0.803914] registered taskstats version 1
>>> [    0.805916] Loading compiled-in X.509 certificates
>>> [    0.848609] Key type .fscrypt registered
>>> [    0.848773] Key type fscrypt-provisioning registered
>>> [    0.859321] of_cfs_init
>>> [    0.859798] of_cfs_init: OK
>>> [    0.863651] cfg80211: Loading compiled-in X.509 certificates for
>>> regulatory database
>>> [    0.916241] Freeing initrd memory: 131072K
>>> [    0.939884] Loaded X.509 cert 'benh@debian.org:
>>> 577e021cb980e0e820821ba7b54b4961b8b4fadf'
>>> [    0.940856] Loaded X.509 cert 'romain.perier@gmail.com:
>>> 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
>>> [    0.941666] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>>> [    0.942389] Loaded X.509 cert 'wens:
>>> 61c038651aabdcf94bd0ac7ff06c7248db18c600'
>>> [    0.947949] clk: Disabling unused clocks
>>> [    0.948468] ALSA device list:
>>> [    0.948637]   No soundcards found.
>>> [    0.956833] uart-pl011 9000000.pl011: no DMA platform data
>>> [    0.958235] Waiting 5 sec before mounting root device...
>>> [    6.141721] RAMDISK: Couldn't find valid RAM disk image starting at
>>> 0.
>>> [    6.143086] Waiting for root device ...
>>> [    6.145568] /dev/root: Can't open blockdev
>>> [    6.146341] VFS: Cannot open root device "" or unknown-block(0,0):
>>> error -6
>>> [    6.146477] Please append a correct "root=3D" boot option; here are =
the
>>> available partitions:
>>> [    6.146949] 0100            8192 ram0
>>> [    6.147047]  (driver?)
>>> [    6.147226] 0101            8192 ram1
>>> [    6.147239]  (driver?)
>>> [    6.147355] 0102            8192 ram2
>>> [    6.147366]  (driver?)
>>> [    6.147480] 0103            8192 ram3
>>> [    6.147491]  (driver?)
>>> [    6.147618] 0104            8192 ram4
>>> [    6.147629]  (driver?)
>>> [    6.147755] 0105            8192 ram5
>>> [    6.147765]  (driver?)
>>> [    6.147893] 0106            8192 ram6
>>> [    6.147903]  (driver?)
>>> [    6.148029] 0107            8192 ram7
>>> [    6.148040]  (driver?)
>>> [    6.148172] 0108            8192 ram8
>>> [    6.148182]  (driver?)
>>> [    6.148307] 0109            8192 ram9
>>> [    6.148317]  (driver?)
>>> [    6.148442] 010a            8192 ram10
>>> [    6.148452]  (driver?)
>>> [    6.148580] 010b            8192 ram11
>>> [    6.148590]  (driver?)
>>> [    6.148716] 010c            8192 ram12
>>> [    6.148726]  (driver?)
>>> [    6.148853] 010d            8192 ram13
>>> [    6.148863]  (driver?)
>>> [    6.148990] 010e            8192 ram14
>>> [    6.149001]  (driver?)
>>> [    6.149127] 010f            8192 ram15
>>> [    6.149140]  (driver?)
>>> [    6.149334] List of all bdev filesystems:
>>> [    6.149419]  ext3
>>> [    6.149443]  ext2
>>> [    6.149490]  ext4
>>> [    6.149535]  vfat
>>> [    6.149581]  msdos
>>> [    6.149617]  exfat
>>> [    6.149662]  fuseblk
>>> [    6.149707]  f2fs
>>> [    6.149765]
>>> [    6.149982] Kernel panic - not syncing: VFS: Unable to mount root fs
>>> on unknown-block(0,0)
>>> [    6.150325] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
>>> 6.6.36-g01aac93821d2-v8 #1
>>> [    6.150570] Hardware name: linux,dummy-virt (DT)
>>> [    6.150851] Call trace:
>>> [    6.150936]  dump_backtrace+0x104/0x124
>>> [    6.151104]  show_stack+0x28/0x38
>>> [    6.151193]  dump_stack_lvl+0x58/0x78
>>> [    6.151286]  dump_stack+0x20/0x30
>>> [    6.151367]  panic+0x148/0x35c
>>> [    6.151443]  mount_root_generic+0x2ac/0x2f0
>>> [    6.151544]  mount_block_root+0x60/0x78
>>> [    6.151637]  mount_root+0x84/0x98
>>> [    6.151718]  prepare_namespace+0x90/0xd4
>>> [    6.151811]  kernel_init_freeable+0xfc/0x14c
>>> [    6.151909]  kernel_init+0x30/0x1bc
>>> [    6.151994]  ret_from_fork+0x10/0x20
>>> [    6.152268] SMP: stopping secondary CPUs
>>> [    6.152632] Kernel Offset: 0x1cc3200000 from 0xffffffc080000000
>>> [    6.152773] PHYS_OFFSET: 0x40000000
>>> [    6.152869] CPU features: 0x000000,80000201,3c020000,0000421b
>>> [    6.153149] Memory Limit: none
>>> [    6.153518] Rebooting in 5 seconds..
>>>
>>>
>>>
>>> On Sat, Aug 24, 2024 at 10:36=E2=80=AFPM Peter Maydell <peter.maydell@l=
inaro.org>
>>> wrote:
>>>
>>>> On Sat, 24 Aug 2024 at 17:12, Mario Marietto <marietto2008@gmail.com>
>>>> wrote:
>>>> > I want to emulate Android 14 by KonstaKang using qemu-system-aarch64
>>>> and as model virt on Ubuntu 24.04 x64 bit installed on my PC (Intel I9=
 +
>>>> RTX 2080 ti).
>>>>
>>>>
>>>> So first up, this is as far as I know "uncharted territory"
>>>> in that I'm not aware of anybody who's booted full Android on
>>>> any (upstream) QEMU board model. (If there's anybody on-list
>>>> who *has* done this, please speak up!)
>>>>
>>>> It would be interesting to see if it can be done, but it is
>>>> I suspect unlikely to work "out of the box", especially more
>>>> complex stuff like accelerated graphics. You'll want to be
>>>> prepared to fiddle around, diagnose boot-failures, maybe
>>>> rebuild the kernel, etc.
>>>>
>>>> > I've chosen the parameters to boot it,according with the files
>>>> provided by that version of Android,that you can find here :
>>>> >
>>>> > https://konstakang.com/devices/rpi4/AOSP14/
>>>> >
>>>> > This is the command issued with the parameters embedded :
>>>>
>>>> I don't have any solid ideas, but:
>>>>
>>>> > qemu-system-aarch64 \
>>>> >     -m 2048 \
>>>> >     -cpu cortex-a72 \
>>>> >     -M virt,gic-version=3D2 \
>>>>
>>>> ^^ this says to QEMU "boot the 'virt' board"...
>>>>
>>>> >     -drive
>>>> if=3Dpflash,format=3Draw,file=3D/usr/local/share/qemu/edk2-aarch64-cod=
e.fd \
>>>> >     -drive
>>>> if=3Dpflash,format=3Draw,file=3D/usr/local/share/qemu/edk2-arm-vars.fd=
 \
>>>> >     -kernel
>>>> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKAN=
G-rpi4-atv/boot/Image
>>>> \
>>>> >     -append 'console=3DttyAMA0,38400 keep_bootcon
>>>> earlycon=3Dpl011,0x9000000 androidboot.hardware=3Dranchu root=3D/dev/v=
dd1' \
>>>>
>>>> ^^^ but this looks like it's saying to the kernel (or perhaps to
>>>> Android later boot) "you're booting on the 'ranchu' board".
>>>>
>>>> Is this image supposed to work on "virt" ?
>>>>
>>>> >     -drive
>>>> file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Ko=
nstaKANG-rpi4-atv/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv.img,=
format=3Draw,index=3D0,media=3Ddisk
>>>> \
>>>> >     -device virtio-gpu-pci \
>>>> >     -device qemu-xhci \
>>>> >     -device usb-kbd \
>>>> >     -device usb-mouse \
>>>> >     -netdev user,id=3Dmynet \
>>>> >     -device virtio-net-pci,netdev=3Dmynet \
>>>> >     -serial stdio \
>>>> >     -no-reboot \
>>>> >     -d guest_errors \
>>>> >     -smp cores=3D4 \
>>>> >     -device qemu-xhci,id=3Dxhci,addr=3D0x5 \
>>>> >     -device usb-mouse,bus=3Dxhci.0 \
>>>> >     -device usb-kbd,bus=3Dxhci.0
>>>> >
>>>> > Where did I found the kernel "Image" ? here :
>>>> >
>>>> > https://dlupload.com/filedetail/377203177
>>>> >
>>>> > This is the boot log :
>>>> >
>>>> > EFI stub: Booting Linux Kernel...
>>>> > EFI stub: EFI_RNG_PROTOCOL unavailable
>>>> > EFI stub: Generating empty DTB
>>>> > EFI stub: Exiting boot services...
>>>> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd08=
3]
>>>> > [    0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@build-ho=
st)
>>>> (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928) clang
>>>> version 18.0.0 (https://android.googlesource.com/toolchain/llvm-projec=
t
>>>> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #1 SMP PREEMPT =
Tue
>>>> Jul  2 09:02:32 UTC 2024
>>>> > [    0.000000] KASLR disabled due to lack of seed
>>>> > [    0.000000] printk: debug: skip boot console de-registration.
>>>> > [    0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (options ''=
)
>>>> > [    0.000000] printk: bootconsole [pl11] enabled
>>>> > [    0.000000] efi: EFI v2.7 by EDK II
>>>> > [    0.000000] efi: SMBIOS 3.0=3D0xbfed0000 MEMATTR=3D0xbd0a0018 ACP=
I
>>>> 2.0=3D0xbc6f0018 MEMRESERVE=3D0xbcb43f18
>>>> > [    0.000000] Zone ranges:
>>>> > [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff=
]
>>>> > [    0.000000]   DMA32    empty
>>>> > [    0.000000]   Normal   empty
>>>> > [    0.000000] Movable zone start for each node
>>>> > [    0.000000] NoSplit zone start for each node
>>>> > [    0.000000] NoMerge zone start for each node
>>>> > [    0.000000] Early memory node ranges
>>>> > [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bc76fff=
f]
>>>> > [    0.000000]   node   0: [mem 0x00000000bc770000-0x00000000bcb3fff=
f]
>>>> > [    0.000000]   node   0: [mem 0x00000000bcb40000-0x00000000bfe1fff=
f]
>>>> > [    0.000000]   node   0: [mem 0x00000000bfe20000-0x00000000bfeafff=
f]
>>>> > [    0.000000]   node   0: [mem 0x00000000bfeb0000-0x00000000bfebfff=
f]
>>>> > [    0.000000]   node   0: [mem 0x00000000bfec0000-0x00000000bffdfff=
f]
>>>> > [    0.000000]   node   0: [mem 0x00000000bffe0000-0x00000000bffffff=
f]
>>>> > [    0.000000] Initmem setup node 0 [mem
>>>> 0x0000000040000000-0x00000000bfffffff]
>>>> > [    0.000000] cma: Reserved 8 MiB at 0x00000000bbc00000 on node -1
>>>> > [    0.000000] Failed to find device node for boot cpu
>>>> > [    0.000000] missing boot CPU MPIDR, not enabling secondaries
>>>>
>>>> These error messages hint at a problem where the kernel is using the
>>>> device tree (which UEFI has said it's providing as "empty") rather
>>>> than the ACPI tables.
>>>>
>>>> > [    0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d31768
>>>> u126976
>>>> > [    0.000000] Detected PIPT I-cache on CPU0
>>>> > [    0.000000] CPU features: detected: Spectre-v2
>>>> > [    0.000000] CPU features: detected: Spectre-v3a
>>>> > [    0.000000] CPU features: detected: Spectre-v4
>>>> > [    0.000000] CPU features: detected: Spectre-BHB
>>>> > [    0.000000] CPU features: detected: ARM erratum 1742098
>>>> > [    0.000000] CPU features: detected: ARM errata 1165522, 1319367,
>>>> or 1530923
>>>> > [    0.000000] alternatives: applying boot alternatives
>>>> > [    0.000000] Kernel command line: console=3DttyAMA0,38400
>>>> keep_bootcon earlycon=3Dpl011,0x9000000 androidboot.hardware=3Dranchu
>>>> root=3D/dev/vdd1 androidboot.serialno=3D10000000abcd1234
>>>> androidboot.btmacaddr=3D11:22:33:44:55:66
>>>> > [    0.000000] Dentry cache hash table entries: 262144 (order: 9,
>>>> 2097152 bytes, linear)
>>>> > [    0.000000] Inode-cache hash table entries: 131072 (order: 8,
>>>> 1048576 bytes, linear)
>>>> > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages=
:
>>>> 516096
>>>> > [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap
>>>> free:off
>>>> > [    0.000000] Memory: 2008408K/2097152K available (19328K kernel
>>>> code, 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 80552K reserv=
ed,
>>>> 8192K cma-reserved)
>>>> > [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=
=3D1,
>>>> Nodes=3D1
>>>> > [    0.000000] ftrace: allocating 56269 entries in 220 pages
>>>> > [    0.000000] ftrace: allocated 220 pages with 5 groups
>>>> > [    0.000000] trace event string verifier disabled
>>>> > [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>>>> > [    0.000000] rcu:     RCU event tracing is enabled.
>>>> > [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to
>>>> nr_cpu_ids=3D1.
>>>> > [    0.000000]  Trampoline variant of Tasks RCU enabled.
>>>> > [    0.000000]  Rude variant of Tasks RCU enabled.
>>>> > [    0.000000]  Tracing variant of Tasks RCU enabled.
>>>> > [    0.000000] rcu: RCU calculated value of scheduler-enlistment
>>>> delay is 25 jiffies.
>>>> > [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
>>>> nr_cpu_ids=3D1
>>>> > [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>>>> > [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on
>>>> contention.
>>>> > [    0.000000] timer_probe: no matching timers found
>>>>
>>>> This one is also vaguely suggestive of a similar issue.
>>>>
>>>> Is the kernel expecting to be booted via UEFI ? Or does it
>>>> insist on a device tree? If the latter, try not using UEFI.
>>>>
>>>> More generally, if the kernel wasn't built to run on the "virt"
>>>> board you may find it is missing device drivers that the virt
>>>> board needs. You'll find the .config file for the kernel
>>>> helpful in diagnosing this, and you might need to rebuild
>>>> your own kernel.
>>>>
>>>> -- PMM
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

--0000000000008b2e9206207fb4df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please look at this example :</div><div><br></div><di=
v>qemu-system-aarch64 \=C2=A0</div><div>-smp 4 \=C2=A0</div><div>-m 2048 \=
=C2=A0</div><div>-cpu cortex-a72 \=C2=A0</div><div>-machine virt \=C2=A0</d=
iv><div>-serial stdio \=C2=A0</div><div>-kernel /mnt/zroot2/zroot2/OS/Linux=
/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \</div><di=
v><br></div><div>Minimal parameters,I&#39;m just declaring only the kernel =
image. Nothing is changed on the LOG,I see the same errors as before when I=
 have used much more parameters :</div><div><br></div><div><span style=3D"f=
ont-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(=
255,255,255)"># ./start-virt5=C2=A0</span></span></div><div><span style=3D"=
font-family:monospace"><br></span></div><div><span style=3D"font-family:mon=
ospace">[ =C2=A0=C2=A0=C2=A00.000000] Booting Linux on physical CPU 0x00000=
00000 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.000000] Linux version 6.6.36-g01aac93821d2-v8 (kl=
eaf@build-host) (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510=
928) clang version 18.0.0 (<a href=3D"https://android.googlesource.com/tool=
chain/llvm-project" target=3D"_blank">https://android.googlesource.com/tool=
chain/llvm-project</a> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.=
0) #1 SMP PREEMPT Tue Jul =C2=A02 09:02:32 UTC 2024
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
<br>[ =C2=A0=C2=A0=C2=A00.000000] Kernel command line: console=3DttyAMA0,11=
5200 kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rootwa=
it androidboot.serialno=3D10000000abcd1234 androidboot.btmacaddr=3D11:22:33=
:44:55:66
<br>[ =C2=A0=C2=A0=C2=A00.000000] Unknown kernel command line parameters &q=
uot;kgdboc=3DttyAMA0,115200&quot;, will be passed to user space.
<br>[ =C2=A0=C2=A0=C2=A00.000000] Dentry cache hash table entries: 262144 (=
order: 9, 2097152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Inode-cache hash table entries: 131072 (o=
rder: 8, 1048576 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Built 1 zonelists, mobility grouping on.=
=C2=A0 Total pages: 516096
<br>[ =C2=A0=C2=A0=C2=A00.000000] mem auto-init: stack:all(zero), heap allo=
c:off, heap free:off
<br>[ =C2=A0=C2=A0=C2=A00.000000] Memory: 2012668K/2097152K available (1932=
8K kernel code, 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 76292K r=
eserved, 8192K cma-reserved)
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
<br>[ =C2=A0=C2=A0=C2=A00.000071] sched_clock: 57 bits at 63MHz, resolution=
 16ns, wraps every 4398046511096ns
<br>[ =C2=A0=C2=A0=C2=A00.003139] kfence: initialized - using 2097152 bytes=
 for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
<br>[ =C2=A0=C2=A0=C2=A00.009556] Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
<br>[ =C2=A0=C2=A0=C2=A00.009721] pid_max: default: 32768 minimum: 301
<br>[ =C2=A0=C2=A0=C2=A00.011333] LSM: initializing lsm=3Dcapability,selinu=
x,integrity
<br>[ =C2=A0=C2=A0=C2=A00.011882] SELinux: =C2=A0Initializing.
<br>[ =C2=A0=C2=A0=C2=A00.014953] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.015004] Mountpoint-cache hash table entries: 4096=
 (order: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.028903] cgroup: Disabling memory control group su=
bsystem
<br>[ =C2=A0=C2=A0=C2=A00.044127] cacheinfo: Unable to detect cache hierarc=
hy for CPU 0
<br>[ =C2=A0=C2=A0=C2=A00.055591] RCU Tasks: Setting shift to 2 and lim to =
1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.056195] RCU Tasks Rude: Setting shift to 2 and li=
m to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.056413] RCU Tasks Trace: Setting shift to 2 and l=
im to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.057942] rcu: Hierarchical SRCU implementation.
<br>[ =C2=A0=C2=A0=C2=A00.057978] rcu: =C2=A0=C2=A0=C2=A0=C2=A0Max phase no=
-delay instances is 1000.
<br>[ =C2=A0=C2=A0=C2=A00.063709] EFI services will not be available.
<br>[ =C2=A0=C2=A0=C2=A00.066123] smp: Bringing up secondary CPUs ...
<br>[ =C2=A0=C2=A0=C2=A00.069475] Detected PIPT I-cache on CPU1
<br>[ =C2=A0=C2=A0=C2=A00.070497] CPU1: Booted secondary processor 0x000000=
0001 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.075278] Detected PIPT I-cache on CPU2
<br>[ =C2=A0=C2=A0=C2=A00.075664] CPU2: Booted secondary processor 0x000000=
0002 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.077315] Detected PIPT I-cache on CPU3
<br>[ =C2=A0=C2=A0=C2=A00.077701] CPU3: Booted secondary processor 0x000000=
0003 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.078503] smp: Brought up 1 node, 4 CPUs
<br>[ =C2=A0=C2=A0=C2=A00.078535] SMP: Total of 4 processors activated.
<br>[ =C2=A0=C2=A0=C2=A00.078618] CPU features: detected: 32-bit EL0 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.078639] CPU features: detected: 32-bit EL1 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.078692] CPU features: detected: CRC32 instruction=
s
<br>[ =C2=A0=C2=A0=C2=A00.082264] CPU features: emulated: Privileged Access=
 Never (PAN) using TTBR0_EL1 switching
<br>[ =C2=A0=C2=A0=C2=A00.082568] CPU: All CPU(s) started at EL1
<br>[ =C2=A0=C2=A0=C2=A00.082757] alternatives: applying system-wide altern=
atives
<br>[ =C2=A0=C2=A0=C2=A00.103246] devtmpfs: initialized
<br>[ =C2=A0=C2=A0=C2=A00.113968] Enabled cp15_barrier support
<br>[ =C2=A0=C2=A0=C2=A00.114152] Enabled setend support
<br>[ =C2=A0=C2=A0=C2=A00.115323] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
<br>[ =C2=A0=C2=A0=C2=A00.115525] futex hash table entries: 1024 (order: 4,=
 65536 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.118633] pinctrl core: initialized pinctrl subsyst=
em
<br>[ =C2=A0=C2=A0=C2=A00.125027] DMI not present or invalid.
<br>[ =C2=A0=C2=A0=C2=A00.133298] NET: Registered PF_NETLINK/PF_ROUTE proto=
col family
<br>[ =C2=A0=C2=A0=C2=A00.143477] DMA: preallocated 256 KiB GFP_KERNEL pool=
 for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.143918] DMA: preallocated 256 KiB GFP_KERNEL|GFP_=
DMA pool for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.144245] audit: initializing netlink subsys (disab=
led)
<br>[ =C2=A0=C2=A0=C2=A00.146479] audit: type=3D2000 audit(0.136:1): state=
=3Dinitialized audit_enabled=3D0 res=3D1
<br>[ =C2=A0=C2=A0=C2=A00.149316] thermal_sys: Registered thermal governor =
&#39;step_wise&#39;
<br>[ =C2=A0=C2=A0=C2=A00.150306] cpuidle: using governor menu
<br>[ =C2=A0=C2=A0=C2=A00.151238] hw-breakpoint: found 6 breakpoint and 4 w=
atchpoint registers.
<br>[ =C2=A0=C2=A0=C2=A00.152145] ASID allocator initialised with 32768 ent=
ries
<br>[ =C2=A0=C2=A0=C2=A00.153376] Serial: AMBA PL011 UART driver
<br>[ =C2=A0=C2=A0=C2=A00.179358] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 =
(irq =3D 13, base_baud =3D 0) is a PL011 rev1
<br>[ =C2=A0=C2=A0=C2=A00.180892] printk: console [ttyAMA0] enabled
<br>[ =C2=A0=C2=A0=C2=A00.205877] Modules: 2G module region forced by RANDO=
MIZE_MODULE_REGION_FULL
<br>[ =C2=A0=C2=A0=C2=A00.206071] Modules: 0 pages in range for non-PLT usa=
ge
<br>[ =C2=A0=C2=A0=C2=A00.206095] Modules: 516176 pages in range for PLT us=
age
<br>[ =C2=A0=C2=A0=C2=A00.224045] iommu: Default domain type: Translated
<br>[ =C2=A0=C2=A0=C2=A00.224267] iommu: DMA domain TLB invalidation policy=
: strict mode
<br>[ =C2=A0=C2=A0=C2=A00.226610] SCSI subsystem initialized
<br>[ =C2=A0=C2=A0=C2=A00.227852] usbcore: registered new interface driver =
usbfs
<br>[ =C2=A0=C2=A0=C2=A00.228223] usbcore: registered new interface driver =
hub
<br>[ =C2=A0=C2=A0=C2=A00.228569] usbcore: registered new device driver usb
<br>[ =C2=A0=C2=A0=C2=A00.229674] mc: Linux media interface: v0.10
<br>[ =C2=A0=C2=A0=C2=A00.230096] videodev: Linux video capture interface: =
v2.00
<br>[ =C2=A0=C2=A0=C2=A00.230911] pps_core: LinuxPPS API ver. 1 registered
<br>[ =C2=A0=C2=A0=C2=A00.231027] pps_core: Software ver. 5.3.6 - Copyright=
 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it" target=
=3D"_blank">giometti@linux.it</a>&gt;
<br>[ =C2=A0=C2=A0=C2=A00.231314] PTP clock support registered
<br>[ =C2=A0=C2=A0=C2=A00.234098] Advanced Linux Sound Architecture Driver =
Initialized.
<br>[ =C2=A0=C2=A0=C2=A00.244169] Bluetooth: Core ver 2.22
<br>[ =C2=A0=C2=A0=C2=A00.244431] NET: Registered PF_BLUETOOTH protocol fam=
ily
<br>[ =C2=A0=C2=A0=C2=A00.244548] Bluetooth: HCI device and connection mana=
ger initialized
<br>[ =C2=A0=C2=A0=C2=A00.244842] Bluetooth: HCI socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.245020] Bluetooth: L2CAP socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.245318] Bluetooth: SCO socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.247459] vgaarb: loaded
<br>[ =C2=A0=C2=A0=C2=A00.249822] clocksource: Switched to clocksource arch=
_sys_counter
<br>[ =C2=A0=C2=A0=C2=A00.255768] VFS: Disk quotas dquot_6.6.0
<br>[ =C2=A0=C2=A0=C2=A00.256035] VFS: Dquot-cache hash table entries: 512 =
(order 0, 4096 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.257031] FS-Cache: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.257688] CacheFiles: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.261910] NET: Registered PF_INET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.263464] IP idents hash table entries: 32768 (orde=
r: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.271657] tcp_listen_portaddr_hash hash table entri=
es: 1024 (order: 2, 16384 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.271957] Table-perturb hash table entries: 65536 (=
order: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.272216] TCP established hash table entries: 16384=
 (order: 5, 131072 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.272749] TCP bind hash table entries: 16384 (order=
: 7, 524288 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.273363] TCP: Hash tables configured (established =
16384 bind 16384)
<br>[ =C2=A0=C2=A0=C2=A00.275787] MPTCP token hash table entries: 2048 (ord=
er: 3, 49152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.276240] UDP hash table entries: 1024 (order: 3, 3=
2768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.276658] UDP-Lite hash table entries: 1024 (order:=
 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.278798] NET: Registered PF_UNIX/PF_LOCAL protocol=
 family
<br>[ =C2=A0=C2=A0=C2=A00.287059] PCI: CLS 0 bytes, default 64
<br>[ =C2=A0=C2=A0=C2=A00.297697] kvm [1]: HYP mode not available
<br>[ =C2=A0=C2=A0=C2=A00.302345] Initialise system trusted keyrings
<br>[ =C2=A0=C2=A0=C2=A00.304248] workingset: timestamp_bits=3D46 max_order=
=3D19 bucket_order=3D0
<br>[ =C2=A0=C2=A0=C2=A00.304758] zbud: loaded
<br>[ =C2=A0=C2=A0=C2=A00.310976] Key type cifs.idmap registered
<br>[ =C2=A0=C2=A0=C2=A00.311491] fuse: init (API version 7.39)
<br>[ =C2=A0=C2=A0=C2=A00.351372] Key type asymmetric registered
<br>[ =C2=A0=C2=A0=C2=A00.351613] Asymmetric key parser &#39;x509&#39; regi=
stered
<br>[ =C2=A0=C2=A0=C2=A00.351962] Block layer SCSI generic (bsg) driver ver=
sion 0.4 loaded (major 244)
<br>[ =C2=A0=C2=A0=C2=A00.352963] io scheduler mq-deadline registered
<br>[ =C2=A0=C2=A0=C2=A00.353128] io scheduler kyber registered
<br>[ =C2=A0=C2=A0=C2=A00.353437] io scheduler bfq registered
<br>[ =C2=A0=C2=A0=C2=A00.363898] vc-mem: phys_addr:0x00000000 mem_base=3D0=
x00000000 mem_size:0x00000000(0 MiB)
<br>[ =C2=A0=C2=A0=C2=A00.402259] brd: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.418089] loop: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.420241] Loading iSCSI transport class v2.0-870.
<br>[ =C2=A0=C2=A0=C2=A00.427196] wireguard: WireGuard 1.0.0 loaded. See <a=
 href=3D"http://www.wireguard.com" target=3D"_blank">www.wireguard.com</a> =
for information.
<br>[ =C2=A0=C2=A0=C2=A00.427354] wireguard: Copyright (C) 2015-2019 Jason =
A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason=
@zx2c4.com</a>&gt;. All Rights Reserved.
<br>[ =C2=A0=C2=A0=C2=A00.435022] tun: Universal TUN/TAP device driver, 1.6
<br>[ =C2=A0=C2=A0=C2=A00.437176] usbcore: registered new interface driver =
brcmfmac
<br>[ =C2=A0=C2=A0=C2=A00.437378] usbcore: registered new device driver r81=
52-cfgselector
<br>[ =C2=A0=C2=A0=C2=A00.437693] usbcore: registered new interface driver =
r8152
<br>[ =C2=A0=C2=A0=C2=A00.437903] usbcore: registered new interface driver =
lan78xx
<br>[ =C2=A0=C2=A0=C2=A00.438084] usbcore: registered new interface driver =
asix
<br>[ =C2=A0=C2=A0=C2=A00.438277] usbcore: registered new interface driver =
ax88179_178a
<br>[ =C2=A0=C2=A0=C2=A00.438486] usbcore: registered new interface driver =
cdc_ether
<br>[ =C2=A0=C2=A0=C2=A00.438681] usbcore: registered new interface driver =
smsc95xx
<br>[ =C2=A0=C2=A0=C2=A00.438863] usbcore: registered new interface driver =
net1080
<br>[ =C2=A0=C2=A0=C2=A00.439044] usbcore: registered new interface driver =
cdc_subset
<br>[ =C2=A0=C2=A0=C2=A00.439237] usbcore: registered new interface driver =
zaurus
<br>[ =C2=A0=C2=A0=C2=A00.439473] usbcore: registered new interface driver =
cdc_ncm
<br>[ =C2=A0=C2=A0=C2=A00.439662] usbcore: registered new interface driver =
r8153_ecm
<br>[ =C2=A0=C2=A0=C2=A00.440473] dwc_otg: version 3.00a 10-AUG-2012 (platf=
orm bus)
<br>[ =C2=A0=C2=A0=C2=A00.442573] usbcore: registered new interface driver =
cdc_acm
<br>[ =C2=A0=C2=A0=C2=A00.442696] cdc_acm: USB Abstract Control Model drive=
r for USB modems and ISDN adapters
<br>[ =C2=A0=C2=A0=C2=A00.443567] usbcore: registered new interface driver =
uas
<br>[ =C2=A0=C2=A0=C2=A00.443824] usbcore: registered new interface driver =
usb-storage
<br>[ =C2=A0=C2=A0=C2=A00.444306] usbcore: registered new interface driver =
cp210x
<br>[ =C2=A0=C2=A0=C2=A00.444659] usbserial: USB Serial support registered =
for cp210x
<br>[ =C2=A0=C2=A0=C2=A00.445019] usbcore: registered new interface driver =
pl2303
<br>[ =C2=A0=C2=A0=C2=A00.445175] usbserial: USB Serial support registered =
for pl2303
<br>[ =C2=A0=C2=A0=C2=A00.447976] mousedev: PS/2 mouse device common for al=
l mice
<br>[ =C2=A0=C2=A0=C2=A00.448213] usbcore: registered new interface driver =
xpad
<br>[ =C2=A0=C2=A0=C2=A00.448388] usbcore: registered new interface driver =
usb_acecad
<br>[ =C2=A0=C2=A0=C2=A00.448592] usbcore: registered new interface driver =
aiptek
<br>[ =C2=A0=C2=A0=C2=A00.448788] usbcore: registered new interface driver =
hanwang
<br>[ =C2=A0=C2=A0=C2=A00.449127] usbcore: registered new interface driver =
kbtab
<br>[ =C2=A0=C2=A0=C2=A00.449589] usbcore: registered new interface driver =
usbtouchscreen
<br>[ =C2=A0=C2=A0=C2=A00.450511] i2c_dev: i2c /dev entries driver
<br>[ =C2=A0=C2=A0=C2=A00.453390] ir_imon_decoder: IR iMON protocol handler=
 initialized
<br>[ =C2=A0=C2=A0=C2=A00.453604] IR JVC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.453751] IR MCE Keyboard/mouse protocol handler in=
itialized
<br>[ =C2=A0=C2=A0=C2=A00.453892] IR NEC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.454010] IR RC5(x/sz) protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.454135] IR RC6 protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.454249] IR RCMM protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.454371] IR SANYO protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.454495] IR Sharp protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.454599] IR Sony protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.454718] IR XMP protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.455214] usbcore: registered new interface driver =
uvcvideo
<br>[ =C2=A0=C2=A0=C2=A00.456506] device-mapper: uevent: version 1.0.3
<br>[ =C2=A0=C2=A0=C2=A00.457363] device-mapper: ioctl: 4.48.0-ioctl (2023-=
03-01) initialised: <a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank=
">dm-devel@redhat.com</a>
<br>[ =C2=A0=C2=A0=C2=A00.460387] Bluetooth: HCI UART driver ver 2.3
<br>[ =C2=A0=C2=A0=C2=A00.460608] Bluetooth: HCI UART protocol H4 registere=
d
<br>[ =C2=A0=C2=A0=C2=A00.460922] Bluetooth: HCI UART protocol Broadcom reg=
istered
<br>[ =C2=A0=C2=A0=C2=A00.462046] sdhci: Secure Digital Host Controller Int=
erface driver
<br>[ =C2=A0=C2=A0=C2=A00.462168] sdhci: Copyright(c) Pierre Ossman
<br>[ =C2=A0=C2=A0=C2=A00.462522] sdhci-pltfm: SDHCI platform and OF driver=
 helper
<br>[ =C2=A0=C2=A0=C2=A00.463971] ledtrig-cpu: registered to indicate activ=
ity on CPUs
<br>[ =C2=A0=C2=A0=C2=A00.465818] hid: raw HID events driver (C) Jiri Kosin=
a
<br>[ =C2=A0=C2=A0=C2=A00.472959] usbcore: registered new interface driver =
usbhid
<br>[ =C2=A0=C2=A0=C2=A00.473097] usbhid: USB HID core driver
<br>[ =C2=A0=C2=A0=C2=A00.475184] ashmem: initialized
<br>[ =C2=A0=C2=A0=C2=A00.476041] SPI driver st-accel-spi has no spi_device=
_id for st,lis302dl-spi
<br>[ =C2=A0=C2=A0=C2=A00.476176] SPI driver st-accel-spi has no spi_device=
_id for st,lis3lv02dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.476309] SPI driver st-accel-spi has no spi_device=
_id for st,lis3dh-accel
<br>[ =C2=A0=C2=A0=C2=A00.476450] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330d-accel
<br>[ =C2=A0=C2=A0=C2=A00.476590] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.476732] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dlc-accel
<br>[ =C2=A0=C2=A0=C2=A00.476871] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dlh-accel
<br>[ =C2=A0=C2=A0=C2=A00.476998] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330-accel
<br>[ =C2=A0=C2=A0=C2=A00.477133] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303agr-accel
<br>[ =C2=A0=C2=A0=C2=A00.477269] SPI driver st-accel-spi has no spi_device=
_id for st,lis2dh12-accel
<br>[ =C2=A0=C2=A0=C2=A00.477412] SPI driver st-accel-spi has no spi_device=
_id for st,lng2dm-accel
<br>[ =C2=A0=C2=A0=C2=A00.477651] SPI driver st-accel-spi has no spi_device=
_id for st,h3lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.477840] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.477999] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303c-accel
<br>[ =C2=A0=C2=A0=C2=A00.478632] SPI driver st-magn-spi has no spi_device_=
id for st,lis3mdl-magn
<br>[ =C2=A0=C2=A0=C2=A00.478764] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303agr-magn
<br>[ =C2=A0=C2=A0=C2=A00.478903] SPI driver st-magn-spi has no spi_device_=
id for st,lsm9ds1-magn
<br>[ =C2=A0=C2=A0=C2=A00.479039] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303c-magn
<br>[ =C2=A0=C2=A0=C2=A00.482658] hw perfevents: enabled with armv8_pmuv3 P=
MU driver, 7 counters available
<br>[ =C2=A0=C2=A0=C2=A00.485716] usbcore: registered new interface driver =
snd-usb-audio
<br>[ =C2=A0=C2=A0=C2=A00.491439] Mirror/redirect action on
<br>[ =C2=A0=C2=A0=C2=A00.491810] netem: version 1.3
<br>[ =C2=A0=C2=A0=C2=A00.491899] u32 classifier
<br>[ =C2=A0=C2=A0=C2=A00.491958] =C2=A0=C2=A0=C2=A0=C2=A0input device chec=
k on
<br>[ =C2=A0=C2=A0=C2=A00.492038] =C2=A0=C2=A0=C2=A0=C2=A0Actions configure=
d
<br>[ =C2=A0=C2=A0=C2=A00.498627] xt_time: kernel timezone is -0000
<br>[ =C2=A0=C2=A0=C2=A00.499003] gre: GRE over IPv4 demultiplexor driver
<br>[ =C2=A0=C2=A0=C2=A00.499124] IPv4 over IPsec tunneling driver
<br>[ =C2=A0=C2=A0=C2=A00.503052] Initializing XFRM netlink socket
<br>[ =C2=A0=C2=A0=C2=A00.503344] IPsec XFRM device driver
<br>[ =C2=A0=C2=A0=C2=A00.504136] NET: Registered PF_INET6 protocol family
<br>[ =C2=A0=C2=A0=C2=A00.513495] Segment Routing with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.513876] In-situ OAM (IOAM) with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.514776] mip6: Mobile IPv6
<br>[ =C2=A0=C2=A0=C2=A00.517513] sit: IPv6, IPv4 and MPLS over IPv4 tunnel=
ing driver
<br>[ =C2=A0=C2=A0=C2=A00.520787] NET: Registered PF_PACKET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.521015] NET: Registered PF_KEY protocol family
<br>[ =C2=A0=C2=A0=C2=A00.521228] Key type dns_resolver registered
<br>[ =C2=A0=C2=A0=C2=A00.575122] registered taskstats version 1
<br>[ =C2=A0=C2=A0=C2=A00.576644] Loading compiled-in X.509 certificates
<br>[ =C2=A0=C2=A0=C2=A00.601039] Key type .fscrypt registered
<br>[ =C2=A0=C2=A0=C2=A00.601162] Key type fscrypt-provisioning registered
<br>[ =C2=A0=C2=A0=C2=A00.607940] of_cfs_init
<br>[ =C2=A0=C2=A0=C2=A00.608331] of_cfs_init: OK
<br>[ =C2=A0=C2=A0=C2=A00.611621] cfg80211: Loading compiled-in X.509 certi=
ficates for regulatory database
<br>[ =C2=A0=C2=A0=C2=A00.639334] Loaded X.509 cert &#39;<a href=3D"mailto:=
benh@debian.org" target=3D"_blank">benh@debian.org</a>: 577e021cb980e0e8208=
21ba7b54b4961b8b4fadf&#39;
<br>[ =C2=A0=C2=A0=C2=A00.640294] Loaded X.509 cert &#39;<a href=3D"mailto:=
romain.perier@gmail.com" target=3D"_blank">romain.perier@gmail.com</a>: 3ab=
bc6ec146e09d1b6016ab9d6cf71dd233f0328&#39;
<br>[ =C2=A0=C2=A0=C2=A00.641075] Loaded X.509 cert &#39;sforshee: 00b28ddf=
47aef9cea7&#39;
<br>[ =C2=A0=C2=A0=C2=A00.641986] Loaded X.509 cert &#39;wens: 61c038651aab=
dcf94bd0ac7ff06c7248db18c600&#39;
<br>[ =C2=A0=C2=A0=C2=A00.647015] clk: Disabling unused clocks
<br>[ =C2=A0=C2=A0=C2=A00.647673] ALSA device list:
<br>[ =C2=A0=C2=A0=C2=A00.647835] =C2=A0=C2=A0No soundcards found.
<br>[ =C2=A0=C2=A0=C2=A00.653451] uart-pl011 9000000.pl011: no DMA platform=
 data
<br>[ =C2=A0=C2=A0=C2=A00.658240] Waiting for root device /dev/mmcblk0p2...
<br>[ =C2=A0=C2=A010.740382] platform gpio-keys: deferred probe pending</sp=
an></div><div><span style=3D"font-family:monospace"><br></span></div><div><=
span style=3D"font-family:monospace">What does this mean ? That the kernel =
expects a different root device than </span>mmcblk0p2. So,in my opinion,mmc=
blk0p2 is wrong.</div><div><div>How can I determine the correct name of the=
 device to boot ?</div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Aug 25, 2024 at 2:23=E2=80=AFAM Mario=
 Marietto &lt;<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">m=
arietto2008@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div><div><div>Sorry again,I was forg=
ot to add=C2=A0 &quot;root=3D/dev/xxxx&quot;</div><div><br></div><div>so :<=
/div><div><br></div><div>qemu-system-aarch64 \</div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -smp 4 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -cpu cortex-a72 \<span><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -M vir=
t \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-gpu-pci,xres=3D1024,yres=
=3D768 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -display sdl,gl=3Don \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -device usb-ehci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -dev=
ice usb-kbd \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-tablet-pci \<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial =
stdio \<br></span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel /mnt/zroot2/zroot2/OS=
/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd /mnt/zroot2/zroot2/OS/Linux/lineage-21=
.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/0.fat \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -drive index=3D0,if=3Dnone,id=3Dsystem,file=3D/mnt/zroot2/zroot2/OS/=
Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/1.img \<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dsystem \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -drive index=3D1,if=3Dnone,id=3Dvendor,file=3D/mnt/zro=
ot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/2.=
img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dvendor =
\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D2,if=3Dnone,id=3Duserdata,f=
ile=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKA=
NG-rpi4-atv/3.img \<span><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk=
-pci,drive=3Duserdata \<br></span></div><div><span><br></span></div><div><s=
pan>and I&#39;ve added the parameter &quot;/dev/vdd1&quot;<br></span></div>=
<div><span><br></span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -append &quot;=
console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait rootdelay=3D5 androidboot.=
hardware=3Dranchu root=3D/dev/vdd1 androidboot.selinux=3Dpermissive securit=
y=3Dselinux selinux=3D1 androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.de=
nsity=3D160&quot;</div><div><span style=3D"font-family:monospace"><span sty=
le=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></span=
></div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(=
0,0,0);background-color:rgb(255,255,255)">and this is what happened :</span=
></span></div><div><span style=3D"font-family:monospace"><span style=3D"col=
or:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></span></div><d=
iv><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);ba=
ckground-color:rgb(255,255,255)">root@Z390-AORUS-PRO-DEST:/mnt/zroot2/zroot=
2/OS/Linux# ./start-virt5
</span></span></div><div><span style=3D"font-family:monospace"></span></div=
><div><span style=3D"font-family:monospace"><br></span></div><div><span sty=
le=3D"font-family:monospace">WARNING: Image format was not specified for &#=
39;/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-=
rpi4-atv/1.img&#39; an</span></div><div><span style=3D"font-family:monospac=
e"></span></div><span style=3D"font-family:monospace">d probing guessed raw=
.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Automatically detectin=
g the format is dangerous for raw images, write operations on block 0 will =
be restricted.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Specify the &#39;raw&#=
39; format explicitly to remove the restrictions.
<br>WARNING: Image format was not specified for &#39;/mnt/zroot2/zroot2/OS/=
Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/2.img&#39; an<br=
>d probing guessed raw.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Automatically detectin=
g the format is dangerous for raw images, write operations on block 0 will =
be restricted.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Specify the &#39;raw&#=
39; format explicitly to remove the restrictions.
<br>WARNING: Image format was not specified for &#39;/mnt/zroot2/zroot2/OS/=
Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/3.img&#39; an<br=
>d probing guessed raw.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Automatically detectin=
g the format is dangerous for raw images, write operations on block 0 will =
be restricted.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Specify the &#39;raw&#=
39; format explicitly to remove the restrictions.
<br>[ =C2=A0=C2=A0=C2=A00.000000] Booting Linux on physical CPU 0x000000000=
0 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.000000] Linux version 6.6.36-g01aac93821d2-v8 (kl=
eaf@build-host) (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510=
928)<br> clang version 18.0.0 (<a href=3D"https://android.googlesource.com/=
toolchain/llvm-project" target=3D"_blank">https://android.googlesource.com/=
toolchain/llvm-project</a> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 1=
8.0.0) #<br>1 SMP PREEMPT Tue Jul =C2=A02 09:02:32 UTC 2024
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
400 drm.debug=3D0x0 rootwait rootdelay=3D5 androidboot.hardware=3Dranchu ro=
ot=3D/dev/vdd1<br> androidboot.selinux=3Dpermissive security=3Dselinux seli=
nux=3D1 androidboot.qemu.hw.mainkeys=3D0 androidboot.lcd.density=3D160 andr=
oidboot.seria<br>lno=3D10000000abcd1234 androidboot.btmacaddr=3D11:22:33:44=
:55:66
<br>[ =C2=A0=C2=A0=C2=A00.000000] Unknown kernel command line parameters &q=
uot;selinux=3D1&quot;, will be passed to user space.
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
<br>[ =C2=A0=C2=A0=C2=A00.000072] sched_clock: 57 bits at 63MHz, resolution=
 16ns, wraps every 4398046511096ns
<br>[ =C2=A0=C2=A0=C2=A00.003288] kfence: initialized - using 2097152 bytes=
 for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
<br>[ =C2=A0=C2=A0=C2=A00.009736] Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
<br>[ =C2=A0=C2=A0=C2=A00.009901] pid_max: default: 32768 minimum: 301
<br>[ =C2=A0=C2=A0=C2=A00.011751] LSM: initializing lsm=3Dcapability,selinu=
x,integrity
<br>[ =C2=A0=C2=A0=C2=A00.012149] SELinux: =C2=A0Initializing.
<br>[ =C2=A0=C2=A0=C2=A00.015241] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.015291] Mountpoint-cache hash table entries: 4096=
 (order: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.029324] cgroup: Disabling memory control group su=
bsystem
<br>[ =C2=A0=C2=A0=C2=A00.046905] cacheinfo: Unable to detect cache hierarc=
hy for CPU 0
<br>[ =C2=A0=C2=A0=C2=A00.055879] RCU Tasks: Setting shift to 2 and lim to =
1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.057302] RCU Tasks Rude: Setting shift to 2 and li=
m to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.057526] RCU Tasks Trace: Setting shift to 2 and l=
im to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.058950] rcu: Hierarchical SRCU implementation.
<br>[ =C2=A0=C2=A0=C2=A00.058985] rcu: =C2=A0=C2=A0=C2=A0=C2=A0Max phase no=
-delay instances is 1000.
<br>[ =C2=A0=C2=A0=C2=A00.064733] EFI services will not be available.
<br>[ =C2=A0=C2=A0=C2=A00.066555] smp: Bringing up secondary CPUs ...
<br>[ =C2=A0=C2=A0=C2=A00.070034] Detected PIPT I-cache on CPU1
<br>[ =C2=A0=C2=A0=C2=A00.071060] CPU1: Booted secondary processor 0x000000=
0001 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.075718] Detected PIPT I-cache on CPU2
<br>[ =C2=A0=C2=A0=C2=A00.076075] CPU2: Booted secondary processor 0x000000=
0002 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.078211] Detected PIPT I-cache on CPU3
<br>[ =C2=A0=C2=A0=C2=A00.078636] CPU3: Booted secondary processor 0x000000=
0003 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.079116] smp: Brought up 1 node, 4 CPUs
<br>[ =C2=A0=C2=A0=C2=A00.079163] SMP: Total of 4 processors activated.
<br>[ =C2=A0=C2=A0=C2=A00.079251] CPU features: detected: 32-bit EL0 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.079271] CPU features: detected: 32-bit EL1 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.079324] CPU features: detected: CRC32 instruction=
s
<br>[ =C2=A0=C2=A0=C2=A00.083017] CPU features: emulated: Privileged Access=
 Never (PAN) using TTBR0_EL1 switching
<br>[ =C2=A0=C2=A0=C2=A00.083324] CPU: All CPU(s) started at EL1
<br>[ =C2=A0=C2=A0=C2=A00.083510] alternatives: applying system-wide altern=
atives
<br>[ =C2=A0=C2=A0=C2=A00.103839] devtmpfs: initialized
<br>[ =C2=A0=C2=A0=C2=A00.114587] Enabled cp15_barrier support
<br>[ =C2=A0=C2=A0=C2=A00.114791] Enabled setend support
<br>[ =C2=A0=C2=A0=C2=A00.116261] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
<br>[ =C2=A0=C2=A0=C2=A00.116383] futex hash table entries: 1024 (order: 4,=
 65536 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.119461] pinctrl core: initialized pinctrl subsyst=
em
<br>[ =C2=A0=C2=A0=C2=A00.125884] DMI not present or invalid.
<br>[ =C2=A0=C2=A0=C2=A00.137528] NET: Registered PF_NETLINK/PF_ROUTE proto=
col family
<br>[ =C2=A0=C2=A0=C2=A00.147620] DMA: preallocated 256 KiB GFP_KERNEL pool=
 for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.148124] DMA: preallocated 256 KiB GFP_KERNEL|GFP_=
DMA pool for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.148401] audit: initializing netlink subsys (disab=
led)
<br>[ =C2=A0=C2=A0=C2=A00.150600] audit: type=3D2000 audit(0.140:1): state=
=3Dinitialized audit_enabled=3D0 res=3D1
<br>[ =C2=A0=C2=A0=C2=A00.153487] thermal_sys: Registered thermal governor =
&#39;step_wise&#39;
<br>[ =C2=A0=C2=A0=C2=A00.153778] cpuidle: using governor menu
<br>[ =C2=A0=C2=A0=C2=A00.154757] hw-breakpoint: found 6 breakpoint and 4 w=
atchpoint registers.
<br>[ =C2=A0=C2=A0=C2=A00.155610] ASID allocator initialised with 32768 ent=
ries
<br>[ =C2=A0=C2=A0=C2=A00.156847] Serial: AMBA PL011 UART driver
<br>[ =C2=A0=C2=A0=C2=A00.182586] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 =
(irq =3D 13, base_baud =3D 0) is a PL011 rev1
<br>[ =C2=A0=C2=A0=C2=A00.184036] printk: console [ttyAMA0] enabled
<br>[ =C2=A0=C2=A0=C2=A00.209695] Modules: 2G module region forced by RANDO=
MIZE_MODULE_REGION_FULL
<br>[ =C2=A0=C2=A0=C2=A00.209894] Modules: 0 pages in range for non-PLT usa=
ge
<br>[ =C2=A0=C2=A0=C2=A00.209917] Modules: 516176 pages in range for PLT us=
age
<br>[ =C2=A0=C2=A0=C2=A00.254528] iommu: Default domain type: Translated
<br>[ =C2=A0=C2=A0=C2=A00.254775] iommu: DMA domain TLB invalidation policy=
: strict mode
<br>[ =C2=A0=C2=A0=C2=A00.256959] SCSI subsystem initialized
<br>[ =C2=A0=C2=A0=C2=A00.258135] usbcore: registered new interface driver =
usbfs
<br>[ =C2=A0=C2=A0=C2=A00.258564] usbcore: registered new interface driver =
hub
<br>[ =C2=A0=C2=A0=C2=A00.258829] usbcore: registered new device driver usb
<br>[ =C2=A0=C2=A0=C2=A00.259862] mc: Linux media interface: v0.10
<br>[ =C2=A0=C2=A0=C2=A00.260179] videodev: Linux video capture interface: =
v2.00
<br>[ =C2=A0=C2=A0=C2=A00.260947] pps_core: LinuxPPS API ver. 1 registered
<br>[ =C2=A0=C2=A0=C2=A00.261059] pps_core: Software ver. 5.3.6 - Copyright=
 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it" target=
=3D"_blank">giometti@linux.it</a>&gt;
<br>[ =C2=A0=C2=A0=C2=A00.261325] PTP clock support registered
<br>[ =C2=A0=C2=A0=C2=A00.267784] Advanced Linux Sound Architecture Driver =
Initialized.
<br>[ =C2=A0=C2=A0=C2=A00.278021] Bluetooth: Core ver 2.22
<br>[ =C2=A0=C2=A0=C2=A00.278284] NET: Registered PF_BLUETOOTH protocol fam=
ily
<br>[ =C2=A0=C2=A0=C2=A00.278491] Bluetooth: HCI device and connection mana=
ger initialized
<br>[ =C2=A0=C2=A0=C2=A00.278832] Bluetooth: HCI socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.279154] Bluetooth: L2CAP socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.279509] Bluetooth: SCO socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.289357] vgaarb: loaded
<br>[ =C2=A0=C2=A0=C2=A00.291652] clocksource: Switched to clocksource arch=
_sys_counter
<br>[ =C2=A0=C2=A0=C2=A00.304601] VFS: Disk quotas dquot_6.6.0
<br>[ =C2=A0=C2=A0=C2=A00.305286] VFS: Dquot-cache hash table entries: 512 =
(order 0, 4096 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.307149] FS-Cache: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.309071] CacheFiles: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.317193] NET: Registered PF_INET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.318660] IP idents hash table entries: 32768 (orde=
r: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.326093] tcp_listen_portaddr_hash hash table entri=
es: 1024 (order: 2, 16384 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.326598] Table-perturb hash table entries: 65536 (=
order: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.326875] TCP established hash table entries: 16384=
 (order: 5, 131072 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.327916] TCP bind hash table entries: 16384 (order=
: 7, 524288 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.328717] TCP: Hash tables configured (established =
16384 bind 16384)
<br>[ =C2=A0=C2=A0=C2=A00.330789] MPTCP token hash table entries: 2048 (ord=
er: 3, 49152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.331272] UDP hash table entries: 1024 (order: 3, 3=
2768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.331840] UDP-Lite hash table entries: 1024 (order:=
 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.333529] NET: Registered PF_UNIX/PF_LOCAL protocol=
 family
<br>[ =C2=A0=C2=A0=C2=A00.336012] PCI: CLS 0 bytes, default 64
<br>[ =C2=A0=C2=A0=C2=A00.340601] kvm [1]: HYP mode not available
<br>[ =C2=A0=C2=A0=C2=A00.344033] Trying to unpack rootfs image as initramf=
s...
<br>[ =C2=A0=C2=A0=C2=A00.344947] rootfs image is not initramfs (invalid ma=
gic at start of compressed archive); looks like an initrd
<br>[ =C2=A0=C2=A0=C2=A00.351077] Initialise system trusted keyrings
<br>[ =C2=A0=C2=A0=C2=A00.353062] workingset: timestamp_bits=3D46 max_order=
=3D19 bucket_order=3D0
<br>[ =C2=A0=C2=A0=C2=A00.353682] zbud: loaded
<br>[ =C2=A0=C2=A0=C2=A00.361534] Key type cifs.idmap registered
<br>[ =C2=A0=C2=A0=C2=A00.362434] fuse: init (API version 7.39)
<br>[ =C2=A0=C2=A0=C2=A00.398148] Key type asymmetric registered
<br>[ =C2=A0=C2=A0=C2=A00.398433] Asymmetric key parser &#39;x509&#39; regi=
stered
<br>[ =C2=A0=C2=A0=C2=A00.398918] Block layer SCSI generic (bsg) driver ver=
sion 0.4 loaded (major 244)
<br>[ =C2=A0=C2=A0=C2=A00.400130] io scheduler mq-deadline registered
<br>[ =C2=A0=C2=A0=C2=A00.400288] io scheduler kyber registered
<br>[ =C2=A0=C2=A0=C2=A00.400649] io scheduler bfq registered
<br>[ =C2=A0=C2=A0=C2=A00.416082] vc-mem: phys_addr:0x00000000 mem_base=3D0=
x00000000 mem_size:0x00000000(0 MiB)
<br>[ =C2=A0=C2=A0=C2=A00.477796] brd: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.516082] loop: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.519143] Loading iSCSI transport class v2.0-870.
<br>[ =C2=A0=C2=A0=C2=A00.527568] wireguard: WireGuard 1.0.0 loaded. See <a=
 href=3D"http://www.wireguard.com" target=3D"_blank">www.wireguard.com</a> =
for information.
<br>[ =C2=A0=C2=A0=C2=A00.527819] wireguard: Copyright (C) 2015-2019 Jason =
A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason=
@zx2c4.com</a>&gt;. All Rights Reserved.
<br>[ =C2=A0=C2=A0=C2=A00.538731] tun: Universal TUN/TAP device driver, 1.6
<br>[ =C2=A0=C2=A0=C2=A00.541589] usbcore: registered new interface driver =
brcmfmac
<br>[ =C2=A0=C2=A0=C2=A00.541866] usbcore: registered new device driver r81=
52-cfgselector
<br>[ =C2=A0=C2=A0=C2=A00.542137] usbcore: registered new interface driver =
r8152
<br>[ =C2=A0=C2=A0=C2=A00.542409] usbcore: registered new interface driver =
lan78xx
<br>[ =C2=A0=C2=A0=C2=A00.542644] usbcore: registered new interface driver =
asix
<br>[ =C2=A0=C2=A0=C2=A00.542883] usbcore: registered new interface driver =
ax88179_178a
<br>[ =C2=A0=C2=A0=C2=A00.543185] usbcore: registered new interface driver =
cdc_ether
<br>[ =C2=A0=C2=A0=C2=A00.543558] usbcore: registered new interface driver =
smsc95xx
<br>[ =C2=A0=C2=A0=C2=A00.543784] usbcore: registered new interface driver =
net1080
<br>[ =C2=A0=C2=A0=C2=A00.544049] usbcore: registered new interface driver =
cdc_subset
<br>[ =C2=A0=C2=A0=C2=A00.544340] usbcore: registered new interface driver =
zaurus
<br>[ =C2=A0=C2=A0=C2=A00.544632] usbcore: registered new interface driver =
cdc_ncm
<br>[ =C2=A0=C2=A0=C2=A00.544909] usbcore: registered new interface driver =
r8153_ecm
<br>[ =C2=A0=C2=A0=C2=A00.546053] dwc_otg: version 3.00a 10-AUG-2012 (platf=
orm bus)
<br>[ =C2=A0=C2=A0=C2=A00.548482] usbcore: registered new interface driver =
cdc_acm
<br>[ =C2=A0=C2=A0=C2=A00.548670] cdc_acm: USB Abstract Control Model drive=
r for USB modems and ISDN adapters
<br>[ =C2=A0=C2=A0=C2=A00.549653] usbcore: registered new interface driver =
uas
<br>[ =C2=A0=C2=A0=C2=A00.550010] usbcore: registered new interface driver =
usb-storage
<br>[ =C2=A0=C2=A0=C2=A00.550594] usbcore: registered new interface driver =
cp210x
<br>[ =C2=A0=C2=A0=C2=A00.550995] usbserial: USB Serial support registered =
for cp210x
<br>[ =C2=A0=C2=A0=C2=A00.551297] usbcore: registered new interface driver =
pl2303
<br>[ =C2=A0=C2=A0=C2=A00.551740] usbserial: USB Serial support registered =
for pl2303
<br>[ =C2=A0=C2=A0=C2=A00.554998] mousedev: PS/2 mouse device common for al=
l mice
<br>[ =C2=A0=C2=A0=C2=A00.555316] usbcore: registered new interface driver =
xpad
<br>[ =C2=A0=C2=A0=C2=A00.555738] usbcore: registered new interface driver =
usb_acecad
<br>[ =C2=A0=C2=A0=C2=A00.556054] usbcore: registered new interface driver =
aiptek
<br>[ =C2=A0=C2=A0=C2=A00.556428] usbcore: registered new interface driver =
hanwang
<br>[ =C2=A0=C2=A0=C2=A00.556701] usbcore: registered new interface driver =
kbtab
<br>[ =C2=A0=C2=A0=C2=A00.557253] usbcore: registered new interface driver =
usbtouchscreen
<br>[ =C2=A0=C2=A0=C2=A00.558607] i2c_dev: i2c /dev entries driver
<br>[ =C2=A0=C2=A0=C2=A00.563208] ir_imon_decoder: IR iMON protocol handler=
 initialized
<br>[ =C2=A0=C2=A0=C2=A00.563376] IR JVC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.563702] IR MCE Keyboard/mouse protocol handler in=
itialized
<br>[ =C2=A0=C2=A0=C2=A00.563867] IR NEC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.564042] IR RC5(x/sz) protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.564153] IR RC6 protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.564261] IR RCMM protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.564381] IR SANYO protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.564544] IR Sharp protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.564655] IR Sony protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.564774] IR XMP protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.565552] usbcore: registered new interface driver =
uvcvideo
<br>[ =C2=A0=C2=A0=C2=A00.567197] device-mapper: uevent: version 1.0.3
<br>[ =C2=A0=C2=A0=C2=A00.568668] device-mapper: ioctl: 4.48.0-ioctl (2023-=
03-01) initialised: <a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank=
">dm-devel@redhat.com</a>
<br>[ =C2=A0=C2=A0=C2=A00.570048] Bluetooth: HCI UART driver ver 2.3
<br>[ =C2=A0=C2=A0=C2=A00.570243] Bluetooth: HCI UART protocol H4 registere=
d
<br>[ =C2=A0=C2=A0=C2=A00.570633] Bluetooth: HCI UART protocol Broadcom reg=
istered
<br>[ =C2=A0=C2=A0=C2=A00.571948] sdhci: Secure Digital Host Controller Int=
erface driver
<br>[ =C2=A0=C2=A0=C2=A00.572068] sdhci: Copyright(c) Pierre Ossman
<br>[ =C2=A0=C2=A0=C2=A00.572585] sdhci-pltfm: SDHCI platform and OF driver=
 helper
<br>[ =C2=A0=C2=A0=C2=A00.574315] ledtrig-cpu: registered to indicate activ=
ity on CPUs
<br>[ =C2=A0=C2=A0=C2=A00.576835] hid: raw HID events driver (C) Jiri Kosin=
a
<br>[ =C2=A0=C2=A0=C2=A00.586764] usbcore: registered new interface driver =
usbhid
<br>[ =C2=A0=C2=A0=C2=A00.586903] usbhid: USB HID core driver
<br>[ =C2=A0=C2=A0=C2=A00.589619] ashmem: initialized
<br>[ =C2=A0=C2=A0=C2=A00.590820] SPI driver st-accel-spi has no spi_device=
_id for st,lis302dl-spi
<br>[ =C2=A0=C2=A0=C2=A00.590958] SPI driver st-accel-spi has no spi_device=
_id for st,lis3lv02dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.591087] SPI driver st-accel-spi has no spi_device=
_id for st,lis3dh-accel
<br>[ =C2=A0=C2=A0=C2=A00.591215] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330d-accel
<br>[ =C2=A0=C2=A0=C2=A00.591369] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.591703] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dlc-accel
<br>[ =C2=A0=C2=A0=C2=A00.591861] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dlh-accel
<br>[ =C2=A0=C2=A0=C2=A00.592008] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330-accel
<br>[ =C2=A0=C2=A0=C2=A00.592138] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303agr-accel
<br>[ =C2=A0=C2=A0=C2=A00.592291] SPI driver st-accel-spi has no spi_device=
_id for st,lis2dh12-accel
<br>[ =C2=A0=C2=A0=C2=A00.592439] SPI driver st-accel-spi has no spi_device=
_id for st,lng2dm-accel
<br>[ =C2=A0=C2=A0=C2=A00.592583] SPI driver st-accel-spi has no spi_device=
_id for st,h3lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.592723] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.592869] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303c-accel
<br>[ =C2=A0=C2=A0=C2=A00.593667] SPI driver st-magn-spi has no spi_device_=
id for st,lis3mdl-magn
<br>[ =C2=A0=C2=A0=C2=A00.593802] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303agr-magn
<br>[ =C2=A0=C2=A0=C2=A00.593937] SPI driver st-magn-spi has no spi_device_=
id for st,lsm9ds1-magn
<br>[ =C2=A0=C2=A0=C2=A00.594067] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303c-magn
<br>[ =C2=A0=C2=A0=C2=A00.598178] hw perfevents: enabled with armv8_pmuv3 P=
MU driver, 7 counters available
<br>[ =C2=A0=C2=A0=C2=A00.601694] usbcore: registered new interface driver =
snd-usb-audio
<br>[ =C2=A0=C2=A0=C2=A00.608955] Mirror/redirect action on
<br>[ =C2=A0=C2=A0=C2=A00.609389] netem: version 1.3
<br>[ =C2=A0=C2=A0=C2=A00.609524] u32 classifier
<br>[ =C2=A0=C2=A0=C2=A00.609579] =C2=A0=C2=A0=C2=A0=C2=A0input device chec=
k on
<br>[ =C2=A0=C2=A0=C2=A00.609655] =C2=A0=C2=A0=C2=A0=C2=A0Actions configure=
d
<br>[ =C2=A0=C2=A0=C2=A00.616553] xt_time: kernel timezone is -0000
<br>[ =C2=A0=C2=A0=C2=A00.616968] gre: GRE over IPv4 demultiplexor driver
<br>[ =C2=A0=C2=A0=C2=A00.617157] IPv4 over IPsec tunneling driver
<br>[ =C2=A0=C2=A0=C2=A00.621789] Initializing XFRM netlink socket
<br>[ =C2=A0=C2=A0=C2=A00.622080] IPsec XFRM device driver
<br>[ =C2=A0=C2=A0=C2=A00.622964] NET: Registered PF_INET6 protocol family
<br>[ =C2=A0=C2=A0=C2=A00.632975] Segment Routing with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.633254] In-situ OAM (IOAM) with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.634281] mip6: Mobile IPv6
<br>[ =C2=A0=C2=A0=C2=A00.637517] sit: IPv6, IPv4 and MPLS over IPv4 tunnel=
ing driver
<br>[ =C2=A0=C2=A0=C2=A00.641524] NET: Registered PF_PACKET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.641880] NET: Registered PF_KEY protocol family
<br>[ =C2=A0=C2=A0=C2=A00.642090] Key type dns_resolver registered
<br>[ =C2=A0=C2=A0=C2=A00.723004] Freeing initrd memory: 131072K
<br>[ =C2=A0=C2=A0=C2=A00.726147] registered taskstats version 1
<br>[ =C2=A0=C2=A0=C2=A00.728209] Loading compiled-in X.509 certificates
<br>[ =C2=A0=C2=A0=C2=A00.766647] Key type .fscrypt registered
<br>[ =C2=A0=C2=A0=C2=A00.766772] Key type fscrypt-provisioning registered
<br>[ =C2=A0=C2=A0=C2=A00.774312] of_cfs_init
<br>[ =C2=A0=C2=A0=C2=A00.774711] of_cfs_init: OK
<br>[ =C2=A0=C2=A0=C2=A00.778079] cfg80211: Loading compiled-in X.509 certi=
ficates for regulatory database
<br>[ =C2=A0=C2=A0=C2=A00.804531] Loaded X.509 cert &#39;<a href=3D"mailto:=
benh@debian.org" target=3D"_blank">benh@debian.org</a>: 577e021cb980e0e8208=
21ba7b54b4961b8b4fadf&#39;
<br>[ =C2=A0=C2=A0=C2=A00.805402] Loaded X.509 cert &#39;<a href=3D"mailto:=
romain.perier@gmail.com" target=3D"_blank">romain.perier@gmail.com</a>: 3ab=
bc6ec146e09d1b6016ab9d6cf71dd233f0328&#39;
<br>[ =C2=A0=C2=A0=C2=A00.806133] Loaded X.509 cert &#39;sforshee: 00b28ddf=
47aef9cea7&#39;
<br>[ =C2=A0=C2=A0=C2=A00.806799] Loaded X.509 cert &#39;wens: 61c038651aab=
dcf94bd0ac7ff06c7248db18c600&#39;
<br>[ =C2=A0=C2=A0=C2=A00.812604] clk: Disabling unused clocks
<br>[ =C2=A0=C2=A0=C2=A00.813045] ALSA device list:
<br>[ =C2=A0=C2=A0=C2=A00.813166] =C2=A0=C2=A0No soundcards found.
<br>[ =C2=A0=C2=A0=C2=A00.819946] uart-pl011 9000000.pl011: no DMA platform=
 data
<br>[ =C2=A0=C2=A0=C2=A00.821300] Waiting 5 sec before mounting root device=
...
<br>[ =C2=A0=C2=A0=C2=A05.905329] RAMDISK: Couldn&#39;t find valid RAM disk=
 image starting at 0.
<br>[ =C2=A0=C2=A0=C2=A05.906225] Waiting for root device /dev/vdd1...
<br>[ =C2=A0=C2=A011.028260] platform gpio-keys: deferred probe pending<br>
<br></span></div><div><span style=3D"font-family:monospace">it seems that t=
he only error is produced by this argument : </span>root=3D/dev/vdd1</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sun, Aug 25, 2024 at 1:59=E2=80=AFAM Mario Marietto &lt;<a href=3D"mailto=
:marietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div><div>Sorry for the mistake,but the log reported on my previou=
s email message is produced from these parameters :</div><div><br></div><di=
v>qemu-system-aarch64 \</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu cortex-=
a72 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -M virt \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -device virtio-gpu-pci,xres=3D1024,yres=3D768 \<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -display sdl,gl=3Don \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-e=
hci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -device virtio-tablet-pci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb =
\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial stdio \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -kernel /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL=
-KonstaKANG-rpi4-atv/boot/Image \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd /m=
nt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-=
atv/0.fat \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D0,if=3Dnone,id=3D=
system,file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-=
KonstaKANG-rpi4-atv/1.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-b=
lk-pci,drive=3Dsystem \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D1,if=
=3Dnone,id=3Dvendor,file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-2024061=
8-UNOFFICIAL-KonstaKANG-rpi4-atv/2.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -de=
vice virtio-blk-pci,drive=3Dvendor \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive =
index=3D2,if=3Dnone,id=3Duserdata,file=3D/mnt/zroot2/zroot2/OS/Linux/lineag=
e-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/3.img \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -device virtio-blk-pci,drive=3Duserdata \<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0 rootwait r=
ootdelay=3D5 androidboot.hardware=3Dranchu androidboot.selinux=3Dpermissive=
 security=3Dselinux selinux=3D1 androidboot.qemu.hw.mainkeys=3D0 androidboo=
t.lcd.density=3D160&quot;<br><br></div>I&#39;ve copied and pasted the wrong=
 parameters,sorry.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sun, Aug 25, 2024 at 1:54=E2=80=AFAM Mario Mariett=
o &lt;<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">marietto2=
008@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div>&gt;So first up, this is as far as I kno=
w &quot;uncharted territory&quot;<br>
&gt;in that I&#39;m not aware of anybody who&#39;s booted full Android on<b=
r>
&gt;any (upstream) QEMU board model. (If there&#39;s anybody on-list<br>
&gt;who *has* done this, please speak up!</div><div><div><div><span><br></s=
pan></div><div><span>Me. On 2021,after several months of research,I&#39;ve<=
span> just been able to boot this version of <span>Android</span> :</span><=
/span></div></div><div><div><span><br></span></div></div><div><div><span><s=
pan><span><br></span></span></span></div><div><span><span><span><a href=3D"=
https://github.com/antmicro/kvm-aosp-jetson-nano" target=3D"_blank">https:/=
/github.com/antmicro/kvm-aosp-jetson-nano</a></span></span></span></div></d=
iv><div><div><span></span></div></div><div><div><span><br></span></div></di=
v><div><div><span><span><br></span></span></div><div><span><span>on my jets=
on nano board using <span>qemu</span> / kvm configured like this :<br></spa=
n></span></div></div><div><div><span><br></span></div><div><span><br></span=
></div></div><div><div><span>qemu</span>-system-aarch64 \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -enable-kvm \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -smp 4 \<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cpu host=
 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -M virt \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
-device virtio-gpu-pci,xres=3D1024,yres=3D768 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -display sdl,gl=3Don \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-ehci =
\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -device virtio-tablet-pci \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -usb \<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial stdio \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -kernel Image \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd ramdisk.img \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D0,if=3Dnone,id=3Dsystem,file=3Ds=
ystem-rw.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-blk-pci,drive=
=3Dsystem \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D1,if=3Dnone,id=3D=
vendor,file=3Dvendor-rw.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio=
-blk-pci,drive=3Dvendor \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -drive index=3D2,i=
f=3Dnone,id=3Duserdata,file=3Duserdata.img \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -device virtio-blk-pci,drive=3Duserdata \<br>=C2=A0
 =C2=A0 =C2=A0 =C2=A0 -append &quot;console=3DttyAMA0,38400 drm.debug=3D0x0=
 rootwait rootdelay=3D5
 androidboot.hardware=3Dranchu androidboot.selinux=3Dpermissive=20
security=3Dselinux selinux=3D1 androidboot.<span>qemu</span>.hw.mainkeys=3D=
0 androidboot.lcd.density=3D160&quot;</div></div><div><div><span><br></span=
></div></div><div><div><span></span></div></div><div><div><span><span><br><=
/span></span></div><div><span><span>here we go :</span></span></div><div><s=
pan><span><br></span></span></div><div><span><span><br></span></span></div>=
<div><img src=3D"cid:ii_m08sj4fw0" alt=3D"unnamed.jpg" width=3D"488" height=
=3D"275"><br></div></div></div><div><br></div><div>So,I imagine that I shou=
ld use the same parameters or closer parameters to those used on 2021,like =
the following ones :<br></div><div><br></div><div><br></div><div>qemu-syste=
m-aarch64 \<br>=C2=A0 =C2=A0 -m 2048 \<br>=C2=A0 =C2=A0 -cpu cortex-a72 \<b=
r>=C2=A0 =C2=A0 -M virt,gic-version=3D2 \<br>=C2=A0 =C2=A0 -drive if=3Dpfla=
sh,format=3Draw,file=3D/usr/local/share/qemu/edk2-aarch64-code.fd \<br>=C2=
=A0 =C2=A0 -drive if=3Dpflash,format=3Draw,file=3D/usr/local/share/qemu/edk=
2-arm-vars.fd \<br>=C2=A0 =C2=A0 -kernel /mnt/zroot2/zroot2/OS/Linux/lineag=
e-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \<br>=C2=A0 =C2=
=A0 -append &#39;console=3DttyAMA0,38400 keep_bootcon earlycon=3Dpl011,0x90=
00000 androidboot.hardware=3Dranchu root=3D/dev/vdd1&#39; \<br>=C2=A0 =C2=
=A0 -dtb /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Konst=
aKANG-rpi4-atv/boot/bcm2711-rpi-4-b.dtb \<br>=C2=A0 =C2=A0 -drive file=3D/m=
nt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-=
atv/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv.img,format=3Draw,i=
ndex=3D0,media=3Ddisk \<br>=C2=A0 =C2=A0 -device virtio-gpu-pci \<br>=C2=A0=
 =C2=A0 -device qemu-xhci \<br>=C2=A0 =C2=A0 -device usb-kbd \<br>=C2=A0 =
=C2=A0 -device usb-mouse \<br>=C2=A0 =C2=A0 -netdev user,id=3Dmynet \<br>=
=C2=A0 =C2=A0 -device virtio-net-pci,netdev=3Dmynet \<br>=C2=A0 =C2=A0 -ser=
ial stdio \<br>=C2=A0 =C2=A0 -no-reboot \<br>=C2=A0 =C2=A0 -d unimp,guest_e=
rrors \<br>=C2=A0 =C2=A0 -smp cores=3D4 \<br>=C2=A0 =C2=A0 -device qemu-xhc=
i,id=3Dxhci,addr=3D0x5 \<br>=C2=A0 =C2=A0 -device usb-mouse,bus=3Dxhci.0 \<=
br>=C2=A0 =C2=A0 -device usb-kbd,bus=3Dxhci.0</div><div><br></div><div>My i=
mpression is that they are more correct than the previous ones,what do you =
think ?</div><div><br></div><div><span style=3D"font-family:monospace"><spa=
n style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">root@Z390-AO=
RUS-PRO-DEST:/mnt/zroot2/zroot2/OS/Linux# ./start-virt5
</span><br></span></div><div><span style=3D"font-family:monospace"><br></sp=
an></div><div><span style=3D"font-family:monospace">WARNING: Image format w=
as not specified for &#39;/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618=
-UNOFFICIAL-KonstaKANG-rpi4-atv/1.img&#39; and probing guessed raw.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Automatically detectin=
g the format is dangerous for raw images, write operations on block 0 will =
be restricted.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Specify the &#39;raw&#=
39; format explicitly to remove the restrictions.
<br></span></div><div><span style=3D"font-family:monospace"><br></span></di=
v><div><span style=3D"font-family:monospace">WARNING: Image format was not =
specified for &#39;/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFI=
CIAL-KonstaKANG-rpi4-atv/2.img&#39; and probing guessed raw.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Automatically detectin=
g the format is dangerous for raw images, write operations on block 0 will =
be restricted.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Specify the &#39;raw&#=
39; format explicitly to remove the restrictions.
<br></span></div><div><span style=3D"font-family:monospace"><br></span></di=
v><div><span style=3D"font-family:monospace">WARNING: Image format was not =
specified for &#39;/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFI=
CIAL-KonstaKANG-rpi4-atv/3.img&#39; and probing guessed raw.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Automatically detectin=
g the format is dangerous for raw images, write operations on block 0 will =
be restricted.
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Specify the &#39;raw&#=
39; format explicitly to remove the restrictions.
<br></span></div><div><span style=3D"font-family:monospace"><br></span></di=
v><div><span style=3D"font-family:monospace">[ =C2=A0=C2=A0=C2=A00.000000] =
Booting Linux on physical CPU 0x0000000000 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.000000] Linux version 6.6.36-g01aac93821d2-v8 (kl=
eaf@build-host) (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510=
928)clang version 18.0.0 (<a href=3D"https://android.googlesource.com/toolc=
hain/llvm-project" target=3D"_blank">https://android.googlesource.com/toolc=
hain/llvm-project</a> 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0=
) #1 SMP PREEMPT Tue Jul =C2=A02 09:02:32 UTC 2024
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
400 drm.debug=3D0x0 rootwait rootdelay=3D5 androidboot.hardware=3Dranchu an=
droidboot.selinux=3Dpermissive security=3Dselinux selinux=3D1 androidboot.q=
emu.hw.mainkeys=3D0 androidboot.lcd.density=3D160 androidboot.serialno=3D10=
000000abcd1234 androidboot.btmacaddr=3D11:22:33:44:55:66
<br>[ =C2=A0=C2=A0=C2=A00.000000] Unknown kernel command line parameters &q=
uot;selinux=3D1&quot;, will be passed to user space.
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
reserved, 8192K cma-reserved)
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
<br>[ =C2=A0=C2=A0=C2=A00.003202] kfence: initialized - using 2097152 bytes=
 for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
<br>[ =C2=A0=C2=A0=C2=A00.010267] Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 125.00 BogoMIPS (lpj=3D250000)
<br>[ =C2=A0=C2=A0=C2=A00.010436] pid_max: default: 32768 minimum: 301
<br>[ =C2=A0=C2=A0=C2=A00.012350] LSM: initializing lsm=3Dcapability,selinu=
x,integrity
<br>[ =C2=A0=C2=A0=C2=A00.012758] SELinux: =C2=A0Initializing.
<br>[ =C2=A0=C2=A0=C2=A00.016675] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.016734] Mountpoint-cache hash table entries: 4096=
 (order: 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.030817] cgroup: Disabling memory control group su=
bsystem
<br>[ =C2=A0=C2=A0=C2=A00.049765] cacheinfo: Unable to detect cache hierarc=
hy for CPU 0
<br>[ =C2=A0=C2=A0=C2=A00.060209] RCU Tasks: Setting shift to 2 and lim to =
1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.060803] RCU Tasks Rude: Setting shift to 2 and li=
m to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.061039] RCU Tasks Trace: Setting shift to 2 and l=
im to 1 rcu_task_cb_adjust=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.062716] rcu: Hierarchical SRCU implementation.
<br>[ =C2=A0=C2=A0=C2=A00.062754] rcu: =C2=A0=C2=A0=C2=A0=C2=A0Max phase no=
-delay instances is 1000.
<br>[ =C2=A0=C2=A0=C2=A00.069399] EFI services will not be available.
<br>[ =C2=A0=C2=A0=C2=A00.071153] smp: Bringing up secondary CPUs ...
<br>[ =C2=A0=C2=A0=C2=A00.079351] Detected PIPT I-cache on CPU1
<br>[ =C2=A0=C2=A0=C2=A00.080469] CPU1: Booted secondary processor 0x000000=
0001 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.085912] Detected PIPT I-cache on CPU2
<br>[ =C2=A0=C2=A0=C2=A00.086684] CPU2: Booted secondary processor 0x000000=
0002 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.089073] Detected PIPT I-cache on CPU3
<br>[ =C2=A0=C2=A0=C2=A00.089828] CPU3: Booted secondary processor 0x000000=
0003 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.090326] smp: Brought up 1 node, 4 CPUs
<br>[ =C2=A0=C2=A0=C2=A00.090357] SMP: Total of 4 processors activated.
<br>[ =C2=A0=C2=A0=C2=A00.090450] CPU features: detected: 32-bit EL0 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.090471] CPU features: detected: 32-bit EL1 Suppor=
t
<br>[ =C2=A0=C2=A0=C2=A00.090527] CPU features: detected: CRC32 instruction=
s
<br>[ =C2=A0=C2=A0=C2=A00.094597] CPU features: emulated: Privileged Access=
 Never (PAN) using TTBR0_EL1 switching
<br>[ =C2=A0=C2=A0=C2=A00.094900] CPU: All CPU(s) started at EL1
<br>[ =C2=A0=C2=A0=C2=A00.095086] alternatives: applying system-wide altern=
atives
<br>[ =C2=A0=C2=A0=C2=A00.117729] devtmpfs: initialized
<br>[ =C2=A0=C2=A0=C2=A00.128846] Enabled cp15_barrier support
<br>[ =C2=A0=C2=A0=C2=A00.129028] Enabled setend support
<br>[ =C2=A0=C2=A0=C2=A00.132524] clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
<br>[ =C2=A0=C2=A0=C2=A00.132773] futex hash table entries: 1024 (order: 4,=
 65536 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.136092] pinctrl core: initialized pinctrl subsyst=
em
<br>[ =C2=A0=C2=A0=C2=A00.142750] DMI not present or invalid.
<br>[ =C2=A0=C2=A0=C2=A00.162991] NET: Registered PF_NETLINK/PF_ROUTE proto=
col family
<br>[ =C2=A0=C2=A0=C2=A00.174108] DMA: preallocated 256 KiB GFP_KERNEL pool=
 for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.175101] DMA: preallocated 256 KiB GFP_KERNEL|GFP_=
DMA pool for atomic allocations
<br>[ =C2=A0=C2=A0=C2=A00.175422] audit: initializing netlink subsys (disab=
led)
<br>[ =C2=A0=C2=A0=C2=A00.177740] audit: type=3D2000 audit(0.156:1): state=
=3Dinitialized audit_enabled=3D0 res=3D1
<br>[ =C2=A0=C2=A0=C2=A00.180968] thermal_sys: Registered thermal governor =
&#39;step_wise&#39;
<br>[ =C2=A0=C2=A0=C2=A00.181282] cpuidle: using governor menu
<br>[ =C2=A0=C2=A0=C2=A00.182303] hw-breakpoint: found 6 breakpoint and 4 w=
atchpoint registers.
<br>[ =C2=A0=C2=A0=C2=A00.183259] ASID allocator initialised with 32768 ent=
ries
<br>[ =C2=A0=C2=A0=C2=A00.184629] Serial: AMBA PL011 UART driver
<br>[ =C2=A0=C2=A0=C2=A00.211469] 9000000.pl011: ttyAMA0 at MMIO 0x9000000 =
(irq =3D 13, base_baud =3D 0) is a PL011 rev1
<br>[ =C2=A0=C2=A0=C2=A00.213104] printk: console [ttyAMA0] enabled
<br>[ =C2=A0=C2=A0=C2=A00.238159] Modules: 2G module region forced by RANDO=
MIZE_MODULE_REGION_FULL
<br>[ =C2=A0=C2=A0=C2=A00.238355] Modules: 0 pages in range for non-PLT usa=
ge
<br>[ =C2=A0=C2=A0=C2=A00.238379] Modules: 516176 pages in range for PLT us=
age
<br>[ =C2=A0=C2=A0=C2=A00.257283] iommu: Default domain type: Translated
<br>[ =C2=A0=C2=A0=C2=A00.257533] iommu: DMA domain TLB invalidation policy=
: strict mode
<br>[ =C2=A0=C2=A0=C2=A00.260201] SCSI subsystem initialized
<br>[ =C2=A0=C2=A0=C2=A00.261520] usbcore: registered new interface driver =
usbfs
<br>[ =C2=A0=C2=A0=C2=A00.261986] usbcore: registered new interface driver =
hub
<br>[ =C2=A0=C2=A0=C2=A00.262329] usbcore: registered new device driver usb
<br>[ =C2=A0=C2=A0=C2=A00.263464] mc: Linux media interface: v0.10
<br>[ =C2=A0=C2=A0=C2=A00.263810] videodev: Linux video capture interface: =
v2.00
<br>[ =C2=A0=C2=A0=C2=A00.264708] pps_core: LinuxPPS API ver. 1 registered
<br>[ =C2=A0=C2=A0=C2=A00.264818] pps_core: Software ver. 5.3.6 - Copyright=
 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it" target=
=3D"_blank">giometti@linux.it</a>&gt;
<br>[ =C2=A0=C2=A0=C2=A00.265083] PTP clock support registered
<br>[ =C2=A0=C2=A0=C2=A00.268294] Advanced Linux Sound Architecture Driver =
Initialized.
<br>[ =C2=A0=C2=A0=C2=A00.280703] Bluetooth: Core ver 2.22
<br>[ =C2=A0=C2=A0=C2=A00.281023] NET: Registered PF_BLUETOOTH protocol fam=
ily
<br>[ =C2=A0=C2=A0=C2=A00.281133] Bluetooth: HCI device and connection mana=
ger initialized
<br>[ =C2=A0=C2=A0=C2=A00.281493] Bluetooth: HCI socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.281664] Bluetooth: L2CAP socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.281959] Bluetooth: SCO socket layer initialized
<br>[ =C2=A0=C2=A0=C2=A00.284803] vgaarb: loaded
<br>[ =C2=A0=C2=A0=C2=A00.287063] clocksource: Switched to clocksource arch=
_sys_counter
<br>[ =C2=A0=C2=A0=C2=A00.291943] VFS: Disk quotas dquot_6.6.0
<br>[ =C2=A0=C2=A0=C2=A00.292819] VFS: Dquot-cache hash table entries: 512 =
(order 0, 4096 bytes)
<br>[ =C2=A0=C2=A0=C2=A00.294620] FS-Cache: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.297327] CacheFiles: Loaded
<br>[ =C2=A0=C2=A0=C2=A00.306599] NET: Registered PF_INET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.311097] IP idents hash table entries: 32768 (orde=
r: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.330285] tcp_listen_portaddr_hash hash table entri=
es: 1024 (order: 2, 16384 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.330900] Table-perturb hash table entries: 65536 (=
order: 6, 262144 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.331678] TCP established hash table entries: 16384=
 (order: 5, 131072 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.333233] TCP bind hash table entries: 16384 (order=
: 7, 524288 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.334433] TCP: Hash tables configured (established =
16384 bind 16384)
<br>[ =C2=A0=C2=A0=C2=A00.336757] MPTCP token hash table entries: 2048 (ord=
er: 3, 49152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.337244] UDP hash table entries: 1024 (order: 3, 3=
2768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.337671] UDP-Lite hash table entries: 1024 (order:=
 3, 32768 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.339476] NET: Registered PF_UNIX/PF_LOCAL protocol=
 family
<br>[ =C2=A0=C2=A0=C2=A00.342269] PCI: CLS 0 bytes, default 64
<br>[ =C2=A0=C2=A0=C2=A00.346671] Trying to unpack rootfs image as initramf=
s...
<br>[ =C2=A0=C2=A0=C2=A00.348009] kvm [1]: HYP mode not available
<br>[ =C2=A0=C2=A0=C2=A00.352285] rootfs image is not initramfs (invalid ma=
gic at start of compressed archive); looks like an initrd
<br>[ =C2=A0=C2=A0=C2=A00.354672] Initialise system trusted keyrings
<br>[ =C2=A0=C2=A0=C2=A00.360053] workingset: timestamp_bits=3D46 max_order=
=3D19 bucket_order=3D0
<br>[ =C2=A0=C2=A0=C2=A00.360812] zbud: loaded
<br>[ =C2=A0=C2=A0=C2=A00.368584] Key type cifs.idmap registered
<br>[ =C2=A0=C2=A0=C2=A00.369302] fuse: init (API version 7.39)
<br>[ =C2=A0=C2=A0=C2=A00.420389] Key type asymmetric registered
<br>[ =C2=A0=C2=A0=C2=A00.420653] Asymmetric key parser &#39;x509&#39; regi=
stered
<br>[ =C2=A0=C2=A0=C2=A00.421094] Block layer SCSI generic (bsg) driver ver=
sion 0.4 loaded (major 244)
<br>[ =C2=A0=C2=A0=C2=A00.422211] io scheduler mq-deadline registered
<br>[ =C2=A0=C2=A0=C2=A00.422382] io scheduler kyber registered
<br>[ =C2=A0=C2=A0=C2=A00.422760] io scheduler bfq registered
<br>[ =C2=A0=C2=A0=C2=A00.440485] vc-mem: phys_addr:0x00000000 mem_base=3D0=
x00000000 mem_size:0x00000000(0 MiB)
<br>[ =C2=A0=C2=A0=C2=A00.513713] brd: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.543067] loop: module loaded
<br>[ =C2=A0=C2=A0=C2=A00.546895] Loading iSCSI transport class v2.0-870.
<br>[ =C2=A0=C2=A0=C2=A00.557492] wireguard: WireGuard 1.0.0 loaded. See <a=
 href=3D"http://www.wireguard.com" target=3D"_blank">www.wireguard.com</a> =
for information.
<br>[ =C2=A0=C2=A0=C2=A00.557673] wireguard: Copyright (C) 2015-2019 Jason =
A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason=
@zx2c4.com</a>&gt;. All Rights Reserved.
<br>[ =C2=A0=C2=A0=C2=A00.571442] tun: Universal TUN/TAP device driver, 1.6
<br>[ =C2=A0=C2=A0=C2=A00.575425] usbcore: registered new interface driver =
brcmfmac
<br>[ =C2=A0=C2=A0=C2=A00.575658] usbcore: registered new device driver r81=
52-cfgselector
<br>[ =C2=A0=C2=A0=C2=A00.575862] usbcore: registered new interface driver =
r8152
<br>[ =C2=A0=C2=A0=C2=A00.576092] usbcore: registered new interface driver =
lan78xx
<br>[ =C2=A0=C2=A0=C2=A00.576358] usbcore: registered new interface driver =
asix
<br>[ =C2=A0=C2=A0=C2=A00.576574] usbcore: registered new interface driver =
ax88179_178a
<br>[ =C2=A0=C2=A0=C2=A00.576804] usbcore: registered new interface driver =
cdc_ether
<br>[ =C2=A0=C2=A0=C2=A00.577018] usbcore: registered new interface driver =
smsc95xx
<br>[ =C2=A0=C2=A0=C2=A00.577259] usbcore: registered new interface driver =
net1080
<br>[ =C2=A0=C2=A0=C2=A00.577463] usbcore: registered new interface driver =
cdc_subset
<br>[ =C2=A0=C2=A0=C2=A00.577669] usbcore: registered new interface driver =
zaurus
<br>[ =C2=A0=C2=A0=C2=A00.577908] usbcore: registered new interface driver =
cdc_ncm
<br>[ =C2=A0=C2=A0=C2=A00.578128] usbcore: registered new interface driver =
r8153_ecm
<br>[ =C2=A0=C2=A0=C2=A00.579387] dwc_otg: version 3.00a 10-AUG-2012 (platf=
orm bus)
<br>[ =C2=A0=C2=A0=C2=A00.582601] usbcore: registered new interface driver =
cdc_acm
<br>[ =C2=A0=C2=A0=C2=A00.582843] cdc_acm: USB Abstract Control Model drive=
r for USB modems and ISDN adapters
<br>[ =C2=A0=C2=A0=C2=A00.583872] usbcore: registered new interface driver =
uas
<br>[ =C2=A0=C2=A0=C2=A00.584212] usbcore: registered new interface driver =
usb-storage
<br>[ =C2=A0=C2=A0=C2=A00.584797] usbcore: registered new interface driver =
cp210x
<br>[ =C2=A0=C2=A0=C2=A00.585143] usbserial: USB Serial support registered =
for cp210x
<br>[ =C2=A0=C2=A0=C2=A00.585439] usbcore: registered new interface driver =
pl2303
<br>[ =C2=A0=C2=A0=C2=A00.585628] usbserial: USB Serial support registered =
for pl2303
<br>[ =C2=A0=C2=A0=C2=A00.591320] mousedev: PS/2 mouse device common for al=
l mice
<br>[ =C2=A0=C2=A0=C2=A00.591580] usbcore: registered new interface driver =
xpad
<br>[ =C2=A0=C2=A0=C2=A00.591790] usbcore: registered new interface driver =
usb_acecad
<br>[ =C2=A0=C2=A0=C2=A00.592003] usbcore: registered new interface driver =
aiptek
<br>[ =C2=A0=C2=A0=C2=A00.592267] usbcore: registered new interface driver =
hanwang
<br>[ =C2=A0=C2=A0=C2=A00.592478] usbcore: registered new interface driver =
kbtab
<br>[ =C2=A0=C2=A0=C2=A00.592943] usbcore: registered new interface driver =
usbtouchscreen
<br>[ =C2=A0=C2=A0=C2=A00.596243] i2c_dev: i2c /dev entries driver
<br>[ =C2=A0=C2=A0=C2=A00.599617] ir_imon_decoder: IR iMON protocol handler=
 initialized
<br>[ =C2=A0=C2=A0=C2=A00.599754] IR JVC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.599866] IR MCE Keyboard/mouse protocol handler in=
itialized
<br>[ =C2=A0=C2=A0=C2=A00.600007] IR NEC protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.600119] IR RC5(x/sz) protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.600277] IR RC6 protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.600386] IR RCMM protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.600537] IR SANYO protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.600679] IR Sharp protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.600828] IR Sony protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.600970] IR XMP protocol handler initialized
<br>[ =C2=A0=C2=A0=C2=A00.602445] usbcore: registered new interface driver =
uvcvideo
<br>[ =C2=A0=C2=A0=C2=A00.604269] device-mapper: uevent: version 1.0.3
<br>[ =C2=A0=C2=A0=C2=A00.605494] device-mapper: ioctl: 4.48.0-ioctl (2023-=
03-01) initialised: <a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank=
">dm-devel@redhat.com</a>
<br>[ =C2=A0=C2=A0=C2=A00.607202] Bluetooth: HCI UART driver ver 2.3
<br>[ =C2=A0=C2=A0=C2=A00.607385] Bluetooth: HCI UART protocol H4 registere=
d
<br>[ =C2=A0=C2=A0=C2=A00.608478] Bluetooth: HCI UART protocol Broadcom reg=
istered
<br>[ =C2=A0=C2=A0=C2=A00.609583] sdhci: Secure Digital Host Controller Int=
erface driver
<br>[ =C2=A0=C2=A0=C2=A00.609699] sdhci: Copyright(c) Pierre Ossman
<br>[ =C2=A0=C2=A0=C2=A00.610073] sdhci-pltfm: SDHCI platform and OF driver=
 helper
<br>[ =C2=A0=C2=A0=C2=A00.611758] ledtrig-cpu: registered to indicate activ=
ity on CPUs
<br>[ =C2=A0=C2=A0=C2=A00.615166] hid: raw HID events driver (C) Jiri Kosin=
a
<br>[ =C2=A0=C2=A0=C2=A00.625886] usbcore: registered new interface driver =
usbhid
<br>[ =C2=A0=C2=A0=C2=A00.626055] usbhid: USB HID core driver
<br>[ =C2=A0=C2=A0=C2=A00.629897] ashmem: initialized
<br>[ =C2=A0=C2=A0=C2=A00.631207] SPI driver st-accel-spi has no spi_device=
_id for st,lis302dl-spi
<br>[ =C2=A0=C2=A0=C2=A00.631408] SPI driver st-accel-spi has no spi_device=
_id for st,lis3lv02dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.631612] SPI driver st-accel-spi has no spi_device=
_id for st,lis3dh-accel
<br>[ =C2=A0=C2=A0=C2=A00.631804] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330d-accel
<br>[ =C2=A0=C2=A0=C2=A00.631999] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.632222] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330dlc-accel
<br>[ =C2=A0=C2=A0=C2=A00.632415] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dlh-accel
<br>[ =C2=A0=C2=A0=C2=A00.632620] SPI driver st-accel-spi has no spi_device=
_id for st,lsm330-accel
<br>[ =C2=A0=C2=A0=C2=A00.632804] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303agr-accel
<br>[ =C2=A0=C2=A0=C2=A00.632998] SPI driver st-accel-spi has no spi_device=
_id for st,lis2dh12-accel
<br>[ =C2=A0=C2=A0=C2=A00.633228] SPI driver st-accel-spi has no spi_device=
_id for st,lng2dm-accel
<br>[ =C2=A0=C2=A0=C2=A00.633403] SPI driver st-accel-spi has no spi_device=
_id for st,h3lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.633602] SPI driver st-accel-spi has no spi_device=
_id for st,lis331dl-accel
<br>[ =C2=A0=C2=A0=C2=A00.633794] SPI driver st-accel-spi has no spi_device=
_id for st,lsm303c-accel
<br>[ =C2=A0=C2=A0=C2=A00.638237] SPI driver st-magn-spi has no spi_device_=
id for st,lis3mdl-magn
<br>[ =C2=A0=C2=A0=C2=A00.638436] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303agr-magn
<br>[ =C2=A0=C2=A0=C2=A00.638621] SPI driver st-magn-spi has no spi_device_=
id for st,lsm9ds1-magn
<br>[ =C2=A0=C2=A0=C2=A00.638884] SPI driver st-magn-spi has no spi_device_=
id for st,lsm303c-magn
<br>[ =C2=A0=C2=A0=C2=A00.656684] hw perfevents: enabled with armv8_pmuv3 P=
MU driver, 7 counters available
<br>[ =C2=A0=C2=A0=C2=A00.660735] usbcore: registered new interface driver =
snd-usb-audio
<br>[ =C2=A0=C2=A0=C2=A00.668585] Mirror/redirect action on
<br>[ =C2=A0=C2=A0=C2=A00.669031] netem: version 1.3
<br>[ =C2=A0=C2=A0=C2=A00.669155] u32 classifier
<br>[ =C2=A0=C2=A0=C2=A00.669252] =C2=A0=C2=A0=C2=A0=C2=A0input device chec=
k on
<br>[ =C2=A0=C2=A0=C2=A00.669365] =C2=A0=C2=A0=C2=A0=C2=A0Actions configure=
d
<br>[ =C2=A0=C2=A0=C2=A00.679397] xt_time: kernel timezone is -0000
<br>[ =C2=A0=C2=A0=C2=A00.679908] gre: GRE over IPv4 demultiplexor driver
<br>[ =C2=A0=C2=A0=C2=A00.680074] IPv4 over IPsec tunneling driver
<br>[ =C2=A0=C2=A0=C2=A00.684348] Initializing XFRM netlink socket
<br>[ =C2=A0=C2=A0=C2=A00.684688] IPsec XFRM device driver
<br>[ =C2=A0=C2=A0=C2=A00.685605] NET: Registered PF_INET6 protocol family
<br>[ =C2=A0=C2=A0=C2=A00.697074] Segment Routing with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.697747] In-situ OAM (IOAM) with IPv6
<br>[ =C2=A0=C2=A0=C2=A00.699188] mip6: Mobile IPv6
<br>[ =C2=A0=C2=A0=C2=A00.702708] sit: IPv6, IPv4 and MPLS over IPv4 tunnel=
ing driver
<br>[ =C2=A0=C2=A0=C2=A00.707357] NET: Registered PF_PACKET protocol family
<br>[ =C2=A0=C2=A0=C2=A00.707660] NET: Registered PF_KEY protocol family
<br>[ =C2=A0=C2=A0=C2=A00.707937] Key type dns_resolver registered
<br>[ =C2=A0=C2=A0=C2=A00.803914] registered taskstats version 1
<br>[ =C2=A0=C2=A0=C2=A00.805916] Loading compiled-in X.509 certificates
<br>[ =C2=A0=C2=A0=C2=A00.848609] Key type .fscrypt registered
<br>[ =C2=A0=C2=A0=C2=A00.848773] Key type fscrypt-provisioning registered
<br>[ =C2=A0=C2=A0=C2=A00.859321] of_cfs_init
<br>[ =C2=A0=C2=A0=C2=A00.859798] of_cfs_init: OK
<br>[ =C2=A0=C2=A0=C2=A00.863651] cfg80211: Loading compiled-in X.509 certi=
ficates for regulatory database
<br>[ =C2=A0=C2=A0=C2=A00.916241] Freeing initrd memory: 131072K
<br>[ =C2=A0=C2=A0=C2=A00.939884] Loaded X.509 cert &#39;<a href=3D"mailto:=
benh@debian.org" target=3D"_blank">benh@debian.org</a>: 577e021cb980e0e8208=
21ba7b54b4961b8b4fadf&#39;
<br>[ =C2=A0=C2=A0=C2=A00.940856] Loaded X.509 cert &#39;<a href=3D"mailto:=
romain.perier@gmail.com" target=3D"_blank">romain.perier@gmail.com</a>: 3ab=
bc6ec146e09d1b6016ab9d6cf71dd233f0328&#39;
<br>[ =C2=A0=C2=A0=C2=A00.941666] Loaded X.509 cert &#39;sforshee: 00b28ddf=
47aef9cea7&#39;
<br>[ =C2=A0=C2=A0=C2=A00.942389] Loaded X.509 cert &#39;wens: 61c038651aab=
dcf94bd0ac7ff06c7248db18c600&#39;
<br>[ =C2=A0=C2=A0=C2=A00.947949] clk: Disabling unused clocks
<br>[ =C2=A0=C2=A0=C2=A00.948468] ALSA device list:
<br>[ =C2=A0=C2=A0=C2=A00.948637] =C2=A0=C2=A0No soundcards found.
<br>[ =C2=A0=C2=A0=C2=A00.956833] uart-pl011 9000000.pl011: no DMA platform=
 data
<br>[ =C2=A0=C2=A0=C2=A00.958235] Waiting 5 sec before mounting root device=
...
<br>[ =C2=A0=C2=A0=C2=A06.141721] RAMDISK: Couldn&#39;t find valid RAM disk=
 image starting at 0.
<br>[ =C2=A0=C2=A0=C2=A06.143086] Waiting for root device ...
<br>[ =C2=A0=C2=A0=C2=A06.145568] /dev/root: Can&#39;t open blockdev
<br>[ =C2=A0=C2=A0=C2=A06.146341] VFS: Cannot open root device &quot;&quot;=
 or unknown-block(0,0): error -6
<br>[ =C2=A0=C2=A0=C2=A06.146477] Please append a correct &quot;root=3D&quo=
t; boot option; here are the available partitions:
<br>[ =C2=A0=C2=A0=C2=A06.146949] 0100 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram0 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.147=
047] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.147226] 0101 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram1 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.147=
239] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.147355] 0102 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram2 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.147=
366] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.147480] 0103 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram3 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.147=
491] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.147618] 0104 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram4 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.147=
629] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.147755] 0105 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram5 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.147=
765] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.147893] 0106 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram6 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.147=
903] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.148029] 0107 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram7 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.148=
040] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.148172] 0108 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram8 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.148=
182] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.148307] 0109 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram9 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.148=
317] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.148442] 010a =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram10 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.14=
8452] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.148580] 010b =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram11 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.14=
8590] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.148716] 010c =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram12 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.14=
8726] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.148853] 010d =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram13 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.14=
8863] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.148990] 010e =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram14 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.14=
9001] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.149127] 010f =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08192 ram15 =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.14=
9140] =C2=A0(driver?)
<br>[ =C2=A0=C2=A0=C2=A06.149334] List of all bdev filesystems:
<br>[ =C2=A0=C2=A0=C2=A06.149419] =C2=A0ext3
<br>[ =C2=A0=C2=A0=C2=A06.149443] =C2=A0ext2
<br>[ =C2=A0=C2=A0=C2=A06.149490] =C2=A0ext4
<br>[ =C2=A0=C2=A0=C2=A06.149535] =C2=A0vfat
<br>[ =C2=A0=C2=A0=C2=A06.149581] =C2=A0msdos
<br>[ =C2=A0=C2=A0=C2=A06.149617] =C2=A0exfat
<br>[ =C2=A0=C2=A0=C2=A06.149662] =C2=A0fuseblk
<br>[ =C2=A0=C2=A0=C2=A06.149707] =C2=A0f2fs
<br>[ =C2=A0=C2=A0=C2=A06.149765] =C2=A0<br>[ =C2=A0=C2=A0=C2=A06.149982] K=
ernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,=
0)<br></span></div><div><span style=3D"font-family:monospace"><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">[ =C2=A0=C2=A0=C2=
=A06.150325] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.6.36-g01aac93821d2=
-v8 #1
</span><br>[ =C2=A0=C2=A0=C2=A06.150570] Hardware name: linux,dummy-virt (D=
T)
<br>[ =C2=A0=C2=A0=C2=A06.150851] Call trace:
<br>[ =C2=A0=C2=A0=C2=A06.150936] =C2=A0dump_backtrace+0x104/0x124
<br>[ =C2=A0=C2=A0=C2=A06.151104] =C2=A0show_stack+0x28/0x38
<br>[ =C2=A0=C2=A0=C2=A06.151193] =C2=A0dump_stack_lvl+0x58/0x78
<br>[ =C2=A0=C2=A0=C2=A06.151286] =C2=A0dump_stack+0x20/0x30
<br>[ =C2=A0=C2=A0=C2=A06.151367] =C2=A0panic+0x148/0x35c
<br>[ =C2=A0=C2=A0=C2=A06.151443] =C2=A0mount_root_generic+0x2ac/0x2f0
<br>[ =C2=A0=C2=A0=C2=A06.151544] =C2=A0mount_block_root+0x60/0x78
<br>[ =C2=A0=C2=A0=C2=A06.151637] =C2=A0mount_root+0x84/0x98
<br>[ =C2=A0=C2=A0=C2=A06.151718] =C2=A0prepare_namespace+0x90/0xd4
<br>[ =C2=A0=C2=A0=C2=A06.151811] =C2=A0kernel_init_freeable+0xfc/0x14c
<br>[ =C2=A0=C2=A0=C2=A06.151909] =C2=A0kernel_init+0x30/0x1bc
<br>[ =C2=A0=C2=A0=C2=A06.151994] =C2=A0ret_from_fork+0x10/0x20
<br>[ =C2=A0=C2=A0=C2=A06.152268] SMP: stopping secondary CPUs
<br>[ =C2=A0=C2=A0=C2=A06.152632] Kernel Offset: 0x1cc3200000 from 0xffffff=
c080000000
<br>[ =C2=A0=C2=A0=C2=A06.152773] PHYS_OFFSET: 0x40000000
<br>[ =C2=A0=C2=A0=C2=A06.152869] CPU features: 0x000000,80000201,3c020000,=
0000421b
<br>[ =C2=A0=C2=A0=C2=A06.153149] Memory Limit: none
<br>[ =C2=A0=C2=A0=C2=A06.153518] Rebooting in 5 seconds..<br>
<br><br></span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Aug 24, 2024 at 10:36=E2=80=AFPM Peter Maydell=
 &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.ma=
ydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Sat, 24 Aug 2024 at 17:12, Mario Marietto &lt;<a href=3D=
"mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a=
>&gt; wrote:<br>
&gt; I want to emulate Android 14 by KonstaKang using qemu-system-aarch64 a=
nd as model virt on Ubuntu 24.04 x64 bit installed on my PC (Intel I9 + RTX=
 2080 ti).<br>
<br>
<br>
So first up, this is as far as I know &quot;uncharted territory&quot;<br>
in that I&#39;m not aware of anybody who&#39;s booted full Android on<br>
any (upstream) QEMU board model. (If there&#39;s anybody on-list<br>
who *has* done this, please speak up!)<br>
<br>
It would be interesting to see if it can be done, but it is<br>
I suspect unlikely to work &quot;out of the box&quot;, especially more<br>
complex stuff like accelerated graphics. You&#39;ll want to be<br>
prepared to fiddle around, diagnose boot-failures, maybe<br>
rebuild the kernel, etc.<br>
<br>
&gt; I&#39;ve chosen the parameters to boot it,according with the files pro=
vided by that version of Android,that you can find here :<br>
&gt;<br>
&gt; <a href=3D"https://konstakang.com/devices/rpi4/AOSP14/" rel=3D"norefer=
rer" target=3D"_blank">https://konstakang.com/devices/rpi4/AOSP14/</a><br>
&gt;<br>
&gt; This is the command issued with the parameters embedded :<br>
<br>
I don&#39;t have any solid ideas, but:<br>
<br>
&gt; qemu-system-aarch64 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-m 2048 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-cpu cortex-a72 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-M virt,gic-version=3D2 \<br>
<br>
^^ this says to QEMU &quot;boot the &#39;virt&#39; board&quot;...<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-drive if=3Dpflash,format=3Draw,file=3D/usr/local/s=
hare/qemu/edk2-aarch64-code.fd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-drive if=3Dpflash,format=3Draw,file=3D/usr/local/s=
hare/qemu/edk2-arm-vars.fd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-kernel /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20=
240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-append &#39;console=3DttyAMA0,38400 keep_bootcon e=
arlycon=3Dpl011,0x9000000 androidboot.hardware=3Dranchu root=3D/dev/vdd1&#3=
9; \<br>
<br>
^^^ but this looks like it&#39;s saying to the kernel (or perhaps to<br>
Android later boot) &quot;you&#39;re booting on the &#39;ranchu&#39; board&=
quot;.<br>
<br>
Is this image supposed to work on &quot;virt&quot; ?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-drive file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-2=
1.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/lineage-21.0-20240618-UNOFFICIA=
L-KonstaKANG-rpi4-atv.img,format=3Draw,index=3D0,media=3Ddisk \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device virtio-gpu-pci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device qemu-xhci \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device usb-kbd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device usb-mouse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-netdev user,id=3Dmynet \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device virtio-net-pci,netdev=3Dmynet \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-serial stdio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-no-reboot \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-d guest_errors \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-smp cores=3D4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device qemu-xhci,id=3Dxhci,addr=3D0x5 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device usb-mouse,bus=3Dxhci.0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device usb-kbd,bus=3Dxhci.0<br>
&gt;<br>
&gt; Where did I found the kernel &quot;Image&quot; ? here :<br>
&gt;<br>
&gt; <a href=3D"https://dlupload.com/filedetail/377203177" rel=3D"noreferre=
r" target=3D"_blank">https://dlupload.com/filedetail/377203177</a><br>
&gt;<br>
&gt; This is the boot log :<br>
&gt;<br>
&gt; EFI stub: Booting Linux Kernel...<br>
&gt; EFI stub: EFI_RNG_PROTOCOL unavailable<br>
&gt; EFI stub: Generating empty DTB<br>
&gt; EFI stub: Exiting boot services...<br>
&gt; [=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x0000000000 [0=
x410fd083]<br>
&gt; [=C2=A0 =C2=A0 0.000000] Linux version 6.6.36-g01aac93821d2-v8 (kleaf@=
build-host) (Android (11368308, +pgo, +bolt, +lto, +mlgo, based on r510928)=
 clang version 18.0.0 (<a href=3D"https://android.googlesource.com/toolchai=
n/llvm-project" rel=3D"noreferrer" target=3D"_blank">https://android.google=
source.com/toolchain/llvm-project</a> 477610d4d0d988e69dbc3fae4fe86bff3f07f=
2b5), LLD 18.0.0) #1 SMP PREEMPT Tue Jul=C2=A0 2 09:02:32 UTC 2024<br>
&gt; [=C2=A0 =C2=A0 0.000000] KASLR disabled due to lack of seed<br>
&gt; [=C2=A0 =C2=A0 0.000000] printk: debug: skip boot console de-registrat=
ion.<br>
&gt; [=C2=A0 =C2=A0 0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (op=
tions &#39;&#39;)<br>
&gt; [=C2=A0 =C2=A0 0.000000] printk: bootconsole [pl11] enabled<br>
&gt; [=C2=A0 =C2=A0 0.000000] efi: EFI v2.7 by EDK II<br>
&gt; [=C2=A0 =C2=A0 0.000000] efi: SMBIOS 3.0=3D0xbfed0000 MEMATTR=3D0xbd0a=
0018 ACPI 2.0=3D0xbc6f0018 MEMRESERVE=3D0xbcb43f18<br>
&gt; [=C2=A0 =C2=A0 0.000000] Zone ranges:<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0DMA=C2=A0 =C2=A0 =C2=A0 [mem 0x00=
00000040000000-0x00000000bfffffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0DMA32=C2=A0 =C2=A0 empty<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0Normal=C2=A0 =C2=A0empty<br>
&gt; [=C2=A0 =C2=A0 0.000000] Movable zone start for each node<br>
&gt; [=C2=A0 =C2=A0 0.000000] NoSplit zone start for each node<br>
&gt; [=C2=A0 =C2=A0 0.000000] NoMerge zone start for each node<br>
&gt; [=C2=A0 =C2=A0 0.000000] Early memory node ranges<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x000000=
0040000000-0x00000000bc76ffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x000000=
00bc770000-0x00000000bcb3ffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x000000=
00bcb40000-0x00000000bfe1ffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x000000=
00bfe20000-0x00000000bfeaffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x000000=
00bfeb0000-0x00000000bfebffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x000000=
00bfec0000-0x00000000bffdffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0node=C2=A0 =C2=A00: [mem 0x000000=
00bffe0000-0x00000000bfffffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000] Initmem setup node 0 [mem 0x0000000040000000-=
0x00000000bfffffff]<br>
&gt; [=C2=A0 =C2=A0 0.000000] cma: Reserved 8 MiB at 0x00000000bbc00000 on =
node -1<br>
&gt; [=C2=A0 =C2=A0 0.000000] Failed to find device node for boot cpu<br>
&gt; [=C2=A0 =C2=A0 0.000000] missing boot CPU MPIDR, not enabling secondar=
ies<br>
<br>
These error messages hint at a problem where the kernel is using the<br>
device tree (which UEFI has said it&#39;s providing as &quot;empty&quot;) r=
ather<br>
than the ACPI tables.<br>
<br>
&gt; [=C2=A0 =C2=A0 0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d3=
1768 u126976<br>
&gt; [=C2=A0 =C2=A0 0.000000] Detected PIPT I-cache on CPU0<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU features: detected: Spectre-v2<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU features: detected: Spectre-v3a<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU features: detected: Spectre-v4<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU features: detected: Spectre-BHB<br>
&gt; [=C2=A0 =C2=A0 0.000000] CPU features: detected: ARM erratum 1742098<b=
r>
&gt; [=C2=A0 =C2=A0 0.000000] CPU features: detected: ARM errata 1165522, 1=
319367, or 1530923<br>
&gt; [=C2=A0 =C2=A0 0.000000] alternatives: applying boot alternatives<br>
&gt; [=C2=A0 =C2=A0 0.000000] Kernel command line: console=3DttyAMA0,38400 =
keep_bootcon earlycon=3Dpl011,0x9000000 androidboot.hardware=3Dranchu root=
=3D/dev/vdd1 androidboot.serialno=3D10000000abcd1234 androidboot.btmacaddr=
=3D11:22:33:44:55:66<br>
&gt; [=C2=A0 =C2=A0 0.000000] Dentry cache hash table entries: 262144 (orde=
r: 9, 2097152 bytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Inode-cache hash table entries: 131072 (order=
: 8, 1048576 bytes, linear)<br>
&gt; [=C2=A0 =C2=A0 0.000000] Built 1 zonelists, mobility grouping on.=C2=
=A0 Total pages: 516096<br>
&gt; [=C2=A0 =C2=A0 0.000000] mem auto-init: stack:all(zero), heap alloc:of=
f, heap free:off<br>
&gt; [=C2=A0 =C2=A0 0.000000] Memory: 2008408K/2097152K available (19328K k=
ernel code, 2374K rwdata, 7612K rodata, 1792K init, 1192K bss, 80552K reser=
ved, 8192K cma-reserved)<br>
&gt; [=C2=A0 =C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D1, Nodes=3D1<br>
&gt; [=C2=A0 =C2=A0 0.000000] ftrace: allocating 56269 entries in 220 pages=
<br>
&gt; [=C2=A0 =C2=A0 0.000000] ftrace: allocated 220 pages with 5 groups<br>
&gt; [=C2=A0 =C2=A0 0.000000] trace event string verifier disabled<br>
&gt; [=C2=A0 =C2=A0 0.000000] rcu: Preemptible hierarchical RCU implementat=
ion.<br>
&gt; [=C2=A0 =C2=A0 0.000000] rcu:=C2=A0 =C2=A0 =C2=A0RCU event tracing is =
enabled.<br>
&gt; [=C2=A0 =C2=A0 0.000000] rcu:=C2=A0 =C2=A0 =C2=A0RCU restricting CPUs =
from NR_CPUS=3D256 to nr_cpu_ids=3D1.<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 Trampoline variant of Tasks RCU enabled=
.<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 Rude variant of Tasks RCU enabled.<br>
&gt; [=C2=A0 =C2=A0 0.000000]=C2=A0 Tracing variant of Tasks RCU enabled.<b=
r>
&gt; [=C2=A0 =C2=A0 0.000000] rcu: RCU calculated value of scheduler-enlist=
ment delay is 25 jiffies.<br>
&gt; [=C2=A0 =C2=A0 0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=
=3D16, nr_cpu_ids=3D1<br>
&gt; [=C2=A0 =C2=A0 0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: =
0<br>
&gt; [=C2=A0 =C2=A0 0.000000] rcu: srcu_init: Setting srcu_struct sizes bas=
ed on contention.<br>
&gt; [=C2=A0 =C2=A0 0.000000] timer_probe: no matching timers found<br>
<br>
This one is also vaguely suggestive of a similar issue.<br>
<br>
Is the kernel expecting to be booted via UEFI ? Or does it<br>
insist on a device tree? If the latter, try not using UEFI.<br>
<br>
More generally, if the kernel wasn&#39;t built to run on the &quot;virt&quo=
t;<br>
board you may find it is missing device drivers that the virt<br>
board needs. You&#39;ll find the .config file for the kernel<br>
helpful in diagnosing this, and you might need to rebuild<br>
your own kernel.<br>
<br>
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

--0000000000008b2e9206207fb4df--

--0000000000008b2e9306207fb4e0
Content-Type: image/jpeg; name="unnamed.jpg"
Content-Disposition: inline; filename="unnamed.jpg"
Content-Transfer-Encoding: base64
Content-ID: <ii_m08sj4fw0>
X-Attachment-Id: ii_m08sj4fw0

/9j/4AAQSkZJRgABAQAAAQABAAD/4gv4SUNDX1BST0ZJTEUAAQEAAAvoAAAAAAIAAABtbnRyUkdC
IFhZWiAH2QADABsAFQAkAB9hY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAA9tYAAQAA
AADTLQAAAAAp+D3er/JVrnhC+uTKgzkNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBk
ZXNjAAABRAAAAHliWFlaAAABwAAAABRiVFJDAAAB1AAACAxkbWRkAAAJ4AAAAIhnWFlaAAAKaAAA
ABRnVFJDAAAB1AAACAxsdW1pAAAKfAAAABRtZWFzAAAKkAAAACRia3B0AAAKtAAAABRyWFlaAAAK
yAAAABRyVFJDAAAB1AAACAx0ZWNoAAAK3AAAAAx2dWVkAAAK6AAAAId3dHB0AAALcAAAABRjcHJ0
AAALhAAAADdjaGFkAAALvAAAACxkZXNjAAAAAAAAAB9zUkdCIElFQzYxOTY2LTItMSBibGFjayBz
Y2FsZWQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAWFlaIAAAAAAAACSgAAAPhAAAts9jdXJ2AAAA
AAAABAAAAAAFAAoADwAUABkAHgAjACgALQAyADcAOwBAAEUASgBPAFQAWQBeAGMAaABtAHIAdwB8
AIEAhgCLAJAAlQCaAJ8ApACpAK4AsgC3ALwAwQDGAMsA0ADVANsA4ADlAOsA8AD2APsBAQEHAQ0B
EwEZAR8BJQErATIBOAE+AUUBTAFSAVkBYAFnAW4BdQF8AYMBiwGSAZoBoQGpAbEBuQHBAckB0QHZ
AeEB6QHyAfoCAwIMAhQCHQImAi8COAJBAksCVAJdAmcCcQJ6AoQCjgKYAqICrAK2AsECywLVAuAC
6wL1AwADCwMWAyEDLQM4A0MDTwNaA2YDcgN+A4oDlgOiA64DugPHA9MD4APsA/kEBgQTBCAELQQ7
BEgEVQRjBHEEfgSMBJoEqAS2BMQE0wThBPAE/gUNBRwFKwU6BUkFWAVnBXcFhgWWBaYFtQXFBdUF
5QX2BgYGFgYnBjcGSAZZBmoGewaMBp0GrwbABtEG4wb1BwcHGQcrBz0HTwdhB3QHhgeZB6wHvwfS
B+UH+AgLCB8IMghGCFoIbgiCCJYIqgi+CNII5wj7CRAJJQk6CU8JZAl5CY8JpAm6Cc8J5Qn7ChEK
Jwo9ClQKagqBCpgKrgrFCtwK8wsLCyILOQtRC2kLgAuYC7ALyAvhC/kMEgwqDEMMXAx1DI4MpwzA
DNkM8w0NDSYNQA1aDXQNjg2pDcMN3g34DhMOLg5JDmQOfw6bDrYO0g7uDwkPJQ9BD14Peg+WD7MP
zw/sEAkQJhBDEGEQfhCbELkQ1xD1ERMRMRFPEW0RjBGqEckR6BIHEiYSRRJkEoQSoxLDEuMTAxMj
E0MTYxODE6QTxRPlFAYUJxRJFGoUixStFM4U8BUSFTQVVhV4FZsVvRXgFgMWJhZJFmwWjxayFtYW
+hcdF0EXZReJF64X0hf3GBsYQBhlGIoYrxjVGPoZIBlFGWsZkRm3Gd0aBBoqGlEadxqeGsUa7BsU
GzsbYxuKG7Ib2hwCHCocUhx7HKMczBz1HR4dRx1wHZkdwx3sHhYeQB5qHpQevh7pHxMfPh9pH5Qf
vx/qIBUgQSBsIJggxCDwIRwhSCF1IaEhziH7IiciVSKCIq8i3SMKIzgjZiOUI8Ij8CQfJE0kfCSr
JNolCSU4JWgllyXHJfcmJyZXJocmtyboJxgnSSd6J6sn3CgNKD8ocSiiKNQpBik4KWspnSnQKgIq
NSpoKpsqzysCKzYraSudK9EsBSw5LG4soizXLQwtQS12Last4S4WLkwugi63Lu4vJC9aL5Evxy/+
MDUwbDCkMNsxEjFKMYIxujHyMioyYzKbMtQzDTNGM38zuDPxNCs0ZTSeNNg1EzVNNYc1wjX9Njc2
cjauNuk3JDdgN5w31zgUOFA4jDjIOQU5Qjl/Obw5+To2OnQ6sjrvOy07azuqO+g8JzxlPKQ84z0i
PWE9oT3gPiA+YD6gPuA/IT9hP6I/4kAjQGRApkDnQSlBakGsQe5CMEJyQrVC90M6Q31DwEQDREdE
ikTORRJFVUWaRd5GIkZnRqtG8Ec1R3tHwEgFSEtIkUjXSR1JY0mpSfBKN0p9SsRLDEtTS5pL4kwq
THJMuk0CTUpNk03cTiVObk63TwBPSU+TT91QJ1BxULtRBlFQUZtR5lIxUnxSx1MTU19TqlP2VEJU
j1TbVShVdVXCVg9WXFapVvdXRFeSV+BYL1h9WMtZGllpWbhaB1pWWqZa9VtFW5Vb5Vw1XIZc1l0n
XXhdyV4aXmxevV8PX2Ffs2AFYFdgqmD8YU9homH1YklinGLwY0Njl2PrZEBklGTpZT1lkmXnZj1m
kmboZz1nk2fpaD9olmjsaUNpmmnxakhqn2r3a09rp2v/bFdsr20IbWBtuW4SbmtuxG8eb3hv0XAr
cIZw4HE6cZVx8HJLcqZzAXNdc7h0FHRwdMx1KHWFdeF2Pnabdvh3VnezeBF4bnjMeSp5iXnnekZ6
pXsEe2N7wnwhfIF84X1BfaF+AX5ifsJ/I3+Ef+WAR4CogQqBa4HNgjCCkoL0g1eDuoQdhICE44VH
hauGDoZyhteHO4efiASIaYjOiTOJmYn+imSKyoswi5aL/IxjjMqNMY2Yjf+OZo7OjzaPnpAGkG6Q
1pE/kaiSEZJ6kuOTTZO2lCCUipT0lV+VyZY0lp+XCpd1l+CYTJi4mSSZkJn8mmia1ZtCm6+cHJyJ
nPedZJ3SnkCerp8dn4uf+qBpoNihR6G2oiailqMGo3aj5qRWpMelOKWpphqmi6b9p26n4KhSqMSp
N6mpqhyqj6sCq3Wr6axcrNCtRK24ri2uoa8Wr4uwALB1sOqxYLHWskuywrM4s660JbSctRO1irYB
tnm28Ldot+C4WbjRuUq5wro7urW7LrunvCG8m70VvY++Cr6Evv+/er/1wHDA7MFnwePCX8Lbw1jD
1MRRxM7FS8XIxkbGw8dBx7/IPci8yTrJuco4yrfLNsu2zDXMtc01zbXONs62zzfPuNA50LrRPNG+
0j/SwdNE08bUSdTL1U7V0dZV1tjXXNfg2GTY6Nls2fHadtr724DcBdyK3RDdlt4c3qLfKd+v4Dbg
veFE4cziU+Lb42Pj6+Rz5PzlhOYN5pbnH+ep6DLovOlG6dDqW+rl63Dr++yG7RHtnO4o7rTvQO/M
8Fjw5fFy8f/yjPMZ86f0NPTC9VD13vZt9vv3ivgZ+Kj5OPnH+lf65/t3/Af8mP0p/br+S/7c/23/
/2Rlc2MAAAAAAAAALklFQyA2MTk2Ni0yLTEgRGVmYXVsdCBSR0IgQ29sb3VyIFNwYWNlIC0gc1JH
QgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAABYWVogAAAAAAAAYpkAALeFAAAY2lhZWiAAAAAAAAAAAABQ
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
PA+F8m0H0OLsAeB8L5NoPocXYA8D4XybQfQ4uwB4Hwvk2g+hxdgDwPhfJtB9Di7AHgfC+TaD6HF2
APA+F8m0H0OLsAeB8L5NoPocXYBjJhGGI16+DqDU1y3Sji4l8wHSJh9BZP8AIaTYi/yaPsAvg+h+
Q0n0aPsAeD6H5DSfRo+wB4PofkNJ9Gj7AHg+h+Q0n0aPsAeD6H5DSfRo+wB4PofkNJ9Gj7AHg+h+
Q0n0aPsAeD6H5DSfRo+wB4PofkNJ9Gj7APJd06ipI9z2KvipaeN6d45XxwMY9t6qJFsqJzgfnUAA
AAAAAAAAAAAAAB7Tczj0zJsEgleqQUcFRSQoq2azSzyPc5OudbbMxoX3eeHa2KKzr03uWXsd0O6G
ChlhiexqvVuljkdtZfVdD5/svYo14m9rPo+19vtoTGnWrrtyW6qabdLhssT3qydWYfNmVVWWNVXb
0n02nTcjD5XUvv2zh+hNIbYNIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0g
DSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSAN
IA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0gDSANIA0g
DSANIA0gDSANIA0gDSANIA0gDSANIA0gDSAYvmRrXOXY1quW3EiXJM4jKxGZw8Wu6LF1oFx9JqZK
TvxzG4YsF3rTJLo1VZb7dSl9Xd3vH+U9be3fBmzdDiE+J1FIyokhginpUjjhwl9c57Hoiqjnovvd
vCWkc89UtPCMdGpd2VbBU4tFOxr4WVNRQ4Tljs59YxW2jdbjR6dBiubU4c5anEW93i24fukxN8WD
LUOjSasxupoKvLG3KjGarJ0KckYm0R4TGfkxOYrM9Jh3WC4rPU1ONxTK3R0OIxU1MjWo1UYrFVbr
6DNeNIt75+TVuF5j3Q58OK0k0stNDUxSTweOhY9HSR86COMZgnhOJePxvdZXU1fiVNFWU8KUkFK+
jo30jp5a+R7UVY0VF1bSUnMfqsxjHwd7HujnWoZQ+D5nVDKKlq61ySMjhpI3pdVcrl4Neo1OOM+E
MxnEdZcSj3d0dRKyNsaoyVtQtM5s8Usz8l7o6Jrszb2W1yeGf1XHHH6Mod2sT6Wpr1p/0MDGPRsd
ZTzTuzOsiPY112+kTwwRxl22FYt35A6oyRsaj3MRIauGsa5ERFujo1XjFuEZSOM4dXg9fiuJZq5l
XT0tG3EJKeOjWm00ssTHWcqvvqXUojhWJnxW3Oax4NVBuqrFZjM9VQq2nwyqnjR7JokVqMRFSNUv
dV1kifQi0rj092Gbt0FZJUYJ/k76Gmr56hXtqHRPlngSFXo6yL701ytMT4QznNc16w34tuogbRS1
GG1EFTM6eOkplY5HxpUuVERF6TM54RHi1GOMz4OtZulrnUdC5z42VqbpabCcQRjWuYqK9UWyedLG
oxNq45SxOYrfPOHNwbdJUzOxR9fA2kpaGvmgWqknibHCiWsxyXuq69pms+hFpbtGLzWEq8fmqquC
hwyqp4oVw6XEp8SdH301IGrazGIuvag6zPKDpjxdjguJJU0rpmVjMQcyeWJZoaZaRHuREVGq13Dr
QtuEZZjnh1GHbr6jvOsr8Qo3Rw09XJBG+KSNyzSaTK2NGo699aa9gjlXrK/3THhDt8Nxtamapo56
WWjrKRsb5qeV7JbRu2KjmqXnGYTxw62TdzRMqVpst2NrmUEk3fETZEnVbIqRK7Mrdaa7Ep6eMeK3
9HOfBy6fdIk1Y/DG0k6VcUkmna6yRw06JdJldxLqJHGs2LcJw6eLdViF8KbBTyVvfuI11PIrlihe
/IrkRjLrq2bVLXjMR7sluGfjEPR4tjLaCFkskT5ZJJYoIqaFzXPfM9URGot7Dx3YI9Xel1sm69sc
GJzz0U8LsKmp4aiBz2PkdJIqIiIqLbhGeETHjOCI47vuyyr91ElHFHNVUKU6yNfI2GpxCmhnWJER
UVGq7at9gnhOJK8YzDhu3U1L62mWkp5qqlqNzjsTbSs0UciOSSyuc9y8Vx6u/nwwc4rjxmXocNxO
OtpoKyHMkVRFpGI9LObrVFRehS2jE4SJy5ekIppAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAa
QBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpA
GkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAa
QBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkAaQBpAGkA1zS2jkX/VPX6lA86yqTK3+qn2AczD
2UlTHUyz1yQOghkkSKJbup2NcjVklT0pq4gOGyrRcyZ2PyvczSRLmikstrtUCurGNRXOcjWol1c5
bIiedVA1sxOncqNZNE5y7GtkRzl5kRQNvfSAWnlpLtqKyqpmty1DWUs9DUVLEYj8ukVWL/QUCTSo
2RFWmiplbNiFN+gY+OKobFKxqPRHL/WAwlqUVrkR1lVq61VUt6QOxlo4m0nhG1R3vJEjoqJ10khe
qqiOc/4vCB4LulTX3O4m291y0N14/wDKo+wD89AAAAAAAAAAAAAAAAPozNxNTWbncGxjD43TSthr
oqyBiXkc1tXNleiAefxKqlqqamgqGSd+0ciwpmY7SSQqmpFTzWU6ejs/c6tpp6tvN3tfae/0axf1
q+T0/cooIUxxja1HRT09O+alhkblV01ktdF8yqp3HRfoLMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDM
oDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMo
DMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoD
MoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDMoDM
oDMoDMoDMoDMoC6/9gPOzbkaZXQpDNMylbiDaupw2aZzsOmS91RGol012UV4THuLcYn3uc7AKbvq
etbU4lDLUTslmZR1jaenky2REVuTzCvAni302E0cCzPZFpHzYm/E1dUq2XR1KoiIrEVNWwRwiK/H
5k8Zmfh8nFfucoXU8VKi1LEhrJa6Kdk6NqY6hy3VWuRo6Y8OB197mYbhtNQxyxU2mc6eodU1VRVS
6apqJlS11WxfCITxy5Tfe3yo1uZbuVrWor+dUQiuPSUUVPU1ldEsyVNcyCOZ2ktGjI0siIiII4V3
YJ4zEpHQQNqKqs/SOnq4IqeZXPRYtG29kRLedSY9Ga9V8Yno4tBgVNRojYJ69kbNKsNM2pa2nhV9
72s2/CvCXwwnjljDuepY1nlSor3VM8TIXVbqiPTMjRb2bZn23Hhg97lYbhdNQsmZT6Vz6ioWpqZ6
h7XySyWRNjWoibB4YPHLiwbnqOKZ08U1fC11QlTJSU1Xo6OSS91VW28wrw4E8R256id4QTPVtZiS
vWphZUNSnR7kRFe1qt26iY9HC547zlyYbTPloJnJL/m5r20jUkS2uPJ7/Vr1Gs8Zt1ZiMV3WFdg9
FWLTd9w6WGlkdLHSJZlM+RUsivaiayeOV8MOJHuXwtj88cUsLfCFLXpT00jYqZs0V8qo3L59ZYnG
EmMxMdeDl0uE01PLVzxrUKtZM6eanfM19HpVtdyMVu3VxkjhG6s8bZYYhg1NWSQzvfPTzwNVkNRQ
yJTzMjXa3ZsJynJ4Yb8Ow+noYVp6bSq11RLUyyVMulmlmfbM5VRE4kL4RHQ8ZlwfczQLDV0zlqnQ
1cumfC6oTQwSZs2eNMupb2HKIjovjM9XLw/DKejWeSN1TPU1Ss75q62ZJp3tbsaioiai+GGceLTD
gVLHNJURy1sOlqW1U0FPO2OCWVFRbrdt+BNikr6K24kWAUMc6Vqd89+LUSzzVSzppqjMltG5cvwd
SaiRGIxBbjxlr9zdDo6WFj6yLvOrnq4Z4ahrKhkr1VXWXLs1qXxiekYOeffxbsbw9Kyn0LWZ3Nlj
khzTrDIxzVujkeibfQSeeSOWHXUO5VqU2Iw18r3ridZBPMyGdZZY2RqioiyubrW6cRrlEe6cnjM+
7DscQwWmrJ0qpH1UMjaeWmvSzpGr4XJZWqqtUzjn7yOERHRxn7l6BdBo5K+BafDEwyF8FW1j+973
W65dZZ45z4kcMe52tLTw00MNLTM0dPTwpFCxVzusiqqqq+lSzOZzKRGG3MpFMygMygMygMygMygM
ygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMy
gMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMyg
MygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygMygM
ygMygMygMygMygMygMygMygYSormPZf4THNRedFQDzDad7UyLdFZ7xUVOFNQF0Mnv0bI9iSRLDKj
bWliVUVWrdPMgF0LgMXQOVLXVq3RUc212qi3RUunmA5NVVV9SjGVVZNOyOXTMY9kTWpJZURbtanx
lA0aFwGOgcrUY+Onla3SI1ZWzI/I5yuVq5ZEv8JQIlMueWZyM0080s00jI0Znc96uVPrArqdXIqX
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
KtyXJMfzsnaAXuVbk1//AGmP52TtAb1O5LkmP52TtAb1O5LkmP52TtAb1O5LkmP52TtAb1O5LkmP
52TtAb1O5LkmP52TtAb1O5LkmP52TtAb1O5LkmP52TtAqdyvcnyTH87J2gTep3Jckx/OydoDep3J
ckx/OydoDep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDep
3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoE3qdyXJMfzsnaA
3qdyXJMfzsnaBd6rclyTH87J2gTep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoF3qdyXJMfzs
naBN6nclyTH87J2gXep3Jckx/OydoE3qdyXJMfzsnaA3qdyXJMfzsnaA3qdyXJMfzsnaA3qdyXJM
fzsnaA3qdyXJMfzsnaA3qdyXJMfzsnaA3qdyXJMfzsnaA3qdyXJMfzsnaA3qNyXJMfzsnaA3qdyX
JMfzsnaBd6nclyTH87J2gTep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDeo3Jckx/OydoDeo
3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDeo3Jckx/OydoD
ep3Jckx/OydoDep3Jckx/OydoDeo3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDeo3Jckx/Oyd
oDep3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDeo3I8kx/OydoDeo3I8kx/OydoDep3Jckx/O
ydoDeo3Jckx/OydoDep3Jckx/OydoDep3Jckx/OydoDep3I8kx/OydoDeo3Jckx/OydoDeo3Jckx
/OydoDep3I8kx/OydoDep3I8kx/PS9oDeo3I8kx/OydoDep3I8kx/OydoDep3Jckx/OydoDeo3I8
kx/OydoDeo3Jckx/OydoDeo3Jckx/OydoDeo3Jckx/OydoDeo3I8kx/OydoDeo3Jckx/OydoDeo3
I8kx/OydoDeo3Jckx/OydoHj92ncYou9parA80M8LHSLSOXPHM1LrZFUqvhDmOY5zHorXNcrXNVL
K1UXWliqgC4AABAFwAACgT87AAAAAAAAAAAAAAAIBx67xMnq+0hEdMRAAAAAAAAAAAAAAADvMP8A
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
MBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBow
GjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAa
MBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBow
GjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowGjAaMBowIsYGOGNy1T1/
1FvrA7lztvMB+RN1n65xj96VHtKVXVFUAiAAKBAAAAAAAAAAAAAAEAWAgAAAA41d4mT1PaQiOmIg
AAAAAAAAAAAAAAB3uH+Ij9f2lNQsOSVQAAAAANbyD9R9zRf/AJewb+xf87jLL1yKB8o3RVSYvj0s
Evv8O3P07qmWJVuyepRLoipz2A9DuNwNZmri+IWknqHufTxOT9HDHeyKiHctbuq93Xn4ujFe9tv2
5eD1s0rI9Sa/6LTFazLV7RVwKirjcx7XNW6tVERbKl+BbnNXTmJde+pWYmJcSidNT3lVFRiOTMi7
FavCY18Wb2Xepz5OniczB90bGxWZQboWKj401Rx16IrmuRPPZTqPRe9uQLgLgdZiaXkpeab/AJQM
ms1AZZAGQDRJUwsWyvuvC1qK5U6ANaV1PeyvVq8Gdrm/agHJblcl2qipwKi3QDLIAyAMgDIAyAMg
DIBxK6q73bnWNXtvZVRUSwG2lk00bZcuXMl0S91sBuyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDI
AyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgD
IAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMg
DIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAM
gDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyA
MgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyAMgDIAyARWAaaNLVD/APYr9oHYudqXmA/I+6v9cYv+
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
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAKB1Uy/pvUX7QNb3be0D8sbp/wBbYr+8p/aUqutKoAKAAggFAgFAgAAAAAAAEAoA
ABAAADj13iZPU9pCI6UiAAAAAAAAAAAAAAAHe4d4iP1/aU1Cw5RVAAAAAA1ybCD9Hdz13+YsJ/sf
/Opll6xjgMswDMAzAMwBVRUVFS6KllRdaKgHybdluafhEzsWw9q95SSItXCxP5M9V+EicRwa+jGr
X3u1su0zoW9zs8HxWHGKZMLqo2TMlaiJLKvvYE4FudDQ072tu9Ho7Vqadaxf83zdhuVqKrDK+bc3
VS98wsgdUUE98zmRptYqnrcniPcI4DFHfpYv6sn3Adq1dQFuAuAuAuAuAuAuAuAuBHWVFRdioqKn
mA6mPDqine91LIzI911ZJsQDkrHVyJke9jGqlnKzWqp5gOVDGyJjY2JZrUsnn84Gy4C4C4C4C4C4
C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4
C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4
C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4
C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4
C4C4C4C4C4C4EVduwDqah36X1F+0DS920D8ubpf1rinnxGf2lK1DrigAAfnWAAAQoEFAhQIAC4AA
AAAQCgAIAAAceu8TJ6ntIRHSkQAAAAAAAAAAAAAAA73DvER+v7SmoWHKCoBQAAABrkKP0V3Pl/zH
hX9j/wCZTDL1bFAzuAuAuAzAMwGM0ccrHxSsbJG9qskY9Ec17V2oqAfNKrchimF1E64RAysoah2a
OF8iskpHX2IpIrETlrend3XpNy25yppZZcSxKVstfPEkLWM1x00O3KiqVl6tHAYov6SNeBEei+m3
YB2bJEVPQBlmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQBmQ
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
AAAAD//Z
--0000000000008b2e9306207fb4e0--
