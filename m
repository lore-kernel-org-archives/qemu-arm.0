Received: by 10.223.197.9 with SMTP id q9csp5248744wrf;
        Tue, 17 Oct 2017 20:24:05 -0700 (PDT)
X-Received: by 10.55.27.25 with SMTP id b25mr621847qkb.144.1508297045339;
        Tue, 17 Oct 2017 20:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508297045; cv=none;
        d=google.com; s=arc-20160816;
        b=Ax00+Z2rkWL66PP3GJcjCEjIEX335Ly8GlEnml3wq7aaAkKC9aJzbzZ8x45FpFe2hi
         jWOXjdu5WESf8E8Qd1E6YWlTj+N2/rbZYzHItPLCFZQPeJts7Qf3CER8EH6qu2wQIw6U
         E0u5b4uj/ZwkEwSouw07eN824jz/8gh2sMcRYiC5WWtC1y3XVLQNlWBg1qvzsL58ybop
         rxPEMRHRH5cWBIs2ujbUnXOqGJIciNJFT4/LMFkAqy+rl3ymh8/PNHzl8BI5Yh1qhs1h
         rH14qsKi8Wz+pLljeiYRdLhPvJgXDlDApMdVjLBCes9sZ1JyAVlpRxfQnVCgTvMGaPwy
         tj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=w+jryWpHQGT7v/1bPE7vFSNrJGedaTOZmVlh/NItdh8=;
        b=NeZl9w9TPlEAuUkFx9ld4rymkzGmOTKdmgXmS+x1F8tgqKudmWoo3FGdvffTroHP33
         0ImfGWW2XD3FfMNydTRCAhudpBMQfYHE175aNxNi5be7qnjUkPQ3bgWsqCGczyCMoDt+
         Aej1M7w0opObu06N9aHRSeupSjNoUbymBoKhcAlcGKbtTosA6JYEdQph7xCJxB3GxuYZ
         0XipNFgy9IBuzRsSoVkihtoh5IRrZdhYBE2fX+AcPFM9SLOkRsjkk7APwka+MvlFCG04
         XcgIcbfQWBaKTHMpPYzO+TOwd9BsycmEmvxf3X3FMO0WcSs6Cyt7fjfZAr/eoLoQ2REv
         rNzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PFoFsgqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8si4146252qtk.427.2017.10.17.20.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 20:24:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PFoFsgqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4exf-00054B-05
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 23:24:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e4exT-00052s-4K
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 23:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e4exS-0000FH-2P
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 23:23:51 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:48349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e4exP-0000Dq-Oi; Tue, 17 Oct 2017 23:23:47 -0400
Received: by mail-vk0-x22f.google.com with SMTP id g69so2453391vke.5;
	Tue, 17 Oct 2017 20:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w+jryWpHQGT7v/1bPE7vFSNrJGedaTOZmVlh/NItdh8=;
	b=PFoFsgqSrORcOeYL0KrqnHRMWn0UQZcEfY5xeGSKvXRPapxQrneAB5t4zajWOJ4KaJ
	mashUyOEGxGUwv8Tac6ilX8u0vedBaJT2xs/udqY7zSL/d+GUV8qDes006HGqsHR/bLK
	cEYkhhZrj35urvxmI/3Jgtr6Ur74vacuiYQNLX2ISRTmqthzcLY1WhKcGatKeR7qhlza
	dM6IWm8NPTSuW910b2sy1N32ZclzBiRruuNZ5uKKMm1wxaE2B4Qolp023JiBkUMb4MmQ
	wivmNCpAAEPQZHxV/crwAxlwzzh0ZzjVq+HjlvscpNC3d3824Z/lrFKckitMIHbEpjTF
	r8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w+jryWpHQGT7v/1bPE7vFSNrJGedaTOZmVlh/NItdh8=;
	b=M1/BL1ZPRiNN6L+KVoXG9tCUxb3xTbat/AHzCtMZqKYghKJVvTH8ROuewfol8Pjaq0
	GN7Eh5wlQv/IO30sScnLX3lv/n0um48xaABiCqd2bAD6stbVesR+IW4+vNjlv+qhr5yz
	nwX0ETSqyJ6/ybgSPDfasZospQ6N0oib071QBLLMBWB0H8S9ovxLXxxoD+5Rdd+q1xwf
	exTeRGq3C0CLBa8aEfw9O7+2yNPtArGBjNB6QCVszwpKf3wUOlFxAJEw1/h7OpN0KAUM
	pV0MUVEpvmnicgyBaxTkF2u18QHmhVta0GHWYwwkLCq6tSmcvQaTdp8MPkQZgfK15YWN
	bjjA==
X-Gm-Message-State: AMCzsaVGpyd360cY0PSoBynXI7aOop6LY+pm1iOjPvYLwoJxOSMJhQQK
	1FS5/Oja9qAtERKtdgJzg6Mo3jBe7i+jLtnC9uo=
