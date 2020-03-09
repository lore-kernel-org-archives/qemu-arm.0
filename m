Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1507226lfc;
        Mon, 9 Mar 2020 12:35:54 -0700 (PDT)
X-Received: by 2002:a6b:ec05:: with SMTP id c5mr14592302ioh.107.1583782554203;
        Mon, 09 Mar 2020 12:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583782554; cv=none;
        d=google.com; s=arc-20160816;
        b=J1T6PAZsnU6Fx8Y+CUoFwPeXXlhpyQ3EwdUhgfSj7IF/nmNzzRu1cIbIMIXlBjYXV+
         XfLI0/w2PluZNvcoR3I29I3zA49iKYFmX6sXplmuR46jTijOwDM9jZCNHCmh5hS2EVXk
         tTTbzVGlPA0qTjlVHaWtSyzij1e/SVPHd0+SjwaAgzgys5VOb9ogJADnYklKpb/1nQAq
         ESAFKFExyN90hJIQydF1k+GubtHud84KC6Nnw2MTuxlXaLuoX5lnRP014TeYFGbKCBjk
         c/mK8tnB8iwN9Dx7sdEEsl4nWie+qNTU9YDUihcpYIa69lWBtdECw40bnQUc59HrymlV
         er5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VslxQD5mjwP9d8RwPmpfr07T+MCRCllTZgrsy2E+pms=;
        b=Hmeh5xg5RprUPD0Z3sX+FaKGvXQ50h8Pc19UUbonRfCoKe6DzehfhTkyZUin5oCDD0
         BUGIej6yljCPpQjYVZMtGPqpp/kxK2iGS5CN4UwGz78JWySvySQqTCp847M1mE1HQ3QO
         u5dovzr5wNnob1MrZx073Dhh5MlwuA2LRpSdvJghhosnCtN+Iy1K9orNn6R3mLSCXkOJ
         +UgkrAmo/26aKxU8fonuJRtPfzdBHqSMPhgPDqMdPVUIusG5QkjjZb8Z8G71jNFw2wI6
         YsIL9ycuMlehutR86FvDiBSRtsXayOeVD8nvYH+F5WJwzMM0rSpxpjxUpcuUz9swzAyr
         zbFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hib+sE8l;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v25sor6209606iol.26.2020.03.09.12.35.54
        (Google Transport Security);
        Mon, 09 Mar 2020 12:35:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hib+sE8l;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VslxQD5mjwP9d8RwPmpfr07T+MCRCllTZgrsy2E+pms=;
        b=hib+sE8lHyVO4pmAJGBiDiFHavijvtBbmV+VysS3LwlJX3ofKE0M4INKjJMMX5ZTww
         +siOWuOuAROhc/IDaTMAPos2uUpBj1bLMQ5GTca23SKIVweOHxY/RmJcCHGyT5KBhUUM
         p/VbRbgnIu2Q4jqsItnbDQQ1mrd+NHzLr+sbje6jHvaejWcBTq6uKkg8kZOLqcplqQXB
         DQTNuRP+NBT9tgD6rF7UjiEhwSKd4zHaK1tF2IzGpTzzlvPnK38uNAqyIa9YQ+BrRuoU
         kvd2oT4tiDl9x5Ah3lR0i3r4beW2NZpvc7S2nWFTdvyUOdL2iAcx4SGvyrcAZs2eU+eH
         YRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VslxQD5mjwP9d8RwPmpfr07T+MCRCllTZgrsy2E+pms=;
        b=MH6DLI2KSgZoS7OLQKI+Ijkyvf00cyFwYb1R4g1jmOjLbLumFSEU8nm0gvFG1X2+9L
         Z3NgqyRfF0k932XRSd9t0Ob6HLA2kXch5GhFdYi0qYBBWzFebxDcVH80KwTUHz7sVUOB
         cURJd1ivQuZOTMaqKCIFU8pmeFPAllF1l7oEqG9fr3l1kNXbinJyJNDTlAqf3USJw8Zu
         dkJU67zhQxVi1NaHi8aIIrO9ClK6JT6r8mf4eajUO2tv3/AceqVMvmEiOi5wyZeCPGkk
         5TkKcxLFmTtW0uGKWe4NBRtdYXe3fIJUPya2RBc9lDfOc+ZB9YTX71LsRzwK4EPwzCtL
         p9tw==
X-Gm-Message-State: ANhLgQ11QyRXgRWxjNVT0io4CVDDeXEmFOjyV2m11Cc5kT0hVK2Db5b4
	M56w8CovwHAUM5LStC0mzMQ765BU3FWxnxLRcxFFPiOD
