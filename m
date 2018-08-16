Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1563729wru;
        Thu, 16 Aug 2018 00:59:02 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwXe+Ww3CkydO2ktbDZZAs6CuBh1TnZa9KzHV6rxGHnu2TTZmKejB1RT7CYZ0AHdEYpvbho
X-Received: by 2002:ac8:2c9c:: with SMTP id 28-v6mr28886984qtw.420.1534406341968;
        Thu, 16 Aug 2018 00:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534406341; cv=none;
        d=google.com; s=arc-20160816;
        b=GCxXSpAbArX50tvzqRBKMneacAP/2c3TcxDMP5wKvEwYvB/jksN18CYc/QH2+nyky+
         Rg4MVE55dR5Z917RYT0JThCh3PWy2ySfXUxBkZUkPJxd8wiVUQVSNeGi88b6lRLkVYwQ
         0omQ+qCwXaPD9vvYIFE0Ks7V+2sv+KNRZnpvVKr9z77LdK55wlTxkrekzY3HXvr/Q80G
         Z9v9M7UKbHEGmpllb9jgNZtpxT+QLYWFaI9JjqNCUhIgWhnh+4EJqbO1cG/btv9Ny7iW
         IAvOzcSr0VqbHNSvyMacVr9p+X/VRlgbEhMhV+nQehURIyWjI9PeDY7ZCeZr6IYb2E8t
         cKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=J+9TAsuKS8azaZmNtrQjZ8ounCBWkJqv7cWGTnJVbNo=;
        b=sxol72Lopxc1IzUdsV6WSbgm7Oa7M17UeSsruQKCJSrASVE+Z1VJXc+w1rm6ULPj1Z
         QMRzJ/EDVKwXRKnNzn12F4X+cHkzAa7yw3jUZ4q3cJcOguzoLdP7h7IFw2VIG5GAKqtf
         FtlLHLlRNUL3XxPCEyHJkV7UpAXj0BJ9K9iOztBXLpRr2mKyv23TCxqpSpysgE3nZ8hD
         AJ2Pt26OeFpgzz5kpLr/02Ff7OBcqB+ZxI58C6KmPXDqMMiNDarMwQSB3CHYOb5G65Pl
         D5t93GWgrRvblrlYNBShHjfUGNx9avcDPl/pf3mdtCMezSSEr78MIvvCjhTTxxAAxLh7
         0e1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3c9v2jZE;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=JOThe46s;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=JOThe46s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h47-v6si984644qtb.396.2018.08.16.00.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 00:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3c9v2jZE;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=JOThe46s;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=JOThe46s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqDBN-0004yx-H6
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 03:59:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqDBC-0004yb-Te
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 03:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fqDB7-0004lh-M6
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 03:58:50 -0400
Received: from greensocs.com ([193.104.36.180]:49513)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fqDB7-0004iG-05; Thu, 16 Aug 2018 03:58:45 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 8C6EC2386F1;
	Thu, 16 Aug 2018 09:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534406317;
	bh=8Cui3JpV0A2ANLh1B9vRMhT61YeqRJ2g0C3E0WojJ8Y=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=3c9v2jZE16wyx3iSJcA48nfQTo9eZO8q2oXlqxPJhEtNWadNavEU0XPt2mppeQxum
	nisWcoP9IRbqmlW2G7NcnqqUsO6+r/aoTaoqDbld8FAGHbiiV8XVwA4pc5Eqei0HNl
	yy4LjtpA2jh4mhT7VrwMh5XZrrfNyILdvBvsLZt8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=JOThe46s;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=JOThe46s
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGWYxNaMls03; Thu, 16 Aug 2018 09:58:36 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 706B523870D; Thu, 16 Aug 2018 09:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534406316;
	bh=8Cui3JpV0A2ANLh1B9vRMhT61YeqRJ2g0C3E0WojJ8Y=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=JOThe46s+9rFQIq+LvEIlXl5c6qKdnL6q1X9nOYGw37jsI62EFussfnl71aRQ12n9
	QGVhkphooUM3hJ49jr8JUOHcce93xKdqTOupn60WKPalspb4XayX4q2IKUnxPbubTL
	GOnxfehhjhE/+JwLsR4wUU9/2Zr4+w+9qCDh/4VA=
Received: from [172.16.40.3] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id F22562386F1;
	Thu, 16 Aug 2018 09:58:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534406316;
	bh=8Cui3JpV0A2ANLh1B9vRMhT61YeqRJ2g0C3E0WojJ8Y=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=JOThe46s+9rFQIq+LvEIlXl5c6qKdnL6q1X9nOYGw37jsI62EFussfnl71aRQ12n9
	QGVhkphooUM3hJ49jr8JUOHcce93xKdqTOupn60WKPalspb4XayX4q2IKUnxPbubTL
	GOnxfehhjhE/+JwLsR4wUU9/2Zr4+w+9qCDh/4VA=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-9-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <191d7d48-ed11-ae83-f776-ddf0b935646b@greensocs.com>
Date: Thu, 16 Aug 2018 09:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180814124254.5229-9-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="irU1cVSBqZwgVQraAa9XFkoEjIuTjhgmg"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 08/10] target/arm: Permit accesses to ELR_Hyp
 from Hyp mode via MSR/MRS (banked)
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
Cc: edgari@xilinx.com, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n9g0e5C8ONI0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--irU1cVSBqZwgVQraAa9XFkoEjIuTjhgmg
Content-Type: multipart/mixed; boundary="DlobBPktsvmvj5zXsXP81iuNuMehFrAcW";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, edgari@xilinx.com
Message-ID: <191d7d48-ed11-ae83-f776-ddf0b935646b@greensocs.com>
Subject: Re: [PATCH 08/10] target/arm: Permit accesses to ELR_Hyp from Hyp
 mode via MSR/MRS (banked)
