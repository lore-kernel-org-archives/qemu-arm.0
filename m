Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp1222144lfl;
        Wed, 16 Feb 2022 09:51:14 -0800 (PST)
X-Received: by 2002:a1c:5451:0:b0:37c:71d:5c40 with SMTP id p17-20020a1c5451000000b0037c071d5c40mr2641406wmi.1.1645033874493;
        Wed, 16 Feb 2022 09:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645033874; cv=none;
        d=google.com; s=arc-20160816;
        b=xeYuM5JYBo3ekTY9MzixNyrQ1XSH8m9abGgpyVLrqD4spTfPOBhK0Yn9Sn9LU/8eKt
         zM6YHUPcvpjSh/XjcXNDgKk7rHxQTP37kVFePgt1zcw2LHU6RASnUZfQGtVR0Hqz/q7K
         HkPbUSshFYmVodek6fHHlaDPY+A0HPQnyfV7SSmd2PMLl7WUpeVcBVmUmAV9ewTuEM5A
         Yg7SeVYKkRu4Z9I8OMJoATlxmPdx9KVcTHhaid4w4kOaVlTRoG6TSK8vtqSnryX/Zcyc
         T0nR8fJHNXa9B5ChkAiOS9cOxW8Hf0O3/xklsyMIojBFdQd83+ppFHo/N07sMRjJqhbq
         QygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S2t8HxMW3UIXA5IlSwgBJ+vLneK5MnHi+nyZnxObiZ4=;
        b=XWAn92muOu/U5CmWJJepRrfRhH+GOo/hxPnqpDwZ4ugB7vquz7pRNIEAH7EYxNkLXY
         jq6+1UN7vA1GMGNf2rKjmhzTrMUZlRtWsox1mdwMk/T8lNs7fBOsHHrSwid9wPNokNnU
         IpwXw2q48YwJiKcP8UrvXDotUYtclg/JORhgOjUQjj4xvKgDrS7Zo8lOO/KOxLjcMMWb
         stmoOAs5hv3M0Uxka/A/p4ZU5z7IRnkk9FNfIOlohu2OGsqJobET1bE1MKW2G1NszCc7
         C3elZ/ba44wnI57FizS5VQUqORvIi8vHU5088Htm8PZrx1QCirWALA2DSKQPBywskVNA
         cN2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6xdHIW8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q3sor28125wrs.75.2022.02.16.09.51.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Feb 2022 09:51:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6xdHIW8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S2t8HxMW3UIXA5IlSwgBJ+vLneK5MnHi+nyZnxObiZ4=;
        b=e6xdHIW8K2XElO+C0mBTxXV6R4cqLIDwCqbA2LqemYWOjgjx/fIkAeEOtIR1S6X9ZA
         SnstctOloSuCJhg+z9a4VO8gG478I45+gcu76MT0XJ9n+onpzZpX2wsFaLxtx7lS5bMY
         JZtoKBMOJPGhqA0dRF23CXc9FC/a36xBglTnAuXN1aDspcYEYJR92L/6ohwesKVfHcdS
         BWoy4eMUvEj0qOppueaM4b9jyvTdv6h/5BzpDGOs6IVrBiQLqq/T8umyLAdaE02b6hmd
         qHV6sQYqI6XoLkEJz6UYgXYTNazCtj9KKEt2C1P9MkQVoLamq2up/b7T+g5V+75R0OFM
         0znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2t8HxMW3UIXA5IlSwgBJ+vLneK5MnHi+nyZnxObiZ4=;
        b=a4NWw48bKc4rL5M7SMRN0xS3xQ0zQr7ucZphykniCW444BHwocJhxDfs6vijs9Qr7T
         kDIz63nSazoRMNBsZ1l3uSF45Po9kCQxH3bZJuHbt/QCXp2Yfqr91oa++13QcueOaXgi
         nH9joqD8jQAOKIYk6ShAaAqLFGIXUZHJzvhMfo576qrRZtcnTKgYwWCX8pALG9EWoKU9
         BtCzdwgSC21A/EGkikNePwS0k8gYlIbEhTxGYry5pvqWUrXz3y7RGwCunImFenx8fmwZ
         /Nr/YXNbtfgJWhCwl8L8O0oYAlY9ThqIffDA0Eu+p2IVpzwvjjfGdGWE3VqTil0OeQ7t
         06Hw==
X-Gm-Message-State: AOAM531ctHYC+cXWJtZ0dd9f/STGU97wSNSmBuvXg8Tq6tptSC3NthKX
	UYDMrPMmCuNY58uRbeUtIN/c//14hLulziKUuPYGD7UM
X-Google-Smtp-Source: ABdhPJyL+19EG1kRk7iylXko9/G4R3t2dsDhDmJlDthHtF9Ww/74gKwwCxHCB0ItpUxbQOB4Bg2OTLnmA5J49HAyd2Q=
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr3249652wrr.172.1645033874244; Wed, 16
 Feb 2022 09:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:51:03 +0000
Message-ID: <CAFEAcA8Ya2Ghobdosfnkv6XWAFN0HBSxawoUq0tQd-z9hC0V1w@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: Z+nHVoHj7boH

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
>   * Set TCR_EL1 more completely for user-only.
>   * Continue to bound tsz within aa64_va_parameters;
>     provide an out-of-bound indicator for raising AddressSize fault.
>   * Split IPS patch.
>   * Fix debug registers for LVA.
>   * Fix long-format fsc for LPA2.
>   * Fix TLBI page shift.
>   * Validate TLBI granule vs TCR granule.
>
> Not done:
>   * Validate translation levels which accept blocks.
>
> There is still no upstream kernel support for FEAT_LPA2,
> so that is essentially untested.

Is this ready to go into the tree, from your point of view ?
(If it is, I can add the docs changes when I put it into target-arm.)

thanks
-- PMM
