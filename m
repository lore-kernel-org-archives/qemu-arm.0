Received: by 10.223.197.9 with SMTP id q9csp5243671wrf;
        Tue, 17 Oct 2017 20:16:06 -0700 (PDT)
X-Received: by 10.200.25.112 with SMTP id g45mr1225343qtk.40.1508296566900;
        Tue, 17 Oct 2017 20:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508296566; cv=none;
        d=google.com; s=arc-20160816;
        b=npsljTKvXqy2G9e1qlOzoPy9Zc5BJdqxIeLK0xGhpv3Y89LXo81yIIPoa6AZaq8sZ5
         p0Kq8ZpGEWQDa123H1YdyWUY+b0XJr6/Uko1RxQC+GNViTZJ9eQpVvxa4BnE5+QahZ6J
         Eb9MaPHLuzt17r+kM390gUp3yjdmmmO2c6nnXftvdzHjNzxK+N0VNR0NiBhpDyeCtmov
         ECq5mLDm30omOoPLPPFbsfewO2+EUtR/b2zP5/MloYuYYVcR9yza02Xr0am5vhObyoKD
         BmzMf2eqLS6hKyRIJh7Ka+Jv1BI9j3FXCf9oqGX6sVHNBXyJEI3CEvM4ufKf92QsvRp/
         lqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8N6dCO28/Wy2h/SBv/GrgADh5XkaViNQK9+Ob0JBreI=;
        b=DcRgWUwrZG3DkNLa7p/4ADm5zpoCN0H9u3r/5k1dcw+L3Ow7YVKytbo7+Z0ZLvS3/4
         pbjPTGBMFoQMT3RxggoYprkCyJbDQRoBipc5idF5PSC4YzTAlXx4PAOO2DaCTVQDGBiR
         WKXyeT5qvibmcH81xIt/nGFNy8+vq3RU/L1B3cUe18CpwY2eyXiCsZH5WoC26/CQVunJ
         c58ClXUJW4UEfecHgEOUGujsLWLrr0T2mmL0Bw+bRKrb2YCJMJO/4Ulc8d1jRhJ+oWp4
         xShvEuQBfJzOgU4DaY5x5HybMoKMH10FId1JE+90Urb9gldWRYmIFeSgHb5XfbkPuylg
         yx7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WSwLeqm9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j8si6347772qth.184.2017.10.17.20.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 20:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WSwLeqm9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4epw-0003X6-KZ
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 23:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e4epl-0003Uh-VS
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 23:15:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e4epk-0002Cv-Uc
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 23:15:53 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:47755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e4epi-0002A4-Io; Tue, 17 Oct 2017 23:15:50 -0400
Received: by mail-vk0-x243.google.com with SMTP id j2so2439392vki.4;
	Tue, 17 Oct 2017 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8N6dCO28/Wy2h/SBv/GrgADh5XkaViNQK9+Ob0JBreI=;
	b=WSwLeqm9/rieKUnibHCYrRRHCQ0M+2shCWxk0vULKpAZn4Bw39Tzy5AsBMnIYQQqtK
	Hr23Tdg+FG0Dr2IXDU5ly1tXxo/cHrpTtd8OrIAjJ0GKZQ2XdhGaF8aum6DkDmeWN5LF
	j+yH43EWSFwUtb+Pn/S7L3zuNAOE1ThtLEgzG7C2LkwN+wwyki3Uns3HQ+h6fqkt0/c2
	NnBapo4fyH9mSAUJZzqGxI5YVBalX7CsdpQgd6ZqixHpHq0q8KEx/iywCCHPPzSukgaB
	bu2e6t6YOqS2dxBXlgZQyKrB2dq78cUbDHDrBTObUEw8E6IHwlaBEhVPYbAYKGA+vadt
	aXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8N6dCO28/Wy2h/SBv/GrgADh5XkaViNQK9+Ob0JBreI=;
	b=bW9yNYpGdXzEQMrIqoDpMGxjEFh6GRe2nS+KmDdlUyKKiXuARnPQzVc3YtQg/Y/wO2
	pcOyL0FrD8TnrFSoEvEaCJBI7pV12J9nq+sJ2ZdtxbOzsIxn/0wq06X9g+2tYVIfauTW
	6fYIPBrAqP2MbAJDwCzRCVuwDV/uQiDIwcFe/YOiabAiCpzCoJgjqPs4rYNfjHpPCoLZ
	6Kyhx7R6LuJaY1qjlZHXBwPX7PtOIji22OYoGWarRTmmicKUk6K1jGo8/JvUwfbhy20i
	k4e84koCbq1Mgb6DZFgZiLvDyIg1xnPvF38NcUGf+tuIgOMIDYfJSzk5Jky3IaMygymB
	ui0A==
X-Gm-Message-State: AMCzsaXN5yKgspRaGtWjq8TcC9K0zFj6DfLdKF+vPCXbly3/uMHcnJK/
	rNbCJt6E5SI61f8jVAiXmeN3Ly3NrCeCtWtaVZs=
