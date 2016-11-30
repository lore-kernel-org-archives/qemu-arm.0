Received: by 10.25.159.131 with SMTP id i125csp159837lfe;
        Wed, 30 Nov 2016 00:02:25 -0800 (PST)
X-Received: by 10.55.142.194 with SMTP id q185mr26765906qkd.82.1480492945046;
        Wed, 30 Nov 2016 00:02:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q66si36985970qkd.265.2016.11.30.00.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 00:02:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBzqS-0001hc-Gh
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 03:02:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBzqP-0001hR-3j
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 03:02:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBzqK-0003KI-7a
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 03:02:21 -0500
Received: from mo69.mail-out.ovh.net ([178.32.228.69]:40989)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBzqK-0003JI-1C
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 03:02:16 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 56967D13E
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 09:02:14 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 576BE240080;
	Wed, 30 Nov 2016 09:02:04 +0100 (CET)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-3-alastair@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <86f14300-344f-53d3-3c41-c2a4f1e9190a@kaod.org>
Date: Wed, 30 Nov 2016 09:02:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161130053629.23340-3-alastair@au1.ibm.com>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 9765492843614079767
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeekgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.228.69
Subject: Re: [Qemu-arm] [PATCH v2 2/6] hw/i2c: Add a NULL check for i2c
 slave init callbacks
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@d-silva.org>, qemu-devel@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D0Rw8dTVINV+

On 11/30/2016 06:36 AM, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>=20
> Add a NULL check for i2c slave init callbacks, so that we no longer
> need to implement empty init functions.
>=20
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

Reviewed-by:  C=E9dric Le Goater <clg@kaod.org>

> ---
>  hw/arm/pxa2xx.c   | 9 +--------
>  hw/arm/tosa.c     | 7 -------
>  hw/arm/z2.c       | 7 -------
>  hw/i2c/core.c     | 6 +++++-
>  hw/timer/ds1338.c | 6 ------
>  5 files changed, 6 insertions(+), 29 deletions(-)
>=20
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index 21ea1d6..bdcf6bc 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -1449,17 +1449,10 @@ static const VMStateDescription vmstate_pxa2xx_=
i2c =3D {
>      }
>  };
> =20
> -static int pxa2xx_i2c_slave_init(I2CSlave *i2c)
> -{
> -    /* Nothing to do.  */
> -    return 0;
> -}
> -
>  static void pxa2xx_i2c_slave_class_init(ObjectClass *klass, void *data=
)
>  {
>      I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> =20
> -    k->init =3D pxa2xx_i2c_slave_init;
>      k->event =3D pxa2xx_i2c_event;
>      k->recv =3D pxa2xx_i2c_rx;
>      k->send =3D pxa2xx_i2c_tx;
> @@ -2070,7 +2063,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_sp=
ace,
>      }
>      if (!revision)
>          revision =3D "pxa270";
> -   =20
> +
>      s->cpu =3D cpu_arm_init(revision);
>      if (s->cpu =3D=3D NULL) {
>          fprintf(stderr, "Unable to find CPU definition\n");
> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> index 1ee12f4..39d9dbb 100644
> --- a/hw/arm/tosa.c
> +++ b/hw/arm/tosa.c
> @@ -202,12 +202,6 @@ static int tosa_dac_recv(I2CSlave *s)
>      return -1;
>  }
> =20
> -static int tosa_dac_init(I2CSlave *i2c)
> -{
> -    /* Nothing to do.  */
> -    return 0;
> -}
> -
>  static void tosa_tg_init(PXA2xxState *cpu)
>  {
>      I2CBus *bus =3D pxa2xx_i2c_bus(cpu->i2c[0]);
> @@ -275,7 +269,6 @@ static void tosa_dac_class_init(ObjectClass *klass,=
 void *data)
>  {
>      I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> =20
> -    k->init =3D tosa_dac_init;
>      k->event =3D tosa_dac_event;
>      k->recv =3D tosa_dac_recv;
>      k->send =3D tosa_dac_send;
> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> index 68a92f3..b3a6bbd 100644
> --- a/hw/arm/z2.c
> +++ b/hw/arm/z2.c
> @@ -263,12 +263,6 @@ static int aer915_recv(I2CSlave *slave)
>      return retval;
>  }
> =20
> -static int aer915_init(I2CSlave *i2c)
> -{
> -    /* Nothing to do.  */
> -    return 0;
> -}
> -
>  static VMStateDescription vmstate_aer915_state =3D {
>      .name =3D "aer915",
>      .version_id =3D 1,
> @@ -285,7 +279,6 @@ static void aer915_class_init(ObjectClass *klass, v=
oid *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> =20
> -    k->init =3D aer915_init;
>      k->event =3D aer915_event;
>      k->recv =3D aer915_recv;
>      k->send =3D aer915_send;
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index abd4c4c..ae3ca94 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -260,7 +260,11 @@ static int i2c_slave_qdev_init(DeviceState *dev)
>      I2CSlave *s =3D I2C_SLAVE(dev);
>      I2CSlaveClass *sc =3D I2C_SLAVE_GET_CLASS(s);
> =20
> -    return sc->init(s);
> +    if (sc->init) {
> +        return sc->init(s);
> +    } else {
> +        return 0;
> +    }
>  }
> =20
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t a=
ddr)
> diff --git a/hw/timer/ds1338.c b/hw/timer/ds1338.c
> index 0112949..f5d04dd 100644
> --- a/hw/timer/ds1338.c
> +++ b/hw/timer/ds1338.c
> @@ -198,11 +198,6 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data=
)
>      return 0;
>  }
> =20
> -static int ds1338_init(I2CSlave *i2c)
> -{
> -    return 0;
> -}
> -
>  static void ds1338_reset(DeviceState *dev)
>  {
>      DS1338State *s =3D DS1338(dev);
> @@ -220,7 +215,6 @@ static void ds1338_class_init(ObjectClass *klass, v=
oid *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> =20
> -    k->init =3D ds1338_init;
>      k->event =3D ds1338_event;
>      k->recv =3D ds1338_recv;
>      k->send =3D ds1338_send;
>=20

