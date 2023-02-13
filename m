Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp324907ejb;
        Mon, 13 Feb 2023 08:03:21 -0800 (PST)
X-Received: by 2002:a17:902:ec82:b0:199:2f0a:697 with SMTP id x2-20020a170902ec8200b001992f0a0697mr26186768plg.33.1676304201189;
        Mon, 13 Feb 2023 08:03:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676304201; cv=none;
        d=google.com; s=arc-20160816;
        b=Mci11tW0jO/nepTg8BDa3mT0ywoVKCYBIenpY+WDrncY0ZuzEFJlmYlpNoi0E4oP0z
         cA+yVG9wTdeCLlSsCNUr1YOVISHuevIq6or7SVFzVE0sKGIMTOay7c11jz9HTKBH9oIn
         o5JJGvOcNed2j4VXGxzCP9LDQmtxwoNlswxygvsQfL3mDpm5Tt97UTks6kqJMby2O4fr
         6XFukTTy28hfLjIYM33OaMXqpOKnWkJzBGCqQvfWgEXvB8cehzJMAdiV+yhpW6yWEia0
         r7TkAwWAafd94z9k4c2ykYDZkCi5Y4kkZkMC69qL7cNpQaVr53wHf1ZDZbD9Z1QAbqNU
         hwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X80PbizfnDoldN/bOQ71iNj5f/kcVkBtU3toBDbvYEg=;
        b=XMWsvBIdM79c9SK2PVm2lKmxBcK6v0MxjJ9LuGipbCRbjcmPMY+7Pzm3Z04D+1v3xG
         AddyfzZh4cb+/p9H08xPMc4xkzJQdZOvmmX/xJMrFK0AgrIbE/rkOjqgjSTDdFIc8X5O
         7flltQm8pHQ2TbehclagVP1oXjnrwU/UudHNASihm2G1zJfpWHLrs5ffWyQtHY7sWlhC
         nU0u2pK1z5cVswp3TG/SslILD/mTlObT08fMTc4VeEwWNSnmcsQSi+9+mkFJRJ3J6hdI
         7EcH1qd1GwszQf6lRY8an1Ag/gB826rwOHn1e9zjWKcgXCqEY+6YaQlceyLXrQKi0P1a
         rQ7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jo33h4Dk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w16-20020a1709026f1000b0019309dc5befsor5499782plk.133.2023.02.13.08.03.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 08:03:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jo33h4Dk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676304201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X80PbizfnDoldN/bOQ71iNj5f/kcVkBtU3toBDbvYEg=;
        b=jo33h4Dk+4JXqeI5hn2Qr1xrN3Me03Tc3YBGo39/JoIsg4jyRiCWZ7z94BLa/N6fL7
         bEvi0GPN+pCJiY6BAcYWjCgKFvYH22qpOC+7fcjpqhEFQ20zW5PuDgCShqHCVZ5q9GmZ
         se5Cx3czy8wwuCTkVQQC5TwOjrJmx2clg3HBZ8Mg3JhzX0Gb9FSIZ04QUOl/PyOpCFmX
         CGUfVpQJ0kLamV8jAupOFWsHjvQCda6MZPzW4ekWtiK6MNQrT565Z7TcF2lPaRvhB33D
         aoi+CACj54iWF7DIV0U75O/kgfz/4D58q4XPc/720m/TJFP/0pVcsYx6IxEMjNeH1C5K
         Y1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676304201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X80PbizfnDoldN/bOQ71iNj5f/kcVkBtU3toBDbvYEg=;
        b=FD2kT9hrMlJQykxCgl29Nx1vov+RYFSO2OiqTiQ1BnI2jpW/CpBuZLB1+I49wcxHV5
         kH+9idA8JLskC+0bYJi3zwyoSvusXc7A0w3ALReBDBpOFxdFTf0CnGN7P3z3zX2hNkWZ
         cBnVjPmyEMs/iIs7V6HlpVOcfYf5vm1znJcvj3u8rrwbbvNSrXpqFjWbMZUbKwHlKX9w
         2nqJRRqiB+3xnO+PS6tyLupgqREW1kyxciWNHI9xz3m4UwgvVaQzA3Im2mR0aDUs5CKU
         AetryC6XAoXAqnql6cHSwgn4laVUdqXMQ2d4tpoPMYFKEVqySUxwEB/oUhB1ryTc6B59
         548A==
X-Gm-Message-State: AO0yUKUB2hKWAT1FuGvYTOXnVs66E8VI406nyeK/6cMdrk8yWd1qZDXO
	22dyyMTmAx0/ph2tBNABAt46+7ZfhOe+D0k+x2MHDLIT
X-Google-Smtp-Source: AK7set98ERjw/vRTBKXftGE4gBcuia4g58eCT/cvcClGMfRVrL6i5+hqO9u4Xo0E6MJ0ZjRswl5fgLLzp1paZI+8VRU=
X-Received: by 2002:a17:902:7c8e:b0:198:ef8f:4d89 with SMTP id
 y14-20020a1709027c8e00b00198ef8f4d89mr5799614pll.15.1676304200737; Mon, 13
 Feb 2023 08:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com> <20230202211129.984060-2-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-2-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:03:09 +0000
Message-ID: <CAFEAcA88sBjZFVzw_cChm18nXLJd4DA0QbadvaAPAJMQNJm1iw@mail.gmail.com>
Subject: Re: [PATCH 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: XQbRbRClWV9P

On Thu, 2 Feb 2023 at 21:13, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>


> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index d0483bf051..a0c9bea06b 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -282,8 +282,8 @@ static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
>  static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
>                                   uint64_t modifier, ARMPACKey key)
>  {
> -    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
> -        return pauth_computepac_architected(data, modifier, key);
> +    if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
> +        return pauth_computepac_architected(data, modifier, key, false);
>      } else {
>          return pauth_computepac_impdef(data, modifier, key);
>      }
> --
> 2.25.1

Just noticed -- this should I guess be in a later patch, because
it's added an extra argument to the function call without changing
the function definition or declaration, so I think this patch
won't compile as-is.

-- PMM
