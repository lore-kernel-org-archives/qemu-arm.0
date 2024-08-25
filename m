Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp730814njb;
        Sun, 25 Aug 2024 04:27:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDVc3MsBx3WoiLNUNhWejuAh/vy0Z9RUIpsu6JwimfokmjrgdJHPIq8D1HquFkaaNxE91z0io+i0YVjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEA0sSczgS0IB+DpdU5T0p7twQSQo4uODMgVvDkbhPz0E5k1ALGx62NwIDggkqpaDnESfbD
X-Received: by 2002:a05:6102:cd1:b0:494:5b9d:529e with SMTP id ada2fe7eead31-498f4c3fe10mr7959314137.26.1724585221618;
        Sun, 25 Aug 2024 04:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724585221; cv=none;
        d=google.com; s=arc-20160816;
        b=idxo8y4kygu5NHkttECqfo91Tjow4bs42iEFFMt74eQtcFpFTYmp2A9iGVKhwlFoR8
         HZt378DXcO5egVcFYjb8wGkBHtcMERRqGaRyC+YM7scVnF86aBXyN3Qp1GsF0WUklT+M
         XEkLssnr5Hf6B9S/CEHiI3nk03J/dTmHKdMGPZ3ba2YZ6Yt7okUZnvlGDRYx3XhOrfxN
         Tf7cSbvQZ8+rbBRizdl1m2FnKE7rMVIo6KrbB7Z+NAkVLP+ZSC3o0iUx1fAcd/IhCgJh
         ia936iZjBMt6xpo2Bg4pf6Oon99/NxOKuwzkwfDt2Ku5cNigfNLcfm/kwEAGTuuEArWC
         V8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=q67zpVxYeiTbkns0hkW22kkvgJPHA9+yoOW+7Wgx6bE=;
        fh=/sw/xdKrP0oey34WEnbi7epCGTjKmn3KAL4niOxLep0=;
        b=ZeLT/KzsywsvYmBj9+KiB+dI+P8cj6kBXDHCdOOVuh+9mNjUWaB8dqQ+CaE4KGd1bK
         FgJceYKaKplhlZiOg0tFV/kXc0TSl5Gu50Fs26oKvl8EICYJjVjjr4EAyHI0Jrcn2/q+
         oMcu6tQVm5bCH43ABI27Jb990myUQbulp0A283PLyXzVc3rNtEziTbxPeSX6LbqomWki
         Y9XmBQcHTYWW850p8QjVMu2qJEMZWHkYFhVddLivUme8/xjUN3AKC6J+SQFjC314tKAh
         Juvl1kNvsqpWYDcGissG+kNLsBXo4ViVk6HeHjeKVCbfAMYan+1d0BQE6UqJktCQQrLq
         NmIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hr3r10x8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f441c1asi912719285a.684.2024.08.25.04.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2024 04:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hr3r10x8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siBOY-0005QD-Hc; Sun, 25 Aug 2024 07:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1siBOW-0005NT-Jm
 for qemu-arm@nongnu.org; Sun, 25 Aug 2024 07:26:52 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1siBOU-0006Hp-BO
 for qemu-arm@nongnu.org; Sun, 25 Aug 2024 07:26:52 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bec4e00978so3304324a12.0
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2024 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724585208; x=1725190008; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q67zpVxYeiTbkns0hkW22kkvgJPHA9+yoOW+7Wgx6bE=;
 b=hr3r10x8Awy/+Dxra0Ma/OGE0BP2Wrm7a4xU5/Gy/SipQ8k/easLYTco46HlG9VMcz
 /mt369CkSosu5HFdOFFVQ2uxGJ0AA9Fje8TeO1mXSkjvKvRqvlDfKbsKKHbCxskfQt5X
 udw8oP0TBDuNztCow6fbuESG7N3sujuM9ne65WLiBQeg9+MK1mYlfrrfRha+ZwWCAQ37
 ubZ7IpnU4TgZ1CcyzE2AQ6iDjU2BuAUFRQf2PTHN8rwD3NLShet2Rqk/zh/zCBgDWsGG
 LA0dhoClkwsRdBEHMz8I1l5QplWPC/sIgfUt+7Cve4fv9a6rL913WbvXGMdA0z4EmlUN
 HgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724585208; x=1725190008;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q67zpVxYeiTbkns0hkW22kkvgJPHA9+yoOW+7Wgx6bE=;
 b=wnFAqPiVsEakl60qq2WGL4V3Pqngx1wrUJVOIAQu6vASVFUynJUbqNeGa1QyfxuRHp
 0hj70kZ5+v4ePogSBFZW4+5+BpMH5imHc0gWxkkkOMtXgtwZapX8HP9o4/NP3sxqiNDb
 Pi0jv+datpQy0n57vunzyVW1YuWoQSLcfN7UGky9ImjeifWSvW3tPMTcMZu6XhGu5dhm
 a2tSwbiEQAQEgFXFI1UUiwC9R3PLLlAde/KhSjNlaw8b0yjP8xvKArhQVv24QXI2QmLa
 EicKBvGCEvBoWfF6EfQeB4MIjUINXi2eq0St0qEgckV6y1/uX4wwXTdpD1QtAkYswP8w
 F6VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoWiaYOUmSFEafT2at3VrmlTHKY/WVuukOD9HFuNCnD1Kypd37a8GIanRIJWQrs+PS+pAJCmW3Ig==@nongnu.org
