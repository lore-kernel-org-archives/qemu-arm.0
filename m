Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4014286wrx;
        Tue, 16 Apr 2019 07:47:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9WYbhxZNsIU/bNnAVAmLHzXBT4OGJxf6S7kc8ETvvs/EObW3qc8wQdIV/1Me4W8mtN/L5
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr25795759wmc.117.1555426029056;
        Tue, 16 Apr 2019 07:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555426029; cv=none;
        d=google.com; s=arc-20160816;
        b=quCCPCLYRI3zc/9X1Hjap/mu/R0jKv+AGVLhr2qNC4d5bYdlRXO2n92CpDLfbQhVE0
         eyH3XvqKVB2m51nDIOm9D7Y5Em7bD0uBEc6jfjLpcALhJrBLucAdIwuLAICpfYNlvWJ3
         MuEJtP23a8ltfbh8cJIrM5yNYU38a/c4pdx/y8fUhl2cooz+g13gVQwijVAKLurwIUNn
         lP8Ly/dhnfoP8rq0KaEyrtkIj+WY9Q+BGWUyD/cyAHyIK3n3ncmaXnLKzZc2AI1fWLLy
         Qnhqgpya8+QZ3adj1g0t2FegpwdWb8+6N6/hwbUuWLitIcpiuwnqb5DJJjPHmpakaIDw
         3Ofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dRHIS3TI9eFky6WoU3+V8tb1f4pMlfwstQpcvhZaEwg=;
        b=KgYwXecp49YrGROI5moqcynBjnq7k/ePsKjBzbVSwwdpk4bCClL/et+KkgwhWMuBO9
         CGdm2M3cddUctsUGTyjxTcKzYd/7nw2UPpT0IBGlhaXwvGomQsj0wkTGmERnG9xVYr6d
         Yt6F0bd0VTC2uOk77Dy8dP0wah6yxPRyIWZ/EuK87KDJzuk2YyZexheaNXJL/2Vbm6Rk
         kMsba9P7nF6LJyd1Ed+Rg9D49XnMPKXqm1XYX5h8vIKXwQBKfIwFC34WKW+75LaHsgTs
         AQbyX7MGbCdQO99XzmTAM64byD5XjgEtyPHfjvOIuMszwNUdNUnOunNxdPb0maVQPo89
         gIHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hCAishr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si13403777wmg.195.2019.04.16.07.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 07:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hCAishr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGPMa-0005NF-7C
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 10:47:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGPMP-0005N1-Dp
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 10:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGPMO-000772-BK
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 10:46:57 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGPMO-00076g-1s
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 10:46:56 -0400
Received: by mail-oi1-x244.google.com with SMTP id x188so17153824oia.13
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 07:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dRHIS3TI9eFky6WoU3+V8tb1f4pMlfwstQpcvhZaEwg=;
	b=hCAishr4i6JSZueas0LjPaeO4Oo7Mme1nHF35in1nlUjXRiwZDfthqyfBnqKCk2I3+
	ogqFFMp0vE2YZTNHahgJosfuYbecLuGvltDtb032yfJK49bgHlyHJuGcemSw1QU3SbhA
	biLvGxm4ZicNaV5AOXbMDJy+U8Ci8lJVvh6Ws4zkwU7KaW0BSRC+zZJEXv/QFfVRp4uo
	wf+pJGpE3ekX5gekdvYP0Gx0MA3MvBZ0UC57NGz/8QyyNglUqzi/1VlzJZtRCI7raqNJ
	0UiqzXZKEUJDVevyW1ekjWs6Yazv+WZ+cwuZ5Z/IxbOvIjObkAXNY1ZtIV5fs+csGNLn
	dj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dRHIS3TI9eFky6WoU3+V8tb1f4pMlfwstQpcvhZaEwg=;
	b=QxNhIvjb1qIyizfZuRBaCSxcqRcgogoQ8u9liF8mjJmOGQ/rxmWBe7GlbQgjQRj1Nz
	HQda+W4ENMdAOwFkDmb3Y3VlRZAgEhVCpm2GK6pMs5dtbl2XdRLaePXun337Mp2gBFoq
	D9hdaQFWYDZcpaO8FK71kl8kqzURvZgRi97Mwgiv0Y71b/7y5JIqA73JbtoZeE608wRA
	PxPBriTtkkdHAm0nmIklaGaKQpbiYIghgAOLRFndiAVLR1lOGNFS8aXvCP47qplx9+jt
	3L8E1UDvyg7udJPpvY5Tg/WlhxbO53XjB1eqwyYvroSs3nBlzxiPKjLbVanU6iK1iSHd
	qQGA==
