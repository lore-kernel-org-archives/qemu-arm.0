Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4066477wrx;
        Tue, 16 Apr 2019 08:34:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGmi+uVeQnNpDQKGY0Ss/RCMZFhTGGcZwHHZFaBDfmTu/1GLhz/p9Wsr6XzTx5nNklS9GH
X-Received: by 2002:a5d:69c2:: with SMTP id s2mr51400149wrw.83.1555428854646;
        Tue, 16 Apr 2019 08:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555428854; cv=none;
        d=google.com; s=arc-20160816;
        b=nb40KAyW34Bb/TmAKcVVp1hv0ZNiZf7kga3Ktj0a7j5eQByjWH3XyBJLRgUm9B9YSX
         HV/oGW+5+2W4/IgMFS4h+H448nNf+FNSvYBntZnH6KvO4edTUW4z8JWFQtLMcP3wv5C9
         c71CZPfVvfUbM4ScH/mACnUHx605aYzciUlsNn4VlxMjcq074nTDH4nAwqGb//kb/Ukj
         eR3o8q1fp5JqdY/OSE4nOkJ5gwaiDnKSz8lJEL+ORgq2S493G7gdSpq3HYYbpLoH1pCm
         2koqpeRxOy6H6BCkoRsvhRnl9JvKeifXknFPByjffP5HIt8m5XQJjfysyVvWuuaSgTkH
         XqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=sLl1shSzJrw/vgXPS4x170t9LB9+wwzMZzjseFf4UEU=;
        b=uUJkfZRTjIRs07BVZQjOo5d8QHtMy6zdzjoW6MywwfPgvtlTEBtPaoUnXCngbaJ5qe
         VgmvpOmNANTR277aSTyZsk3iKj21XAf1VLDv/3QhFxFKTrjca3xEv38aFQeg9v9NQjRz
         fAC8m0tjG76X+kYt7KPe0qGkbxBSU2PZ2a7WskE+BisrM2chQiP3OK4P3xMa0Lv+67u7
         wE+94dA/NzUFzx9JMgt8uHSwhh9SSH0Ebzbq8Dqa5lfwG+GM/SHRzHHI1sXmn4d7Rjf2
         5Akw/zU12v3Wf/E0xnxzpENLQmKUQUPntEZ598/23NpNpHmg6qjp4qQ3cPvzSmgeedhp
         jC2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si36310316wrq.72.2019.04.16.08.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 08:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([127.0.0.1]:38534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGQ69-0001zV-Lo
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 11:34:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40880)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <daz3@vt.edu>)
	id 1hGQ5s-0001zJ-Sc
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 11:33:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daz3@vt.edu>) id 1hGQ5q-0006AJ-Vs
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 11:33:56 -0400
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]:42178
	helo=omr2.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <daz3@vt.edu>) id 1hGQ5q-00069n-N8
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 11:33:54 -0400
Received: from mr3.cc.vt.edu (mr3.cc.ipv6.vt.edu
	[IPv6:2607:b400:92:8500:0:7f:b804:6b0a])
	by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x3GFXq10004705
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 11:33:52 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70])
	by mr3.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x3GFXlx0004707
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 11:33:52 -0400
Received: by mail-wr1-f70.google.com with SMTP id t9so19333558wrs.16
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 08:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sLl1shSzJrw/vgXPS4x170t9LB9+wwzMZzjseFf4UEU=;
	b=CSqocCAaNbmR108W0RKEntSX1IAVjuElJB1rST2c9kY3DBEIq3uMxwpH6ubwLQxjpm
	H6jeKsxW5hpE4V7WCefCVTryR7IANSwXp9V1xw3oqCFMb7/dV2MFUJQ7mGDoF5JCe3Ut
	ntqSVF4+2InCPcm3RfYM+8oDDwA+O+bqV7eenwDcJeyWPoN90BNcDn7kFsot+tOPEGPf
	QdU/kIihaUFJ8/EluiUzQST/eyHdWYEqGrxOCKHGGflILLv0nsSB/gr4XzYZuNAbktVc
	k7QZJ0dd9hbPgZdjz6idFktU8lwXYuRBEwBRCbzivOlVdjDTlVUPNB/Q32jtIdHRVBOD
	asDg==
