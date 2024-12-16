Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2196011njb;
        Mon, 16 Dec 2024 06:08:19 -0800 (PST)
X-Received: by 2002:a05:690c:d95:b0:6ef:58f9:4c0d with SMTP id 00721157ae682-6f279b9e06amr89181807b3.39.1734358098908;
        Mon, 16 Dec 2024 06:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734358098; cv=none;
        d=google.com; s=arc-20240605;
        b=LI5r+GDkwjsdGdWXJndFuoT/A5Nnr8WmJ2UuP8QXExU8zhmvIuK3iTPTy08KZZE4t2
         iNCfnPTkOKtQxXa1zJVzpyVFrAxkPeaKNkktBqh7aZ3M8+5lpBWOOkXep57JVzOCzWEA
         5yqo2bMc767z7SYO7ORqxWgbONiWP7siFCauJrFk32sc6PUVgBKiDGhm404veMLo0sqj
         F2Edw3GUEsHfK4Gn/dMeBIbEf7EYTt54xZblClUnLreH24OV3p0o6zJVKZ7z/8IF1oq0
         NyTiRxUCyBIqzDJqpm2y160jxP81xSQ22cQ1HwyCZc/oYie2dMdhyl4IdJrAi1UgpB9B
         5xvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q0GyJjjnZ37UxeSbRujj75zDGS5Zc2xrI0ozr18gJP0=;
        fh=7PFDX/P0vYSP73t1gdCNZILQOuIL1xBd+Dov6jfa9GM=;
        b=FCWHjR6+rxoABbdPp9PYD4yRO1jmiL9CMWLGCHb8qV36ajG06dgZuM8VeeVRfJxL8n
         uenceoWx8m0mD6fhUO2c9mHra2QfHQ0hHV13vZHfFwT/zrY1hSPtV+FRJMivhA8W/tiV
         ZhtohAT2RmU2n0xWpVz1zKLmVoknFG1usMpFpvOT5t8bam2R4OsTxXknrDlFWC7ff6J1
         ZkSioYUQN97T1hdmXUpxGUTaSjxSMzKEgapDpTPksstnnWxWCw9gWlpMlngkWlntfuqp
         emqjH3Mc8mxEJLw6D78A9wDGRaLPWrpWVyebdoiSNDfuZNFpUqdrX87KelR2J4QaBnle
         sGmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g0z/SLmt";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f28900f6cfsor28862437b3.7.2024.12.16.06.08.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 06:08:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g0z/SLmt";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358098; x=1734962898; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0GyJjjnZ37UxeSbRujj75zDGS5Zc2xrI0ozr18gJP0=;
        b=g0z/SLmtBiSAkcPtMiDrsz5Iu6GF+cmyULiCubJIJK8LSRC+247BBFzyZrM+YFxeHB
         PN7eB7eWWTVV32UTlitYLbQq/Hf1rUzf4G2agsGAFAAryrN0dAVYfYaKEHtIQ4//SUd+
         E7jvXPlH8RGLLV8LBsBODCcghbEAtjMeO//vNE/l+Qv+GheA5w16LYMQvvStjgsuwJdT
         14xUt3npsSyJw4afBQ+cafMXeodf3PnNs8uatamKdUf1131nsS2ecymajYltKnEHCFGH
         RxhPgtP1ZQ8O91ljQ8ZqyPbuTXxTuwPREti56IKKwbQTeb+bfI2iCYHtl1bOkE1QzXjE
         oAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358098; x=1734962898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0GyJjjnZ37UxeSbRujj75zDGS5Zc2xrI0ozr18gJP0=;
        b=McZ3fhX3GJ5iMGuy2x5AgkYbb3UQHajogv0nJCTeX0otNMELQxn9Xrs/AR+5z1UjB6
         jzlx5Uj3BItCNMC4EzcSmE2mmLM7PhyAoGbBAnLopyS+SXvNOkZvjXjgPiLq03eFuUy8
         3I9+xq6Baw73VLfrnq3VE6QceARAUamWdYNBSk4+TnO/2lpdAyJPfgf75mJhD8Z3ZY7b
         KK8OwacPv562B7xljc2tWhcobLQIfoqmGfTWmEwQpjuwO/rbJIDkxXQnobrIrgtNNUfj
         UDyMVgEO5eUNwewgU51dSnuHfQy5cuKUjaTuUqEpF12sMO8DLxIjoqxD/kBuUyx73vlY
         tHLQ==
X-Gm-Message-State: AOJu0Yx3cf1Ihu9VGkJ8BSa6p4NlOJHvtKTrNyyx9oxHx2jrVQZmwPpi
	QJBzR+ZaEmr0jvI0z2ngHxmABK1x+dyF05YAjdVq8rNoI89oSeL/vlR5LyWiyggFilDszr5EiGv
	CVWa0whHoYX72yRGPgNJX9AArixkOxvj8GpVcJVKRBwD6hz/Hb7M=
X-Gm-Gg: ASbGnctlxOg1hYw/NxB8WijcgPzw35k1taSmNo+VYZx2r0vWXvn/fLkykDyowuR2/uX
	B27kBzMoGLvDpD0PFWw72wAkn9qzl8HGAur2umyY=
X-Google-Smtp-Source: AGHT+IGHI7ww0IgT30GDBuj4f1NsFwPnMgLXb6BGOS9hRJKPihfY46vY2jfVEf8j98FO/i6vf+iO7/2ffJJ9pBNM/nc=
X-Received: by 2002:a05:690c:ecc:b0:6ef:6107:69c9 with SMTP id
 00721157ae682-6f279adc3e8mr90559587b3.4.1734358098551; Mon, 16 Dec 2024
 06:08:18 -0800 (PST)
MIME-Version: 1.0
References: <20241206160239.3229094-1-alex.bennee@linaro.org> <20241206160239.3229094-2-alex.bennee@linaro.org>
In-Reply-To: <20241206160239.3229094-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2024 14:08:07 +0000
Message-ID: <CAFEAcA_TEaikCWjfMBNMc9Ra09+Zbt4X-9L-0ty=euxt2tLHyQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: document the architectural names of our GTIMERs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OHMFsVKFMK91

On Fri, 6 Dec 2024 at 16:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> As we are about to add more physical and virtual timers lets make it
> clear what each timer does.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>  target/arm/gtimer.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/gtimer.h b/target/arm/gtimer.h
> index b992941bef..de016e6da3 100644
> --- a/target/arm/gtimer.h
> +++ b/target/arm/gtimer.h
> @@ -10,11 +10,11 @@
>  #define TARGET_ARM_GTIMER_H
>
>  enum {
> -    GTIMER_PHYS     =3D 0,
> -    GTIMER_VIRT     =3D 1,
> -    GTIMER_HYP      =3D 2,
> -    GTIMER_SEC      =3D 3,
> -    GTIMER_HYPVIRT  =3D 4,
> +    GTIMER_PHYS     =3D 0, /* EL1 physical timer */
> +    GTIMER_VIRT     =3D 1, /* EL1 virtual timer */
> +    GTIMER_HYP      =3D 2, /* EL2 physical timer */
> +    GTIMER_SEC      =3D 3, /* EL3 physical timer */
> +    GTIMER_HYPVIRT  =3D 4, /* EL2 virtual timer */
>  #define NUM_GTIMERS   5
>  };

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