X-Google-Smtp-Source: ADFU+vs3TAacZFigCb7I0mJXfNDoYnoXWdD5TCBm5PdkKd1XnkwZ7XkdmxB7ngptHThEq1233YQD+oNQtuTaOEqREwo=
X-Received: by 2002:a6b:2bc2:: with SMTP id r185mr9793071ior.60.1583782553572;
 Mon, 09 Mar 2020 12:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
In-Reply-To: <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 9 Mar 2020 20:35:42 +0100
Message-ID: <CAPan3WqOT1B4xuJeAYUh4Np1UjJuypCDSQVGeV2yyNbH5mBxKw@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000081dc3505a0711c08"
X-TUID: 1uGCpyY2D+Ne

--00000000000081dc3505a0711c08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Wed, Mar 4, 2020 at 9:55 PM Niek Linnenbank <nieklinnenbank@gmail.com>
wrote:

> Hello Alex,
>
> On Wed, Mar 4, 2020 at 11:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
>
>>
>> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>>
>> > The Xunlong Orange Pi PC machine is a functional ARM machine
>> > based on the Allwinner H3 System-on-Chip. It supports mainline
>> > Linux, U-Boot, NetBSD and is covered by acceptance tests.
>> >
>> > This commit adds a documentation text file with a description
>> > of the machine and instructions for the user.
>>
>> This is great, thanks for taking the time to include documentation.
>>
>
> Sure, I'm happy to contribute it. I tried to include most relevant
> information
> in there for developers and potential users of the machine. If something
> is missing
> just let me know and I'll make an update for it.
>
>
>>
>> >
>> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> > ---
>> >  docs/orangepi.rst | 226
>> > ++++++++++++++++++++++++++++++++++++++++++++++
>>
>> I suspect there is a better place to put this is than the top level. I
>> wonder if it should be docs/specs?
>>
>
> Yeah I'm fine to move it to a different subdirectory if needed. Right now
> its placed in docs,
> as it seems that documents for machines are also placed there, for exampl=
e
> docs/microvm.rst
>
>
>>
>> >  MAINTAINERS       |   1 +
>> >  2 files changed, 227 insertions(+)
>> >  create mode 100644 docs/orangepi.rst
>> >
>> > diff --git a/docs/orangepi.rst b/docs/orangepi.rst
>> > new file mode 100644
>> > index 0000000000..a9b46f553c
>> > --- /dev/null
>> > +++ b/docs/orangepi.rst
>> > @@ -0,0 +1,226 @@
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> > +Orange Pi PC Machine Type
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> > +
>> > +The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
>> > +based embedded computer with mainline support in both U-Boot
>> > +and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
>> > +1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
>> > +various other I/O.
>>
>> When Peter's document PR goes in later this week there will also be a:
>>
>>   docs/system/target-arm.rst
>>
>> which would benefit from a section for the Orange Pi in it.
>>
>
> Nice, I'll have a look at it when it gets merged and add a section for
> Orange Pi.
> I'll try to include that in the next version of this series.
>
>
>>
>> > +
>> > +Supported devices
>> > +-----------------
>> > +
>> > +The Orange Pi PC machine supports the following devices:
>> > +
>> > + * SMP (Quad Core Cortex A7)
>> > + * Generic Interrupt Controller configuration
>> > + * SRAM mappings
>> > + * SDRAM controller
>> > + * Real Time Clock
>> > + * Timer device (re-used from Allwinner A10)
>> > + * UART
>> > + * SD/MMC storage controller
>> > + * EMAC ethernet
>>
>> Do we ever exercise the ethernet in the acceptance tests? I see we have
>> some that boots a full OS but boot console only seems to touch the
>> serial console.
>>
>
> Good point. Currently in the acceptance tests U-Boot and Linux detect
> the ethernet device, but there are no explicit checks for that in the
> acceptance tests
> nor any actual packet transmission.
>
> I'll try to extend the current tests in the next version of this series t=
o
> include some
> basic checks for the ethernet device, perhaps with DHCP or a ping.
> I'm open to suggestions for the preferred way to do this.
>

FYI, I added some coverage for the ethernet device by extending the
test_arm_orangepi_sd test with a few lines like:

