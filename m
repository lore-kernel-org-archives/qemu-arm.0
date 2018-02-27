Received: by 10.28.71.27 with SMTP id u27csp5385904wma;
        Tue, 27 Feb 2018 15:34:12 -0800 (PST)
X-Google-Smtp-Source: AG47ELviCpy28Rr80076k7/SijwIGwOj4Z3vev/l4j/xBp18F0Jo6OB4foisLFxDjNtAwvHsdWYA
X-Received: by 10.129.71.66 with SMTP id u63mr5276396ywa.411.1519774452164;
        Tue, 27 Feb 2018 15:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519774452; cv=none;
        d=google.com; s=arc-20160816;
        b=rtRH0GRd3dwPW/KEJ4eEAM/Nrm0eEYd6cSZhKc8lKnIuPh4X6hn/L26YELhyj9THAI
         +0QH3kk0lAP6cN1JrqGQqvUsYdiYjr+wkxzqhX6e8vV9hHW0XDJOtWHsO3j8MM1XfJZP
         NwmpgShhL0d4VuL9tGJ+l/wpb1rPzxjCYjA4N7sp4hXjF6UJyCU312jbAnfDmPjXlNbN
         WHKu5VeqJCCrGFQJq/Jal1moisirnrackmyNqmZl3cD4+Xy2xjXkusicZ1EC9/KV1CnG
         vPr6jBiAFqXXxhC51/pL6L7jmxCLUOwNy2W+TByZltc/Cp89USd+i6Pf5sD415ud6ny3
         jgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=yiQqJ2Yn1YNbZsb7xK8nCg7m9a4I4IiUzDWR3NaVfjo=;
        b=TR0GpLZzpch6iBa+p+g0r5ztkBXr4ZfZ1da5ngt5GNpV/lyZoCJYt2MkjoymMfa8+o
         D9PssqBPLBzcfkkrvPbaGBKfepYONj3gmQLlJO1Qkae7mqCpxh+yXOKHGHqAQvvNb+PP
         rSyf55lkgjomvbtQ9DLfUmOfwB7jEdBsraeI7qiEj76M7CF6x75mMIGz2L2kFhLOE5rz
         8wlZoN3JRXBCR5xinog7MlXwfveipITM4ChjjNjJ0PMxjwIOu5vXmP2mwNPmfyCa1VLg
         JopTHqFSfjll09bmBXKaxAPXRjsCN2QvdPZNxAXSZAQHz91IfjGcRd5B+btQwap96PGk
         fwgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XTov4C/d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 187-v6si51664ybh.240.2018.02.27.15.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 15:34:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XTov4C/d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqol9-00083i-Kd
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 18:34:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqol3-00083P-6Y
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:34:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqol2-0007sz-3q
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:34:05 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:36556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqol1-0007re-Px; Tue, 27 Feb 2018 18:34:04 -0500
Received: by mail-wr0-x242.google.com with SMTP id v111so524335wrb.3;
	Tue, 27 Feb 2018 15:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=yiQqJ2Yn1YNbZsb7xK8nCg7m9a4I4IiUzDWR3NaVfjo=;
	b=XTov4C/d4WwUAYz3LxICohwWd6d4qy6F1EIxcBVXPOsaZB+ufTWxkMukOdU/LkBvcw
	qCyC2ZaJyal7xStLVtE2d/gIw8m56ECr1LJY6oJXOABHiZsniCuGuGNM5tlF5rzGpOKY
	5xA97WXzOqC9w+ZXlTh0yW1WPmH0CWtW7UjKNMlmFNILGvZrOF5xvMCc+weDt2m/rYPT
	xpOigNEA6/wa0EWea08wNcgMjcAPfVFwcWMSCSn/gE8/+3G0uTMhE9CptJrIbenxM/Ab
	E2pZ7Na0j2yGlzu4yr244NiAp+LZL4kA761rW7gdd+087Rahp8f1RObLAkowpWFVztex
	YOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=yiQqJ2Yn1YNbZsb7xK8nCg7m9a4I4IiUzDWR3NaVfjo=;
	b=sa7Hznd3mO7KTUyMYOvIVWNl/7NIDl3ekx+UkSr6NLvE9lXv8byZnrjIuh7J40KOhK
	n/G/TfWrlI2O+9SurERnFnRcSYyw8Pgw4JNiM7aKuzTr4MwOzYkBt93kko9tSOwRpKrC
	Aj/Cr/LIauZlDRWBLt3v3nTmVR8I5MUTydDEdi60sSUxGkTICpLmIEEtPLWyw2W1wpyJ
	rJ+C8043AIP0xogEzn4aqbyKoJfbEyc/Ys6iaGY5xtoxG2+YFMaQ91EVOKpn9Ae/yJ8I
	m4VA2lkQE0z3tZyL5V7ILWKDo+LR1dxHqFuwHza/32gziwH2ASY9zFbXL7js4VT7E2RZ
	GKEQ==