X-Gm-Message-State: AOJu0Yw5v3guzWoe4wY9m4zoBW1O2JbSj41wv7pgbf9KGwgWM6INUCsn
 sI1gPc3HiWWtddYb09rKuRAG24Vp3jidSnAYc00t0ba4k+YvuHeDXfCZJ3nrDn3/3G9/wDCjmqL
 Cw1aWwcaY74CNMyEcMUAdv71U6UqvxHJnZWtLPA==
X-Received: by 2002:a05:6402:40c6:b0:5a2:5bd2:ca50 with SMTP id
 4fb4d7f45d1cf-5c0891a032bmr4891220a12.25.1724585208394; Sun, 25 Aug 2024
 04:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <CAFEAcA8J18z8WubfzLu-DmTp6vGwcy4D652ib-KReqNS0whMVA@mail.gmail.com>
 <CA+1FSiir=RG1BTKF29BKxmO+GWDieyW6TxzWtdEX-CYu7a+z5g@mail.gmail.com>
 <CA+1FSij3LJc9S2ChBY-pHZ8QacFt2P0ygsr9LRK9FXLyMJrorQ@mail.gmail.com>
 <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
 <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
In-Reply-To: <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2024 12:26:36 +0100
Message-ID: <CAFEAcA_zRSgFhs+kauEfkyzAYg2RwSBrkagDEoj5OCgm5j6=iQ@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Mario Marietto <marietto2008@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm <qemu-arm@nongnu.org>,
 "cc: Sergey Kambalin" <sergey.kambalin@auriga.com>, 
 qemu-discuss@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vf9pUhdIH0Yj

On Sun, 25 Aug 2024 at 11:45, Mario Marietto <marietto2008@gmail.com> wrote:
>
> Please look at this example :
>
> qemu-system-aarch64 \
> -smp 4 \
> -m 2048 \
> -cpu cortex-a72 \
> -machine virt \
> -serial stdio \
> -kernel /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image \

This (assuming it's the complete command line your script is
running) doesn't pass any arguments telling QEMU to provide a
root disk, and it doesn't pass any arguments to the kernel
telling it what root disk to use...

> [    0.000000] Kernel command line: console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait androidboot.serialno=10000000abcd1234 androidboot.btmacaddr=11:22:33:44:55:66

...so the kernel defaults to "/dev/mmcblk0p2" as its root disk because
it's using the command line argument that was compiled into it...

> [    0.658240] Waiting for root device /dev/mmcblk0p2...

...and then it's hanging around forever waiting for that.

You need to:
 (1) pass QEMU arguments telling it to provide a root fs
 (2) pass the kernel arguments telling it to look for the
     root fs in the place where QEMU is providing it

Your other command line looks more on the right lines:

        -kernel
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/boot/Image
\
        -initrd
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/0.fat
\
        -drive index=0,if=none,id=system,file=/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/1.img
\
        -device virtio-blk-pci,drive=system \
        -drive index=1,if=none,id=vendor,file=/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/2.img
\
        -device virtio-blk-pci,drive=vendor \
        -drive index=2,if=none,id=userdata,file=/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv/3.img
\
        -device virtio-blk-pci,drive=userdata \

though I wonder if the kernel really expects a
FAT file for the initrd, given it complains:

[    0.344033] Trying to unpack rootfs image as initramfs...
[    0.344947] rootfs image is not initramfs (invalid magic at start
of compressed archive); looks like an initrd

and then later

[    5.905329] RAMDISK: Couldn't find valid RAM disk image starting at 0.

I think if I were you I'd start by figuring out what's going on
with the initrd.

thanks
-- PMM
