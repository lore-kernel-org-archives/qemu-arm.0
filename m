Received: by 10.28.71.27 with SMTP id u27csp658926wma;
        Fri, 9 Feb 2018 01:00:10 -0800 (PST)
X-Google-Smtp-Source: AH8x224/yWwzZ7VQYT4XIYsWO2BZTfuqCjOeZTtZTdTz62UFWGU3RpXW6rhU7f8o4F5ucjksIqDn
X-Received: by 10.129.65.74 with SMTP id f10mr1341553ywk.290.1518166810650;
        Fri, 09 Feb 2018 01:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518166810; cv=none;
        d=google.com; s=arc-20160816;
        b=aQEug5HGCUzZeLq7OHrmx9qHrJNV/6mquauWoLbI+UY+gDnFRtLLNCNBDAfI0w+gc8
         QTsLRnpq2wakLMi1ElXspoDjevzvdZFYiCgvrnyCU2XBoD9xPF6Padp2f9/R6OuaJzuv
         Flo1PwKoKCzBxvgs6++N1MfMRhp0wkJBxrQ3L78OrQeb6KcV9UDoAjp+p2c5CI9Ok7b5
         PYUed/kwylC3E+hokV/5fOuemqLv7YV8G5idJiModpLiWNH5C9qvCpWV4zXY6tswtBch
         Z3EDFnB6ReWiDXRrlQuxZqIxPjiCEnr0o89y+9L2baIGvP6CNCLjwEG4NA7jXqdXDG/m
         QIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=oWOlsmn/eAsSWZLYut4DVRprNzpiRVr+Eact9TLK0kc=;
        b=TIBDoAwGmkkFlbJGYZenpOecP4l69EuVhwY2g1zmxURT1Y+2URytNR1wd+CbzIXPgP
         A8YJ9YJfqaBCeWH+MxbtvSBR6Pchnxc7hYVaE3bwxq5WdjU5LCrC7vZeBfzs7i+QAJ6Q
         O6CvyfB6Z1Ek6dKATz9QzBv1EiO8eaPMA9aQAmJi5o4xx8PEZZTumg51UIi8mJ4jHnwS
         xXZv0Mqr6I2VcXXTUNLx4kO5VmnM9ppQkPdibY7y+lK55/P/To9bC7WFPkGvzcqpgKyP
         BczQp4oGZRsErgUeieDMbz4nE4Op0py1bSsqyVNXetf8xTxx8J60pQR53p/2pay2derN
         XCWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=ph6FIJ1h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si320668ybn.386.2018.02.09.01.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 01:00:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=ph6FIJ1h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ek4XR-0002cs-WB
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 04:00:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VF-0001C7-Jo
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 03:57:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VB-00064S-NK
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 03:57:53 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43177)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ek4VB-000646-GC; Fri, 09 Feb 2018 03:57:49 -0500
Received: by mail-qt0-x244.google.com with SMTP id m11so9650298qtn.10;
	Fri, 09 Feb 2018 00:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=rOZDa5TQ9fKivM1e1p7lvbNbMsdqYxJ/bEVPIc11U5s=;
	b=ph6FIJ1hoiO1gGk75uQhtes75swy7PvOvj47UtPvHUzvfCQUF9veZhjMr+ng4xyoeO
	pVXD2QwsmKEZoxDFPGD+BIifwSeq8JyKIDpydkr7au9iTS/EKjj6ISnc86DSkG4g4+Ke
	tjKTEfdyBuMcKQeCGSmYZp9lQDO23vyBCSfWAhbe9xsakzP7QeLeHG2WBC6rS1cQXLYI
	ViX/UZm5iSHFG2YYWDJQhn+klsQE+zFUCvGb22HvT8E/foB2aucW+ISs/L/AIeuP+Ew3
	NijdImPoJnC7l2spVCj3az2o/gFT9bk0p+lsLsrIMP57tAs73XdOuuDT74L11ewTTB6O
	/pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=rOZDa5TQ9fKivM1e1p7lvbNbMsdqYxJ/bEVPIc11U5s=;
	b=MdZrmD8ZL+RYgh0n6VIO4C1ewcRK+eOxG5U0Bjy0M3ZMpk8K+OqkyHuFj1hl1lptMt
	BtZxNiRiHonTos9CFTwJFVXkzlt0hsUgxkq8ITChvUIWZ5e7Hg7RrmqdltgRClld/gyS
	h3XLt4rKdYE/vO//bOYTsIsW7yaZBlGP+AGyWy+Vt9Rbq2ax0+1deWiCsS8WP+LRfVYr
	AuX9u//rs5Bf/UylWIT7S2xvpYcMegqYpHWAHnYHh0jg6KSNn2Qzg8HfgIx78CqAIL4H
	2DgWZp673RRyB1dvpxqY3tMLTzHfxEFX8PM/059UArS8xFT1R8qHyf0jyW6C3aS1oxIU
	mAdA==
