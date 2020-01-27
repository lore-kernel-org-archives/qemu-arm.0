Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3632242lfp;
        Mon, 27 Jan 2020 03:21:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxhddjuFjc0nIRZAJmKuVS1f3uTXvpzQX9nO5gve1CBJXA/cif26j+8lCg/hg47f0lVAQ+X
X-Received: by 2002:a37:a813:: with SMTP id r19mr14446108qke.389.1580124103104;
        Mon, 27 Jan 2020 03:21:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580124103; cv=none;
        d=google.com; s=arc-20160816;
        b=edueCt1INvWC46+nylrJ+bjCkSGRqLi7i/Nm5u7pszqIr3MWvavy3ptMRD3KeSg83t
         JTPyJ9ddaTl4Ay7nDqXLsnkAljQ8Yip6BNrldHBzPVKbFGyRt8jANr2PmdXqGFlv/fMr
         42wRC/Rut2u6rSUMQIiGpR7pY+kwemdFH9GfF2XctP5lGdF6J3nHLx3Z1NbWbqvOSJ47
         y/MURB4Dz81t6p+xB0g1iLIsoi33EfDUqndSNrjTS5I51yd0XTNE/PvuZqva0uyks1fi
         9I78szh1EnYvwSvecH23cfhNRR+Fx2DYItY4uDmi8ae1c/ckd/QI/xlfIIthaedgn1n9
         B38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :feedback-id:dkim-signature;
        bh=8/FmYAf3dNx/YkzYHeoOknXKR3uTWroBgFef1XHr68U=;
        b=CPhjufK/mIBOUTklRZ8kR0mu2ObqA4Zqa0Y1GSS5N6Y7FXnFRICFAo7C+mboxB+MMo
         JcfRlrztk358R+Ka7BvIyMQUjKX/LEtaI9fOK9P1XwVZSI82CDxczQgtnyt1+vFMRzM0
         ZTeI+xTTvnYtY3Kz4XBPGqEV1l92p9RlC44tU6Op/Pp4+A7mroFrV5IfjlbB6atbvgT2
         9RgFGkMyj2tymajfFEDt6wdr2dF4FgF8Hp3EGcdPtC0lLa8F5ZUshaHGnJ+FiyWJWAKX
         uJTZSXDpRqwL+O9+zQG2WYuuDbXElU95MAN6uKjhp2Ju5MwtLIALZCc6JVzgCUjV1i/y
         sccA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=ns00dkns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si9689032qvx.193.2020.01.27.03.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 03:21:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=ns00dkns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iw2Sc-0005Yk-G5
	for alex.bennee@linaro.org; Mon, 27 Jan 2020 06:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rsta2@o2online.de>) id 1iw2S6-0004ow-NS
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 06:21:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rsta2@o2online.de>) id 1iw2S5-0005Qo-2Q
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 06:21:10 -0500
Received: from mail229c50.megamailservers.eu ([91.136.10.239]:48592
 helo=mail36c50.megamailservers.eu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rsta2@o2online.de>)
 id 1iw2S4-0005Hp-GI; Mon, 27 Jan 2020 06:21:09 -0500
X-Authenticated-User: 017626146082@o2online.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1580124057;
 bh=5mxXBJF9kNB9eZK7UMToWMAhB9cHOuCiUWMIAMBkDEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ns00dknsXHxc7zBOScGQhovq+E4ZEaTYE14DO67gI9c2+QHz3vmn4fXh15ZGo/nR0
 mgGiuue6wCn19KhpdCM7tvXgwZWbmTPVtUREQoMjZga6geK1s6jdn7l0coya5CMaX2
 +2Tnn0RSwdvBWGqKdxijTV3dWFTQb6r5yYLgNTh4=