+        exec_command_and_wait_for_pattern(self, 'ifconfig eth0 up', 'eth0:
Link is Up')
+        exec_command_and_wait_for_pattern(self, 'udhcpc eth0',
+                                                'udhcpc: lease of
10.0.2.15 obtained')
+        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
+            '3 packets transmitted, 3 packets received, 0% packet loss')

Regards,
Niek


> Regards,
> Niek
>
>
>
>
>
>
>>
>> <snip>
>>
>> --
>> Alex Benn=C3=A9e
>>
>
>
> --
> Niek Linnenbank
>
>

--=20
Niek Linnenbank

--00000000000081dc3505a0711c08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alex,<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 4, 2020 at 9:55 PM Niek Linne=
nbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr">Hello Alex,<br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 4, 2020 at =
11:35 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" tar=
get=3D"_blank">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=3D"_=
blank">nieklinnenbank@gmail.com</a>&gt; writes:<br>
<br>
&gt; The Xunlong Orange Pi PC machine is a functional ARM machine<br>
&gt; based on the Allwinner H3 System-on-Chip. It supports mainline<br>
&gt; Linux, U-Boot, NetBSD and is covered by acceptance tests.<br>
&gt;<br>
&gt; This commit adds a documentation text file with a description<br>
&gt; of the machine and instructions for the user.<br>
<br>
This is great, thanks for taking the time to include documentation.<br></bl=
ockquote><div><br></div><div>Sure, I&#39;m happy to contribute it. I tried =
to include most relevant information</div><div>in there for developers and =
potential users of the machine. If something is missing</div><div>just let =
me know and I&#39;ll make an update for it.<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/orangepi.rst | 226<br>
&gt; ++++++++++++++++++++++++++++++++++++++++++++++<br>
<br>
I suspect there is a better place to put this is than the top level. I<br>
wonder if it should be docs/specs?<br></blockquote><div><br></div><div>Yeah=
 I&#39;m fine to move it to a different subdirectory if needed. Right now i=
ts placed in docs,</div><div>as it seems that documents for machines are al=
so placed there, for example docs/microvm.rst<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 227 insertions(+)<br>
&gt;=C2=A0 create mode 100644 docs/orangepi.rst<br>
&gt;<br>
&gt; diff --git a/docs/orangepi.rst b/docs/orangepi.rst<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a9b46f553c<br>
&gt; --- /dev/null<br>
&gt; +++ b/docs/orangepi.rst<br>
&gt; @@ -0,0 +1,226 @@<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; +Orange Pi PC Machine Type<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
&gt; +<br>
&gt; +The Xunlong Orange Pi PC is an Allwinner H3 System on Chip<br>
&gt; +based embedded computer with mainline support in both U-Boot<br>
&gt; +and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,<br>
&gt; +1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and<br>
&gt; +various other I/O.<br>
<br>
When Peter&#39;s document PR goes in later this week there will also be a:<=
br>
<br>
=C2=A0 docs/system/target-arm.rst<br>
<br>
which would benefit from a section for the Orange Pi in it.<br></blockquote=
><div><br></div><div>Nice, I&#39;ll have a look at it when it gets merged a=
nd add a section for Orange Pi.</div><div>I&#39;ll try to include that in t=
he next version of this series.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +Supported devices<br>
&gt; +-----------------<br>
&gt; +<br>
&gt; +The Orange Pi PC machine supports the following devices:<br>
&gt; +<br>
&gt; + * SMP (Quad Core Cortex A7)<br>
&gt; + * Generic Interrupt Controller configuration<br>
&gt; + * SRAM mappings<br>
&gt; + * SDRAM controller<br>
&gt; + * Real Time Clock<br>
&gt; + * Timer device (re-used from Allwinner A10)<br>
&gt; + * UART<br>
&gt; + * SD/MMC storage controller<br>
&gt; + * EMAC ethernet<br>
<br>
Do we ever exercise the ethernet in the acceptance tests? I see we have<br>
some that boots a full OS but boot console only seems to touch the<br>
serial console.<br></blockquote><div><br></div><div>Good point. Currently i=
n the acceptance tests U-Boot and Linux detect</div><div>the ethernet devic=
e, but there are no explicit checks for that in the acceptance tests</div><=
div>nor any actual packet transmission. <br></div><div><br></div><div>I&#39=
;ll try to extend the current tests in the next version of this series to i=
nclude some</div><div>basic checks for the ethernet device, perhaps with DH=
CP or a ping.</div><div>I&#39;m open to suggestions for the preferred way t=
o do this.<br></div></div></div></blockquote><div><br></div><div>FYI, I add=
ed some coverage for the ethernet device by extending the test_arm_orangepi=
_sd test with a few lines like:</div><div><br></div><div>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0exec_command_and_wait_for_pattern(self, &#39;ifconfig eth0 up&=
#39;, &#39;eth0: Link is Up&#39;)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_comm=
and_and_wait_for_pattern(self, &#39;udhcpc eth0&#39;,<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;udhcpc: lease of 10.0.2.15 obtained&#39;)<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0exec_command_and_wait_for_pattern(self, &#39;ping -c 3 10.0.2.2&#=
39;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;3 packets transmitt=
ed, 3 packets received, 0% packet loss&#39;)<br></div><div>=C2=A0</div><div=
>Regards,</div><div>Niek<br></div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></=
div><div><br></div><div>Regards,</div><div>Niek<br></div><div><br></div><di=
v><br></div><br><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
&lt;snip&gt;<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Niek Linnenbank<br><br></div></div></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--00000000000081dc3505a0711c08--
