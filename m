Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3990830wrx;
        Tue, 16 Apr 2019 07:24:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+GyXBbhlDUks8s6bs4zC291q6FgJeqTN3Q71qNhhBsEfbYWk+04MMExKtCOpY4XDnqUVX
X-Received: by 2002:adf:cd90:: with SMTP id q16mr33394232wrj.75.1555424698039;
        Tue, 16 Apr 2019 07:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555424698; cv=none;
        d=google.com; s=arc-20160816;
        b=mCsaVX+jYW3fNaS2OkYx/OFtlbj5sZc509x0e6kIZTVqg1s36e/H9NNajYrgoGLf0X
         5yQYHlj710HwzQYbTNlaxlRdkQ8ZJD6b04chFX+PanEbrCsg/SWdaKunmrIi9lEELmN0
         XpGQLXyA8fnbsmLk3DRYyl4gqPsp+necz+L1608cwqqKjdKyiXLHRXi0cpbDe1MUjxXB
         5yA7mDd+3NqdbWQP0nOvuKCJur5R+A/hkZb+tia39CKgfFvISK5PyHDt7ZUImfDlcoVy
         ziusu/Qp9VwrCjWHHVrWV0/3/Pc56WM8PAHbbSPAaLzvLVEC7nU9ciawV+xPYFjBFZw5
         960w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=FpDhBDqBcXrpbP30zUFaXCOrWLgNGg59onjzZ9Y/Tf0=;
        b=PEtiRQ9XZ8Im8S19tFStQEM8cpgsXuYUBAgEvE3PrfngLv/I1Chv+4mr4JH9uFzJz+
         Tddr49V8YOKsQOaYX//Bsyl4lTFnNAOIjezE1pmCjnhHg/kUT/m4dxgq5w1c/Ncfgzfv
         oV5hoHceoahBAkAsFWXy/6h808396v4nnqm2ht89Vid4aIUk+3AY6PoJdWaWa878Quwt
         bpzomABoE+0OKa16qtXN9vTWq6eOaDASLBE/D9v+0+PW5YrsW/pYOAAOVMCHPpd58OwS
         51aFNblKUn9OiTXH+UY0T39RUJuAMU6SFdgFo6FrVYmQDWlPR3ewnp3ovthdKHVsyU4r
         hg5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b130si13086721wmc.91.2019.04.16.07.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 07:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([127.0.0.1]:37682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGP17-0007lD-2Y
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 10:24:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55151)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <daz3@vt.edu>)
	id 1hGP0u-0007kE-PH
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 10:24:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daz3@vt.edu>) id 1hGP0s-0000wt-VJ
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 10:24:44 -0400
Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]:46268
	helo=omr1.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <daz3@vt.edu>) id 1hGP0s-0000vn-MD
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 10:24:42 -0400
Received: from mr5.cc.vt.edu (mr5.cc.ipv6.vt.edu
	[IPv6:2607:b400:92:8400:0:72:232:758b])
	by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x3GEOdZt024881
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 10:24:40 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	by mr5.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x3GEOYbv018775
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 10:24:39 -0400
Received: by mail-wr1-f71.google.com with SMTP id x9so19226852wrw.20
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 07:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FpDhBDqBcXrpbP30zUFaXCOrWLgNGg59onjzZ9Y/Tf0=;
	b=Yq3/0T48kMNVjVsB2QGlMt1+KYtYUvFAmHgoVP2DDAGG7y9QoMYwIyvRLL6vno9MxZ
	vTSf0rtQkGKsFpj2t6DvApEp1z48/L8MPiUAdP0H1nkHkoBtbfmF5MzKglTYIM1w7NlH
	hXE3d0Gi5Yi9wNdCAw5qMO7l8/ZPo+j7tD7cxolsBy//WEqy/rgACkqr4AEVNpUThHsu
	3RCmlIxXhaK2cW9ih4aB6jaeGV9SToAL632mxsudtqtrodMCeb+aiuxJUT3cP5J+VvhH
	an1kjokSJj+LOj7iyNRsdX2MITa5iR+Tx/QneVU9QRfCuVrx+btUTsree5hA9sDzVGdZ
	xnCw==
X-Gm-Message-State: APjAAAV24jtoZm0ICD8VgNGqFWrL5tMyr5rH2hyob/yyaJkN0Q+Oc+rp
	pTI9ubKQdt5L+8b1lEeDcyx2+90EAeBCanPDdBgLo+g/W7DfEt+0Y6+trVc1bMtwBqGmDtUWLdo
	WSkKyHoHvL+UVVOh9INjqokp5WND9pObzF2lhzSQ=
