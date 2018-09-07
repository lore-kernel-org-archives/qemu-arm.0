Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2054356wrd;
        Fri, 7 Sep 2018 11:27:18 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZcu4ADPjVYoEse3DWEtiZp1aaiFLZI/NEqyQrhI3EsnQ4gQaqomIYpeWT/xTekgbuu0iQJ
X-Received: by 2002:ad4:5052:: with SMTP id m18-v6mr6860936qvq.164.1536344838827;
        Fri, 07 Sep 2018 11:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536344838; cv=none;
        d=google.com; s=arc-20160816;
        b=D2OGczjt8JDLvghJ/HtAGf/ZP5aAswbk6SHyNqCrT9/wTkK3KoD0td/Hqq/0zsAitX
         8ID+VbGYsfdAxO4ZZorKHH4UmhC59tag2X7TPqF/lxCVO3//BpYaSqCIGz28h6oQdiC2
         TSvaJHEtp3RCDXPIFK7LPb6GeRKRaKw4NeVrUxFDPd/I5A06/8SzTbqNpHVWCwrMJP5r
         0dUvf1hqRf3JA8F43OaqRELVQx5Vxo2T7CCxDmCF/tBVwq2NRgfPRF1Ioj43tnHZ/gu4
         5mKUygZsePxoC6PVxwYYWPQdC4sSswPOnFHq+1ivuVJbTtzKhylsEpZ/y3ZaGXFUtiMN
         c7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature;
        bh=UUf1h2Niv4ZrWdgYj000bY4sYB1zVS7fVE4QVFCZ8lU=;
        b=ALNjy5azlJ6qB9sMkQDZ6/UAnjF+vE0glmgXA5lFQhqqf8S8gEgwzdfeCjNGitnUW6
         Kr8CN4QdRtg6KNCaHbiZ5Et/GNTsF3LfRS1Me3ktjWyYGk7P6nKsVVqrk6vhb3E+fL2N
         q23Emg/mR2sJDS8i+GfDISRfShSQsuI46lok0d4GF0TflLoV54SZWaGm4astq66pq6yE
         OLZuqHur98Laty9U+KyO7MM3PlUOS+dhFEDHC7cMIo1/hMIMm1BZ4xW7laNNH6zSLfbj
         cVozfJRTsWg4ClmcNUaGpW0Wwz6TTaCr80Dis0TcB2S3c/Jdqg9X3VVqYEO2fy3tAlB2
         RyTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uHSOYgSG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si6322869qka.105.2018.09.07.11.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Sep 2018 11:27:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uHSOYgSG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fyLTS-0004ht-C1
	for alex.bennee@linaro.org; Fri, 07 Sep 2018 14:27:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyLTI-0004ga-PC
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 14:27:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyLTH-0008Lq-Vo
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 14:27:08 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:36550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyLTB-0008Cw-Si; Fri, 07 Sep 2018 14:27:02 -0400
Received: by mail-wm0-x241.google.com with SMTP id j192-v6so15575453wmj.1;
	Fri, 07 Sep 2018 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=UUf1h2Niv4ZrWdgYj000bY4sYB1zVS7fVE4QVFCZ8lU=;
	b=uHSOYgSG94ee5FGvGIgCd/P29vPAc8pBuzKjKWwavTgbPyGaonrs5u4kHYYAWaOfgA
	KiXhmSkacuHuaBqdvaClaWBzkzBMXs9NYLdtI+wciUNJ0NFqEWrIDY82hwo8hnH0wtkC
	Ize0Qh1mZvtHa+z2LZaPC5tgzgJbydufJO/T5DSHayavaPt9EUZuQK93kzTvsB3D+R/+
	xY2R1YfSWuVF/dPOt2/jPQtVEupQpM6DrQBdy3rSX3P9mNeFYiURv0R7l4kzCKij+Htm
	TXKwueVewl8rPW8BLdTVgwTUrlvk6C3YmUh0IYGNCGP4sYyP9SRiZruC43clgBBmoylr
	26sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to;
	bh=UUf1h2Niv4ZrWdgYj000bY4sYB1zVS7fVE4QVFCZ8lU=;
	b=RR86nIEEkOHZFTGPsyLWwu7UXIugrnwkV2IHylQ7bw4f8PRgfXONJvOkk9EsyT71kk
	Go2it5r/DYJLXmSfagYpP6Eb87/0bBpY2zDl2cCQeRatZixNSeNvLC8aMpQ8Jl/Wb18I
	3taPmS6UtiJGAD7lfq4XRik/jrforhu5HiVyyxOhwDcCQf6OArKLfmwWhChSJhNrNu8c
	oFcyiCxxqTi/E0fy8rS2d1VeqcvPQb71vCiQgdtxgJSR9sa7EzmyiQA8OL9Rze0GLitv
	lEWPuA9LjzXw2/xj609NlLdmIHUR9/GVk/950TxT5oatcyFK3GtoxARnlPWnPD0Q7zp2
	Am0w==
X-Gm-Message-State: APzg51C3VSUVsQkZEhPmyC8wzy3TYcRKjIMLn7phKZqAhXEINpsJ1Ey/
	AbOwtXwbY4Qb5mHyKyDbuBh1KWff
X-Received: by 2002:a1c:aa0c:: with SMTP id
	t12-v6mr5698602wme.109.1536344820308; 
	Fri, 07 Sep 2018 11:27:00 -0700 (PDT)
Received: from [192.168.1.26] ([160.176.58.255])
	by smtp.gmail.com with ESMTPSA id
	j11-v6sm10620754wrr.37.2018.09.07.11.26.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 11:26:59 -0700 (PDT)
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Thomas Huth <thuth@redhat.com>
References: <CGME20180831102306eucas1p1ffbf82383f23675fecb5faf8a2fa54d7@eucas1p1.samsung.com>
	<9310418.Wg32kryeWE@amdc3058>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <4f99f130-4be5-912f-329c-06666c929cd4@amsat.org>
