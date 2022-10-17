Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2709004ejn;
        Mon, 17 Oct 2022 15:13:19 -0700 (PDT)
X-Received: by 2002:a6b:7d05:0:b0:68b:7243:63ff with SMTP id c5-20020a6b7d05000000b0068b724363ffmr5851517ioq.191.1666044799111;
        Mon, 17 Oct 2022 15:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666044799; cv=none;
        d=google.com; s=arc-20160816;
        b=i296bYKts5QWp1grB1swFGAT9JgZkTAWLFeOHC6+0QMhRnPeuAQaZviAMqlzQSX/XL
         yUPpy+3xGdSqTJfTUKh26/ULhVTEH/WuoipkY48sjTPBX/2B82YmPtnm1/rz966ky0he
         36BHgqyeDNgoAP0oXa0yUHn2FoWGxtUQr2D8HacAy/32WYRcGwAMQhvGnRpBS3YV7YxY
         NDPrw53RBtEn6Ri1QSggq5lHvilhUVmOJRmEJ2njFhl+/x+xdL5WS/P0Bm7J6x1l0TZ3
         4voN7m8CCRL7D8Ru/CvV04S9JNQLvOmaaNwZvMCj10R/k9AgJBpiEeLEBzdZb6kTAiyn
         y/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/gtq3CJ96vvC+n9rfHTr01pVVfhQvNAAqegK1gvN0EA=;
        b=eK093/x4sxPqFS8UufgocCzahDeo9Id29uGn7vq2SNvohmgiq2N6BBsrN3jgpJ+Jy3
         uDjSYkYbbFACVA0YxfF5xcSosqER6QSaMuIL+hIeyszTPaYEWEWPqq8aqfTyhROq9sBj
         izBKgmgCyfjsjUpX8hl/FkwPOdaSeDjOazITGq2s4M9BUWhzkqAbjD5L/XZGIyDwVTXQ
         hVeh0mLXQoZ1wmOn7+up8vXTViMMb+jnRbYOkbOGguBngKK03roQ62vpkRBHr6+zWFZ0
         vSk8zn6S83RA46Fg5/CuepIJvT5z511nQ9I7aThGqDsMPXFkV4G816zXRMwclcB1D+EY
         9ZIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fZR9iFLt;
       spf=pass (google.com: domain of paxi.three@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=paxi.three@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <paxi.three@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a192-20020a0216c9000000b00363df240ea7sor3773933jaa.101.2022.10.17.15.13.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Oct 2022 15:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of paxi.three@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fZR9iFLt;
       spf=pass (google.com: domain of paxi.three@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=paxi.three@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/gtq3CJ96vvC+n9rfHTr01pVVfhQvNAAqegK1gvN0EA=;
        b=fZR9iFLtLlq1tblXTiBBa0bx9DAqIflLknSV8Lc1sfFU//tacXOZ4/jTEBV9G198L1
         1Y57J+NZRCudNj2SWCnhcDPV9hX+Ts7xEew9oGKnskx34qPqz7eeia2Ggwr38T78A9lJ
         fH6pWTEnQR4cmyYf09aSwUU7UiVlUQg03uXi+8f9H3GwIcYWmXchavFOmDOFSOk1hJe/
         dSeyFlTd0WtuLcAGvtZVk2xMBlxduDSwV8iIj+pA9FGH52+qlykdqqFP8ns90beHwYOX
         VNIQ6drycZnYUAdpX8w5gBrsxExQP8vQaGFC5oNDofcix0RbZw8bqTJ/D8iC2KdBMcjb
         mRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gtq3CJ96vvC+n9rfHTr01pVVfhQvNAAqegK1gvN0EA=;
        b=AQ/uWfXXFKcf+DrwlJAVMwMAh8KAIELn0W6n/DWxOJ1TvbTUJPYm9jPzl+XDIxJb0B
         wcF25rYxbYH67Xcu1QReWdrjpW6aOseXiXOtqfCymmeseTuL5x7BBlODIBiO2hBhdQoZ
         sPyJtwu+mtpKBr98r7xj1vOwngJOLYkHAf39x3k/od09NWLBckEYkmWNLqheeJBVz6Xe
         fRCwTXdDnkJSg32MDOEjpy2RnpY6qXXiNVDNeggSxkHjzj3DbNm0FK1AlkmoAUC+0+S0
         lE+FZeSdrzlL1xfa44TyndrnjAU1BSfVTTQXQvTy09ns9rAEa36BOelERNFZvuUDt+HI
         p3WQ==
X-Gm-Message-State: ACrzQf0qjSQVFFt01ylImnhM0LbNhGUr8FR7ucCSMc643gh7oalWiDJQ
	GObuZOMIVurOcIsCBRKKqHU+ptzBam6a7OgTb91zfK3u
X-Google-Smtp-Source: AMsMyM7cinUnq5vFCOljXpJWhU7VArjKC56KWRQlJRpcc6qimLgA7JPA9Pz1KTjCWdF/lJXmXL+sKwSjkPyq9P6l/5c=
X-Received: by 2002:a05:6638:14cb:b0:363:ed95:ce4c with SMTP id
 l11-20020a05663814cb00b00363ed95ce4cmr22115jak.308.1666044798541; Mon, 17 Oct
 2022 15:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAChpoR45q6huduz7J7jrOrJz3gqHYT+jr1j=QKnfmPbj=wd_pg@mail.gmail.com>
 <878rlee4yf.fsf@linaro.org>
In-Reply-To: <878rlee4yf.fsf@linaro.org>
From: =?UTF-8?B?4K6k4K6+4K6a4K+GIOCvqQ==?= <paxi.three@gmail.com>
Date: Tue, 18 Oct 2022 03:43:05 +0530
Message-ID: <CAChpoR4g2cVFoXR-1MZqd8mtk=S4h0usoG5mpPfY9kaFoJ7kHQ@mail.gmail.com>
Subject: Re: Running server from within qemu
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000065a38b05eb424823"
X-TUID: npHIrJvnqrw2

--00000000000065a38b05eb424823
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thankyou Alex.  I will try this and let you know..

On Mon, Oct 17, 2022, 10:57 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> =E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AF=86 =E0=AF=A9 <paxi.three@gmail.com> wri=
tes:
>
> > Hi,
> >
> > I am new to using QEMU.  Is it possible to host a simple http/tcp serve=
r
> on a Linux which is running on qemu, without any
> > accompanying vm (KVM), and hit that http server from the host OS (say
> Windows)? What options should I choose in army
> > (command line args) to run any TCP based server from within qemu?
> >
> > As of now I use the following to start my OpenWRT Linux on QEMU:
> > $ qemu-sysyem-arm -M vert-2.9 -kernel openwrt-22.03.1-armvirt-32-zImage
> -no-reboot -nographic -drive
> > file=3Dopenwrt-32-rootfs-ext4.img,if=3Dvirtio,format=3Draw -append
> "root=3D/dev/vda" -m 1G -nic user -nic user
> >
>
> You have two nics in the command line. Anyway using a proper split
> -netdev/-device specification:
>
>   -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22 -device
> virtio-net-pci,netdev=3Dunet
>
> which in this case forwards tcp port 2222 on the host to port 22 on the
> guest. Just don't expect brilliant performance.
>
>
> > Thankyou
>
>
> --
> Alex Benn=C3=A9e
>

--00000000000065a38b05eb424823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thankyou Alex.=C2=A0 I will try this and=C2=A0let yo=
u know..<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Oct 17, 2022, 10:57 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto=
:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AF=86 =E0=AF=A9 &lt;<a href=3D"mailto:paxi.t=
hree@gmail.com" target=3D"_blank" rel=3D"noreferrer">paxi.three@gmail.com</=
a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am new to using QEMU.=C2=A0 Is it possible to host a simple http/tcp=
 server on a Linux which is running on qemu, without any<br>
&gt; accompanying vm (KVM), and hit that http server from the host OS (say =
Windows)? What options should I choose in army<br>
&gt; (command line args) to run any TCP based server from within qemu?<br>
&gt;<br>
&gt; As of now I use the following to start my OpenWRT Linux on QEMU:<br>
&gt; $ qemu-sysyem-arm -M vert-2.9 -kernel openwrt-22.03.1-armvirt-32-zImag=
e -no-reboot -nographic -drive<br>
&gt; file=3Dopenwrt-32-rootfs-ext4.img,if=3Dvirtio,format=3Draw -append &qu=
ot;root=3D/dev/vda&quot; -m 1G -nic user -nic user<br>
&gt;<br>
<br>
You have two nics in the command line. Anyway using a proper split<br>
-netdev/-device specification:<br>
<br>
=C2=A0 -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22 -device virtio-net-pc=
i,netdev=3Dunet<br>
<br>
which in this case forwards tcp port 2222 on the host to port 22 on the<br>
guest. Just don&#39;t expect brilliant performance. <br>
<br>
<br>
&gt; Thankyou<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div></div>

--00000000000065a38b05eb424823--
