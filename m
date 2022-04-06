Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp556463lfu;
        Wed, 6 Apr 2022 02:20:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3rR+hdHc+wDasiJN5+zCe9wCeeydcnUJKdt4//mqaqcF5XMpMUmp/1g4TC67MxOPs1fPW
X-Received: by 2002:a05:620a:2546:b0:680:f744:5bc6 with SMTP id s6-20020a05620a254600b00680f7445bc6mr4941650qko.113.1649236800129;
        Wed, 06 Apr 2022 02:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649236800; cv=none;
        d=google.com; s=arc-20160816;
        b=AmfSFuX2QevXLm8ISrZQ/NPedRGlaJexrkBL1w+p5YFcKjYIAxBemYEcNKB84dRJMR
         1Tl9uvSlMGR8S8cPCH6U46QsIM3Z92mYoHspI67oioeaNaXZm2ERCaSjpRXPMSWh+eGh
         5/GQMzCaKY0mDsDlK1Sv/b8pyp7Y4kXQ7m3GClp9iVJRBzjOeavGmiiQ34jcyvJ1hrf0
         TUirZtwVfYuPyvydt/w3czKc9hn3i2C4vZB+YAZfNIWDeMrlYMUuUUsZoV9vcVV7zabq
         WizRl/If5iBaVkiAT7hx3Xvbb/2abaQa6Dep6Kdd2z6t8ryTTY4/LzkVKVHd1v5sbtkn
         Iumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature:dkim-signature;
        bh=0rhnWhZvlCyKFXPoAueWYmgpn6+UwtHn8IVmU6Ep8JY=;
        b=QAIENRWq8gLDkYkVyAey13XGNOB3wo8XCRsxJNCwStu1KM4snaNowSlHlCx8nKHbMN
         Vtt06hymQoeb1bHP83khv/BIiDw7C/fwxBWJr9IgbcyJq0Z/SaxGK03jgDDybzF9ggRW
         AAucLbS7hItYitOGKMsmQohbhsGkCTnLqZPWbnT+qxjtqwuPrcya6wx14wg+GvxtlmCQ
         LL5ySvFWlRu1y2EoDcgAiVEdDo0AAclCiLlwDzZCracIfKypZK7G6lqYPZF/Tfg06JHI
         quqYkbTlUe+4jtAG+5w6x11/jMXG3WxRgOAWmN3SmIpEzpdM3cT7TP5SiSYbftr6efsU
         4zVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=Zrqh1Bvc;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=ofPr3azA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a0562141bce00b00443d25bda82si4940631qvc.63.2022.04.06.02.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 02:20:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=Zrqh1Bvc;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=ofPr3azA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc1pW-000872-P8
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 05:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nc1mA-00085I-C6; Wed, 06 Apr 2022 05:16:31 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:45469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nc1m7-0007TP-S3; Wed, 06 Apr 2022 05:16:30 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2C13B3201FDE;
 Wed,  6 Apr 2022 05:16:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 06 Apr 2022 05:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=0rhnWhZvlCyKFXPoAueWYmgpn6+Uwt
 Hn8IVmU6Ep8JY=; b=Zrqh1BvcAg2zoSvaUea3poLRzHSDizjTonEZgoIoyKWgs6
 qpUOujvKn+zd54UoNc9/pgjakX8S/KAXtCEkpcY6oKqAg0/oE+/DN2kC7yWH04wp
 iTl7Bx8e2qlgMa875eNft5z+njLqinQcT3T202zH62e9rhj2qVjCj2uGfnQTe6dB
 Qq1FF1EnQbPkvxCY8QtdVQdcOZflXzrLNFrAGND4eEmv2tJ1orZOFy3tGbpIQQR0
 4zxO8q6/ImJAMZy0HvfbRA+i7BEmh+4vZszdKbu8vGC58+vyaN8tDmY3CkPo9bs+
 tjSG+btGfbDa6W1vkN/AvwXxvFuueZm0jOXPcxsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0rhnWhZvlCyKFXPoA
 ueWYmgpn6+UwtHn8IVmU6Ep8JY=; b=ofPr3azAmKh/TKGZSv3soeKRGKEHK2hcQ
 PsKZy7h12d6biC5PzJckO2UehVlcqX+s6Nodx1EP+WQ2CSnv6/dr34QhcrT9DXXU
 xgSUuE50asCmwCfV/BZJhXfyr9dcv4KU2K3clZx1y3Vb+WXiO2rcRZBL2gJgdrDt
 k+TIkd4XB7l27ryd6pBwy46dQ1tl0G+dk3AoBJQClx5iwKGurBZRwwkq/IMnKZdW
 qgGmdC9iIhu4Yb8loTtud5cWvbmjFqwq+04KwtbH3biOAj4QyqhkWVaj8b/SaiEw
 AFepnw5mBLKgJJ4NMxrZoe0b4IbyAZWmLw3HX3lTblHE7oaQv02Mg==
