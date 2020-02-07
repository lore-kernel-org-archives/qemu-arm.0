Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1025344lfp;
        Fri, 7 Feb 2020 13:09:29 -0800 (PST)
X-Received: by 2002:a6b:fd18:: with SMTP id c24mr345552ioi.189.1581109769463;
        Fri, 07 Feb 2020 13:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581109769; cv=none;
        d=google.com; s=arc-20160816;
        b=WPBEPFAWyzZnnuQC7SweKUhFgUUqwB1yj9632XQt4ySUyC8yK3KjYtO1CUIcbHEvA0
         CZx3IAD42zJlEZ3zinOghjuXqjcEYpVE/ip3KkFkqwjg/utfmRguzMeF3l8WZdK7acgE
         CscLhFss9U0AB1mHzOnQvr1ZvPGI4cfllDIrAobHRnVMKGZTu1C21G8zSSJah0BgrlKC
         qxh2t1mef05F1MDSY08UuSUZoFb9G5fZPmER4wpW7b+sJ0vRTW8RnXhXtF648zR6+vnK
         kToRwMlyhPyxY9ucmBhzxOHJmIAOZA1InUbLPuxahXUnhiwrbt7c0WIB+9EWfl4QSpID
         PVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DGQE7Ulr1dPFbkBbpWWN+b7EnRREQqShmFupImjIXsg=;
        b=AEKQiZnB+bz299Ps+Lnhz16vJ6w0STVrxA5Rf0O7bwUA/Q/lpj4syXGMvQMdKYGBpm
         t2gSdo9XofP3r3IaTKrxzDcT79kHxmUab1cHCZnptsAsdwMXCoA8I/nVWFJX5HY73dRv
         cGRqypMpYILfkU2o5/PJXrjqc0kEgXNUSJCxwjHFIgGrZAgHWGdUuM7z6bJd+kJTb0SV
         25v/EH1BRj0Yf4h6WGso5Q7B/GG0kQTJQQWNckFb5SKOLxsrHLpZCVbu2V5Mgmys7ga9
         kH/rKm36JvVMR/iYUUuu9XyHfNscu1sM1mfJ5uUKdXMjGk4PfIbZaQTx5KrodsGpTCJZ
         4rfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cWzeITb3;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t12sor716156ioc.112.2020.02.07.13.09.29
        (Google Transport Security);
        Fri, 07 Feb 2020 13:09:29 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cWzeITb3;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DGQE7Ulr1dPFbkBbpWWN+b7EnRREQqShmFupImjIXsg=;
        b=cWzeITb3HO4lxvYtI0eJ7pFf0w0idzM14lR/y46EbodfpnQNqAU8dn6CXNsPqqlMma
         9R8KCsgA6N/mt+6B1TQJtE/HSQQPWt2Npc4FAOU+kPZQenOjEMlA8UfEO4sGFKUucvl0
         NZmEWJTZtcBg96GGMvtUff26561LO4RlFc25pl72skmfpDukgJzmWS88+BCZHn35AHsL
         C1Ba1olNl86clYWpx+rpNUXDGi7Xo0RZImCTXmYUU9CAb/TSm4b219Q7LnivQXuNXJVO
         lp8WhWhT7S1/mMs2JFl5HddhKYZt4Ep9bRLyPIZLJ+13FrKydzM4FgxRWlqnToosloUc
         L+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DGQE7Ulr1dPFbkBbpWWN+b7EnRREQqShmFupImjIXsg=;
        b=DAry9uWSa2G4vVotLj92rCMfVylJuVwU/dC5CLAoOS+TqNs/M730ywc2hXYrwgkL6j
         lyKOGoPNDHyvYQlgmrqkvqQxQZSrGQ3MENCiSNdjoJ+cXK0GqqkwrHtlL2peWbss+dcz
         9SSK43hUja2w/9yYjb4ibNpEGZgXmYSZRleGLi8qC2ATopC2RfMnjhnxBzSXfbjx/PKA
         m09E6JvOOvPXbvO/aj9O10EF8Obl16oxNzVaOEY7ANfMCmkJ4Ax7E3kS5nUNsOlmIdDj
         lgbtQIUnMp/yCtk1jl5Jbdk6vlT6GPi5TtMGGAfpaVaHkfqE/FFQkHIrgXF4mQ9+sm0l
         Djcg==
