Received: by 10.223.197.9 with SMTP id q9csp1941489wrf;
        Sun, 8 Oct 2017 17:46:10 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBDPZHES4XtPRKrHn6FRVRfrWxRmCixh4BEbjPn/sk/yU+Wg6w6vd3QCHsQOvfhfuro2E9R
X-Received: by 10.55.142.5 with SMTP id q5mr7478702qkd.83.1507509970508;
        Sun, 08 Oct 2017 17:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507509970; cv=none;
        d=google.com; s=arc-20160816;
        b=Xeu+0jW61cbbO0gdFIYuX82cBgCKrReiwLcdUOfuQBO+04on42a7qr7uKGHlAB9yNJ
         +bjfM9qtoeb3o0vJ8PeoyFyJUya9rEUOkvBSzNQ6kaszCbyh53UADvTYBENKyBsqhIBB
         OtLE7oygA3skCSbjgbFkabUg1/fTwYruFNPOxua/XpRB/bw5j4WQ0RxD8tESYIjpUom6
         dgqogT0pVn3pkcxNmR+NL/fqVYqPzue7whMUO/GEuYV5ARK36N3JeYaBK3QQj1eE2l+7
         enWXWL3KohWdYpSRxRnL4YP4hDQOozFAb7JntuBTZ7ye38AhvlJtmmk+qCUD6jlCRgFp
         Ip/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=2Bwbexpi67mTPFLhcrEyyg3fA5KuP0zP4Dbg6edNNwg=;
        b=BrPxifnM7ej3HZlx0Eef/xSgs9iim+lBEpShOzbCOcaMP14jRaDcK3XXYAcdVx6K9D
         ykPvwx4vam8zy3Y6PAKiZC2qs1O7kM9Tzw5YmZ9uh5vjHId4hp0NFJPu1So0uy643k7D
         W/PTZ/xoFS3H6CcDpWRqMtVVjhC18/GUEv770r2o0dQ/UCMSmzyYlSrEUUq9WUAgBxwO
         tImgnen+fcYziQlmYTJzWXUPZ0h6jL6vYdU2O8qZ8j0gC2fn2rXpCFh2o0pIIF5kmQns
         ++OuSPqZsUr8rNZVNV3pma45Lg/FitPlXEhJWoZTmphB7ypsQoCKrn1PHzR2QM9B451T
         AAwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=fgRm49Je;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=Kh982Nz8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m61si842923qte.446.2017.10.08.17.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Oct 2017 17:46:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=fgRm49Je;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=Kh982Nz8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1MCw-00079W-0w
	for alex.bennee@linaro.org; Sun, 08 Oct 2017 20:46:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e1MCl-00078A-6S
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:46:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e1MCh-0007Vk-8r
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:45:59 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49313)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1e1MCh-0007V9-4H; Sun, 08 Oct 2017 20:45:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9A464208C6;
	Sun,  8 Oct 2017 20:45:52 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Sun, 08 Oct 2017 20:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=2Bwbexpi67mTPFLhcrEyyg3fA5KuP0zP4Dbg6edNN
	wg=; b=fgRm49JeZ2JcqklDKboyD9yeeGhPe0n4MHQifrQYG24HgfVmhvPnxRrvD
	z265RvEMuOM4tpM6wcrNZZhSG3yScBqzZl37/NaWD3FKbhhbkCFKXvqaXCszsYYi
	LXa7NIdSQbOr3IUiL9zRY/iuZh4M9Q4L8ujjbjyD9jauGy7aI/FFmFNcsXlckLkM
	xMTJ08bZoEbdH2sVEoRA4bRJtMRurS640ZMQ1JiOBsif9MrAD9hy2exBPaK5dOtb
	d49XjwwRBPRlAG/ALrrPlLCsYWq8OgmBYjL3/SqV/zsOxov+Ho14tG1SDYt5dHMU
	X31tzsMebCspg9eO3gEbj8A29Orrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=2Bwbexpi67mTPFLhcr
	Eyyg3fA5KuP0zP4Dbg6edNNwg=; b=Kh982Nz8Jq8Y41TX/URMZudbO+PR5uDg9D
	pR88mjKLWe3gTsTwRUTT2V6uhmMrsBq8QA8h7hKuJjl6AJbgCY8KBt9FccYQaTBP
	vsI0Ybnh8woyRpMHe6Axnv+kWeLVSKM03K+hjLPp9OubyIT0C7+FkESkdF01Qyjg
	TX+yKYxmpzaRVzppP9S4ttOkjtQMUKtR99PxSLiqk8y7Z3U1+Y2jIUqEb8QD1D4+
	EJGGYwWb29VQ/iK0H0euBcFKUz4P4f+Jbul2ggJDXmRo4pJJaWzw/1sTWBgvVVJn
	bO5RFejHC3EKrkg+2TO/Sk5rXPDUOA7ptSmxpCzI1SzOOjrxIRCQ==
