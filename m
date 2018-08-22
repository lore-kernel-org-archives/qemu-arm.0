Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2826165wrd;
        Wed, 22 Aug 2018 01:26:15 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYBIH6fnUOQd8cMxLdjsfqzHPSIBJeUKfotXX9Lh153CwXSO9PX46/uw/3I1yvGPNmERF79
X-Received: by 2002:a37:6d0:: with SMTP id 199-v6mr16317906qkg.71.1534926375262;
        Wed, 22 Aug 2018 01:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534926375; cv=none;
        d=google.com; s=arc-20160816;
        b=nibTD5f/wcXZRuu1IAGcsblaHEdKDfmp8hQO6ti7gEAXv/yrPejagOdQZkRhPXdFLZ
         wm3FVFP4RrmQZUZfI7ETXCKc1OwALcIE/C0A/IroCFByNmF4zPAYTjeUVoNbD5ktrExp
         rBaeQ8jJd1KEq3qZKnllMDRrOr7I5gASHPpe3fu9U4QSemaaTBdGVR+/wG2iPi3K/zES
         Cq4O5vddcSdoZjrpHnaJAJ5NkjtpLvYkY20eI6kg0vrXlu9XIcCn3dAmWJ3c+1Pw70p4
         Qa7ZxMSxnH2USX72l8xNv9DMHP6CIhFfZw35hFk6E00Ljwz83/W3VKk7YrrUUtKWzIi3
         H6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=Gn9lIOxUgDttu2FY8wjIg+GH4ej+rPBTyYL8ip92GX0=;
        b=H2jjlX1OZPT8fMyilhrVD28EYAciLZM7ADNLhSOyiCWJE/x4gUeeDvT02k6AObYRM8
         fu+iGtxmWXQLnbUsIqPlLWL3bIkaEeRcqoF9wxyCrQs+2kEX8DLS2acy2lVv4W+sKcs1
         XlDuu3pX/VRG4XDCglnRPzvzoShDIz9Aoxv7znRO+sEXfbumKf7Za4yIg036Z/CY6+Uo
         JKz01jR9bo6qBUgp5RgzYiZXDLTFHsN3djRT7ARUnNuG/TKH4M6P9/ZVKchqu9NTVVdD
         qxVUwRN07SHvIb3Kz3zoqlOno7Fk9kGDwXDfPwxzHR19UbOV5b2w90V0ObP4bA8cZrnB
         hsUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aY3n6byH;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aY3n6byH;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=P0attwvh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si976160qvj.191.2018.08.22.01.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 01:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aY3n6byH;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aY3n6byH;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=P0attwvh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsOT0-0006cT-Lh
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 04:26:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOKa-0005vL-N8
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:17:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOKX-0005Cx-7e
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:17:32 -0400
Received: from greensocs.com ([193.104.36.180]:37406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsOKV-0005Bk-Ds; Wed, 22 Aug 2018 04:17:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id D707ADFFF5;
	Wed, 22 Aug 2018 10:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534925846;
	bh=yGJ6J6iU+8KV8kwnKv1cOuokoQedr9mSf/if10JZAzU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=aY3n6byHHIp3c1mcT6xVxsVDAJ/QYuVVPDIEHaEKJhYkuPUWS43ugLIF2xjElwfQ8
	vYJChZdn6LOC4p0QQFwy5pFC6N8uOGjc/+8xr+IHM4dw/Bh8vR+2nkDRv03NneL2q5
	JN1hsv4KaYKEdZD2n9V5MMAHCtWvF4VgUcC+cqw0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=aY3n6byH;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=P0attwvh
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c458H5ftgiVT; Wed, 22 Aug 2018 10:17:26 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 1410F23874E; Wed, 22 Aug 2018 10:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534925846;
	bh=yGJ6J6iU+8KV8kwnKv1cOuokoQedr9mSf/if10JZAzU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=aY3n6byHHIp3c1mcT6xVxsVDAJ/QYuVVPDIEHaEKJhYkuPUWS43ugLIF2xjElwfQ8
	vYJChZdn6LOC4p0QQFwy5pFC6N8uOGjc/+8xr+IHM4dw/Bh8vR+2nkDRv03NneL2q5
	JN1hsv4KaYKEdZD2n9V5MMAHCtWvF4VgUcC+cqw0=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B3DA7DFFF5;
	Wed, 22 Aug 2018 10:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534925845;
	bh=yGJ6J6iU+8KV8kwnKv1cOuokoQedr9mSf/if10JZAzU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=P0attwvhH3voNmNWC4VpURKqsAw2fKisvByMBFRSNmUAt39PwzYLy9M7oIoJvKeUQ
	dJlIy28dIaqzA/mjd705vjGzBlOFzDl5z2YzkVH6IFz+I8fBrNFoqxxz7EAtveGKD5
	5ezLItgU1WBV1JZwI5FEtaxRKE9doqzf/ByvPI58=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-3-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <766c6d21-6adc-e2a4-d299-f5ad69745081@greensocs.com>
Date: Wed, 22 Aug 2018 10:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180821132811.17675-3-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="GsnHEC6NylLgPIGC3GiRk6pwMOnRT3pLs"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 2/9] hw/intc/arm_gic: Make per-cpu GICH
 memory regions 0x200 bytes large
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
X-TUID: GwHwNYegOCWi

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GsnHEC6NylLgPIGC3GiRk6pwMOnRT3pLs
Content-Type: multipart/mixed; boundary="pzDvtmvjmW1elePImLdaYOrVxFdYKKAcl";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <766c6d21-6adc-e2a4-d299-f5ad69745081@greensocs.com>
Subject: Re: [PATCH 2/9] hw/intc/arm_gic: Make per-cpu GICH memory regions
 0x200 bytes large
