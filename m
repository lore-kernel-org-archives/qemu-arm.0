Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1471696njf;
        Tue, 3 Sep 2024 07:58:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUu21QIguf69qQlrQIfZIvTnXVbAfgc3j0kYJzLefByj6DwRvoXhmwJu+IheYbiKRPzA6MXy+5gSmNBHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFW35DYSI4SXcHeP8cBkJSZ2apQUhX7LTTCFTtefLzfYFAxZ1Urcj8fZ0peb6wtPtbc2eti
X-Received: by 2002:a05:600c:190a:b0:426:63b8:2cce with SMTP id 5b1f17b1804b1-42c880ec215mr30150525e9.7.1725375534193;
        Tue, 03 Sep 2024 07:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725375534; cv=none;
        d=google.com; s=arc-20240605;
        b=G6NzM4zCmJF+Ifut+tPvgm3j1msD3Xpy5Z4wdBOoiGY+HH7HpW5NI0OwM30vTLH0my
         vFlDig22BL/ZO/8CDdkEEbjYs07fp9hLeY1cAjPybxdkY6+cy/MUrkADT8ze/6qV9hrD
         oCZaF9IylmTlNKQ8hMU2v2T94XuttUdjklwwY4EV8F9DvC1SUr/8RPZSovwo3sfwSjmk
         Kg8wwPTBbBM/nnn59KJn+b2UMR3mW7XbwZH4o9XPN3ptafP6GdLGhpUGLWln7CtyFIyj
         SppeUuAhHuMiDH+J8+JMabeTLoF82Iyy86TtyNyiKdx4O9WOIfz34z8YKNQUMzjP+1dI
         chXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=tEwLdQueTH+UoIswN0OWyu84TqjyLeDNeIGyaZ/csOE=;
        fh=GbFg9YhPvCwUhVCv2YdN6dppB5x2+2lAvigvlqX8Qkk=;
        b=bs5U7vzBLV57xXtv1Unoc6z8DiRvmhAnq6R6BvyL28YV8DI25/x3CAnE8plmI59nmM
         WmRQmANc0uiqn4zE857A8QxrHxDRbdUVQMU+d/2DZ7NWHM/guqbpfVjWJoYsg4/Sga9F
         d3XnbK4K+6+y41wAxa918MVlyV1Hx0R2qguH0/UC7WPpHPyOIHcGmOlFEbTiV/xl15i0
         dnkGvbrlqa8UzkuUM6EuDf9TBTlYlWWRTqjTL5RhGfJlsLUyPy4/1WmTPp0FzR2BrmUg
         57y4KKLiR8Qyoqev03qY5sfcFmID2K+6r+MXOaFK9awRtbUK92LGK4fONHquxGv5qPI3
         GcnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=alireza.sanaee@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <alireza.sanaee@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42bb6deaa1fsi59632695e9.13.2024.09.03.07.58.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2024 07:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=alireza.sanaee@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WypZX66L3z6HJcx;
	Tue,  3 Sep 2024 22:55:16 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (unknown [7.191.161.198])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D30F1408FC;
	Tue,  3 Sep 2024 22:58:53 +0800 (CST)
Received: from localhost (10.47.29.115) by lhrpeml500006.china.huawei.com
 (7.191.161.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 3 Sep
 2024 15:58:52 +0100
Date: Tue, 3 Sep 2024 15:58:47 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <linuxarm@huawei.com>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@Huawei.com>,
	<alex.bennee@linaro.org>, <jiangkunkun@huawei.com>
Subject: Re: [PATCH v4] target/arm/tcg: refine cache descriptions with a
 wrapper
Message-ID: <20240903155847.00000379@huawei.com>
In-Reply-To: <7fda2f7c-091f-4b8b-bd61-5f8fcbbcf8ba@linaro.org>
References: <20240903083520.209-1-alireza.sanaee@huawei.com>
	<7fda2f7c-091f-4b8b-bd61-5f8fcbbcf8ba@linaro.org>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.29.115]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500006.china.huawei.com (7.191.161.198)
X-TUID: 6d4TgmMYsEji

On Tue, 3 Sep 2024 15:18:41 +0200
Philippe Mathieu-Daud=E9 <philmd@linaro.org> wrote:

> On 3/9/24 10:35, Alireza Sanaee wrote:
> > This patch allows for easier manipulation of the cache description
> > register, CCSIDR. Which is helpful for testing as well. Currently,
> > numbers get hard-coded and might be prone to errors.
> >=20
> > Therefore, this patch adds a wrapper for different types of CPUs
> > available in tcg to decribe caches. One function `make_ccsidr`
> > supports two cases by carrying a parameter as FORMAT that can be
> > LEGACY and CCIDX which determines the specification of the register.
> >=20
> > For CCSIDR register, 32 bit version follows specification [1].
> > Conversely, 64 bit version follows specification [2]. =20
>=20
> This is the commit description,
>=20
> ---
>=20
> this part is not relevant in the git history and can go
> (hopefully the maintainer can do that for you),
>=20
> >=20
> > Changes from v2 [3] -> v3:
> >=20
> > 1) add only one function instead of ccsidr32 and ccsidr64
> > 2) use deposit32 and deposit64 in ccsidr function
> >=20
> > Chnages from v3 [4] -> v4:
> > 1) Use only one variable in the make_ccsidr function.
> > 2) Include qemu/host-utils.h to get is_power_of_2() declaration.
> >  =20
> ---
>=20
> keeping these references,
>=20
> > [1] B4.1.19, ARM Architecture Reference Manual ARMv7-A and ARMv7-R
> > edition, https://developer.arm.com/documentation/ddi0406
> > [2] D23.2.29, ARM Architecture Reference Manual for A-profile
> > Architecture, https://developer.arm.com/documentation/ddi0487/latest/ =
=20
>=20
> ---
>=20
> and dropping these ones.
>=20
> > [3] https://lore.kernel.org/qemu-devel/20240830184713.224-1-alireza.san=
aee@huawei.com/
> > [4] https://lore.kernel.org/qemu-devel/20240902203211.270-1-alireza.san=
aee@huawei.com/
> >=20
> > Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> > ---
> >   target/arm/cpu-features.h |  50 ++++++++++++++++++
> >   target/arm/cpu64.c        |  19 ++++---
> >   target/arm/tcg/cpu64.c    | 108
> > +++++++++++++++++++------------------- 3 files changed, 117
> > insertions(+), 60 deletions(-) =20
>=20
> Thanks for the iterations.
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
>=20

Thanks for the feedback.

v5 sent. hopefully that's OK.
