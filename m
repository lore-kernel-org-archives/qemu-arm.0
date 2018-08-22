Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2830225wrd;
        Wed, 22 Aug 2018 01:31:26 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzbyDG2CMhxnyIl7RZ8gM0vzHDWaQpXAbS8wjR1eX6TzihQV1n2au2giSY2UBz0wa4cDn64
X-Received: by 2002:a37:5d84:: with SMTP id r126-v6mr49535327qkb.155.1534926686397;
        Wed, 22 Aug 2018 01:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534926686; cv=none;
        d=google.com; s=arc-20160816;
        b=Yu7IVaZ8iEoy9wa07d51tc1Y3r3g6WCdC5eZ0+kRTP+V5bsTY6OUwlYF4xM+rRRP0A
         c0ttaZj+z9085FnRswoi2pdWvPlwUu+85g9j3f8lmY9po31oCbGYEBLyn3/uYwxOM8tI
         rOiCmADdUGOrghKZ1V7pfK2020F8QsaMMO6WaoU/fdQuIADnBBpccXDDntQdtJ3DIxIA
         7LTgIOIf/ee0xCRKwsHw4VlrnlEj/OMjkdXO6Oy4U2xDJoey5RgNksjjaEm+QY4E8VF1
         Q8P3Ni/M3tW+c/1IgnKSxD/A9MoFINvj0V+LIfuhH/LiUyPEfq5M2IgYQ1ldoil30VJl
         dHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=JlAqtRmmTwqO9WvjSu5yesz7YRuJbeqyVBBfnNANW84=;
        b=kTU78eqvz09gBSrYbiKrLf6h1Q9j209A5gSTljOw0ZxMR5wNZlBnc5zXgnWIlCkJcH
         ttvYzhH5+VLBsgPRpcN1ZajHUubTyeUqYorPlxjM7Uub4+dQjyVNBJQvEwZ4ZtGag/mH
         bJuN9AwuFZ7ROUzvqPvrrCewH0dRbgl9udJcnNHIrz0lns/POF0YS0atLUUlcRH6nofu
         1tCdm7uHcbXwZH3gWgWlGcQwCB7Ko98q7hgEKJJ6LR3rVnZbk6ut4NdVYzPEHdWn05W9
         rzwDCijcnUVSKbn5xuFuTcYtwFI7KLGfYookJS35lH0XBrPSo9ZOr9MnNrlt2whGf7fL
         TDjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=se3QTDRR;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Jq6KgAM5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Jq6KgAM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20-v6si442850qtp.307.2018.08.22.01.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 01:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=se3QTDRR;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Jq6KgAM5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Jq6KgAM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsOY1-0002U5-QN
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 04:31:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOTW-00075o-Kv
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:26:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOTM-0001xn-Eq
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:26:40 -0400
Received: from greensocs.com ([193.104.36.180]:40840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsOTL-0001x2-1p; Wed, 22 Aug 2018 04:26:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 84ED8DFFF5;
	Wed, 22 Aug 2018 10:26:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926394;
	bh=ro43H/qNKdugpoBmacBMAHPW1VmX4GJqq3DvOO3KEy8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=se3QTDRRm40NGOsid5cQcrSwNcL04Qnzu/mn8T54xLKWRZOLxNcZEosmdtPLUAnKl
	g6mz+c8SIOLyLN4dfyyH7Fc9f5mWON77EnSBGO+UhgZAxI2ulYbO1XIHwvFYJ8J2s1
	okKH3UDJnvQDXtiBTidqEfoCyjYBAPFeWZlm+2J8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Jq6KgAM5;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Jq6KgAM5
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_fcPJVgH729; Wed, 22 Aug 2018 10:26:33 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 3B090238729; Wed, 22 Aug 2018 10:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926393;
	bh=ro43H/qNKdugpoBmacBMAHPW1VmX4GJqq3DvOO3KEy8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Jq6KgAM5tksf4SSTcOBwQcdV+Kh5S6KNK2OXpcEPfUL1wYz3vhq6sAKKU7tGud/yF
	4zAGN2b3uiQyA+aasDYZ3cKjvDbunjRg5exDkzOemM2rb3ftnccHA9021+2k3CNQcY
	0wG+A/cLiChWR+Ok+JzBn77ajsTkTvdi4D8WH5Ns=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 00F79DFFF5;
	Wed, 22 Aug 2018 10:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926393;
	bh=ro43H/qNKdugpoBmacBMAHPW1VmX4GJqq3DvOO3KEy8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Jq6KgAM5tksf4SSTcOBwQcdV+Kh5S6KNK2OXpcEPfUL1wYz3vhq6sAKKU7tGud/yF
	4zAGN2b3uiQyA+aasDYZ3cKjvDbunjRg5exDkzOemM2rb3ftnccHA9021+2k3CNQcY
	0wG+A/cLiChWR+Ok+JzBn77ajsTkTvdi4D8WH5Ns=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-5-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f724ba64-30e5-d1eb-89ee-b85425733a99@greensocs.com>
Date: Wed, 22 Aug 2018 10:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180821132811.17675-5-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3CPjHXtSHGh7z7JZCWPSpf8opm7NpjskL"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 4/9] hw/arm/highbank: Connect VIRQ and VFIQ
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
X-TUID: QXkZ1C/d+kTJ

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3CPjHXtSHGh7z7JZCWPSpf8opm7NpjskL
Content-Type: multipart/mixed; boundary="0v3ZjAdcKCSShnVQ0NWaOBX15IVHbfuc0";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <f724ba64-30e5-d1eb-89ee-b85425733a99@greensocs.com>
Subject: Re: [PATCH 4/9] hw/arm/highbank: Connect VIRQ and VFIQ
References: <20180821132811.17675-1-peter.maydell@linaro.org>
 <20180821132811.17675-5-peter.maydell@linaro.org>
In-Reply-To: <20180821132811.17675-5-peter.maydell@linaro.org>

--0v3ZjAdcKCSShnVQ0NWaOBX15IVHbfuc0
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 8/21/18 3:28 PM, Peter Maydell wrote:
> Connect the VIRQ and VFIQ lines from the GIC to the CPU;
> these exist always for both CPU and GIC whether the
> virtualization extensions are enabled or not, so we
> can just unconditionally connect them.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/highbank.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index 6d42fce2c37..fb9efa02c35 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -243,6 +243,8 @@ static void calxeda_init(MachineState *machine, enu=
m cxmachines machine_id)
>      int n;
>      qemu_irq cpu_irq[4];
>      qemu_irq cpu_fiq[4];
> +    qemu_irq cpu_virq[4];
> +    qemu_irq cpu_vfiq[4];
>      MemoryRegion *sysram;
>      MemoryRegion *dram;
>      MemoryRegion *sysmem;
> @@ -282,6 +284,8 @@ static void calxeda_init(MachineState *machine, enu=
m cxmachines machine_id)
>          object_property_set_bool(cpuobj, true, "realized", &error_fata=
l);
>          cpu_irq[n] =3D qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ);
>          cpu_fiq[n] =3D qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_FIQ);
> +        cpu_virq[n] =3D qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_VIRQ);
> +        cpu_vfiq[n] =3D qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_VFIQ);
>      }
> =20
>      sysmem =3D get_system_memory();
> @@ -329,6 +333,8 @@ static void calxeda_init(MachineState *machine, enu=
m cxmachines machine_id)
>      for (n =3D 0; n < smp_cpus; n++) {
>          sysbus_connect_irq(busdev, n, cpu_irq[n]);
>          sysbus_connect_irq(busdev, n + smp_cpus, cpu_fiq[n]);
> +        sysbus_connect_irq(busdev, n + 2 * smp_cpus, cpu_virq[n]);
> +        sysbus_connect_irq(busdev, n + 3 * smp_cpus, cpu_vfiq[n]);
>      }
> =20
>      for (n =3D 0; n < 128; n++) {
>=20


--0v3ZjAdcKCSShnVQ0NWaOBX15IVHbfuc0--

--3CPjHXtSHGh7z7JZCWPSpf8opm7NpjskL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9HjgACgkQd8knW3Qn
Tr7LDw//eidxfLDqEHUtEwIEiMQJScK4eIdgfZFHyeRlaROL4fL1UvqEvQm/TQ73
dg39ETwhjtxmfFOKSXpM6QEmmXfOSBZlzn3iI4hmk1U17Rc9lqIzPljB9JgXiIPw
e3qSLeA4deOWywXBqHwmVV53kpEkBEq6Q/AIR5oeBkOAhiEP8M+g/Wj6cn7b1Ytj
RniV4Cln8mD0vGyxh2PiWCBvIF3idjCkRKu/rnRT75G/WSnMYsMsUXHor2ZN/SkA
wm8ppyYQxN4kMgDVr3UXMOys/c9BVBYqqG5EFgLmeVfKRtRGaRvpI80ZlWy6VpLw
IR3EEWBmCaY6x5Hje6LvPCZB9afPq67bxpj6Zak7UWWLm+99NvO9W+nzJ1ptHXBZ
UlUoAMzjiFuF18USQMpehTln7PmPPX7WOgCao8rbiqdQp3uuzzxqpFId7OwJ4Vro
54TFPQsAcrz7qLG5nJfz5U6ADMex9qnO8IfiRkZEgH7F4/E7flrSKblMmGRx/JSw
nWRmaD57gJ8KnLTiHY8ecJ5KOUYuM7eYMS7v72WrzaviZrhHkCdzhnwzEWsPxXql
3sVeKNPJaxS5dm6rGH9e0s1phE7uTFvDz7ANkX7U7OIp4OYjUGETPwW8v5rnf69D
IKQDLm0kxwLnQhRmBeuMS/jGqaGr9h1pvIASiI1C3jnNdP1YGK4=
=TRoT
-----END PGP SIGNATURE-----

--3CPjHXtSHGh7z7JZCWPSpf8opm7NpjskL--