X-Received: by 2002:a5d:5284:: with SMTP id c4mr33726246wrv.281.1555424673672; 
	Tue, 16 Apr 2019 07:24:33 -0700 (PDT)
X-Received: by 2002:a5d:5284:: with SMTP id c4mr33726216wrv.281.1555424673238; 
	Tue, 16 Apr 2019 07:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
	<CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
	<CANY2w+0ZULuVgJTu3M+--rC01biqS=y1V4tAbgjHfyKRd6X79A@mail.gmail.com>
	<CAFEAcA9zP8OateFNU+Ea1thk4NkYgcee5ykEscaguC=hAhXfag@mail.gmail.com>
	<CANY2w+3qJgQ_HVai6trQ_gDXxPLruj1-L6LaTkcUZQbtQBofpg@mail.gmail.com>
	<CAFEAcA9gciZ3_zY-XMoC8o0P4ffvHhC0w=ZDA6biXyovx_H2cQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9gciZ3_zY-XMoC8o0P4ffvHhC0w=ZDA6biXyovx_H2cQ@mail.gmail.com>
From: Da Zhang <daz3@vt.edu>
Date: Tue, 16 Apr 2019 10:23:57 -0400
Message-ID: <CANY2w+1UhFKHOfgVEmPDGwMsH8o3nWi7VsNFRkx2Yw3N5nO5dQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001fc6990586a6877b"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2607:b400:92:8300:0:c6:2117:b0e
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
X-TUID: rkfJ1A+Bs1Tf

--0000000000001fc6990586a6877b
Content-Type: text/plain; charset="UTF-8"

