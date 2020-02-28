Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp992574lfg;
        Fri, 28 Feb 2020 10:44:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYpt2tcm+yoGq9i9WUWWz1BnFIk28xNB5KqMYQ89VlEsiBznVP0xDtaN9UxfPc/pZAgAX9
X-Received: by 2002:a05:620a:686:: with SMTP id f6mr5823487qkh.86.1582915482798;
        Fri, 28 Feb 2020 10:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582915482; cv=none;
        d=google.com; s=arc-20160816;
        b=FU2RuO8HA8mfbtBwnknZEwqUyFdKfR4KMzK8HtOjx7QN7/v7ndHA7RdG6q+SJn+4eK
         4JnxDsMylxReEakHeDoUhc7RyBKqyX6xop9GpNBXtltcbdv8Of7oEgalt8ufnpFMPOdb
         f6Bv+A8YpiZtO+TxfjvF7JMOWfJd5JwzvRijZPpzFcyhyrz95mqgQ2yLaftSnVSKME6E
         6tJanhz9qbJGqeTqekazHJxhAYo5zYIhDImEZrr6Pi2d9M7+YXPSNWQ65Ij4rUjCxCZ+
         CiGW0uUmKLfiC6qu1VaJi6lkevcLoJzey1HiFTIHFub5JBh8iL+TbT8QkLZAYWnG3v7B
         MSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6x6+3qwN6xjzA0xy2KKcx6OQOpuOQ2dni+X5uUQ/Uc=;
        b=y77z/KQZGWU78wtDQzspepP0vWmrWG8w1JOXXQhO2g5E+zEYfV5JPQP56eYo/Sv+GO
         /+/RrcJDJfKMM7zRO1LQu1eUgrVeoTPUlpCwlBKm8e7QEQ08oVM0XdYcTeFpWuOaQJ6E
         aaDoiCamhZ0luUGPxDYqYMx6Ln7f6KIovaw/QlOeDOaf2vzhfHa64+3hb+BXubQHFmhK
         J9b07KTbqXaPowF1nZU6d7tTenPRBt7cMvNBQUPLT5s/QFs7H2hN8dnv/KG/FutJDGce
         UUqtRSpV8VCNy9MXmWxtwgZM2LafBazMBFIIfX3QOOzzf1aNXhQnJi2LX5WhjquemftH
         4hlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vsdr5Pn+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si1675004qvn.213.2020.02.28.10.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 10:44:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vsdr5Pn+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7kcs-0000e2-78
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 13:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33847)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1j7kcj-0000b6-TZ
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 13:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1j7kci-0007Tv-O3
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 13:44:33 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:38512)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1j7kci-0007Ow-DU; Fri, 28 Feb 2020 13:44:32 -0500
Received: by mail-lj1-x242.google.com with SMTP id w1so4439576ljh.5;
 Fri, 28 Feb 2020 10:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h6x6+3qwN6xjzA0xy2KKcx6OQOpuOQ2dni+X5uUQ/Uc=;
 b=Vsdr5Pn+87FkcCL8Dzoc6+GnMyHHJ0iJzxQ1aK9q0c7H/k+qBLcDGJrChUDcWd2uag
 69vMn8WO3ymSHbx76924fHly/fRO8fF1Y/PBMyfBUwhPWs7pQD9wHAJzPfKdkktixk7d
 pV5mBDRpiJ+7RUxkHg//o9OaorIXtd/UDB5YPBBGKVMs0d/zMpDKJUQY+IupmI8eaFci
 vXEuZzwx7mXxsoGayrNDRPjIaDp1ufpPDMg6xxnZdplNmdpU6xFQV2Z1DziuoxkCjAgf
 MJ8vu23nzJk+GARacbBUQnWQ4ZLNQH1Lgy2/x0GkRnZthntWkHTqGoAEk07XAu6SjUy3
 4Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h6x6+3qwN6xjzA0xy2KKcx6OQOpuOQ2dni+X5uUQ/Uc=;
 b=gXm1YwUiPzaGTDRwH6rnUU+PUb47a70g0E0pTO5JNU3LA3DdruR8z/Q5PEKvifHLAh
 pwEftIv56Td/Icled2DuE2p5ltQ4scuYb0i6Zc5+rvYv3/57qqrD9GOYGSlo/cAx764T
 YuXsY/EJDhcGRZdRBb1/T7D6l9uMsnMBYGRpaibrhTXNS+T1eCJgjF5CyeJBW5+brctl
 cPAGtpLD6R1LfEtOLoTY1pvlRgmliLiYz7D1Gy8frfj0bbMqQlJvxxuwRe7VdQK7eyTz
 h1MeO8DnE4nlMLQ9cUmaZwuyRlQApLmyF3Zj7pUT0Y2kGC5PSPs61m62loG/4axvH6SX
 60Tw==