X-Google-Smtp-Source: ABhQp+TuYtBjJPvefB6GENykgzNgPSSU5DgA6e2y4iIusFLBLicxe8wlGAds4trF6BLqztvhcDttmCeTCC+JXChrRZE=
X-Received: by 10.31.60.211 with SMTP id j202mr2001651vka.134.1508297027173;
	Tue, 17 Oct 2017 20:23:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Tue, 17 Oct 2017 20:23:46 -0700 (PDT)
In-Reply-To: <CALHRZupURgAaiktM-mgWHud_2C07hNLY48BUbkbXE7ZV7EXqaQ@mail.gmail.com>
References: <1508176489-9002-1-git-send-email-sundeep.lkml@gmail.com>
	<CAFEAcA-vg31x5q7f1poJfHfrwKTrHEZo2Btua6o9xREHUzd8hQ@mail.gmail.com>
	<CALHRZupURgAaiktM-mgWHud_2C07hNLY48BUbkbXE7ZV7EXqaQ@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 18 Oct 2017 08:53:46 +0530
Message-ID: <CALHRZupdK7C4vGvN+e8B_8qqhoAFx2ts6Zi=TfSejvNyGHA7rw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a11437e048543ae055bc9c45a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::22f
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
X-TUID: 7DUUWiN02hAv

--001a11437e048543ae055bc9c45a
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Wed, Oct 18, 2017 at 8:45 AM, sundeep subbaraya <sundeep.lkml@gmail.com>
wrote:

> Hi Peter,
>
> On Tue, Oct 17, 2017 at 8:58 PM, Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On 16 October 2017 at 18:54, Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> wrote:
>> > Fixed incorrect frame size mask, validated maximum frame
>> > size in spi_write and removed dead code.
>> >
>> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> > ---
>> >  hw/ssi/mss-spi.c | 8 +++++---
>> >  1 file changed, 5 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
>> > index 5a8e308..1e49cbc 100644
>> > --- a/hw/ssi/mss-spi.c
>> > +++ b/hw/ssi/mss-spi.c
>> > @@ -76,9 +76,10 @@
>> >  #define C_BIGFIFO            (1 << 29)
>> >  #define C_RESET              (1 << 31)
>> >
>> > -#define FRAMESZ_MASK         0x1F
>> > +#define FRAMESZ_MASK         0x3F
>> >  #define FMCOUNT_MASK         0x00FFFF00
>> >  #define FMCOUNT_SHIFT        8
>> > +#define FRAMESZ_MAX          32
>> >
>> >  static void txfifo_reset(MSSSpiState *s)
>> >  {
>> > @@ -106,8 +107,6 @@ static void set_fifodepth(MSSSpiState *s)
>> >          s->fifo_depth = 16;
>> >      } else if (size <= 32) {
>>
>> Shouldn't this just be "} else {" now ?
>>
>> Yes. I will send v2.
>

Also I will log guest error if frame size is greater than 32.

Thanks,
Sundeep


>
> Thanks,
> Sundeep
>
> >          s->fifo_depth = 8;
>> > -    } else {
>> > -        s->fifo_depth = 4;
>> >      }
>> >  }
>>
>> thanks
>> -- PMM
>>
>
>

--001a11437e048543ae055bc9c45a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Wed, Oct 18, 2017 at 8:45 AM, sundeep subbaraya <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blank">su=
ndeep.lkml@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr">Hi Peter,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote"><div><div class=3D"h5">On Tue, Oct 17, 2017 at 8:58 PM, Pe=
ter Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.maydell@linaro.or=
g" target=3D"_blank">peter.maydell@linaro.org</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><span>On 16 October 2017 at 18:54, Subbaraya Sun=
deep &lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blank">sundee=
p.lkml@gmail.com</a>&gt; wrote:<br>
&gt; Fixed incorrect frame size mask, validated maximum frame<br>
&gt; size in spi_write and removed dead code.<br>
&gt;<br>
&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gm=
ail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
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
<span><br>
</span></blockquote></div></div><div>Yes. I will send v2.<br></div></div></=
div></div></blockquote><div><br></div><div>Also I will log guest error if f=
rame size is greater than 32.<br><br></div><div>Thanks,<br></div><div>Sunde=
ep<br>=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div=
 class=3D"gmail_extra"><div class=3D"gmail_quote"><div><br></div><div>Thank=
s,<br></div><div>Sundeep<br><br></div><span class=3D""><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =
=3D 8;<br>
&gt; -=C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
<br>
</span>thanks<br>
-- PMM<br>
</blockquote></span></div><br></div></div>
</blockquote></div><br></div></div>

--001a11437e048543ae055bc9c45a--