References: <20180814124254.5229-1-peter.maydell@linaro.org>
 <20180814124254.5229-9-peter.maydell@linaro.org>
In-Reply-To: <20180814124254.5229-9-peter.maydell@linaro.org>

--DlobBPktsvmvj5zXsXP81iuNuMehFrAcW
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 8/14/18 2:42 PM, Peter Maydell wrote:
> The MSR (banked) and MRS (banked) instructions allow accesses to ELR_Hy=
p
> from either Monitor or Hyp mode. Our translate time check
> was overly strict and only permitted access from Monitor mode.
>=20
> The runtime check wo do in msr_mrs_banked_exc_checks() had the
"we"
> correct code in it, but never got there because of the earlier
> "currmode =3D=3D tgtmode" check. Special case ELR_Hyp.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-By: Luc Michel <luc.michel@greensocs.com>

> ---
>  target/arm/op_helper.c | 22 +++++++++++-----------
>  target/arm/translate.c | 10 +++++++---
>  2 files changed, 18 insertions(+), 14 deletions(-)
>=20
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index d550978b5b9..952b8d122b7 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -611,6 +611,14 @@ static void msr_mrs_banked_exc_checks(CPUARMState =
*env, uint32_t tgtmode,
>       */
>      int curmode =3D env->uncached_cpsr & CPSR_M;
> =20
> +    if (regno =3D=3D 17) {
> +        /* ELR_Hyp: a special case because access from tgtmode is OK *=
/
> +        if (curmode !=3D ARM_CPU_MODE_HYP && curmode !=3D ARM_CPU_MODE=
_MON) {
> +            goto undef;
> +        }
> +        return;
> +    }
> +
>      if (curmode =3D=3D tgtmode) {
>          goto undef;
>      }
> @@ -638,17 +646,9 @@ static void msr_mrs_banked_exc_checks(CPUARMState =
*env, uint32_t tgtmode,
>      }
> =20
>      if (tgtmode =3D=3D ARM_CPU_MODE_HYP) {
> -        switch (regno) {
> -        case 17: /* ELR_Hyp */
> -            if (curmode !=3D ARM_CPU_MODE_HYP && curmode !=3D ARM_CPU_=
MODE_MON) {
> -                goto undef;
> -            }
> -            break;
> -        default:
> -            if (curmode !=3D ARM_CPU_MODE_MON) {
> -                goto undef;
> -            }
> -            break;
> +        /* SPSR_Hyp, r13_hyp: accessible from Monitor mode only */
> +        if (curmode !=3D ARM_CPU_MODE_MON) {
> +            goto undef;
>          }
>      }
> =20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index f845da7c638..3f5751d4826 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -4506,10 +4506,14 @@ static bool msr_banked_access_decode(DisasConte=
xt *s, int r, int sysm, int rn,
>          }
>          break;
>      case ARM_CPU_MODE_HYP:
> -        /* Note that we can forbid accesses from EL2 here because they=

> -         * must be from Hyp mode itself
> +        /*
> +         * SPSR_hyp and r13_hyp can only be accessed from Monitor mode=

> +         * (and so we can forbid accesses from EL2 or below). elr_hyp
> +         * can be accessed also from Hyp mode, so forbid accesses from=

> +         * EL0 or EL1.
>           */
> -        if (!arm_dc_feature(s, ARM_FEATURE_EL2) || s->current_el < 3) =
{
> +        if (!arm_dc_feature(s, ARM_FEATURE_EL2) || s->current_el < 2 |=
|
> +            (s->current_el < 3 && *regno !=3D 17)) {
>              goto undef;
>          }
>          break;
>=20


--DlobBPktsvmvj5zXsXP81iuNuMehFrAcW--

--irU1cVSBqZwgVQraAa9XFkoEjIuTjhgmg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt1LqUACgkQd8knW3Qn
Tr7rmQ//bFe09MUm2UXJWB5J7qRDvZoTtq7KKroHbAoeEBEIIJeVgltgd5ZZg1SW
1MGX5Edk++MDsMYQlx4MdTnPkwnP/Dec597i8KcaP4iXoiGTvaKhibvrIaghknkO
SnTF90a1uSPbcJixOyKQ8nMyn3t1YV5b25xouC/y2cbdM3tShY5o4RZKXgQIe3IL
ThxHwo07v7hfEagEMu3LkwVDm/KifHwwuzOd+ttpe9Xnu9K4BlPPOWnTZCkuazBU
eKiwIWCa6RgSSITqMC6xiGdQg1P49Ao+QXItGBM7PemSm+o9QACkI4MtQZqmLtvB
IA8T5ZU+5/CytQfGfPB9d11X1R9tv3KzQtvnxPMhw84pCUv+/jy4qyaYyFSTSIbo
4LU1K3KMlsjTEWTUv6euMo18a+yydO/3O+Fgqs/uzIAaOYmk4pIe1FoYFKaOQYOy
V85Z0qcxEWkYIWKoaBeIIxyS9eEabJ2Vk/VeVaO6hSzZ7PtQ49HcTffhGhS96l0B
YzEUkFrMHr94YLxnWuqHn78HTwD7hU6eLUShge+1r1L8jk9YQ4jLOeA2di4jihXw
wUVt6j1pUeLuA4rQdgPKy1cZPwv6WRHrxdCAAVcXM1sPoZuLkRbiqN/tmqfaizSc
ZdpRPaIs1Q5iDiaHhdOv9nNlwyXS4/R5m7P+3ZmfNoTn3Bi5mlU=
=ryVX
-----END PGP SIGNATURE-----

--irU1cVSBqZwgVQraAa9XFkoEjIuTjhgmg--
