Received: by 2002:a17:906:f150:b0:9a1:ac8c:26bb with SMTP id gw16csp427878ejb;
        Wed, 23 Aug 2023 00:15:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb7uhsLgUU40VzCNPN6c3xTwOUj6gdUv5TH4zvTtXNI6mCDtKD7adjcTQeR2i7xxa0J4BS
X-Received: by 2002:a05:620a:e9e:b0:76c:97b1:33b5 with SMTP id w30-20020a05620a0e9e00b0076c97b133b5mr11268993qkm.12.1692774937803;
        Wed, 23 Aug 2023 00:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692774937; cv=none;
        d=google.com; s=arc-20160816;
        b=WX/mFmJ60S4i2q0NzcNIeqv7UfHiXVCXvdFLGifJ6dEsYTh0RW7e1NwAcWfycpuIhU
         9Ax1ScyqfUdZbgj372tf5X4ujDn7t//mVnETBzXBCIhV9fq72bBe/7xRaAxn2yA9/Kvc
         ZrC35Cl2G4VrTaQNDBRIIG/CMOOJaZCF9n0qeqqHDcV6RMmh0sBmkrRo1vSGHULXKzhf
         O5X8Jx1a3a93jf/hMReCENXwpCPEIcrILikkyklEDwWPWszsmj8LQROH8qFQQSth1ZBl
         LWbW/7UXBWOcVwhDJzWIU6vP8Km7pSTp91V/VL8qeKy3dt2KOugYVj8iDuTMA2HQ6gQt
         43JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=tDaXdUCcLgRpubr3uxxX1TmP+7guwXxhEyD9EcHjBEM=;
        fh=leEBPqGN4cLUpNHWML80eW6Azw1r4XohmF8HkKmGwOA=;
        b=GmmDdGjNYW8ZXCt2w0DBUGu5vlGBl7TEfUv4+SizLYPLJfa/rZa3ZXc+b69TUAuwhC
         jtX7Mi0PKBbrT/X2+ANP1uiIb38jGDhmuZp+MK/m21Dj3HIfMArnad9KHUgXsYuuk0Kx
         JaLqn9+gJINcQCnmvosJ1nWQBXqaybGfLBSG33zUDHA/wb8YCeBuVEhp0si/ASCR8rPF
         H/Q76vPTzDCZdbuBc7cRhzb2RboHhQWj7vIBBjDTA0CZp3ll5DlOCf8yvEHYF/4peexz
         Hc41uiNWN7pM/Xb8aTRL2Z/4rg1rnjvjCaBgSzIt1baKibH4Bdrj62ZfYxWrbKspo/SO
         Zj5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=RukyjHuv;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=fnEQrNLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a05620a404600b0076d9bf2f1e8si5297030qko.401.2023.08.23.00.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Aug 2023 00:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=RukyjHuv;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=fnEQrNLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYi57-0001do-6F; Wed, 23 Aug 2023 03:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1qYi51-0001dW-8r; Wed, 23 Aug 2023 03:15:04 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1qYi4w-0005B2-T8; Wed, 23 Aug 2023 03:15:02 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D0925C00AE;
 Wed, 23 Aug 2023 03:14:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 23 Aug 2023 03:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1692774894; x=
 1692861294; bh=tDaXdUCcLgRpubr3uxxX1TmP+7guwXxhEyD9EcHjBEM=; b=R
 ukyjHuvReQKmsyfr8NbUqY7VFAq0Xu8HPd7OiUlIQa8k5ctqwb0YUhA2gvOgXKbW
 eaTxfABMslIt7t9aQ790eRM+KzAvIg51+YEVqXmmv3SEBa0lqeMPDxMHxHdcZx1l
 Ewek1BBXh0X6W4bVbZJckjunCmdaomYLW124m+gMNBbDRY9F53SvNLg47vsKNKcP
 cpdqgCXpXTUO2v/9FNauyeJDoVFlgneUXrlFPz1yd3x52tDi823TysHfpsuq0Vh8
 /GBj1AlvPgXF5lrEPSG+dDD8yOR1ZvD9GZkFOxSTm3StlogjBL6qgIOa4BUn+9mx
 b20WhjeMtr1nMtimaHYIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1692774894; x=1692861294; bh=tDaXdUCcLgRpu
 br3uxxX1TmP+7guwXxhEyD9EcHjBEM=; b=fnEQrNLz1tIY4ZXJZu70+33fYAyKa
 h/Cpznk7VmCUiYewQh/Z3ws85RBpVSwc2nc9Yezgcmxi3L/CGynNF69BJqZzB7aV
 cnBXLBuh5PuPu5aoqo2e5kKQ781R8lf7A9GlsMrYjmxJpOKocY/qL2UvCxkAyfMV
 mhyOgC2EhVEYDZJM3O2H+RcdhvAS8q7S/tIp0/Ms8K+dnP6EX+Ptgn+I9iZQftfm
 v4pdpdxVgAwsvjDlSljyLxa13S8+rtvzNa0tHcT/AcEa9cG5ySPWRO3AKxZpEf2V
 e+Ih8ujstiTJ1gQjBuddwhb4mCEWMbph1iKwkGgKzi2r/R1tEGwc5CTVA==
