Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2830699wrd;
        Wed, 22 Aug 2018 01:32:01 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdasJd0rjKG7gSO1VzNUGLflCJOz4bqzmEaZIx9pe1XSYB2Papc7r5EUH32j5nulx9fE12nB
X-Received: by 2002:ac8:1b5b:: with SMTP id p27-v6mr6451332qtk.99.1534926721565;
        Wed, 22 Aug 2018 01:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534926721; cv=none;
        d=google.com; s=arc-20160816;
        b=TQrt1HzpdUQYpVs3ArGKjk/BNZczcVapDUe3FceU1SSDLgVYlxK1S1xS4YDSJW6mSA
         4cq9CqUXu5H2aE6snl7UTt07Jhl1S3+N0WLvkOTxu69CmjJRXdJnNLfIfQpt+vlsGRPV
         Te3ZHyKDhIYPLOgDOrmQvHq0P/EpcQ/EwxVwXBfK0ZsHfa9d9NpBjyizTxkQT6ArH3Lq
         5nena28FWkXJ/yogrvUVWpTuynmZzsZee17ClVExILGA6jlWctrCpYFVkK/hMjoOYeun
         7W7tWfmVmNMt/WZmkW1cA/nhQ8dcFyDeqAJros+uYv+EyeysEIikxePr7XMBoL2/SUtP
         ACEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=kqfWFrW5hxGt9Vz4LPH0uEVqu2+8eUKm+UGHiiv+QEo=;
        b=E9JP0BslKuQ/Pleb3v36j2SXiFt14x6s1yH1tURFLvee2i4qNU8gYKUJFpmwj+bx/5
         HOBWf2+OpfqWlVhzVenpVIrkQouCLwn4CFLg7TA6UT/6/UXii9elxM8ZjppVdEhlDTtQ
         2viH43skBwwtHI2DEEit7KKsi2qJ6z9aWM26zryqFZ4VYtxz9Uun5WF2wteJ43+NwDss
         6jYZVqPBcgFetbI8g++HJUCRD3/gyljCjwrOnRo7+7Nxz4KzQ3eAmT+F5mPDpL9e7Qvo
         IysoVrpqCLv9k7Mc9tYZ2om/yX/E9akAM7OdUrwoHGpIQFkNFhksr60k/qrZswcooOxX
         3HzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L+k2GQDJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=A8YnX4KO;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=A8YnX4KO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l45-v6si1142423qvg.30.2018.08.22.01.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 01:32:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L+k2GQDJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=A8YnX4KO;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=A8YnX4KO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsOYa-0002vu-Vf
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 04:32:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOUB-0007fw-Tb
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:27:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOU9-0002R1-P2
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:27:27 -0400
Received: from greensocs.com ([193.104.36.180]:41129)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsOU5-0002KN-6s; Wed, 22 Aug 2018 04:27:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2C26EDFFF5;
	Wed, 22 Aug 2018 10:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926436;
	bh=aPbaD+NxRLpyjZbp39tRma21BVx8P8S1a3dM5rQ/enI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=L+k2GQDJ+/6YHacTpOy6P782LV9aOb423elSXcwTdkGT3+BpWbCqcXFnI+11jF5nz
	o+GRsYeyYNRwNX5rpcjtFgjQ//XTfC8Qwqsf2nDWBduQH4rgRFScBbFbgJX/G6TCYb
	5yfX9oSV0QtAx6VWefVQTXqKSTCS36ZOiaNtlTT4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=A8YnX4KO;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=A8YnX4KO
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6WrnCtx3B4m; Wed, 22 Aug 2018 10:27:07 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 8B98B23874A; Wed, 22 Aug 2018 10:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926427;
	bh=aPbaD+NxRLpyjZbp39tRma21BVx8P8S1a3dM5rQ/enI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=A8YnX4KOhbjvDSMsa0BnncRqq6WblnjXjljfsyI6k3taT9Jmf+wupvIW+uMEIH+XJ
	e2MCZWWr9MwBYjPSoD82SF6AgB+/ePhNEXrjE9q0xvvwSKIo+rmi1CU5L9z9mUHf1K
	5BbZcs2m+SUOCeQxLYUk/2QE4yZYzVA49i6Xj9qM=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 449FBDFFF5;
	Wed, 22 Aug 2018 10:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926427;
	bh=aPbaD+NxRLpyjZbp39tRma21BVx8P8S1a3dM5rQ/enI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=A8YnX4KOhbjvDSMsa0BnncRqq6WblnjXjljfsyI6k3taT9Jmf+wupvIW+uMEIH+XJ
	e2MCZWWr9MwBYjPSoD82SF6AgB+/ePhNEXrjE9q0xvvwSKIo+rmi1CU5L9z9mUHf1K
	5BbZcs2m+SUOCeQxLYUk/2QE4yZYzVA49i6Xj9qM=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-9-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <ca7da7bc-2bcb-f99b-7606-32e16afd9e2a@greensocs.com>
