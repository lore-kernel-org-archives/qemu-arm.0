Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3237673lfp;
        Sun, 2 Feb 2020 13:43:50 -0800 (PST)
X-Received: by 2002:a6b:600f:: with SMTP id r15mr16049446iog.54.1580679830740;
        Sun, 02 Feb 2020 13:43:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580679830; cv=none;
        d=google.com; s=arc-20160816;
        b=wYNw8PjYeeIEFA6i5PQ6YhiLFuHW4/lf0BV8C4wWJD1jgL2DP/4AG9kWLHGtxePNK/
         i2mbrsQ/RJnaZ8PmcUg+RY8gR5aPNJ580u+mlQbs+/o3lBr0bs/jMrnLQK4EfjiuuVtJ
         f2f9LgL9E0cI4tf0QLUG3eRfue9VYBVuVd1kTintxTeiI8gzLApUZG6aK06dWoutsKDk
         k/bIaL0zY0l6pmCGxcEYMncip6eUj8TE8100P2bMpHuumFSXPB1sjHu+XipNXs+Cc4Ss
         xAz+WuzDQnpA0A1GhzZlrHABK1D6lDR/s5S7EhMfYWgHCZSl1l3wiqo/4EbgGIoiwiR7
         36Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pQAOyvZCxX2t+S3wlFpJjQKG21Xr2E/8UGs0vZsuCvE=;
        b=DkFr+XJ4J78117ZjLyOejN+MrQLsffWiFnsKhJr7uS/LnneghFMDc3WjaWnuQ9Bxeo
         alBpc6z5C0DR66xuBYLBJIqa0UdUgDggKBANpvDWoR5nmZ4ep0e6x5OWP8gDKoZy50xN
         JyWuRoyWxsWE221PSnf+U13pOd8+8IqdpVV5f49sSw8HtrDu+Mf/O4p1gfI0+NHX2EqP
         oPC0RlhLKARHMMpOQTGgeeZ1KWybt9vd6HJk5FwGDwtCN39CAOrSld67hh2+rl67f+M6
         sw/Ju7HAvYQ90hXXIyda19ThJq32XwosrlGaeSdGdO6Abpx0Pg4dxA7Lag6rgdQSObNX
         naKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=o6w53i5U;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c3sor9990791ill.121.2020.02.02.13.43.50
        (Google Transport Security);
        Sun, 02 Feb 2020 13:43:50 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=o6w53i5U;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pQAOyvZCxX2t+S3wlFpJjQKG21Xr2E/8UGs0vZsuCvE=;
        b=o6w53i5U1L9X4kyyxzee+szMiRPTJq09MXZTKGRwjiFUkGlpvMVGYwxfayTBxtAfwv
         2thAcOhnXxa/PphIjZJDjIvUi3GY2S6faphUjFuYrKVgVdATqddUUtTCRxT5qn1SFGYG
         tEaaQFZKCCX8atTVyJBu1XOuyQS2XwFxWUeeb2fu1PVY53Q7OmxdlY8qd3ERfY9Ecw3N
         AjjDT8YAzQLRxQAEcKJPEgnDsB1trZ+Wmyo2M4f4fy+8KJCJ3mZEk3HK1a7xMJTEtX2p
         JNeka+f8SMSYPcLzNXVnajIMJiuYxDxwNxfF6qopfkCXkCXUwaFeNNDUBL82q6e1t5SQ
         jptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pQAOyvZCxX2t+S3wlFpJjQKG21Xr2E/8UGs0vZsuCvE=;
        b=J0DBhI39Hn7kLj42dSUYHyTBf67RUHaw+QCOQFEDKyct4HQT56ZNyo7wLPFpj/gvZM
         TIZF1lSoxV6/gPoa5X+dcuCs6CF6EHRz9uRFXqYA2+izj0eW66OJ07vqg2Dyk+7NeHBs
         MPZVQi1rlLE2BfoiUoc0zrvtaA9xHmeBvMiNX0LdJzvYqSoNL0IIoY1HmYAlHfJdiybo
         fqae0zXC5fW6ugJReNfyJ7LQrSQ7WxV3Sc2r/4r6fgtPkoU/CCaGKtH2fcP0Fytcsqsc
         o/UpYJYigD5FR/zrovyYC6siUU55uSQJBhgwzGZmppXHGOYfbBBmTVfigNtqk1dGgHRi
         Se8g==
