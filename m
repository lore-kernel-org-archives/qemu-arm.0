Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp578067njb;
        Sat, 24 Aug 2024 10:33:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAnsYsUDN+oFyY25izwR63lC7G0vb3F1GD275hafgXtZ2leHzfCD2gbjVgUKf4tRXtWoDqA/JO5s6qLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHP3XZTM5+gj6Bf9vpJUt59qIVGQJTK3xmzdFDKYL0RUF7VSJ87pdd2n5owzWtrUCd4HK6g
X-Received: by 2002:a05:620a:1a8b:b0:7a6:50a4:291c with SMTP id af79cd13be357-7a688d3b540mr987139885a.14.1724520793383;
        Sat, 24 Aug 2024 10:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724520792; cv=none;
        d=google.com; s=arc-20160816;
        b=YvYqaiP27xoECBSC8jrtEbc1BEQeRuqp9jrekldPp4GzfarqHSrPotq3svS6DF4Et0
         u4qxOu5qXkyUSFDZC8BjAx1lHxD54YkHVNfH68dWx9shOXpuoZXrvj4gabSXAk1my8H7
         2o7ypCi4ZIh5FPyKC5IQvFogqpv7n/tR9NWaDoA3bCrMe+M3o7iZky+fIAmE+hThNykr
         chsFY8hQMZTyBtLRQ6Nh+HqhVLoJ4mVCSnPgL9M6/UajTR3fYRuKIW2x+3lrjx6tYXUO
         /aCSFPsKNyZEN+tNmNPOjhIaEMEP+hJd7aIdEF7osPBN62Rtgu7bsvp22lxsHSBqIRxR
         MN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7cDvUe8CyxZT/WjoC/esT99P3jf4LpdM89RXQIeqp20=;
        fh=QuqVd5crDj/m78BWqKaPO+HNnUFJuAotmAwzgyve14w=;
        b=SNcbSh9qNvVUlh6DFiExLA0mKoh1odUF81UNMwNM0cCrEHzU1eSFidxVhPp5vJr6vx
         uhQN9ffEy43j22pXaWWg/avp0wbTdYAH9C+qflvLkGTgCC42+j3q4aKSISl0wdZfSDaU
         RFigxvUTjUWJVklIuK42G+g+Kta08f93TQ3HTRJrW1YuqkTVhAlY786HiIS8kMB/Q0Ol
         H9RgAXLJVnzhstwr5vCFgCi+NY3QF9B4MySyegmEy957iMzmWGk2dhiku95+NfglagHf
         0CFVf7a9PiX8CN8qzvuNNEtDEzmTvpy6A7xoLC6QUKM0HSCO9jUfZbjqgYxgKZBeUpar
         7aQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z6+mXDuJ;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f3cf824si697367985a.273.2024.08.24.10.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Aug 2024 10:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z6+mXDuJ;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces@nongnu.org>)
	id 1shuck-00051q-4V; Sat, 24 Aug 2024 13:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1shuci-00050W-1L; Sat, 24 Aug 2024 13:32:24 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1shucd-0002B4-Ga; Sat, 24 Aug 2024 13:32:23 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-7c1324be8easo2806564a12.1; 
 Sat, 24 Aug 2024 10:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724520737; x=1725125537; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7cDvUe8CyxZT/WjoC/esT99P3jf4LpdM89RXQIeqp20=;
 b=Z6+mXDuJwo60OyeJHDlHYQgXzM0m+nrQTwoaZ0JXhKS28p0cSxCnNPS47+9PVhXzmv
 eM7KQ70KojByKSNOqOKDruEBuZ2xZAE40asQAUv/UMm9HpKJiF+5uqDY1i4EDkW6Jsb0
 FGnmhSkSh71tzNqyk/tQzjHO0pf3b+21xSGc9xRyWRkC0pCIow86+B833/q9qTfUxfhA
 Rs1qeeMMj/f1eg5tbkhc9OeqKtmIuqsnnJu05Iskvv7eqzmvWl9u4OjXpKRCO0yG/Dp7
 4skEIlG/QeZf9Sv4rahNN90Cr54p6G2Zk8JjrVOlEOk5dynPRtjGfYWcULLNkTmtza6X
 1DPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724520737; x=1725125537;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7cDvUe8CyxZT/WjoC/esT99P3jf4LpdM89RXQIeqp20=;
 b=UFGoQveS4Zm9JZN4Gi8nJ7zLd1luMKGdI/rHN4V1rlWgktfm0jmru03skhYugDwSU1
 feXOXcxONIjBTaYotu87Af/efIgxIySsxVduueSAHT40GigpIIxmNyHwptjS743q4jIo
 HhMqqEutLTvDVh4SuJBYLM/5WR9z/ToAt+z+Ups/LBianeDBQVzG/OnQOW1lCufje89Q
 R2hKrxeFe01u1XouCHBRqa4R8EsdsSywh908sj8GdlKAo/whOh4lWM6EzmvcmZPyFY00
 oU9q1ayLUnWr3zEsKqdJPRX7YbJEfLYTLxkJOsTwZtWstmV686fT1TrfYjxgFOe2HBXC
 sMug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcURgSyWqbTXhRbm2VdMnCYvjkX0ypsqTIiP4TwlN/Uo1whZRa2sEa8zMhv/c69C+/icPxpPj4WZEa00w=@nongnu.org
