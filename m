Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp33508njl;
        Fri, 13 Sep 2024 15:20:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5mmhWBpAvpvyR0oiK7iLotr9thlyxga80rCidaOZNnd1DazhzNQ3FXDkq6P2KzNMVgAXEKrePyDfcFQ==@linaro.org
X-Received: by 2002:a05:6e02:1d88:b0:395:e85e:f2fa with SMTP id e9e14a558f8ab-3a084611b38mr66661755ab.1.1726266037632;
        Fri, 13 Sep 2024 15:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726266037; cv=none;
        d=google.com; s=arc-20160816;
        b=dVfsFvov84LdYWSq3BQoIFKN585NQWJ8g3nsZ5N9bjyRlUU49LsIHCZytfbdIu8141
         mMKN3CpOqdBw92n34x78Xr4e0ZSW9xwPWMUIyG76E3FfWgbLuZQJFbZ8CCVaOXFRxJZx
         aCrItQiMqL6mUtpyjT/d31bWsazmE4iIIoRmoF2MmO907eMLw+6by9Ew1ivjT3oZ+53i
         RCSc6K7jH2Ew+4Sda2pWCVGWRyTWQAt4jvEybNrwvRU2lkQSifRH97RlTC0xIbH+phrH
         CWOCh21p/oJDal425rdr+RwrbxI7aZR2fvSyc+6nweIIBK/eqYSZpowEwzZUVGWAxec0
         7hlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YDsGym9b/QXE3ReyOcWEB4cWbs8H3bfnKyC0IsIimlc=;
        fh=SVwx91M84tn47IeN1n5lRW6nvFPHCgrcW/z2hVTTZzg=;
        b=xDIGFHpoB8PgjVVsSQmiwGyGYgHet2sDqXA/xXk+jSwmZpFdxXAtVVEQw4U6vSf94b
         5Xge3CX78j7gksh1uAnf18KnfiF7EONXj/jDpwoM1FcxmxOuLtr2azJC01cGYQ5KmAv/
         ZBBOwByT851EBEcBoavLGW5UlLtU8ZnsEMvYUC+GHFSTQiYAqmIEfY2w7p+Zk7qs62Kl
         Y8WBukoGNz2A7wpxexbW/lv0A5A5O6+zwWeYxpCIGxlL/hUi67lEsxx9HnGZwSnAWZIq
         J3yIcWlhD4YnBW8Pa2ahXy8o3fnr0tEA65cS9KP2/XRmEhQRdLxCtDwxLsMsc7b3Yhnu
         /49g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=eIsHKrLO;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3a08c52734fsor6330455ab.3.2024.09.13.15.20.37
        (Google Transport Security);
        Fri, 13 Sep 2024 15:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=eIsHKrLO;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726266037; x=1726870837; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YDsGym9b/QXE3ReyOcWEB4cWbs8H3bfnKyC0IsIimlc=;
        b=eIsHKrLO5oKyjhJNabmG1zOCv3C4A5b8+SprnrlIODQ/yKMefrFJ9v3tZqA9AGREHx
         4UE3gvpP7oi2stcgOofyc6adLJwG0WlWTpmuW8TbTMZxtYTlecMB6MZxlF/kL1VbOHJ1
         2T1W8F62WYnhBTfZVcNfdTLDqKb4HRzpH8iE8MmNx1WHT9QTJVpA2+H/hoaxAjrimQ67
         /3NFuBtFhePaL4FR+eU5P/DTwhYh4pID7cfedlRlE4OojlRnV7Pceg05+psChdYWfCrv
         1QUbbg0biMw2QPgrN3r4NqlUDqtUwwU2Z524q/y8F4lLmYH6iJZlZkbQCUpfIMfdOEDR
         Px8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726266037; x=1726870837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDsGym9b/QXE3ReyOcWEB4cWbs8H3bfnKyC0IsIimlc=;
        b=H0wwQo3aEZyvoIiGuQf4ENXD7Ct73yTGyDuF66t55Ln4mbLpWm0A1CjAZD3yYmhxsk
         PR9ZPJtp/9DgK3mP4o8nYusDmWCXZ5th6tvwqVe0VkGpvIbMtJ5pbDW+lkKxJQuhg7EF
         veqVJIkv/wS25afOSOMSWO5/NHS/WEm5yZbDLAO/AJndgWZZjhC1E98vVG/713Lh8ULF
         26RzkrV5AdxTZUSv2mWmESw6CPjADyH7X6kp2TByLQAiwaJQAgwxKCZHuF5CC/aeaO/x
         xvyGUUo9KcJARYeBGqrU1JXc+gB1CUe16/dOSkOHGVcYDS8A995M2nOkGyo43hySHXw8
         Ghhg==
