Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2828802wrd;
        Wed, 22 Aug 2018 01:29:50 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPznE5j1h/+e9+cn5C9HDJNzaUCyY3SY+4mScuurMbzePB3MOV7thfx5d4HYklQfN+nUyAPn
X-Received: by 2002:a0c:cdd1:: with SMTP id a17-v6mr48842284qvn.166.1534926590630;
        Wed, 22 Aug 2018 01:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534926590; cv=none;
        d=google.com; s=arc-20160816;
        b=xOjLe4QbCVmslfci4oI1VRSju/0dkxAvP7+xUMcWuN1Grl6AwY8S7JUy2w2NwbG7PL
         VwLBXYg+nhXtzjqLhwSbZ7YvUhe9ykWiAvpxDfycLVXxpHCydvvqaJ42OBQJialv0I1Z
         1nmn5OddJqGIcLg2k7fwFHQLVltN5RNvLjMiSieOii4Z+DNRiEsg4FhdSZt/TKIir0LR
         lvnNiaD8kkSW5jkbgXmvAD32fQjz2VRxh1kPH9mxBDcvQVmn9Vhe5Sx75ByXdNEQiZc4
         DxRwRXCDFLU+vmZTL53qFMYy3QuNuIV54/z9uY3D/bywr4te+QW3NslTvLqGvByfpJ8k
         wulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=V8tXGXsHN2Qk7zd/XOgwPbIF27Z3QWByQyB8pl2oYQc=;
        b=a8ZRI+9SlcvzhbH7aiE3QhZGgTP2V5CYJkZ2/aLKdoVKcfcmdiEHMGgkQ9JKkuhjPZ
         lrUw3OR5xOM5/PmvPIsYA6JkuX47pT9EBd1AAPG9x1yxAUVtH1sgpGWOiD6uqqbAn5O9
         foQfV6FzaQbLYuiBWi/Z0BqS7QpylWYbIKLynxyRqUVPEcif6CCmHp6VogmuLrGkRiQF
         1wgnwFRQiX+xb+opcHme2x0qRSnLKpsWFvbDHZn5VFg0Td4O1Z5GIDgVRA1o7BmBWaj/
         qQhhzgwB86hKTQC7sQczKB4yghc6e0qaagUi6w43uTZ2HMc7YWU0x/fRTf78yhM7tzY7
         648g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=AqTEBTf6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=l5GaMQdn;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=l5GaMQdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r76-v6si1086325qkl.279.2018.08.22.01.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Aug 2018 01:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=AqTEBTf6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=l5GaMQdn;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=l5GaMQdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57543 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsOWU-0000w4-3v
	for alex.bennee@linaro.org; Wed, 22 Aug 2018 04:29:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOTm-0007Kl-Uc
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fsOTh-00028I-2C
	for qemu-arm@nongnu.org; Wed, 22 Aug 2018 04:27:00 -0400
