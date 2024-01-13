Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2957618ejs;
        Sat, 13 Jan 2024 05:27:01 -0800 (PST)
X-Received: by 2002:a05:600c:21d2:b0:40e:48aa:c444 with SMTP id x18-20020a05600c21d200b0040e48aac444mr990116wmj.213.1705152421386;
        Sat, 13 Jan 2024 05:27:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705152421; cv=none;
        d=google.com; s=arc-20160816;
        b=TOfMdsNm/JuT2BopRKp75arQxONbBm4RPjZ7ImqSqT758DfgHkedY7RNqYKz3lNvrb
         B3nO8RoOGrHAHttEJXncaY8wILMqpRmBo3pW+LTHCTujtmK0O/mtRLdj89j3tmybcMAI
         7nw71GQXDdTxSTEFxBgUBvnDrMFo1+4mrYRxgtbDFVZgKtDLveSU3d+IR1oj5yo6GDNX
         t8WFxS3fC7EziXf2ylHzz6UkVfGivxJOkVsgIadY+uBJeYHkVM/j8jEf2cXkzhQpzDXs
         mqLiebFyFPwvZgR1YdBjASRB1JtyRWLjf3GXIkmhQAzfroO37wLestxWyl1y0Ttjoo5a
         m1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4E7p7rqv9QrDzAcefKqxjwbAZOy/bKLL4kgV3ObHpU=;
        fh=TdHNMZ8OHJtpmGETXsguxom88UHQqP6xd+te8w86lwo=;
        b=tNweEOnIjGgM8jQvjv7j3FckYkWCPkRyQUKltWpV/VM2Vi29W6ip0mGGXIBh2KBZx2
         /VZrkI46nnQ2wxI6olQnz6mU/9czeJjFEAJYOm4D+hKs9Mkf3fs494bu0wfvAr1PlneU
         qtrkjsTVAA23XSn5s5l8sDUGlcOQmMmneuPpnGLTwKWt3v+A2kehl/qQfSQvdHpOWGTD
         OJjK6n9nQH94Frze31xXtB3Uyc072xhhKYRKIWJc8c7OxAwIOwpf+lZet/SszsQLWmPO
         8oGih0kfwDmLh3c7Xs50uJEcvN0G1HFrqzvuy2dYg7S5n+S0C1hBL3uRYcZih7sIZQJN
         dQNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wcx8TBRA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p4-20020aa7d304000000b00553ee28b985sor1187300edq.11.2024.01.13.05.27.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 13 Jan 2024 05:27:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wcx8TBRA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705152421; x=1705757221; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4E7p7rqv9QrDzAcefKqxjwbAZOy/bKLL4kgV3ObHpU=;
        b=Wcx8TBRAopZH9HtsGZDI3OddtRLsyRlPcANbfs4EDsgHb1dNmF4DKtux6LuuLn5n8K
         CUNop1lQZ9tskfB9BWk2i+Jdy6b9eh9eYhG7drBcAiL+6iNpDPo+jpIFPpSOpKfgS20g
         H5LuhDmezBsDhyHNMAUIgHLnKiZ+0VWD6QUmbOXViBh1bmvbFZW21Pk3vkojE5X0OZNE
         vuBdM3tp6z8SZ1aP0JL9tfutnnOekrD2kgf0V6fH+CfhdHbTfnoXR1+86jM1gBu3lRjS
         Yj2SkCRu70I5IB6Ck+elUONwI5Si+DqY9Lma25mPOXrQDELklTnp11OK11LYRbgTUL8o
         344g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705152421; x=1705757221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4E7p7rqv9QrDzAcefKqxjwbAZOy/bKLL4kgV3ObHpU=;
        b=h8wvs6iT8/6by4oSfuFILQ0eH7npPSoAFf+P8QumPhklbkFNyKspF0TUngoZmQTdSL
         BpO+FxXNgYDQ1JanuOPJ/SarJapWgcplqqyUqQmKAlhDfYUbCfAQr6yc172z6C9t9yAD
         Oa6DT6JGHpsFHcnmykGyjKeqIIRC4skmCjUpipHF4TY0ahrWN3P2mExjabQqpEMpXtGN
         kqO91Dft3J2Igjzr5wGV1xakKFyv9vsK2mrwUZ2CCohzVoiKRmDtjuY9wEkmOP5FkX78
         eEdx6oC05pmKwDvoaEnu1CdVlRQmnlU+ok0WJUBpVHS7xCKXFsgEEC08UgnuTeudzYjl
         UloA==
X-Gm-Message-State: AOJu0YzY9FhLuas+8Gru7Xv0uWXMGgzLI0h+PMog/NkItRB1AhNtwyDv
	S/p3huelYSf/r/H36gf5WWyQ3eearUa95VRbLAVWLqSEHHVZ9II0
X-Google-Smtp-Source: AGHT+IF+dwRLiBap4Rsg/EOY6GTV+ITvrrulsmMMbDvR6Z13PiDA7mujtX9IeWPxKcLs8dtTXYvRQLH/dp2aOkqy/Do=
X-Received: by 2002:aa7:d483:0:b0:558:57f5:6474 with SMTP id
 b3-20020aa7d483000000b0055857f56474mr1077058edr.23.1705152421029; Sat, 13 Jan
 2024 05:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20240110195329.3995-1-philmd@linaro.org> <20240110195329.3995-3-philmd@linaro.org>
In-Reply-To: <20240110195329.3995-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 13:26:28 +0000
Message-ID: <CAFEAcA8x7iCgG5ESxGCmJW3w5UvacsFTQYPTQ=oiFjUe3Wn1_g@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] hw/arm/armv7m: Ensure requested CPU type
 implements ARM_FEATURE_M
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Radoslaw Biernacki <rad@semihalf.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Markus Armbruster <armbru@redhat.com>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /ZiqfPY756sS

On Wed, 10 Jan 2024 at 19:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> ARMV7M container can only accept M-profile CPU types.
> Check requested type is valid once to allow further simplifications.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/armv7m.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