X-Gm-Message-State: APf1xPB/m7OyjRsBV2FAv6WsZ0/T1puT4TurnmpIHzK3UddcpwyfyAcU
	YAxiifPWOIb3cXd7M4BPUOI=
X-Received: by 10.223.199.207 with SMTP id y15mr15125245wrg.158.1519774442785; 
	Tue, 27 Feb 2018 15:34:02 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7?
	([2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7])
	by smtp.gmail.com with ESMTPSA id n13sm282385wra.41.2018.02.27.15.34.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 15:34:02 -0800 (PST)
To: Linus Walleij <linus.walleij@linaro.org>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
	<20180227104903.21353-6-linus.walleij@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c1560ce5-4f72-a269-c9dc-334b0ec8d4a5@amsat.org>
Date: Tue, 27 Feb 2018 20:34:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180227104903.21353-6-linus.walleij@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="oOak90MGJvmXcSh9bsIZ44wEsPxbETNIe"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [PATCH 5/5] arm/vexpress: Add proper display
 connector emulation
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L1CTvLarq7r3

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oOak90MGJvmXcSh9bsIZ44wEsPxbETNIe
Content-Type: multipart/mixed; boundary="91FZAxdVIvhyJjZecR4Bg4bpkAm8oLuxH";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Linus Walleij <linus.walleij@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Corey Minyard <cminyard@mvista.com>
Message-ID: <c1560ce5-4f72-a269-c9dc-334b0ec8d4a5@amsat.org>
Subject: Re: [PATCH 5/5] arm/vexpress: Add proper display connector emulation
References: <20180227104903.21353-1-linus.walleij@linaro.org>
 <20180227104903.21353-6-linus.walleij@linaro.org>
In-Reply-To: <20180227104903.21353-6-linus.walleij@linaro.org>

