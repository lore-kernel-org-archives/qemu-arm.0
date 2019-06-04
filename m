Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1356447wrg;
        Mon, 3 Jun 2019 19:33:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcPMzUkVWbIqhmOc8S5JjYMjJyQip4PBeTIcO5pExfvNLrZ4FH6n+9n5yniV7w9psrgFlk
X-Received: by 2002:a05:620a:12f8:: with SMTP id f24mr5719153qkl.202.1559615600491;
        Mon, 03 Jun 2019 19:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559615600; cv=none;
        d=google.com; s=arc-20160816;
        b=XESUb2TS+abOHd+CXZZq0gGZntF29/d6fCftluJjP5UiAP8uxGrXsbz/G+I8JXQNex
         Z7KivvchrdHexsHkZg+ljkplEsCsy+hkayzZ6Vs2Li1Lhm5KXIslc9L0pm48QSCZFpMM
         IDveWrDgBOqpzexO/cl6oSVke36CU0gJULCP41YqPLjR5f48eu2QW8uSd/B9w60N8WP/
         I6QJ43Zje0KYmyPrhFwWU+7IhcfqF4kEdCyKDDMSpcJpqUPYOPiI4kRFLOr5fg3oA6qe
         xRnC8ZNTwIak4iFWZ4jg0a8BXsld3m2Rqwu5Wg09K021zZNPFt2Wz7CexxANAtQQlq/X
         mE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:from:date:references:in-reply-to
         :message-id:mime-version:user-agent:dkim-signature:dkim-signature;
        bh=JbfrRdGyHpDUK9LMUXF+TLKRgKroyl0vF0DH0kTJH6g=;
        b=fezu+Ax/aG4fU422cjeMlTMYHBORCZgMcY+6ULpZCUwIgowru5RRydm28DtRZofKfW
         OUWbatHNyBv3bZmCsVpcDvGPmIz2/C9pdU9fUaJIiO7poRhqCpA7C/m3OQXAHGb70pMj
         WkalZ9tJLzY3x5flnVZYseg95Wk7IxuaWexGrOcmQtyG1dJfbZR/FeeOEiYUdXGNmp5A
         GWafdFs3xyCtWh3X8frduHVCVi8uLIUkr4nqwuD67bxoyNsEX8sm24iREhnN5OfsGtPM
         GNssYMTdRKCiUBZzKrqq3P1sQFEinga8UNtULxNy2rcJqK+srfjxUzUmezKI/mxt5uVo
         TXdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=mzybnMhF;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=PlVZDchX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 42si1767778qto.84.2019.06.03.19.33.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jun 2019 19:33:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=mzybnMhF;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=PlVZDchX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:44125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hXzGJ-0003Pq-LF
	for alex.bennee@linaro.org; Mon, 03 Jun 2019 22:33:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1hXzG3-0003PO-6G
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 22:33:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1hXzG1-0003dQ-Ef
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 22:33:02 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43373)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1hXzG0-0003YE-UV; Mon, 03 Jun 2019 22:33:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9EBED20BA1;
	Mon,  3 Jun 2019 22:32:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute4.internal (MEProxy); Mon, 03 Jun 2019 22:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type:content-transfer-encoding; s=fm2; bh=JbfrR
	dGyHpDUK9LMUXF+TLKRgKroyl0vF0DH0kTJH6g=; b=mzybnMhFf+00NK2V/7ZSD
	x4yHiLQgtPsST5iesemajY7SyvrlDRnNnGawkn9tSe9PXq0RnrA7f/Oi8JNJaBFK
	Nek9xbwvwYK3PcGRGDZQpWHlA5nEHXYnPBfZOqu+mUjBjUNRHBLx5TQidrDqG9sF
	W6Ofdvuzcj+LkXCzToTBf0eAFZauzrE7Ii/4vYjSW3NkU89dAzZRlWpmGMhL/k4H
	g2fbjRgZ/tm2J3M0CYQAjynfSCCxoEUy7RJKbPolT5RzSGAbzBXPzp+2BrioyN0N
	XuskvIEAu+4u/4dCURGGnCqW0C0jjAgCYCB88EQUozZqbtm+naHokAanLACsM97a
	w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=JbfrRdGyHpDUK9LMUXF+TLKRgKroyl0vF0DH0kTJH
	6g=; b=PlVZDchXP/XWiz+D9tGBzGS4uQoWfHEi563VTRbtPd8/J6pBgNEjsR0LO
	wh5bDCSlHvjejjqdpsRz06O6WvS/im8yYDP+zc6COEIo2TyZtUWFU4cfA/1X/1/5
	0XCl2r4FBlMQYS5Z6vrwiUIPqv2ROKxQ5KNqt8DQgjIMHUqaNnWaf/pIUQUmOh0v
	bfgH/JUIy+GI8zzyVvDEM/ICGmSnW10J5d1JLScxavbFGqFADHBWCZJDtCe1yC+/
	sBnVcdp4ON0hrwePUeeGYsOQWHQg2DGp1rG1Js8NvzpmCPTS3GcbZhYBb2lroJ1t
	P9FOWvwfqAphdVoNiA1AG5NsZkfdg==
X-ME-Sender: <xms:Wdj1XNTywwv0SJxIXpve-n36eKhGZLZiSlzT-4T0CXAnpQG5kTn7rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefkedgieduucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
	ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
	hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
	vghrufhiiigvpedt
