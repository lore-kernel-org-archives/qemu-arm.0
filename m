Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4247683lfp;
        Mon, 3 Feb 2020 10:12:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4KpNGyZ5AMqA0vDWSqauDuN5JkmF2ool0rxYbJDaPb3exzgY5C19I75emL2TCi8JROGfK
X-Received: by 2002:a05:620a:2fa:: with SMTP id a26mr24961642qko.84.1580753521717;
        Mon, 03 Feb 2020 10:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580753521; cv=none;
        d=google.com; s=arc-20160816;
        b=rfYUQ0YuU+9hmMl6x9y6WzAF0gcxPuSPTfmHERa+7Qk4W5h/0YuTyIgWOjJA4H5GUi
         N4t2ugx9/a42H11hwKnpNNoHw0Orap4PVpqz3pzbLjjtIG6Y+M03RJ7aiGKT9bH+yslg
         eI+ZfjURgDEXm8gZne9Foc8hJLMU2t/KTef8OA51+HQ+EbdArDXyRqNBhVG+Z0Ew0+ws
         0u3Kr0CP9HtxVBw8nkfDmaW/kCMSt6Lx5hK3zvmA9GLxRNCZ67FdGdBJH4ds9K28VqZP
         Bfli2qezMcSUkes+Djs0z/R/zp9mjjxdVN0YM/CwXCyLQSu0m6N9h+ajIfgmVUGZkIlY
         PgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :feedback-id:dkim-signature;
        bh=g0oruZ7hXKljDmFRql+sPW5dIgsqze3C/GbfuxFW14A=;
        b=JXLkR9QKx1GoTuSy/wy6lJ/HDTxndMOAxXRdo55/uNuvonyKAHmdnSioew9JLFjEIQ
         cXGYF6ORcQrsQe/sKpUTAuBM2tDuknbbPTo1yuY6wa4OKmfy8cg7sBN10eSgQVGvgJnd
         75jK0uyMtVSqBY20CR8vYzHuSapodx/2s4LgmNaqwsCTSyxfCMwDDH3KOyy3A1O+1ub3
         YkOnTqK1wuyVebe9Yy9WGV/biSxM46nhcdo07hhsaetfZ3OtXZu68YF5nlMpNTeyv2P+
         N6oCsO3CmG3Vnvk+lsriYteLtQSfqe382MA90NTLKPR+tG95oZjUISVuHbeuW4adBscO
         xCog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=mJnnZh3C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si12519206qkk.9.2020.02.03.10.12.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 10:12:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=mJnnZh3C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iygCX-0005O4-5V
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 13:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rsta2@o2online.de>) id 1iygBA-0003Q3-LZ
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 13:10:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rsta2@o2online.de>) id 1iygB9-0007sk-Do
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 13:10:36 -0500
Received: from mail1441c50.megamailservers.eu ([91.136.14.41]:57978
 helo=mail264c50.megamailservers.eu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rsta2@o2online.de>)
 id 1iygB8-0007jV-L5; Mon, 03 Feb 2020 13:10:35 -0500
X-Authenticated-User: 017626146082@o2online.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1580748363;
 bh=MSzPDF9uLwq6F8ZOJIb0eJBBqDtvibTwL8H1wiozBjQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mJnnZh3Cfo3uBkvo56tSTW4ZaqeOAmyZT3KTLA4yqvllWBJoZJGhdqxfy9L4dOvN0
 OMDRsOUYn2FlhTHa82jc5WgBvftcU/KDz0eQf4xwxXrWXEEZkDbdXXX5vSMVt92Xkv
 YZsUzvF+m9fylI8c5JfwupMFTQeZP295aDwVT0Ms=
Feedback-ID: rsta2@o2online.
Received: from desktop2.localnet (178-21-1-177.ilmprovider.net [178.21.1.177])
 (authenticated bits=0)
 by mail264c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 013Gk1B2003653
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 3 Feb 2020 16:46:02 +0000
From: Rene Stange <rsta2@o2online.de>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/2] bcm2835_dma: Re-initialize xlen in TD mode
Date: Mon, 03 Feb 2020 17:45:51 +0100
Message-ID: <2339387.VYhbCED7Bd@desktop2>
In-Reply-To: <80ae5ce3-c58d-800c-4748-ea4842a6ff84@redhat.com>
References: <5397138.k0qeMALlIp@desktop2>
 <80ae5ce3-c58d-800c-4748-ea4842a6ff84@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CTCH-RefID: str=0001.0A0B0213.5E384E4B.0058, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=ar3M9hRV c=1 sm=1 tr=0 a=oFQkuSNlBNCQRuITVo1IXg==:117
 a=oFQkuSNlBNCQRuITVo1IXg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=8nJEP1OIZ-IA:10 a=20KFwNOVAAAA:8 a=WzSNw9QI6yEul72EYEEA:9
 a=34CKMIUG4oTmPNvu:21 a=EWH9Gj-z8SLf1cE_:21 a=wPNLvfGTeEIA:10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 91.136.14.41
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FsR6kqd72iu6

Philippe, of course you are right. I understand, what you mean. I'm a non-n=
ative
English speaker and I'm still learning. :)

Yes, I agree. Peter, please make the change, if you agree with the patch.

Thanks,

Rene


On Monday, 3 February 2020, 17:27:08 CET, Philippe Mathieu-Daud=E9 <philmd@=
redhat.com> wrote:
> On 2/3/20 4:40 PM, Rene Stange wrote:
> > TD (two dimensions) DMA mode did not work, because the xlen variable
> > has not been re-initialized before each additional ylen run through
> > in bcm2835_dma_update(), which has been fixed.
>=20
> "which has been fixed" confused me, because this current patch is fixing=
=20
> it. Using present tense makes it easier to understand for non-native=20
> English speakers IMHO:
>=20
>    TD (two dimensions) DMA mode does not work, because the xlen
>    variable is not re-initialized before each additional ylen
>    run through in bcm2835_dma_update(). Fix it.
>=20
> If you agree, maybe Peter (the maintainer who will take your patch) can=20
> make the change for you.
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> >=20
> > Signed-off-by: Rene Stange <rsta2@o2online.de>
> > ---
> >   hw/dma/bcm2835_dma.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> > index 667d951a6f..ccff5ed55b 100644
> > --- a/hw/dma/bcm2835_dma.c
> > +++ b/hw/dma/bcm2835_dma.c
> > @@ -54,7 +54,7 @@
> >   static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
> >   {
> >       BCM2835DMAChan *ch =3D &s->chan[c];
> > -    uint32_t data, xlen, ylen;
> > +    uint32_t data, xlen, xlen_td, ylen;
> >       int16_t dst_stride, src_stride;
> >  =20
> >       if (!(s->enable & (1 << c))) {
> > @@ -82,6 +82,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, un=
signed c)
> >               dst_stride =3D 0;
> >               src_stride =3D 0;
> >           }
> > +        xlen_td =3D xlen;
> >  =20
> >           while (ylen !=3D 0) {
> >               /* Normal transfer mode */
> > @@ -117,6 +118,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, =
unsigned c)
> >               if (--ylen !=3D 0) {
> >                   ch->source_ad +=3D src_stride;
> >                   ch->dest_ad +=3D dst_stride;
> > +                xlen =3D xlen_td;
> >               }
> >           }
> >           ch->cs |=3D BCM2708_DMA_END;
> >=20
>=20
>=20
>=20



