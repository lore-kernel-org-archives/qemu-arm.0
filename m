Received: by 10.28.71.27 with SMTP id u27csp101963wma;
        Thu, 8 Feb 2018 16:41:27 -0800 (PST)
X-Google-Smtp-Source: AH8x224rQ4I9XM/w3ta72d5yOjz47i3YxZDCENkjXr9u6yFxTRl6v0cE0/S9WJIAvJ9lMqH2HiMF
X-Received: by 10.13.251.71 with SMTP id l68mr734391ywf.355.1518136887726;
        Thu, 08 Feb 2018 16:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518136887; cv=none;
        d=google.com; s=arc-20160816;
        b=UDIKnDe0W4oVKKJuyuiKxnYr14Ll6puVCVi3lUSnfUkcWGA5H92JIa4Ani4O0sKQRB
         6hc3ScbiKXKDmutC2MTCyOwhlGEbcHaV0GzRhBRA8jq8ctAUEy96Q+V1BKcOf5WZr/on
         FHSSZFinnTv+wjr2uCfsfEwzTajCciB7MWSUzu5hLNp8CY4gramBbi0aJq7ZwE7WBdHO
         EFDlQ+C8yZeo9l0PtDt8S81Hp78m9+BbESmGZsWkNRWuUce5Pl4/CrTWxsgpL8JmJ3dn
         Z/VaXHpW5S68z5YUemUm+ZbzuIN7oBMffUm2cudMZWit3gGkoIzeq1iFFGU5E8LP04Nx
         BNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=bJkAtxHK++4EBtUEyYnP5gHmS231hL9LxWCC5G2bpLw=;
        b=QhI8mJ2zKTYvDihlaaMDnx/pcm+neipBLRZ2dwBgJ+DEXLL2JW6MB97K9uhPa0Rmpz
         d9DBQghRiPnuckzFuJFKh9ItsStaccDdAdRtKCOB142tLfGHNS1ZqX6NbrRCnlu1ERcB
         Xcktjfv1+hIliebQsFDhLHDkrA7aeJs5lbBZrULwkifrqqJzwvSYumWKP4SgyTKjbxEo
         FQiC7ytKYq06zGfZgpTlA/NwiPhspJwdvBk7Bpxm3JVl8bYmsZWHkDB9zvtIvAOUhn1Y
         +fKqpWnwYrox9lfgKM3qNfGlzvU/A5ehuSKt071D/3l1EgE0FQWNX0XrsKE0l+7XHuoO
         km/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=Y6E1UjOW;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=FkyjgIMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n4si201699ywc.508.2018.02.08.16.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 16:41:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=Y6E1UjOW;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=FkyjgIMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejwkp-00079p-2i
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 19:41:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1ejwkd-00078e-Ax
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 19:41:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1ejwkZ-0005Ag-CE
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 19:41:15 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:46609)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1ejwkZ-00059h-0Y; Thu, 08 Feb 2018 19:41:11 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C815A20DAB;
	Thu,  8 Feb 2018 19:41:08 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Thu, 08 Feb 2018 19:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=bJkAtxHK++4EBtUEyYnP5gHmS231hL9LxWCC5G2bpLw=; b=Y6E1UjOW
	mnMO2tgX4byyWcNOikcbVetRzQ5hezFa2IgxvG9h2p0eiolb0E+GUgPBwR1LVkG7
	1A8EDm1/Qv2cE7EFAFEA7y+ZHjDHviyMApH8l5FFTaTmIhWv78CEh+qAX+beN5uJ
	kd8uRXnJ3eb7nNbI8ZKK1ZJ7gq9rEuQA26JctsuTyiFwoB5ID8pytWoLKTFSBFmH
	WuM/N8BccEf9RNJynjFly99QHPRVN8NEId7UER0MMoNd4HqdNJK9V3sxwi8MsHYL
	l9B1J8Bnw9/OdczQoUC34qfnGz2ivWZkj1jWz+6jOSI9/y0b+xtP37WVJd7HWXzb
	OuXEAafQEIqKZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=bJkAtxHK++4EBtUEyYnP5gHmS231h
	L9LxWCC5G2bpLw=; b=FkyjgIMkOt+hAMaB2zHdBr7DmY02ANz4kNTa6hKoHV0Qm
	Ip5t9Fh4wNhqBZAixKRKJNBiWqI9p4nMSdGy6tXrMj35rUD342X/stGnlV3vqLOg
	4NR3H8l981l7f/Dwydh0KvG9hQyeKvC8dIqdq4+Wl7wGrbUiC9Id3uVBcPn2gVL8
	fAeMXMWs9U7HB95tyoUPpwkN3WsL8KNXVFdqlLJUHG2XbTiUG+OZBaOTFxGSDdqK
	k2G7nAAKDFVpJ15FFHIsnDsuDflPLApkU/3oB1e9xjikYZ1btWDdP0dQVTjVH65f
	mAPvHRrWSJw0l715fTb+4gAcW7vKnxUfiNIfbOXvw==