[    2.361820] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    2.375346] igb: Intel(R) Gigabit Ethernet Network Driver - version
5.4.0-k
[    2.390986] igb: Copyright (c) 2007-2014 Intel Corporation.
[    2.403596] ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver -
version 5.1.0-k
[    2.420739] ixgbe: Copyright (c) 1999-2016 Intel Corporation.
[    2.437883] ixgbevf: Intel(R) 10 Gigabit PCI Express Virtual Function
Network Driver - version 4.1.0-k
[    2.458697] ixgbevf: Copyright (c) 2009 - 2015 Intel Corporation.
[    2.481761] i40e: Intel(R) Ethernet Connection XL710 Network Driver -
version 2.1.14-k
[    2.534027] i40e: Copyright (c) 2013 - 2014 Intel Corporation.
[    2.547185] ata1.00: ATA-7: M5 IDE Disk, , max UDMA/66
[    2.547188] ata1.00: 16777216 sectors, multi 0: LBA
[    2.614939] ata1.00: configured for UDMA/33
[    2.624506] ixgb: Intel(R) PRO/10GbE Network Driver - version
1.0.135-k2-NAPI
[    2.624508] ixgb: Copyright (c) 1999-2008 Intel Corporation.
[    2.624531] i40evf: Intel(R) 40-10 Gigabit Virtual Function Network
Driver - version 3.0.0-k
[    2.624532] Copyright (c) 2013 - 2015 Intel Corporation.
[    2.640898] usbcore: registered new interface driver usb-storage
[    2.641296] mousedev: PS/2 mouse device common for all mice
[    2.641483] IR NEC protocol handler initialized
[    2.641485] IR RC5(x/sz) protocol handler initialized
[    2.641486] IR RC6 protocol handler initialized
[    2.641487] IR JVC protocol handler initialized
[    2.641488] IR Sony protocol handler initialized
[    2.641490] IR SANYO protocol handler initialized
[    2.641491] IR Sharp protocol handler initialized
[    2.641493] IR MCE Keyboard/mouse protocol handler initialized
[    2.641494] IR XMP protocol handler initialized
[    2.641819] gem5 DVFS handler is disabled
[    2.641822] gem5-energy-ctrl loaded at ffffff800899e000
[    2.641825] gem5_energy_ctrl_mc: gem5_mc_init: DVFS handler in energy
controller is disabled,                         ARM gem5 multi-cluster
cpufreq driver                         will not be registered
[    2.642190] usbcore: registered new interface driver usbhid
[    2.642191] usbhid: USB HID core driver
[    2.642322] NET: Registered protocol family 17
[    2.916496] scsi 0:0:0:0: Direct-Access     ATA      M5 IDE Disk
n/a  PQ: 0 ANSI: 5
[    2.935127] sd 0:0:0:0: [sda] 16777216 512-byte logical blocks: (8.59
GB/8.00 GiB)
[    2.952327] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    2.964648] sd 0:0:0:0: [sda] Write Protect is off
[    2.975518] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.986957] sd 0:0:0:0: [sda] Write cache: disabled, read cache:
enabled, doesn't support DPO or FUA
[    3.101444]  sda: sda1 sda2 sda3
[    3.109804] sd 0:0:0:0: [sda] Attached SCSI disk
[    3.452824] VFS: Mounted root (vfat filesystem) on device 8:1.
[    3.466085] devtmpfs: error mounting -2
[    3.475091] Freeing unused kernel memory: 384K
[    3.485519] Kernel panic - not syncing: No working init found.  Try
passing init= option to kernel. See Linux
Documentation/admin-guide/init.rst for guidance.
[    3.516805] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.14.0+ #2
[    3.530257] Hardware name: V2P-CA15 (DT)
[    3.539161] Call trace:
[    3.544930] [<ffffff8008088250>] dump_backtrace+0x0/0x370
[    3.557065] [<ffffff80080885d4>] show_stack+0x14/0x20
[    3.568513] [<ffffff800863ffe8>] dump_stack+0x8c/0xac
[    3.579903] [<ffffff80080b7338>] panic+0x11c/0x274
[    3.590712] [<ffffff8008652244>] kernel_init+0xec/0x100
[    3.602463] [<ffffff8008084348>] ret_from_fork+0x10/0x18
[    3.614433] Kernel Offset: disabled
[    3.622386] CPU features: 0x002000
[    3.630153] Memory Limit: 1024 MB
[    3.637726] ---[ end Kernel panic - not syncing: No working init found.
Try passing init= option to kernel. See Linux
Documentation/admin-guide/init.rst for guidance.

This is my ARM/gem5.fast simulation output. The following is my gem5
command:

build/ARM/gem5.fast --listener-mode=on -d /home/rock64/tmp/arm_
configs/example/fs.py --machine-type=VExpress_GEM5_V1
--kernel=vmlinux.arm.4.4 --disk-image=ubuntu-16.04.5-server-arm64.img
--mem-size=1GB --cpu-type=ArmV8KvmCPU --generate-dtb -n 1


best,
Da

On Tue, Apr 16, 2019 at 9:02 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 16 Apr 2019 at 13:53, Da Zhang <daz3@vt.edu> wrote:
> >
> > The qemu-system-aarch64 options support vda partition for the ubuntu
> installation. How to setup the options to support sda partition?
> > I was trying to use the image for my gem5 experiment but it gave me "[
> end Kernel panic - not syncing: No working init found.  Try passing init=
> option to kernel. See Linux Documentation/admin-guide/init.rst for
> guidance.". One difference I did notice is that all gem5 disk images (ARM
> and X86) I used are using /dev/sda. So, I want to try it and see if the
> problem fixed.
>
> You'll get 'sda' if QEMU exposes the disks to the
> guest as IDE or SCSI. 'vda' is for virtio block
> devices. 'vda' should work so I would recommend
> finding out why not rather than getting sidetracked
> into a different kind of guest disk setup that might
> not work either.
>
> If you post a link to the full boot up log then that
> will have enough information to tell whether the problem
> is that your guest kernel doesn't have virtio support
> built in or if something's wrong with your guest disk image.
>
> thanks
> -- PMM
>

--0000000000001fc6990586a6877b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>[=C2=A0 =C2=A0 2.36=
1820] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.</div><div>[=C2=A0=
 =C2=A0 2.375346] igb: Intel(R) Gigabit Ethernet Network Driver - version 5=
.4.0-k</div><div>[=C2=A0 =C2=A0 2.390986] igb: Copyright (c) 2007-2014 Inte=
l Corporation.</div><div>[=C2=A0 =C2=A0 2.403596] ixgbe: Intel(R) 10 Gigabi=
t PCI Express Network Driver - version 5.1.0-k</div><div>[=C2=A0 =C2=A0 2.4=
20739] ixgbe: Copyright (c) 1999-2016 Intel Corporation.</div><div>[=C2=A0 =
=C2=A0 2.437883] ixgbevf: Intel(R) 10 Gigabit PCI Express Virtual Function =
Network Driver - version 4.1.0-k</div><div>[=C2=A0 =C2=A0 2.458697] ixgbevf=
: Copyright (c) 2009 - 2015 Intel Corporation.</div><div>[=C2=A0 =C2=A0 2.4=
81761] i40e: Intel(R) Ethernet Connection XL710 Network Driver - version 2.=
1.14-k</div><div>[=C2=A0 =C2=A0 2.534027] i40e: Copyright (c) 2013 - 2014 I=
ntel Corporation.</div><div>[=C2=A0 =C2=A0 2.547185] ata1.00: ATA-7: M5 IDE=
 Disk, , max UDMA/66</div><div>[=C2=A0 =C2=A0 2.547188] ata1.00: 16777216 s=
