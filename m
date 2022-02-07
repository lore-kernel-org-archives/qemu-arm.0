Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp76218lfk;
        Mon, 7 Feb 2022 09:11:21 -0800 (PST)
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr360486wrr.378.1644253880828;
        Mon, 07 Feb 2022 09:11:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644253880; cv=none;
        d=google.com; s=arc-20160816;
        b=QIQ8MxguLa+XDNLFVAgtOVSjgxwXj1aOwSoMZQLXTM8v4zNiOEfVxjPoGPnS+ZSOya
         kZQwWNQI53wQnCwTtSxSBuN9O/EQ/uyVO7I9zFhUT219hR/eNhriqmVMUnyP/nvRmzvF
         kH9SNxXaDrGWeDGui+06Xa5np0U77o9P2LQpc1ydjA2JyV23tBKSa3uN2lMqtOn7twrC
         N4WAQghiMvn7JMUAEIqBdGAKWdzmweS/22J4lDr5l7EgManigcvsgLtwJQSBIAQDpcG5
         khUts9SBYcT8rBk9FEYbHAw/qsWCKHCF0CZJVDQWxQUAV86KkUx+U9+6kNWVNwQ5dMuF
         M6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IYBjSkPqiF1Q7aroSmlVM5LkIt2KNzS/cz62frb4mK4=;
        b=wYDZOFh/ctbzhCBllaMO076Ia7x5vFoQ6EnlvuDjsWwFhmSUjmvT/HopGJlISg79cs
         kFgrnfKj7RWN0gdQK33H64RL6rzT48SJhR7H9GCVYb75lvooVveGxXOIUmkEu1UbCKPi
         e+ToTSUlUfw//5R+8P/8E2xnAAQROjQnXv5qRrssKAoq8UGtvRzJHIUsZPdycYHjPxJx
         R9JmdCFg5RhQYOMvm4LEHlHQJhuTUAWYse3MkHeGzHVHUH/EAkgnEjY4KKWsd1cVHq01
         LUfk+A1gZ79PbZHCUIm3/gCKv4mxSxZJm7toKYe8fn6f7TeEZ3idKytw5SKKdJfoebH7
         gj1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mamss0LO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ay8sor4649020wmb.0.2022.02.07.09.11.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Feb 2022 09:11:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mamss0LO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IYBjSkPqiF1Q7aroSmlVM5LkIt2KNzS/cz62frb4mK4=;
        b=Mamss0LO8TnR91E1sfSb0j4AdQZ2KWMaBb+LRt8UpMKsDjeHjbxhOSGVpqDJoRqNKZ
         QqPPmE8E2b2wVE/x6W2VjWyFr1KfCdyn8zuRZEOUm/NV8fawdA4iyp1z2Bu72dNi6ipp
         yukQApR8HydO6O2I0L7qsNuwI5JedSdhnA/KmUkZ6DWceDCBGCXlynhwCjc6uuxUrHlV
         ISNBXskhoRMCoj1Qw7EOGLZcf4kM5GwOCwvDz4Tce3J4BoGKF3dTZ1whim5M4OsQXf4V
         dNqF1g0YLpqIIkOYqabgAyV0r6SPlzvi4yI6kfVHUtc8kFDSjskfUwkbiu0snfHFjJkF
         6IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IYBjSkPqiF1Q7aroSmlVM5LkIt2KNzS/cz62frb4mK4=;
        b=m8G1FRnm9FCzdrix1Bj4Q+43LlPpVWbYILMXb+/H1BbHBoN5/U7YvdX0wr0uAkls5l
         ey9CJfhB/XawzdisZPxRLkwl6zHSyyX9+fMC0blA23gp9UDwdKncags0oYufkcfz/3bN
         T215a4Zb4piJyYwfM7I5qz8e+lRFyZZ1xCkn+mDrQAPm2YEWFoNLAlJ3Ga38DoZ5sVDS
         f/6KTLwsYsTf1n3pKtjyfsxKvnkOI/2hRTXSVs+KNSvkP/5vH4MAQd2zJFnbOr8gp2wh
         nbXSvhWFPhIOOOTmhf6/nJ8IdMYZliml2TsigCWxIiOvBVTMX4bMvqvD0PA3cvU8y+zj
         FlKw==
X-Gm-Message-State: AOAM532c8G3RgxieQc8nmKp/y+uWhTtjmATTfP4wMTaS2rKrTcDcjpAs
	hzTqYKsn/mZ+aCfsflO3TLIfFq87fLNbfi/UgLmhB17uWT8Juw==
X-Google-Smtp-Source: ABdhPJwG3ozAcGcz6p8MgWq64qv+wz5Zx88WLQR6dI8+yyQgdFs9T1lsiUjKUqIQNt0ARsQdyBXBtQglQBufK4WSZy8=
X-Received: by 2002:a05:600c:3552:: with SMTP id i18mr15440359wmq.21.1644253880510;
 Mon, 07 Feb 2022 09:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20220202122353.457084-1-alex.bennee@linaro.org>
In-Reply-To: <20220202122353.457084-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:11:09 +0000
Message-ID: <CAFEAcA93k6k7LaX0jk=j5PXZRs769OhRKuObv5VTsMSb0=X0MA@mail.gmail.com>
Subject: Re: [RFC PATCH] arm: force flag recalculation when messing with DAIF
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: x97SFBw32V+Q

On Wed, 2 Feb 2022 at 12:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The recently introduced debug tests in kvm-unit-tests exposed an error
> in our handling of singlestep cause by stale hflags. This is caught by
> --enable-debug-tcg when running the tests.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/helper-a64.c | 2 ++
>  1 file changed, 2 insertions(+)



Applied to target-arm.next, thanks.

-- PMM
