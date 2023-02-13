Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp352260ejb;
        Mon, 13 Feb 2023 08:35:33 -0800 (PST)
X-Received: by 2002:a17:902:ce88:b0:19a:8304:21f1 with SMTP id f8-20020a170902ce8800b0019a830421f1mr10006190plg.69.1676306133123;
        Mon, 13 Feb 2023 08:35:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676306133; cv=none;
        d=google.com; s=arc-20160816;
        b=Jb6xpc11Tjdlszaejwiursp8Oi79JuetvqM+eBQsOR/1gJB43bOlYsufwecQMmFo2v
         53z6jKwdgZh9SCc003Kn5TiJvkXEs6IgSS8+Ls/INAZEh9TKeygNgQdUn8/RENU0NlAp
         Oaz7qcHBoGD16lYY4W5xZmoqmja8ZcgKizyQhO51pjGGpqF5SqX8YHstTZTst/dz24eV
         i2L/Hd029EY5Iee8mv60I7OdUEKAYJ+9MHUbw8X54XkqQ40lBeifoLbYPGStTkPbS8yB
         mdw/GhjlsejxROkrzFtKkGsJ6Vb7q2MHqvQ04guaK5Ur+isoNobIUi8wDHIhqyzpj+1F
         RA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4eiOANjcOPrGlNYJNCPfNFOaVVBwquXKj/iPMoMLi9A=;
        b=NeThjCdDxSk09gokaJtL7fobQsfa38nxSrkfXVzQKHtXajxbX/lcapF3YyB7cGuM+u
         /3IKYf0vNnA8KPyP1O++heK5vc1dghJnaxR4lxcFqZi6y0gBbGSwMHCPfF39PEbMzl+D
         zuMRaqClOqEBDoheIyry6n1YCHJRu9QoTYUBqMJrOwKV0yn9ToXJYAEazApQsSSs1dRX
         1cjlSS2cKDWTV4FasyWSa8mw6RTwhQCkudEnfibiJcv2FOVk0dUP69XeD0YOX7Zdy+wN
         tTOFR6x0f0pYjMuz/KYJm+TaAoNF4sW9sxgNPA4SOXpHxha5jfvnK/8OCioOL0k5hgLv
         mamg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esLQrXx2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o19-20020a170903211300b00199201d12cesor1795655ple.93.2023.02.13.08.35.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 08:35:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esLQrXx2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4eiOANjcOPrGlNYJNCPfNFOaVVBwquXKj/iPMoMLi9A=;
        b=esLQrXx2crH0eaEhI4ckDM05+ZyqiqEqsjuPxGAzUQR0X+G5C0alEB4NMWJcnOMmOs
         Ln9m2q2HCGrp8NVQ5CaWbZWQFw/tg7krlpmkacET/83AW5hsTwUe7RglFqGbIxZ/sA39
         MklQHufepBSXKltzwgdMPgQi23Vpdu9bQILuPsyb/Z3yFbaiEnKWCmAHlD44fj564dK9
         4pAXbwykrK0z4xDvcSJjyftr6q8wXkg7xocQIm/5KjDeqdeBy3bssCXO4Q2SwgmEGyUe
         FAOlYoYE2nMRCf1ZAoaXRn9nrNqVXJqep4f/a5EJaDRcsJKoaA4LgeFdQgNP9ZHlqeAE
         ci2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eiOANjcOPrGlNYJNCPfNFOaVVBwquXKj/iPMoMLi9A=;
        b=z52vH6ZNPec4tnL551oXInyCJzJkFhZ1an+gYBakKUgGtBX3T+eqjYFH5YrthucfP3
         r9Q0N/avyAKANExJUPyxbmkUBp9JRd2/64P29NQMveHn5r/KN8fOYXPw22uqj4LR8zCt
         M6fJr0BiefPSdR3OLMeFIlMIQsODYeXgHLJuXpnmO9Bvp8S/snje5tWh1xp9nWfamKOj
         typNXZiDNv7iIhkxFZ50KGrGdHlwAxwmNlMmoEtE71680Qo9xhQIvBuNa84Deftl4/MQ
         pHl7Fh5Yr6vB7h8ZcCSb9O0oXFgjVykd48QQIgJ3Nu6E6f1wVK0TnO8afqIKuN5wjkSK
         hpIQ==
X-Gm-Message-State: AO0yUKWeovjHKGHln4+lG3kVd/QVCi9M+nlSdScmyKijBvFxLWdoj1Gh
	z9xXCAclUXGm/q4D1M8Gdk7z36E/rNGZ8F4VyAD5XDTc
X-Google-Smtp-Source: AK7set+beKITcMdcKCuRVDmUZNOrMymtP4X2wdBD06Xp5V3T4nVgjBfq4+YSu6Q8bNtTD/fNbyizMCuxpS8dvwsEjR0=
X-Received: by 2002:a17:90a:384a:b0:230:bcbd:b871 with SMTP id
 l10-20020a17090a384a00b00230bcbdb871mr3880707pjf.75.1676306132668; Mon, 13
 Feb 2023 08:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com> <20230114161302.94595-2-fcagnin@quarkslab.com>
 <CAFEAcA8cOKCDF5_oxNLDd7JzvwUCC4_g_8RRmwPK3C2axLHuAg@mail.gmail.com> <CAF8_6KmYyCwKEoNx626uEKUJZAFB_MgLRHrTyeAkDdC4C2YfMg@mail.gmail.com>
In-Reply-To: <CAF8_6KmYyCwKEoNx626uEKUJZAFB_MgLRHrTyeAkDdC4C2YfMg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:35:21 +0000
Message-ID: <CAFEAcA8U6GKNHx0wrY3V6kx5nLc4OWXUExhb-WprXZ2kn5ES5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm: move KVM breakpoints helpers
To: Francesco Cagnin <francesco.cagnin@gmail.com>
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
	alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: sAL6ohopXAPP

On Mon, 13 Feb 2023 at 16:28, Francesco Cagnin
<francesco.cagnin@gmail.com> wrote:
>
> > New files must all start with the usual boilerplate
> > comment stating the license and copyright. Sorry I didn't
> > notice this in previous rounds of review.
>
> Pardon my naivety, since the new file only contains code from
> 'target/arm/kvm64.c',
> should I just copy the license and copyright comments from that file
> (and adjust if needed)?
> I'm not able to find any particular procedure to follow.

Yes, if you've taken the code from somewhere else you should
use its copyright/license info.

thanks
-- PMM
