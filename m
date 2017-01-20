Received: by 10.25.77.65 with SMTP id a62csp18528lfb;
        Fri, 20 Jan 2017 06:30:51 -0800 (PST)
X-Received: by 10.202.212.70 with SMTP id l67mr7234791oig.153.1484922651037;
        Fri, 20 Jan 2017 06:30:51 -0800 (PST)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-ot0-x243.google.com (mail-ot0-x243.google.com. [2607:f8b0:4003:c0f::243])
        by mx.google.com with ESMTPS id i206si2731510oih.129.2017.01.20.06.30.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jan 2017 06:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4003:c0f::243 as permitted sender) client-ip=2607:f8b0:4003:c0f::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4003:c0f::243 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-ot0-x243.google.com with SMTP id f9so7703157otd.0;
        Fri, 20 Jan 2017 06:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5xINgw7ygTnMNgM2C4dt7/ozYwq4Z+44kBTliHyfXJY=;
        b=FhKxpRG3JaAoOTHox3CZ2J6d5stQet3ErcrG1Pxb/stOxNoIFCtXrVyq3hO1Os34lU
         K22X7dGnbjBk8xVMcJ4wbVTV+rBtHFBr1PV2/Iu2WNd8wNBKOgKkmP6NkdaBePoI+GdZ
         MIjTjTBFJ4KNdOQlAvpU2w097Y+6wNsXhKnSVTRIE7dW7IsSKDZ5yytSySdZpBl84Xnh
         VpZMqjcMCrZ3iSS/yxGS8M2qnvAL7cJfmoWqOgCBJlJbX0unxhsYsfcWYDX9net/yjWB
         N+q8moU86P5++uYMJ5M8HNHoqI6ty/fhDwbTNrZa6I2cSV9JQ/FSJIDLjV+ZDqop49F6
         v3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5xINgw7ygTnMNgM2C4dt7/ozYwq4Z+44kBTliHyfXJY=;
        b=fcwHGaYjjY3f7KJq7VL2YJWfZvZ9nG/AYQ12vYb5SXBYAXbah3a3Fan1QlAFYoRLCR
         5dhitKUPKbeduHjvs7HMWifz74gseqgN1lodJ8QXfzCN0ckFUKbvUGM+d7kcJexSahHb
         bfCduY9+1RJ58l330HIvsnukRWAWWRBae36a8Z/EZm/FzVsF91RQ6za6NgWzYCDRSez/
         5uwtlTTl+ioEAaxAzEz7HwHuWiGj6tgk4gqSfdOZiAoy4BBlQLqqI5a7YfJGi+HbLqu2
         Lo9b3N8B6lU/ZKoUOc+w5Xt5l3fcfIluf5mfX+YledcR6oPbl+JueIkukkKmr7eVBlNY
         j5/g==
X-Gm-Message-State: AIkVDXJsSRGHouxGkD0GL8yJfzbypEKx+WQaMHERifqCM76+WfoOWegfB+O5eCm4y586Cs8j7bMzsvKQmvJLXw==
X-Received: by 10.157.17.17 with SMTP id g17mr6911294ote.138.1484922650589;
 Fri, 20 Jan 2017 06:30:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.2.70 with HTTP; Fri, 20 Jan 2017 06:30:20 -0800 (PST)
In-Reply-To: <87r33ydmts.fsf@linaro.org>
References: <20170119170507.16185-1-alex.bennee@linaro.org>
 <20170119170507.16185-27-alex.bennee@linaro.org> <87a8amr3sj.fsf@gmail.com> <87r33ydmts.fsf@linaro.org>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Fri, 20 Jan 2017 09:30:20 -0500
Message-ID: <CAJhHMCAdK7A_41=cvE8UFxUkX4t01FyQUELS4fzUwgVs0TVYTQ@mail.gmail.com>
Subject: Re: [PATCH v7 26/27] tcg: enable MTTCG by default for ARM on x86 hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, qemu-devel <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	alvise rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	nikunj@linux.vnet.ibm.com, Mark Burton <mark.burton@greensocs.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, 
	Peter Maydell <peter.maydell@linaro.org>, Claudio Fontana <claudio.fontana@huawei.com>, 
	Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: kSIj2CM0g17W

On Fri, Jan 20, 2017 at 5:53 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> The case that x86 doesn't handle normally is store-after-load which is
> what I assumed TCG_MO_LD_ST was. Perhaps we need some better comments
> for each of the enums?
>

OK. The enum is of the form TCG_MO_A_B, where A and B are in program
order. So x86 will be TCG_MO_ST_LD, i.e., a load following a store is
re-ordered before the store.

I'll send a patch adding this comment.

Thanks,
--=20
Pranith
