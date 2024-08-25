Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp746150njb;
        Sun, 25 Aug 2024 05:31:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4zJVMllbzMUJl3sz+QDyap0++gzHuwIlBCvi+IzPiHtc99qacTCL9ZgF6jP9hR3Wi334wbrUV8kWgZg==@linaro.org
X-Google-Smtp-Source: AGHT+IGfeNp7HW2cmrpClYw59BMBZlYFWpESPwMlMgZtNWZGx3/irL3Vm/QXQfAGWrLvu/Bgmqho
X-Received: by 2002:a05:620a:4452:b0:7a1:e4bf:276 with SMTP id af79cd13be357-7a6897054c6mr901125685a.20.1724589114374;
        Sun, 25 Aug 2024 05:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724589114; cv=none;
        d=google.com; s=arc-20160816;
        b=leSYpyAcGwN0gFc/S+kqmeVR4KZdIqsa8PYz4NOMm3Y6rRhvzjzMyATqlAQkdio8v/
         C+2vvATVxYCNEWAb2fDRySlMr5RQSq+PV5sLbPrDFMiBgAS0JKDUUW/auz4TgBoLAldi
         ocsjEYbPbQ/d19HLbs59fAnomo5eOzUnx9Dp1mGS5UgkyqoBK0tBGQGfEJSP/nuADI0e
         UWsob2rL4JFZ9/lf/O5ZG60dvtY71KN7p0hZmjkMEclP3bi8NdBxhqJQQvj95rTrbgvn
         J/QNWFVzqG1ycrjalXN4tN+JxmO4/ZGboGczTs9rA2hPygNqqCvX2VHGeg+KuWhLdyPW
         aZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Y7ValXVRQfKatjL2PDNa+3UYr431/3hbtcsRsePRa4I=;
        fh=1GrNqXWJtU7WRphetQbK9FeKRYWoBsXSFvS9mpooR1Y=;
        b=VMiaabBbFsyoWWiFvvpt0IpdPL6sxcDCZ0+eJ1AjAzuH7K2VzVzI38J/h48gKM5wPl
         USCG6YSyCXxnTgfHlhEDtSisPBKoL+E6A/XGxueheYN9FzBkD3suLzPRANgcdtQn1kj0
         CxfKz5oiwL3ROzVwdqh1rtYWEhJw3agaUN8Y6udFVz4S6RV3hWyQ/IgQfJgAXZ78XJ8N
         Omcx3Uc3CbQnOcnDAhvkrqo34ZrsHFqPMpKKXnCR7b97FS/zqIWZCkpy4GmmJZtGsyQ2
         egxTOJbTPncD8a7Xw5YidYhRglDE7GkmwenWpkoSCgVBcNkFJN7MkrSXW04O8xc7Dt8t
         OIKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bkDyneUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a683c093a7si336562285a.277.2024.08.25.05.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2024 05:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bkDyneUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siCOt-00033k-TP; Sun, 25 Aug 2024 08:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1siCOq-00032q-P5; Sun, 25 Aug 2024 08:31:18 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1siCOl-0005Av-SC; Sun, 25 Aug 2024 08:31:15 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2d3bae081efso2678473a91.1; 
 Sun, 25 Aug 2024 05:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724589070; x=1725193870; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7ValXVRQfKatjL2PDNa+3UYr431/3hbtcsRsePRa4I=;
 b=bkDyneUWzWIYipQSLPlfhEiJnSKzRVXgSX0oc5lNhwJFuttM8wcOKTNWAVAIWFJgW1
 wv6ij9LqFMeSVFJyByzLMk2pzAV+uILtgH3DQbLKlZM6o+Y7o3YnNmwZi6AS7WkZ6E2e
 SmGl3/8HZfaYvEi6oqwe0sKEXGUX1MmemBVqbU0S/Cd4X5/7KGITNJunpVeJO1sVs3qQ
 oJIjhXRMSK5aZtJMG15FKZKgWj/JaKd2UEEjVOO2UVBXaRom8TInuvTR2RVFhhd/MwWf
 K1c2wc+5HdKY1ziGdPjmPqHalk7vHRsBOxwvSuRnNOxOQwzLNseTVbuGa/2FQ18rU7ge
 aXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724589070; x=1725193870;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y7ValXVRQfKatjL2PDNa+3UYr431/3hbtcsRsePRa4I=;
 b=hAe9F7bGun6so/p1Vk9KL2O2eY1z8Z37bHyFzFwG0KIGdWk7cVhpuYhggrBjVD+llA
 qjoSm80Gl6S/r9YYKYhOTk0/Xboxt80iAMWeFG4zIlSrBNQNihtK0VBJkZtrbs4Uwn0O
 P6YNUamKfMkhqDtsGOSVuS5+kNDOlUjpEL4364nGUjPUG+meco/NMhIVgzFHhyuHjJ73
 7yV9CtUl0oJoc4GS7eV+NUzOY5kG/RuzWdjfmNSMiydKWJ5CgcgwWNcZ2b2WptADd9r0
 mo53bmN/hxkAFxOY6XUPHsF1otvQOZXZxTGBddxcbqlwsuXLBzlRG7Xuwh0U+5DSc7/M
 +4eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNNX2HPNA9LBx/BUl1z33cggD6f/PmOTCODrm2mDM0HNtQUqaZfvgThm4Z3KixaAFAm1iqykiPJQ==@nongnu.org,
 AJvYcCWZ/d4eKMwchV6vZg6oNz+HqS2Trv+nPcv2Wh2wIAtfN8RCDXJd10YDonFfTHzleZ/at3TDQBkCylVzjCzR@nongnu.org
