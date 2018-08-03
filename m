Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3004837wru;
        Fri, 3 Aug 2018 02:23:51 -0700 (PDT)
X-Received: by 2002:aca:5ad5:: with SMTP id o204-v6mr2553050oib.26.1533288231060;
        Fri, 03 Aug 2018 02:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533288231; cv=none;
        d=google.com; s=arc-20160816;
        b=E4ryTTvqq2IWWMMd4MeDQ4H5jcwmcu5+R80P4tp6s+LBRINl8oli3TBTZf74rFa6kM
         JYxe4saz2eHIOggOg/V0BBk8czC8UOWYD3fb3iTDwmP9oxV/xuld5F8oQVeDyzf35nft
         p3kWVCc017uwvOVy7A4PbrOqTxI7URY63H/ZuuvccE9hz1w+6yRDSg8Ji/4Ws/PIq6+o
         +7Ysqjxfy1V3t1qIa7XsOROqqIoFjrdiSPxHUraCN2w44083qytm5Vi75J47r+ITMcx+
         a4ndgx2sI5Tj0G37Vv8HYz0Q6SAjCnqMSxkbFSYAeDfwaMmgxOZHG8zVSHRrGTd4XUXZ
         Q7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Q+iVJQDdxLaXk89EDsJOkBAlohjfhwSawexsEPon2nw=;
        b=IjtIn8lGC1tejJmu2iIuXf3ZDxyDzv6AH5WdrG48NKtYDiwSRZ4Bts/XrBJshamSnH
         IJHo56oL+xHasO++sKOViisiIXH1ffQ/n0XlACFPgJ3/uknFZkl3TqQvY3Qb1cHE77wF
         kI6Ts4/9OW6P241XanZXogC35JTPDPYUcpEI7S5HWLthzzmt5LQqlmbLj5z4QTOUB06q
         TAWjEDn5rKoYMJE+uDM0YHEw01excjTcTFxaxdG2E5aS4FuJ6WseAMoSTYInW6A/hbXw
         OlMY18Uw/J8iSVzNBBxfKHpBA/zMJbyD4rEzc3B/x3LjXhLFFRogWm5L6N0kWSEgPk/l
         8u3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C5Nbx4dZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l83-v6sor2396314oih.1.2018.08.03.02.23.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Aug 2018 02:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C5Nbx4dZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Q+iVJQDdxLaXk89EDsJOkBAlohjfhwSawexsEPon2nw=;
        b=C5Nbx4dZqx+kBh1+x5FeK2YIwVzhKTf1fXJuU+3CcpuIMooHrH+6PFZJ9MeYM2Ir2y
         EtS8o2WVLJnvWvDRCjyo+mtyYZC16ROjRf0oh/G8Z17AVdh6BXJPtuLM+hXmH7yP06KQ
         pK0QiGUEQKYGEFIDAJD1s4ccu5nQwZX19ZvS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Q+iVJQDdxLaXk89EDsJOkBAlohjfhwSawexsEPon2nw=;
        b=Y0x1/5hqMwE7vRmlVBouAvBRVUCQx9H+RpwkBRqYb0I/6X4XcE6rHsWgPfpoQJmHx7
         eX7y2PHUPmdqWcGLQvfqQWJx27uAXyipYfErXkkRJYYyP/HXQceifkb3sjqD7Ls3GjCR
         GmsuHilHpY6zJT6hMDq5CaeXHZ/F9Ej1oKWSHxXkszZOIeCc5piulD2xbXNZLY9HfVxC
         eFACtgDpP7ncFunV5/m/Etho9IYQMcrZRPxGjwgvEwI5BvSfzuGmWN7s0yfXUQU/3O3f
         KD23+EUe2RvxXLNECK0YSYiy1ubAVsIPwRigF+BTlWGc4k1euul2yqo4umeA1ff20RNb
         yf/w==
X-Gm-Message-State: AOUpUlEh2ZHN+xi7lCWmObLb++4jD6CjkQC/YbE7TclWXe3nWrmkmkoZ
	ZURCAuPkA9MG024Q0gMl/exYR5g0YWS6caoaWlH9fYlz
X-Google-Smtp-Source: AAOMgpeDPuLCP1E2F7N/P6PVw9T9NdhFlkKB9w56w+yv6OcLr47Ccp2K+jzS8I94JnKRH5RTM65G1JsCJz35r6hBnfo=
X-Received: by 2002:aca:4a49:: with SMTP id x70-v6mr2148051oia.11.1533288230679;
 Fri, 03 Aug 2018 02:23:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 3 Aug 2018 02:23:29 -0700 (PDT)
In-Reply-To: <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com>
References: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com> <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com> <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com> <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com> <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
 <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Aug 2018 10:23:29 +0100
Message-ID: <CAFEAcA_mVGSicjN=wwJY8OCJ-j=DtdLjDvM9U-dC3dQ=RQQXMQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: UjHtoYiMW5Xa

On 3 August 2018 at 10:21, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> The 'sbsa' machine won't consume QEMU generated ACPI, so it won't
> touch or add new ACPI tables.
>
> UEFI relies on its ACPI to load OS, but currently it still needs DT
> from QEMU to pass some info, one example is CPU number.
>
> So, the 'sbsa' code implementation should be like this:
> A separate file, no ACPI codes, a little necessary DT codes.
>
> "Necessary DT codes" doesn't include so many peripheral devices nodes,
> so the code overlap with virt won't be so much (contrary to sbsa.c
> with all the DT codes), then no need to separate the common part to a
> third file, and virt.c can be untouched or only a minor change with
> few lines.

Would the real hardware you are trying to be an example
for use DT for this? It seems a bit unlikely to me.

thanks
-- PMM