X-ME-Sender: <xms:7bHlZG005vOQJeEM_z6IoU3kVF7O7dSDiWN9OvROQWaoUaL6-Eqxqg>
 <xme:7bHlZJFckM77U1nJYBIyyg97MgQahiCqrXQy5wRxrE8yb4RsthUNBfTels9TmmwXU
 --Wp47GHhzHwU1dYu0>
X-ME-Received: <xmr:7bHlZO4HrrF7cOigxp2QzOWtqJ2yJfZp1WaGuaNJZeUXXeRnabGStag9Xjn2c2EY0eRSrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvfedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepffduvdfhheejudfgieejueeileegveduvdelhfekhffgteetffdtvdekveei
 leefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7bHlZH2ghPrS-aLk5TxEH5VIWsysW6Mb5BoZE-UeyhhDQZeZGRLXRQ>
 <xmx:7bHlZJFnKGgomm4YpZ9cYpW8zIwMxue2BPldrKTID13xwq03wqYDzQ>
 <xmx:7bHlZA_70l7u5SdgWZ7y2RSy8-lZkWThg5paAf1mGs1twnJ5HUPWzQ>
 <xmx:7rHlZPbHxoimGdg4StwkHETFC1_oBTJwCARV-HEEUB7EkzYws3Tpvw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Aug 2023 03:14:51 -0400 (EDT)
Date: Wed, 23 Aug 2023 09:14:49 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 03/11] hw/misc: add a toy i2c echo device
Message-ID: <ZOWx6ZovM4Z-eKDX@cormorant.local>
References: <20230301165619.2171090-1-clg@kaod.org>
 <20230301165619.2171090-4-clg@kaod.org>
 <ad8588fd-7839-2fdc-45c7-bb2b5917ea65@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UpGtQ6tHXiiGzhRN"
Content-Disposition: inline
In-Reply-To: <ad8588fd-7839-2fdc-45c7-bb2b5917ea65@redhat.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pySn5fHKMxtO


--UpGtQ6tHXiiGzhRN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 22 19:20, Thomas Huth wrote:
> On 01/03/2023 17.56, C=C3=A9dric Le Goater wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add an example I2C device to demonstrate how a slave may master the bus
> > and send data asynchronously to another slave.
> >=20
> > The device will echo whatever it is sent to the device identified by the
> > first byte received.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > [ clg: integrated fixes :
> >    https://lore.kernel.org/qemu-devel/Y3yMKAhOkYGtnkOp@cormorant.local/=
 ]
> > Message-Id: <20220601210831.67259-7-its@irrelevant.dk>
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >   hw/misc/i2c-echo.c  | 156 ++++++++++++++++++++++++++++++++++++++++++++
> >   hw/misc/meson.build |   2 +
> >   2 files changed, 158 insertions(+)
> >   create mode 100644 hw/misc/i2c-echo.c
> >=20
> > diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
> > new file mode 100644
> > index 0000000000..5705ab5d73
> > --- /dev/null
> > +++ b/hw/misc/i2c-echo.c
> > @@ -0,0 +1,156 @@
> > +#include "qemu/osdep.h"
> > +#include "qemu/timer.h"
> > +#include "qemu/main-loop.h"
> > +#include "block/aio.h"
> > +#include "hw/i2c/i2c.h"
>=20
>  Hi Klaus,
>=20
> I've got two questions with regards to this new devices:
>=20
> 1) The file lacks a license statement (and a short comment at the beginni=
ng
> what it is all about). Could you maybe provide a follow up patch with a
> proper header comment that includes a license and a short description abo=
ut
> the device?
>=20
> 2) Why is it in hw/misc/ and not in hw/i2c/ ?
>=20
> I think we should also have a proper Kconfig switch for this device, so we
> can disable it with --without-default-devices, what do you think?
>=20
>  Thomas
>=20
>=20

Hi Thomas,

1) My apologies, I'll add the proper GPL license comment.

2) It's an example of using the asynchronous i2c send API. It's not a
"real" device, its more like the edu-device. A proper note in the file
should make this clear.

I'll send a patch to fix this up!


Thanks,
Klaus

--UpGtQ6tHXiiGzhRN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmTlsekACgkQTeGvMW1P
Demjxgf9FejbyVZz9B1CupYMsWsXsGyxGa/oe5f14yY3GnSb58G5KagZttYGKBa1
U8ulqXKgLcou/1AWVynukCqu18VA0MvmS6nQFYHt06Lz6zuRWYYQhaHWQtlsAW+G
63wUp5ba2N1XdhltjpDbndbDh9OSSAwdIoH+YW1kPy/VUbqP39fBOm296ZxLh6yA
sC8zjHdsJcpolIaphuiYFhBOO22MXtNUj2+OSYiuvcgeBLBTpuS5xoWNOvn8DbFg
/qNy8hf2Jrfhfh1U8Kuw1P+JVqo3DVQWI4v1ihbkq50Q0y5piDROSKeY9Ja+Kl7B
+fYYqgxNI1o4PQ68OV/WidUYWKBTLw==
=uisn
-----END PGP SIGNATURE-----

--UpGtQ6tHXiiGzhRN--
