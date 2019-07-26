Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11734054wrv;
        Fri, 26 Jul 2019 03:31:11 -0700 (PDT)
X-Received: by 2002:aca:4c16:: with SMTP id z22mr11104362oia.57.1564137071429;
        Fri, 26 Jul 2019 03:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564137071; cv=none;
        d=google.com; s=arc-20160816;
        b=0/zKMIrMmpb5muPGg7MQDJkvu6jcd+2gl4ewBHP57xeMQtLTfI+JBoYpcWNplHYzqW
         tnX5/jyAHcNq1s8cGO4Kaebr5orHO06w7Fg4+GSoSuzar3OrtcGrGv57GCJyrwYJ78G/
         jEGXgd7F1qxgip4m6AHZ7lzDL3kL+IVnY3o+CwrX2WRmnd1jvo2Uu7+SPTKQzwdaS8pk
         O98eCBA+KDEmXe0cWBBosM43ppy4/cRFbAs0CgwuVJRvZnEQeRfmkEqsEYiWYMGoYOAK
         hlBEklj5I5OH2TJzbhrG2VnSm0c5m7Yes1UR6C9V2Mt4h54zvfRtOeT6M6DNdSHCyyzW
         ELNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Js57P2GxEMkXfeB66CfbhBeEc4bvSPCyOyQZRR3vLy4=;
        b=nH4Ane/4ygVZFWjejvMjUsUKG1QiR6s9lo+/3/irFwupmzoGpyunrCY8s114Fz7NAB
         hKSQuXKbeuABTpYW/yj3fdEzybLLHQdkwRCap/KILVbHw3whwRLkWrh+RK3e80mQfwxU
         lubLK8teh5uXi8Cn6d1LohzdFR5FoHVOfRfzX8ouoi2CXR+1v3v0cZP9qZWpEzIYir9v
         WIhAHWjCKQmPXytL2elwhOQH/M/BW0HJuI/axn0cY+G3mQghZxUoWkdanLSZs2E3+pQx
         hpadhnksPDO3rfOCb6aK7xoJA2gEFltkQvamc5SZJUBOHSMS0BPu229KJP1/CTtmSjq/
         CPwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=po6VEKvI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g62sor23848872oia.160.2019.07.26.03.31.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 03:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=po6VEKvI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Js57P2GxEMkXfeB66CfbhBeEc4bvSPCyOyQZRR3vLy4=;
        b=po6VEKvIy26QR07pGgN1flfJ8l9sLtMJ3vo7gMJlfRZkcfw16HbFQ+g/hconvcsO4L
         RYVNdWp8/hM0BA99+LWqVPSvOqa0u4umow1hcn9b8LrlAzKzdaeD0Woc4sxq/gnQZ8R1
         ohfvgISzVcomizMSSlWDbOuQudFGwJfpQJZOUNFCdU+hfiG2ukQ1Ehwa8xEjcePzBCII
         WE6WIFyoZ81nPJT9KQIJBkfUeZ3qDL5+8qNwFN+R0riDYEHvXa08Xx1LC9pVnIe+aUji
         FYqDL384gIe9mnudwS7psZ0lY9BIsXIa6QBOirKqCw+Fwco6IuupIZNs1cIINRQsZ6s+
         sVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Js57P2GxEMkXfeB66CfbhBeEc4bvSPCyOyQZRR3vLy4=;
        b=FUQC9/6ipP7Zb6dANZ7vedATq4BMq/02LfdporIAh4reelxyfXQ31qfotIrbKIFjHy
         u1gFD3ehf8hC4kFJFVIZGfuG8UUHUHJlv5ITo8jLvAW3gvxzCyDdyYklHFPORTBlQ+jf
         tmJ8uBWwsV+/qT0IXGsH/Ey5VpZd7tt9Clg5+4sEG5x2zBf2T7BQPlAcz+6MsSoU+PWG
         CGaxArsNxZDZASounFl7Dobp8WwbEBO9CHr+jpe1Ni+YC/rGynN10EIk+s1xyzoTnrR5
         eRpA8psElSj5zGGLj1Qaf8OBwIByrtyP64eX49FZ0msU5nCT9J5IOAwT5QjFY/p1Ragz
         q4rg==
X-Gm-Message-State: APjAAAXljqXDhdWByUzWlLBtVoUY4qMWYrvW3daAhWi67nBf1x+rLhec
	InrGG7N7twg5Bz6McUCE4uS8EjoxjBHapkVvINIzQp71WVpYMw==
X-Google-Smtp-Source: APXvYqz6/MwwkpRocL7QGNHFowlWkbxA6h04m6MXYMJk0xb6B1MlhmyGJST6pPXPJJYz/BhMXyLv3RPsu9vghIasVkU=
X-Received: by 2002:aca:6185:: with SMTP id v127mr47521352oib.163.1564137070904;
 Fri, 26 Jul 2019 03:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190726103010.31741-1-alex.bennee@linaro.org>
In-Reply-To: <20190726103010.31741-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 11:30:59 +0100
Message-ID: <CAFEAcA9ioE_XcSuU_MXZAW=v-7Me6Nq_z9A830i+RswfNxGjcA@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm: generate a custom MIDR for -cpu max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: JmOy1YA5DB/m

On Fri, 26 Jul 2019 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While most features are now detected by probing the ID_* registers
> kernels can (and do) use MIDR_EL1 for working out of they have to
> apply errata. This can trip up warnings in the kernel as it tries to
> work out if it should apply workarounds to features that don't
> actually exist in the reported CPU type.
>
> Avoid this problem by synthesising our own MIDR value.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> +        /*
> +         * Reset MIDR so the guest doesn't mistake our 'max' CPU type fo=
r a real
> +         * one and try to apply errata workarounds or use impdef feature=
s we
> +         * don't provide.
> +         * An IMPLEMENTER field of 0 means "reserved for software use";
> +         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID re=
gisters
> +         * to see which features are present";
> +         * the VARIANT, PARTNUM and REVISION fields are all implementati=
on
> +         * defined and we choose to define VARIANT and set the others to=
 zero.
> +         */
> +        t =3D FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
> +        t =3D FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
> +        t =3D FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
> +        t =3D FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
> +        t =3D FIELD_DP64(t, MIDR_EL1, REVISION, 0);

Comment still says we set VARIANT but code says we set PARTNUM...

thanks
-- PMM