X-ME-Proxy: <xmx:Wdj1XBXq8i9gHIjlgBJ-ly47Vq8CXRK27PwHmGFqM4xpE_iBlYktmw>
	<xmx:Wdj1XPaWOIPCt3KeaDgvkJps6gV2kVRaC847mDtwO-TouVsBOVrmYQ>
	<xmx:Wdj1XH2AwuICl1PlK23XIpGxJdFWqh2Y_ofl4F1ctxy1hpAbiPT96g>
	<xmx:Wtj1XDZ93ZeEWO04emGhe1KO9EavQ0aM1ZwPiVyTr7SS-jUTn1r3xg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 53702E00A1; Mon,  3 Jun 2019 22:32:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-555-g49357e1-fmstable-20190528v2
Mime-Version: 1.0
Message-Id: <cce364a3-548c-427f-addb-07e38f827e03@www.fastmail.com>
In-Reply-To: <CACPK8XdDBYK4V50efHiqjwR7GAu+WYMsxpeRyOMTgATS05re7g@mail.gmail.com>
References: <1559589055-71202-1-git-send-email-anoo@linux.ibm.com>
	<CACPK8XdDBYK4V50efHiqjwR7GAu+WYMsxpeRyOMTgATS05re7g@mail.gmail.com>
Date: Tue, 04 Jun 2019 12:02:56 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Adriana Kobylak" <anoo@linux.ibm.com>
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH qemu] aspeed: Add support for the swift-bmc
 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Adriana Kobylak <anoo@us.ibm.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ooNf5kuOdaHH



On Tue, 4 Jun 2019, at 09:07, Joel Stanley wrote:
> On Mon, 3 Jun 2019 at 19:11, Adriana Kobylak <anoo@linux.ibm.com> wrot=
e:
> >
> > From: Adriana Kobylak <anoo@us.ibm.com>
> >
> > The Swift board is an OpenPOWER system hosting POWER processors.
> > Add support for their BMC including the I2C devices as found on HW.
> >
> > Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >  hw/arm/aspeed.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 33070a6..cd95b3c 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -73,6 +73,9 @@ struct AspeedBoardState {
> >          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                         =
     \
> >          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
> >
> > +/* TODO: Swift hardware value: ? (use romulus definition for now) *=
/
> > +#define SWIFT_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>=20
> I got this from hardware: 0xF11AD206

There are two differences from the value noted in the comment below:

1. Bit 4 is clear in your value
2. Bit 20 is set in your value

Bit 4 is reserved, so not sure if we should care about the difference.

Bit 20 is the SuperIO decode disable bit. I don't think we care much
about it at the moment, but we may as we model more of the LPC
interface in the future.

Andrew

>=20
> The rest looks okay.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20
> > +
> >  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definiti=
on) */
> >  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> >
> > @@ -287,6 +290,35 @@ static void romulus_bmc_i2c_init(AspeedBoardSta=
te *bmc)
> >      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds=
1338", 0x32);
> >  }
> >
> > +static void swift_bmc_i2c_init(AspeedBoardState *bmc)
> > +{
> > +    AspeedSoCState *soc =3D &bmc->soc;
> > +
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca=
9552", 0x60);
> > +
> > +    /* The swift board expects a TMP275 but a TMP105 is compatible =
*/
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp=
105", 0x48);
> > +    /* The swift board expects a pca9551 but a pca9552 is compatibl=
e */
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "pca=
9552", 0x60);
> > +
> > +    /* The swift board expects an Epson RX8900 RTC but a ds1338 is =
compatible */
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "ds1=
338", 0x32);
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca=
9552", 0x60);
> > +
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp=
423", 0x4c);
> > +    /* The swift board expects a pca9539 but a pca9552 is compatibl=
e */
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "pca=
9552", 0x74);
> > +
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "tm=
p423", 0x4c);
> > +    /* The swift board expects a pca9539 but a pca9552 is compatibl=
e */
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "pc=
a9552",
> > +                     0x74);
> > +
> > +    /* The swift board expects a TMP275 but a TMP105 is compatible =
*/
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tm=
p105", 0x48);
> > +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tm=
p105", 0x4a);
> > +}
> > +
> >  static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
> >  {
> >      AspeedSoCState *soc =3D &bmc->soc;
> > @@ -378,6 +410,16 @@ static const AspeedBoardConfig aspeed_boards[] =
=3D {
> >          .i2c_init  =3D romulus_bmc_i2c_init,
> >          .ram       =3D 512 * MiB,
> >      }, {
> > +        .name      =3D MACHINE_TYPE_NAME("swift-bmc"),
> > +        .desc      =3D "OpenPOWER Swift BMC (ARM1176)",
> > +        .soc_name  =3D "ast2500-a1",
> > +        .hw_strap1 =3D SWIFT_BMC_HW_STRAP1,
> > +        .fmc_model =3D "mx66l1g45g",
> > +        .spi_model =3D "mx66l1g45g",
> > +        .num_cs    =3D 2,
> > +        .i2c_init  =3D swift_bmc_i2c_init,
> > +        .ram       =3D 512 * MiB,
> > +    }, {
> >          .name      =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
> >          .desc      =3D "OpenPOWER Witherspoon BMC (ARM1176)",
> >          .soc_name  =3D "ast2500-a1",
> > --
> > 1.8.3.1
> >
>
