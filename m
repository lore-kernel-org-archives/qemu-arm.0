Received: by 10.28.71.27 with SMTP id u27csp2438766wma;
        Mon, 5 Feb 2018 04:44:23 -0800 (PST)
X-Google-Smtp-Source: AH8x224QP9SUI9FyGZHGdLpCAxwEcHDH8AeTtqv1EgwGn6luGl+F6MMCliUA/RU9Oso4K4PIG981
X-Received: by 10.129.106.4 with SMTP id f4mr30860581ywc.424.1517834663338;
        Mon, 05 Feb 2018 04:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517834663; cv=none;
        d=google.com; s=arc-20160816;
        b=rrvJJlzlYP7E6jpXVKujBJrRKb0Hcc2hExQygld1wH6CvxOW79ENjDKrQnyKztx7Q/
         3SXHGucdTwmbvDaH6BfiykFOOPUNKZ1dkyP/NXs9ecWLHtmm2ZjLSPe2GN/6IaQlkWKa
         dvkEkRxfwpZ0QgBPVY/Ttg4DXanD+fC0KCyhgZ2EPfaYgyy6SIMFLMzJ+5pMsK2wwn1U
         zCVgTQbZQCW+BzIbCuMO5QUouNJAU+Emck9duqEw71KQT4aQFuUkqcDmNOBlzTrPF8RP
         OFDWIr7MQeSZrv8dEJXGPDARrxUwUqK9YTZupFVnijuEkp60wcdgBak7asgvr/Afd2o8
         nYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=fJ4wvr0sLaxJffOq+eGKzvOty8Vv1im6HwJyTRTuOvU=;
        b=pGdWV6GGf2qIFdOgdYIKsl8Q1cmru4XzGI5HPNkI/gfeMQbePdskobCeAbIZWt99GC
         X4RZ8/Fd26H40axOpg6/R9XoELFhDjuh4tlyMzNhEigpPAaArDM6fdtLAijksC9opiCC
         sc91AH6IHNnV/qQMeEQSSraAMjMDEmOnLc4R2z8ejzwaG2KDrs5jY38I5t1iUdKFqpbF
         JMQUZ0jOxWHzyPzF/dcX6HzPTavN045akMgl92/hJbH8CY/ygh7ry2KqypqE+TQFgZ2w
         iAfMziUdWpOR/sSvHp5ATVV6TKXKXtjGfvkFezWK+WhwiLU4SUfGHiRbYcOX2pGuiRf7
         WIlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xe3cGQYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r204si1446548ywr.790.2018.02.05.04.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 04:44:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xe3cGQYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eig8E-0007oP-NG
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 07:44:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eig83-0007lW-Qc
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 07:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eig82-0006zd-PT
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 07:44:11 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34233)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eig7y-0006w2-52; Mon, 05 Feb 2018 07:44:06 -0500
Received: by mail-qk0-x244.google.com with SMTP id m130so7357351qke.1;
	Mon, 05 Feb 2018 04:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=fJ4wvr0sLaxJffOq+eGKzvOty8Vv1im6HwJyTRTuOvU=;
	b=Xe3cGQYVdV7zOZcqjCKFDCKcDZU55FOCPO0qsT1NmxJr2qMJn1lVoodXK3Ii2r+S8w
	G7EsrhpuxhnR9CvfXj0Od2Ro7fJ7bPAPdRwOVqGJ7CoYBW/tqOKfJBTymrLUQ7ziO5Y0
	Jb5MRg8K5Uo7rsERBtDd9JM3fhCJKvW0xv0V4QheybQur6FTqSu5hF2AHtJFj3a1OUt8
	zQtkCJHC0GcBhzbOMaMWRp077FvkzWWi/YN+tnchUxXLokIeoq4YPjs64pOw+XacGxS3
	PN0e/Bu4P8quWxNjYF7CXfp6fPSDrbXKus4XmIbfmbKxZ5G+Y+W7gaQ3YtN1NOjs07Er
	7M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=fJ4wvr0sLaxJffOq+eGKzvOty8Vv1im6HwJyTRTuOvU=;
	b=d6q28rvQqAPfu5A/ZgyuC4mFkKqlyMniUWEdt9hlc37GYWN/dI6eR+RIuZL95FN0kt
	ym7GyR+XcnGYojXYmRRHJF+SvZ7Mj9j9WMvNjEXCrhipUJENLNidTVO0WJfGfycIcX9C
	kiF/4ISwMrhgUCE6PuZXhfH42MILP6wPuequLsR9N70uBIkAW427/Noxq/uFjinZ8ifw
	fG6PDRbRsvJwRgYehiRnWl/8dK7/XiTf2aLgIDxL7/qUxSoPqXsUUnTZ6Y8uSptSv7Ws
	0B95YLt2m3wibLyPpyQQo05A4vL7EOi393SBTFp6b8sWGVTA1ozz3VWtr35+yCbtNl1+
	mMvA==
