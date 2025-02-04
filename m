Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp92256njb;
        Tue, 4 Feb 2025 01:22:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjP/R44AjTjkDt7S02oA5NPU5cdaCbG5YuONQRFc4s9v8IOWTzduq5Q6PO//2YXMCJyHF6PoOSB/TPOA==@linaro.org
X-Received: by 2002:a05:690c:c99:b0:6f6:7ef2:fe74 with SMTP id 00721157ae682-6f7a8426a5dmr187290397b3.32.1738660971685;
        Tue, 04 Feb 2025 01:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738660971; cv=none;
        d=google.com; s=arc-20240605;
        b=buxN45PyIcmY3mE+1y7UEkDXJ/loF2j2pOn7x00swD1Rn0NfhR2EdQ8J6gtrqMGTpT
         Des04WEoVf6GSpdzilJrh9PXFLZpVYCMimxlNh0cjiymtTuLwONAuBkuHSZbOmWVn27Y
         8VKenRTr97jZJiTlFqqZylCVhIfjl/Fmn/soDFZBB3av/9S0Qmt5uzAm4HJIDEj6GEu3
         nCTph8KogkaOpvyX9J1O/Qo+YY3BNgRSP7EeTjCtMDObGITJhDHDWAdfpQ+36qAyV082
         3QS8ie5qJ0WH3H7YK7kiBPpt76qQK5fq/buWUCg42CA5amJuUKb3ZlwRW/DdK345ZNYR
         gMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmTq86FYCcD32W1a13YONW1OgZwVXJNTzJxvAv4s/LI=;
        fh=UA/0VAygUlDSH2BGVbxqZblWdivfEHTOdVjJhTcekr4=;
        b=bhPYzheQcVj+yp6YNkxv/HESiCsVrRiRhjkcRThPxL19lBc8XCW58oYRAK0jVnFIpT
         6cOFZ/ZP3JcJXfibxBkeEaFQpc58fIBSTPSXfTz++X3SJpjg/Dsba8Wv/Vu1Dt6ajb6o
         1C1JnEdGP+eKL5pZC7lwqZARIiwY0/MGNo/feR5z2wj2+fZRnOUz9oFv2WqJKcfAQjaR
         NK6WF0weeRYDAMUkH9JgpSlLNZpo7jnyyLPrIE2cvUQMoYoI8Y/Qtv78wgMUOJjK3KFe
         vbI5uEKB/S3PsS6KM3a8ryW8MFz89dyk9x/BTdrGRKAdRoH43DevksRKzCwiCwRWA2ED
         Sxhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OO+qaHHV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5acb28327csor5942993276.4.2025.02.04.01.22.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 01:22:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OO+qaHHV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738660971; x=1739265771; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmTq86FYCcD32W1a13YONW1OgZwVXJNTzJxvAv4s/LI=;
        b=OO+qaHHV0ULbIPaFl04mkSsVIYjd/mKvkoX3UqVQlPZ/NdmaXMGc/CA3991WeynQwG
         r9EtoIGPwhr6frgFUsldyL6YNPC6iL8ychORa1UTZnUOe/nCUGO67Jfa/derlw2XUwc7
         9zSEKjt6ez1m/dq4Oay/23UVh+cY403rnqHAbWIET/VlLGQCjR2aIczwMsrVsT+QeuZ6
         p6dpGk7PT5xNp06du0VWxl2U0O513JSycToukZeNEji9uLxbDIBFF/JwYZvQDwdY0pgN
         Nwh70PQR3rNRGV8NlCfiDC4Mx6VIu0ER8bTmf8ZKxDK4MxVVBKBpv2smN7L0xlDObcqF
         13Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738660971; x=1739265771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmTq86FYCcD32W1a13YONW1OgZwVXJNTzJxvAv4s/LI=;
        b=QjmbWxY8yGo1BmcD7RAEqsvnpA3XRjmoOL0Xh2HwHdD2EuJs7/VsvwqUs9NckLQko8
         3PFXj+nS+vqGtUL96jH/GELBYAyLNWix+bkNEKSdusngOCPephihqQPe6yWOMM1AxM0J
         mIb4psW+zc+SjVBq4tBDGdW7IH0QOPUpYuUPJyOhQ2xhJ7fyMHDizKH+yEvshvh+YvBc
         TZ2tsRQtG8ksUHDTnqd/sp7DDhnxGBH3KIE4IV5huCmG8z2934qlF3fiJauAA2ZsIAct
         IUKLGJdJm7ZPeyvY9M43Uzc5poMfCd46dJCScqmDSXY7RrDlCw0RJmgYYU84jAJJc/ya
         g86g==