X-ME-Sender: <xms:JO58WjvbhLT3D7Uxjuk4o8zEpmf91AGmfRcsSjvNv_7o2aynfJiq2A>
Received: from dave (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6636E24406;
	Thu,  8 Feb 2018 19:41:06 -0500 (EST)
Message-ID: <1518136859.14456.14.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
	Maydell <peter.maydell@linaro.org>
Date: Fri, 09 Feb 2018 11:10:59 +1030
In-Reply-To: <5562bd02-5399-b1af-f183-d9a16b0a1c62@amsat.org>
References: <20180208172202.9984-1-f4bug@amsat.org>
	<20180208172202.9984-2-f4bug@amsat.org>
	<CAFEAcA_0rt7cCJs43BjW3OcQh=oeby+4j2dtFPSzgCn9tqW1qQ@mail.gmail.com>
	<5562bd02-5399-b1af-f183-d9a16b0a1c62@amsat.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-g/Ze0FZMha2DgFY+D60N"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/aspeed: directly map the serial
 device to the system address space
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YOL092h3NNeT


--=-g/Ze0FZMha2DgFY+D60N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-02-08 at 14:40 -0300, Philippe Mathieu-Daud=C3=A9 wrote:
> On 02/08/2018 02:30 PM, Peter Maydell wrote:
> > On 8 February 2018 at 17:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > ---
> > >  hw/arm/aspeed_soc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > > index c83b7e207b..a786750e14 100644
> > > --- a/hw/arm/aspeed_soc.c
> > > +++ b/hw/arm/aspeed_soc.c
> > > @@ -257,7 +257,7 @@ static void aspeed_soc_realize(DeviceState *dev, =
Error **errp)
> > >      /* UART - attach an 8250 to the IO space as our UART5 */
> > >      if (serial_hds[0]) {
> > >          qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_ir=
qs[4]);
> > > -        serial_mm_init(&s->iomem, ASPEED_SOC_UART_5_BASE, 2,
> > > +        serial_mm_init(get_system_memory(), ASPEED_SOC_UART_5_BASE, =
2,
> > >                         uart5, 38400, serial_hds[0], DEVICE_LITTLE_EN=
DIAN);
> > >      }
> >=20
> > Is this a bug fix? It certainly changes behaviour, which
> > suggests that a fuller commit message would be useful.
>=20
> This patch is buggy indeed, using system_memory the serial address
> should be ASPEED_SOC_IOMEM_BASE + ASPEED_SOC_UART_5_BASE.
>=20

If you'd like to test, you can grab images from here:

https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dromulus/

For example (without the patch):

    $ wget     https://openpower.xyz/job/openbmc-build/1240/distro=3Dubuntu=
,target=3Dromulus/artifact/deploy/images/romulus/image-bmc
...
$ qemu-system-arm -M romulus-bmc -m 512 -drive file=3Dimage-bmc,if=3Dmtd,fo=
rmat=3Draw -nographic


U-Boot 2016.07 (Jan 25 2018 - 16:31:27 +0000)  =20

       Watchdog enabled                        =20
DRAM:  496 MiB                                 =20
Flash: 32 MiB                                  =20
*** Warning - bad CRC, using default environment

In:    serial                                  =20
Out:   serial                                  =20
Err:   serial                                  =20
Net:   aspeednic#0                             =20
Error: aspeednic#0 address not set.            =20

Hit any key to stop autoboot:  0               =20
## Loading kernel from FIT Image at 20080000 ...
...

And yeah, this patch breaks output.

Thanks for the cleanup though.

Andrew
--=-g/Ze0FZMha2DgFY+D60N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJafO4bAAoJEJ0dnzgO5LT5txkP/2KVWKHTkbbw2Xlr1A8iu/05
zhY7E/oF+qorK2j2XArDxUQ0mkcfjU3/RT4fdSDawcXvwSSOMO6PrVfyauBvUmT0
ucM9bb73E4MQYpO6iG28p5/b7zkydoszgB2wQOy9nU+Iy0cNATXRczudfEAO0RII
7qtxdsAoqZTCUAa0U6bGXcwc5TEqgUhoQbq71Nbrx0/ncmK5kx+Vtkh7CW2Ly6Nw
YtSml/O4GINXLms7NXB7XRh19BoifOfyJ65I0WFmeV++71GVuEYctV+DgsblkmMG
GnVsdSplOE4cnGuRlhSraAV9L+xGTA454jJ/Akx27c231R6mcYou7z1pYLJsvZ0O
QguK6kAtdp7ciU0NORUnrbboXjV3J4wMeCSGEvMRNtB/zaplz0I/fpCgZzIRGRng
moipr7JoHutE3+uPahhnWVX/ZEiWPY63kpTNyuSNb/eOeZ14Tj/5oMawGlcLo54r
OVR6WYue/yAlv5dnyke3Mjx/hY2daQBncKfp183eBKKjO7lHK7nUHoi2veEwpn3e
NMUjFI5xRqj5FBAikVc0wJXgTvbllkTqRujHZoro31zEQYdRrTz76x1vHoQVv818
p1utCaxdumQypBqYmQ2Yn+IbO8hEXZw5bdx/ro4WblnQt1nG8gZQawnMG3CbjlJt
l1eKn8DCyiYkXXSb75Pg
=pl4p
-----END PGP SIGNATURE-----

--=-g/Ze0FZMha2DgFY+D60N--

