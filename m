Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2052325lfi;
        Wed, 4 Mar 2020 12:55:27 -0800 (PST)
X-Received: by 2002:a6b:740c:: with SMTP id s12mr3877184iog.108.1583355327534;
        Wed, 04 Mar 2020 12:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583355327; cv=none;
        d=google.com; s=arc-20160816;
        b=LwMzaxKC2O3P/MiC1aGCrQsU2UIbGvcPnjEFP94w3LGddruk6OFW/v6Cjiov89ihri
         gH3hx+MntPW4W906rLgx6DVUAaUEjQqVw2QjdT7ZqS+/DtVuSQkxC68KVrt6mVEDJiCN
         36JlmJnI21gP0IV0Y60yRYh6iVGLHEAllIPMvtOroyGFmoU9L+aWGy2k6zfRdmq0q6jj
         uhKzNbBkJJTDXKkgr1lrZj2Av8u08S01GwdIQ6+dtHFRq/BWQ95Ddg1GtnLJLv9ploal
         pqNLKDbAHCV83P0RQfOwXpR4YUJQcSt2YX828aIge0wL1VaGflNqtq4wRmPxCGWz1R4H
         VQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tCYBHibbb2c0kOq2/NWI7/bnXq/tZU8evQiteP6O2K4=;
        b=cdcQY/KiI04qRcOu1Fp4hOZrXA+9IN2H/XnupQkL041IrwMwSWx/qJqiL9xBGypB2M
         WGd4vuQ3TQBufientoDR/QjntYobR4YcIezDU8uaFOMitATOELqQZ+4uprCfcVOOva9b
         oqYBWuzcQ0uPo3eHuYtcBURE+P4wk/rulc07j6DUMuQdrOj+WrmwNTS1a9HSw39lHqy1
         vZOztBAjPFDCaHEbcjZS6DncS6c0VWT963dQGjYtzCe83vpi9n4drPQBKmZrfkIrIml8
         e5/nVOv7BWzLFAxEtLdYjLZZUXXVM1SQY1BH8s4yTrM//s87BkxWYk89MapEDY7aDyT7
         wBoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="r732cWA/";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t4sor2438083ioc.36.2020.03.04.12.55.27
        (Google Transport Security);
        Wed, 04 Mar 2020 12:55:27 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="r732cWA/";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tCYBHibbb2c0kOq2/NWI7/bnXq/tZU8evQiteP6O2K4=;
        b=r732cWA/FW4udgN24NkT+TgnhylOuXn7dTbT0Nkko6aPS3TM4c2zlJpOXiHIhYzAQP
         gUmkWK+P4OK8bADvQEOBuOMLJnmNeCzpH2Spm7N+Tmt64C9kLMJZPLAwTT+ELsuyUV4S
         32R6+yNY5b5XFEnxMp/h3fXESkKu8q8yY3Dqr+GqnNH4I5Lpas2OLqwwcoT/TFBJFIso
         B1WrFh4T/D4GQ7JOaGM42cmnu9UlDnnwcFtBDb3APxA8wKOYdI61ivJ41+AfwvJTWB5A
         Vp62+jTtiEAm1lI3K4lSa1CVNgJKFE7xdQIPPTIHt0gr5HpegGvtSz8wZWgv+AZoFpu3
         U2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tCYBHibbb2c0kOq2/NWI7/bnXq/tZU8evQiteP6O2K4=;
        b=He76OJ3XQbGRQ4q9rn54CbsaFr98EwYh5RjSTOTc8z6Ff+AxTAbYgPtxInodBHEqGO
         MpNpHlQy+WbW54dvYVn3CHsLrCkDI9/sTu4mzXB69lb+bezKnyzSD5ER9jQWRVeuYNiz
         tlmHpB7ZDWz5DqOZg3BKp9A3JIHXacdorGi5VGdmDgY5kwYNTbeT7RcKYiIBS3CK70Dl
         wwTX/0NgLuxxowPx9UGZK6Dl0FbGxowa4TO/Ti0VFLZrqGQw+9djap+sScGJ07rCttCF
         htr8Fhl90Gp2KuQNUqMtPWuKeYzkBxhkyKuqrT/QLFTc4LQajXsJqhMYn8bDjHrAwz4J
         Bi8Q==
