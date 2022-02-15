Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp627218lfl;
        Tue, 15 Feb 2022 14:24:37 -0800 (PST)
X-Received: by 2002:adf:82d0:0:b0:1e2:a961:1aea with SMTP id 74-20020adf82d0000000b001e2a9611aeamr68922wrc.706.1644963876917;
        Tue, 15 Feb 2022 14:24:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644963876; cv=none;
        d=google.com; s=arc-20160816;
        b=DRtc4RzjitX4h3hZJAaWE6AribWWJ+LekU3ABwBoVi0+fzq1C4toGEB8nCS26eALcM
         ExVvUjEnOnCfGl3lnKCqP/+RFmhJ+KQX/dP2YQ6S5M9gYG5qp5W6c1j8OGsFIGajQf86
         BZUoNfW+EKgdtu+aQpIHlKn0U4UrnQhdzuJlG7wiXJ2NodvxL1UBKNR7II6YrTI7Krvr
         DhRR6pp6ctoO89FKVBU6TB7D7zYKzcd5eqRoLIUjLTHRMYxzaCTc5ZXyd/T4sxfjZKX4
         Kqcrkqk9ODEBefo/rgTAEfPFmjsMp/0m3VG/+wcSRWmuaxZly1BwmSLy56BRvoHsGPJs
         Pipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X0XGzw/JpnzzkJGvYBeoA5oz+SbPnjkG+OYo4X70usc=;
        b=CoEkzWocOhYDpaBZ9pYF/SF6S6IQGoY/rzliFV5/wcPbNDkOcnxy88O62GmBFge01K
         MlPC5UiJ3SOMtO38fNUDsJDUg27BTvR8cho0eTmtz8Ru5RA1A8ygejXJblQBNnm9LIg4
         mp3vIMvxeWL72Lin5FIw3Mlmm2L7ZnTF0jLzRUjTji6igcthNyOnAR8YRYLzsSmsbBRv
         6B05bMfRvJ3R/bA2Dxh/ditEWXvOR6239Cdw0VLvsDHK3G5hE8Z5MHA9pBgYkFTNFDiI
         94wdG+EXthQcUPvTKqzBHd9MV6MX4OhvaND7BrsuqJzRSnQNKO/YXWCXhIAiyKKLo4do
         XPqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YbFoL6+0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m4sor16269786wro.8.2022.02.15.14.24.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 14:24:36 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YbFoL6+0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X0XGzw/JpnzzkJGvYBeoA5oz+SbPnjkG+OYo4X70usc=;
        b=YbFoL6+0T0lgS7kNjEY30Frub+A4kZKc3AOLmUlF5LX2BCVa2j/GGedptBl0jMVhkv
         8ooG8ULUr7Av+k8QaNGKUlbMQYyQK5kZNRXrNAZdtmqOgfxQbYnkaGSK7TcAr/6Y1JP4
         UfhhT+cugdg1YvqIWEuzQF9j9Z+iLVWmsm4ZAkrWMXVVtqmfrqCc125leZGLlDpLE2KE
         y8yDai5d/1C6TwWVc/FEd+0iqLykngs7aHaCztkbO1p954aNoXisFuFJReaw0xKt1Gmp
         uehW4HB5LGHL94m4XdT6Az0Cb8CGxgh2RcDLCMfGSRo/mV53lV2FvQ8YSQu5YOm5aDFz
         Md/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X0XGzw/JpnzzkJGvYBeoA5oz+SbPnjkG+OYo4X70usc=;
        b=AXQDzvu76QCGLhotw0sSgJRj/WwIFKQg4iNR7QK8B/XZX7f478cakh2grGVIusBv+O
         NjDpXLzGwBfq0kNWtxK5T3mvbsoVnva+Do47Zw//tSEn1WYjw8aIbQsGEFd7BYR/kb8D
         oyGomgUxtMoPvwYXESlrP0ss02xhVZC9SjwvbSBUV2XDRAnetA10HJbLq01wYKKFTPf7
         9ijL7Y2nB2irU0Z2kPANHDi9Xx+oPjKqBUtgb5Td1FMETFXXZhdDVumloXAMHKWFapfd
         +DvkpxnMZS+XXu/55TeN2pftIPp721Txo/Xqi6QQiwubn6myFTXJXkCCRdnTC1grvYgk
         GAog==
X-Gm-Message-State: AOAM5333SiLag3G4lFZszJJQcM4EkdbuurV82IX6hAwNqrRBqjrmE3jd
	X48jcnl12MpE7YDZtcKNYCvpEkGqYu+IX+YOexBaYNjU
X-Google-Smtp-Source: ABdhPJxINqrtldMAfp1RuixdZBh3yrpqU3wibiRBYHWZZ2prTtx2oNoZo5e8bE9mh4PCnGhMiX9pm5uK3uybxQQxIFs=
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr114451wrr.172.1644963876691; Tue, 15
 Feb 2022 14:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-15-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:24:25 +0000
Message-ID: <CAFEAcA_yJeqQ0rA582cZhCZYxsFL4bVrMYeUvy5mBEQQ9m7ZKA@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] target/arm: Validate tlbi TG matches translation
 granule in use
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: dQqlYzCeYYx8

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For FEAT_LPA2, we will need other ARMVAParameters, which themselves
> depend on the translation granule in use.  We might as well validate
> that the given TG matches; the architecture "does not require that
> the instruction invalidates any entries" if this is not true.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