Feedback-ID: rsta2@o2online.
Received: from desktop2.localnet (178-21-1-177.ilmprovider.net [178.21.1.177])
 (authenticated bits=0)
 by mail36c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 00RBKsAD013615
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 27 Jan 2020 11:20:56 +0000
From: Rene Stange <rsta2@o2online.de>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] bcm2835_dma: Fix TD mode
Date: Mon, 27 Jan 2020 12:20:54 +0100
Message-ID: <2852675.bWBgnKVUkk@desktop2>
In-Reply-To: <9d885f77-0bb2-2ab6-cf46-400a0bc2deb8@redhat.com>
References: <5099495.CBsx362VbF@desktop2>
 <9d885f77-0bb2-2ab6-cf46-400a0bc2deb8@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CTCH-RefID: str=0001.0A0B020C.5E2EC799.005C, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=bd8Vr9HB c=1 sm=1 tr=0 a=oFQkuSNlBNCQRuITVo1IXg==:117
 a=oFQkuSNlBNCQRuITVo1IXg==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=8nJEP1OIZ-IA:10 a=7CQSdrXTAAAA:8 a=rTsyARspAAAA:20 a=20KFwNOVAAAA:8
 a=vxNqc9rRQqJLtr7q4cgA:9 a=6w-0JV3Zq0mKVwE1:21 a=zxFjX95f0CasTnp2:21
 a=wPNLvfGTeEIA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 91.136.10.239
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7qY/ViLK3c6D

Hi Philippe,

I'm running an example program for my Circle bare metal framework for the
Raspberry Pi using the LittlevGL graphics library. It uses the TD DMA mode =
to
transfer pixel data to the screen buffer (10 lines at a time). Without the
given patch applied to QEMU only the first pixel line of each transfer is
shown in TigerVNC viewer, after applying it, a solid image is shown.

You can reproduce the problem on a 64-bit Linux machine as follows. The "se=
d"
command modifies the example program, so that it doesn't try to access the
(not available) USB HCI controller of the Raspberry Pi 3.

Regards,

Rene


cd
mkdir dma-test
cd dma-test/
wget https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/bi=
nrel/gcc-arm-8.3-2019.03-x86_64-aarch64-elf.tar.xz
tar xJf gcc-arm-8.3-2019.03-x86_64-aarch64-elf.tar.xz
git clone https://github.com/rsta2/circle.git
cd circle
git submodule update --init
echo "AARCH =3D 64" > Config.mk
echo "RASPPI =3D 3" >> Config.mk
echo "PREFIX64 =3D ~/dma-test/gcc-arm-8.3-2019.03-x86_64-aarch64-elf/bin/aa=
rch64-elf-" >> Config.mk
=2E/makeall
cd addon/littlevgl/
make
cd sample/
sed -i -e "s/bOK =3D m_USBHCI/\/\/bOK =3D m_USBHCI/" kernel.cpp
make
qemu-system-aarch64 -M raspi3 -kernel kernel8.img


On Monday, 27 January 2020, 09:29:59 CET, Philippe Mathieu-Daud=E9 <philmd@=
redhat.com> wrote:
> Hi Rene,
>=20
> On 1/24/20 6:55 PM, Rene Stange wrote:
> > TD (two dimensions) DMA mode did not work, because the xlen variable has
> > not been re-initialized before each additional ylen run through in
> > bcm2835_dma_update(). Furthermore ylen has to be increased by one after
> > reading it from the TXFR_LEN register, because a value of zero has to
> > result in one run through of the ylen loop. Both issues have been fixed.
>=20
> What were you running, how can we reproduce?
>=20
> >=20
> > Signed-off-by: Rene Stange <rsta2@o2online.de>
> > ---
> >   hw/dma/bcm2835_dma.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> > index 1e458d7fba..0881c9506e 100644
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
> > @@ -72,13 +72,13 @@ static void bcm2835_dma_update(BCM2835DMAState *s, =
unsigned c)
> >  =20
> >           if (ch->ti & BCM2708_DMA_TDMODE) {
> >               /* 2D transfer mode */
> > -            ylen =3D (ch->txfr_len >> 16) & 0x3fff;
> > -            xlen =3D ch->txfr_len & 0xffff;
> > +            ylen =3D ((ch->txfr_len >> 16) & 0x3fff) + 1;
> > +            xlen_td =3D xlen =3D ch->txfr_len & 0xffff;
> >               dst_stride =3D ch->stride >> 16;
> >               src_stride =3D ch->stride & 0xffff;
> >           } else {
> >               ylen =3D 1;
> > -            xlen =3D ch->txfr_len;
> > +            xlen_td =3D xlen =3D ch->txfr_len;
> >               dst_stride =3D 0;
> >               src_stride =3D 0;
> >           }
> > @@ -117,6 +117,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, =
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



