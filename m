Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1921997wrt;
        Thu, 10 Jan 2019 07:12:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7qLDl6yvNsZdTQxMt6qALvYEyMwO1tua7Ho0rVM5ZvpqbUhoZ+jDM8VmWA+LqHgNZ6VtOi
X-Received: by 2002:adf:fc09:: with SMTP id i9mr9243364wrr.299.1547133163757;
        Thu, 10 Jan 2019 07:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547133163; cv=none;
        d=google.com; s=arc-20160816;
        b=aar0CM/Qn+5uCt9/xNftKjpSGpvbNd/kTciIzkDQ9skBJLvnTkY5eWRs/KHrh/0vbt
         Ik8WfIaNBOlJt5zsw6S6SYdohC+BF18r2XhS/y3cSBwH+YoIJot6j4AEl6Zm9Yz2QNix
         T7bK09xSlC+T0Wv/6/LmZYz3o3KlqM9+0HN8sI+2+Z55kqD2A76DDhjCFRFKR1rx1fJ3
         tFLi+bxQG9irf12gPW4DsupVQFf63DbI7uWB4hm7dZQmumr1bBlRIIvGXLGX5nqPMw2J
         EV2AVAfiyeQB0wLpJwouWpHIAJbmvV6v0sRRXVKJ6Vg8kmet4XucY9gFE8zkowfKRNxR
         Z+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature;
        bh=9hYeIJCf3UQR1zlOL4jlb3YPPbHuWHol5gOJLG4ceiA=;
        b=SOYYyffiz3Y30ErQNPiJEx65dK/nKwBqa4nh/wZldYoOw9FYMDEaNx+I7aiRP9dYdX
         GD+/Lc84jZ6kViHVML1oKaFqn3NSzUMFk4AgmMY2zna5/dNFEY0BH3ZSIt8k248m2rsw
         eddR4yBQ3LoIIU1pS/VwpJl1yQrF5c8VMMllOC2vqQsk0cKGPvIqeoo6giYOOzo11lS6
         xP1LYIJYRLuLPZrePANVCWVmJWfaDQUb5JE9KOEGCa3PZVPlB8t4d7Xk7nXP8u0lNnk5
         34K4dasgJ9LVHcYlQtRNvWCNA35S4qpHBeQnsm0PghSiEZMYkECo7fKJMQE46C3Qt1f7
         bA3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Y33++kq0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yUazbHH+;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yUazbHH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si41344741wrp.174.2019.01.10.07.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 07:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Y33++kq0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yUazbHH+;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yUazbHH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:46482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghc0g-0000KQ-KZ
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 10:12:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ghc0P-0000HY-QA
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 10:12:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ghc0K-0004EA-2h
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 10:12:23 -0500
Received: from greensocs.com ([193.104.36.180]:33084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ghc0G-0004BC-GS; Thu, 10 Jan 2019 10:12:18 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BFD58441964;
	Thu, 10 Jan 2019 16:12:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1547133122;
	bh=Sx1O2v8c1mxcDlu24sb8XuvzRWiq8Vqb3FR/UJ+6yVU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Y33++kq0Vjl4IlEgw6COxX5diBfiKYr03gdRL6LHp6B6FKdoNMnGYmAL4MsvxreyU
	nqok506sSpgla+3sZAqt3bJ/1G1nKnmUgzeYUl8TC50Sq4rimsPmLhKWAV6tCZ1hII
	n5LCqtsALUcdIzcOPCJtsKuzw4IMWbiWo/DG7/zg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=yUazbHH+;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=yUazbHH+
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvGC-9tJQg4Z; Thu, 10 Jan 2019 16:12:02 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id D3986440FBB; Thu, 10 Jan 2019 16:12:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1547133121;
	bh=Sx1O2v8c1mxcDlu24sb8XuvzRWiq8Vqb3FR/UJ+6yVU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=yUazbHH+dAwoUADWPcMCsoERoxSpwLfHlzyOwG7t/g4KY3RHPEVnRHdaoIFjEkIPd
	Z222Phlt8k7xhKT/2B5iFiT7duqXXjf1H5W8CVxi0TgEQ6fCbMeX4QPO4juVjSN68J
	/mRzkU7jVupLR95mwsQPHep13PzR14zJPJmEICdA=
Received: from [172.16.11.100] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 45404440FAF;
	Thu, 10 Jan 2019 16:12:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1547133121;
	bh=Sx1O2v8c1mxcDlu24sb8XuvzRWiq8Vqb3FR/UJ+6yVU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=yUazbHH+dAwoUADWPcMCsoERoxSpwLfHlzyOwG7t/g4KY3RHPEVnRHdaoIFjEkIPd
	Z222Phlt8k7xhKT/2B5iFiT7duqXXjf1H5W8CVxi0TgEQ6fCbMeX4QPO4juVjSN68J
	/mRzkU7jVupLR95mwsQPHep13PzR14zJPJmEICdA=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-2-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	mQINBFYyFyABEACxIM3H5/MVdqhQYYyw27qFMEYuXyxQWaTPDMajYmh/c1BwtXLR+J0wDinX
	MJeyZSgTlA2KUaJRf8k8ufpRi/+BYNi1a04z5hpiGHYL3RxqFBSsvRREt5Gk1bmIYgiINdyC
	TiSf6e2gczsvn6TDqpPsZip4qP0GwT5JuQdsrwzlr1oxC++E31JND4NXyz14piBqvAfM2XD1
	+YyTLVtJfUP/bkum77rDOW/CEXNfR4BNLFDJmJR23kAZ598biL8O8Yr5Wtnso1iiSugR7tP2
	8XX550AYQSmYH8FV4HeX5ziee+z2vjdVKBwDHGALU0P0kRBbzYhoJLFUAsvAVt67kf/F41l7
	M76oDCNPinP4xrrMSDSV46P9ygbYAV8z0njuh0GvAMz6F34n2d1csoyVnnc+xJfhJECj4Rpf
	gkuqWoJHwy8L2zQsB4B21vTxvgNOI/SLWtYr9pdtyZsdNAmdbXcSZElSCjOvsFECPuk1Fnge
	rbAVeXVtt1pkhwsbbD/ChuHv7PKc+HX1aiUWs6PHpIDBQVWpJxoTCMNompoqSq83iWOTFwvk
	k/90Qm1qc8qxCnstlvmSMUrtJNl/XleWCtf41EfRYbJoLzdzEbpAze4Ta8viRHRgpqUxAikE
	AWfsROJ+uBXSita8919/r1lSKgUNvK4dPgJp7oRhnBZBk1BcnwARAQABtCVMdWMgTWljaGVs
	IDxsdWMubWljaGVsQGdyZWVuc29jcy5jb20+iQJXBBMBCABBAhsjBQkJZgGABQsJCAcCBhUI
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
	3+q6NW8wpuq73m2DrGm0PZlw5rqnysop7eaTeQOWSHHNw3C5Ag0EVjIXIAEQALQgCoikJPdc
	nPi7wx3QHWwdG59rs8XQQEjnBqQBY2HnnFEZjaPUOfKRhYVrxcwNmjIVWauX1Razr3XPrUuU
	FqWRiFvrnya/LgHUB4CPTAwl3OpfFZ2B3er1F+qjslzyCHKnbU98eTBo9mF9LdeBUB9m4yUF
	6atcnwailWAqdfzkdrubxa4WZauD/D8dheeAiy5o370Xo9B79NMyqBm8xtONLE9Tg86AEiq1
	MuvDMZhWTvkTXai1+DkYBdH9UPs1HFDiDlFNe+JMolPt8XJJYvYgurr9NWhhSYtwAL9ERz84
	hkIWQfQQpv4G8aQ0o2jWrmfl8zs6ocKk7N+Lf3eYtwaCZ3UPdQGnQ7LA8m4ihZLlXiO8O+s7
	a1j6z8r43MFpA3WL45QB1qlaTeUIaHqS3GGAaSeqnI7B3MocE/g1KAmsFjT18FmvVWuikTUD
	5xNBLUIIZr5SCawawHNC7Kcb/UzpT8a0C9oN8s+7nJJR5s5M5y3zZ1fJRNgz0CIEIueRafU0
	26ZP7Ul1St6DHIF688g4jryxDd6+mh9Pw/Vby//J4bS41zNIUWFSWNZIYF7WsUEMIFyLgL1c
	vwkdiK1W3CIS5BdnqrahGeudtcRY5vKpZvgzx1P+Alklrq7ZvAn4Z2MfMbQjr9aDaNxDYjuk
	HAknRFqs+tM78eZHuzY9tTPFABEBAAGJAiUEGAEIAA8FAlYyFyACGwwFCQlmAYAACgkQd8kn
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
Message-ID: <3b738c7c-f42e-24c3-c8f6-74695e62c1dd@greensocs.com>
Date: Thu, 10 Jan 2019 16:11:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20190108163008.7006-2-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="09mHiv8vIxoM7oU6FU2Hqz2za2XihTaja"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] hw/arm/xlx-zynqmp: Realize
 cluster after putting RPUs in it
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m3gi8JDVYhh3

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--09mHiv8vIxoM7oU6FU2Hqz2za2XihTaja
Content-Type: multipart/mixed; boundary="MLp2TGRqqCTVTLJ5g6xkABWMGFGBSO3lh";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Emilio G . Cota" <cota@braap.org>, patches@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3b738c7c-f42e-24c3-c8f6-74695e62c1dd@greensocs.com>
Subject: Re: [Qemu-devel] [PATCH 1/4] hw/arm/xlx-zynqmp: Realize cluster after
 putting RPUs in it