Received: from greensocs.com ([193.104.36.180]:40915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fsOTc-00023H-46; Wed, 22 Aug 2018 04:26:53 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9A75E23874C;
	Wed, 22 Aug 2018 10:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926406;
	bh=XLih+JLxfTOKiqf9WbknjaZHNoKZLQIoaicViX3MXY8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=AqTEBTf6DI+oCIF/TZpWh8cAkb+dbDnNS2gC5t90xeqfjwg6Ssw0Ase7O6iUz74Ta
	QTC3BToB3i+iIMQbKr0+AW5YK7or2qBRGBLKjl5f2snH7xQM5axDurPPPCoQgwlxnI
	9yDV8Spf/a0Q6SwCQkZzk+paBf+qURVgQGYzrE+Y=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=l5GaMQdn;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=l5GaMQdn
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2tt_rHSpKEB; Wed, 22 Aug 2018 10:26:45 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id BDEB1238729; Wed, 22 Aug 2018 10:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926405;
	bh=XLih+JLxfTOKiqf9WbknjaZHNoKZLQIoaicViX3MXY8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=l5GaMQdnMiyclqIzfOY7zDX7zulHJ9yWfqQF7Uawa8Q25sdbrjmQPlkDBxcZgWHf5
	B/AO5YL7LmzxqPzTMcFn5uU5RDboOboLuypJLl0V4v5eg2lAeKbmfND56uQALMs4r9
	OsgQG+74ZWArVEB+7xyNyvPx5mKGoglFgUNHZamc=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7D01EDFFF5;
	Wed, 22 Aug 2018 10:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1534926405;
	bh=XLih+JLxfTOKiqf9WbknjaZHNoKZLQIoaicViX3MXY8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=l5GaMQdnMiyclqIzfOY7zDX7zulHJ9yWfqQF7Uawa8Q25sdbrjmQPlkDBxcZgWHf5
	B/AO5YL7LmzxqPzTMcFn5uU5RDboOboLuypJLl0V4v5eg2lAeKbmfND56uQALMs4r9
	OsgQG+74ZWArVEB+7xyNyvPx5mKGoglFgUNHZamc=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-6-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	xsFNBFYyFyABEACxIM3H5/MVdqhQYYyw27qFMEYuXyxQWaTPDMajYmh/c1BwtXLR+J0wDinX
	MJeyZSgTlA2KUaJRf8k8ufpRi/+BYNi1a04z5hpiGHYL3RxqFBSsvRREt5Gk1bmIYgiINdyC
	TiSf6e2gczsvn6TDqpPsZip4qP0GwT5JuQdsrwzlr1oxC++E31JND4NXyz14piBqvAfM2XD1
	+YyTLVtJfUP/bkum77rDOW/CEXNfR4BNLFDJmJR23kAZ598biL8O8Yr5Wtnso1iiSugR7tP2
	8XX550AYQSmYH8FV4HeX5ziee+z2vjdVKBwDHGALU0P0kRBbzYhoJLFUAsvAVt67kf/F41l7
	M76oDCNPinP4xrrMSDSV46P9ygbYAV8z0njuh0GvAMz6F34n2d1csoyVnnc+xJfhJECj4Rpf
	gkuqWoJHwy8L2zQsB4B21vTxvgNOI/SLWtYr9pdtyZsdNAmdbXcSZElSCjOvsFECPuk1Fnge
	rbAVeXVtt1pkhwsbbD/ChuHv7PKc+HX1aiUWs6PHpIDBQVWpJxoTCMNompoqSq83iWOTFwvk
	k/90Qm1qc8qxCnstlvmSMUrtJNl/XleWCtf41EfRYbJoLzdzEbpAze4Ta8viRHRgpqUxAikE
	AWfsROJ+uBXSita8919/r1lSKgUNvK4dPgJp7oRhnBZBk1BcnwARAQABzSVMdWMgTWljaGVs
	IDxsdWMubWljaGVsQGdyZWVuc29jcy5jb20+wsGXBBMBCABBAhsjBQkJZgGABQsJCAcCBhUI
	CQoLAgQWAgMBAh4BAheAFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlqUA0oCGQEACgkQd8kn
	W3QnTr4DXQ/+PbmVLmhOaI5NGxJP+c3j/bjU1m/mnE7trwyWD5YjgewTd7Mo1t3Nk6+XQOjH
	Fz+3Etd05SD+9rOStOEjpLb0AXsWLvKZahDrJ/OsyOuTb2xI7BkVyW3OOCuMMcIsIbofUmAD
	dTJ2ujRgCd7mqWocXAwqAq5IVcuZ328e0zwXW5XJ5w37yxGKxLiDNMGtjLs+hK6DoDctwMyl
	EbahHubGdezOBsKpWPSh6HXDIV/Wg1SO0qxpHohoTp4/4uKkdJR08M/I7LoYeSc7V+dXdQMR
	DKffY88RezLs03nCcQaEnJA7nW6Uy6AClZUPkmxx+kEcm4CtVVmoEomljiM1YnTzS1pZTQhT
	KGGfy8JhO7dr/vGaJZwRm6qkIHot96KtyTH9W84eFMTETPrOVrCHc6kJUUymb7++xZ0xInhx
	aWAT8NSCdThd+dxa85MSHLYdX0tfI5rIruVhGTqa7Rhkg5sUCp5jDiOUe2ZAsc2bgMnPzrZO
	zvL50DTvJtOJdDoN+ZQNSK8gJ4qIXhBY+ZFXmguKjfW8Vp3jos1wJCzYm2QG9hnOCulaowbH
	yVyS+7MHLzWlbn3CdWMa87ejv5FmrZuZnSSLIV9YeZfghxz+Y/VVW1MGNdIOe/06oQxm/fin
	3+q6NW8wpuq73m2DrGm0PZlw5rqnysop7eaTeQOWSHHNw3DOwU0EVjIXIAEQALQgCoikJPdc
	nPi7wx3QHWwdG59rs8XQQEjnBqQBY2HnnFEZjaPUOfKRhYVrxcwNmjIVWauX1Razr3XPrUuU
	FqWRiFvrnya/LgHUB4CPTAwl3OpfFZ2B3er1F+qjslzyCHKnbU98eTBo9mF9LdeBUB9m4yUF
	6atcnwailWAqdfzkdrubxa4WZauD/D8dheeAiy5o370Xo9B79NMyqBm8xtONLE9Tg86AEiq1
	MuvDMZhWTvkTXai1+DkYBdH9UPs1HFDiDlFNe+JMolPt8XJJYvYgurr9NWhhSYtwAL9ERz84
	hkIWQfQQpv4G8aQ0o2jWrmfl8zs6ocKk7N+Lf3eYtwaCZ3UPdQGnQ7LA8m4ihZLlXiO8O+s7
	a1j6z8r43MFpA3WL45QB1qlaTeUIaHqS3GGAaSeqnI7B3MocE/g1KAmsFjT18FmvVWuikTUD
	5xNBLUIIZr5SCawawHNC7Kcb/UzpT8a0C9oN8s+7nJJR5s5M5y3zZ1fJRNgz0CIEIueRafU0
	26ZP7Ul1St6DHIF688g4jryxDd6+mh9Pw/Vby//J4bS41zNIUWFSWNZIYF7WsUEMIFyLgL1c
	vwkdiK1W3CIS5BdnqrahGeudtcRY5vKpZvgzx1P+Alklrq7ZvAn4Z2MfMbQjr9aDaNxDYjuk
	HAknRFqs+tM78eZHuzY9tTPFABEBAAHCwWUEGAEIAA8FAlYyFyACGwwFCQlmAYAACgkQd8kn
	W3QnTr4zbxAArmqKzXFscJiHqKrWcMKzrIb1RZGw+PDVD39iRbphmARZYfz+UoLSx4942K2r
	MVXYCMPVFt/10/eZmqvJ9KlIN38uLiZhTVTSFzFnr2pOggH4HYvpVKK7rm1J9fQBn/DJxkqa
	Ec5XNZZUA/tOHqhH+xbExU3Rx/Sn+OFIQxBcCf9FuPckvJv4EBGdpKjsX18BshuZ7/TgvyCX
	W5BxTplu5v3XUPTxDN/OcwkmmvD+pHrjj7umpakEA5qQFCY5rhrES/bYUblCjU754hYb9vpn
	D/8Lsri3M35sXavoK20v9QCkhT6He8/yDD79M4eclXVkLUm4Ij75AuWyIffCKOTO+pFIxUAO
	ndMJ+vlr/Uk0pbj+U7gyXxHVr4OTDfdt3t9RtzH0SD3j1rp9zpuSoIyowBwh9i0+Fx+iJk8B
	rkfp5koA5Fbt+M7oe7nQ18mlowRHzjoP5uJY7nTUwZ1/KLLfT1KiML4OvaS0F4ZTKkZFUzx+
	RQRqLclXLl1hUF7XxUYFDJG64ljAbaCpVL43OkziHejUeM1oC7fZg3U9rnEwnc/JEnCpsHS7
	bNHz5jlV9+JIV2sxFa1xVKZ0PdTRrZ4EuxO6CyXaOsjPGp4uqd+CWobc7wD77bFwdO+HQVt4
	yXDhZGT0TxMQKXHtw1paExHsZq1xw1GvaFsutGLyX2S71jQ=
Message-ID: <35949e51-b9d9-6914-8285-15797cb3b7da@greensocs.com>
Date: Wed, 22 Aug 2018 10:26:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180821132811.17675-6-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lrnG1M2Y4EX9NvhvQogiD1jyIrRRW9oDk"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 5/9] hw/arm/fsl-imx6ul: Connect VIRQ and VFIQ
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
X-TUID: 10oYc/DgJGD4

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lrnG1M2Y4EX9NvhvQogiD1jyIrRRW9oDk
Content-Type: multipart/mixed; boundary="drxE49lnG3ZE27i6r5xx2y1pTu8GLV7IF";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org
Message-ID: <35949e51-b9d9-6914-8285-15797cb3b7da@greensocs.com>
Subject: Re: [PATCH 5/9] hw/arm/fsl-imx6ul: Connect VIRQ and VFIQ
References: <20180821132811.17675-1-peter.maydell@linaro.org>
 <20180821132811.17675-6-peter.maydell@linaro.org>
In-Reply-To: <20180821132811.17675-6-peter.maydell@linaro.org>

--drxE49lnG3ZE27i6r5xx2y1pTu8GLV7IF
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
>  hw/arm/fsl-imx6ul.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index 258f4706234..4b56bfa8d16 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -207,6 +207,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, E=
rror **errp)
>          irq =3D qdev_get_gpio_in(d, ARM_CPU_IRQ);
>          sysbus_connect_irq(sbd, i, irq);
>          sysbus_connect_irq(sbd, i + smp_cpus, qdev_get_gpio_in(d, ARM_=
CPU_FIQ));
> +        sysbus_connect_irq(sbd, i + 2 * smp_cpus,
> +                           qdev_get_gpio_in(d, ARM_CPU_VIRQ));
> +        sysbus_connect_irq(sbd, i + 3 * smp_cpus,
> +                           qdev_get_gpio_in(d, ARM_CPU_VFIQ));
>      }
> =20
>      /*
>=20


--drxE49lnG3ZE27i6r5xx2y1pTu8GLV7IF--

--lrnG1M2Y4EX9NvhvQogiD1jyIrRRW9oDk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlt9HkUACgkQd8knW3Qn
Tr7hoBAArSaKzfEjaLKs9qPF/MT703dXmAyz2D7JIBIW09TET5pJEbAVzoK2PZ5G
Ohrb0Qs6fZLj5btNYHx7YbL3q8gBiTBnjyxu86+6ekr/lJ4OG7dA1uWWFbadeO0X
SXxsMdP822uXzsmuIpsHxwQsfj9Dx2KlNrtTU3pUF7L/A3genR4fwPnjZbhdCLgP
Q0JZKQa0FKDYhJDEtJlfljmAgcooR8S4xN0PySkoh6gLFs/r8wZHyeyIgPTRdRxm
FA5gKlEdVT418wugS9+F4fBkrjdm4ZmFnU78doFKPePUpb6AcrF2oEsRbkIwZB8t
oXnUShlObPz3lBr+UbQkEz3P0sUVxoE7yrRCQfxSwQORQI3doMsT9Q1MfgLVoyD9
vbGIzV4eZI2K9DyOoCkFsMtg/EAasOOqdaWSIMbdH1++tDAer2KJAh+INZ/dAOF5
glpnp4PsQseov21PGjXGsgattMsioC751AnSxS75rhZkEyFTAWj9FLKD7XoIihjT
6I/S+lSFTVimR2jCdeuo5NChWsDha2NQsijIrPrkIwv4oRrwhyoQ+Soe2JOwU1Mj
JaTWi2T6upemo5eKQPrPbHBHtknj2dsj0gnI/S558ah3zjQzxPUWAvd4OpY8G+cO
RUoxovLu9avmeOLmV1PzcYTCiDztrLO4zqeU7YB0o2LRqBZ89Q0=
=kqCq
-----END PGP SIGNATURE-----

--lrnG1M2Y4EX9NvhvQogiD1jyIrRRW9oDk--
