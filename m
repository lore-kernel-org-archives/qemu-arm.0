Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4897208lfm;
        Tue, 14 Apr 2020 04:49:50 -0700 (PDT)
X-Received: by 2002:aca:3ec6:: with SMTP id l189mr5421511oia.85.1586864989854;
        Tue, 14 Apr 2020 04:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586864989; cv=none;
        d=google.com; s=arc-20160816;
        b=Pshe8cBapxqGL1lcmPUsq2L96aq8H0mkJGta01lAMdvilcN68+2Wi3OCzFpCQpWxhB
         pfK7C4o7kwHehUcLv3UVGOKfc6TaVpR3+/wlQIRr6pyTEWYcvlSDof7AAoiOQyk5FB86
         T/2c6wOkUEzB2V5uifeFATiib5SNQSbYP2JOWOH5Jb/wR6ojyMIzXkyn2zILcCIYAsai
         lTJwCyVOSW1hDrPcwMfVc8/WboiBMPmbTbC2JigSTdFR1cSufsGUGfILKsKOjFiZzPnq
         vjtpHU/dJoTAaB8Ycai8OoZ93FhicF8uemJoo2qvp4FQK3ZgPMIEvSViB3GUdZ5nw93c
         Uw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3zVjl9tywF+ASgkOfEjaLlahSalUXP0Ec+nQFXkbJ8=;
        b=NKFTqtYTcd6muzZI2k8M11XObUy5E+cl07klc2mii6WSJoF3TGEsNdC+JuedCHPUKx
         6q0MGaSbRC5WnXanSJeI2yEZ8lDQ0MZqTEQyEg4vaH5sGzDIt2J6TaXfl0oh84JS3v1w
         MUAxN+cQOGvcfwdHSLb1FnB6cY9F8qqSP2ou15toQEwdQKencqx0jCdRzo9K9+0pDz5F
         qHU/bNk1SyJ0RUD3l8z/ZrqvLhHU8FsLGAk0B5bG4GGPa20Nxzll8gKXQuHDRYP7TdlT
         CyaO9HPO8W15q1uDvkVMFjqhzPgQwwXtzegBDpM0Lj7RjeeD4MH1j7EHUznWdOWmF+/8
         nAoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QtflTrt0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e14sor9031931oti.91.2020.04.14.04.49.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Apr 2020 04:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QtflTrt0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=d3zVjl9tywF+ASgkOfEjaLlahSalUXP0Ec+nQFXkbJ8=;
        b=QtflTrt0/0xZLRr1Rh5ldQ6kvZ8BQRRoRWQKQmjZ5N/mTUA0RyzGAWx8wLkh9dcR2s
         901RnyLrpzEq2jKrBNaz/M77SjggY88TVjb/lzUFQIUDnoQl9GYBzT2L5WCmmSL6sp/U
         fz6ksIwNB12grw3c3t+IJxgHWAUwTg4Og/xyutwJ/tSTR2WHaqhIyP7qdb4I3iyfJHHe
         oelZCwsjqfNAE19t5jgR+YVL0UxAWOoxVZA2YSgs32zuTZDwldjg/FmqrhlnD3d2rCy9
         gk4iWI8LXgZ1rMMR5M8F5qyDi5YMuprLYicCo1NAw+UjDQrVsXrcy9+bHUVAE2XHv4ZW
         keHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=d3zVjl9tywF+ASgkOfEjaLlahSalUXP0Ec+nQFXkbJ8=;
        b=ISrvQp6BJzjz109gMgSIv5UJo4FZB2WmQETCN+8WlgquNqx1pQ8/n5ygniA4gVYOB+
         Gfsnjlm5Dw8SmqlOdXwjBw4C+52jQjCT/mXxtmEq7yunG8/fIZHVPVSU5kW0bD4o3Hq3
         v6ez7npROFxs2/Frc4zIByCQPOrPhlCfcE988ta/YEESunP3d+VsKMORz2QS9E+O8XW0
         jj5KD2qQ4wyQcMLOS05FaK2jS1qCZgsvqnGkrsS6zkwvSo7t+3RECnlOao3T5bgVpDZD
         TGXac2pgJ5q+XxAcC7ghXwqoq8pUH58MzHlorCK5pVDI2SAkzYJJGYnyviK6Ks3m4kqU
         Amvg==
X-Gm-Message-State: AGi0PuYUUHZCXt1U1kP+qGuv7IWZdeM02kCRlPdkuI4hrvBO+N9X7kLx
	HovP7dH72oayuqp/e8eyKPjNVoka2IB0J459sTkOLbau
X-Google-Smtp-Source: APiQypKKqPaCN7tn9v84cU2s9U4g/rVcJfhSg148YBIgzaC4FMe7TyeJcn54YMnxoEFToHzoW340sQz9+R7LdiNfkeg=
X-Received: by 2002:a9d:7349:: with SMTP id l9mr17393031otk.221.1586864989455;
 Tue, 14 Apr 2020 04:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200414102427.7459-1-philmd@redhat.com> <CAFEAcA-PyMisjC25CSGyU5-ASjaAd7gQMabzMCR=uvudSBk-Fw@mail.gmail.com>
 <357e2335-b00f-cd28-4ade-d6286ace144f@redhat.com>
In-Reply-To: <357e2335-b00f-cd28-4ade-d6286ace144f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Apr 2020 12:49:38 +0100
Message-ID: <CAFEAcA8BgkqNQToJZy0=SOSxF2QWgxrP79Gj1qaVUm5xdvm65A@mail.gmail.com>
Subject: Re: [PATCH-for-5.0] gdbstub: Do not use memset() on GByteArray
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: M+9AD+AyBTWu

On Tue, 14 Apr 2020 at 12:05, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> > The other implementation option here would be
> >
> >       guint oldlen =3D array->len;
> >       g_byte_array_set_size(array, oldlen + len);
> >       memset(array->data + oldlen, 0, len);
>
> I thought about it but I'd rather not access GByteArray internals.

AIUI ->len and ->data are not internals -- they're
in the documentation as "public fields" and the code
example for GByteArray directly accesses ->data.
(Contrast GBytes, where there are no defined public
fields and instead there are functions g_bytes_get_data
and g_bytes_get_size.)

thanks
-- PMM
