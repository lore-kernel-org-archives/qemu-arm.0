Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1676950lfc;
        Wed, 10 Feb 2021 13:43:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyi7MNUL1kMl2Hjj8gKZKT307oTj0DhaLFDa9VoBaIHi/HJGBbUsxhYnHv5X0Q7Ey+v9EpS
X-Received: by 2002:a25:cbcb:: with SMTP id b194mr5246048ybg.174.1612993427204;
        Wed, 10 Feb 2021 13:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612993427; cv=none;
        d=google.com; s=arc-20160816;
        b=mmxCbNAWKm8lLBTZsOm/clq5yPgZZJyJ7VRDj31um+OuhNA/ezCEdUMXTEPCgmZekB
         p5iZrDwGQW0WLlpsfZt/Z/GCu7SOAsgNM8x50CGbQjsVYKIVTiCYg87QP3ZFDi9TiAGQ
         9FfA4w3WFK7/NVb7wUMTwY5gt5NmR96rSX1wAeaQGq1Cu5kB742rADoHtZ9U/57OJw0C
         OcBtVfAMjOYM83Lo3VCFi4jV+/5li0fn3mQIfhHqgi2qYvFQxKEPIAlXfZTjG7nwgKge
         mrAhSJcrSFJWr0B6GURtaWyIKbKb30QYk6sFk348R83g60L65mKtc12YlpYr1ZDCPtN9
         11zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7nYflSMoo9DnwPN1lqWQ3ALCy17uCyJwHAJ9XPjBQN8=;
        b=kArulCl4l9L7GZ6t4u0n4vykox3KUMH4jVehU59iRQgzbLtoS3m9m5fVCIiaR1NGsO
         IwHIlUoL9yG0MmemQY4GsSyzgzgMVMZhzo4NojZtINU8M9X7zBFHCV6Sgl5kEE7B/oxw
         eDvQ1ltlPJX72R1LeNptvDMnljFYjEukmdHuW+bOUoSljSe3Jbo/mxHQkl5bsRRrb1Y7
         YTmgIlbXQMZu74Zd8Sja13pb9w0x1GXT2QaKTWJL9xmo8QyG7D4xdGLLpgv3LZqW5J9J
         Gc6N28PZddb4C27meVjCikoBnNpxqlH6Y8ybjZzRCntMDtsi4L8vFyMxmGw72lA6TwOq
         tiBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="N7zYwzC/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si3147786ybk.250.2021.02.10.13.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 13:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="N7zYwzC/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9xH0-0000Td-Fp
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 16:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9xGU-0000SH-FL
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 16:43:18 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:38093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9xGL-0000qR-ND
 for qemu-arm@nongnu.org; Wed, 10 Feb 2021 16:43:14 -0500
Received: by mail-lf1-x129.google.com with SMTP id m22so5160739lfg.5
 for <qemu-arm@nongnu.org>; Wed, 10 Feb 2021 13:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7nYflSMoo9DnwPN1lqWQ3ALCy17uCyJwHAJ9XPjBQN8=;
 b=N7zYwzC/YXTD1uTYnDX5MuXz2n6MuWnQY692tnpqcr9wWznffvWxfQNG6tATMEs+zH
 dR99kz9ndbY09L5AGGUzq84AWVidiJE8ZowPvz7FMMWfmAswnTp6537CRYqE7fNqnyCz
 SAcLdguj28+8fkgY5atXydP1rAh9trgjwoHbWPINN3cTU+g5AZ0eb+Fr2+wG29hADcBf
 MU3MbTqd/LHuQy9OPl9F+qEXI6dSRCsbjnGzyFqJT2NnJCT9YwagRVmsd+kFQXsx69xJ
 DNOZN/b+rIpr+ogupcvhDMu3LvNavuNphlZXX3BDQUvxIWRwMtZkt+f4uqW4tsUuwfJ9
 B/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7nYflSMoo9DnwPN1lqWQ3ALCy17uCyJwHAJ9XPjBQN8=;
 b=gbPimZU3WNgq9Uw/7a1INc8MhqoNWi8t2dVd9WX4iY1DMecNQ5goOjuJiIXs9qYZOA
 JSplXPbUwrM7e6DCoHu0M0sVwWODGdE0dSyvsWHAwZ9w7QmeaA4LBbL1m77VcS6NK+97
 jYEdY4vWi7u1QxdfqfDVvEKLC1VsSxmLkWZBAlZG6+Xmk0QLFtuCOuWkHzJUqjfzzXqt
 yOfVNbys3nrv5SUsKti/OSrj4utTJqpsw+wSMAYATykpYsCJOHnY5EJykPiBdCZiIZVF
 3FjxoaDMcMHg5p8VXMtDeiXAIVLWHgWEVYY43GgsWK8gkhvGIfawp0DPQMvfuiv+DgfO
 uPNA==