X-ME-Sender: <xms:wMbaWdLj99FczoASlo3wDv57WUYpPOZXCSuT8UXYi7Uh5iKTLtS29Q>
X-Sasl-enc: 1TH8Qktg5ZXkOON9RKhqgLbxK3PTuJts6LwwAzdJygaw 1507509951
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 802162413F;
	Sun,  8 Oct 2017 20:45:48 -0400 (EDT)
Message-ID: <1507509945.5452.150.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Mon, 09 Oct 2017 11:15:45 +1030
In-Reply-To: <20170920070135.31379-5-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-5-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7fae1mlNxJg82wabGvuu"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH v2 4/6] aspeed: Add EEPROM I2C devices
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
Cc: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HYZzNAlPVqBf


--=-7fae1mlNxJg82wabGvuu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-20 at 09:01 +0200, C=C3=A9dric Le Goater wrote:
> The Aspeed boards have at least one EEPROM to hold the Vital Product
> Data (VPD).
>=C2=A0
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>=C2=A0
> Changes since v1:
>=C2=A0
> =C2=A0- fixed palmetto EEPROM size
> =C2=A0- used smbus_eeprom_init_one()
>=C2=A0
> hw/arm/aspeed.c | 13 +++++++++++++
> =C2=A01 file changed, 13 insertions(+)
>=C2=A0
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 362b683e9021..462f8008cff5 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -17,6 +17,7 @@
> =C2=A0#include "hw/arm/arm.h"
> =C2=A0#include "hw/arm/aspeed_soc.h"
> =C2=A0#include "hw/boards.h"
> +#include "hw/i2c/smbus.h"
> =C2=A0#include "qemu/log.h"
> =C2=A0#include "sysemu/block-backend.h"
> =C2=A0#include "sysemu/blockdev.h"
> @@ -255,11 +256,15 @@ static void palmetto_bmc_i2c_init(AspeedBoardState =
*bmc)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DeviceState *dev;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint8_t *eeprom_buf =3D g_malloc0(32 * 1024);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* The palmetto platform expects a ds3231 R=
TC but a ds1338 is
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* enough to provide basic RTC feature=
s. Alarms will be missing */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 0), "ds1338", 0x68);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 0), 0x50,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0eeprom_buf);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* add a TMP423 temperature sensor */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev =3D i2c_create_slave(aspeed_i2c_get_bus=
(DEVICE(&soc->i2c), 2),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0"tmp423", 0x4c);
> @@ -297,6 +302,10 @@ static const TypeInfo palmetto_bmc_type =3D {
> =C2=A0static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 3), 0x50,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0eeprom_buf);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* The AST2500 EVB expects a LM75 but a TMP=
105 is compatible */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 7), "tmp105", 0x4d);
> @@ -368,6 +377,7 @@ static const TypeInfo romulus_bmc_type =3D {
> =C2=A0static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 4), "tmp423", 0x4c);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 5), "tmp423", 0x4c);
> @@ -377,6 +387,9 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* The witherspoon board expects Epson RX89=
00 I2C RTC but a ds1338 is
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* good enough */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 11), "ds1338", 0x32);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 11), 0x51,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0eeprom_buf);
> =C2=A0}
> =C2=A0
> =C2=A0static void witherspoon_bmc_init(MachineState *machine)
--=-7fae1mlNxJg82wabGvuu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ2sa5AAoJEJ0dnzgO5LT5DO4QAIuHGS6YhldhN26HZHf4mogk
GxfdlM26SWTXHj5d3/xKtY1mthOcPJ4RyyPH6V3INB4Ohkyvu4sicKqLhfCptLWE
VTfP+qXl9WH/67J9/Gogr88PxsGeZX0ZxYUQevO9JHs5SIFONWhOITQF42MbEs3/
J2AR2308kVROGOe4Ef1zQNQMf0zv0oHjiOYkuj+zTKTf9u+cJwh/gcjnvUhqQxyn
3yLwhCFK6fwg0C4TMHE1SD/xSJQZncFKyr6VevozsAd48iVyxsTMHw0M6wTs6gX6
wMhh1k5BqCNdkDDYd26TIyYd3F0pBJ5809HsTqLnHP6nLiFxe6vxL31fTHtBKP7G
a8Fb5fOzj2/NT4RTpDTqAxZm5Z4RxDC4nh06+kbmXQwO+4vb+aM014NkE+p6SYjy
uUmX8HiYgiFCWrvmusMwfl7JTuYzW8TO95xRVo9WLX72UH/L1itgjjdC35nCsprb
3udX4OG82mzxg4RKQzUuKAlY8yoOfZb5wr9casFXyQXXAy7/hZp4mvFfrWxuhZjR
tfLvyTDX38GVx98IFbbp9RUPO+4eDU/rsa7kbrwcGdEd3BYJjJIQtQqJaCOTZbJR
QENN2hEYzP4PqW0VO1N1A07QC4ttiwQkX4/oHcy1st2/nEDVpmOvKJ/u+QXyknd7
yW2YMOoBn+AREMP8/lnj
=naae
-----END PGP SIGNATURE-----

--=-7fae1mlNxJg82wabGvuu--