--91FZAxdVIvhyJjZecR4Bg4bpkAm8oLuxH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02/27/2018 07:49 AM, Linus Walleij wrote:
> This adds the SiI9022 and EDID I2C devices to the ARM Versatile
> Express machine, and selects the two I2C devices necessary in the
> arm-softmmy.mak configuration so everything will build smoothly.
>=20
> I am implementing proper handling of the graphics in the Linux
> kernel and adding proper emulation of SiI9022 and EDID makes the
> driver probe as nicely as before, retrieveing the resolutions
> supported by the "QEMU monitor" and overall just working nice.
>=20
> The assignment of the SiI9022 at address 0x39 and the EDID
> DDC I2C at address 0x50 is not strictly correct: the DDC I2C
> is there all the time but in the actual component it only
> appears once activated inside the SiI9022, so ideally it should
> be added and removed to the bus by the SiI9022. However for this
> purpose it works fine to just have it around.
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
> ChangeLog v1->v2:
> - Only add the SII9022 now that it will by itself realize
>   the DDCI2C as part of the bridge.
> ---
>  default-configs/arm-softmmu.mak | 2 ++
>  hw/arm/vexpress.c               | 6 +++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-soft=
mmu.mak
> index ca34cf446242..54f855d07206 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -21,6 +21,8 @@ CONFIG_STELLARIS_INPUT=3Dy
>  CONFIG_STELLARIS_ENET=3Dy
>  CONFIG_SSD0303=3Dy
>  CONFIG_SSD0323=3Dy
> +CONFIG_DDC=3Dy
> +CONFIG_SII9022=3Dy
>  CONFIG_ADS7846=3Dy
>  CONFIG_MAX111X=3Dy
>  CONFIG_SSI=3Dy
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index dc5928ae1ab5..9fad79177a19 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -29,6 +29,7 @@
>  #include "hw/arm/arm.h"
>  #include "hw/arm/primecell.h"
>  #include "hw/devices.h"
> +#include "hw/i2c/i2c.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> @@ -537,6 +538,7 @@ static void vexpress_common_init(MachineState *mach=
ine)
>      uint32_t sys_id;
>      DriveInfo *dinfo;
>      pflash_t *pflash0;
> +    I2CBus *i2c;
>      ram_addr_t vram_size, sram_size;
>      MemoryRegion *sysmem =3D get_system_memory();
>      MemoryRegion *vram =3D g_new(MemoryRegion, 1);
> @@ -628,7 +630,9 @@ static void vexpress_common_init(MachineState *mach=
ine)
>      sysbus_create_simple("sp804", map[VE_TIMER01], pic[2]);
>      sysbus_create_simple("sp804", map[VE_TIMER23], pic[3]);
> =20
> -    /* VE_SERIALDVI: not modelled */
> +    dev =3D sysbus_create_simple("versatile_i2c", map[VE_SERIALDVI], N=
ULL);
> +    i2c =3D (I2CBus *)qdev_get_child_bus(dev, "i2c");
> +    i2c_create_slave(i2c, "sii9022", 0x39);
> =20
>      sysbus_create_simple("pl031", map[VE_RTC], pic[4]); /* RTC */
> =20
>=20


--91FZAxdVIvhyJjZecR4Bg4bpkAm8oLuxH--

--oOak90MGJvmXcSh9bsIZ44wEsPxbETNIe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlqV6ugACgkQ4+MsLN6t
wN6ilw/8DxII22zYaJoVMwzHddUYGFbr5GIILQMu4c2rZFOJbcbA7JdeJD0Ck4vf
X8ESlMdOtZJb+wwnLSRnuOuH+vRgKRyNGNlOMwZ62YMwzYu62qe6vMgvl8e8N/9f
jyV3HAWJQ1ZTNxYLwzzIOpWq9A0nzlLEztjKtrW3M0lRxG1cAo4Yfh5cNBullkyO
eGy3xq1ro5D/S8So57sWVIkDmddE49xcr70aP1NJZwaV6cMGXvKfTFxR32ue5Blh
9pm936t1XM87P2pMfNtH3ao0ygQsDJiFZGOMKtL+xbY1q/HUse+JcsudEVTK7blR
Oa0SiJPk2tbyTK75BwODmH3j8XbMkYCPJ96yaHHcsufj33k9uYzawzrkKHkHENXy
Z+TjNbhC+ECF0PIMROCGFAisf2zqAvYIurastuVeNR5FbJMe5Dx9CmbAoU8hLPL7
pHweadwXZVGgx/WySeTlECYukY4184AMC/5OQ9sT7iei0cFrEgK82x0F8zhE4hto
tY7dTIg82mvIBD5zamZ8WPIygSxYW7nB9JFBDNAMoAv1erRDT3QRqBTTCY6xq8z8
/0t8yL7TsF3466qLJg/cJBxgpXIC86aUuH3ereX+J5va4pgZ9KD1XL8/MN3C8XRg
PVe8MOH0WenOND2a/X9xZNPL2tzbRJc7YX4QJEQKra0G+bVKb78=
=qSw4
-----END PGP SIGNATURE-----

--oOak90MGJvmXcSh9bsIZ44wEsPxbETNIe--