X-Gm-Message-State: AOAM531bAnAaOGzleK50/qWjRmuPiLd417qIuDCeNmqSTfjdNK9k1nNs
 4TIRabPXzi3JqDpWYMJbaZa+E/vfqtABtW0DY0n9zA==
X-Received: by 2002:a05:6512:1284:: with SMTP id
 u4mr2700957lfs.175.1612993380937; 
 Wed, 10 Feb 2021 13:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-7-wuhaotsh@google.com>
 <CAFEAcA-8q2DZpdbeiMhrxtAMkzx1_1BqcGTk8HfxX_6F_FOUfQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-8q2DZpdbeiMhrxtAMkzx1_1BqcGTk8HfxX_6F_FOUfQ@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 10 Feb 2021 13:42:48 -0800
Message-ID: <CAGcCb11eUrZhRZy4aT=t9078RF81kBSLTROF9gk8-me0nL4euw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 Patrick Venture <venture@google.com>, Doug Evans <dje@google.com>, 
 Corey Minyard <cminyard@mvista.com>
Content-Type: multipart/alternative; boundary="0000000000007f6ddb05bb024943"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Mz2RsloqFV5

--0000000000007f6ddb05bb024943
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 8:59 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > This patch implements the FIFO mode of the SMBus module. In FIFO, the
> > user transmits or receives at most 16 bytes at a time. The FIFO mode
> > allows the module to transmit large amount of data faster than single
> > byte mode.
> >
> > Reviewed-by: Doug Evans<dje@google.com>
> > Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Corey Minyard <cminyard@mvista.com>
> > Ack-by: Corey Minyard <cminyard@mvista.com>
> > ---
> >  hw/i2c/npcm7xx_smbus.c           | 342 +++++++++++++++++++++++++++++--
> >  hw/i2c/trace-events              |   1 +
> >  include/hw/i2c/npcm7xx_smbus.h   |  25 +++
> >  tests/qtest/npcm7xx_smbus-test.c | 149 +++++++++++++-
> >  4 files changed, 501 insertions(+), 16 deletions(-)
> >
> > diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
> > index c72b6e446f..be3253d251 100644
> > --- a/hw/i2c/npcm7xx_smbus.c
> > +++ b/hw/i2c/npcm7xx_smbus.c
> > @@ -27,7 +27,7 @@
> >  #include "trace.h"
> >
> >  #define NPCM7XX_SMBUS_VERSION 1
> > -#define NPCM7XX_SMBUS_FIFO_EN 0
> > +#define NPCM7XX_SMBUS_FIFO_EN 1
>
> Why has this define changed ?
>
> >  #define NPCM7XX_SMBUS_ENABLED(s)    ((s)->ctl2 & NPCM7XX_SMBCTL2_ENABLE)
> > +#define NPCM7XX_SMBUS_FIFO_ENABLED(s) (NPCM7XX_SMBUS_FIFO_EN && \
> > +        (s)->fif_ctl & NPCM7XX_SMBFIF_CTL_FIFO_EN)
>
> ...and why are we testing something that's always 1 ?
> Is NPCM7XX_SMBUS_FIFO_EN supposed to be a debug "turn this feature off"
> switch for QEMU developers? If, so it would be helpful to give it a name
> that doesn't look like it's defining a bit value for the hardware
> and adding a comment saying what it does.
>
No, it's a specific bit in the NPCM7XX SMBus module's version reg that
indicates whether this module
supports FIFO mode. I'll rename it so it's more clear to the reader.

>
> > @@ -754,6 +1059,17 @@ static const VMStateDescription
> vmstate_npcm7xx_smbus = {
> >          VMSTATE_UINT8_ARRAY(addr, NPCM7xxSMBusState,
> NPCM7XX_SMBUS_NR_ADDRS),
> >          VMSTATE_UINT8(scllt, NPCM7xxSMBusState),
> >          VMSTATE_UINT8(sclht, NPCM7xxSMBusState),
> > +        VMSTATE_UINT8(fif_ctl, NPCM7xxSMBusState),
> > +        VMSTATE_UINT8(fif_cts, NPCM7xxSMBusState),
> > +        VMSTATE_UINT8(fair_per, NPCM7xxSMBusState),
> > +        VMSTATE_UINT8(txf_ctl, NPCM7xxSMBusState),
> > +        VMSTATE_UINT8(t_out, NPCM7xxSMBusState),
> > +        VMSTATE_UINT8(txf_sts, NPCM7xxSMBusState),
> > +        VMSTATE_UINT8(rxf_sts, NPCM7xxSMBusState),
> > +        VMSTATE_UINT8(rxf_ctl, NPCM7xxSMBusState),
> > +        VMSTATE_UINT8_ARRAY(rx_fifo, NPCM7xxSMBusState,
> > +                            NPCM7XX_SMBUS_FIFO_SIZE),
> > +        VMSTATE_UINT8(rx_cur, NPCM7xxSMBusState),
> >          VMSTATE_END_OF_LIST(),
> >      },
> >  };
>
> It's OK to add fields to the vmstate without bumping the version
> number in this special case, because we only just added the device
> a few commits earlier in the series, but it's worth specifically
> saying that in the commit message.
>
> thanks
> -- PMM
>