X-Gm-Message-State: ANhLgQ1Y1WWGz1R1JkryCoCYeeJKMn9U4Qy/tj7giDtoGQZIe+WDsLnq
	3OaRMwGLiXc4buCsHFk5SAByObicyBlNWqf3zcYzPeEd
X-Google-Smtp-Source: ADFU+vvAe2J/yt+oGJMdKuj5frcC9FF8UYgN931ICOso9gqaBMCyOMhNuzoKppvy6DpiTkBFEuuWuInHg48CejvWCSs=
X-Received: by 2002:a6b:b7d8:: with SMTP id h207mr3594261iof.306.1583355326852;
 Wed, 04 Mar 2020 12:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
In-Reply-To: <871rq876h3.fsf@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 4 Mar 2020 21:55:15 +0100
Message-ID: <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cf72ba05a00da3b1"
X-TUID: yjtCYaj4W9Vz

--000000000000cf72ba05a00da3b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Wed, Mar 4, 2020 at 11:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>
> > The Xunlong Orange Pi PC machine is a functional ARM machine
> > based on the Allwinner H3 System-on-Chip. It supports mainline
> > Linux, U-Boot, NetBSD and is covered by acceptance tests.
> >
> > This commit adds a documentation text file with a description
> > of the machine and instructions for the user.
>
> This is great, thanks for taking the time to include documentation.
>

Sure, I'm happy to contribute it. I tried to include most relevant
information
in there for developers and potential users of the machine. If something is
missing
just let me know and I'll make an update for it.


>
> >
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > ---
> >  docs/orangepi.rst | 226
> > ++++++++++++++++++++++++++++++++++++++++++++++
>
> I suspect there is a better place to put this is than the top level. I
> wonder if it should be docs/specs?
>

Yeah I'm fine to move it to a different subdirectory if needed. Right now
its placed in docs,
as it seems that documents for machines are also placed there, for example
docs/microvm.rst


>
> >  MAINTAINERS       |   1 +
> >  2 files changed, 227 insertions(+)
> >  create mode 100644 docs/orangepi.rst
> >
> > diff --git a/docs/orangepi.rst b/docs/orangepi.rst
> > new file mode 100644
> > index 0000000000..a9b46f553c
> > --- /dev/null
> > +++ b/docs/orangepi.rst
> > @@ -0,0 +1,226 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +Orange Pi PC Machine Type
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
> > +based embedded computer with mainline support in both U-Boot
> > +and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
> > +1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
> > +various other I/O.
>
> When Peter's document PR goes in later this week there will also be a:
>
>   docs/system/target-arm.rst
>
> which would benefit from a section for the Orange Pi in it.
>

Nice, I'll have a look at it when it gets merged and add a section for
Orange Pi.
I'll try to include that in the next version of this series.


>
> > +
> > +Supported devices
> > +-----------------
> > +
> > +The Orange Pi PC machine supports the following devices:
> > +
> > + * SMP (Quad Core Cortex A7)
> > + * Generic Interrupt Controller configuration
> > + * SRAM mappings
> > + * SDRAM controller
> > + * Real Time Clock
> > + * Timer device (re-used from Allwinner A10)
> > + * UART
> > + * SD/MMC storage controller
> > + * EMAC ethernet
>
> Do we ever exercise the ethernet in the acceptance tests? I see we have
> some that boots a full OS but boot console only seems to touch the
> serial console.
>

Good point. Currently in the acceptance tests U-Boot and Linux detect
the ethernet device, but there are no explicit checks for that in the
acceptance tests
nor any actual packet transmission.

I'll try to extend the current tests in the next version of this series to
include some
basic checks for the ethernet device, perhaps with DHCP or a ping.
I'm open to suggestions for the preferred way to do this.

Regards,
Niek






>
> <snip>
>
> --
> Alex Benn=C3=A9e
>


--=20
Niek Linnenbank

--000000000000cf72ba05a00da3b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Alex,<br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 4, 2020 at 11:=
35 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.b=
ennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><br>
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
o do this.<br></div><div><br></div><div>Regards,</div><div>Niek<br></div><d=
iv><br></div><div><br></div><br><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&lt;snip&gt;<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000cf72ba05a00da3b1--
