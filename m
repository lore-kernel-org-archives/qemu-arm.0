Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp515454lfu;
        Wed, 6 Apr 2022 00:44:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjMA/SAwnMNzuWcZsX3QKKbtSShQgP2GVe0xlQFYmbvak6O2m5Y4Z7VmIOLVN1fDvht49R
X-Received: by 2002:a05:622a:13cf:b0:2e2:3535:56ae with SMTP id p15-20020a05622a13cf00b002e2353556aemr6332770qtk.373.1649231051276;
        Wed, 06 Apr 2022 00:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649231051; cv=none;
        d=google.com; s=arc-20160816;
        b=z30PLAACiC64YWaveRGrYGvKA/U3fQeLW9gS5UNnMgQbCF0cza1qR+3zyoBBP9O0cT
         BFpQpHoTxMhunQ2naLDMCBX5FaJNZxEfXi9QLVe47tTo/1zRD2M9aBobBJsQJkQsg8dL
         knoDeWvV6by5ZeeHCWcXr5qZANnbRAf1q8tgJdfzrdk1lj6/BN2ga3eAypS78NCoAKe6
         0BEOy+XND4G+K5uBam1IZQBxHRKpAvFnXMNwjHahzk+Iqsh7IOFmLkJGHtTX5PssvSoo
         HpNfPCGhcj3JOdFrPzQTWKwz9t3ikMiWNocZiMQQpuVyd9ucl3kCYUZb/JHWZtBpjcgh
         5DdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature:dkim-signature;
        bh=RDjM9kb/tfC8rqBb1FXadMlfJwCHB77CYQ4rBKQCzds=;
        b=JGH/36Ybw/nAO56c2tKL3hvebUWsNHkfPpn9v8MGhtK42P+B9HDqfUh1Jx0cQk4hl1
         h/u2K4OURsZsWUqdCgcAse9/4nhw5WE8gLr2ED/X4EbFUxKjCtr4ZuZNEGwPOLpr+2fK
         zMQxSUuVDEU78pCFoUlDh++0Nq+E9ogA6TfzWu2ZX1wP/fd0kWb5ulMmez0ElMhW0zIa
         GakTvW22FeZSPN+TKXuxgOnz5KS05taoxE8jtltODEztlU9BlGpgjzQi6EbnuYH5cIWy
         KPLbdRiS8ClA16dpHloaueAc7UE2kAyyiHQf3GJTnWIUgQ73cE/0PbBmc9HH64qgORTr
         qeDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=Wxex6PUC;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Hjnu3kWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a056214108900b00443cf6ba535si3599350qvr.118.2022.04.06.00.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 00:44:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=Wxex6PUC;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Hjnu3kWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc0Kn-0005ol-WD
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 03:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nc0Hk-0005oK-3L; Wed, 06 Apr 2022 03:41:00 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:59865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nc0Hg-000604-KO; Wed, 06 Apr 2022 03:40:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CF5C932009BB;
 Wed,  6 Apr 2022 03:40:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 06 Apr 2022 03:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=RDjM9kb/tfC8rqBb1FXadMlfJwCHB7
 7CYQ4rBKQCzds=; b=Wxex6PUCDaVZ9wBlchQLtDJOSwQdPAMt487GoHa0uF6LZg
 g61mdoV4ZP6KyFvcu3zTo8KFNL9a5NvJ6EHYbYjYwbNZyEYm4Ha+eQwEezQluM/n
 KexO+AiccTgdVfghUZxusAYE/uNIs9xPWiqOkNmF92vI10aTZbxb5a4LHZz/d/CK
 9ovpbgj8o+Mn5Kb5CiTLBOuvCZxD3waAxfrzx7W+Nha2hLFY69nANCalG9AXws9T
 uHYMKE3t1tMgh/JNWCnt2WS9LqBYi41VzKpzsqJk1rq+Ag/7duhYbMUOVqz+Hqt5
 ntaFbC8SYgE6eQxJj1LeXSEuj8PqC0YAgwhRlzHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RDjM9kb/tfC8rqBb1
 FXadMlfJwCHB77CYQ4rBKQCzds=; b=Hjnu3kWol3K9g0eJG2gU4h0I29Ml/KszF
 z+aYw9y+2mCSWbUymW2uygUMU4inH+vE+rySllUMrCgghMk0GszWmhkGocXPlX6E
 Mn+6AF41rHpv4yEPQL3gPvCzAu2Z5r7/FYR7/mNaawxnJbTVmERjzw3ONZ9nYxF9
 +kebHO/BAo1VhDrckEl8jDALALTvsLWRX3YxWjMBGQ4hvCSDcPWT4vKl1yM7pEIj
 MnV7KOgcNfi9QrE9ZBD6GzNPHHDCGE0PRTnPRorj2l+DP2r3Dpgh+YxDBd64ShiF
 rb67dtEn03cObS/myQpmInQN2oLKCiv3ZKEAPJIJtHyzDv/OPS0jg==