X-Forwarded-Encrypted: i=1; AJvYcCVnGALchYMq8P0ieYt4pcTikEnxoEb5Jij2kDACR3JVq6ZCy0Hss4ESLav2qTyLLWDNFZYvoXaQ+PQMpCcVbQ==@linaro.org, AJvYcCXIS/EsKAoAaAC38Bs32CGs40mkxh+CBHRdGjxJa7wsSkOoPpXUr+wY2Tdq1N9X+Ol8Z1Cj1YVwZWoEzA==@linaro.org
X-Gm-Message-State: AOJu0YxGiLw/HGe8TZtPeJhQJJ5XAT73jL5le2lIoayyvzB2zqW0HlSr
	kRRoeCKTwd8/GEqLqalI296KTQX+7zz9jQpKjSkGpisyXhx2tRGYbhJWQ5wKYdvxwmpBdO0dGvY
	T+V88u4xmOdBt9c0ppnqrHSSBGUk=
X-Google-Smtp-Source: AGHT+IFsl9ilmQFtQ0JJ0Zhnw+PDnBjUUcFGFuaDPqmRnlQlArn2rE49cTvMR7m0fwbF0nJKGrc5eZzcbihxaKCR3s8=
X-Received: by 2002:a05:6e02:3603:b0:39f:6f6c:90ba with SMTP id
 e9e14a558f8ab-3a08461c414mr51086715ab.6.1726266036956; Fri, 13 Sep 2024
 15:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <85f61ad3-da14-43f7-983c-62053ce0cfa6@roeck-us.net> <xgwmp3mjq2vhhwgbkbjr76o3yejkbm2ke7ybfes7xbafmpha53@pihh3myr7h7o>
In-Reply-To: <xgwmp3mjq2vhhwgbkbjr76o3yejkbm2ke7ybfes7xbafmpha53@pihh3myr7h7o>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sat, 14 Sep 2024 00:20:25 +0200
Message-ID: <CAPan3WoqwDaDt8W8vZ7RatL_mjnY_aCA0=REQq=B7ZEebhYAig@mail.gmail.com>
Subject: Re: qemu emulation for USB ports of Allwinner H3
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ebb720062207a1e7"
X-TUID: ICNZi4udGY48

--000000000000ebb720062207a1e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guenter, Gerd,

Thanks for bringing up the question. To be honest I do not know a lot about
USB internals.
When adding the orangepi-pc board emulation, it seemed fairly easy to add
it, but apart from a few basic tests, I did not use the USB functionality
extensively.

I do own the actual Orange Pi PC board hardware, so I downloaded the
'Orangepipc_2.0.8_ubuntu_bionic_server_linux5.4.65.7z' image from the
official page to test:
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-a=
nd-support/Orange-Pi-PC.html

After booting that image from an SD card with a serial console, this is the
output from the same 'lsusb' command:

root@orangepipc:~# lsusb
Bus 008 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
root@orangepipc:~# uname -a
Linux orangepipc 5.4.65-sunxi #2.0.8 SMP Mon Oct 26 10:20:38 CST 2020
armv7l armv7l armv7l GNU/Linux
root@orangepipc:~# cat /etc/lsb-release
DISTRIB_ID=3DUbuntu
DISTRIB_RELEASE=3D18.04
DISTRIB_CODENAME=3Dbionic
DISTRIB_DESCRIPTION=3D"Ubuntu 18.04.5 LTS"

