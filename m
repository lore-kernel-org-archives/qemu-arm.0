Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4889378wrt;
        Tue, 5 Feb 2019 07:24:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ0gT6s/24impDrNO6ynI2JxTvXUSUtrFLhROcEehx4Mejs/UNTNRxtI9IqT3dLNrCz0H0X
X-Received: by 2002:a25:cf0f:: with SMTP id f15mr4295509ybg.522.1549380250746;
        Tue, 05 Feb 2019 07:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549380250; cv=none;
        d=google.com; s=arc-20160816;
        b=CSidjf4SfbYuOPZOcSa7ncZ/OJGFGnfqsQURsaZMcySptBb2CV4DrK3/6hXSZ0Awv6
         XIxGPugWYRZqoE9IuSOJh1x49o2ECqzqTJmFcVtFqwywqWqEGVYrIp3DBdLrKoGEA4WF
         yQ6FtTvobY7LyC/cCBZds2EgnwklueuZ0I/XaQlJt1B9mDJ/hEZ2NJMeKhtSL+nkAnRw
         h7ucxvV4lzBWRbPM19OtfKfcMXzoMH52bq3YsqfPha2NZgzi5Ur3qfaJm/FRTnmxLPzq
         0TzZHjH04yxuxtt1TFqV6ANwXAOdDPVQwOFSqJtMYZmET+6K3fyh6bO7ywSP1LalqsZg
         4fLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature;
        bh=YzRy0LdrOGbjGRJ5ZI44jXWM+rRVAUXE5gT2k/XXUZU=;
        b=buDHS41IZfstGwIwVRfITQeyTzY4N7iFTfNnYivpHiop/OorFXWM/H0cFXX/7Ur+d8
         ugaX5E6TnjYon3dCm+tnITq7yZYWWLNs2tmeQgyYx7/1n5LTO7YTYIiXPgNRy5EABIwD
         F6S6EU3tXWxK3MvHSgmp2BR3P21LqkAekpj2Ltm4v6xJ07GrCdfYIOOZ+9lMejSZteL0
         /dToH0SyhqeYnU98GPCzvLMy9e7flFjqepQB40DeFwrNBTIha90yhtqlrskGGxUsuERN
         toFcI4XH5c+uiyWJkvtZf7o0nmQrKQEHPADL+Eg15wSDu637Atf3bh7ErPBvOoqfx2ME
         0UVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=21thUQks;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=12BCGv6W;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=12BCGv6W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si2100344ybk.74.2019.02.05.07.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 07:24:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=21thUQks;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=12BCGv6W;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=12BCGv6W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:33663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr2a2-0007Kk-6K
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 10:24:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gr2Xo-00065T-Jk
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 10:21:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gr2Xn-00019l-J8
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 10:21:52 -0500
Received: from greensocs.com ([193.104.36.180]:51899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gr2Xa-0000yx-Tx; Tue, 05 Feb 2019 10:21:42 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9F1606CA8C0;
	Tue,  5 Feb 2019 16:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1549380092;
	bh=JxHEqFdI39XK/dNnql5utwkgGPYD02qMhoEwmJay6nk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=21thUQksLWH7WERp8bnhO7RHPJWgmrJp7DXhxUMv9HS8ty5ixB7uE6vrHQfOGJzGG
	5YiM2ELJ7RPZw97iNs2r4WxvHMCTweaR0m7LwGNw3vV9GmT1SRNS4Nt53szwk7H3/x
	zrNAIaw5/aFWLIOwF4ZS9mQj8MHaj13UxvDfhgJU=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=12BCGv6W;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=12BCGv6W
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id np-KNif994RU; Tue,  5 Feb 2019 16:21:31 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 2A716388FBC; Tue,  5 Feb 2019 16:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1549380091;
	bh=JxHEqFdI39XK/dNnql5utwkgGPYD02qMhoEwmJay6nk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=12BCGv6WCnsb6qxBYxlxuw2JvZaDmJCvgPHKNDSL2qJMyp4bUTPUtc63R0zI8U2rR
	i8KMiG7dRohuJ1UnSXZkBlVkqJiCWwi111eNBvpTQRs8glpHje7hSqoaWv255GkBt1
	56iay7fRJ/cwDamTOcqUyT+04pV4PF25YaoojHls=
Received: from [172.16.11.100] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B9F0F6CA8C0;
	Tue,  5 Feb 2019 16:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1549380091;
	bh=JxHEqFdI39XK/dNnql5utwkgGPYD02qMhoEwmJay6nk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=12BCGv6WCnsb6qxBYxlxuw2JvZaDmJCvgPHKNDSL2qJMyp4bUTPUtc63R0zI8U2rR
	i8KMiG7dRohuJ1UnSXZkBlVkqJiCWwi111eNBvpTQRs8glpHje7hSqoaWv255GkBt1
	56iay7fRJ/cwDamTOcqUyT+04pV4PF25YaoojHls=
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
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
Message-ID: <50ea8b3e-cd8e-c6e9-86dc-2e50b78646c5@greensocs.com>
Date: Tue, 5 Feb 2019 16:21:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549371525-29899-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="9wZUNnmWASyVq9YFg4GIaYz4yiwRwBoHb"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] hw/cpu/cluster: Mark the cpu-cluster
 device with user_creatable = false
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fbIiVM36Mrs7

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9wZUNnmWASyVq9YFg4GIaYz4yiwRwBoHb
From: Luc Michel <luc.michel@greensocs.com>
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-trivial@nongnu.org
Message-ID: <50ea8b3e-cd8e-c6e9-86dc-2e50b78646c5@greensocs.com>
Subject: Re: [PATCH] hw/cpu/cluster: Mark the cpu-cluster device with
 user_creatable = false
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1549371525-29899-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 2/5/19 1:58 PM, Thomas Huth wrote:
> The device can not be instantiated by the user and QEMU currently
> aborts when you try to use it:
>=20
> $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
> qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
>  Assertion `cbdata.cpu_count > 0' failed.
> Aborted (core dumped)
>=20
> Since this is an internal device only, mark it with user_creatable =3D =
false.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/cpu/cluster.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 25f9070..6f5f037 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass=
, void *data)
> =20
>      dc->props =3D cpu_cluster_properties;
>      dc->realize =3D cpu_cluster_realize;
> +
> +    /* This is not directly for users, CPU children must be attached b=
y code */
> +    dc->user_creatable =3D false;
>  }
> =20
>  static const TypeInfo cpu_cluster_type_info =3D {
>=20


--9wZUNnmWASyVq9YFg4GIaYz4yiwRwBoHb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlxZqfoACgkQd8knW3Qn
Tr4UXw/+KacuNQlSF+GZaCSvZUOFBCr4bHc5/vn8mzJ2VA2A8PTNgh5RR6coHvdi
mMZmgTw7bosc+DKYkzClqkGFTP+LGxxdUOpTaMexL+Bee05Rbi8koCI1cpnoqnpD
OW1jwlUJHoA7Q3eceiWvu84mpoF4sDSA+HobLqddSbve1wj8v9EOzT6IxzfcZoik
KSIS052lvMrkCr6jL5XmoDj0R5whq6LhKxQZH8gndG3NR/aGinJPEwdBVqe0W2VY
gmhDv0s4VooarIm786a08syI3TrfvMsDCHWtTKrhaLBzt8jUEN9FuJL3RyGml2ki
h0QYAHid1KkkOTDL6CmZmYoZYGwswLq2tFuwiaP3TakSlWrBu9DptDDCMD5SblCY
KJZ5+YG/tMEtKZrRlEQaapTy2jeThwfu4i+XOjMuVBrIAUQm8t6PYjN+kqgqJZTf
EUmCgSUn0OO5qonTapyGDUlyU/3O5X5gLiwnr919Z3H4YdSl9D3e0MR6+kXeIU0E
y7PmHjnWYf+c4SIZ12LG3YnsP7fP6Ov/moY5Vema2H13m3g31dkwamr/yvxvf3ic
7PmlrTqy8S44CH/RHE9sFJ5hN4IIwnTUJQfIBg9a6raVZ4Ao9oawvvKitkQHrqjz
8ZQ2IYhWWWZJbQN0TqTb8qmRZatlqtAM7EwJ0DtsC9QCXKg31XQ=
=++bs
-----END PGP SIGNATURE-----

--9wZUNnmWASyVq9YFg4GIaYz4yiwRwBoHb--