References: <20190108163008.7006-1-peter.maydell@linaro.org>
 <20190108163008.7006-2-peter.maydell@linaro.org>
In-Reply-To: <20190108163008.7006-2-peter.maydell@linaro.org>

--MLp2TGRqqCTVTLJ5g6xkABWMGFGBSO3lh
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: quoted-printable

On 1/8/19 5:30 PM, Peter Maydell wrote:
> Currently the cluster implementation doesn't have any constraints
> on the ordering of realizing the TYPE_CPU_CLUSTER and populating it
> with child objects. We want to impose a constraint that realize
> must happen only after all the child objects are added, so move
> the realize of rpu_cluster. (The apu_cluster is already
> realized after child population.)
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/xlnx-zynqmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index c67ac2e64ac..370b0e44a38 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -183,8 +183,6 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState =
*s, const char *boot_cpu,
>                              &error_abort, NULL);
>      qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
> =20
> -    qdev_init_nofail(DEVICE(&s->rpu_cluster));
> -
>      for (i =3D 0; i < num_rpus; i++) {
>          char *name;
> =20
> @@ -212,6 +210,8 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState =
*s, const char *boot_cpu,
>              return;
>          }
>      }
> +
> +    qdev_init_nofail(DEVICE(&s->rpu_cluster));
>  }
> =20
>  static void xlnx_zynqmp_init(Object *obj)
>=20