References: <20180821132811.17675-1-peter.maydell@linaro.org>
 <20180821132811.17675-3-peter.maydell@linaro.org>
In-Reply-To: <20180821132811.17675-3-peter.maydell@linaro.org>

--pzDvtmvjmW1elePImLdaYOrVxFdYKKAcl
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable



On 8/21/18 3:28 PM, Peter Maydell wrote:
> Reduce the size of the per-cpu GICH memory regions from 0x1000
> to 0x200. The registers only cover 0x200 bytes, and the Cortex-A15
> wants to map them at a spacing of 0x200 bytes apart. Having the
> region be too large interferes with mapping them like that, so
> reduce it.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-By: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/intc/arm_gic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index c1b35fc1ee2..542b4b93eab 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -2084,7 +2084,7 @@ static void arm_gic_realize(DeviceState *dev, Err=
or **errp)
>          for (i =3D 0; i < s->num_cpu; i++) {
>              memory_region_init_io(&s->vifaceiomem[i + 1], OBJECT(s),
>                                    &gic_viface_ops, &s->backref[i],
> -                                  "gic_viface", 0x1000);
> +                                  "gic_viface", 0x200);
>              sysbus_init_mmio(sbd, &s->vifaceiomem[i + 1]);
>          }
>      }
>=20


--pzDvtmvjmW1elePImLdaYOrVxFdYKKAcl--

--GsnHEC6NylLgPIGC3GiRk6pwMOnRT3pLs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9HBUACgkQd8knW3Qn
Tr7OSg/9GDBuLCyKqQnz9/7ZtAV77g2T4zBXpsSZ4dsSv+kO0knsp++xkzaoN0kE
IMLyZdp/3P0oq9t8G8LMGrQB4HVh8xdjka9NQQgzBS5gM8FiKi32LXilX819kYvs
/2ZiEbgBNeeGndtkv4MI1WcX50e3ZkWSOxPKnuqOjpEuyi4WE0D2acsbTmYS+3iq
lol7hfZIyOSb2MMmUKE6TCb41M/mIQ8W7ReHraB0zqjOB2/x6/VkopR8ljTlAkeh
NNaDz2Z537gNHXSZESLzvsye6fCW+ab0qp/Z/j5R7caZsTqQhmcaf9QopdQQkD3I
LVeGOkakWXOQucRVFhRW6jA4CRmQd1fWWR3l/LfgmZ5u3FDF3MQvGL+eZXIj3nGY
NctFjEXGfmnRBU/zRFECeNLCjAKtidH7YXhF45uFlG0VMQqPCIDscCZoiDf3Bl+b
SyvHQRa5A17NYbUB3lCyVFF6Nenkn5cwrC6R593UoHn21WreDVq1rrCoXRWSIML3
86Yt7r3dLnlv1f2D5AiK1fkEJwaoUs+CINOHgrNJ7sgItBSO+/Iu9iRjVMK4ECfN
Kj9wDDqEKpPhr6A6b3U2tupQFrYNoeXK4dKGSBMin5h8FXAqgJBEfWlzKwITPKGa
wzfQ6CRonM87PtuoDNiTHveXbeyUIu/h+7jqXMHAy6czaJ3zW9M=
=bSc8
-----END PGP SIGNATURE-----

--GsnHEC6NylLgPIGC3GiRk6pwMOnRT3pLs--