Date: Fri, 7 Sep 2018 15:26:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <9310418.Wg32kryeWE@amdc3058>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="Lej4390D3rTTb9zfi0HhF3Wx0iDppecof"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH] hw/arm/exynos4210: fix Exynos4210 UART
 support
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KFIFomz2E5Nd

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Lej4390D3rTTb9zfi0HhF3Wx0iDppecof
Content-Type: multipart/mixed; boundary="UkmRMQacPzaihy5JPBOC060751rotCZLN";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Huth <thuth@redhat.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Message-ID: <4f99f130-4be5-912f-329c-06666c929cd4@amsat.org>
Subject: Re: [PATCH] hw/arm/exynos4210: fix Exynos4210 UART support
References: <CGME20180831102306eucas1p1ffbf82383f23675fecb5faf8a2fa54d7@eucas1p1.samsung.com>
 <9310418.Wg32kryeWE@amdc3058>
In-Reply-To: <9310418.Wg32kryeWE@amdc3058>

--UkmRMQacPzaihy5JPBOC060751rotCZLN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/31/18 7:23 AM, Bartlomiej Zolnierkiewicz wrote:
> commit 97274d0c05d4 ("hw/char/exynos4210_uart.c: Remove unneeded
> handling of NULL chardev") broke Exynos4210 support as it removed
> NULL 'Chardev *chr' handling from exynos4210_uart_create() and
> currently exynos4210_init() always passes NULL as 'Chardev *chr'
> argument to exynos4210_uart_create() calls. Fix it by adding
> missing serial_hd() calls to exynos4210_init().
>=20
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  hw/arm/exynos4210.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> Index: b/hw/arm/exynos4210.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/hw/arm/exynos4210.c	2018-08-22 12:21:06.328813907 +0200
> +++ b/hw/arm/exynos4210.c	2018-08-22 13:00:54.344771039 +0200
> @@ -352,19 +352,19 @@ Exynos4210State *exynos4210_init(MemoryR
> =20
>      /*** UARTs ***/
>      exynos4210_uart_create(EXYNOS4210_UART0_BASE_ADDR,
> -                           EXYNOS4210_UART0_FIFO_SIZE, 0, NULL,
> +                           EXYNOS4210_UART0_FIFO_SIZE, 0, serial_hd(0)=
,
>                    s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_=
GRP, 0)]);
> =20
>      exynos4210_uart_create(EXYNOS4210_UART1_BASE_ADDR,
> -                           EXYNOS4210_UART1_FIFO_SIZE, 1, NULL,
> +                           EXYNOS4210_UART1_FIFO_SIZE, 1, serial_hd(1)=
,
>                    s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_=
GRP, 1)]);
> =20
>      exynos4210_uart_create(EXYNOS4210_UART2_BASE_ADDR,
> -                           EXYNOS4210_UART2_FIFO_SIZE, 2, NULL,
> +                           EXYNOS4210_UART2_FIFO_SIZE, 2, serial_hd(2)=
,
>                    s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_=
GRP, 2)]);
> =20
>      exynos4210_uart_create(EXYNOS4210_UART3_BASE_ADDR,
> -                           EXYNOS4210_UART3_FIFO_SIZE, 3, NULL,
> +                           EXYNOS4210_UART3_FIFO_SIZE, 3, serial_hd(3)=
,
>                    s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_=
GRP, 3)]);
> =20
>      /*** SD/MMC host controllers ***/
>=20


--UkmRMQacPzaihy5JPBOC060751rotCZLN--

--Lej4390D3rTTb9zfi0HhF3Wx0iDppecof
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAluSwu8ACgkQ4+MsLN6t
wN6xARAAhy5RGV2BdAEH5o9rwzIqS4+ZoBgF1at6ySZacp49MfIBYwQLFNJTMGXv
gZwSWn5r9E+5C4sqWTB7EuRUcxIC/P3MiPtSyy95nzR2l5qK1ACyXSxDceqvCUID
WlOih9qcGYrSVBW0nY4JsnR5H4lFq7BJPgMtbK72df8jq84QQ08qYsi1CncFel4q
rLw5VyFmiJ/ujLjMGAXnNVu3iT3yhnraMRA8q0pCwzalgd+74lcy6ZyjcQ/KSi8y
pxf2euIW8nI6YI188Qk8tpeDOI56SUqEJctFY9DzdXPI2x+666BPBCOQhnmq/cXc
tDmqD/rtiTTze+WsSdxA6ijQsAK570EHC9dkhYpYxdeb6XSLY3vwovrDYGk48dxH
NVb5jlKhKDzVn6dARyqSFZ/y88wX7ke4uuVSQtWO6xdeNShfEueMzvY3lntNoBIb
NMfT0k76Uz/hzfMFdbXTWBAEukLSFDxpWPTPXPrKiSwTKqL7Rl3smLSwSkufZbgC
gMoQGAWkDM2P7W8MpcO3V4z5KMhA/b1VcXxTdG4g5qXFau1dc53gkLGQ82Ss21mi
clbo2tAs5+i68doZajeIDlfUWDQ59tCK/M9tn4Kj+OIXwN0bgJ58x9DGPxmeMO5T
JGTZQdJm0HLAjo/BJzkbYGKosK8UASFD1FKFiYOz5EB5YaBzuGM=
=R2jv
-----END PGP SIGNATURE-----

--Lej4390D3rTTb9zfi0HhF3Wx0iDppecof--
