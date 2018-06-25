Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3252036wrq;
        Sun, 24 Jun 2018 17:55:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIUOSvcnHKz602goFCiMWUGOfRNGUz7DAFjzyXf6LQVwIqtqnPsuTI+1itjGU9BTRUIjf7n
X-Received: by 2002:a37:5a43:: with SMTP id o64-v6mr9159362qkb.211.1529888108259;
        Sun, 24 Jun 2018 17:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529888108; cv=none;
        d=google.com; s=arc-20160816;
        b=tfTdbSccF4IOdumPX3GLze+nlW5erJNjMZYyWc2z2oyAL4MTErfvFGGGzkBaHu5bl6
         dIntnHc9szGYLUqaYw8tGcfT9dOXLvFSLcBHvCyQNV7r1RnHX/VAhdxhtK0jovyWcPqY
         RaMYCEw0L03mnKkN6xP2KXuyyMyZ2umQfI1+7IF7SNLP9XIBIxiD5Si/JUdgszNAVm1r
         QwANsM6Fj0gd1/DXSOXWSgu1QmhJUoC/bnJ99gi6v2vGpihSYANjrYGwBHEcv4Ho6rqO
         lG7wWxHBqZMRveKRb/1BUGx9ugdSE3W8hu+EivW4uctlmQiMzmdby2s81kX9K/hY+J6w
         KZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:date
         :in-reply-to:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature:arc-authentication-results;
        bh=Ei13pnUPPeafVextN0bvWPEZmzKK9+8UwxFBw2C810E=;
        b=o5BL4o6egspvAa6A7yn6Cy4n85Wt7tFB9KupIvFZGlYHr+0rYTzjrUzxHo3kn/8tr3
         QK9YLrMC1Y+0+SIxQ6BYVAngpphk1eAm3G6hlhh1kUrh3ugPG2DIqJdytWSyJ2u+JR4G
         RKhoZwnHonO1ou416loHa6LoEHr9aNPjzFDT8NM9gOsDelkfSamuNlhH+btioYB23Bnq
         DP+R6ydY1RwpLqcDjHsZCnqZIZPusq9KHo5eW16WiPgu65JEJXder0wpByKFymVRQ3sa
         frCKyREs8J7CxVpPYWZKkX41U5dMMwq69B5whO+Bi6sdrHLhF3gw9dLzxBCUSjiKW3/8
         18Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=cDxnUdt+;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b="fUX9/UDk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3-v6si2225622qvm.34.2018.06.24.17.55.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jun 2018 17:55:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=cDxnUdt+;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b="fUX9/UDk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXFmd-0004jR-OM
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 20:55:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXFmR-0004iQ-0K
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 20:54:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXFmL-0002Z8-4n
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 20:54:55 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:57441)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1fXFmL-0002Z2-0Z; Sun, 24 Jun 2018 20:54:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7B30821B9E;
	Sun, 24 Jun 2018 20:54:48 -0400 (EDT)
Received: from web4 ([10.202.2.214])
	by compute4.internal (MEProxy); Sun, 24 Jun 2018 20:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=Ei13pnUPPeafVextN0bvWPEZmzKK9
	+8UwxFBw2C810E=; b=cDxnUdt+P6xW5OKAKCZF1069oVWBct0ZX2xaYiK/K/Ds+
	5jWP69N3/9NMvMsI4CoBdcWeBn7qV5zAMEnjyKuFP8BnYmckmEH1G+KHUcWMel7K
	I0sG+BSq2ZuSVyCDjjBpICjw83bmQEm9lm9FRiILO5MzJPTGoiLbOlZ2XDAr0aKE
	YbZasTBVEHsJGj1Wuuy3qhkH0PYrXk5DEfqLDlPjam+hwT6O+8KDWRQLkHx72h7/
	EOpTesoOf5cmJD8YR2sq3EbNwHnoudKfltxJe+5momJF5IcwwBdtvIRs0hTlL06p
	AXGT1y4P1u/2JKk4LPvJIwTZ+3GTrCI0ocB6y3vwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ei13pn
	UPPeafVextN0bvWPEZmzKK9+8UwxFBw2C810E=; b=fUX9/UDkhzzIzQRnx1kBvV
	ohbQSldfRCbEwIYF7pJn7/vvuZ4m3yqyF/cMfGw66oS/NtesGOLu9OVzy5xgFKzm
	AfKg0wbaGJpTe95AvPbY7tKmqrL4ypz7CIo05Mg+JWSHXLIf+WZ63W+SPj2N8Joq
	lxRQdsw+SFVOZ3hnzdJhsNFqMeRTLhVH/7S7ygiGaM5NhsDI8FCEEgYgeJscdXqq
	sy7tfyp3UL+gexWT+Q8dfwpjQ6aClk5YRb+2ExEtz4JLr5Zr/426E7ytItdY9LDP
	KRNrivl9vWmaSZG0uXu/QE9/KFsAd7wOYl+Qy3+5czxNCuTvfpWbExNujMLKtIZg
	==