It does look like the same output compared to what we see under Qemu. But
I'm not very sure if this confirms we are emulating correctly or not.

Regards,
Niek

On Mon, Sep 9, 2024 at 11:33=E2=80=AFAM Gerd Hoffmann <kraxel@redhat.com> w=
rote:

> On Sun, Sep 08, 2024 at 11:36:18AM GMT, Guenter Roeck wrote:
> > Hi,
> >
> > the Allwinner H3 USB port qemu emulation creates separate USB ports
> > for its EHCI and OHCI controllers, resulting in a total of 8 USB ports.
> > From the orangepi-pc emulation:
> >
> > # lsusb
> > Bus 005 Device 001: ID 1d6b:0002
> > Bus 003 Device 001: ID 1d6b:0002
> > Bus 001 Device 001: ID 1d6b:0002
> > Bus 008 Device 001: ID 1d6b:0002
> > Bus 006 Device 001: ID 1d6b:0001
> > Bus 004 Device 001: ID 1d6b:0001
> > Bus 002 Device 001: ID 1d6b:0002
> > Bus 009 Device 001: ID 1d6b:0001
> > Bus 007 Device 001: ID 1d6b:0001
> >
> > The SoC supports EHCI companion interfaces, and my understanding is tha=
t
> > it only has four physical USB ports. Does the real hardware instantiate
> > separate EHCI and OHCI interfaces (for a total of 8 USB ports), or does
> it
> > use the companion functionality ?
>
> Well, on the guest side you'll see 8 ports even when using the companion
> functionality.  Each physical usb port has one ehci port (used when you
> plug in usb 2.0+ devices) and one ohci port (used when you plug in usb
> 1.1 devices).
>
> The main difference is on the qemu backend side.  When using the
> companion functionality you have a single qemu usb bus accepting both
> 1.1 and 2.0+ devices.  When not using the companion functionality you
> have one usb bus accepting 2.0+ devices and another usb bus accepting
> usb 1.1 devices ...
>
> The guest-visible difference is an per-port bit in ehci registers which
> controls whenever ehci or the companion manages the device plugged in.
> This bit exists for backward compatibility (guests without ehci driver
> can manage all devices via ohci, with usb 2.0+ devices being downgraded
> to 1.1 compatibility mode then).
>
> > If the real hardware only instantiates four USB ports (or, in other
> words,
> > if it utilizes EHCI companion functionality), would it make sense to
> > reflect that in qemu ?
>
> Yes.
>
> take care,
>   Gerd
>
>

--=20
Niek Linnenbank

--000000000000ebb720062207a1e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Guenter, Gerd,</div><div><br></div><div>Thanks =
for bringing up the question. To be honest I do not know a lot about USB in=
ternals.</div><div>When adding the orangepi-pc board emulation, it seemed f=
airly easy to add it, but apart from a few basic tests, I did not use the U=
SB functionality extensively.</div><div><br></div><div>I do own the actual =
Orange Pi PC board hardware, so I downloaded the &#39;Orangepipc_2.0.8_ubun=
tu_bionic_server_linux5.4.65.7z&#39; image from the official page to test:<=
br></div><div><a href=3D"http://www.orangepi.org/html/hardWare/computerAndM=
icrocontrollers/service-and-support/Orange-Pi-PC.html">http://www.orangepi.=
org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi=
-PC.html</a></div><div><br></div><div>After booting that image from an SD c=
ard with a serial console, this is the output from the same &#39;lsusb&#39;=
 command:<br></div><div><br></div><div>root@orangepipc:~# lsusb<br>Bus 008 =
Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub<br>Bus 005 Device 00=
1: ID 1d6b:0002 Linux Foundation 2.0 root hub<br>Bus 007 Device 001: ID 1d6=
b:0001 Linux Foundation 1.1 root hub<br>Bus 004 Device 001: ID 1d6b:0002 Li=
nux Foundation 2.0 root hub<br>Bus 006 Device 001: ID 1d6b:0001 Linux Found=
ation 1.1 root hub<br>Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0=
 root hub<br>Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub=
