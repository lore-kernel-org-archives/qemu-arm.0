Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3611011lfb;
        Mon, 9 Nov 2020 05:10:46 -0800 (PST)
X-Received: by 2002:a17:906:3852:: with SMTP id w18mr14435540ejc.551.1604927446556;
        Mon, 09 Nov 2020 05:10:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604927446; cv=none;
        d=google.com; s=arc-20160816;
        b=YoMPYJEKNmXavFRqMiqFsoKxlHPcLaMTwdPwyf+GiM2BplV4QmQ8p2i8508DgdRWLM
         FrOXfOm7Fn8RX5YU7LdjLsQLa6e8DUOCyqHeRcf3W2AWKjBSH5WKq0CfWjTISE3HJe9t
         4eYAiCflHpyVb3JNOCmr1Oi0nuVMbYy7ZUGLciL9qwYpOnoAN8sqzsVIgdSr02SMIIPo
         aTR+uf9uFWu164ZKR3miBvj9xB5aLd6AWx1F7K6iMtLkIbAiBGFrANmdSYKHjXm/KhNE
         KKy9itJsiGSWItvMB0q2InsIt0dE6rrQGRK309B4aZ8eLMzbHhN/PC7IiktfdSMwH+k6
         S5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ftFoZ+uZmH3wDSM3hDnWljMNS89Iorvh0uGunD681GM=;
        b=hqwEzlkYfISZ0wGRNbzJw4YwRjsNZSIk3p1ckCS4pi0JNZ6myG1jPpjrrAHoFZjZrm
         YEzNSuyxY/J07MNT4qQxnJy9DIQa363maRXCeKsBQ6Cc5O5h5Iur2bvotOOqPiWHf0yi
         NXX800abrLxhA7qfsQzIvGgKxeb8l+x1vl68qFKUqULwAufj+HPWyBpfHxsJBhDEajKu
         lXlhliN2rvHYD92aPVMRM7GKLf7QWGOtF/Q/FOMOiD/6JctEDSiUzg4XJMQxF6GquU9S
         20nxwjJqht6pLC9IK4s0p/2RdLo6ql9RnZ0y9RwLotx2eCkpEJ+18VXU+6hU6G8fwGqw
         3p5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H8bkzlaT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id zm18sor4720814ejb.44.2020.11.09.05.10.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Nov 2020 05:10:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H8bkzlaT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ftFoZ+uZmH3wDSM3hDnWljMNS89Iorvh0uGunD681GM=;
        b=H8bkzlaTQcQD5pQxoqyqJPXgTDZTWRPzn2atdCKdyQg/3R9CkrSy7xTEuh2dWR2b6D
         qjbQNyTkcydSSNwJElzGpLejJTo6VkUnrcqfItKK29fXzpmIY0WugiNQqVTDkXfSgp12
         qQHEd9ru0lQBmIirbM6e1v712B5IrMKBa8oqjXz4eYSYShr9viRkUNOdR/zikuDdcZvK
         yD0jQ+Rnd4zSraQk+2R4GyCHIJSbUg9ci8vkvpEjGwpmT29XDKJ5xWeKrgA7DPvTlb8l
         Wi3ts68iwcG9vGtALFc44Fc+C0ZaVt4Y0Gc3fqFB2CW9z5ozzcW/RahIiYzuLkWCYV+c
         AO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ftFoZ+uZmH3wDSM3hDnWljMNS89Iorvh0uGunD681GM=;
        b=PPrhwLE/6mOqO2/Ll4VdI224hGNVNjKT3ZvzSDbhOLJuP2qF/uNDdddBGL3FkJBygm
         7h46dopwFeTFi/3q1RpMMMWoc18Lf+BVmGWyQpuq4snvKEH0Hm1HSTeOzStudN5wYc8k
         29Ao/sccD0VYENQEc8N+h2tv0NwlZB7ycTxc9SY0Bd1026HjNSJuBaojFfiu/Nl8VdcV
         /U/lkjw2bzkaGZ0oIF7skWdRIBQziO2fWVKoO5pfGR5EU2OaNuKt+RpPKAUSPmYHP/Gd
         XQdE2HQ/voz+iTXEw2eYq+wrODJuqEIT8OxvvBJUlrfnPpt+RRs3XBrie3bUuSEtubFa
         SAyQ==
X-Gm-Message-State: AOAM530DBHIu8vqym4AiG/sgKicaZxu3mIsHV95k07hCQmCHKdjkE/up
	kVO3/wt9vTEcaJqF1eVE/2btuhHNtU6KXv/Lw9X7VsEDn3a9Uw==
X-Google-Smtp-Source: ABdhPJxMMwP28LUWtSWVVRKnGjIGgCfgMby6BeyRIil9rPc3d67rUow16uEwC4ypGIVHHyToldNqKpGGrkHhrTLImjw=
X-Received: by 2002:a17:906:7254:: with SMTP id n20mr14192338ejk.382.1604927445937;
 Mon, 09 Nov 2020 05:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20201104165254.24822-1-alex.bennee@linaro.org>
In-Reply-To: <20201104165254.24822-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 13:10:34 +0000
Message-ID: <CAFEAcA8vjXHFEripcd69F++j7V_ZHkK8Y+RJ7WN942JbJ3JCpQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: add some notes on the sbsa-ref machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Graeme Gregory <graeme@nuviainc.com>, 
	Leif Lindholm <leif@nuviainc.com>, Shashi Mallela <shashi.mallela@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PZleFPGNucHA

On Wed, 4 Nov 2020 at 16:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> We should at least document what this machine is about.
>
> Reviewed-by: Graeme Gregory <graeme@nuviainc.com>
> Cc: Leif Lindholm <leif@nuviainc.com>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - reworded command line bit as per Leif
>   - s/cortex-a57 cpus/AArch64 CPUs/
>   - dropped the trailing .'s
> ---
>  docs/system/arm/sbsa.rst   | 32 ++++++++++++++++++++++++++++++++

This filename...

> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -79,6 +79,7 @@ undocumented; you can get a complete list by running
>     arm/mps2
>     arm/musca
>     arm/realview
> +   arm/sbsa-ref

...doesn't match the name you used here, so the docs don't
build. I've fixed this nit in target-arm.next.

-- PMM
