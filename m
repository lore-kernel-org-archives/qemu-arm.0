Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1855564ejy;
        Tue, 20 Sep 2022 08:17:57 -0700 (PDT)
X-Received: by 2002:a17:906:974d:b0:780:2c07:7617 with SMTP id o13-20020a170906974d00b007802c077617mr17697587ejy.707.1663687077335;
        Tue, 20 Sep 2022 08:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663687077; cv=none;
        d=google.com; s=arc-20160816;
        b=xkUWtg6mxAvGt1Ag1KA34NPM6hY0xGrgQYNbf0y45EnO1ZugIQsxS8zPFRJt167IpT
         B6rDfMiqk/XkRBqFli+ZHv1IaMbkUOHF5a459gLjxqYeGLWdU5rfzkRZrZmcGV+qfiwX
         w1rABhxqCVSpEgLTxXYaxxFVdesAjMSvmezAkLqkJ/FjavIcx2oLXVxl047rUrMltPhb
         tlLTi2Na6w90taYBynJ2jgE6TYiBvOYs6n/FbcRPiMQxxWa5bfTepPJ9KGwzxc9iNWxW
         EE7X5CFx58QqMx/s4JhhWMd55KaL1X+5aOBRAc/ewUvJuZnDKoIcFqxsQu5A/e02FrkZ
         7zqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6b4FO4Y2selTSZprGTVO96FDSGRYgtDzZnaiLJGueHw=;
        b=IsuoA7F5Bh2nM67dkfCZzQHCcacJrrDk1M17hGFms6dfIMJ0/e0IKCtCzufb9pSCVQ
         duWy/mPpzGxERUBmVGGtoErU3N8Wsz2+hKAba7iq4kLmNUvvQIMsgL7sxbc8kYHc4xrU
         1W5FJMXi5Imb67Ys29oU0ChQuOg9o2LX1YFuHu5/BZy3UUcbC/QViTvEjzi01JKBact4
         aquZkpYZRiUqkn7c711YSDqZG5FRDlGEbqzIp7MJziyH7hymJDDXsHgk8E9Q4L06pNmU
         689nMV3DT5dXhx9j3tTdJHyDT1LYQfSLrpFwQt5OQ7Z4fM8dvZpvW1rzCdxxCJCkQaFz
         wVVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oTdHgvPX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a24-20020a170906191800b0077e2277f4b5sor836862eje.133.2022.09.20.08.17.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 08:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oTdHgvPX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=6b4FO4Y2selTSZprGTVO96FDSGRYgtDzZnaiLJGueHw=;
        b=oTdHgvPXlqz4AnYIXW9o9/mo8zxAA9VU6fHQItkovpIF3ZxIWacHu3FIbpeiUgzEBD
         +e0B93In2Fcp1WpdX/OyhXIy9ggDnEvgaDgVoxwjK6LqJv0NU+eeE4tD4+9s1zshxk70
         k3rvw6fThWHJC+SiqrAVs+CIPF4Fi9IJrQK5vW/WM3Te/TGakBjjv0Dm3vi4ajrZqDK3
         Cj9cSa2qRoPUdfRU0PNJBFkC8ivbQ/2AkzQh2y8Yb6j9j5RVOU68duKVNAhh5KPFYeTJ
         8iOtYZobm5hE4tfqe1DjdI1ajddo0vXANAzXmb113q5gnHd0YG4sIO4OYxwBF/7L5Anh
         Np9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6b4FO4Y2selTSZprGTVO96FDSGRYgtDzZnaiLJGueHw=;
        b=iIR/D1Unxvhzpj17fwoW05WIK32jy7Y4Lvk5rq0P1qfMKPIcD5OBaJ6fny5LaVx3b3
         1hnfNYG6D0DRJL/UWzSPB6hAQDudTbfIQ37nu0DtovZ01onWgDaIeU9FqFe0c1i08NKh
         2V1jadIQGSX89c4CdRlm9HgGzCh7w8QvwFxtj5bPMHWmlLK7KWPZ+jUW0JwVSaiBFlE5
         1mnvty0m7fbT2B0S2dD3nG50udk6UfH94jkhsF53QCNdaXkPDTs3IofGLnmyeEb1bTg+
         /9dxbkmpz0McyE8InFhn6413okHYrm15HjC/+fpYl9lDW0Ev1n6+26b2NECYG4jp4Tv3
         zjGQ==
X-Gm-Message-State: ACrzQf1H/UIqXqGxBFMSSk+Eyhk6gDDlnt/zV7B9P+72CUmaLgsW0Rf2
	K5+/+aDz3/88e+Dlz3bouCSqDZiN5UovHVTNPCf+NDhc
X-Google-Smtp-Source: AMsMyM45FLBTPBLU+FFJ/9m/wqdOxVKVegwmVXr8IKPlYoKZ5NjpzoQt0of71DrHVIj0YnNuDxSScXzLRZuWXGt4NyM=
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id
 dr9-20020a170907720900b00778e86e0568mr17888120ejc.659.1663687077075; Tue, 20
 Sep 2022 08:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-20-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:17:45 +0100
Message-ID: <CAFEAcA9VDnyR6++kLGCZSS8uQQPT-eh-gwvbX_13-QTdRE223A@mail.gmail.com>
Subject: Re: [PATCH v2 19/66] target/arm: Add is_secure parameter to regime_translation_disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: d8WZFA8+Uet7

On Mon, 22 Aug 2022 at 16:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from regime_translation_disabled,
> using the new parameter instead.
>
> This fixes a bug in S1_ptw_translate and get_phys_addr where we had
> passed ARMMMUIdx_Stage2 and not ARMMMUIdx_Stage2_S to determine if
> Stage2 is disabled, affecting FEAT_SEL2.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