X-Gm-Message-State: APf1xPCI1wjfV360kkXsS4eMT/WSh7kELY2QCyQZKZyMcuN4pNFIvWkl
	5X/7iuMhomrg+V2tOU/B5hWwL9Gs
X-Received: by 10.55.19.19 with SMTP id d19mr19202852qkh.356.1517834645372;
	Mon, 05 Feb 2018 04:44:05 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	n11sm5611221qkn.18.2018.02.05.04.44.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 04:44:04 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
	<20180205105720.14620-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4bee993f-c7fb-5b2e-a966-7322ff269870@amsat.org>
Date: Mon, 5 Feb 2018 09:43:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180205105720.14620-2-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="bTqPZxR14QwoL5lYXxKelidQsWWZCwPux"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/8] hw/intc/armv7m_nvic: Don't
 hardcode M profile ID registers in NVIC
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cA5efGLqOeRD

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bTqPZxR14QwoL5lYXxKelidQsWWZCwPux
Content-Type: multipart/mixed; boundary="bcl8BHXU3vM0q11LofPVTTlEKZ2rNc9Hd";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Message-ID: <4bee993f-c7fb-5b2e-a966-7322ff269870@amsat.org>
Subject: Re: [Qemu-devel] [PATCH 1/8] hw/intc/armv7m_nvic: Don't hardcode M
 profile ID registers in NVIC
References: <20180205105720.14620-1-peter.maydell@linaro.org>
 <20180205105720.14620-2-peter.maydell@linaro.org>
In-Reply-To: <20180205105720.14620-2-peter.maydell@linaro.org>

--bcl8BHXU3vM0q11LofPVTTlEKZ2rNc9Hd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02/05/2018 07:57 AM, Peter Maydell wrote:
> Instead of hardcoding the values of M profile ID registers in the
> NVIC, use the fields in the CPU struct. This will allow us to
> give different M profile CPU types different ID register values.
> This commit includes the addition of the missing ID_ISAR5,
> which exists as RES0 in both v7M and v8M.
>=20
> (The values of the ID registers might be wrong for the M4 --
> this commit leaves the behaviour there unchanged.)
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  hw/intc/armv7m_nvic.c | 30 ++++++++++++++++--------------
>  target/arm/cpu.c      | 28 ++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 360889d30b..63da0fee34 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -990,31 +990,33 @@ static uint32_t nvic_readl(NVICState *s, uint32_t=
 offset, MemTxAttrs attrs)
