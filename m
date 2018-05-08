Received: by 10.28.4.212 with SMTP id 203csp3932999wme;
        Tue, 8 May 2018 02:16:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpKD/IYYXgHTr8AVhnzca5xEbFMaIUeHRNe5ONbpcosFvLmKcBgydumq+GHhpgp9JBDbPB4
X-Received: by 10.55.109.199 with SMTP id i190mr18151749qkc.114.1525771017993;
        Tue, 08 May 2018 02:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525771017; cv=none;
        d=google.com; s=arc-20160816;
        b=noU/EZjHVKDM8hLS4bsYRzgRqFiBRK/VWt/jxHgUZ8is+yTkbOjT24wU7yPL++ezeF
         FbfpVbBn6ZZhwsQ6oNFdJbJxxzrdjVf4vWkyvMJ8pBRBKJqt4Wj2Cz9ZKpP0cq7yVhRu
         DmUOd3tQA7caBzwhI6vZ1relgNclADYeXg8Z6/PikgCC6v3GOuF1f/O6C+7HZ/7s+qhX
         jnUR6ToT49+FNFcYIiBerrSGnNNb1HQOebMChg0h3RvG7V9hHh5tJFklblUL0jiAZNvn
         YxW+g1qRRG/Zk51EFvY2aHsHtotn2mmwmv2YTSySWUrV3NngmBLpJiQfa1sR7RCnef9w
         yhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OgKb13xYO6H+Gmnj4KncBY8i4bUB5ytTnpRK4QA/EfU=;
        b=mOQLjrET7cEs075qQImyCzBJo+0PabYN+TzEpwtKy1AxX/v6AbpardOqqnzbOzR+gO
         EAPriJzfliloT7TO+7MX093R4w9sLUuOkaWhZOm/mAXsXcnJl2UpjhH0/tHnkt8RSDiC
         qz/gm1202d5VxThst8UGXCejCzBqWtXAaL6Pmdl0/UM2Ws1lAijVD4IQahg7FigdH83t
         CUHPSPlBZTp2AB1tNebwUspuGdebv2dThl5+y6yil85pAkPuQhK2R9AySrwSoPZAUOwE
         VWoh8Hxhne05MZcRxtiUkGQxLxBfiaY4Eoz9zK8eyPZgUmhcJ/Xlz0aahL4cqbg5l6Vl
         P3ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DZUVyy0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 40-v6si5066668qvu.150.2018.05.08.02.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 02:16:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DZUVyy0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFyjx-00021g-HP
	for alex.bennee@linaro.org; Tue, 08 May 2018 05:16:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fFyjn-00021K-UD
	for qemu-arm@nongnu.org; Tue, 08 May 2018 05:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fFyjn-00049j-2Z
	for qemu-arm@nongnu.org; Tue, 08 May 2018 05:16:47 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:39157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fFyjm-00049U-UV
	for qemu-arm@nongnu.org; Tue, 08 May 2018 05:16:47 -0400
Received: by mail-ot0-x241.google.com with SMTP id l12-v6so35288406oth.6
	for <qemu-arm@nongnu.org>; Tue, 08 May 2018 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OgKb13xYO6H+Gmnj4KncBY8i4bUB5ytTnpRK4QA/EfU=;
	b=DZUVyy0HuV5FE7hxa+Cwr+sEVCfrE7gzIAO3NwpjX/HnPmz7iMsBem3lXIcJ6bABGu
	Ur7WVQiEct+764vi1eenCr5lUOGmhiY1Umqiv6JFHSGkZer7AsDYkOHSHN9GgqzhSOh4
	ewAiAZVCmESv0jkx1BLbS8wSxe+Y6ZiBlbGHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OgKb13xYO6H+Gmnj4KncBY8i4bUB5ytTnpRK4QA/EfU=;
	b=ZGoxBSLexPNqLbmC6jx5ohKVJlxcTcdteOGd504QYKNpWW2OTzvZvxBI/esOw2vfJg
	2ceBofazSPhp+q2ADpqWM+tlp+WK1duIwvxm2DNbWa1DMFAlroSIX29Qn+S5Gjeh3IDN
	Lew9/7RRKDkmfzv9j0w1RcpiavzVlDHSbTxf/cWIW7qCXphBIrWhDgdmVzk85oPQI5/l
	vVgw5SgEwswNyoY0UoKyA2ubEoDaGHhHZ+sef37Y7K75ZbexSP2Nxwx7V5JpGdPqdmwQ
	A2Mlkq5wxi/bvMZ/6Nma696Zwl2sEhgHfb/szMswgYORhnXMRVADuR+M0z9UT2XH/ZM5
	1PyA==
X-Gm-Message-State: ALQs6tCfHmDDVI5ufCrfVIx2LfgYmckT5Jdkg0Ab0idfntH752TaUOUx
	2jIqwd74ixmhvhvzCh0u0CIYjyj7ZviDR5I/LXvTU0m2
X-Received: by 2002:a9d:429c:: with SMTP id
	r28-v6mr2267870ote.126.1525771006175; 
	Tue, 08 May 2018 02:16:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Tue, 8 May 2018 02:16:25 -0700 (PDT)
In-Reply-To: <20180427110137.19304-1-peter.maydell@linaro.org>
References: <20180427110137.19304-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 May 2018 10:16:25 +0100
Message-ID: <CAFEAcA-X1-D4G4KLmXrTpQ_Yz6O3Pyzj63ir3MjiR4ZkqOF=kw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH] hw/arm/iotkit.c: fix minor memory leak
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oEwllDHDO8Ue

ping for review?

thanks
-- PMM

On 27 April 2018 at 12:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> Coverity (CID1390573) spots that we forgot to free the
> gpioname strings in a loop in the iotkit realize function.
> Correct the error.
>
> This isn't a significant leak, because this function
> only ever runs once.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/iotkit.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index c5f0a5b98a..234185e8f7 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -517,6 +517,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>                                qdev_get_gpio_in(DEVICE(&s->ppc_irq_orgate), i));
>          qdev_connect_gpio_out_named(DEVICE(ppc), "irq", 0,
>                                      qdev_get_gpio_in(devs, 0));
> +        g_free(gpioname);
>      }
>
>      iotkit_forward_sec_resp_cfg(s);
> --
> 2.17.0