--MLp2TGRqqCTVTLJ5g6xkABWMGFGBSO3lh--

--09mHiv8vIxoM7oU6FU2Hqz2za2XihTaja
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlw3YLsACgkQd8knW3Qn
Tr5kpg//cZoxzFT5RgRq3XXiIL6xAX3Z3Spe8Ej15z66iu5UwhCdDnNiPFY5+vH3
3TqqR8WxQJYWSJ6oBFQm4ptHHqhxIw9eVWd4+J91xl76OJ3VvckK5QkoaiWA0tiE
0BNTUNRShckoAHJVj3/PnoyeqwFiUt45KBtTRZORnygi54bgdEZ2ysO0z6FKkqhS
YAEtqDqVDqey9dj3UK5vA7EPqvpZejjbT5aqKsbRVVuCQxzFjz5j2gG4MsVt7Vpo
20aJPnqHDr106Mu7Pi2Xc5yEHU1d7mpXNZHCJpxbtceIFOBC6mhMLsS0JdKrN1FI
PXDOFVcrYKk5QqFaIuldh7/DR+3uXLv0Y73JhcJ0Ot3MIKutR/wkuCwNpD+5A/G9
txL6Hy1XDAwVeI0rWJIz+meru0OpG9a3uHEsyI8bjeuRsXLPwPwPaxsWk6VjeOiY
sibYxQnfo1cRhRsLXDVwdC24MReElGZI3MxPFYAbqqPprxQkGT+urnSG9rkDiRED
WqzB0MKKHEDLhWPMXB9tyxiwn4TPPi1eu0avAx7U8MLbF+C/+4zCwiT8Oz6ZnhUO
4Swek/udAgMiLtS0dNHLlnkkEiOtNgrIPp00yR8tL8jR15FHjh0qdiTZeGAsWgfG
OQKQjgk6fYD3G3oK2yHHd2o3zwlBcENxAAj7B56E+1XOM7y6zdI=
=42BG
-----END PGP SIGNATURE-----

--09mHiv8vIxoM7oU6FU2Hqz2za2XihTaja--