X-ME-Sender: <xms:ZlpNYgAGMf2TCAU1wkVG-3p3bd0pSWnbe-YOq9uSEd8uKmoQGshpgg>
 <xme:ZlpNYiiqOan6hWB61ESQ4PJAs6kbuaiKRG1HT-8ksN7J8NyMsUEtCokUFRA-kr5oZ
 rh_vVoprpmAFcPdJYo>
X-ME-Received: <xmr:ZlpNYjm7rWCW_qCG4PeO27HbGgoR5YV2aMjy4tmo0RkAzQ1Cp8GioFNCVylZYPqGJDIEofDjsULHQyWVJ_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ZlpNYmxZnYtd0r2a_wnTdxzCTDXn_AmPx0qnG_X8hAt7lcwb8J5v1A>
 <xmx:ZlpNYlTfKSSB0B08MsUyl3ZqFViNnKC3uxM8JBLCNTov_gOmlJCXRg>
 <xmx:ZlpNYhYr0D4O2s3lCh2K0KesRUO4fZM3b8spE1xgoSWeTqCly8ODOA>
 <xmx:Z1pNYlYvv5dI6Zu-HGBqafARIPzOtPv29s-eeXs1fsSIghvkEpsFEA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 05:16:20 -0400 (EDT)
Date: Wed, 6 Apr 2022 11:16:18 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [RFC PATCH 3/4] hw/i2c: add slave mode for aspeed_i2c
Message-ID: <Yk1aYldO+VjF3iqB@apples>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331165737.1073520-4-its@irrelevant.dk>
 <356b3f59-b915-3da1-7155-8082b55932fb@kaod.org>
 <Yk1EAHE2dUv7Z6gq@apples>
 <f669416c-6e17-23c0-3dfa-dd6cceebc05b@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wsZtJCzdZ0hVXHxY"
Content-Disposition: inline
In-Reply-To: <f669416c-6e17-23c0-3dfa-dd6cceebc05b@kaod.org>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jeremy Kerr <jk@ozlabs.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p3AayjSvmUwJ


--wsZtJCzdZ0hVXHxY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  6 10:52, C=C3=A9dric Le Goater wrote:
> On 4/6/22 09:40, Klaus Jensen wrote:
> > On Apr  6 08:14, C=C3=A9dric Le Goater wrote:
> > > Hello Klaus,
> > >=20
> > > On 3/31/22 18:57, Klaus Jensen wrote:
> > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > >=20
> > > > Add slave mode functionality for the Aspeed I2C controller. This is
> > > > implemented by creating an Aspeed I2C Slave device that attaches to=
 the
> > > > bus.
> > > >=20
> > > > This i2c slave device only implements the asynchronous version of
> > > > i2c_send() and the event callback.
> > > >=20
> > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > > ---
> > > >    hw/i2c/aspeed_i2c.c         | 95 +++++++++++++++++++++++++++++++=
++----
> > > >    hw/i2c/trace-events         |  2 +-
> > > >    hw/misc/meson.build         |  2 +
> > > >    include/hw/i2c/aspeed_i2c.h |  8 ++++
> > > >    4 files changed, 97 insertions(+), 10 deletions(-)
> > > >=20
> > > > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > > > index 03a4f5a91010..61b6424434f7 100644
> > > > --- a/hw/i2c/aspeed_i2c.c
> > > > +++ b/hw/i2c/aspeed_i2c.c
> > > > @@ -163,10 +163,15 @@ static inline void aspeed_i2c_bus_raise_inter=
rupt(AspeedI2CBus *bus)
> > > >              bus->intr_status & I2CD_INTR_TX_NAK ? "nak|" : "",
> > > >              bus->intr_status & I2CD_INTR_TX_ACK ? "ack|" : "",
> > > >              bus->intr_status & I2CD_INTR_RX_DONE ? "done|" : "",
> > > > +          bus->intr_status & I2CD_INTR_SLAVE_ADDR_RX_MATCH ? "slav=
e-match|" : "",
> > > >              bus->intr_status & I2CD_INTR_NORMAL_STOP ? "normal|" :=
 "",
> > > >              bus->intr_status & I2CD_INTR_ABNORMAL ? "abnormal" : "=
");
> > >=20
> > > Troy introduced a similar change in his "new mode" proposal. I think
> > > it is time to change the 'aspeed_i2c_bus_raise_interrupt' trace event
> > >=20
> > > Could you please update trace_aspeed_i2c_bus_raise_interrupt() to take
> > > a single status string ?
> > >=20
> >=20
> > I'm not sure it will be "prettier". But I'll give it a shot.
>=20
> It will be easier to extend. We have 3 different patchsets modifying this
> same event on the mailing list :)
>=20