X-Gm-Message-State: AOJu0YzcZ/vgPfsfP2aNzK4VO1ZMTyoExZ1+u/YigwwyiIdqQSzJJqj9
 Dmai5fwGy2esywtqLDi9DyLFVoyoQ6ApGB9TFBoVOqI/QwCVu0zoLpjIEGj/i3Kn/aDPTAgGDpm
 Uafu0JY4AbSwTCrbUzSU4je6BXsob0i+4+jQ=
X-Received: by 2002:a17:90a:70ce:b0:2ca:8a93:a40b with SMTP id
 98e67ed59e1d1-2d646d383c3mr8003443a91.31.1724589069737; Sun, 25 Aug 2024
 05:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <CAFEAcA8J18z8WubfzLu-DmTp6vGwcy4D652ib-KReqNS0whMVA@mail.gmail.com>
 <CA+1FSiir=RG1BTKF29BKxmO+GWDieyW6TxzWtdEX-CYu7a+z5g@mail.gmail.com>
 <CA+1FSij3LJc9S2ChBY-pHZ8QacFt2P0ygsr9LRK9FXLyMJrorQ@mail.gmail.com>
 <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
 <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
 <CAFEAcA_zRSgFhs+kauEfkyzAYg2RwSBrkagDEoj5OCgm5j6=iQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_zRSgFhs+kauEfkyzAYg2RwSBrkagDEoj5OCgm5j6=iQ@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Sun, 25 Aug 2024 14:30:33 +0200
Message-ID: <CA+1FSigzZxzdgTCWNRz3UGgTH5mRN8XTWWkeTU20N2ey4a+i+Q@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm <qemu-arm@nongnu.org>,
 "cc: Sergey Kambalin" <sergey.kambalin@auriga.com>, 
 qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e2a6370620812e27"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
X-TUID: WWuYoyec9RBu

--000000000000e2a6370620812e27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When I unpack this file :

lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi4-atv.img

I get these files :

0.fat
1.img
2.img
3.img

So,I assume that :

0.fat is : initrd
1.img is : system-rw.img
2.img is   :  vendor-rw.img
3.img is   :  userdata.img

If I use 0.fat as initrd,like this :

-initrd
/mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-rpi=
4-atv/0.fat

I get this message :

rootfs image is not initramfs (invalid magic at start of compressed
archive); looks like an initrd