X-Gm-Message-State: APjAAAWWeEz0LmPqJuiXNp2BEmuMXLTysRkGf1+Lo57bJs9m5MbAZQlX
	nFtkvE5miMcb4MYjj1y0t8WO60reuf3GAhXsbik=
X-Google-Smtp-Source: APXvYqz46jya3SDG1xYPFoIkwOwpJr7sJUNBGN2mG+/0W+poPZeNrkLO11JFgBJnqUgWlHzvXvPQ44RkYv4o0CafG3g=
X-Received: by 2002:a92:88dc:: with SMTP id m89mr12737000ilh.265.1580679830409;
 Sun, 02 Feb 2020 13:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-9-nieklinnenbank@gmail.com> <e9c31386-d471-159a-6cb0-7e621cb3bc83@redhat.com>
In-Reply-To: <e9c31386-d471-159a-6cb0-7e621cb3bc83@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 2 Feb 2020 22:43:39 +0100
Message-ID: <CAPan3WpJnd4YPa1DT_5Z6+i5yVahAE7sFHZ6JXqC69KstFG+Mg@mail.gmail.com>
Subject: Re: [PATCH v4 08/20] hw/arm/allwinner: add SD/MMC host controller
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Beniamino Galvani <b.galvani@gmail.com>, jasowang@redhat.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, imammedo@redhat.com
Content-Type: multipart/alternative; boundary="000000000000cb9547059d9eb341"
X-TUID: q6l+Q1ISSVrD

--000000000000cb9547059d9eb341
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Sun, Jan 19, 2020 at 8:02 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 1/19/20 1:50 AM, Niek Linnenbank wrote:
> > The Allwinner System on Chip families sun4i and above contain
> > an integrated storage controller for Secure Digital (SD) and
> > Multi Media Card (MMC) interfaces. This commit adds support
> > for the Allwinner SD/MMC storage controller with the following
> > emulated features:
> >
> >   * DMA transfers
> >   * Direct FIFO I/O
> >   * Short/Long format command responses
> >   * Auto-Stop command (CMD12)
> >   * Insert & remove card detection
> >
> > The following boards are extended with the SD host controller:
> >
> >   * Cubieboard (hw/arm/cubieboard.c)
> >   * Orange Pi PC (hw/arm/orangepi.c)
> >
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >   include/hw/arm/allwinner-a10.h   |   2 +
> >   include/hw/arm/allwinner-h3.h    |   3 +
> >   include/hw/sd/allwinner-sdhost.h | 135 +++++
> >   hw/arm/allwinner-a10.c           |  11 +
> >   hw/arm/allwinner-h3.c            |  15 +-
> >   hw/arm/cubieboard.c              |  15 +
> >   hw/arm/orangepi.c                |  16 +
> >   hw/sd/allwinner-sdhost.c         | 848 ++++++++++++++++++++++++++++++=
+
> >   hw/sd/Makefile.objs              |   1 +
> >   hw/sd/trace-events               |   7 +
> >   10 files changed, 1052 insertions(+), 1 deletion(-)
> >   create mode 100644 include/hw/sd/allwinner-sdhost.h
> >   create mode 100644 hw/sd/allwinner-sdhost.c
>
> Failure at build if configured with --without-default-devices:
>
>    CC      arm-softmmu/hw/sd/allwinner-sdhost.o
>    CC      arm-softmmu/hw/arm/orangepi.o
>    CC      arm-softmmu/hw/arm/allwinner-h3.o
>    LINK    arm-softmmu/qemu-system-arm
> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function
> `allwinner_sdhost_send_command':
> hw/sd/allwinner-sdhost.c:239: undefined reference to `sdbus_do_command'
> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function `allwinner_sdhost_read=
':
> hw/sd/allwinner-sdhost.c:517: undefined reference to `sdbus_data_ready'
> /usr/bin/ld: hw/sd/allwinner-sdhost.c:518: undefined reference to
> `sdbus_read_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.c:519: undefined reference to
> `sdbus_read_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.c:520: undefined reference to
> `sdbus_read_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.c:521: undefined reference to
> `sdbus_read_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function
> `allwinner_sdhost_process_desc':
> hw/sd/allwinner-sdhost.c:340: undefined reference to `sdbus_read_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.c:334: undefined reference to
> `sdbus_write_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function
> `allwinner_sdhost_write':
> hw/sd/allwinner-sdhost.c:651: undefined reference to `sdbus_write_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.c:652: undefined reference to
> `sdbus_write_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.c:653: undefined reference to
> `sdbus_write_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.c:654: undefined reference to
> `sdbus_write_data'
> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function `allwinner_sdhost_dma'=
:
> hw/sd/allwinner-sdhost.c:372: undefined reference to `sdbus_data_ready'
> collect2: error: ld returned 1 exit status
> make[1]: *** [Makefile:206: qemu-system-arm] Error 1
>
>
Thanks for reporting this Philippe. As you pointed out, I also made the
same mistake in patch #4 for USB support [1].
Here I also tried to re-produce the error here with:

$ ./configure --target-list=3Darm-softmmu --without-default-devices; make -=
j5

But again no error. I also see that CONFIG_SD=3Dy is set in
arm-softmmu/config-devices.mak.
Maybe on my laptop  --without-default-devices has no effect or is overriden
somehow, I'll try to debug it further.

[1] https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg00125.html


> Fixed by:
>
> -- >8 --
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index bb75c1de17..086241354c 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -302,6 +302,9 @@ config ALLWINNER_H3
>       select ARM_TIMER
>       select ARM_GIC
>       select UNIMP
>       select USB_OHCI
>       select USB_EHCI_SYSBUS
> +    select SD
>
> Thanks, I'll add this fix.

Regards,
Niek


>   config RASPI
>       bool
> ---
>
>

--=20
Niek Linnenbank

--000000000000cb9547059d9eb341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 19, 2020 at 8:02 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 1/19/20 1:50 AM, Niek Linnenbank wrote:<br>
&gt; The Allwinner System on Chip families sun4i and above contain<br>
&gt; an integrated storage controller for Secure Digital (SD) and<br>
&gt; Multi Media Card (MMC) interfaces. This commit adds support<br>
&gt; for the Allwinner SD/MMC storage controller with the following<br>
&gt; emulated features:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* DMA transfers<br>
&gt;=C2=A0 =C2=A0* Direct FIFO I/O<br>
&gt;=C2=A0 =C2=A0* Short/Long format command responses<br>
&gt;=C2=A0 =C2=A0* Auto-Stop command (CMD12)<br>
&gt;=C2=A0 =C2=A0* Insert &amp; remove card detection<br>
&gt; <br>
&gt; The following boards are extended with the SD host controller:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* Cubieboard (hw/arm/cubieboard.c)<br>
&gt;=C2=A0 =C2=A0* Orange Pi PC (hw/arm/orangepi.c)<br>
&gt; <br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@re=
dhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/hw/arm/allwinner-a10.h=C2=A0 =C2=A0|=C2=A0 =C2=A02=
 +<br>
&gt;=C2=A0 =C2=A0include/hw/arm/allwinner-h3.h=C2=A0 =C2=A0 |=C2=A0 =C2=A03=
 +<br>
