Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2830465wrd;
        Wed, 22 Aug 2018 01:31:43 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx50plJdewcknCgtw0nH0ExmnQHNvUg9YvPlASRg/pUMQhJ+RTZ2tsqrqntA3Yu6AVYlznG
X-Received: by 2002:ac8:528c:: with SMTP id s12-v6mr13667483qtn.311.1534926703275;
        Wed, 22 Aug 2018 01:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534926703; cv=none;
        d=google.com; s=arc-20160816;
        b=viemmK5l4cDC9+B/bMebwPIkibPSj/uGaG1uQC+74wUL/cg8PmgRFDxCD4U2qYZoTg
         OYdU48isfGgxzL7iYkzcMk9KkF1Z5oziidEu7HLzzyp2eSWKbMK2/J8ylgbeTQTXwbQz
         csKvVNhPszkYxUlgQV9wShaIKj3SJWYFv0lsWtbgy0IqLNZrCBzzHN2miGKfbHrFr1+J
         O7uQJXqjC01g78MOR0d1brxdyd2WAWnDTxV1jfekTINMeEv0KzyLbx6WXFM2fHkh8wkD
         La3zTAMFU9I22qesAXnJ4eA3/OI9bNOzcG7At5rjcOvxyTR5X0u/UnNVc+1ID8rnzv5Y
         FzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=xDWKBcE+F0HX2dSyc2dWEFOqud1lwiECQeCT6Kl1VxQ=;
        b=bMYNM8wHEA4JlyGzpJGH93vV3+h60B1WqMxmWTfKEJXiSTxo74pSTzsoEJ6Bv/YYsp
         rEY8ZvTXt+MqbWHFgwAGRAVqCJ+JefsYOnJBcVgRftQWyM7E9hrU1pzBJiNPARFTwlQS
         KfnLW3k+eGf3Mp8zl44u5/0fsHV8pMTFnOv2CKF/OTOVtFBr07QiV8W4wfpdPBs8x65T
         eoO+tWOITtCG5MtspNiZvGDNerZW7x3Q338IDSDZsSJnovarK7ltV3k1k0XbKLWS5dzF
         gNABFs/tX4rFEYv8XHOn2L6zzTVIpUnuocS2npvS5pAISHOaFkNhhWaR20NdgrEXp8+d
         fObw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2B4EAVaW;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="61te6/0k";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=JDHIPGrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2-v6si1149613qkj.62.2018.08.22.01.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 01:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=2B4EAVaW;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="61te6/0k";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=JDHIPGrx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsOYI-0002jX-Ml
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 04:31:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOUB-0007fv-Td
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:27:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOU9-0002Qw-PJ
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:27:27 -0400
Received: from greensocs.com ([193.104.36.180]:41132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsOU3-0002KX-VB; Wed, 22 Aug 2018 04:27:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3E71423874C;
	Wed, 22 Aug 2018 10:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926436;
	bh=Hxv292boke3KfEJMIp9c62ydD4DN2ZZyhiw3IfsjNIg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=2B4EAVaW0JSG4IC7/S4PTmTu5RpgOqA4Ozzfirwi7/F7eXKryMc3S5zUEZywLEWfY
	FV2zHdcyMcf7qI2AkRFa3PGvXKXEO+2EIlFMeZsG9226WMAabe3R7ZBbCX24klueg4
	AErFMZDM7jbJFrzdEwu35hPZpfTbHjoYW/rrQezk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=61te6/0k;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=JDHIPGrx
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQudbD6mFgbn; Wed, 22 Aug 2018 10:27:15 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 12461238729; Wed, 22 Aug 2018 10:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926435;
	bh=Hxv292boke3KfEJMIp9c62ydD4DN2ZZyhiw3IfsjNIg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=61te6/0kpCDkdtyzR9U1F3afV5LLQ0WSpXOo0jqbig3V5+93oIjuatkPa/lvl4X7b
	Q1To6M+O45gLL7I0UBLlyuutEEy01Y5/5A/ki97P9JzbEg3OHDt++zgogyZ4SXVkwY
	M8mxBW4yMpknFBacDTn6C+2NqQtUSYfVzVxie3y0=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CC67ADFFF5;
	Wed, 22 Aug 2018 10:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926434;
	bh=Hxv292boke3KfEJMIp9c62ydD4DN2ZZyhiw3IfsjNIg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=JDHIPGrxr/fbUgDghiiYsQNJRr112JMBFHUJl/uzXvTBjS6WcQ4neFyM+RMZ3LNj8
	urtzOaUYmb03CFxV1QFNcYk7H0487361yJR2S1sr7iPEZeCm9ixYVeWB4vNE7oj0yR
	OHMqJE2TlK60kexMsquD7w/xVleTiUjalLiyxTSw=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-10-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <fd18e480-a9ea-bfa1-bab3-d395fb9b6079@greensocs.com>
Date: Wed, 22 Aug 2018 10:27:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180821132811.17675-10-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="swI1fgIQCeOdDQ0EkmQjC3cL8UK87s06t"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 9/9] hw/arm/vexpress: Add "virtualization"
 property controlling presence of EL2
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V3HI/g5PFYI8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--swI1fgIQCeOdDQ0EkmQjC3cL8UK87s06t
Content-Type: multipart/mixed; boundary="HP3lyC3Kg45coMPMfHMfLjpPcY3E6ST6m";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <fd18e480-a9ea-bfa1-bab3-d395fb9b6079@greensocs.com>
Subject: Re: [PATCH 9/9] hw/arm/vexpress: Add "virtualization" property
 controlling presence of EL2
