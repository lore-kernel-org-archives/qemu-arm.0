Received: by 10.223.159.82 with SMTP id f18csp969628wrg;
        Tue, 21 Nov 2017 09:49:34 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYV0pYByO7rFEazgMgMYvVJh+uTIYLlnAP1A/RK2S6Hu44IaorBiEzTVRtExOD1sAvSUgrg
X-Received: by 10.37.230.80 with SMTP id d77mr11069620ybh.315.1511286573979;
        Tue, 21 Nov 2017 09:49:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511286573; cv=none;
        d=google.com; s=arc-20160816;
        b=HwXCpt+6HYkg0I4GNWqigg8Lb4wRwqgJJ9lXPrvBDsAKrgnrduin9pkleDepnie85d
         MPXYIfv2UihqU0hxSXmKXxFpALK3P8VjQy9wdV+SyLtpA2evN5LOGo6dMgcSv+QCzUI0
         H3RtDfOw8HUCn4PI7Wzs1Q1KsV1Ks5+aHzkoTrnYGr0LNL1xIPlWOyUJYFnqFug+3pBA
         U64x4FdYYQCCxojYy+qumN/8a2jUHkN6UTxvP38OA0OF4TTk1ifLo1SQlLpECOgrT6xe
         ZhRO5e2RUxchb0yhYBPdPvkPwTjX8Ebt8biqSmbcsq6sYjAyUJMOg7FI63qt7EKyMa7p
         Tpgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=x5vNQl2/3J+5pZIQiYn9kl3kfWEQPoiebzrs8fyyPu8=;
        b=YGFn0AlmGtL67h/5udUYb+3Z43Ao2sirA+4kYhyPTaLKAKuU4Mei0nC673E47HgMAg
         IVVA9oNVvxfk45n2nnSSpIqH9tgIQJ3II5CmgLHd00HVjF2t0e5R+a9FdgZK7peEnWt+
         QFd7x7JHQN63sI9C4Ys5kZfrHWTrxZHuZbprZc50vvkXn2607tdkZhToFXqSRauWYk3E
         IBdhZoJW/kLyr4NiULey1TYrJYrLkRwk1czYDg++dj7Z4fzbwUYdiry2NgoyeEk1ujoC
         KK+Y+qTU7rdyGl8L/2fi9kS5JRc7qFCDYGbfGm9d6uYXQw/cMB0u5awBB51TY7ZNg2FU
         fDvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YoOTR+4Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3si2756028ybd.88.2017.11.21.09.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 09:49:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YoOTR+4Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHCft-0008Pz-DA
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 12:49:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCep-00086M-EP
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 12:48:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCeo-000835-Ib
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 12:48:27 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:34285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHCeo-000821-EC
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 12:48:26 -0500
Received: by mail-ot0-x242.google.com with SMTP id o23so11262422otd.1
	for <qemu-devel@nongnu.org>; Tue, 21 Nov 2017 09:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=x5vNQl2/3J+5pZIQiYn9kl3kfWEQPoiebzrs8fyyPu8=;
	b=YoOTR+4ZfaHoHqQuVoD5gcfy5JvFk7+cPAG87kzbEzncoM3GGUTrIU8WoyOkfTi4NU
	RppAslUmvIuAinQxRZdggDnTc/65/jq5r7TMiPcW3g1UJJX4fUmG+0HjmE0kLjJu6EbN
	jLKza+CbvCec76ZMh18FHWhENslZHF5vnhL5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=x5vNQl2/3J+5pZIQiYn9kl3kfWEQPoiebzrs8fyyPu8=;
	b=swk5e9/vvfbmWHaUBaQismjazXOa6gdKZD4IugatAvzI4TwMwWujguIwKolT64Cm+9
	3Aw67hvHeyZWdwTO9I9dS10/mMu1qO9V0mrcPUAKrcqq7XrrM05equSEKbDhOHClzLed
	wcGPnTsdQuNpANXR/5+q4u0QzCQPvumbFJKIXv7WKkygVa2+6zPHf6r8+VMu75Zzhmlg
	0KZVgbwROUycrOua8vyE+YVcGdfqwhQGsaYJEA5J2ynn+GOcNpBBuOe13YWlw+S1JYPU
	dJyAv584VN93U2zqGAlvQwd2DYpSl03bHYosVzgMgoa2jpVrsyEDxzBgqtydZdfUOT1W
	o3rA==
X-Gm-Message-State: AJaThX6nHibeNW6HeTvMCjwBJcDr7f0FN9+CJdHsU0I3zchSAIH1wR8d
	q+mLdk7z+F6rr4/miH4CkEh5XmqLfQNd/plB7N7xXLXi
X-Received: by 10.157.80.24 with SMTP id a24mr10637962oth.335.1511286505723;
	Tue, 21 Nov 2017 09:48:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 09:48:05 -0800 (PST)
In-Reply-To: <20171106154813.19936-11-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-11-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 17:48:05 +0000
Message-ID: <CAFEAcA8CLwzHj9-n+OJKB4GTn1u3D_4secBV_CGdFkR383EAOg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [PATCH v3 10/30] imx_fec: Reserve full 4K page for
 the register file
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dsyKS5QRQKCK

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Some i.MX SoCs (e.g. i.MX7) have FEC registers going as far as offset
> 0x614, so to avoid getting aborts when accessing those on QEMU, extend
> the register file to cover 4KB of address space instead of just 1K.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 48d012cad6..e236bc933c 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1252,7 +1252,7 @@ static void imx_eth_realize(DeviceState *dev, Error=
 **errp)
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>
>      memory_region_init_io(&s->iomem, OBJECT(dev), &imx_eth_ops, s,
> -                          TYPE_IMX_FEC, 0x400);
> +                          TYPE_IMX_FEC, 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq[0]);
>      sysbus_init_irq(sbd, &s->irq[1]);
> --

I notice that we have an unused #define FSL_IMX25_FEC_SIZE 0x4000 in
fsl-imx25.h, and the Linux device trees for the imx25 define the size
of the FEC register block as 0x4000. Should this be 0x4000 ?

thanks
-- PMM
