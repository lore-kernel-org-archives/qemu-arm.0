Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp70999lfo;
        Fri, 4 Mar 2022 14:14:57 -0800 (PST)
X-Received: by 2002:a81:9101:0:b0:2dc:1af:e2e4 with SMTP id i1-20020a819101000000b002dc01afe2e4mr690826ywg.91.1646432097704;
        Fri, 04 Mar 2022 14:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646432097; cv=none;
        d=google.com; s=arc-20160816;
        b=owtd54Q5KUNgMGrP023FbxD9y2xYne8FzbSK5Qx9Yjtcc2C4Lh4p7Ldd2CxOyti2mT
         rEUoI7NwaJ/LAYFuBULUikel8PNefZhTRUkdnSNzeCykkrZEVx8Ys5ekWihD9yprTR5G
         Vb3nBwBXIJvOnYQsls9dLAmImaGpv4pHBhjES1l8JRC1SW7pJXtQKO9eWXtnn+mA/qog
         Bc2eMaaVSDYgXl7lGBnYJqjlRkXSXF0yyfox0A7rt5Kd2cTkqUAn1iEy9mgBIe7xs05u
         G1m0I/IrBr4bOoan+uHlG9UFmjOtVSvMDgMgUzJ1fc/Kxmj7RXqWuTzzZYF0GMu97UVD
         R0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gdbNZ31XJWqaW2I50GKPywK8aWePiBstoRfT9w+s8NQ=;
        b=iV4LT/XZGIy2vW7/QueNLu9ph26aLDcey5F/KCmDUadOC47safLAY+ecSm2AvbWlZP
         JgyAJVaJGJAVAgHYteYRnP4TGPmtPihHVY4M5e+Q2/dx6LF8/NsqSNKIYVXghrkyn6hO
         snJHgnhGI/HrVFWubv+73LwosOLnVhLju3UiqNEoHw66nX2aYhJPucqlzbUm/h2WkDG7
         vxIZuuc7bAohf5wP+R8Bl6bhrpSaTnfJKuq3gRGruYAW61ef3VGnUhjAcPsHRhzlo7GT
         VtNG3h73xJRjasSFSwbnv7Y090XeYQQUenKQvv/3VwYTBwqtoRlKfckkGiQEnE9udT06
         NTNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5toeCs0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f10-20020a5b0c0a000000b00628b2b69655sor1691642ybq.139.2022.03.04.14.14.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Mar 2022 14:14:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5toeCs0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gdbNZ31XJWqaW2I50GKPywK8aWePiBstoRfT9w+s8NQ=;
        b=y5toeCs0w6vEPJZqTyb7RK5llfhp6MkKw65YGg+9hO/jNa+KrRDMvOxMS7KkE12TxT
         p1o1GUmrrPv+mZ2/penZ4A0gTzt+UBU+YQydR/1BRiN9xAynXH9sBNnt/kQX6Z7Jt6Fu
         nfwOdN13EmHBOZjawDYl6joMR3TNArlr2ZO1pJqrSzVPJCffRV59jmqLc/qzii8PyTom
         M/sv3PM27HSyfaxPtYtyZcf7nTxHHMNRgNhf8YHU4rUqqvISaTgPPyojhJxjNj4pOXtH
         kXW2LCPbBVVuDFr9UPg6U2krplVz5pkfC0XAjhwKfd4ulEYca4GzuKYvDfjC4uQ767Qr
         uXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gdbNZ31XJWqaW2I50GKPywK8aWePiBstoRfT9w+s8NQ=;
        b=PEzLi+zhtmxg/TTY21ZjD39omzdlkKoSCWw01+jQE1LJBNBPeEvDpEsVwag1TSSEPo
         xFGJpQcTRM4QJBE6nrfo527JbIm06HuOUJQl7zyGYU65cEKbg8G1Dg/7EGZyfwOBleFI
         5tJGpe3l/FZz1vb0vT8RB+BiB9DC++xFSK2idyw/NpuavR9RGYrWELOywJYvFN+o03/o
         KNVwJwRSYQ5OQ8sYTWojJED907PrQ3EfPV3yLFY9qvDz0TTDkAmLs5QwAwDButNwSfZW
         J3Ziy1gHIEq2FNJNqLWuaTe8GQKiZDwJ3kMpKQ+ei5uxeA2z5cohoRtSYwswSFxjx0IN
         16fQ==
X-Gm-Message-State: AOAM532t1JZ8cENlVl8NdCaKsKeAsvV00UAXo5deR0b+WZqASKNoFyQn
	pKngWrCajJ9hRrfsSc7J2U1y2eMp9rugFtFbvD+DjKj7
X-Google-Smtp-Source: ABdhPJwCfGnIUStDaJdo/A22UqD9aLbnobpLxj0U0StM4r7HZIDU+8PjP2ISl2KadVmaQA6Hpk2XO9SHzCR5mc32xeI=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr590672yby.193.1646432097345; Fri, 04
 Mar 2022 14:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <20220301215958.157011-19-richard.henderson@linaro.org> <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
 <df2c63db-54d9-ae40-f403-b1adfa6bdbdc@linaro.org>
In-Reply-To: <df2c63db-54d9-ae40-f403-b1adfa6bdbdc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 22:14:46 +0000
Message-ID: <CAFEAcA8J7e_KeiV4bqZd_UnTveN8-5-YRr7MRKXWSWHa+x2WvA@mail.gmail.com>
Subject: Re: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: m/5FzSczEy+n

On Fri, 4 Mar 2022 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/4/22 01:52, Peter Maydell wrote:
> > Is it not possible to implement this in the usual "change
> > property for older versioned machines" way of adding to
> > the hw_compat arrays?
> >
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index d856485cb4d..dac82a709ba 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -37,7 +37,9 @@
> >   #include "hw/virtio/virtio.h"
> >   #include "hw/virtio/virtio-pci.h"
> >
> > -GlobalProperty hw_compat_6_2[] = {};
> > +GlobalProperty hw_compat_6_2[] = {
> > +    { "arm-cpu-max", "lpa2", "false" },
> > +};
> >   const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
>
> Hmm, I didn't try that, just mirrored the other examples within hw/arm/virt.c.
> I guess the real type name would be TYPE_ARM_MAX_CPU, or "max-arm-cpu".
>
> ...
>
> Yes, that works.  I'll send an update.

Do check it with KVM as well, to check the "CPU doesn't actually
have that property" case...

-- PMM