X-Gm-Message-State: APjAAAVCXyXUsqvpO/Mk3wUSmHGu0BVbJnBqURFqCu6mB1M7GJwGZc3s
	sSAFcdcqfznS1iLo/HjS9NWO4sT8Mk+BKZ7QUnbIgxqEFCE=
X-Google-Smtp-Source: APXvYqzUQ5qQtdeFH1SsdoH5SxLwh9AD74MZ8PQ1GW9qLdyFHfeAQ3g67lLWm8NNzxl6QqG2fNBnV6ESjUMVbs08Xvo=
X-Received: by 2002:a6b:6f01:: with SMTP id k1mr437677ioc.28.1581109769076;
 Fri, 07 Feb 2020 13:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-9-nieklinnenbank@gmail.com> <e9c31386-d471-159a-6cb0-7e621cb3bc83@redhat.com>
 <CAPan3WpJnd4YPa1DT_5Z6+i5yVahAE7sFHZ6JXqC69KstFG+Mg@mail.gmail.com>
In-Reply-To: <CAPan3WpJnd4YPa1DT_5Z6+i5yVahAE7sFHZ6JXqC69KstFG+Mg@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Fri, 7 Feb 2020 22:09:16 +0100
Message-ID: <CAPan3WpjkBc9WKPt7SDud5TQsnRphnBJwgqUep+3fFzfzLC0hg@mail.gmail.com>
Subject: Re: [PATCH v4 08/20] hw/arm/allwinner: add SD/MMC host controller
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Beniamino Galvani <b.galvani@gmail.com>, jasowang@redhat.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000230470059e02ce7b"
X-TUID: YM/r/BG34/pD

--000000000000230470059e02ce7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

FYI, and in case someone also wants to do a similar configuration test on
some other machine.
I managed to re-produce the same error by temporarily modifying
default-configs/arm-softmmu.mak, such that it only enables the orangepi
machine.
That way, if any configuration item is missing from the machine, the error
will be visible.

Regards,
Niek


On Sun, Feb 2, 2020 at 10:43 PM Niek Linnenbank <nieklinnenbank@gmail.com>
wrote:

> Hi Philippe,
>
> On Sun, Jan 19, 2020 at 8:02 PM Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com>
> wrote:
>
>> On 1/19/20 1:50 AM, Niek Linnenbank wrote:
>> > The Allwinner System on Chip families sun4i and above contain
>> > an integrated storage controller for Secure Digital (SD) and
>> > Multi Media Card (MMC) interfaces. This commit adds support
>> > for the Allwinner SD/MMC storage controller with the following
>> > emulated features:
>> >
>> >   * DMA transfers
>> >   * Direct FIFO I/O
>> >   * Short/Long format command responses
>> >   * Auto-Stop command (CMD12)
>> >   * Insert & remove card detection
>> >
>> > The following boards are extended with the SD host controller:
>> >
>> >   * Cubieboard (hw/arm/cubieboard.c)
>> >   * Orange Pi PC (hw/arm/orangepi.c)
>> >
>> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> > Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > ---
>> >   include/hw/arm/allwinner-a10.h   |   2 +
>> >   include/hw/arm/allwinner-h3.h    |   3 +
>> >   include/hw/sd/allwinner-sdhost.h | 135 +++++
>> >   hw/arm/allwinner-a10.c           |  11 +
>> >   hw/arm/allwinner-h3.c            |  15 +-
>> >   hw/arm/cubieboard.c              |  15 +
>> >   hw/arm/orangepi.c                |  16 +
>> >   hw/sd/allwinner-sdhost.c         | 848 +++++++++++++++++++++++++++++=
++
>> >   hw/sd/Makefile.objs              |   1 +
>> >   hw/sd/trace-events               |   7 +
>> >   10 files changed, 1052 insertions(+), 1 deletion(-)
>> >   create mode 100644 include/hw/sd/allwinner-sdhost.h
>> >   create mode 100644 hw/sd/allwinner-sdhost.c
>>
>> Failure at build if configured with --without-default-devices:
>>
>>    CC      arm-softmmu/hw/sd/allwinner-sdhost.o
>>    CC      arm-softmmu/hw/arm/orangepi.o
>>    CC      arm-softmmu/hw/arm/allwinner-h3.o
>>    LINK    arm-softmmu/qemu-system-arm
>> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function
>> `allwinner_sdhost_send_command':
>> hw/sd/allwinner-sdhost.c:239: undefined reference to `sdbus_do_command'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function
>> `allwinner_sdhost_read':
>> hw/sd/allwinner-sdhost.c:517: undefined reference to `sdbus_data_ready'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.c:518: undefined reference to
>> `sdbus_read_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.c:519: undefined reference to
>> `sdbus_read_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.c:520: undefined reference to
>> `sdbus_read_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.c:521: undefined reference to
>> `sdbus_read_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function
>> `allwinner_sdhost_process_desc':
>> hw/sd/allwinner-sdhost.c:340: undefined reference to `sdbus_read_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.c:334: undefined reference to
>> `sdbus_write_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function
>> `allwinner_sdhost_write':
>> hw/sd/allwinner-sdhost.c:651: undefined reference to `sdbus_write_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.c:652: undefined reference to
>> `sdbus_write_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.c:653: undefined reference to
>> `sdbus_write_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.c:654: undefined reference to
>> `sdbus_write_data'
>> /usr/bin/ld: hw/sd/allwinner-sdhost.o: in function `allwinner_sdhost_dma=
':
>> hw/sd/allwinner-sdhost.c:372: undefined reference to `sdbus_data_ready'
>> collect2: error: ld returned 1 exit status
>> make[1]: *** [Makefile:206: qemu-system-arm] Error 1
>>
>>
> Thanks for reporting this Philippe. As you pointed out, I also made the
> same mistake in patch #4 for USB support [1].
> Here I also tried to re-produce the error here with:
>
> $ ./configure --target-list=3Darm-softmmu --without-default-devices; make=
 -j5
>
> But again no error. I also see that CONFIG_SD=3Dy is set in
> arm-softmmu/config-devices.mak.
> Maybe on my laptop  --without-default-devices has no effect or is
> overriden somehow, I'll try to debug it further.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg00125.html
>
>
>> Fixed by:
>>
>> -- >8 --
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index bb75c1de17..086241354c 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -302,6 +302,9 @@ config ALLWINNER_H3
>>       select ARM_TIMER
>>       select ARM_GIC
>>       select UNIMP
>>       select USB_OHCI
>>       select USB_EHCI_SYSBUS
>> +    select SD
>>
>> Thanks, I'll add this fix.
>
> Regards,
> Niek
>
>
>>   config RASPI
>>       bool
>> ---
>>
>>
>
> --
> Niek Linnenbank
>
>

--=20
Niek Linnenbank

--000000000000230470059e02ce7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,</div><div><br></div><div>FYI, and in cas=
e someone also wants to do a similar configuration test on some other machi=
ne.</div><div>I managed to re-produce the same error by temporarily modifyi=
ng default-configs/arm-softmmu.mak, such that it only enables the orangepi =
machine.</div><div>That way, if any configuration item is missing from the =
machine, the error will be visible.</div><div><br></div><div>Regards,</div>=
<div>Niek<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 2, 2020 at 10:43 PM Niek Linn=
enbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div>Hi Philippe,<br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 19, 2020 at 8:02 PM P=
hilippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com" target=
=3D"_blank">philmd@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On 1/19/20 1:50 AM, Niek Linnenbank wrote:<br>
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
html" target=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2020-=
02/msg00125.html</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Niek Linnenbank<br><br></div></div></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div>

--000000000000230470059e02ce7b--
