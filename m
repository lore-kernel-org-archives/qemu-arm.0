Received: by 10.25.44.15 with SMTP id s15csp4319917lfs;
        Mon, 24 Jul 2017 14:13:50 -0700 (PDT)
X-Received: by 10.55.82.3 with SMTP id g3mr21474484qkb.23.1500930830276;
        Mon, 24 Jul 2017 14:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500930830; cv=none;
        d=google.com; s=arc-20160816;
        b=Hsvwz8Zn1AapeSseA0F7AShKh8GKx9ZZt4m19GDRzXE5U5iDjVm91i1WgoMMOyB1Mp
         yWT52Zs7b6SSmqZ6KkMcL2DCJdsY/EOmbWDeBL6RChDRQK4OCiSCcXKSGsJ89oaDelRK
         db2Gv18o3znvOs5nwvGo3+h0p4Sc8ogzkoFZY8yJPqfguZggBqt29aQoykVUdScYNNwZ
         D6rGI83Qq3SucI+C/faeggmxlS5liLmZfN14F7Twsgkm+jksafsO58U3uOiMJwNyPGC7
         N9tEwygmKxu192+Mac5Ch+uP8kVA3GE7pz2p45Bw57E9GYCSZi3PUPQMUIjMp4+wModE
         LatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=YbMDCZdlqA0ouxORl10TZk/YKoHrN/8ZofR4fRskBiE=;
        b=BXTqEFZMS3+2zh6ZXK/24EuLDOraGsRHSvk75W8pNB+0k0AjdfvAN53ueO4kvzjYHi
         QzQ1MRpmfqXUmQZF83y+juFPL53Q3HtZGKf4o9gVXa+/ANynzWqfx8kzMXAMFvrxlDxB
         DYzgx4hcRyQ/zzD1yOCTPefvuRaTvinn6u9Z2eTCXaxWbkakYBdY41/06v3Z5y7sREYc
         oyQ+SXBhZsrnGU2ADuSQodMk12XYe4EPlCZMbUc8JKRY0yMyDwXYIftQyWkEpfQn8LCY
         x3nphtoO0cixPnFGxDE0hQJdmckJibxninZ6IY4tN7lveP3I3xI3SA9znY+NJtw1UTxK
         Wjxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=a9Rh+bex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1si9779331qku.254.2017.07.24.14.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=a9Rh+bex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZkfj-00023j-Mj
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:13:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkfe-00021H-Gk
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:13:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkfd-0008Nn-IV
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:13:42 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:38094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkfd-0008NU-CH
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:13:41 -0400
Received: by mail-wm0-x22c.google.com with SMTP id m85so27390783wma.1
	for <qemu-arm@nongnu.org>; Mon, 24 Jul 2017 14:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YbMDCZdlqA0ouxORl10TZk/YKoHrN/8ZofR4fRskBiE=;
	b=a9Rh+bex3X7sOTY1udguYWJE1NTANczYDwbZpk0r5i8LbqpZ7c+1rjwOVs3OiWZ2FF
	8TAkHxqShIC+MijwzBIMpogz36xfwe3Ksyl4op4nrdJDq/yyXHIoXfALqCEWwsc5DBWu
	yNNcKofM0nX2/ucI0EcuIFHThQHLuZukBD5GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YbMDCZdlqA0ouxORl10TZk/YKoHrN/8ZofR4fRskBiE=;
	b=TD54IZFsr0ESqPzlJ/1i6F/iw9S0grJrjRBzZz/LJhtlCO/CvH5SrAjkoOu3qT+qdQ
	JCacUDKyBM4rUIvfWtW+VC5eoW3ALuUlEY2gDHWP2r2Y2MRlkXFuYfhM5CfwZ1rxDMmq
	KsVEgNGV487g7tZRoHJBdZuQvMuERGpd1ZunheOykITJqXGpiqiSyu5AQrx6LMcGudZW
	gB58l68Tv8uryjZw0oEWfdN2IzWcNCETdhd1uw0cH6t/jz197HIJoUuozhFvbRA81Vg6
	iUtBcg4ajLO4bgOvSl13EJ784B6yQ0rfOt/u86mWDWNOsceiNddIhLdHnYrtIBiIAu5m
	9YIQ==
X-Gm-Message-State: AIVw112GqL4LWpprjfLiJiEqBN9Sj1HmoLnh+KJm4QMuZ9nOv5iTiA0C
	AampcBWra5Prf/+UP7sZ28Q3bxK8a+nF
X-Received: by 10.28.198.206 with SMTP id w197mr6054557wmf.86.1500930820417;
	Mon, 24 Jul 2017 14:13:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:13:19 -0700 (PDT)
In-Reply-To: <20170724182751.18261-12-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-12-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:13:19 +0100
Message-ID: <CAFEAcA9nkfXfXn3fiZMS3dnrp7v8NVysqFS+pb-Ehf=+xOFfWQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 2.10 11/35] i2c/exynos4210:
 correctly check i2c_recv() return value
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
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WV8ByU6/PWf5

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> i2c_recv() returns -1 on error, if the I2CCON_ACK_GEN bit was not set thi=
s code
> was setting i2cds =3D -1.
>
> i2c/exynos4210_i2c.c:117:20: warning: Loss of sign in implicit conversion
>         s->i2cds =3D ret;
>                    ^~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i2c/exynos4210_i2c.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
> index c96fa7d7be..4424dbd233 100644
> --- a/hw/i2c/exynos4210_i2c.c
> +++ b/hw/i2c/exynos4210_i2c.c
> @@ -111,10 +111,12 @@ static void exynos4210_i2c_data_receive(void *opaqu=
e)
>      s->i2cstat &=3D ~I2CSTAT_LAST_BIT;
>      s->scl_free =3D false;
>      ret =3D i2c_recv(s->bus);
> -    if (ret < 0 && (s->i2ccon & I2CCON_ACK_GEN)) {
> -        s->i2cstat |=3D I2CSTAT_LAST_BIT;  /* Data is not acknowledged *=
/
> -    } else {
> +    if (ret >=3D 0) {
>          s->i2cds =3D ret;
> +    } else {
> +        if (s->i2ccon & I2CCON_ACK_GEN) {
> +            s->i2cstat |=3D I2CSTAT_LAST_BIT;  /* Data is not acknowledg=
ed */
> +        }
>      }
>      exynos4210_i2c_raise_interrupt(s);
>  }
> --

Have you checked this change against the data sheet for
the device?

thanks
-- PMM