X-Gm-Message-State: AOJu0Yy6YcQ9EhYd2atyS0SBjSXfOSdZ11dOCUkAUPSkG0SfB15GzPOd
 qnTBr9hLRU/WG0ZNT7Akoxb21FbmWCcvpjisusqSjFxB8EqGYtZt6JQZrso0QqWd00nCVTRrhRg
 WbYSEHeHXIV59I9LzgIgPsvdG//o=
X-Received: by 2002:a17:90b:1b47:b0:2c9:63fb:d3ab with SMTP id
 98e67ed59e1d1-2d644afb652mr9908790a91.22.1724520737391; Sat, 24 Aug 2024
 10:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <95246f95-6231-4c16-8d46-421901778507@linaro.org>
In-Reply-To: <95246f95-6231-4c16-8d46-421901778507@linaro.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Sat, 24 Aug 2024 19:31:40 +0200
Message-ID: <CA+1FSihP8Pg-On_-66hz27jHh7XcQFGD4o9GvahEx7Yj6gro+w@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f5c8d40620714554"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=marietto2008@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e017IYnc2xLW

--000000000000f5c8d40620714554
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nope. Look well. In the example shown here,I've used a different set of
parameters,the parameters below,that try to boot the KonstaKang Android
image this time based on the model "virt",while on the gitlab I tried to
use the model "raspi-b" :

So :

qemu-system-aarch64 \
    -m 2048 \
    -cpu cortex-a72 \
    -M virt,gic-version=3D2 \
    -drive if=3Dpflash,format=3Draw,file=3D/usr/local/share/qemu/edk2-aarch=
64-code.fd
\
    -drive if=3Dpflash,format=3Draw,file=3D/usr/local/share/qemu/edk2-arm-v=
ars.fd \
    -kernel /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Ko=
nstaKANG-rpi4-atv/boot/Image
\
    -append 'console=3DttyAMA0,38400 keep_bootcon
earlycon=3Dpl011,0x9000000 androidboot.hardware=3Dranchu root=3D/dev/vdd1' =
\
    -drive file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFIC=
IAL-KonstaKANG-rpi4-atv/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-at=
v.img,format=3Draw,index=3D0,media=3Ddisk
\
    -device virtio-gpu-pci \
    -device qemu-xhci \
    -device usb-kbd \
    -device usb-mouse \
    -netdev user,id=3Dmynet \
    -device virtio-net-pci,netdev=3Dmynet \
    -serial stdio \
    -no-reboot \
    -d unimp,guest_errors \
    -smp cores=3D4 \
    -device qemu-xhci,id=3Dxhci,addr=3D0x5 \
    -device usb-mouse,bus=3Dxhci.0 \
    -device usb-kbd,bus=3Dxhci.0

=3D