X-ME-Sender: <xms:A0RNYhkcjN5JHiaa4voIwwupqOKDeza_kzXcRTOw37vWqddvRi5g0g>
 <xme:A0RNYs2I6H88_VsWrQEj9I6MDjqdnLAc0JLgwm1miBY4XiJC-8fIMlAjSXwMYHg6V
 P2MNiX8sUOyhKuIr3g>
X-ME-Received: <xmr:A0RNYnrFRjsoY8-1W3M-x92h3xGIAcf4_LAGWe6N2OMEv-nqWkxKXi4RdAM8ssx_9aXrBW055tppMSraLnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejhedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:A0RNYhkd6e9gT6yVHMVWODKQyzX2i_8yNLpYbsi3mfNtFNdH-XiwdQ>
 <xmx:A0RNYv2dtVP5y4SgSuBvsQ-ZeXdBflYDc4epw9Nz5qG4EDvptUOsvw>
 <xmx:A0RNYgsvaFzdN04KvoG2Tf6tCHlbbYgL8xGIL8E7YLqYtL3NELt-yQ>
 <xmx:BERNYosaZPYm8pwoNVyhQ63_Zwv2TcnsEbcyG_JWxA0qn-04cbq6KA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 03:40:50 -0400 (EDT)
Date: Wed, 6 Apr 2022 09:40:48 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [RFC PATCH 3/4] hw/i2c: add slave mode for aspeed_i2c
Message-ID: <Yk1EAHE2dUv7Z6gq@apples>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331165737.1073520-4-its@irrelevant.dk>
 <356b3f59-b915-3da1-7155-8082b55932fb@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C4MvQVs8vjVFPZyl"
Content-Disposition: inline
In-Reply-To: <356b3f59-b915-3da1-7155-8082b55932fb@kaod.org>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
X-TUID: wsbUIgWYGlcS


--C4MvQVs8vjVFPZyl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  6 08:14, C=C3=A9dric Le Goater wrote:
> Hello Klaus,
>=20
> On 3/31/22 18:57, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add slave mode functionality for the Aspeed I2C controller. This is
> > implemented by creating an Aspeed I2C Slave device that attaches to the
> > bus.
> >=20
> > This i2c slave device only implements the asynchronous version of
> > i2c_send() and the event callback.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/i2c/aspeed_i2c.c         | 95 +++++++++++++++++++++++++++++++++----
> >   hw/i2c/trace-events         |  2 +-
> >   hw/misc/meson.build         |  2 +
> >   include/hw/i2c/aspeed_i2c.h |  8 ++++
> >   4 files changed, 97 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > index 03a4f5a91010..61b6424434f7 100644
> > --- a/hw/i2c/aspeed_i2c.c
> > +++ b/hw/i2c/aspeed_i2c.c
> > @@ -163,10 +163,15 @@ static inline void aspeed_i2c_bus_raise_interrupt=
(AspeedI2CBus *bus)
> >             bus->intr_status & I2CD_INTR_TX_NAK ? "nak|" : "",
> >             bus->intr_status & I2CD_INTR_TX_ACK ? "ack|" : "",
> >             bus->intr_status & I2CD_INTR_RX_DONE ? "done|" : "",
> > +          bus->intr_status & I2CD_INTR_SLAVE_ADDR_RX_MATCH ? "slave-ma=
tch|" : "",
> >             bus->intr_status & I2CD_INTR_NORMAL_STOP ? "normal|" : "",
> >             bus->intr_status & I2CD_INTR_ABNORMAL ? "abnormal" : "");
>=20
> Troy introduced a similar change in his "new mode" proposal. I think
> it is time to change the 'aspeed_i2c_bus_raise_interrupt' trace event
>=20
> Could you please update trace_aspeed_i2c_bus_raise_interrupt() to take
> a single status string ?
>=20

