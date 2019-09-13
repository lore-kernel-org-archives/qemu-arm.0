Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp715891wrp;
        Fri, 13 Sep 2019 06:02:18 -0700 (PDT)
X-Received: by 2002:a05:6830:149:: with SMTP id j9mr41788260otp.83.1568379738577;
        Fri, 13 Sep 2019 06:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568379738; cv=none;
        d=google.com; s=arc-20160816;
        b=iyi5uRjG8Z8CgzpaFCZHNawiSNyU8WhxloocmcMKYBirPBRMJHno3d7W9b5RL7Zb/t
         v22vBCdTuMukWXMl/hFZ8Zbkse7TNeCG2/b8lmuZqnrdnSr6Iq4LQELzvD0ffT2wb+Ne
         KMh4InhCeaJf3Areu+JqV9xbZ/o08MdfwPoZACd4WvYTE2Q0MHuqyocIJPtKiPteK3Sy
         oF3tCG9d0jciHGUSAycEN2/t4T3O6jBGBdGV9pmDSG+7NvKMSksX/CH3nKl0J4oUs+K+
         3hQ8dg0bthzX8F+Z8TLEoqAqMR4URaign9GrdGNa1HmeNR2jtRP6PZf50DsvhhrIfay7
         Q/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qr3ZNGKXSM/zMmqNE1C/HtVK3Szcs5QqXxuxJEUtTpk=;
        b=ErSMnAW0qLx4A+/J0mWEE3xULRjwWFFHhvFjDc18+eGsYYmEYIvB61jhJLVLqJ0796
         K+ygESEwOiITI0s/H4EFRnCo5KQiSSYSOdAhAZKGNN3+hCjP6PJT+I7yPI8fD+aQUoDa
         Ls9X1XeSkkzl7KdcLLOatqlatdKCBhkiXWzQyrV4PKP9/h1sQ6iaRjhXJBu6TJNFrfsT
         ztF46HkGlpQ3+EE/GwNDwC1pG9+V86LJmAT+x4iAFFBHhJpjLU57Z3Hvyf7uQsSk/NF8
         vWiMurvnpoh17dYFF5amgcuKF45RP+PL8UeRAfowkJOekIvWnXMhQ4M2iDPEBLbocA+4
         Jxwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V3f2F0bj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 20sor1289075oix.169.2019.09.13.06.02.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Sep 2019 06:02:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V3f2F0bj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qr3ZNGKXSM/zMmqNE1C/HtVK3Szcs5QqXxuxJEUtTpk=;
        b=V3f2F0bjZ9PycjbUNQdRehgxaam7l3AxT7cBLimoWbu+M+aRmAlEX0o4MQypBeR2hw
         TwacFey2fXLgesYXTB7t8e9tJ1X/kvwefmh0DubGizAFpfnrSSYRJGWq2LzLAhdVlPqI
         GN1MldUmk/l92kDyy+3LNFRHb0au58UI/97kEu/CClDSOGO00R4EEmzJEYXjncQy3gA2
         ZJnyKQy/9P8obZKGPv+bHd1++a0faRyGU3tEw5oQXvui2wcYB4fRoE060kC60H8WJlzW
         kNJWJefJ+o/JjUAjjk2+bBQjCMC/vSjjrXnZLw5aBMBUemE+r8bDd6bXDXbT4183DnH1
         xe4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qr3ZNGKXSM/zMmqNE1C/HtVK3Szcs5QqXxuxJEUtTpk=;
        b=hK166DtQizU1FaF+cWIlsuhAxOMGyX3l9qQZnszr1tGzN2k+hdkDv3/UO7eHWLcsv1
         06o+4Rn+2PIQAQJbbHJmKFoBU7mPcS3MMbXiS/KyMLHA+TYLQ2b5eB5Zx4Wq0AsY4wzt
         jLM2py0m3Z8XxI7th2m4lHmSIHUkuDLJEitlNrF0KOPYFcslsesGX4BQusHCCnwCZmPq
         uMn3Kv0PB7OmzJROX+vShKq6PipQusx6ZksCMVp4jRvO955CASTAs0RY5CLQWNR57cvg
         divhfZfTAPo5dY9Nb8nBeeP9SRbC1pcBajeI/ZKICLEqkfKD77qeLSn18OQJLM/REbjQ
         qOrw==
X-Gm-Message-State: APjAAAVOWk4/RmGESN52PAE5yKvaY5GHWw1CieuxqRzQAZpVcQBi1dZk
	UQXnp7221rkIWLJaJN3Ygh4IbqLKhCqHjikkGhg2uK7w9Qvapg==
X-Google-Smtp-Source: APXvYqyjuhmL9o6onv1ivRkrpzxEOEC67f6t22u2jfmf7tTUDpY853b7mKjNr4FulZZNU1Gp7lCLPJCLd1wn2pWAyCg=
X-Received: by 2002:aca:b48a:: with SMTP id d132mr3090985oif.98.1568379737991;
 Fri, 13 Sep 2019 06:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190911164959.11003-1-alex.bennee@linaro.org> <20190911164959.11003-2-alex.bennee@linaro.org>
In-Reply-To: <20190911164959.11003-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Sep 2019 14:02:07 +0100
Message-ID: <CAFEAcA9ifMtjh80FvmhbYNB=5DtE=82xQqqUUmUE81UMyC_j1Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] tests/tcg: clean-up some comments after the de-tangling
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vGXTBj0Ydn79

On Wed, 11 Sep 2019 at 17:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> These were missed in the recent de-tangling so have been updated to be
> more actuate. I've also built up ARM_TESTS in a manner similar to
> AARCH64_TESTS for better consistency.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