X-Gm-Message-State: ANhLgQ2l2anqGUGgMdxCp+jEAGTMM7NoWKaewXxDPepTSNxjbBrGA6cO
 7XV6qVXwwMKkyQnqVfzZ++fNn01oEcMOubW16zc=
X-Received: by 2002:a2e:6c13:: with SMTP id h19mr3758062ljc.221.1582915470424; 
 Fri, 28 Feb 2020 10:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20200215122354.13706-1-linux@roeck-us.net>
 <CAFEAcA-u=j3MYu-Ck0UbMzXXEoB41dx6UbGw15QBEnqBBX988g@mail.gmail.com>
 <CAFEAcA-_V-7VDZvVg4WE99A4b1UimQ0RrLG910qmsxCgRVvq5A@mail.gmail.com>
In-Reply-To: <CAFEAcA-_V-7VDZvVg4WE99A4b1UimQ0RrLG910qmsxCgRVvq5A@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Fri, 28 Feb 2020 12:44:19 -0600
Message-ID: <CAJy5ezoP7qNCymOpVXgMcwOuYvXBPVnf718gN_qfsfW_D9MVFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/xilinx_zynq: Fix USB port instantiation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000052fe86059fa73a62"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ms3FLuqXeL3j

--00000000000052fe86059fa73a62
Content-Type: text/plain; charset="UTF-8"

Sorry Peter, I missed the email.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Best regards,
Edgar


On Fri, 28 Feb. 2020, 10:00 Peter Maydell, <peter.maydell@linaro.org> wrote:

> On Thu, 20 Feb 2020 at 15:05, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Sat, 15 Feb 2020 at 12:23, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > USB ports on Xilinx Zync must be instantiated as TYPE_CHIPIDEA to work.
> > > Linux expects and checks various chipidea registers, which do not exist
> > > with the basic ehci emulation. This patch series fixes the problem.
> > >
> > > The first patch in the series fixes the actual problem.
> > >
> > > The second patch removes the now obsolete explicit Xilinx
> > > support from the EHCI code.
> > >
> > > v2: Introduced summary
> > >
> > > ----------------------------------------------------------------
> > > Guenter Roeck (2):
> > >       hw/arm/xilinx_zynq: Fix USB port instantiation
> > >       hw/usb/hcd-ehci-sysbus: Remove obsolete xlnx,ps7-usb class
> >
> > Xilinx folks -- could you provide a reviewed-by or acked-by
> > for this series, please?
>
> No? Oh, well, applied to target-arm.next anyway.
>
> thanks
> -- PMM
>

--00000000000052fe86059fa73a62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Sorry Peter, I missed the email.<div dir=3D"auto"><b=
r></div><div dir=3D"auto">Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mai=
lto:edgar.iglesias@xilinx.com">edgar.iglesias@xilinx.com</a>&gt;</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Best regards,=C2=A0</div><div dir=
=3D"auto">Edgar</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri, 28 Feb. 2020, 10:00 Peter Maydell, &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Thu, 20 Feb 2020 at 15:05, Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank=
" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, 15 Feb 2020 at 12:23, Guenter Roeck &lt;<a href=3D"mailto:linu=
x@roeck-us.net" target=3D"_blank" rel=3D"noreferrer">linux@roeck-us.net</a>=
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; USB ports on Xilinx Zync must be instantiated as TYPE_CHIPIDEA to=
 work.<br>
&gt; &gt; Linux expects and checks various chipidea registers, which do not=
 exist<br>
&gt; &gt; with the basic ehci emulation. This patch series fixes the proble=
m.<br>
&gt; &gt;<br>
&gt; &gt; The first patch in the series fixes the actual problem.<br>
&gt; &gt;<br>
&gt; &gt; The second patch removes the now obsolete explicit Xilinx<br>
&gt; &gt; support from the EHCI code.<br>
&gt; &gt;<br>
&gt; &gt; v2: Introduced summary<br>
&gt; &gt;<br>
&gt; &gt; ----------------------------------------------------------------<=
br>
&gt; &gt; Guenter Roeck (2):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/arm/xilinx_zynq: Fix USB port instan=
tiation<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/usb/hcd-ehci-sysbus: Remove obsolete=
 xlnx,ps7-usb class<br>
&gt;<br>
&gt; Xilinx folks -- could you provide a reviewed-by or acked-by<br>
&gt; for this series, please?<br>
<br>
No? Oh, well, applied to target-arm.next anyway.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div></div>

--00000000000052fe86059fa73a62--