References: <20180821132811.17675-1-peter.maydell@linaro.org>
 <20180821132811.17675-10-peter.maydell@linaro.org>
In-Reply-To: <20180821132811.17675-10-peter.maydell@linaro.org>

--HP3lyC3Kg45coMPMfHMfLjpPcY3E6ST6m
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable



On 8/21/18 3:28 PM, Peter Maydell wrote:
> Add a "virtualization" property to the vexpress-a15 board,
> controlling presence of EL2. As with EL3, we default to
> enabling it, but the user can disable it if they have an
> older guest which can't cope with it being present.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/vexpress.c | 56 ++++++++++++++++++++++++++++++++++++++++++++---=

>  1 file changed, 53 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 3631f4de3a4..c02d18ee618 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -172,6 +172,7 @@ typedef struct {
>  typedef struct {
>      MachineState parent;
>      bool secure;
> +    bool virt;
>  } VexpressMachineState;
> =20
>  #define TYPE_VEXPRESS_MACHINE   "vexpress"
> @@ -203,7 +204,7 @@ struct VEDBoardInfo {
>  };
> =20
>  static void init_cpus(const char *cpu_type, const char *privdev,
> -                      hwaddr periphbase, qemu_irq *pic, bool secure)
> +                      hwaddr periphbase, qemu_irq *pic, bool secure, b=
ool virt)
>  {
>      DeviceState *dev;
>      SysBusDevice *busdev;
> @@ -216,6 +217,11 @@ static void init_cpus(const char *cpu_type, const =
char *privdev,
>          if (!secure) {
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>          }
> +        if (!virt) {
> +            if (object_property_find(cpuobj, "has_el2", NULL)) {
> +                object_property_set_bool(cpuobj, false, "has_el2", NUL=
L);
> +            }
> +        }
> =20
>          if (object_property_find(cpuobj, "reset-cbar", NULL)) {
>              object_property_set_int(cpuobj, periphbase,
> @@ -289,7 +295,8 @@ static void a9_daughterboard_init(const VexpressMac=
hineState *vms,
>      memory_region_add_subregion(sysmem, 0x60000000, ram);
> =20
>      /* 0x1e000000 A9MPCore (SCU) private memory region */
> -    init_cpus(cpu_type, TYPE_A9MPCORE_PRIV, 0x1e000000, pic, vms->secu=
re);
> +    init_cpus(cpu_type, TYPE_A9MPCORE_PRIV, 0x1e000000, pic,
> +              vms->secure, vms->virt);
> =20
>      /* Daughterboard peripherals : 0x10020000 .. 0x20000000 */
> =20
> @@ -370,7 +377,8 @@ static void a15_daughterboard_init(const VexpressMa=
chineState *vms,
>      memory_region_add_subregion(sysmem, 0x80000000, ram);
> =20
>      /* 0x2c000000 A15MPCore private memory region (GIC) */
> -    init_cpus(cpu_type, TYPE_A15MPCORE_PRIV, 0x2c000000, pic, vms->sec=
ure);
> +    init_cpus(cpu_type, TYPE_A15MPCORE_PRIV, 0x2c000000, pic, vms->sec=
ure,
> +              vms->virt);
> =20
>      /* A15 daughterboard peripherals: */
> =20
> @@ -724,6 +732,20 @@ static void vexpress_set_secure(Object *obj, bool =
value, Error **errp)
>      vms->secure =3D value;
>  }
> =20
> +static bool vexpress_get_virt(Object *obj, Error **errp)
> +{
> +    VexpressMachineState *vms =3D VEXPRESS_MACHINE(obj);
> +
> +    return vms->virt;
> +}
> +
> +static void vexpress_set_virt(Object *obj, bool value, Error **errp)
> +{
> +    VexpressMachineState *vms =3D VEXPRESS_MACHINE(obj);
> +
> +    vms->virt =3D value;
> +}
> +
>  static void vexpress_instance_init(Object *obj)
>  {
>      VexpressMachineState *vms =3D VEXPRESS_MACHINE(obj);
> @@ -738,6 +760,32 @@ static void vexpress_instance_init(Object *obj)
>                                      NULL);
>  }
> =20
> +static void vexpress_a15_instance_init(Object *obj)
> +{
> +    VexpressMachineState *vms =3D VEXPRESS_MACHINE(obj);
> +
> +    /*
> +     * For the vexpress-a15, EL2 is by default enabled if EL3 is,
> +     * but can also be specifically set to on or off.
> +     */
> +    vms->virt =3D true;
> +    object_property_add_bool(obj, "virtualization", vexpress_get_virt,=

> +                             vexpress_set_virt, NULL);
> +    object_property_set_description(obj, "virtualization",
> +                                    "Set on/off to enable/disable the =
ARM "
> +                                    "Virtualization Extensions "
> +                                    "(defaults to same as 'secure')",
> +                                    NULL);
> +}
> +
> +static void vexpress_a9_instance_init(Object *obj)
> +{
> +    VexpressMachineState *vms =3D VEXPRESS_MACHINE(obj);
> +
> +    /* The A9 doesn't have the virt extensions */
> +    vms->virt =3D false;
> +}
> +
>  static void vexpress_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -784,12 +832,14 @@ static const TypeInfo vexpress_a9_info =3D {
>      .name =3D TYPE_VEXPRESS_A9_MACHINE,
>      .parent =3D TYPE_VEXPRESS_MACHINE,
>      .class_init =3D vexpress_a9_class_init,
> +    .instance_init =3D vexpress_a9_instance_init,
>  };
> =20
>  static const TypeInfo vexpress_a15_info =3D {
>      .name =3D TYPE_VEXPRESS_A15_MACHINE,
>      .parent =3D TYPE_VEXPRESS_MACHINE,
>      .class_init =3D vexpress_a15_class_init,
> +    .instance_init =3D vexpress_a15_instance_init,
>  };
> =20
>  static void vexpress_machine_init(void)
>=20


--HP3lyC3Kg45coMPMfHMfLjpPcY3E6ST6m--

--swI1fgIQCeOdDQ0EkmQjC3cL8UK87s06t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9HmIACgkQd8knW3Qn
Tr7HvQ//Y4pw3ROnV8isIgrbS7K3IRmj99BCI3/R9u2z9xM6IxEh4N4czHcS/QIZ
jwPzJNKaao/6QizuDT5inkMGjpUBsO7bz9WkokfUHHAJK9zustTU2ofvbW/PGWmO
+4qS7hQQkHyB43WFOuc5QLtDcsmJoEef04hBFff62yji7eXYtyhUxGx1r3/4ovdt
k6or/as+/+r98OWWPkb4Co+NNMT4NvQP1t2yqNrQbgHQ6rakzg3225p0fLhB6/K7
7joKYIcyOM/zSnfSJzmTP0cna7PlqTuOe6I7p11O/PxUsGO+1Yly4+gAoCGYc1GW
qNDKdMB4NiJDLcfFELx1TtI014U6DgXh1T94NwIU0bg0U7GmUn6mpyvQBWo8I0xu
T3BN81kkyuFdYFzZcu8qFiIH07pbivIDNkjRS54Lbe6JyOKxs19DIdZaSzU+HMPT
b5LI1HGiyH+o+SfrfJMxRJDMc5jKJG9TYPaQw7RFDP30I2RowMBDZpqoxdg0UcRf
NciZamfWfSnpDEwG4azlVoxIxVIpuovnVEUog5xpmH3AdMz9aCNpmqvYAYwl7ni8
U+MW+zltFIGj7Pfz7AhrpBVaDdAFOcimREvlira+O/+h6aXxcpPUGP8zvJzQYdbD
ZMya2djuSPhpHej0pxkGwWs5oCMQXffReT1Ruq8zO/JCIVyfeEA=
=dHfh
-----END PGP SIGNATURE-----

--swI1fgIQCeOdDQ0EkmQjC3cL8UK87s06t--