Date: Wed, 22 Aug 2018 10:27:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180821132811.17675-9-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="l6Ra2MdfSdB3BqlULtqZq3Rqj6mUHruH2"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 8/9] hw/arm/vexpress: Don't set
 info->secure_boot if CPU doesn't have EL3
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
X-TUID: rNkEksKu/5oD

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l6Ra2MdfSdB3BqlULtqZq3Rqj6mUHruH2
Content-Type: multipart/mixed; boundary="qEkCCtKcS2H9uaZQQoVsjCQUr3v6WVM0G";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <ca7da7bc-2bcb-f99b-7606-32e16afd9e2a@greensocs.com>
Subject: Re: [PATCH 8/9] hw/arm/vexpress: Don't set info->secure_boot if CPU
 doesn't have EL3
References: <20180821132811.17675-1-peter.maydell@linaro.org>
 <20180821132811.17675-9-peter.maydell@linaro.org>
In-Reply-To: <20180821132811.17675-9-peter.maydell@linaro.org>

--qEkCCtKcS2H9uaZQQoVsjCQUr3v6WVM0G
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable



On 8/21/18 3:28 PM, Peter Maydell wrote:
> Don't request that the arm_load_kernel() code should boot in secure
> state if the CPU doesn't have a secure state. Currently this
> doesn't make a difference because the boot.c code only examines
> the secure_boot flag in code guarded by an ARM_FEATURE_EL3 check,
> but upcoming changes for supporting booting into Hyp mode will
> change that.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/vexpress.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index dc47ed84c20..3631f4de3a4 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -705,8 +705,8 @@ static void vexpress_common_init(MachineState *mach=
ine)
>      daughterboard->bootinfo.smp_bootreg_addr =3D map[VE_SYSREGS] + 0x3=
0;
>      daughterboard->bootinfo.gic_cpu_if_addr =3D daughterboard->gic_cpu=
_if_addr;
>      daughterboard->bootinfo.modify_dtb =3D vexpress_modify_dtb;
> -    /* Indicate that when booting Linux we should be in secure state *=
/
> -    daughterboard->bootinfo.secure_boot =3D true;
> +    /* When booting Linux we should be in secure state if the CPU has =
one. */
> +    daughterboard->bootinfo.secure_boot =3D vms->secure;
>      arm_load_kernel(ARM_CPU(first_cpu), &daughterboard->bootinfo);
>  }
> =20
>=20


--qEkCCtKcS2H9uaZQQoVsjCQUr3v6WVM0G--

--l6Ra2MdfSdB3BqlULtqZq3Rqj6mUHruH2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9HloACgkQd8knW3Qn
Tr7QYQ/8D0/+Lh1Nyz2Oku1dQ/wsgjHIxgHn/iZ+E88XDZSevqZV78NqJ15nfZWv
Pz8AVP3XyOcqEQH4q0wkxy01we7qKDJDiThLdT9oPHseWN37dCiiqOtKa3V7GRaZ
N0MfkUCcYohdG9ce7q5fIFyrQN2ZN/Ro93vWoJm3we5/lWb6H2aFOJguST5LO1W/
UsIbM3f8mVQG5vsjf9Fv6sDErSMHvLezPyP10N5IF+70WZX1t6vBAzVgPRP6gToN
jxVO/g3tKmBvZQqdUURWfwOJF+HF1t9OA5fREsxj9tuS53nWvXk0a/gqAjGnn6CD
j1XUV0WNEnz/UfDyafILQ8ux1ni6awxOhKZ2NE6Ji/W68/AkI6aub7BUycZycHyG
Y87dXBF8UmiH/UPYNEpWzXfxr/vQvAHkUoFpgCTgrgimodmzw044B1K7tzd7L79u
4bdDWbESKJCPjYCHCmpDE86jaYk2HgbnvoGbRTZpAkgUQ0XhQbVhNZzsCj4rFOJI
PDd9XK/b1Z0Xzrf6XP3NOE9TKHcOoWFtGa1KHCXqtxpNdsJukZmnjNXQf++sEcNX
UgGl4Rsx8RYkxOiECWZeDJzXhM/3osCs9ryaRVHnQs9B/wAVMcmjcxci8pVBRzja
pSmpTgfOLneAO1LYbaX+CqHOCh142BZLWPZKGV/iYSzHUfzp4Bs=
=BPRe
-----END PGP SIGNATURE-----

--l6Ra2MdfSdB3BqlULtqZq3Rqj6mUHruH2--