X-Gm-Message-State: APjAAAX9q7a+WKigzqqaRvjZJ2KXiOS9LZnoukxLQNVsd0m18DYX5u71
	M0sFDu3s1MNH0kkA02ufOvaS9FFJI3ZjGDCGF2WQrcqdhu16/ixTNa+Tl311fQ+W3DmxsEKW7za
	YdNksQxRF8eCgQ2k6JnAnmhjelZJdANtt+HzFfIU=
X-Received: by 2002:a5d:43c9:: with SMTP id v9mr52545801wrr.269.1555428826486; 
	Tue, 16 Apr 2019 08:33:46 -0700 (PDT)
X-Received: by 2002:a5d:43c9:: with SMTP id v9mr52545770wrr.269.1555428826012; 
	Tue, 16 Apr 2019 08:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
	<CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
	<CANY2w+0ZULuVgJTu3M+--rC01biqS=y1V4tAbgjHfyKRd6X79A@mail.gmail.com>
	<CAFEAcA9zP8OateFNU+Ea1thk4NkYgcee5ykEscaguC=hAhXfag@mail.gmail.com>
	<CANY2w+3qJgQ_HVai6trQ_gDXxPLruj1-L6LaTkcUZQbtQBofpg@mail.gmail.com>
	<CAFEAcA9gciZ3_zY-XMoC8o0P4ffvHhC0w=ZDA6biXyovx_H2cQ@mail.gmail.com>
	<CANY2w+1UhFKHOfgVEmPDGwMsH8o3nWi7VsNFRkx2Yw3N5nO5dQ@mail.gmail.com>
	<CAFEAcA_r2MTgVA-e1ozP0ySNzWWYTu2sKk52sk5a3_Hd__KO9A@mail.gmail.com>
In-Reply-To: <CAFEAcA_r2MTgVA-e1ozP0ySNzWWYTu2sKk52sk5a3_Hd__KO9A@mail.gmail.com>
From: Da Zhang <daz3@vt.edu>
Date: Tue, 16 Apr 2019 11:33:09 -0400
Message-ID: <CANY2w+2Wz-5CRcOf3Xn8WF0o-j3o2RNtS-drqBQ-QSKXYOJdAg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a5eb860586a77ed8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2607:b400:92:8400:0:33:fb76:806e
Subject: Re: [Qemu-arm] Ubuntu installation shows "No network interfaces
 detected"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZlZcINs3ckHf

--000000000000a5eb860586a77ed8
Content-Type: text/plain; charset="UTF-8"

This is my gem5 simulation output. My goal is using qemu-system-aarch64 to
create an ARM disk image for my gem5 simulations, since qemu provides a
better solution to modify the image (e.g., apt-get install) for different
purposes.

Firstly, I created a qcow2 image and used the qemu-system-aarch64 command
shown in the previous emails to install Ubuntu.
Secondly, I converted the qcow2 disk image to raw format and rebooted from
the raw disk image via qemu-system-aarch64 (without cdrom) again to make
sure the Ubuntu system work.
Thirdly, I put gem5's m5 executable in the guest system's /sbin/ and create
gem5.service, and reran qemu to make sure the disk image still work after
modifications.
Finally, I ran my gem5 simulation using the disk image and encountered the
kernel panic. The linux kernel used in my gem5 simulation was built from
repository "https://gem5.googlesource.com/arm/linux" branch gem5/v4.4 for
linux kernel version 4.4.

I am not sure if gem5 support vda or not. Since both our X86 disk image and
the official ARM disk image used sda, I thought I might give it a quick
try. That's why I asked how to run qemu-system-aarch64 with sda. I tried
-hda and -cdrom, but qemu-system-aarch64 didn't recognize the disk image
and the iso. I also tried to use device like scsi-hd, but qemu complained
about no SCSI bus.

best,
Da