--0000000000007f6ddb05bb024943
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 8, 2021 at 8:59 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Fri, 29 Jan 2021 at 01:04, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@go=
ogle.com" target=3D"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch implements the FIFO mode of the SMBus module. In FIFO, the<=
br>
&gt; user transmits or receives at most 16 bytes at a time. The FIFO mode<b=
r>
&gt; allows the module to transmit large amount of data faster than single<=
br>
&gt; byte mode.<br>
&gt;<br>
&gt; Reviewed-by: Doug Evans&lt;<a href=3D"mailto:dje@google.com" target=3D=
"_blank">dje@google.com</a>&gt;<br>
&gt; Reviewed-by: Tyrong Ting&lt;<a href=3D"mailto:kfting@nuvoton.com" targ=
et=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Corey Minyard &lt;<a href=3D"mailto:cminyard@mvista.com" =
target=3D"_blank">cminyard@mvista.com</a>&gt;<br>
&gt; Ack-by: Corey Minyard &lt;<a href=3D"mailto:cminyard@mvista.com" targe=
t=3D"_blank">cminyard@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/i2c/npcm7xx_smbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 342 +++++++++++++++++++++++++++++--<br>
&gt;=C2=A0 hw/i2c/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 include/hw/i2c/npcm7xx_smbus.h=C2=A0 =C2=A0|=C2=A0 25 +++<br>
&gt;=C2=A0 tests/qtest/npcm7xx_smbus-test.c | 149 +++++++++++++-<br>
&gt;=C2=A0 4 files changed, 501 insertions(+), 16 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c<br>
&gt; index c72b6e446f..be3253d251 100644<br>
&gt; --- a/hw/i2c/npcm7xx_smbus.c<br>
&gt; +++ b/hw/i2c/npcm7xx_smbus.c<br>
&gt; @@ -27,7 +27,7 @@<br>
&gt;=C2=A0 #include &quot;trace.h&quot;<br>
&gt;<br>
&gt;=C2=A0 #define NPCM7XX_SMBUS_VERSION 1<br>
&gt; -#define NPCM7XX_SMBUS_FIFO_EN 0<br>
&gt; +#define NPCM7XX_SMBUS_FIFO_EN 1<br>
<br>
Why has this define changed ?<br>
<br>
&gt;=C2=A0 #define NPCM7XX_SMBUS_ENABLED(s)=C2=A0 =C2=A0 ((s)-&gt;ctl2 &amp=
; NPCM7XX_SMBCTL2_ENABLE)<br>
&gt; +#define NPCM7XX_SMBUS_FIFO_ENABLED(s) (NPCM7XX_SMBUS_FIFO_EN &amp;&am=
p; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (s)-&gt;fif_ctl &amp; NPCM7XX_SMBFIF_CTL_=
FIFO_EN)<br>
<br>
...and why are we testing something that&#39;s always 1 ?<br>
Is NPCM7XX_SMBUS_FIFO_EN supposed to be a debug &quot;turn this feature off=
&quot;<br>
switch for QEMU developers? If, so it would be helpful to give it a name<br=
>
that doesn&#39;t look like it&#39;s defining a bit value for the hardware<b=
r>
and adding a comment saying what it does.<br></blockquote><div>No, it&#39;s=
 a specific bit in the NPCM7XX SMBus module&#39;s=C2=A0version reg that ind=
icates whether this module</div><div>supports FIFO mode. I&#39;ll rename it=
 so it&#39;s more clear to the reader.=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
&gt; @@ -754,6 +1059,17 @@ static const VMStateDescription vmstate_npcm7xx_=
smbus =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(addr, NPCM7xxSMB=
usState, NPCM7XX_SMBUS_NR_ADDRS),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(scllt, NPCM7xxSMBusSta=
te),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(sclht, NPCM7xxSMBusSta=
te),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(fif_ctl, NPCM7xxSMBusState)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(fif_cts, NPCM7xxSMBusState)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(fair_per, NPCM7xxSMBusState=
),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(txf_ctl, NPCM7xxSMBusState)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(t_out, NPCM7xxSMBusState),<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(txf_sts, NPCM7xxSMBusState)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(rxf_sts, NPCM7xxSMBusState)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(rxf_ctl, NPCM7xxSMBusState)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8_ARRAY(rx_fifo, NPCM7xxSMBus=
State,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_SMBUS_FIFO_SIZE),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(rx_cur, NPCM7xxSMBusState),=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt;=C2=A0 };<br>
<br>
It&#39;s OK to add fields to the vmstate without bumping the version<br>
number in this special case, because we only just added the device<br>
a few commits earlier in the series, but it&#39;s worth specifically<br>
saying that in the commit message.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--0000000000007f6ddb05bb024943--