I'm not sure it will be "prettier". But I'll give it a shot.

> > -    bus->intr_status &=3D bus->intr_ctrl;
> > +    /*
> > +     * WORKAROUND: the Linux Aspeed I2C driver masks SLAVE_ADDR_RX_MAT=
CH for
> > +     * some reason, not sure if it is a bug...
> > +     */
> > +    bus->intr_status &=3D (bus->intr_ctrl | I2CD_INTR_SLAVE_ADDR_RX_MA=
TCH);
>=20
> It comes from the initial support for the AST2400 SoC.
>=20
> We should introduce a 'intr_ctrl_mask' attribute in AspeedI2CClass and
> fix the AST24000 value to 0x7FFF ...
>=20

I'm not sure I understand. Do you suggest that we always use a fixed
mask here and disregard what the host sets in intr_ctrl?

In any case, isn't it a bug in the Linux kernel driver that it neglects
to set bit 7 (slave match) in the INTR_CTRL register?

> >       if (bus->intr_status) {
> >           bus->controller->intr_status |=3D 1 << bus->id;
> >           qemu_irq_raise(aic->bus_get_irq(bus));
> > @@ -196,6 +201,9 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, h=
waddr offset,
> >       case I2CD_INTR_STS_REG:
> >           value =3D bus->intr_status;
> >           break;
> > +    case I2CD_DEV_ADDR_REG:
> > +        value =3D bus->dev_addr;
> > +        break;
>=20
> You can introduce support for this register in a preliminary patch but
> keep the slave activation for later (I2CD_SLAVE_EN bit)
>=20

Understood.

> >       case I2CD_POOL_CTRL_REG:
> >           value =3D bus->pool_ctrl;
> >           break;
> > @@ -535,10 +543,9 @@ static void aspeed_i2c_bus_write(void *opaque, hwa=
ddr offset,
> >       switch (offset) {
> >       case I2CD_FUN_CTRL_REG:
> >           if (value & I2CD_SLAVE_EN) {
> > -            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n=
",
> > -                          __func__);
> > -            break;
> > +            i2c_slave_set_address(&bus->slave->i2c, bus->dev_addr);
> >           }
> > +
> >           bus->ctrl =3D value & 0x0071C3FF;
> >           break;
> >       case I2CD_AC_TIMING_REG1:
> > @@ -558,14 +565,19 @@ static void aspeed_i2c_bus_write(void *opaque, hw=
addr offset,
> >               bus->controller->intr_status &=3D ~(1 << bus->id);
> >               qemu_irq_lower(aic->bus_get_irq(bus));
> >           }
> > -        if (handle_rx && (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_=
LAST))) {
> > -            aspeed_i2c_handle_rx_cmd(bus);
> > -            aspeed_i2c_bus_raise_interrupt(bus);
> > +
> > +        if (handle_rx) {
> > +            if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
> > +                aspeed_i2c_handle_rx_cmd(bus);
> > +                aspeed_i2c_bus_raise_interrupt(bus);
> > +            } else if (aspeed_i2c_get_state(bus) =3D=3D I2CD_STXD) {
> > +                i2c_ack(bus->bus);
> > +            }
> >           }
> > +
> >=20
> >           break;
> >       case I2CD_DEV_ADDR_REG:
> > -        qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
> > -                      __func__);
> > +        bus->dev_addr =3D value;
> >           break;
> >       case I2CD_POOL_CTRL_REG:
> >           bus->pool_ctrl &=3D ~0xffffff;
> > @@ -852,12 +864,74 @@ static const TypeInfo aspeed_i2c_info =3D {
> >       .abstract   =3D true,
> >   };
> > +static int aspeed_i2c_slave_event(I2CSlave *slave, enum i2c_event even=
t)
> > +{
> > +    AspeedI2CSlave *s =3D ASPEED_I2C_SLAVE(slave);
> > +    AspeedI2CBus *bus =3D s->bus;
> > +
> > +    switch (event) {
> > +    case I2C_START_SEND:
> > +        bus->buf =3D bus->dev_addr << 1;
> > +
> > +        bus->buf &=3D I2CD_BYTE_BUF_RX_MASK;
> > +        bus->buf <<=3D I2CD_BYTE_BUF_RX_SHIFT;
> > +
> > +        bus->intr_status |=3D (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_IN=
TR_RX_DONE);
> > +        aspeed_i2c_set_state(bus, I2CD_STXD);
> > +
> > +        break;
> > +
> > +    case I2C_FINISH:
> > +        bus->intr_status |=3D I2CD_INTR_NORMAL_STOP;
> > +        aspeed_i2c_set_state(bus, I2CD_IDLE);
> > +
> > +        break;
> > +
> > +    default:
> > +        return -1;
> > +    }
> > +
> > +    aspeed_i2c_bus_raise_interrupt(bus);
> > +
> > +    return 0;
> > +}
> > +
> > +static void aspeed_i2c_slave_send_async(I2CSlave *slave, uint8_t data)
> > +{
> > +    AspeedI2CSlave *s =3D ASPEED_I2C_SLAVE(slave);
> > +    AspeedI2CBus *bus =3D s->bus;
> > +
> > +    bus->buf =3D (data & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_SH=
IFT;
> > +    bus->intr_status |=3D I2CD_INTR_RX_DONE;
> > +
> > +    aspeed_i2c_bus_raise_interrupt(bus);
> > +}
> > +
> > +static void aspeed_i2c_slave_class_init(ObjectClass *klass, void *Data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    I2CSlaveClass *sc =3D I2C_SLAVE_CLASS(klass);
> > +
> > +    dc->desc =3D "Aspeed I2C Bus Slave";
> > +
> > +    sc->event =3D aspeed_i2c_slave_event;
> > +    sc->send_async =3D aspeed_i2c_slave_send_async;
> > +}
> > +
> > +static const TypeInfo aspeed_i2c_slave_info =3D {
> > +    .name          =3D TYPE_ASPEED_I2C_SLAVE,
> > +    .parent        =3D TYPE_I2C_SLAVE,
> > +    .instance_size =3D sizeof(AspeedI2CSlave),
> > +    .class_init    =3D aspeed_i2c_slave_class_init,
> > +};
> > +
> >   static void aspeed_i2c_bus_reset(DeviceState *dev)
> >   {
> >       AspeedI2CBus *s =3D ASPEED_I2C_BUS(dev);
> >       s->intr_ctrl =3D 0;
> >       s->intr_status =3D 0;
> > +    s->dev_addr =3D 0;
>=20
> Please include the new reg in vmstate.
>=20

Understood.

> >       s->cmd =3D 0;
> >       s->buf =3D 0;
> >       s->dma_addr =3D 0;
> > @@ -881,6 +955,8 @@ static void aspeed_i2c_bus_realize(DeviceState *dev=
, Error **errp)
> >       sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> >       s->bus =3D i2c_init_bus(dev, name);
> > +    s->slave =3D ASPEED_I2C_SLAVE(i2c_slave_create_simple(s->bus, TYPE=
_ASPEED_I2C_SLAVE, 0xff));
> > +    s->slave->bus =3D s;
> >       memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
> >                             s, name, aic->reg_size);
> > @@ -1016,6 +1092,7 @@ static const TypeInfo aspeed_2600_i2c_info =3D {
> >   static void aspeed_i2c_register_types(void)
> >   {
> >       type_register_static(&aspeed_i2c_bus_info);
> > +    type_register_static(&aspeed_i2c_slave_info);
> >       type_register_static(&aspeed_i2c_info);
> >       type_register_static(&aspeed_2400_i2c_info);
> >       type_register_static(&aspeed_2500_i2c_info);
> > diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> > index 7d8907c1eede..85e4bddff936 100644
> > --- a/hw/i2c/trace-events
> > +++ b/hw/i2c/trace-events
> > @@ -9,7 +9,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%0=
2x) data:0x%02x"
> >   # aspeed_i2c.c
> >   aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t coun=
t, uint32_t intr_status) "handling cmd=3D0x%x %s count=3D%d intr=3D0x%x"
> > -aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1,=
 const char *str2, const char *str3, const char *str4, const char *str5) "h=