X-Gm-Message-State: APf1xPBjy8frpv4poxIRJ2gaA97sOiPpClQW/XQC2TrtxIAmPAJWuHar
	z7t9kabnPqteZ19/KbNGmSwaEawr
X-Received: by 10.200.40.165 with SMTP id i34mr3156318qti.176.1518166668562;
	Fri, 09 Feb 2018 00:57:48 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	g57sm1517864qtk.54.2018.02.09.00.57.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 00:57:47 -0800 (PST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20180208172202.9984-1-f4bug@amsat.org>
	<20180208172202.9984-2-f4bug@amsat.org>
	<CAFEAcA_0rt7cCJs43BjW3OcQh=oeby+4j2dtFPSzgCn9tqW1qQ@mail.gmail.com>
	<5562bd02-5399-b1af-f183-d9a16b0a1c62@amsat.org>
	<1518136859.14456.14.camel@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d252eb0c-1a17-40a1-3f6b-5a7378bba73b@amsat.org>
Date: Fri, 9 Feb 2018 05:57:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1518136859.14456.14.camel@aj.id.au>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="SoLE2oQ2TqFhsTa5Fsp4aJ0kRqY8eOcoP"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/2] hw/arm/aspeed: directly map
 the serial device to the system address space
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wp29RgQvq99e

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SoLE2oQ2TqFhsTa5Fsp4aJ0kRqY8eOcoP
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <d252eb0c-1a17-40a1-3f6b-5a7378bba73b@amsat.org>
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/aspeed: directly map the serial
 device to the system address space
References: <20180208172202.9984-1-f4bug@amsat.org>
 <20180208172202.9984-2-f4bug@amsat.org>
 <CAFEAcA_0rt7cCJs43BjW3OcQh=oeby+4j2dtFPSzgCn9tqW1qQ@mail.gmail.com>
 <5562bd02-5399-b1af-f183-d9a16b0a1c62@amsat.org>
 <1518136859.14456.14.camel@aj.id.au>
In-Reply-To: <1518136859.14456.14.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/08/2018 09:40 PM, Andrew Jeffery wrote:
> On Thu, 2018-02-08 at 14:40 -0300, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 02/08/2018 02:30 PM, Peter Maydell wrote:
>>> On 8 February 2018 at 17:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
=2Eorg> wrote:
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> ---
>>>>  hw/arm/aspeed_soc.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>>>> index c83b7e207b..a786750e14 100644
>>>> --- a/hw/arm/aspeed_soc.c
>>>> +++ b/hw/arm/aspeed_soc.c
>>>> @@ -257,7 +257,7 @@ static void aspeed_soc_realize(DeviceState *dev,=
 Error **errp)