<br>Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub<br>Bus 0=
09 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub<br>root@orangepip=
c:~# uname -a<br>Linux orangepipc 5.4.65-sunxi #2.0.8 SMP Mon Oct 26 10:20:=
38 CST 2020 armv7l armv7l armv7l GNU/Linux<br>root@orangepipc:~# cat /etc/l=
sb-release <br>DISTRIB_ID=3DUbuntu<br>DISTRIB_RELEASE=3D18.04<br>DISTRIB_CO=
DENAME=3Dbionic<br>DISTRIB_DESCRIPTION=3D&quot;Ubuntu 18.04.5 LTS&quot;</di=
v><div><br></div><div>It does look like the same output compared to what we=
 see under Qemu. But I&#39;m not very sure if this confirms we are emulatin=
g correctly or not.</div><div><br></div><div>Regards,</div><div>Niek<br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Sep 9, 2024 at 11:33=E2=80=AFAM Gerd Hoffmann &lt;<a href=3D"mailto:kr=
axel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Sun, Sep 08, 2024 at 11:36:18AM GMT, G=
uenter Roeck wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; the Allwinner H3 USB port qemu emulation creates separate USB ports<br=
>
&gt; for its EHCI and OHCI controllers, resulting in a total of 8 USB ports=
.<br>
&gt; From the orangepi-pc emulation:<br>
&gt; <br>
&gt; # lsusb<br>
&gt; Bus 005 Device 001: ID 1d6b:0002<br>
&gt; Bus 003 Device 001: ID 1d6b:0002<br>
&gt; Bus 001 Device 001: ID 1d6b:0002<br>
&gt; Bus 008 Device 001: ID 1d6b:0002<br>
&gt; Bus 006 Device 001: ID 1d6b:0001<br>
&gt; Bus 004 Device 001: ID 1d6b:0001<br>
&gt; Bus 002 Device 001: ID 1d6b:0002<br>
&gt; Bus 009 Device 001: ID 1d6b:0001<br>
&gt; Bus 007 Device 001: ID 1d6b:0001<br>
&gt; <br>
&gt; The SoC supports EHCI companion interfaces, and my understanding is th=
at<br>
&gt; it only has four physical USB ports. Does the real hardware instantiat=
e<br>
&gt; separate EHCI and OHCI interfaces (for a total of 8 USB ports), or doe=
s it<br>
&gt; use the companion functionality ?<br>
<br>
Well, on the guest side you&#39;ll see 8 ports even when using the companio=
n<br>
functionality.=C2=A0 Each physical usb port has one ehci port (used when yo=
u<br>
plug in usb 2.0+ devices) and one ohci port (used when you plug in usb<br>
1.1 devices).<br>
<br>
The main difference is on the qemu backend side.=C2=A0 When using the<br>
companion functionality you have a single qemu usb bus accepting both<br>
1.1 and 2.0+ devices.=C2=A0 When not using the companion functionality you<=
br>
have one usb bus accepting 2.0+ devices and another usb bus accepting<br>
usb 1.1 devices ...<br>
<br>
The guest-visible difference is an per-port bit in ehci registers which<br>
controls whenever ehci or the companion manages the device plugged in.<br>
This bit exists for backward compatibility (guests without ehci driver<br>
can manage all devices via ohci, with usb 2.0+ devices being downgraded<br>
to 1.1 compatibility mode then).<br>
<br>
&gt; If the real hardware only instantiates four USB ports (or, in other wo=
rds,<br>
&gt; if it utilizes EHCI companion functionality), would it make sense to<b=
r>
&gt; reflect that in qemu ?<br>
<br>
Yes.<br>
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--000000000000ebb720062207a1e7--