X-Google-Smtp-Source: ABhQp+RQZJ3MDmm+KdZmsuPnGZEcNaX0RocW5moAxgbJJKLWfIXjo3YyA/VCcYwwzI0/moeHRtUuesotcUF8KEUjEuw=
X-Received: by 10.31.141.206 with SMTP id p197mr4596176vkd.53.1508296548829;
	Tue, 17 Oct 2017 20:15:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Tue, 17 Oct 2017 20:15:48 -0700 (PDT)
In-Reply-To: <CAFEAcA-vg31x5q7f1poJfHfrwKTrHEZo2Btua6o9xREHUzd8hQ@mail.gmail.com>
References: <1508176489-9002-1-git-send-email-sundeep.lkml@gmail.com>
	<CAFEAcA-vg31x5q7f1poJfHfrwKTrHEZo2Btua6o9xREHUzd8hQ@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 18 Oct 2017 08:45:48 +0530
Message-ID: <CALHRZupURgAaiktM-mgWHud_2C07hNLY48BUbkbXE7ZV7EXqaQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a1142641402518e055bc9a8ce"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-arm] [Qemu devel PATCH] msf2: Remove dead code reported
 by Coverity
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /WwjHhwR0z42

--001a1142641402518e055bc9a8ce
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Tue, Oct 17, 2017 at 8:58 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 16 October 2017 at 18:54, Subbaraya Sundeep <sundeep.lkml@gmail.com>
> wrote:
> > Fixed incorrect frame size mask, validated maximum frame
> > size in spi_write and removed dead code.
> >
> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > ---
> >  hw/ssi/mss-spi.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
> > index 5a8e308..1e49cbc 100644
> > --- a/hw/ssi/mss-spi.c
> > +++ b/hw/ssi/mss-spi.c
> > @@ -76,9 +76,10 @@
> >  #define C_BIGFIFO            (1 << 29)
> >  #define C_RESET              (1 << 31)
> >
> > -#define FRAMESZ_MASK         0x1F
> > +#define FRAMESZ_MASK         0x3F
> >  #define FMCOUNT_MASK         0x00FFFF00
> >  #define FMCOUNT_SHIFT        8
> > +#define FRAMESZ_MAX          32
> >
> >  static void txfifo_reset(MSSSpiState *s)
> >  {
> > @@ -106,8 +107,6 @@ static void set_fifodepth(MSSSpiState *s)
> >          s->fifo_depth = 16;
> >      } else if (size <= 32) {
>
> Shouldn't this just be "} else {" now ?
>
> Yes. I will send v2.

Thanks,
Sundeep

>          s->fifo_depth = 8;
> > -    } else {
> > -        s->fifo_depth = 4;
> >      }
> >  }
>
> thanks
> -- PMM
>

--001a1142641402518e055bc9a8ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Tue, Oct 17, 2017 at 8:58 PM, Peter Maydell <span dir=3D"lt=
r">&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.=
maydell@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On 16 October 2017 at 18:54, Subbaraya Sundeep &lt;<a href=
=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt; wrote:<br=
>
&gt; Fixed incorrect frame size mask, validated maximum frame<br>
&gt; size in spi_write and removed dead code.<br>
&gt;<br>
&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gm=
ail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/ssi/mss-spi.c | 8 +++++---<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c<br>
&gt; index 5a8e308..1e49cbc 100644<br>
&gt; --- a/hw/ssi/mss-spi.c<br>
&gt; +++ b/hw/ssi/mss-spi.c<br>
&gt; @@ -76,9 +76,10 @@<br>
&gt;=C2=A0 #define C_BIGFIFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &l=
t;&lt; 29)<br>
&gt;=C2=A0 #define C_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(1 &lt;&lt; 31)<br>
&gt;<br>
&gt; -#define FRAMESZ_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1F<br>
&gt; +#define FRAMESZ_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3F<br>
&gt;=C2=A0 #define FMCOUNT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00FFFF00=
<br>
&gt;=C2=A0 #define FMCOUNT_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
&gt; +#define FRAMESZ_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 32<br>
&gt;<br>
&gt;=C2=A0 static void txfifo_reset(MSSSpiState *s)<br>
&gt;=C2=A0 {<br>
&gt; @@ -106,8 +107,6 @@ static void set_fifodepth(MSSSpiState *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 16;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (size &lt;=3D 32) {<br>
<br>
</span>Shouldn&#39;t this just be &quot;} else {&quot; now ?<br>
<span class=3D""><br>
</span></blockquote><div>Yes. I will send v2.<br><br></div><div>Thanks,<br>=
</div><div>Sundeep<br><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 8;<br>
&gt; -=C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
<br>
</span>thanks<br>
-- PMM<br>
</blockquote></div><br></div></div>

--001a1142641402518e055bc9a8ce--
