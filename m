Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1834036ejy;
        Tue, 20 Sep 2022 07:46:13 -0700 (PDT)
X-Received: by 2002:a17:907:2bc3:b0:76f:5a9b:2039 with SMTP id gv3-20020a1709072bc300b0076f5a9b2039mr16597901ejc.534.1663685173250;
        Tue, 20 Sep 2022 07:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663685173; cv=none;
        d=google.com; s=arc-20160816;
        b=dF1SJayhBcQZp7yvbPw+nu1hkQ8led7etzZB0pHrr7UqUpWrQEg7POCCReakuU4qbo
         csIXC6EygL26ILbcC5bkzRoLVjmPJkwJZYgU1QuUD1uCnajMIqM9TderG7X6Ih1iJVUq
         QaaVhO0q8D8TL9WvLIqJ7ugfCiOzgwsQu/B2yCXAmU1gMcApATAeIIHsFk5s6k3GvV/C
         k6nj9XRhoQtJBJP8ejuucloJZcweWIev/2eVV9uXvrmE97EuEH0UroesCc4JLVEQE2ew
         FbCcSCn/I/Gt7vC504On/2JNpf42Ds2/AS8nJ14WvzoMVmWDYrEQK9Inu4PSG8Qydxqg
         61iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ma5twb1aJxnYlp/V/Zte2yNDOB3+EMZwUDd9s82r0eI=;
        b=kewqgTVqsApLipwSDzWbx/yBduoMUyIN+VEOzltEJylSoTHjYX1wz0WuW1KRZ7kmTG
         gBCcAMdHDcheLQTvoRPKqzIB7SNhn+AzKjC8BT5lnPWb+/xiPFA6gfL3IaMofUdfJJBG
         5QgO7xqaAIZ6rff7HBE/9LAzFaXlc5xjEOUsbmMT90AcudfwCWBG2C0dGR5D/CcGX8GG
         nNTScyFzqeQrGzajZMALSCjdjH5MKDOu0o4srgHCc2dmrIB+pmUgv8OmS8YjrSvN2GIM
         Y+TAjLYv3JjBQw8EikJshHFxPgjOUcX70Ptlr38Ay/XG7Wk+F/91i7eH/BALlLkvVWBF
         6bQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OtQbB2c7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gn2-20020a1709070d0200b0077dd5765233sor840317ejc.44.2022.09.20.07.46.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OtQbB2c7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Ma5twb1aJxnYlp/V/Zte2yNDOB3+EMZwUDd9s82r0eI=;
        b=OtQbB2c7oxl/+FtJHa9/0Fzf7OvdL2EyhwC1CApZWwS9te59mQLwXEowNpHpB1yj+K
         ZmOZ1pj+Dpk72mBORnLb4U/ivTo5JjG9ezU86r7F8y2/ROMlSdUPew1YQNBaYP95Jiw6
         6Gg5jE/eHjFjnrtbC9K9707lvX9+O0KRlgb9xzWPoWgUCmxuT6HHLsLAVTt0o6QT/n9u
         vna5XmF9gY6B5AWU5WZHxneqFaSpevp1yH2HiiXuYex6DcVe61STMnQBzR/t8/UejZWW
         lh0SZCFlNsuoCI9f0ZD4rgcaMl2CEd+4Qf5mJCfbwKMLTpMm/ExIE7/mG3Avn/94HDo0
         B0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ma5twb1aJxnYlp/V/Zte2yNDOB3+EMZwUDd9s82r0eI=;
        b=6T1fKjLX0F/UFFN7oeCVAIOkrSTA+3a7MbUjL2lo2rgmh99kXSnFx6JNLNpE7AY2p7
         N1897ypuV1K7tMbSdJ9KsuxxfNagT3Ja6spbN7a8n1N65kzZ5H9PsUkrhpC7fCCK4P0V
         S/GxiWiolWDfiQgQYiL/ySXPyguRxu1I7aebEe8TvHJiY7klB5VHtCW3wpRK2RVw6VSS
         tG5RDGXJQcqNavajav12Tzl6wnZIQ/TzpSKT89e1gJtjfH/bcnU/Da8ptS+pE7KUheU5
         V63G+Hvm7/ajCjYs9WLb2WGfyKe/DCro7siy+wf7MJ0pNvkJFEu0S4bEyqQS0aX0m6id
         fjMQ==
X-Gm-Message-State: ACrzQf00G1iEj/+uvQ7ulhYcCRBq3qyUnAXjQGq14PEKaot/RkOLyTGT
	0j2Xt3C/N+w5Nr9a/FI56L2YuO4xLmapuxxxBFaKDgO0ZIbF8Q==
X-Google-Smtp-Source: AMsMyM73261ep7iEl7QbZUYsbkx7LubNJVWLLPRALuVYPRamJ6lFiAEa2Y5pwgozjTrLkFrFJZJsQ5QDJRYVWi/qLKI=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr15253771ejc.365.1663685173049; Tue, 20
 Sep 2022 07:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-16-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:46:00 +0100
Message-ID: <CAFEAcA_gUxhKRynDMLpuJafFQ49MHr3d1PKuDvm7oji9WhHBNw@mail.gmail.com>
Subject: Re: [PATCH v2 15/66] target/arm: Add secure parameter to get_phys_addr_pmsav8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: zgC2CvrNQEKT

On Mon, 22 Aug 2022 at 16:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_pmsav8.
> Since we already had a local variable named secure, use that.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
