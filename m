Received: by 10.25.44.15 with SMTP id s15csp337361lfs;
        Fri, 28 Jul 2017 04:44:46 -0700 (PDT)
X-Received: by 10.200.40.135 with SMTP id i7mr10767261qti.55.1501242286632;
        Fri, 28 Jul 2017 04:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501242286; cv=none;
        d=google.com; s=arc-20160816;
        b=wJWLRJRepUfUM0Xj2TNPdU1na4dAnsTOvhW9tKXMTXItw3h/kZAOCGjxqmnRuKLLdZ
         RsoAvlFClDR1rwBCr4Z8eJIZYLlyP6iVBl1v7HKaLxw52CaOvcGBjHTFAcUl3dDG4OIj
         M8nLMgvX5/DZSAMET7yDbOtJfPa3gQF9kTLZGvSdOJ96rk8P5rOwwOFsl8NnzlC8oWuU
         Dx7ZteVqhP151SdOzCWKc676ox/egFIk0pGwnMMbZiR6CL8z9EZPLvkK47le9jSHpUvI
         7D8xRkX+mBCSgj225YGTBqz1B1YvIGsgSKYPSDlGSDn42dL573kObqamDUZuKeKQe9df
         ZHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=i0I76FUs3WlrfdC2Q9kvCV/zLz73t3UoSEEJ4eSSlR0=;
        b=etjl63C1CxrUOzxBKAQVuDirDwm9xTivvtT0KGKzBuLN9MCMuMCbQP2tKVx2+Tz2uC
         LSJekve5W/b9bI4n6VpN73AlnS5eiGybDkALBFoGDl6EXBOBKjAJ+Go4hCeONW+a5I0j
         nrtBDGLhdK1ycFYE5AKaJwz+q+gCYuffVkvQnWPJ86VPW3GI5d7/fFhXF+UhOcqUQASe
         BJHr8UND7CZNH+KaN6uVzOi8sPdIjmTZqWR9IplRtJTr3yTQYyNoebog4RlfZG2hkUWM
         05ILNud8pYPX+Kh+Rjbq8ezPVenz4nEj6/YprUxPBpGbn2XDRWoYrVlOs5EgUodKDklX
         z/Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b13si9170614qti.329.2017.07.28.04.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Jul 2017 04:44:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1db3hD-0001gi-Sx
	for alex.bennee@linaro.org; Fri, 28 Jul 2017 07:44:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3hA-0001aW-KM
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 07:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3h6-0008BD-7F
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 07:44:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1db3h5-0008A3-VI; Fri, 28 Jul 2017 07:44:36 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6FF9F4283F;
	Fri, 28 Jul 2017 14:44:32 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 7CCBA5E0;
	Fri, 28 Jul 2017 14:44:30 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-20-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <78b454a6-b0a4-8cfe-8a4d-9b5207f03faa@msgid.tls.msk.ru>
Date: Fri, 28 Jul 2017 14:44:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727024224.22900-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-arm] [PATCH for 2.10 v2 20/20] i2c/exynos4210: fix write
 to I2CADD register, bit 0 is not mapped
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UFrgr70apoiK

27.07.2017 05:42, Philippe Mathieu-Daud=C3=A9 wrote:
> From the Exynos4210 User Manual [1]:
>=20
> 14.4.1.3 I2CADDn (MULTI-MASTER I2C-Bus Address Register)
>   [7-1] slave address, latched from the I2C-bus.
>   bit [0] is not mapped.
>=20
> [1]: Exynos_4_Dual_45nm_User_Manaul_Public_REV1.00-0.pdf

Okay, so what happens when one writes to bit0?

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i2c/exynos4210_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
> index c96fa7d7be..e6a9ca8f03 100644
> --- a/hw/i2c/exynos4210_i2c.c
> +++ b/hw/i2c/exynos4210_i2c.c
> @@ -243,7 +243,7 @@ static void exynos4210_i2c_write(void *opaque, hwad=
dr offset,
>          break;
>      case I2CADD_ADDR:
>          if ((s->i2cstat & I2CSTAT_OUTPUT_EN) =3D=3D 0) {
> -            s->i2cadd =3D v;
> +            s->i2cadd =3D v & ~1;

Maybe a comment is a good idea here, saying that bit0 is unmapped.

Thanks,

/mjt
