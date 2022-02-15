Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp614026lfl;
        Tue, 15 Feb 2022 13:57:39 -0800 (PST)
X-Received: by 2002:a05:600c:3503:b0:345:858e:cbe8 with SMTP id h3-20020a05600c350300b00345858ecbe8mr4632499wmq.73.1644962259182;
        Tue, 15 Feb 2022 13:57:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644962259; cv=none;
        d=google.com; s=arc-20160816;
        b=EmnDlShDe7KkVS91Ptt0GIv6iOS2APej2O6oc9b5/Hk4uwq00YQCpORmRfDtUilPPy
         8EhPXPzFN3P829+FfvNKCEsSCD56QBaXa9+MffsmagT2SmqWuty0ZdHhrOcWckj1qLoq
         Q/bULbpV7lPRd1Wvnhac15Li49Pw+Syk9CWucFvQ5xIUPiS31wS70QeUFKA1LWZjprpg
         we+JVB7EwC3MlBf7ovxAuH+jxTDwlxopPkK5G2fbnlBLGYxBEXsg6S0y38vqA/P6NgTB
         v+Cxou2XJQnl4BKITm0N85PRk6qfBnSahFjS6SI8cx0BLnuAOSku5zC9gsPRTW//DPrP
         4v+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8u18YS2hazMVfN1W1rnVoZUe4MbcYd57oLDSIf6U+oU=;
        b=OnhWY0M5zJ7PgU80uAO5A+JSaGJ6vjHyGcL+Qa9ZLBX2cf9C6EClRF/RLF6nl+vI9d
         mfZI4scpQfqYHIH9S9sRSNipYTUyahBIYjUzYj9U0UTdalGIcWSDZ3u1DeeZI+sY7QpD
         1TgEnp3yKT+aqvcLzjMhkC6Ju+R2UwUmSzOG7W4vlcR9F965i9vZgIh7SYzPoVo0U948
         1T5geGYA0ERcPgWSCi2FaNqRL/2iRhujuR9+Hl5QXRo/MtjBuLtxrHcbHC9fGi7U2P6s
         2hACEoH1/ixNBsF1cV5mqpQbup81uNMUdfqGwFaZM2ci3O4Z5qKWEN7I7dasZrSBp6Qq
         9/Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SGw2WklH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o36sor7691190wms.7.2022.02.15.13.57.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 13:57:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SGw2WklH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8u18YS2hazMVfN1W1rnVoZUe4MbcYd57oLDSIf6U+oU=;
        b=SGw2WklHc5ki6E8Ind6FU5md1f5/fqVrsG9DR32f3FcdsI0i2M+HTgrH+YmSubobXU
         WM4uEWj/BZxVbZ6+lP21xeR+dPyNL+8oUOJjN6zhQwgIIM36fZ1rNB/KVVzletXLeDa2
         TY14+nwzcR0QnXFUx3ZmZ1JJJiP73bKpetbUtAXh80pNLxJe0a8wlZ9cAopO88FUa2Wq
         BKqi4spzTFdDRdqhgCjid8GRun8t7iIzPGcwuVSLBx+AcwSulyL1cBrs8UJU2bnfvVLb
         4QqPX652nyZxv1sy2lB3Rqx+3a8tgCYd71CaJdy0stZ3AvQkvOctxaOQrAEtsqyGC76M
         e/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8u18YS2hazMVfN1W1rnVoZUe4MbcYd57oLDSIf6U+oU=;
        b=Vgufyz+6L64I3+PoGTB0iXuGOfDozlgRLpTJalUG5HdMdfpHTS5Cov2xe5esG1bSwp
         GT6Bu8NukYqZD8tcmup9oDe9Y6wdHN/dA/eqpBcG6fXKulPClk+afmm9okpZ14xkH9y3
         RqNqGuKlXzl4TolDfJDawHwo92M14dSz/K9MsPDnhKch5CInrXpMdCRc8t3gusgaigvk
         pvgFskmc+wHjYCUcuPkTKJoX9I1X7vxHmAVi0QSpEtWxlnnn9+Kxr5QNBG7w7+sAjLIe
         /aIC3dV4y3JsVMH4b3HnxhYkNStvjsrxe5FGnyMOASzxSvZalBn0pNNJuz6UotodDUMf
         9qkA==
X-Gm-Message-State: AOAM532oAQ5T5zRJML7SDQVSV9CxFTdxtZYeE5wpa+aAkXpQ60Ec1EEF
	yNb/XWugmu+VM9mAIFxK1yDvej9+hNkULV/xph2+LkLHihCIDg==
X-Google-Smtp-Source: ABdhPJy3ptIz2v+GH6ZG5aCPpQDrcSoFeEqM9ujR8S7vFZ90a6pnvpW6v7kBbbSpEuxU7Nn+7r05rZuMChqabzoLwmw=
X-Received: by 2002:a05:600c:2502:b0:37b:ce43:9ac0 with SMTP id
 d2-20020a05600c250200b0037bce439ac0mr4717038wma.37.1644962258911; Tue, 15 Feb
 2022 13:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-6-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:57:27 +0000
Message-ID: <CAFEAcA_hXzX7t=JR7L642B5Yr1=tYDvUbZXvK841AmRT7dhyfg@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] target/arm: Pass outputsize down to check_s2_mmu_setup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: JTit4JhRaMR+

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass down the width of the output address from translation.
> For now this is still just PAMax, but a subsequent patch will
> compute the correct value from TCR_ELx.{I}PS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
