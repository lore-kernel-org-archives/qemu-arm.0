Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp751247lfp;
        Thu, 23 Jan 2020 06:53:54 -0800 (PST)
X-Received: by 2002:a9d:6a4f:: with SMTP id h15mr33651otn.245.1579791234029;
        Thu, 23 Jan 2020 06:53:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579791234; cv=none;
        d=google.com; s=arc-20160816;
        b=bblFol7Cs/edoeAUyILELubvWKLH39q5YCT9rYN/PcSfnAovatBa9SNPqd6WSP/a9p
         jUf0ycTD9yBn3cTiEux7+/gYWXOlMiL/Km/agGScTh0g2CXlJLT34djSChWCiV0rMMLz
         l/kEvh/a1ey8jFJocA0Z4xeYQQAS4/l9aTV4poDi6PUDbssujMadXMePedN+5OzwduLM
         nSS+Vm38l9ycD8rTc/i6s3AIiBRjdxAQrd393V5SDVsDe0JqkaMa9IQogueP5kVcvLDK
         C0FT0+MH3/dWvox046ZO6CA8qgOb8fBLr4y7V8fkoFP6Kpo8J2lQmbl6ILO+US8WnVTB
         BUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tkr6PqzEfQkA9K+1Euxc0bFsw2CSLTP4amowZdrc9SA=;
        b=MrSDGrTSa011Wk5DGuq4O/LzFxazHXtlpvBAQEMaEGs4JuopxpZKy0nNqRu0ftpRfc
         dh68ar1P293remj4q0rWwn5RZVP7e0FjY5EAgA0DnArKJeIpED9wcRo7pJ6jXN/ZGbvj
         Fi84GsKpXrwxrjL29VRwWj1Moek2unRsjhUbjjSx1qxn9q493UaGEJe9kaYqh93I2P9i
         pRMQ6P6Xsv2AT+zxet4keF6w63ruKPYI4zIBLp8q+NORrNuCVVOg1JfY89MIbFdkZUd3
         oHtv386e1DaM3ZdOPzk1Ag5fB0FQpSHDosuCWccUDhr7MXKBY3f+FmBHxusML1VqIZXZ
         ks5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zw2x5gJR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z107sor1121147otb.175.2020.01.23.06.53.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2020 06:53:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zw2x5gJR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tkr6PqzEfQkA9K+1Euxc0bFsw2CSLTP4amowZdrc9SA=;
        b=Zw2x5gJRu+D6UIRJtnjH16kE+EEIWj4lWZQ8G4DLTtALB8Z6lBdZcCkJ36b3VLtjQm
         3DTunJ3AoTVt4CDRALAruc/lJfS2kxvu4wrlE9ddy+O6HYvkpoC2FfQQFa6aZSod9XGV
         IvDVA269eiwcmLcaSpI1fGlWXJzu/0KRCzjswWPepw97R3zyAk3F3HpQ+5pMsBZOaU8E
         tbatrfGfRMOx0vc6sgKpkmWD+vqVMGmaWBOOOeBsIjh3VTYdO4QpSkIEgaGMJZgdEhTx
         6DIHjBorMuf7MDJznLYbgseDg4PXytobKUELbxpxg1AgQKEK2x35JG84LBNt6DuWIN7L
         0HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkr6PqzEfQkA9K+1Euxc0bFsw2CSLTP4amowZdrc9SA=;
        b=AcmZBXKHXEJ+M+iOvYz/kROTCBWZA1d/9er/VGcCUmvTDq/e1l6pDllVC3nX/WV1Ih
         rgghDw/fc8Zoiuzsw1a1nhqrqsZzKBWmarYSDwHyuvVkx2kSiebEpdrbd13SZ9BzotA0
         sHyRYfIWV7l9UNX62j+yEucNzjmMYPQyam8C833BQALwXfG1gPSvXdUNGk6RSATbLv6a
         sD3TX40M86lQEDfpy5sT7JgtNR8iSZvEVaIzam8IvLLH7okDaRHCyMOfw5tdWvRV7+dN
         40ZKJqFrQHdNZFsm/dhDvPlDKPf43k2pK1Ok5+C0q6vZZ4UL4grp4y8560ZYqtjQMA/B
         Q6NA==
X-Gm-Message-State: APjAAAVscAFFW/Xc1EVclzgXEi7z8XGLGBguUu4/mZDcR4mSCAX89FNM
	lxl+DAUJDXmQrDYoJCxvNTMEqIRK3nOcDMroIn0Ly6LL
X-Google-Smtp-Source: APXvYqwulAlc4PotKEu5zavoZBGCnP6nY0JOaEmUS2r1QnrhB9T8XwHYsB3sdSX5aBJX4p3YPoHiSjCS7Dc0OohtWXk=
X-Received: by 2002:a05:6830:13d3:: with SMTP id e19mr11567446otq.135.1579791233683;
 Thu, 23 Jan 2020 06:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20200120101832.18781-1-drjones@redhat.com>
In-Reply-To: <20200120101832.18781-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 14:53:42 +0000
Message-ID: <CAFEAcA9+amcwA7WGzXxc2Cb_J7-=rxFb6ubk3ZYn-Y+zWoWk4w@mail.gmail.com>
Subject: Re: [PATCH REPOST v3] target/arm/arch_dump: Add SVE notes
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>, Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: wnbbYjZWbwqp

On Mon, 20 Jan 2020 at 10:18, Andrew Jones <drjones@redhat.com> wrote:
>
> When dumping a guest with dump-guest-memory also dump the SVE
> registers if they are in use.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/elf.h          |   2 +
>  target/arm/arch_dump.c | 124 ++++++++++++++++++++++++++++++++++++++++-
>  target/arm/cpu.h       |  25 +++++++++
>  target/arm/kvm64.c     |  24 --------
>  4 files changed, 149 insertions(+), 26 deletions(-)
>


Applied to target-arm.next, thanks (I fixed up the checkpatch
nits).

-- PMM