True :)

> > > > -    bus->intr_status &=3D bus->intr_ctrl;
> > > > +    /*
> > > > +     * WORKAROUND: the Linux Aspeed I2C driver masks SLAVE_ADDR_RX=
_MATCH for
> > > > +     * some reason, not sure if it is a bug...
> > > > +     */
> > > > +    bus->intr_status &=3D (bus->intr_ctrl | I2CD_INTR_SLAVE_ADDR_R=
X_MATCH);
> > >=20
> > > It comes from the initial support for the AST2400 SoC.
> > >=20
> > > We should introduce a 'intr_ctrl_mask' attribute in AspeedI2CClass and
> > > fix the AST24000 value to 0x7FFF ...
> > >=20
> >=20
> > I'm not sure I understand. Do you suggest that we always use a fixed
> > mask here and disregard what the host sets in intr_ctrl?
>=20
> No. sorry. There are multiple fixes required I think.
>=20
> The layout of the Interrupt Control Register (0x0C) differs on the
> AST2400, AST2500, AST2600 SoCs. We need to clarify that first.
> bits 11:7 and 31:16 are reserved on all. AST2400 lacks bit 15 which
> enables a slave timeout interrupt on AST2500 and AST2600.
>=20
> Then, the Interrupt Status Register differs also. The AST2400 doesn't
> have the Slave Address match indicator and the Slave Address Receiving
> pending bits. On the AST2600, there are 3 possibles addresses, only
> 2 on the AST2500 (and only 1 on the AST2400). So that modifies the
> I2CD_INTR_SLAVE_ADDR_RX_MATCH bit.
>=20

Ugh. I'm heavily burden by the fact that I do not have a spec sheet
available... I'll try to request one from Aspeed. I reversed this from
the Linux driver, so I'm just tried to match up with how that behaves.

With Slave Address Match indicator, you mean bit 31? There is only one
bit, so how does it work with the third address?

> Since these 2 or 3 bits are read-only. I wonder how this is impacting
> your slave implementation. is it ? If not, may be slave address match can
> wait for now.

As far as I can tell, the kernel driver uses bit 7 (called
SLAVE_ADDR_RX_MATCH in QEMU and SLAVE_MATCH in Linux) to start the slave
state machinery. It does not use bit 31 (SLAVE_ADDR_MATCH in QEMU). The
naming for bit 7 in Linux is probably off and should be ranamed to match
QEMU?

I understand that this shouldn't assume to only work with the slave
machinery in Linux, but that is the only platfrom I can currently
experiment with.

> > In any case, isn't it a bug in the Linux kernel driver that it neglects
> > to set bit 7 (slave match) in the INTR_CTRL register?>
> >=20
> > > >        if (bus->intr_status) {
> > > >            bus->controller->intr_status |=3D 1 << bus->id;
> > > >            qemu_irq_raise(aic->bus_get_irq(bus));
> > > > @@ -196,6 +201,9 @@ static uint64_t aspeed_i2c_bus_read(void *opaqu=
e, hwaddr offset,
> > > >        case I2CD_INTR_STS_REG:
> > > >            value =3D bus->intr_status;
> > > >            break;
> > > > +    case I2CD_DEV_ADDR_REG:
> > > > +        value =3D bus->dev_addr;
> > > > +        break;
> > >=20
> > > You can introduce support for this register in a preliminary patch but
> > > keep the slave activation for later (I2CD_SLAVE_EN bit)
> > >=20
> >=20
> > Understood.
>=20
> thanks, we will address the full layout of this register later when neede=
d.
> But there are fields for each address.
>

Right. Again, I just reversed from the kernel driver and it only sets
the lower byte.

--wsZtJCzdZ0hVXHxY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJNWmEACgkQTeGvMW1P
DekH7Af/TimtSR/BuIVr9SmQPSWIXQ4NjdzzLPaDsgaX3LAmRRNMZA7+GWAHgHoQ
PIbG6ZV9Sz9o++uFc8yB3PscUs9CI6lbOyKGREMXbjzre4gB2XwdZGfL17dx1nQG
CJtsswY4rL1RZmN1A5+1PxFhJt9BqfpTGREsWrbCtyXLwqQQ7Kt/sWMw86ipz0Dj
SppGUGZs0z50miS4H2b1I3AFBhw1gkCBT6hYWJK08Kk25hrma9l3if2sKp1+BjWj
gHCm7i24yS1xrQ91997myYC7Ci//PfxyQ9DmpdFmSXYSxzFu0oyBb+LAkPm05MfO
TV3yRQk1uoIlEQnqc4pt3CMgeTm5rg==
=rjGK
-----END PGP SIGNATURE-----

--wsZtJCzdZ0hVXHxY--