X-Forwarded-Encrypted: i=1; AJvYcCWD5JzhJM1MjC+49cG7STQjvsUecIVsV+vBnzx0TGFHSFKujahyesFC9aTDmI1f/SYESRsQQcxoeESc2g==@linaro.org
X-Gm-Message-State: AOJu0Ywb6AqwMOJzKNGyootuGtzmSOKqLjQJPKIalsUwIxOwa/9ParKu
	iHwY4dVeQVqv2z4tEnzYf2Mb4A3/Xno+DpfDATHkCR9wgxICBsmzqF5QEfw02YdS/Q6LqiaNSyb
	6V4k4B91FHPIq0cyOocaoXKwstmO14NR+YgXxxuTx
X-Gm-Gg: ASbGncsxUkAdbwuNlXed7ZdnWiibRPl950n7hULS3zwYqhd6RXm+IF/REXF78JPCV1y
	/XTd/UsE7lUuJ9dVhdwNxBM320txYKd76u6zHYZq52c1vyXErFShqrUnJg3X+t9fTikYjAUVIWw
	==
X-Google-Smtp-Source: AGHT+IFFjXuj8XbVbZVDT1GJ1qUUlvLcG/+G3580Q4Aiu9VRYi6+8xxGCC+IlQwKFz0q0mtKFx5CW37+SY+RBGB6Mh0=
X-Received: by 2002:a05:6902:18c5:b0:e4d:89e9:6a96 with SMTP id
 3f1490d57ef6-e58a4ac4ad0mr18807657276.18.1738660971230; Tue, 04 Feb 2025
 01:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-12-philmd@linaro.org>
In-Reply-To: <20250204002240.97830-12-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 09:22:40 +0000
X-Gm-Features: AWEUYZnyAqsYIZvVkTJpPKo3klQkwasA6ZLEXrr7ajvWzT26Y73l5f5_IaGZxzE
Message-ID: <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>, 
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, Jared Mauch <jared+home@puck.nether.net>, 
	Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dP3HEXc0AU4Q

On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> All previous raspi machines can be created using the
> generic machine. Deprecate the old names to maintain
> a single one. Update the tests.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 4a3c302962a..c9a11a52f78 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze ``petalogix-ml605`=
` and ``xlnx-zynqmp-pmu`` ma
>  Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little e=
ndian
>  CPUs. Big endian support is not tested.
>
> +ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b`` and=
 ``raspi4b`` machines (since 10.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''=
''''''''''''''''''''''''''''''''''
> +
> +The Raspberry Pi machines have been unified under the generic ``raspi`` =
machine,
> +which takes the model as argument.
> +
> +    - `raspi0`` is now an alias for ``raspi,model=3DZero``
> +    - `raspi1ap`` is now an alias for ``raspi,model=3D1A+``
> +    - `raspi2b`` is now an alias for ``raspi,model=3D2B``
> +    - `raspi3ap`` is now an alias for ``raspi,model=3D3A+``
> +    - `raspi3b`` is now an alias for ``raspi,model=3D3B``
> +    - `raspi4b`` is now an alias for ``raspi,model=3D4B``

This is not how we typically handle "we have a bunch
of different devboards in one family". What's wrong with the
existing set of machine names?

Can we implement "support more than just the fixed amount
of RAM" by making '-m 2G' work, without changing the
machine names at all, please?

thanks
-- PMM