it looks like an initrd : right,it's true : it is initrd. (for this reason
I've assumed that 0.fat is initrd...


On Sun, Aug 25, 2024 at 1:26=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Sun, 25 Aug 2024 at 11:45, Mario Marietto <marietto2008@gmail.com>
> wrote:
> >
> > Please look at this example :
> >
> > qemu-system-aarch64 \
> > -smp 4 \
> > -m 2048 \
> > -cpu cortex-a72 \
> > -machine virt \
> > -serial stdio \
> > -kernel
> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-r=
pi4-atv/boot/Image
> \
>
> This (assuming it's the complete command line your script is
> running) doesn't pass any arguments telling QEMU to provide a
> root disk, and it doesn't pass any arguments to the kernel
> telling it what root disk to use...
>
> > [    0.000000] Kernel command line: console=3DttyAMA0,115200
> kgdboc=3DttyAMA0,115200 root=3D/dev/mmcblk0p2 rootfstype=3Dext4 rootwait
> androidboot.serialno=3D10000000abcd1234
> androidboot.btmacaddr=3D11:22:33:44:55:66
>
> ...so the kernel defaults to "/dev/mmcblk0p2" as its root disk because
> it's using the command line argument that was compiled into it...
>
> > [    0.658240] Waiting for root device /dev/mmcblk0p2...
>
> ...and then it's hanging around forever waiting for that.
>
> You need to:
>  (1) pass QEMU arguments telling it to provide a root fs
>  (2) pass the kernel arguments telling it to look for the
>      root fs in the place where QEMU is providing it
>
> Your other command line looks more on the right lines:
>
>         -kernel
>
> /mnt/zroot2/zroot2/OS/Linux/lineage-21.0-20240618-UNOFFICIAL-KonstaKANG-r=
pi4-atv/boot/Image
> \
>         -initrd
>
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
> though I wonder if the kernel really expects a
> FAT file for the initrd, given it complains:
>
> [    0.344033] Trying to unpack rootfs image as initramfs...
> [    0.344947] rootfs image is not initramfs (invalid magic at start
> of compressed archive); looks like an initrd
>
> and then later
>
> [    5.905329] RAMDISK: Couldn't find valid RAM disk image starting at 0.
>
> I think if I were you I'd start by figuring out what's going on
> with the initrd.
>
> thanks
> -- PMM
>


--=20
Mario.

--000000000000e2a6370620812e27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0);background-color:rgb(255,255,255)">When I unpack this file=
 :</span></span></div><div><span style=3D"font-family:monospace"><span styl=
e=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></span>=
</div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(0=
,0,0);background-color:rgb(255,255,255)">lineage-21.0-20240618-UNOFFICIAL-K=
onstaKANG-rpi4-atv.img</span></span></div><div><span style=3D"font-family:m=
onospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)=
"><br></span></span></div><div><span style=3D"font-family:monospace"><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">I get these fi=
les :</span></span></div><div><span style=3D"font-family:monospace"><span s=
tyle=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></sp=
an></div><div><span style=3D"font-family:monospace"><span style=3D"color:rg=
b(0,0,0);background-color:rgb(255,255,255)">0.fat</span><span style=3D"colo=
r:rgb(0,0,0);background-color:rgb(255,255,255)">
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
div><span class=3D"gmail-im">rootfs image is not initramfs (invalid magic a=
t start of compressed archive); looks like an initrd</span></div><div><span=
 class=3D"gmail-im"><br></span></div><div><span class=3D"gmail-im">it looks=
 like an initrd : right,it&#39;s true : it is initrd. (for this reason I&#3=
9;ve assumed that 0.fat is initrd...</span></div><div><span class=3D"gmail-=
im"><br></span></div><div><span style=3D"font-family:monospace"></span></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, Aug 25, 2024 at 1:26=E2=80=AFPM Peter Maydell &lt;<a href=3D"mail=
to:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 25 Aug 2024 at=
 11:45, Mario Marietto &lt;<a href=3D"mailto:marietto2008@gmail.com" target=
=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br>
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

--000000000000e2a6370620812e27--