&gt;=C2=A0 =C2=A0include/hw/sd/allwinner-sdhost.h | 135 +++++<br>
&gt;=C2=A0 =C2=A0hw/arm/allwinner-a10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 11 +<br>
&gt;=C2=A0 =C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 15 +-<br>
&gt;=C2=A0 =C2=A0hw/arm/cubieboard.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 15 +<br>
&gt;=C2=A0 =C2=A0hw/arm/orangepi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 16 +<br>
&gt;=C2=A0 =C2=A0hw/sd/allwinner-sdhost.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 848 +++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/sd/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0hw/sd/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 =C2=A010 files changed, 1052 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 include/hw/sd/allwinner-sdhost.h<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/sd/allwinner-sdhost.c<br>
<br>
Failure at build if configured with --without-default-devices:<br>
<br>
=C2=A0 =C2=A0CC=C2=A0 =C2=A0 =C2=A0 arm-softmmu/hw/sd/allwinner-sdhost.o<br=
>
=C2=A0 =C2=A0CC=C2=A0 =C2=A0 =C2=A0 arm-softmmu/hw/arm/orangepi.o<br>
=C2=A0 =C2=A0CC=C2=A0 =C2=A0 =C2=A0 arm-softmmu/hw/arm/allwinner-h3.o<br>
=C2=A0 =C2=A0LINK=C2=A0 =C2=A0 arm-softmmu/qemu-system-arm<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function <br>
`allwinner_sdhost_send_command&#39;:<br>
hw/sd/allwinner-sdhost.c:239: undefined reference to `sdbus_do_command&#39;=
<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function `allwinner_sdhost_read&#=
39;:<br>
hw/sd/allwinner-sdhost.c:517: undefined reference to `sdbus_data_ready&#39;=
<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.c:518: undefined reference to <br>
`sdbus_read_data&#39;<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.c:519: undefined reference to <br>
`sdbus_read_data&#39;<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.c:520: undefined reference to <br>
`sdbus_read_data&#39;<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.c:521: undefined reference to <br>
`sdbus_read_data&#39;<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function <br>
`allwinner_sdhost_process_desc&#39;:<br>
hw/sd/allwinner-sdhost.c:340: undefined reference to `sdbus_read_data&#39;<=
br>
/usr/bin/ld: hw/sd/allwinner-sdhost.c:334: undefined reference to <br>
`sdbus_write_data&#39;<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function `allwinner_sdhost_write&=
#39;:<br>
hw/sd/allwinner-sdhost.c:651: undefined reference to `sdbus_write_data&#39;=
<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.c:652: undefined reference to <br>
`sdbus_write_data&#39;<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.c:653: undefined reference to <br>
`sdbus_write_data&#39;<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.c:654: undefined reference to <br>
`sdbus_write_data&#39;<br>
/usr/bin/ld: hw/sd/allwinner-sdhost.o: in function `allwinner_sdhost_dma&#3=
9;:<br>
hw/sd/allwinner-sdhost.c:372: undefined reference to `sdbus_data_ready&#39;=
<br>
collect2: error: ld returned 1 exit status<br>
make[1]: *** [Makefile:206: qemu-system-arm] Error 1<br>
<br></blockquote><div><br></div><div>Thanks for reporting this Philippe. As=
 you pointed out, I also made the same mistake in patch #4 for USB support =
[1].</div><div>Here I also tried to re-produce the error here with:</div><d=
iv><br></div><div>$ ./configure --target-list=3Darm-softmmu --without-defau=
lt-devices; make -j5</div><div><br></div><div>But again no error. I also se=
e that CONFIG_SD=3Dy is set in arm-softmmu/config-devices.mak.</div><div>Ma=
ybe on my laptop=C2=A0 --without-default-devices has no effect or is overri=
den somehow, I&#39;ll try to debug it further.</div><div><br></div><div>[1]=
 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg00125.=
html">https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg00125.html</=
a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Fixed by:<br>
<br>
-- &gt;8 --<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index bb75c1de17..086241354c 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -302,6 +302,9 @@ config ALLWINNER_H3<br>
=C2=A0 =C2=A0 =C2=A0 select ARM_TIMER<br>
=C2=A0 =C2=A0 =C2=A0 select ARM_GIC<br>
=C2=A0 =C2=A0 =C2=A0 select UNIMP<br>
=C2=A0 =C2=A0 =C2=A0 select USB_OHCI<br>
=C2=A0 =C2=A0 =C2=A0 select USB_EHCI_SYSBUS<br>
+=C2=A0 =C2=A0 select SD<br>
<br></blockquote><div>Thanks, I&#39;ll add this fix.</div><div><br></div><d=
iv>Regards,</div><div>Niek<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
=C2=A0 config RASPI<br>
=C2=A0 =C2=A0 =C2=A0 bool<br>
---<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000cb9547059d9eb341--