EFI stub: Booting Linux Kernel...
EFI stub: EFI_RNG_PROTOCOL unavailable
EFI stub: Generating empty DTB
EFI stub: Exiting boot services...
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 6.6.36-g01aac93821d2-v8
(kleaf@build-host) (Android (11368308, +pgo, +b
olt, +lto, +mlgo, based on r510928) clang version 18.0.0
(https://android.googlesource.com/toolchain
/llvm-project 477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0)
#1 SMP PREEMPT Tue Jul  2 09:02
:32 UTC 2024
[    0.000000] KASLR disabled due to lack of seed
[    0.000000] printk: debug: skip boot console de-registration.
[    0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (options '')
[    0.000000] printk: bootconsole [pl11] enabled
[    0.000000] efi: EFI v2.7 by EDK II
[    0.000000] efi: SMBIOS 3.0=3D0xbfed0000 MEMATTR=3D0xbd0c9118 ACPI
2.0=3D0xbc6f0018 MEMRESERVE=3D0xbcb43f
18
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] NoSplit zone start for each node
[    0.000000] NoMerge zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bc76ffff]
[    0.000000]   node   0: [mem 0x00000000bc770000-0x00000000bcb3ffff]
[    0.000000]   node   0: [mem 0x00000000bcb40000-0x00000000bfe1ffff]
[    0.000000]   node   0: [mem 0x00000000bfe20000-0x00000000bfeaffff]
[    0.000000]   node   0: [mem 0x00000000bfeb0000-0x00000000bfebffff]
[    0.000000]   node   0: [mem 0x00000000bfec0000-0x00000000bffdffff]
[    0.000000]   node   0: [mem 0x00000000bffe0000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bffff=
fff]
[    0.000000] cma: Reserved 8 MiB at 0x00000000bbc00000 on node -1
[    0.000000] Failed to find device node for boot cpu
[    0.000000] missing boot CPU MPIDR, not enabling secondaries
[    0.000000] percpu: Embedded 31 pages/cpu s87016 r8192 d31768 u126976
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: Spectre-v3a
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] CPU features: detected: Spectre-BHB
[    0.000000] CPU features: detected: ARM erratum 1742098
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530=
923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: console=3DttyAMA0,38400 keep_bootcon
earlycon=3Dpl011,0x9000000 andr
oidboot.hardware=3Dranchu root=3D/dev/vdd1
androidboot.serialno=3D10000000abcd1234 androidboot.btmacaddr=3D1
1:22:33:44:55:66
[    0.000000] Dentry cache hash table entries: 262144 (order: 9,
2097152 bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8,
1048576 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 51609=
6
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:of=
f
[    0.000000] Memory: 2008408K/2097152K available (19328K kernel
code, 2374K rwdata, 7612K rodata,
1792K init, 1192K bss, 80552K reserved, 8192K cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
[    0.000000] ftrace: allocating 56269 entries in 220 pages
[    0.000000] ftrace: allocated 220 pages with 5 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_i=
ds=3D1.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D1
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.000000] timer_probe: no matching timers found
[    0.000000] Kernel panic - not syncing: Unable to initialise
architected timer.
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
6.6.36-g01aac93821d2-v8 #1
[    0.000000] Call trace:
[    0.000000]  dump_backtrace+0x104/0x124
[    0.000000]  show_stack+0x28/0x38
[    0.000000]  dump_stack_lvl+0x58/0x78
[    0.000000]  dump_stack+0x20/0x30
[    0.000000]  panic+0x148/0x35c
[    0.000000]  time_init+0x68/0x6c
[    0.000000]  start_kernel+0x1b8/0x3d0
[    0.000000]  __primary_switched+0xc4/0xd0
[    0.000000] Rebooting in 5 seconds..
[    0.000000] Reboot failed -- System halted


On Sat, Aug 24, 2024 at 6:36=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Hi Mario,
>
> Cc'ing Sergey & qemu-arm@ list.
>
> On 24/8/24 18:11, Mario Marietto wrote:
> > Hello.
> >
> > I want to emulate Android 14 by KonstaKang using qemu-system-aarch64 an=
d
> > as model virt on Ubuntu 24.04 x64 bit installed on my PC (Intel I9 + RT=
X
> > 2080 ti).
>
> You already opened an issue for this:
> https://gitlab.com/qemu-project/qemu/-/issues/2533
>
> Please add "-d unimp,guest_errors" to your command and attach the output
> to the issue, we'll update any progress there.
>
> > [ 0.000000] timer_probe: no matching timers found
> > [ 0.000000] Kernel panic - not syncing: Unable to initialise architecte=
d
> timer.
>
> Regards,
>
> Phil.
>


--=20
Mario.

--000000000000f5c8d40620714554
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Nope. Look well. In the example shown here,I&#39;ve u=
sed a different set of parameters,the parameters below,that try to boot the=
 KonstaKang Android image this time based on the model &quot;virt&quot;,whi=
le on the gitlab I tried to use the model &quot;raspi-b&quot; :<br></div><d=
iv><br></div><div>So :</div><div><br></div><div><pre><code>qemu-system-aarc=
h64 \
    -m 2048 \
    -cpu cortex-a72 \
    -M virt,gic-version=3D2 \
    -drive if=3Dpflash,format=3Draw,file=3D/usr/local/share/qemu/edk2-aarch=
64-code.fd \
    -drive if=3Dpflash,format=3Draw,file=3D/usr/local/share/qemu/edk2-arm-v=
ars.fd \
    -kernel /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-Ko=
nstaKANG-rpi4-atv/boot/Image \
    -append &#39;console=3DttyAMA0,38400 keep_bootcon earlycon=3Dpl011,0x90=
00000 androidboot.hardware=3Dranchu root=3D/dev/vdd1&#39; \
    -drive file=3D/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFIC=
IAL-KonstaKANG-rpi4-atv/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-at=
v.img,format=3Draw,index=3D0,media=3Ddisk \
    -device virtio-gpu-pci \
    -device qemu-xhci \
    -device usb-kbd \
    -device usb-mouse \
    -netdev user,id=3Dmynet \
    -device virtio-net-pci,netdev=3Dmynet \
    -serial stdio \
    -no-reboot \
    -d unimp,guest_errors \
    -smp cores=3D4 \
    -device qemu-xhci,id=3Dxhci,addr=3D0x5 \
    -device usb-mouse,bus=3Dxhci.0 \
    -device usb-kbd,bus=3Dxhci.0<br><br>=3D<br><br></code><span style=3D"fo=
nt-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(2=
55,255,255)">EFI stub: Booting Linux Kernel...
</span><br>EFI stub: EFI_RNG_PROTOCOL unavailable
<br>EFI stub: Generating empty DTB
<br>EFI stub: Exiting boot services...
<br>[ =C2=A0=C2=A0=C2=A00.000000] Booting Linux on physical CPU 0x000000000=
0 [0x410fd083]
<br>[ =C2=A0=C2=A0=C2=A00.000000] Linux version 6.6.36-g01aac93821d2-v8 (kl=
eaf@build-host) (Android (11368308, +pgo, +b<br>olt, +lto, +mlgo, based on =
r510928) clang version 18.0.0 (<a href=3D"https://android.googlesource.com/=
toolchain">https://android.googlesource.com/toolchain</a><br>/llvm-project =
477610d4d0d988e69dbc3fae4fe86bff3f07f2b5), LLD 18.0.0) #1 SMP PREEMPT Tue J=
ul =C2=A02 09:02<br>:32 UTC 2024
<br>[ =C2=A0=C2=A0=C2=A00.000000] KASLR disabled due to lack of seed
<br>[ =C2=A0=C2=A0=C2=A00.000000] printk: debug: skip boot console de-regis=
tration.
<br>[ =C2=A0=C2=A0=C2=A00.000000] earlycon: pl11 at MMIO 0x0000000009000000=
 (options &#39;&#39;)
<br>[ =C2=A0=C2=A0=C2=A00.000000] printk: bootconsole [pl11] enabled
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: EFI v2.7 by EDK II
<br>[ =C2=A0=C2=A0=C2=A00.000000] efi: SMBIOS 3.0=3D0xbfed0000 MEMATTR=3D0x=
bd0c9118 ACPI 2.0=3D0xbc6f0018 MEMRESERVE=3D0xbcb43f<br>18 =C2=A0<br>[ =C2=
=A0=C2=A0=C2=A00.000000] Zone ranges:
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0[mem 0x0000000040000000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0DMA32 =C2=A0=C2=A0=C2=A0empty
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0Normal =C2=A0=C2=A0empty
<br>[ =C2=A0=C2=A0=C2=A00.000000] Movable zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] NoSplit zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] NoMerge zone start for each node
<br>[ =C2=A0=C2=A0=C2=A00.000000] Early memory node ranges
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
00000040000000-0x00000000bc76ffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
000000bc770000-0x00000000bcb3ffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
000000bcb40000-0x00000000bfe1ffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
000000bfe20000-0x00000000bfeaffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
000000bfeb0000-0x00000000bfebffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
000000bfec0000-0x00000000bffdffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0=C2=A0node =C2=A0=C2=A00: [mem 0x00=
000000bffe0000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] Initmem setup node 0 [mem 0x0000000040000=
000-0x00000000bfffffff]
<br>[ =C2=A0=C2=A0=C2=A00.000000] cma: Reserved 8 MiB at 0x00000000bbc00000=
 on node -1
<br>[ =C2=A0=C2=A0=C2=A00.000000] Failed to find device node for boot cpu
<br>[ =C2=A0=C2=A0=C2=A00.000000] missing boot CPU MPIDR, not enabling seco=
ndaries
<br>[ =C2=A0=C2=A0=C2=A00.000000] percpu: Embedded 31 pages/cpu s87016 r819=
2 d31768 u126976
<br>[ =C2=A0=C2=A0=C2=A00.000000] Detected PIPT I-cache on CPU0
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v2
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v3a
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-v4
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: Spectre-BHB
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: ARM erratum 17420=
98
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU features: detected: ARM errata 116552=
2, 1319367, or 1530923
<br>[ =C2=A0=C2=A0=C2=A00.000000] alternatives: applying boot alternatives
<br>[ =C2=A0=C2=A0=C2=A00.000000] Kernel command line: console=3DttyAMA0,38=
400 keep_bootcon earlycon=3Dpl011,0x9000000 andr<br>oidboot.hardware=3Dranc=
hu root=3D/dev/vdd1 androidboot.serialno=3D10000000abcd1234 androidboot.btm=
acaddr=3D1<br>1:22:33:44:55:66
<br>[ =C2=A0=C2=A0=C2=A00.000000] Dentry cache hash table entries: 262144 (=
order: 9, 2097152 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Inode-cache hash table entries: 131072 (o=
rder: 8, 1048576 bytes, linear)
<br>[ =C2=A0=C2=A0=C2=A00.000000] Built 1 zonelists, mobility grouping on.=
=C2=A0 Total pages: 516096
<br>[ =C2=A0=C2=A0=C2=A00.000000] mem auto-init: stack:all(zero), heap allo=
c:off, heap free:off
<br>[ =C2=A0=C2=A0=C2=A00.000000] Memory: 2008408K/2097152K available (1932=
8K kernel code, 2374K rwdata, 7612K rodata, <br>1792K init, 1192K bss, 8055=
2K reserved, 8192K cma-reserved)
<br>[ =C2=A0=C2=A0=C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D1, Nodes=3D1
<br>[ =C2=A0=C2=A0=C2=A00.000000] ftrace: allocating 56269 entries in 220 p=
ages
<br>[ =C2=A0=C2=A0=C2=A00.000000] ftrace: allocated 220 pages with 5 groups
<br>[ =C2=A0=C2=A0=C2=A00.000000] trace event string verifier disabled
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: Preemptible hierarchical RCU impleme=
ntation.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: =C2=A0=C2=A0=C2=A0=C2=A0RCU event tr=
acing is enabled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: =C2=A0=C2=A0=C2=A0=C2=A0RCU restrict=
ing CPUs from NR_CPUS=3D256 to nr_cpu_ids=3D1.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Trampoline variant of Tasks RCU ena=
bled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Rude variant of Tasks RCU enabled.
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0Tracing variant of Tasks RCU enable=
d.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: RCU calculated value of scheduler-en=
listment delay is 25 jiffies.
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: Adjusting geometry for rcu_fanout_le=
af=3D16, nr_cpu_ids=3D1
<br>[ =C2=A0=C2=A0=C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated ir=
qs: 0
<br>[ =C2=A0=C2=A0=C2=A00.000000] rcu: srcu_init: Setting srcu_struct sizes=
 based on contention.
<br>[ =C2=A0=C2=A0=C2=A00.000000] timer_probe: no matching timers found
<br>[ =C2=A0=C2=A0=C2=A00.000000] Kernel panic - not syncing: Unable to ini=
tialise architected timer.
<br>[ =C2=A0=C2=A0=C2=A00.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted=
 6.6.36-g01aac93821d2-v8 #1
<br>[ =C2=A0=C2=A0=C2=A00.000000] Call trace:
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0dump_backtrace+0x104/0x124
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0show_stack+0x28/0x38
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0dump_stack_lvl+0x58/0x78
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0dump_stack+0x20/0x30
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0panic+0x148/0x35c
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0time_init+0x68/0x6c
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0start_kernel+0x1b8/0x3d0
<br>[ =C2=A0=C2=A0=C2=A00.000000] =C2=A0__primary_switched+0xc4/0xd0
<br>[ =C2=A0=C2=A0=C2=A00.000000] Rebooting in 5 seconds..
<br>[ =C2=A0=C2=A0=C2=A00.000000] Reboot failed -- System halted<br></span>=
<code><br></code></pre></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Aug 24, 2024 at 6:36=E2=80=AFPM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Mario,<br>
<br>
Cc&#39;ing Sergey &amp; qemu-arm@ list.<br>
<br>
On 24/8/24 18:11, Mario Marietto wrote:<br>
&gt; Hello.<br>
&gt; <br>
&gt; I want to emulate Android 14 by KonstaKang using qemu-system-aarch64 a=
nd <br>
&gt; as model virt on Ubuntu 24.04 x64 bit installed on my PC (Intel I9 + R=
TX <br>
&gt; 2080 ti).<br>
<br>
You already opened an issue for this:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/2533" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/2533=
</a><br>
<br>
Please add &quot;-d unimp,guest_errors&quot; to your command and attach the=
 output<br>
to the issue, we&#39;ll update any progress there.<br>
<br>
&gt; [ 0.000000] timer_probe: no matching timers found<br>
&gt; [ 0.000000] Kernel panic - not syncing: Unable to initialise architect=
ed timer.<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000f5c8d40620714554--