andled intr=3D0x%x %s%s%s%s%s"
> > +aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1,=
 const char *str2, const char *str3, const char *str4, const char *str5, co=
nst char *str6) "handled intr=3D0x%x %s%s%s%s%s%s"
> >   aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, u=
int64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
> >   aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, =
uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
> >   aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte)=
 "%s send %d/%d 0x%02x"
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 6fb69612e064..c1c1abea41dd 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -122,6 +122,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: f=
iles('nrf51_rng.c'))
> >   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pn=
p.c'))
> > +softmmu_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))
>=20
> That's for another patch.
>=20

Yeah, was a mistake on my part when chopping up my work.

> > +
> >   specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c=
'))
> >   specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
> > diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> > index 4b9be09274c7..3f1a9c07a00b 100644
> > --- a/include/hw/i2c/aspeed_i2c.h
> > +++ b/include/hw/i2c/aspeed_i2c.h
> > @@ -42,6 +42,7 @@ struct AspeedI2CBus {
> >       SysBusDevice parent_obj;
> >       struct AspeedI2CState *controller;
> > +    struct AspeedI2CSlave *slave;
> >       MemoryRegion mr;
> > @@ -53,6 +54,7 @@ struct AspeedI2CBus {
> >       uint32_t timing[2];
> >       uint32_t intr_ctrl;
> >       uint32_t intr_status;
> > +    uint32_t dev_addr;
> >       uint32_t cmd;
> >       uint32_t buf;
> >       uint32_t pool_ctrl;
> > @@ -76,6 +78,12 @@ struct AspeedI2CState {
> >       AddressSpace dram_as;
> >   };
> > +#define TYPE_ASPEED_I2C_SLAVE "aspeed.i2c.slave"
> > +OBJECT_DECLARE_SIMPLE_TYPE(AspeedI2CSlave, ASPEED_I2C_SLAVE)
> > +struct AspeedI2CSlave {
> > +    I2CSlave i2c;
> > +    AspeedI2CBus *bus;
> > +};
>=20
> AFAICT, AspeedI2CSlave is not that useful since it doesn't maintain any
> state. The QOM interface proposal looks like a better approach.
>=20

Agree.

> >   struct AspeedI2CClass {
> >       SysBusDeviceClass parent_class;
>=20
>=20
> If you could send these 3 patches :
>   - aspeed_i2c_bus_raise_interrupt trace event rework
>   - intr_ctrl_mask class attribute
>   - dev_addr support
>=20
> I will queue them quickly and we will focus on adding slave support only.
>=20

Cool, but please see my question on the intr_ctrl_mask.

--C4MvQVs8vjVFPZyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJNQ/4ACgkQTeGvMW1P
Delj+AgAtYUHqQqeILbCSjPccd/4A0tRus4Hmem/1M7pRDZQ8p2mVkIS0bm4kX+T
pPIoEwoQhLKvbOTi16nmFfcuAnMW04XQX/JRFWJ+tKPW0RgWmmNEIow5cw/RgZyI
lLVYS1RAW2qOr4JeDx9OtBNAyK2x1355YBOvjnOOjo7geOAyRIJNTItEqw+ilx4a
8NvMKqlEB8Q1Ele794TRwx3greNVR4o1wh1ImZN7JKjPeJLRjTHMA2ZUwdMa/TTz
KizW5RLiGs3pLcstYyqaBwdKalAnbw5NTBRwrdCeKL2KqCTfIVW9JJCswbBIju0R
3RrQNCPM2C9Oq53u1ri5uNyjXvuN1g==
=gebU
-----END PGP SIGNATURE-----

--C4MvQVs8vjVFPZyl--