>                        "Aux Fault status registers unimplemented\n");
>          return 0;
>      case 0xd40: /* PFR0.  */
> -        return 0x00000030;
> -    case 0xd44: /* PRF1.  */
> -        return 0x00000200;
> +        return cpu->id_pfr0;
> +    case 0xd44: /* PFR1.  */
> +        return cpu->id_pfr1;
>      case 0xd48: /* DFR0.  */
> -        return 0x00100000;
> +        return cpu->id_dfr0;
>      case 0xd4c: /* AFR0.  */
> -        return 0x00000000;
> +        return cpu->id_afr0;
>      case 0xd50: /* MMFR0.  */
> -        return 0x00000030;
> +        return cpu->id_mmfr0;
>      case 0xd54: /* MMFR1.  */
> -        return 0x00000000;
> +        return cpu->id_mmfr1;
>      case 0xd58: /* MMFR2.  */
> -        return 0x00000000;
> +        return cpu->id_mmfr2;
>      case 0xd5c: /* MMFR3.  */
> -        return 0x00000000;
> +        return cpu->id_mmfr3;
>      case 0xd60: /* ISAR0.  */
> -        return 0x01141110;
> +        return cpu->id_isar0;
>      case 0xd64: /* ISAR1.  */
> -        return 0x02111000;
> +        return cpu->id_isar1;
>      case 0xd68: /* ISAR2.  */
> -        return 0x21112231;
> +        return cpu->id_isar2;
>      case 0xd6c: /* ISAR3.  */
> -        return 0x01111110;
> +        return cpu->id_isar3;
>      case 0xd70: /* ISAR4.  */
> -        return 0x01310102;
> +        return cpu->id_isar4;
> +    case 0xd74: /* ISAR5.  */
> +        return cpu->id_isar5;
>      /* TODO: Implement debug registers.  */
>      case 0xd90: /* MPU_TYPE */
>          /* Unified MPU; if the MPU is not present this value is zero *=
/
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9da6ea505c..223361fb50 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1146,6 +1146,20 @@ static void cortex_m3_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_M);
>      cpu->midr =3D 0x410fc231;
>      cpu->pmsav7_dregion =3D 8;
> +    cpu->id_pfr0 =3D 0x00000030;
> +    cpu->id_pfr1 =3D 0x00000200;
> +    cpu->id_dfr0 =3D 0x00100000;
> +    cpu->id_afr0 =3D 0x00000000;
> +    cpu->id_mmfr0 =3D 0x00000030;
> +    cpu->id_mmfr1 =3D 0x00000000;
> +    cpu->id_mmfr2 =3D 0x00000000;
> +    cpu->id_mmfr3 =3D 0x00000000;
> +    cpu->id_isar0 =3D 0x01141110;
> +    cpu->id_isar1 =3D 0x02111000;
> +    cpu->id_isar2 =3D 0x21112231;
> +    cpu->id_isar3 =3D 0x01111110;
> +    cpu->id_isar4 =3D 0x01310102;
> +    cpu->id_isar5 =3D 0x00000000;
>  }
> =20
>  static void cortex_m4_initfn(Object *obj)
> @@ -1157,6 +1171,20 @@ static void cortex_m4_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
>      cpu->midr =3D 0x410fc240; /* r0p0 */
>      cpu->pmsav7_dregion =3D 8;
> +    cpu->id_pfr0 =3D 0x00000030;
> +    cpu->id_pfr1 =3D 0x00000200;
> +    cpu->id_dfr0 =3D 0x00100000;
> +    cpu->id_afr0 =3D 0x00000000;
> +    cpu->id_mmfr0 =3D 0x00000030;
> +    cpu->id_mmfr1 =3D 0x00000000;
> +    cpu->id_mmfr2 =3D 0x00000000;
> +    cpu->id_mmfr3 =3D 0x00000000;
> +    cpu->id_isar0 =3D 0x01141110;
> +    cpu->id_isar1 =3D 0x02111000;
> +    cpu->id_isar2 =3D 0x21112231;
> +    cpu->id_isar3 =3D 0x01111110;
> +    cpu->id_isar4 =3D 0x01310102;
> +    cpu->id_isar5 =3D 0x00000000;
>  }
> =20
>  static void arm_v7m_class_init(ObjectClass *oc, void *data)
>=20


--bcl8BHXU3vM0q11LofPVTTlEKZ2rNc9Hd--

--bTqPZxR14QwoL5lYXxKelidQsWWZCwPux
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlp4UY4ACgkQ4+MsLN6t
wN7k1Q/6AmXe4zDG8Bo8mAcBlY54AGS6B2ZhAeTFFa98JhEFVqbaayt812PcdgJf
G/PlFToeVF6M5XoEdz2ZS9DO75g7cWYQ9DFaZgUY5wy3jZ+pCffCaHgcYOslVA7V
twFXZ4LHZBF4ZLNPc3VBepeAMlOtgD82zYzKIFwdsPr2QVqDBZ0uXSGk+qLjA6mc
1ZSYGFaZR6jB43teXNARzXiZhlayH0IxzZFk5JRg5qd9gaXxkfg9xaKlp/8EWyMd
1t6dtav5N2Sr9wQep/gaOKZlXxHGwA9/qR9iScjdCurCQI/yivmfU1mqFPQxIGVm
LkmYRUOkn4mKnb+LsC4+IjLtv5pLMDmZwLES6OFoa17BwMpRMe7GeLw4bAXAUEyt
4brSGFSIykBCztK7XyVM2wn/sGop/+PZ13jXqYSfu54Q4Me9po4Oj4Xb/i4bNIvO
JXiESTQLx6AYCbslTkiBQbCrpyzsDFgyUvSrnJ7CNm5S0cfnV/HprZPPXbCKhwu/
dVOScxHxmWV0c38R+Z1fZ5RWDOFfg+5f5ot7Sbo1m7X4g5Zt5eSqTKyv/3jSJWV2
t6Hzgo+bObGVWkjMHnQ7LQXtho9GSw5WR1FhC9AF86jgA7CVTRTXJS6OAjhBI1BQ
hQVIh8CcuCSEHW2PDFSB51f3KCEPXF5aIlmscGEXEHPMBw4HevQ=
=Veyz
-----END PGP SIGNATURE-----

--bTqPZxR14QwoL5lYXxKelidQsWWZCwPux--
