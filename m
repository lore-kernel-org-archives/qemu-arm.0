Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp894074lff;
        Fri, 6 Dec 2019 07:29:32 -0800 (PST)
X-Received: by 2002:aca:ec4d:: with SMTP id k74mr11949816oih.64.1575646172468;
        Fri, 06 Dec 2019 07:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575646172; cv=none;
        d=google.com; s=arc-20160816;
        b=gJV+ZuKr8ibYYoHf6RrPoHH1ijFZaDxhW+jd3n+zO0d4R4oAK05+z5fr+jdDWZFa9L
         dEvabU1wotYjv+3vuCcdyzrk2IlHOxnJ3xEtSJRwOVq/S49gfPsYD0wnbNVz5oAuGvrr
         YxFrM42giwlu89F/xs9Javn/RWkZt+EjxVpGfhgg84cVgNILZcn4p3XxYP0M9shTLsFb
         Vzw9ZNtBsfOiU06a3zB6sAZP6f/KBxmFjQSnrN0gpTojC7vSjTt3QRC2y8Pq2Bh7MfGK
         jvj5wmxlMAqjGf+IgmPlNG2M345A6uDYwe9VNNHRvfiyk9Zoqw2mog5jdr0QtzwqbBZN
         JElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Yzv5Xveobx+eBUxsnVw67hztizIW+3C2SXpKxGaDxU=;
        b=mBYfY2OklWgclVGmzA4y9/LxLfJmilkQrUje+8aZEkTiZRUDI3EKqOsdYz1IvteKCz
         QXLIeUIdj6WTYbTEK3KZURbHhPRBRDZUNgEgut5nsCYBuuHO1+062k0btiReFbI0cu/s
         wuxEdg6hR9jdOpE2E1N/wyJygV26Gwhk+hIGA2XNB1f+QjhvV+l4UKCr02xibVW1IToi
         7EKsLw7U+zPto/E0X85DPU6OUMX+Xpdi6ycv1a51+AhxHoRUlxVd8D21HSiPh+w82/pJ
         8n5GJGVY00d9aje/1zKyJ80vUH/Uag0qgqlI22zdSnPFzab32sU98IAfrVb6FlqWuznJ
         940w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ozGlnR8b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m10sor6687559otr.55.2019.12.06.07.29.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2019 07:29:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ozGlnR8b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Yzv5Xveobx+eBUxsnVw67hztizIW+3C2SXpKxGaDxU=;
        b=ozGlnR8bZqcf4D26sD/TAzQBXj2oK0ZCFIJGSuFogeAaLHPq8maW6DUvYPnjxfN4Rf
         EvMIWUO6sI6Tv4tDgjOFjfJP8T2FelTTep1/D3pdwHk57D7mRj5m8nLomvSyA+LOYVr6
         JtcLBaxcW4U4OyyshjGFKMh5CCZhzqKPkgLsM4YsqNfp46e9KiNkYCuGS4OO1bp0F0ug
         +AU8Y212F9DmF8Us1AeC6l0L6LU6q9v9JLGImOJWCUx4X5ZTrDyyOssxS3nNE57MPC3+
         xJcS4E3IG7ZOZ/yqTqElfuNgxw0UdELz8ZjKERi6+lhnClcdfhHfRrHoQ+E5ZLidBlDw
         IxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Yzv5Xveobx+eBUxsnVw67hztizIW+3C2SXpKxGaDxU=;
        b=WXCWA427Nc9ic6lupwKLTTgD7QoFqpskWF85cMOJcRIDv8jbONaWOeRFNSmJq7kPiz
         Pwrfa+ME/osZxhKgPGEncgQwyWXr2juze97ethAyiUuwd0FHSWxQC2jl0gKoHuOfIhtU
         fDLJzRo/J5eNGEREXFnWxxprPPQ7xhZ360CK/PDj+NS2ZapA41wAQDyynxaW4eehS//c
         ib8FiHjqpQmSkyvoE40ljqkjDXrZLDEMOd+gQQ8K89umRmj2/4QcRUqdSzcxUU5bE8WQ
         SgzICKBulY0Dk6FuJj3PvyFcQi6OTzoNBOgB9tD0qCjLK79+NmY0KBB6xa/tdplA3ek/
         Y2Tg==
X-Gm-Message-State: APjAAAU3DUUBpjgmVECcAvzyMquUFJygXBHlGJMlObLld5vH6cV96Z+1
	/W4Yo+SMYA3YlEc/b4jSqrLghfJwLV4Ungzfim8eiclOlQ0=
X-Google-Smtp-Source: APXvYqx7ADnxQQd2CUTKfZRlgeADallzuH7gsnzL/2RWBJif6Y+L4dcK5VnOh/+pYwlvxXY7o9ruYzUI7U7UbPbY4jU=
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr11796431otg.232.1575646171756;
 Fri, 06 Dec 2019 07:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20191206122247.7507-1-alex.bennee@linaro.org>
In-Reply-To: <20191206122247.7507-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 15:29:21 +0000
Message-ID: <CAFEAcA9S51DWqysHbO42CjOhZBMA4qwN2zT+isOmWFtH5G8N3Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: don't bother with id_aa64pfr0_read for USER_ONLY
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: g/9/Gh5/ijIr

On Fri, 6 Dec 2019 at 12:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> For system emulation we need to check the state of the GIC before we
> report the value. However this isn't relevant to exporting of the
> value to linux-user and indeed breaks the exported value as set by
> modify_arm_cp_regs.
>
> [AJB: the other option would be just to set reset value anyway and not
> ifdef out the readfn as the register will become const anyway]

If you want it to be const it would be clearer to define it
with ARM_CP_CONST... I'm not sure what an ARM_CP_NO_RAW without
a readfn or a fieldoffset will do on reads.

thanks
-- PMM