X-ME-Proxy: <xmx:WD0wW5gHtOdxv4IapDosW3GHOVJ8B-Fr3Qkydct3IETcKl9Jy3MqBA>
	<xmx:WD0wWwR43jNcB2DNHYPJutPJ1Bp3bKgLnqrZ_mBWJ1QtOo9Uf_Dm_w>
	<xmx:WD0wW5LQey_KqM5rMZNuKst4XnNxoZhNSJ_aRte82ZGvrb-GIlPMYQ>
	<xmx:WD0wW3MAZITtrcgQ3dq2HXFqM4oQTaK_eRtuHgscpeB19ysUlFxwLg>
	<xmx:WD0wW7zKas59v18-7riq5t4bYvrfYkA8PVStEthz6awqMiHIsfszLw>
	<xmx:WD0wW2tXQHdbFtlgnM6UOFmSr68bq-LVFAPC7rwHD06IP_mR-rSPsQ>
X-ME-Sender: <xms:WD0wW7AQipB6bRtFW5MrTB2Yd-Lf91lsK2DymVSCbpty97Z8Oqwqag>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id 402DCBA43D; Sun, 24 Jun 2018 20:54:48 -0400 (EDT)
Message-Id: <1529888088.2193467.1418937200.513B366B@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
In-Reply-To: <20180622075700.5923-3-clg@kaod.org>
Date: Mon, 25 Jun 2018 10:24:48 +0930
References: <20180622075700.5923-1-clg@kaod.org>
	<20180622075700.5923-3-clg@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH v2 2/3] aspeed: initialize the SCU controller
 first
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZX4DlVq9wJBd

On Fri, 22 Jun 2018, at 17:26, C=C3=A9dric Le Goater wrote:
> The System Control Unit should be initialized first as it drives all
> the configuration of the SoC and other device models.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  hw/arm/aspeed_soc.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 1955a892f4a4..7cc05ee27ea4 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -109,18 +109,6 @@ static void aspeed_soc_init(Object *obj)
>      object_initialize(&s->cpu, sizeof(s->cpu), sc->info->cpu_type);
>      object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
>=20=20
> -    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
> -    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
> -
> -    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
> -    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
> -    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
> -
> -    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
> -    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
> -
>      object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
>      object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
>      qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
> @@ -133,6 +121,18 @@ static void aspeed_soc_init(Object *obj)
>      object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
>                                "hw-prot-key", &error_abort);
>=20=20
> +    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
> +    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
> +
> +    object_initialize(&s->timerctrl, sizeof(s->timerctrl),=20
> TYPE_ASPEED_TIMER);
> +    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl),=20
> NULL);
> +    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
> +
> +    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
> +    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
> +
>      object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
>      object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
>      qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
> @@ -195,6 +195,14 @@ static void aspeed_soc_realize(DeviceState *dev,=20
> Error **errp)
>      memory_region_add_subregion(get_system_memory(),=20
> ASPEED_SOC_SRAM_BASE,
>                                  &s->sram);
>=20=20
> +    /* SCU */
> +    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
> +
>      /* VIC */
>      object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
>      if (err) {
> @@ -219,14 +227,6 @@ static void aspeed_soc_realize(DeviceState *dev,=20
> Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>=20=20
> -    /* SCU */
> -    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> -    }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
> -
>      /* UART - attach an 8250 to the IO space as our UART5 */
>      if (serial_hd(0)) {
>          qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4=
]);
> --=20
> 2.13.6
>=20