>>>>      /* UART - attach an 8250 to the IO space as our UART5 */
>>>>      if (serial_hds[0]) {
>>>>          qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_i=
rqs[4]);
>>>> -        serial_mm_init(&s->iomem, ASPEED_SOC_UART_5_BASE, 2,
>>>> +        serial_mm_init(get_system_memory(), ASPEED_SOC_UART_5_BASE,=
 2,
>>>>                         uart5, 38400, serial_hds[0], DEVICE_LITTLE_E=
NDIAN);
>>>>      }
>>>
>>> Is this a bug fix? It certainly changes behaviour, which
>>> suggests that a fuller commit message would be useful.
>>
>> This patch is buggy indeed, using system_memory the serial address
>> should be ASPEED_SOC_IOMEM_BASE + ASPEED_SOC_UART_5_BASE.
>>
>=20
> If you'd like to test, you can grab images from here:
>=20
> https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dromulu=
s/
>=20
> For example (without the patch):
>=20
>     $ wget     https://openpower.xyz/job/openbmc-build/1240/distro=3Dub=
untu,target=3Dromulus/artifact/deploy/images/romulus/image-bmc

Thanks for this useful link!

> ...
> $ qemu-system-arm -M romulus-bmc -m 512 -drive file=3Dimage-bmc,if=3Dmt=
d,format=3Draw -nographic

good candidate for an Avocado / pyexpect test...

>=20
>=20
> U-Boot 2016.07 (Jan 25 2018 - 16:31:27 +0000)  =20
>=20
>        Watchdog enabled                        =20
> DRAM:  496 MiB                                 =20
> Flash: 32 MiB                                  =20
> *** Warning - bad CRC, using default environment
>=20
> In:    serial                                  =20
> Out:   serial                                  =20
> Err:   serial                                  =20
> Net:   aspeednic#0                             =20
> Error: aspeednic#0 address not set.            =20
>=20
> Hit any key to stop autoboot:  0               =20
> ## Loading kernel from FIT Image at 20080000 ...
> ...
>=20
> And yeah, this patch breaks output.

Sorry I didn't care enough testing this series :|

>=20
> Thanks for the cleanup though.
>=20
> Andrew
>=20


--SoLE2oQ2TqFhsTa5Fsp4aJ0kRqY8eOcoP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlp9YoUACgkQ4+MsLN6t
wN7UfxAAzTAub1oVc+CTBQ1SCmL1YixJbqFMJ7sHmAy6wVSu2S6QGf1IClvtLpr7
qroFx+z7VHyNUPK/J1yIFOMK31jP1hDUM6mFq26/tnjKyZ9CgVZRyubuLLSBB1Sq
xN2nT8TIwCAgTG0QUv/5AXAxidJT+3jq07eVMmKdkt/ea+ueV1sq3SRXXw7G3K71
PwD84vx2jXryEV/wxADFUr4xJbYFxN/CuP1bXAHIHOdB+dgHFMSpA1Izo8uspgu2
Q1OfxVTwNvnNpH0Wt/LdUb0wjqZ0rXNGba6cymY5kr4gor0dAhPLiVUDWnwmjfGU
HDa0qsXH3mPvyKDDMwxoE9AVWRWn9kQYNAmLCsZHelSbdFtSBGyHNl0WzHFLvkC+
yo5NOPQS2FRenbP4bOd87pT742szrozpL6OnpFaYeEyM18ZUYb4bPe1vkjPC1GlF
kU9Bh2wPy+E2N4+RD7u+9NmILVoc7sycUFMLVEcIJGiCAO3rr3lP6MEmNJ0CdEU4
4QGwuokRrxYSDk5gteNTbEAcRKkKmDa1kAQ7Uu4dDcaPRrItkMU0DaCrXdga6eYE
aC33/m5/ds2hi4j2l2suu4dXyCs3YLCOi1tSpOZvK7a3taA4GZjA4U+G9xNU88+p
NPivJmI5JXaUwLHo0K+PTBQEKyqz6mahy4++vYYiNZiOvDOgoXs=
=Qe+9
-----END PGP SIGNATURE-----

--SoLE2oQ2TqFhsTa5Fsp4aJ0kRqY8eOcoP--
