Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2957803ejs;
        Sat, 13 Jan 2024 05:27:24 -0800 (PST)
X-Received: by 2002:a17:907:8b8b:b0:a2c:e236:f944 with SMTP id tb11-20020a1709078b8b00b00a2ce236f944mr2022064ejc.27.1705152444583;
        Sat, 13 Jan 2024 05:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705152444; cv=none;
        d=google.com; s=arc-20160816;
        b=wIxYyWLiXlPE+ZgO3z8O7XmDz17o0hHSEkpimD2lp24sF+PMYzufaj/emAzJxozDVW
         St7di67GZZJObwM7zdhBg3AEv3DfRka3+EH9Jq/3FUO9C4KQCsJWaFvtWxvxqSAS1HFy
         0adTenK1vkZ8DKYdh8hToSbPf/s1TJQJbO2OdBZV02hu33apU6TyWu5Z/V+UUqv7QWCM
         eVVE6wjCeaCyYpZa/m/h0ehL1t/ISbNTKhnll0H62SVKxDP81rQrNLX9ybv2AB6wIhYT
         P4uG0k246WB0yB9Z0jkCjQtj6yks8HrXEo+EyW++MBKcR8F3Oa4SxGFR3CT1to0HyH48
         6zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VhOpWHYsUYOjsfTNAJI1YLA+pSFeaSMgSNSIrzcL3OE=;
        fh=TdHNMZ8OHJtpmGETXsguxom88UHQqP6xd+te8w86lwo=;
        b=ZKqQvXQHBkaavpFjwVOYKBdX5SlOto9BsehdnslIyeFhcGHWxPUZnEkVh48mHJz8QC
         xzBi9u6cmAWWPtZLtJxWaq4cl9f4dp2SjVnQ1QQAwakft/GZwjh5eUjc8rOKrNYKU916
         xxMJ4unTrcRP6zB3lHpJn1OMAxIFppi/5zEiIJs3Fy14lnfTuM1en8Wr8rO9zO9tIhF6
         hU4x0V+HEc0t3NJrojFRMIn9sraDq9BW0QdQpUiuEr7VKZr8OKWnYEQo3Tm0HPYZswsy
         JX7KLN8KNi2yNg5NI53PtJJBz39UONEaj+B1dU0+brJAMwSUQ/ghx1ZM9MxRbc+4q9m8
         bT0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wbgn76+L;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s3-20020a1709060c0300b00a2724176f2dsor158834ejf.8.2024.01.13.05.27.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 13 Jan 2024 05:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wbgn76+L;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705152444; x=1705757244; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhOpWHYsUYOjsfTNAJI1YLA+pSFeaSMgSNSIrzcL3OE=;
        b=Wbgn76+LUuNHvFM84qYXcHNmV8cZfbos0fV2olD9sM2KxNFjMdcCA1R0lb1OQK/eUZ
         mBQ17/X5mUkuplKZT5D9XOOvwGkTAI6wFpfJZUdV3VLHlL8DN6nk17OHfXqoc/WiOvmm
         ZLVZ5JWYwRWaXZ+TSb3KK1WVr0oaNec7rhFF7yxI9NbDxUnSD4tm8rvMxHnVpGDsxkiL
         cMSlCuHLM3vje2oUZyp1qPBJ2mxPe9YF5SVkYBm71ZhYOxm5y+D2DrVve62dJWHuCKYJ
         6n1HA/qzFFcHsX1xy/pxRTCfUKaOv90+YmaaQ0YPHPuQAuMSr00cUp9sbkNz/PsQI9Rn
         kZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705152444; x=1705757244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhOpWHYsUYOjsfTNAJI1YLA+pSFeaSMgSNSIrzcL3OE=;
        b=Qb7MVSfdl7bnH7ATx+emjmaSjQRvEq0lvxIq4hDhviJOOwp4iF7HGY+gwmii53ni/5
         Aglr0S37rZXhUoaZEQ0EUuN72nN7mQe6to10Dd+NKV39ktLS0md87j0wTvSJj5d7h5Wi
         wFsP8Azzst4sQGZuzc/31kd/dneqmpbeAcil+MnbeyRS8djaRcQyCkACox6aFwz4mwBA
         kBTwSZnvYle8yT5nKXNIde+ilEyw4RS1Q3PenJWtkjtp+w47wLX8SZpkQCW4ydZucd3O
         Z9YkZVxfpx/INl7hMxtdxQwrnQuiVKsie4NQJfnbi/vlv52Bmk2ZR38WGALFxD9q+LwC
         wU0A==
X-Gm-Message-State: AOJu0YzFcRR5bCop1NBPAPUd1bWOP9ncYfiRIiqy/VRYFbetB9y39DgZ
	QDh/tNkweMkkyTe9FlU6oPt5PegOyWDaesgrkuv4GbvbadKwuIDk
X-Google-Smtp-Source: AGHT+IETav6rswDniDEM2jM13XalATxvLUlGh0idwcM0mH/cyRR3+57/HdLEZuqzCJncL6Jc79vE4BVUvW2HRBdz5+4=
X-Received: by 2002:a50:8a8a:0:b0:557:25a1:27ff with SMTP id
 j10-20020a508a8a000000b0055725a127ffmr3000588edj.38.1705152444271; Sat, 13
 Jan 2024 05:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20240110195329.3995-1-philmd@linaro.org> <20240110195329.3995-4-philmd@linaro.org>
In-Reply-To: <20240110195329.3995-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 13:26:51 +0000
Message-ID: <CAFEAcA9K1sH3ZObCtQzOe2AYiNKbrMLRoEbTB-f=N1NsCAnW-Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] hw/arm/armv7m: Move code setting
 'start-powered-off' property around
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Radoslaw Biernacki <rad@semihalf.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Markus Armbruster <armbru@redhat.com>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: kMOKOTTStSQ7

On Wed, 10 Jan 2024 at 19:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Reorganize a bit by first setting properties which are not
> dependent of CPU features (and can not fail).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