ectors, multi 0: LBA</div><div>[=C2=A0 =C2=A0 2.614939] ata1.00: configured=
 for UDMA/33</div><div>[=C2=A0 =C2=A0 2.624506] ixgb: Intel(R) PRO/10GbE Ne=
twork Driver - version 1.0.135-k2-NAPI</div><div>[=C2=A0 =C2=A0 2.624508] i=
xgb: Copyright (c) 1999-2008 Intel Corporation.</div><div>[=C2=A0 =C2=A0 2.=
624531] i40evf: Intel(R) 40-10 Gigabit Virtual Function Network Driver - ve=
rsion 3.0.0-k</div><div>[=C2=A0 =C2=A0 2.624532] Copyright (c) 2013 - 2015 =
Intel Corporation.</div><div>[=C2=A0 =C2=A0 2.640898] usbcore: registered n=
ew interface driver usb-storage</div><div>[=C2=A0 =C2=A0 2.641296] mousedev=
: PS/2 mouse device common for all mice</div><div>[=C2=A0 =C2=A0 2.641483] =
IR NEC protocol handler initialized</div><div>[=C2=A0 =C2=A0 2.641485] IR R=
C5(x/sz) protocol handler initialized</div><div>[=C2=A0 =C2=A0 2.641486] IR=
 RC6 protocol handler initialized</div><div>[=C2=A0 =C2=A0 2.641487] IR JVC=
 protocol handler initialized</div><div>[=C2=A0 =C2=A0 2.641488] IR Sony pr=
otocol handler initialized</div><div>[=C2=A0 =C2=A0 2.641490] IR SANYO prot=
ocol handler initialized</div><div>[=C2=A0 =C2=A0 2.641491] IR Sharp protoc=
ol handler initialized</div><div>[=C2=A0 =C2=A0 2.641493] IR MCE Keyboard/m=
ouse protocol handler initialized</div><div>[=C2=A0 =C2=A0 2.641494] IR XMP=
 protocol handler initialized</div><div>[=C2=A0 =C2=A0 2.641819] gem5 DVFS =
handler is disabled</div><div>[=C2=A0 =C2=A0 2.641822] gem5-energy-ctrl loa=
ded at ffffff800899e000</div><div>[=C2=A0 =C2=A0 2.641825] gem5_energy_ctrl=
_mc: gem5_mc_init: DVFS handler in energy controller is disabled,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ARM gem5 multi-cluster cpufreq driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will not be regi=
stered</div><div>[=C2=A0 =C2=A0 2.642190] usbcore: registered new interface=
 driver usbhid</div><div>[=C2=A0 =C2=A0 2.642191] usbhid: USB HID core driv=
er</div><div>[=C2=A0 =C2=A0 2.642322] NET: Registered protocol family 17</d=
iv><div>[=C2=A0 =C2=A0 2.916496] scsi 0:0:0:0: Direct-Access=C2=A0 =C2=A0 =
=C2=A0ATA=C2=A0 =C2=A0 =C2=A0 M5 IDE Disk=C2=A0 =C2=A0 =C2=A0 n/a=C2=A0 PQ:=
 0 ANSI: 5</div><div>[=C2=A0 =C2=A0 2.935127] sd 0:0:0:0: [sda] 16777216 51=
