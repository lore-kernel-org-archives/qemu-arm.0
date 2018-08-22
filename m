Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2833538wrd;
        Wed, 22 Aug 2018 01:35:39 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyM6uCW9da3yhTcyJHEesHFemmPXUIgeyYfBmxRj2b5ov68hpaxklxjCq1FpKXNF7Bb2/rp
X-Received: by 2002:aed:3e25:: with SMTP id l34-v6mr8672476qtf.62.1534926938924;
        Wed, 22 Aug 2018 01:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534926938; cv=none;
        d=google.com; s=arc-20160816;
        b=muNTZO6M3YysCFrw/W+7d2WCaPD/nZknIeE3cU0hk804CHPdBAjpQgUO+cOJlV2Rgz
         ggi8fcVRDNzwom8YkpGeI1SdlcfXXFSi4nhCKqxySx14ML33DyFhLR1Yhb/mDpuomsCD
         kd98b8IYmHI3/SkMHCJqUkeVYTJQxe+FcbO4eolbjzpNIUwd5AcOTmKxviT5LBz70055
         6bq0GbXfbky/3masSUZzQB0Gh5A562mu0p3MnXbbRZX6NSzn88uq4dSdqxo86JSEypTy
         p/sa3FQoBsAWg93LZIf/w+rb8BBunwG9e6M4WVbKWl77npJlyHfhAB0qy6upVVV8M3/S
         +TLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=yl76d2j3FQSY53mhO0BivCasXmDF9cuaYErHPd8shSs=;
        b=GBcG9Dkv2ZbVAkEwmv5VnAH3DkIJA12XrJ2TrJ81hUnk+nPvtLlLljzD+1SMH4ClBD
         uwSomHikM47AZBVf80sa/9SfPYuNKNMeDIfTpNc+Luv2MXoXekAUGT+z0UnxZVWsEdY+
         PUya/QI/xDfK8sBcEqlSto9yhBgUr7UIDBAuVdzfH+NjfnEA8ZCTfXmy0tRl5eHMsuDQ
         iRTHuCDvDwzlkdZst+R7+j3k1BwHOI1NdCxE4AIPj9MiwdadojJ9AvcM/lOlZoZRmn1F
         j5+RLfRpo8yyKhXaocXZP2q0gWxKhUWyz3O8O4CKeo0ojb1arTRIfjKCCw67QWILVI26
         nFMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UXq49b1H;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=TK8s8G6k;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=TK8s8G6k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3-v6si1047187qvi.172.2018.08.22.01.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 01:35:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UXq49b1H;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=TK8s8G6k;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=TK8s8G6k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsOc6-0005jb-AQ
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 04:35:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOU9-0007dq-MK
	for qemu-devel@nongnu.org; Wed, 22 Aug 2018 04:27:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOU2-0002LK-3a
	for qemu-devel@nongnu.org; Wed, 22 Aug 2018 04:27:25 -0400
