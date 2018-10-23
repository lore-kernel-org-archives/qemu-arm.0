Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4699424wrt;
        Tue, 23 Oct 2018 08:45:53 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cl3NZ6RVuuGqyEgn8jKI1ZQ/gSDBsumY5v2lVweHOveZK6g+AvyqO2F2ir+WNytmXuWMoe
X-Received: by 2002:ae9:f016:: with SMTP id l22-v6mr877317qkg.23.1540309553867;
        Tue, 23 Oct 2018 08:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309553; cv=none;
        d=google.com; s=arc-20160816;
        b=DJm/jdkLuKAiYaRHDGkpC9//TvPDMjt3cJImFE3L6/naij4r+mqvEmGV/mWLR8zKIg
         Wsxm3GvGV0svX354HpHMsRVQfAUCB6ZA2434l4r75mCl7x2B54kDG9lslq4wp/XlywpC
         WHe1sK7VezK//T18MJQtHmU3S8qXo7rh4BOUfos5YmJtaILI0LV2gOSw/ifA9mVCwEYf
         9hFtk0fdblKGrU+9S/I+TCBTeGMcgBxuEj0Bk0qBkvazWqnuSLQ+93HpJbr3/0B1jzS0
         S0eVQSHIcZLlzCiV9RjQ5nt0m9+8/k5cjTH5Ai+lQbc4vRs0z6TxIfETEnD+uTLAs/Nt
         szfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=liXzDHty2LnFJcMKxk02C+0oeRKUikAIP1A55D3oOH8=;
        b=di/k+kzhmIFWiGD4aY/v3WysA8OLbzuDxM+T80dIiWyJNT/FGsrZMVcaiDSO+whiPI
         MJC/fJWXgQYldibZTynG1gTc0UV2ort+BPHl7tZFvTp9ddlVxx4ecL16gQ5zpvJQD+8l
         4rJB81KV3zqVtQm2auvKdjUinMXNRqiYW0tHltbEUby1LorxiW/xSOnerfeoznUHJ/AC
         Z3CB/lUmlg7CW4rZ1S9xH0CYKSdEfqu+sOXChPe1ZqYCZTE86qMTj/z/+NfD5sUOTU7o
         yd73niWcvOXO5Ij9n+PM9r4yNnRlp1yfBmcUTPXxl8BSq5YPYpdl4JOm3qI4nGSO0ymr
         N8aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=dCLrueCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si500252qvp.104.2018.10.23.08.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=dCLrueCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEysT-0001Rf-Aa
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:45:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhc-0006fR-Ac
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:34:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybl-0006sS-RI
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:28:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50523)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybb-0006fV-CN; Tue, 23 Oct 2018 11:28:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj72HcRz9sN9; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308491;
	bh=8YbKSI9adBCLR2VR26upLqTli9oRKhW3fVU6j45wYac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCLrueCq9wUMbjz3Y4lSvR4PTkgvQPGm9JFPSQOzAGTj4cC/CxwdbAK7I55PRZQVX
	J7W1msF+Q0UBu/lhogZz+b8ayIlY06NwwY9onzoYposj8iUk6dTCFZfATEzrCNBegE
	RsGe2BG41fvR+HTXQMnJj8UXh8KL69pUgu+p/hrI=
Date: Tue, 23 Oct 2018 16:10:48 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023151048.GF12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-8-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SnV5plBeK2Ge1I9g"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-8-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PULL 07/45] hw/timer/sun4v-rtc: Use
 DeviceState::realize rather than SysBusDevice::init
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: imNuwamchONu


--SnV5plBeK2Ge1I9g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:44PM -0300, Eduardo Habkost wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Move from the legacy SysBusDevice::init method to using DeviceState::real=
ize.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> Message-Id: <20181002212522.23303-4-f4bug@amsat.org>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/timer/sun4v-rtc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
> index 13be94f8da..4e7f6a1eff 100644
> --- a/hw/timer/sun4v-rtc.c
> +++ b/hw/timer/sun4v-rtc.c
> @@ -63,21 +63,21 @@ void sun4v_rtc_init(hwaddr addr)
>      sysbus_mmio_map(s, 0, addr);
>  }
> =20
> -static int sun4v_rtc_init1(SysBusDevice *dev)
> +static void sun4v_rtc_realize(DeviceState *dev, Error **errp)
>  {
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>      Sun4vRtc *s =3D SUN4V_RTC(dev);
> =20
>      memory_region_init_io(&s->iomem, OBJECT(s), &sun4v_rtc_ops, s,
>                            "sun4v-rtc", 0x08ULL);
> -    sysbus_init_mmio(dev, &s->iomem);
> -    return 0;
> +    sysbus_init_mmio(sbd, &s->iomem);
>  }
> =20
>  static void sun4v_rtc_class_init(ObjectClass *klass, void *data)
>  {
> -    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> =20
> -    k->init =3D sun4v_rtc_init1;
> +    dc->realize =3D sun4v_rtc_realize;
>  }
> =20
>  static const TypeInfo sun4v_rtc_info =3D {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SnV5plBeK2Ge1I9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPOfgACgkQbDjKyiDZ
s5J+JhAAh7or1/RlU9cSgOZRATifkzxV152kZy9r/PCiqv+YvVmbExMG4SKQVM5A
9XMNWws43h6i6NsDrc7uyJ0Bo8EmGc5SZD+KphcajjxGmMSrd7WC2CKJEnJRtdnC
r6yMQJyNb/cv14LMfT1TchfEqcQ2I9SIVhfDNbTNzFX14baIPENgoO0tx0OMM6Rm
SOh3mWzKoTHCCwuS5V8HUU7vjnWMsPjyId3euchhWJQPJr3Lb5qZD2fMB4YehIoC
DsRqHPXYrtMmLLloepjn4yQY97j5bBF0LSp4o3OVl78ofIDyd53JekRmv7Ak4zTl
hZRaWM4vC8F79Yg8WYpIJJCY49s1ZsDJuOtCDPQjxONzGkWPsYkXH4Hb9cHW1GYc
pA3Cm1HaW0IENDIyMlTNWBofAh1Is9ApNrK76JAoOKMSA/xGei9SUQ0fXFI5iw3J
xcRLlWw1WipAmNHl5NB/29TecNEx/QHOe+OeW1n1r459InqFVS2+H7YOLWHE92VP
81Out1uXRJfXEgm5o6YQn7M/7wIfNb6QfDDv7Ra8dsCvWYZe/xBW6+DFdK/AzI+H
DTxyz6x+5B4zFWqWZeq3udCFVrin+q64nOcSBoW350Dau40BfZ487c8jLWORWmTg
ZViLxFZ0OuksVKuhYSss4psms7h+HxvGQm8Dtk+J2kv+dSUvgbw=
=QKK4
-----END PGP SIGNATURE-----

--SnV5plBeK2Ge1I9g--