On Tue, Apr 16, 2019 at 10:47 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 16 Apr 2019 at 15:24, Da Zhang <daz3@vt.edu> wrote:
> >
>
> This seems to be missing some output from the start of boot.
>
> > [    2.361820] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> > [    2.375346] igb: Intel(R) Gigabit Ethernet Network Driver - version
> 5.4.0-k
> > [    2.390986] igb: Copyright (c) 2007-2014 Intel Corporation.
> > [    2.403596] ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver -
> version 5.1.0-k
> > [    2.420739] ixgbe: Copyright (c) 1999-2016 Intel Corporation.
> > [    2.437883] ixgbevf: Intel(R) 10 Gigabit PCI Express Virtual Function
> Network Driver - version 4.1.0-k
>
>
> > [    2.642190] usbcore: registered new interface driver usbhid
> > [    2.642191] usbhid: USB HID core driver
> > [    2.642322] NET: Registered protocol family 17
> > [    2.916496] scsi 0:0:0:0: Direct-Access     ATA      M5 IDE Disk
> n/a  PQ: 0 ANSI: 5
> > [    2.935127] sd 0:0:0:0: [sda] 16777216 512-byte logical blocks: (8.59
> GB/8.00 GiB)
> > [    2.952327] sd 0:0:0:0: Attached scsi generic sg0 type 0
> > [    2.964648] sd 0:0:0:0: [sda] Write Protect is off
> > [    2.975518] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> > [    2.986957] sd 0:0:0:0: [sda] Write cache: disabled, read cache:
> enabled, doesn't support DPO or FUA
> > [    3.101444]  sda: sda1 sda2 sda3
> > [    3.109804] sd 0:0:0:0: [sda] Attached SCSI disk
> > [    3.452824] VFS: Mounted root (vfat filesystem) on device 8:1.
>
> We found and mounted the ISO image's VFAT partition...
>
> > [    3.466085] devtmpfs: error mounting -2
> > [    3.475091] Freeing unused kernel memory: 384K
> > [    3.485519] Kernel panic - not syncing: No working init found.  Try
> passing init= option to kernel. See Linux
> Documentation/admin-guide/init.rst for guidance.
>
> ...but unsurprisingly that is not a workable root filesystem.
>
> > [    3.516805] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.14.0+ #2
> > [    3.530257] Hardware name: V2P-CA15 (DT)
> > [    3.539161] Call trace:
> > [    3.544930] [<ffffff8008088250>] dump_backtrace+0x0/0x370
> > [    3.557065] [<ffffff80080885d4>] show_stack+0x14/0x20
> > [    3.568513] [<ffffff800863ffe8>] dump_stack+0x8c/0xac
> > [    3.579903] [<ffffff80080b7338>] panic+0x11c/0x274
> > [    3.590712] [<ffffff8008652244>] kernel_init+0xec/0x100
> > [    3.602463] [<ffffff8008084348>] ret_from_fork+0x10/0x18
> > [    3.614433] Kernel Offset: disabled
> > [    3.622386] CPU features: 0x002000
> > [    3.630153] Memory Limit: 1024 MB
> > [    3.637726] ---[ end Kernel panic - not syncing: No working init
> found.  Try passing init= option to kernel. See Linux
> Documentation/admin-guide/init.rst for guidance.
> >
> > This is my ARM/gem5.fast simulation output. The following is my gem5
> command:
> >
> > build/ARM/gem5.fast --listener-mode=on -d /home/rock64/tmp/arm_
> configs/example/fs.py --machine-type=VExpress_GEM5_V1
> --kernel=vmlinux.arm.4.4 --disk-image=ubuntu-16.04.5-server-arm64.img
> --mem-size=1GB --cpu-type=ArmV8KvmCPU --generate-dtb -n 1
>
>
> Wait, are you running this on QEMU or on GEM5?
>
> Anyway, the lack of anything virtio related in the output you
> quote leads me to suggest you check that your guest kernel
> config has all the virtio devices in it. You might as well
> add in PCI too (you want CONFIG_PCI, CONFIG_VIRTIO_PCI,
> CONFIG_PCI_HOST_GENERIC, CONFIG_VIRTIO_BLK, CONFIG_VIRTIO_NET,
> CONFIG_VIRTIO_MMIO).
>
> Also, have you actually managed to do an install onto the
> hard disk image yet? If not, then something is going wrong
> before here that it's not doing an install properly.
>
> thanks
> -- PMM
>

--000000000000a5eb860586a77ed8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">This is my gem5 simulation output. My goa=
l is using qemu-system-aarch64 to create an ARM disk image for my gem5 simu=
lations, since qemu provides a better solution to modify the image (e.g., a=
pt-get install) for different purposes.</div><div dir=3D"ltr"><br><div>Firs=
tly, I created a qcow2 image and used the qemu-system-aarch64 command shown=
 in the previous emails to install Ubuntu.=C2=A0</div><div>Secondly, I conv=
erted the qcow2 disk image to raw format and rebooted from the raw disk ima=
ge via qemu-system-aarch64 (without cdrom) again to make sure the Ubuntu sy=
stem work.=C2=A0</div><div>Thirdly, I put gem5&#39;s m5 executable in the g=
uest system&#39;s /sbin/ and create gem5.service, and reran qemu to make su=
re the disk image still work after modifications.=C2=A0</div><div>Finally, =
I ran my gem5 simulation using the disk image and encountered the kernel pa=
nic. The linux kernel used in my gem5 simulation was built from repository =
&quot;<a href=3D"https://gem5.googlesource.com/arm/linux">https://gem5.goog=
lesource.com/arm/linux</a>&quot; branch gem5/v4.4 for linux kernel version =
4.4.</div><div><br></div><div>I am not sure if gem5 support vda or not. Sin=
ce both our X86 disk image and the official ARM disk image used sda, I thou=
ght I might give it a quick try. That&#39;s why I asked how to run qemu-sys=
tem-aarch64 with sda. I tried -hda and -cdrom, but qemu-system-aarch64 didn=
&#39;t recognize the disk image and the iso. I also tried to use device lik=
e scsi-hd, but qemu complained about no SCSI bus.</div><div><br></div><div>=
best,</div><div>Da</div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Apr 16, 2019 at 10:47 AM Peter Maydel=
l &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.m=
aydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Tue, 16 Apr 2019 at 15:24, Da Zhang &lt;<a href=3D"mail=
to:daz3@vt.edu" target=3D"_blank">daz3@vt.edu</a>&gt; wrote:<br>
&gt;<br>
<br>
This seems to be missing some output from the start of boot.<br>
<br>
&gt; [=C2=A0 =C2=A0 2.361820] e1000e: Copyright(c) 1999 - 2015 Intel Corpor=
ation.<br>
&gt; [=C2=A0 =C2=A0 2.375346] igb: Intel(R) Gigabit Ethernet Network Driver=
 - version 5.4.0-k<br>
&gt; [=C2=A0 =C2=A0 2.390986] igb: Copyright (c) 2007-2014 Intel Corporatio=
n.<br>
&gt; [=C2=A0 =C2=A0 2.403596] ixgbe: Intel(R) 10 Gigabit PCI Express Networ=
k Driver - version 5.1.0-k<br>
&gt; [=C2=A0 =C2=A0 2.420739] ixgbe: Copyright (c) 1999-2016 Intel Corporat=
ion.<br>
&gt; [=C2=A0 =C2=A0 2.437883] ixgbevf: Intel(R) 10 Gigabit PCI Express Virt=
ual Function Network Driver - version 4.1.0-k<br>
<br>
<br>
&gt; [=C2=A0 =C2=A0 2.642190] usbcore: registered new interface driver usbh=
id<br>
&gt; [=C2=A0 =C2=A0 2.642191] usbhid: USB HID core driver<br>
&gt; [=C2=A0 =C2=A0 2.642322] NET: Registered protocol family 17<br>
&gt; [=C2=A0 =C2=A0 2.916496] scsi 0:0:0:0: Direct-Access=C2=A0 =C2=A0 =C2=
=A0ATA=C2=A0 =C2=A0 =C2=A0 M5 IDE Disk=C2=A0 =C2=A0 =C2=A0 n/a=C2=A0 PQ: 0 =
ANSI: 5<br>
&gt; [=C2=A0 =C2=A0 2.935127] sd 0:0:0:0: [sda] 16777216 512-byte logical b=
locks: (8.59 GB/8.00 GiB)<br>
&gt; [=C2=A0 =C2=A0 2.952327] sd 0:0:0:0: Attached scsi generic sg0 type 0<=
br>
&gt; [=C2=A0 =C2=A0 2.964648] sd 0:0:0:0: [sda] Write Protect is off<br>
&gt; [=C2=A0 =C2=A0 2.975518] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00<br>
&gt; [=C2=A0 =C2=A0 2.986957] sd 0:0:0:0: [sda] Write cache: disabled, read=
 cache: enabled, doesn&#39;t support DPO or FUA<br>
&gt; [=C2=A0 =C2=A0 3.101444]=C2=A0 sda: sda1 sda2 sda3<br>
&gt; [=C2=A0 =C2=A0 3.109804] sd 0:0:0:0: [sda] Attached SCSI disk<br>
&gt; [=C2=A0 =C2=A0 3.452824] VFS: Mounted root (vfat filesystem) on device=
 8:1.<br>
<br>
We found and mounted the ISO image&#39;s VFAT partition...<br>
<br>
&gt; [=C2=A0 =C2=A0 3.466085] devtmpfs: error mounting -2<br>
&gt; [=C2=A0 =C2=A0 3.475091] Freeing unused kernel memory: 384K<br>
&gt; [=C2=A0 =C2=A0 3.485519] Kernel panic - not syncing: No working init f=
ound.=C2=A0 Try passing init=3D option to kernel. See Linux Documentation/a=
dmin-guide/init.rst for guidance.<br>
<br>
...but unsurprisingly that is not a workable root filesystem.<br>
<br>
&gt; [=C2=A0 =C2=A0 3.516805] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1=
4.0+ #2<br>
&gt; [=C2=A0 =C2=A0 3.530257] Hardware name: V2P-CA15 (DT)<br>
&gt; [=C2=A0 =C2=A0 3.539161] Call trace:<br>
&gt; [=C2=A0 =C2=A0 3.544930] [&lt;ffffff8008088250&gt;] dump_backtrace+0x0=
/0x370<br>
&gt; [=C2=A0 =C2=A0 3.557065] [&lt;ffffff80080885d4&gt;] show_stack+0x14/0x=
20<br>
&gt; [=C2=A0 =C2=A0 3.568513] [&lt;ffffff800863ffe8&gt;] dump_stack+0x8c/0x=
ac<br>
&gt; [=C2=A0 =C2=A0 3.579903] [&lt;ffffff80080b7338&gt;] panic+0x11c/0x274<=
br>
&gt; [=C2=A0 =C2=A0 3.590712] [&lt;ffffff8008652244&gt;] kernel_init+0xec/0=
x100<br>
&gt; [=C2=A0 =C2=A0 3.602463] [&lt;ffffff8008084348&gt;] ret_from_fork+0x10=
/0x18<br>
&gt; [=C2=A0 =C2=A0 3.614433] Kernel Offset: disabled<br>
&gt; [=C2=A0 =C2=A0 3.622386] CPU features: 0x002000<br>
&gt; [=C2=A0 =C2=A0 3.630153] Memory Limit: 1024 MB<br>
&gt; [=C2=A0 =C2=A0 3.637726] ---[ end Kernel panic - not syncing: No worki=
ng init found.=C2=A0 Try passing init=3D option to kernel. See Linux Docume=
ntation/admin-guide/init.rst for guidance.<br>
&gt;<br>
&gt; This is my ARM/gem5.fast simulation output. The following is my gem5 c=
ommand:<br>
&gt;<br>
&gt; build/ARM/gem5.fast --listener-mode=3Don -d /home/rock64/tmp/arm_ conf=
igs/example/fs.py --machine-type=3DVExpress_GEM5_V1 --kernel=3Dvmlinux.arm.=
4.4 --disk-image=3Dubuntu-16.04.5-server-arm64.img --mem-size=3D1GB --cpu-t=
ype=3DArmV8KvmCPU --generate-dtb -n 1<br>
<br>
<br>
Wait, are you running this on QEMU or on GEM5?<br>
<br>
Anyway, the lack of anything virtio related in the output you<br>
quote leads me to suggest you check that your guest kernel<br>
config has all the virtio devices in it. You might as well<br>
add in PCI too (you want CONFIG_PCI, CONFIG_VIRTIO_PCI,<br>
CONFIG_PCI_HOST_GENERIC, CONFIG_VIRTIO_BLK, CONFIG_VIRTIO_NET,<br>
CONFIG_VIRTIO_MMIO).<br>
<br>
Also, have you actually managed to do an install onto the<br>
hard disk image yet? If not, then something is going wrong<br>
before here that it&#39;s not doing an install properly.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000a5eb860586a77ed8--