2-byte logical blocks: (8.59 GB/8.00 GiB)</div><div>[=C2=A0 =C2=A0 2.952327=
] sd 0:0:0:0: Attached scsi generic sg0 type 0</div><div>[=C2=A0 =C2=A0 2.9=
64648] sd 0:0:0:0: [sda] Write Protect is off</div><div>[=C2=A0 =C2=A0 2.97=
5518] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00</div><div>[=C2=A0 =C2=A0 2.=
986957] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn=
&#39;t support DPO or FUA</div><div>[=C2=A0 =C2=A0 3.101444]=C2=A0 sda: sda=
1 sda2 sda3</div><div>[=C2=A0 =C2=A0 3.109804] sd 0:0:0:0: [sda] Attached S=
CSI disk</div><div>[=C2=A0 =C2=A0 3.452824] VFS: Mounted root (vfat filesys=
tem) on device 8:1.</div><div>[=C2=A0 =C2=A0 3.466085] devtmpfs: error moun=
ting -2</div><div>[=C2=A0 =C2=A0 3.475091] Freeing unused kernel memory: 38=
4K</div><div>[=C2=A0 =C2=A0 3.485519] Kernel panic - not syncing: No workin=
g init found.=C2=A0 Try passing init=3D option to kernel. See Linux Documen=
tation/admin-guide/init.rst for guidance.</div><div>[=C2=A0 =C2=A0 3.516805=
] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.14.0+ #2</div><div>[=C2=A0 =
=C2=A0 3.530257] Hardware name: V2P-CA15 (DT)</div><div>[=C2=A0 =C2=A0 3.53=
9161] Call trace:</div><div>[=C2=A0 =C2=A0 3.544930] [&lt;ffffff8008088250&=
gt;] dump_backtrace+0x0/0x370</div><div>[=C2=A0 =C2=A0 3.557065] [&lt;fffff=
f80080885d4&gt;] show_stack+0x14/0x20</div><div>[=C2=A0 =C2=A0 3.568513] [&=
lt;ffffff800863ffe8&gt;] dump_stack+0x8c/0xac</div><div>[=C2=A0 =C2=A0 3.57=
9903] [&lt;ffffff80080b7338&gt;] panic+0x11c/0x274</div><div>[=C2=A0 =C2=A0=
 3.590712] [&lt;ffffff8008652244&gt;] kernel_init+0xec/0x100</div><div>[=C2=
=A0 =C2=A0 3.602463] [&lt;ffffff8008084348&gt;] ret_from_fork+0x10/0x18</di=
v><div>[=C2=A0 =C2=A0 3.614433] Kernel Offset: disabled</div><div>[=C2=A0 =
=C2=A0 3.622386] CPU features: 0x002000</div><div>[=C2=A0 =C2=A0 3.630153] =
Memory Limit: 1024 MB</div><div>[=C2=A0 =C2=A0 3.637726] ---[ end Kernel pa=
nic - not syncing: No working init found.=C2=A0 Try passing init=3D option =
to kernel. See Linux Documentation/admin-guide/init.rst for guidance.</div>=
<div><br></div><div>This is my ARM/gem5.fast simulation output. The followi=
ng is my gem5 command:</div><div><br></div><div>build/ARM/gem5.fast --liste=
ner-mode=3Don -d /home/rock64/tmp/arm_ configs/example/fs.py --machine-type=
=3DVExpress_GEM5_V1 --kernel=3Dvmlinux.arm.4.4 --disk-image=3Dubuntu-16.04.=
5-server-arm64.img --mem-size=3D1GB --cpu-type=3DArmV8KvmCPU --generate-dtb=
 -n 1<br></div><div><br></div><div><br></div><div>best,</div><div>Da</div><=
/div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Apr 16, 2019 at 9:02 AM Peter Maydell &lt;<a href=3D"mai=
lto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Tue, 16 Apr 2019 at 13:53, Da Zhang &lt;<a href=3D"mailto:daz3@vt.edu" targ=
et=3D"_blank">daz3@vt.edu</a>&gt; wrote:<br>
&gt;<br>
&gt; The qemu-system-aarch64 options support vda partition for the ubuntu i=
nstallation. How to setup the options to support sda partition?<br>
&gt; I was trying to use the image for my gem5 experiment but it gave me &q=
uot;[ end Kernel panic - not syncing: No working init found.=C2=A0 Try pass=
ing init=3D option to kernel. See Linux Documentation/admin-guide/init.rst =
for guidance.&quot;. One difference I did notice is that all gem5 disk imag=
es (ARM and X86) I used are using /dev/sda. So, I want to try it and see if=
 the problem fixed.<br>
<br>
You&#39;ll get &#39;sda&#39; if QEMU exposes the disks to the<br>
guest as IDE or SCSI. &#39;vda&#39; is for virtio block<br>
devices. &#39;vda&#39; should work so I would recommend<br>
finding out why not rather than getting sidetracked<br>
into a different kind of guest disk setup that might<br>
not work either.<br>
<br>
If you post a link to the full boot up log then that<br>
will have enough information to tell whether the problem<br>
is that your guest kernel doesn&#39;t have virtio support<br>
built in or if something&#39;s wrong with your guest disk image.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000001fc6990586a6877b--