Received: from greensocs.com ([193.104.36.180]:40972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsOTg-00027P-V8; Wed, 22 Aug 2018 04:26:59 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 865AEDFFF5;
	Wed, 22 Aug 2018 10:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926414;
	bh=qQIG4WT1Zd/6GWcr6UBER5F6Q215Fp+S44yJEli4GG8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=UXq49b1HkrXPzi0Hthn0dvrpQzVZhxe+4fibPzr1lW/F6ffckjLHRPj+piDvnVasC
	DdNELlp+FXniIL/uUNhQsQ8Mvk3TZHe5EXPEEj+NSNRKua0X7C+kXDjZO3GbIeyRus
	PEJ0tkeCe9GGhU7C143zyVIhehcNXQdIWtlZmGqM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=TK8s8G6k;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=TK8s8G6k
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdqdefcTDQgO; Wed, 22 Aug 2018 10:26:53 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A6373238729; Wed, 22 Aug 2018 10:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926413;
	bh=qQIG4WT1Zd/6GWcr6UBER5F6Q215Fp+S44yJEli4GG8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=TK8s8G6k5nx/E0JtOA5KC5WzbzlvcQW9gZEIb61kheKz1Cej2PcwGyRJ1wNSJQKGl
	OMbYFDRKL4U5G8Bd0l8gnMaRhVjkHLcjTxXkwZpwydgXTtGmNSJ4u5lUc5r+RlUkal
	oX45LvrCAuLQzITZKJRD1gEvUnLeECJPNXgkNNkI=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6A855DFFF5;
	Wed, 22 Aug 2018 10:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926413;
	bh=qQIG4WT1Zd/6GWcr6UBER5F6Q215Fp+S44yJEli4GG8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=TK8s8G6k5nx/E0JtOA5KC5WzbzlvcQW9gZEIb61kheKz1Cej2PcwGyRJ1wNSJQKGl
	OMbYFDRKL4U5G8Bd0l8gnMaRhVjkHLcjTxXkwZpwydgXTtGmNSJ4u5lUc5r+RlUkal
	oX45LvrCAuLQzITZKJRD1gEvUnLeECJPNXgkNNkI=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-7-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9088c265-475e-a10a-0e7f-ad68525d628b@greensocs.com>
Date: Wed, 22 Aug 2018 10:26:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180821132811.17675-7-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="QoGn91AGytkeeo8pSL6cYLzF9KZOWsK9G"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 6/9] hw/arm/fsl-imx6ul: Connect VIRQ and
 VFIQ
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fvhEn0Z2Uizf

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QoGn91AGytkeeo8pSL6cYLzF9KZOWsK9G
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <9088c265-475e-a10a-0e7f-ad68525d628b@greensocs.com>
Subject: Re: [PATCH 6/9] hw/arm/fsl-imx6ul: Connect VIRQ and VFIQ
References: <20180821132811.17675-1-peter.maydell@linaro.org>
 <20180821132811.17675-7-peter.maydell@linaro.org>
In-Reply-To: <20180821132811.17675-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
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
>  hw/arm/fsl-imx7.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index d5e26855a55..7663ad68610 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -209,6 +209,10 @@ static void fsl_imx7_realize(DeviceState *dev, Err=
or **errp)
>          sysbus_connect_irq(sbd, i, irq);
>          irq =3D qdev_get_gpio_in(d, ARM_CPU_FIQ);
>          sysbus_connect_irq(sbd, i + smp_cpus, irq);
> +        irq =3D qdev_get_gpio_in(d, ARM_CPU_VIRQ);
> +        sysbus_connect_irq(sbd, i + 2 * smp_cpus, irq);
> +        irq =3D qdev_get_gpio_in(d, ARM_CPU_VFIQ);
> +        sysbus_connect_irq(sbd, i + 3 * smp_cpus, irq);
>      }
> =20
>      /*
>=20


--QoGn91AGytkeeo8pSL6cYLzF9KZOWsK9G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9Hk0ACgkQd8knW3Qn
Tr6Xzw/7BJWnXiK1IAwb1HZtMkkSjOvsjffWk15GXut7FsvioLBQAQiLvQQq6swn
Ng1gYP6mxesnOMuQiEgRXog+/+lUfg+jfd79jQ6MKIGi3KrO4RhZoLLJd7pprtYc
UBrhD9+rdGzp48Z33BAY3bf93ygIU40MUuv1IDexS3jlVRNOgv+5Mv4awVEhOPED
EmDvQMnucu79fvkX0tT/GACZ5n1U9swWfjtaugMUjNJreqMAIyRrGACTpmd/wAcK
xKDwlEKyDjLPGclVzuAGUvGJLHfhKixTtISlccg4p/7S9iC+SI87PP5vxaNaXtAW
by3dk2FWS0jElKi5p5W/i9p2AMy/rJrknPSC1aCkxybg4WJR0ZV5YaIrXvDV+dEG
i3WBwCzSJep7FqgLdAtHSAN68/VOGdcCWo0ohAXvo/9GoIorcimmPkyPmz5gR2nA
yesLaoTXaIOR/Cf22w8AEKYtK3S+KkjOiyBp2Jde6fXvh0pBca2sjS+xuD51U78O
1+F15TUQln3wDP4c/OLU6DOLTUxBQAn57RcKeoZV6kXfcHTe/P06cR1SQXYhW4tf
A5bMcHT2NspCGW6DkIWjbRndYqMKgGh2ufZTEkJDTkrG/fjtJkMnkfRMirNDo+2O
0MXATBfnb39VrgawW7V3Uf7Jy4fLH0yvBFJqba1whNHcNzQxjZQ=
=rtBk
-----END PGP SIGNATURE-----

--QoGn91AGytkeeo8pSL6cYLzF9KZOWsK9G--