X-Gm-Message-State: APjAAAX9HzdK470DoWptRo/HpnNhvwXQ/itP4aZIosuxXOAnz5r0LqWu
	ikao8xacVob/3KaJ01A+jfFmKhKJOjKpbQd3zyiy3Q==
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr24384440oif.98.1555426014744;
	Tue, 16 Apr 2019 07:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
	<CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
	<CANY2w+0ZULuVgJTu3M+--rC01biqS=y1V4tAbgjHfyKRd6X79A@mail.gmail.com>
	<CAFEAcA9zP8OateFNU+Ea1thk4NkYgcee5ykEscaguC=hAhXfag@mail.gmail.com>
	<CANY2w+3qJgQ_HVai6trQ_gDXxPLruj1-L6LaTkcUZQbtQBofpg@mail.gmail.com>
	<CAFEAcA9gciZ3_zY-XMoC8o0P4ffvHhC0w=ZDA6biXyovx_H2cQ@mail.gmail.com>
	<CANY2w+1UhFKHOfgVEmPDGwMsH8o3nWi7VsNFRkx2Yw3N5nO5dQ@mail.gmail.com>
In-Reply-To: <CANY2w+1UhFKHOfgVEmPDGwMsH8o3nWi7VsNFRkx2Yw3N5nO5dQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Apr 2019 15:46:43 +0100
Message-ID: <CAFEAcA_r2MTgVA-e1ozP0ySNzWWYTu2sKk52sk5a3_Hd__KO9A@mail.gmail.com>
To: Da Zhang <daz3@vt.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-TUID: hJBgoDxrEPKR

On Tue, 16 Apr 2019 at 15:24, Da Zhang <daz3@vt.edu> wrote:
>

This seems to be missing some output from the start of boot.

> [    2.361820] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    2.375346] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
> [    2.390986] igb: Copyright (c) 2007-2014 Intel Corporation.
> [    2.403596] ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver - version 5.1.0-k
> [    2.420739] ixgbe: Copyright (c) 1999-2016 Intel Corporation.
> [    2.437883] ixgbevf: Intel(R) 10 Gigabit PCI Express Virtual Function Network Driver - version 4.1.0-k


> [    2.642190] usbcore: registered new interface driver usbhid
> [    2.642191] usbhid: USB HID core driver
> [    2.642322] NET: Registered protocol family 17
> [    2.916496] scsi 0:0:0:0: Direct-Access     ATA      M5 IDE Disk      n/a  PQ: 0 ANSI: 5
> [    2.935127] sd 0:0:0:0: [sda] 16777216 512-byte logical blocks: (8.59 GB/8.00 GiB)
> [    2.952327] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [    2.964648] sd 0:0:0:0: [sda] Write Protect is off
> [    2.975518] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [    2.986957] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [    3.101444]  sda: sda1 sda2 sda3
> [    3.109804] sd 0:0:0:0: [sda] Attached SCSI disk
> [    3.452824] VFS: Mounted root (vfat filesystem) on device 8:1.

We found and mounted the ISO image's VFAT partition...

> [    3.466085] devtmpfs: error mounting -2
> [    3.475091] Freeing unused kernel memory: 384K
> [    3.485519] Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.

...but unsurprisingly that is not a workable root filesystem.

> [    3.516805] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.14.0+ #2
> [    3.530257] Hardware name: V2P-CA15 (DT)
> [    3.539161] Call trace:
> [    3.544930] [<ffffff8008088250>] dump_backtrace+0x0/0x370
> [    3.557065] [<ffffff80080885d4>] show_stack+0x14/0x20
> [    3.568513] [<ffffff800863ffe8>] dump_stack+0x8c/0xac
> [    3.579903] [<ffffff80080b7338>] panic+0x11c/0x274
> [    3.590712] [<ffffff8008652244>] kernel_init+0xec/0x100
> [    3.602463] [<ffffff8008084348>] ret_from_fork+0x10/0x18
> [    3.614433] Kernel Offset: disabled
> [    3.622386] CPU features: 0x002000
> [    3.630153] Memory Limit: 1024 MB
> [    3.637726] ---[ end Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
>
> This is my ARM/gem5.fast simulation output. The following is my gem5 command:
>
> build/ARM/gem5.fast --listener-mode=on -d /home/rock64/tmp/arm_ configs/example/fs.py --machine-type=VExpress_GEM5_V1 --kernel=vmlinux.arm.4.4 --disk-image=ubuntu-16.04.5-server-arm64.img --mem-size=1GB --cpu-type=ArmV8KvmCPU --generate-dtb -n 1


Wait, are you running this on QEMU or on GEM5?

Anyway, the lack of anything virtio related in the output you
quote leads me to suggest you check that your guest kernel
config has all the virtio devices in it. You might as well
add in PCI too (you want CONFIG_PCI, CONFIG_VIRTIO_PCI,
CONFIG_PCI_HOST_GENERIC, CONFIG_VIRTIO_BLK, CONFIG_VIRTIO_NET,
CONFIG_VIRTIO_MMIO).

Also, have you actually managed to do an install onto the
hard disk image yet? If not, then something is going wrong
before here that it's not doing an install properly.

thanks
-- PMM
