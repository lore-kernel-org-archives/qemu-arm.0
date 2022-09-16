Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1062724ejy;
        Fri, 16 Sep 2022 08:19:39 -0700 (PDT)
X-Received: by 2002:a17:907:97cd:b0:780:6829:cb9d with SMTP id js13-20020a17090797cd00b007806829cb9dmr3998405ejc.344.1663341579311;
        Fri, 16 Sep 2022 08:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663341579; cv=none;
        d=google.com; s=arc-20160816;
        b=h941Kb4hqnNUjes/vFBdJO6eqoRbfhSgUwe1CvorslnFglpumvgylz9Hwhp6/JN7Tz
         gEa95DRRq/7YioYn30d7+21SCeOAc6nCMEAquwkfwyYPfdqfx6lhJvBjl+jo3RpjckVA
         Wv1ritW1Bu1KC7sJBLjgw3IPMXb48WUpdHxct5Wl+JB7ZioBfiZ4dF/IIkeNy55u2y/l
         moIBPZEdyrA9rAAD0DgHSZTEUVASSstCWlwp9omOIWhExXmg5mrN5eKD/xbZxU9VMk3t
         0wgHd4YwzpFktWoiFuhLWaj3jBq7Vs6T87lhft8rdHzkbBbmarrPfgL4V74u0Ui98ED5
         Ncyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ltKyCBLAYqNcCaOEWIzjD15KZ0/cBrZ46cjtjUDv9U=;
        b=VkEi+3S1GT53wt516NlhV6QzrYD5Ajm1mmbiLQ3hvIGVSnXWvFEyFS2fNSnbbs8jZc
         Nh0WRY5buoKyE/0Fy5l+w6miljNh21Ggk6L4qNSGJN/VwEl0vToEtbarhnXQasNYzqgt
         iR5tRZOvpA7k6VxQwYHN7Eirh94YLQFklED4zgie2PQQqG8rOvxGdTKeFyFDWsN2fA3/
         uIiFjF5nyOVymI2VEXf8mb0NWPLXsjbUInITK3c0i2f3wCo5fCT4prYtM1AnXIpRl3Gv
         P+FLZbr9PLm3otfuS/2T9u/q3rJ7CXx/S+9zjBPmo53NDg/MYpjYp9LSGLcE8vQJrwv0
         r0cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="frqaOQ/Z";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g1-20020a50d5c1000000b00447e1a7e833sor10957636edj.24.2022.09.16.08.19.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Sep 2022 08:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="frqaOQ/Z";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=6ltKyCBLAYqNcCaOEWIzjD15KZ0/cBrZ46cjtjUDv9U=;
        b=frqaOQ/Ze5zXk4cdoLy9VIjcd7+dSys/NTD0VRwLI49YppuqrBdQ+OP4i5x2NguEsw
         QYFE3VxWBvM57RC45PaNC9bhyoF64EGfBFxA2bBDJHs6h6PjA51rVbXKtTxryygABiG2
         K4HSjoqoBdqZof4/XSrbcbP5QeTkXSXERBSMSN+RFEIGtsbDb2DiSLAm7yrKz3ix3w+g
         hcCHCpfPpAGdXKFWslvucX2gyA8VrePkfSjoayppKJXla/LIXAZQJkx+Gz/ipETHnHvd
         5L9Gp3Z+/Me7r8vb1LhApntSl6NdSjJajtK4PpdRdt5FsTaVArClYj7+AX34P/Gu6u1z
         yveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6ltKyCBLAYqNcCaOEWIzjD15KZ0/cBrZ46cjtjUDv9U=;
        b=RCDgXMygcWtzY4ODVI3vjMXB7wGdaAoCqgfCSGa8mXigWlHjunnyJK05vWOarM02iR
         Em8wuL60UyMH9R7Tq60si/69e8Hw3u6AU6pUaaDfkkoe602q12cpq8fwGzgAnUVhg4TX
         cc44aB4VjMgViXGVqp04u0MeviH9PUB77vwUqmZyYNqCVIbqTjicGG41lc09uHRaltct
         cFl4AW4vQJgDNzxJhzlz185NaqW9sMPmb96Wgp9qCIKoSYbgVyCHYPm5S2TLHncCcxya
         2ncTCpAjlJYQV0LY8NyCfuDLiay03vjmufozEAV9C6ryZD7sw8S5zKML38UxA8nUEhyv
         fMJg==
X-Gm-Message-State: ACrzQf31FxJjp2BAF+LwzcajtStnOT7G5cirlVzf5IYUl44Uzw4rnETG
	yZx/TgUM+WmYi9um1weGgqELpsuImVwy6M4YpXotZhPMLr4pRw==
X-Google-Smtp-Source: AMsMyM520ZIu4FdFTyIhts++uh0IkoqCgMngHDOqhOG7X8tKuIGqxQ1ieiM4q1UpstKIofHWdcP9aBwJzQqQP2fihek=
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr4464768edw.53.1663341579065; Fri, 16
 Sep 2022 08:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220914160955.812151-1-alex.bennee@linaro.org> <20220914160955.812151-2-alex.bennee@linaro.org>
In-Reply-To: <20220914160955.812151-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Sep 2022 16:19:27 +0100
Message-ID: <CAFEAcA_SKAeWnhUob4CNaAs9LYfUc2V-xuYDPtyw_SSydC8Vsw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IO+46PjU5QlM

On Wed, 14 Sept 2022 at 17:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> We currently have hacks across the hw/ to reference current_cpu to
> work out what the current accessing CPU is. This breaks in some cases
> including using gdbstub to access HW state. As we have MemTxAttrs to
> describe details about the access lets extend it to mention if this is
> a CPU access and which one it is.
>
> There are a number of places we need to fix up including:
>
>   CPU helpers directly calling address_space_*() fns
>   models in hw/ fishing the data out of current_cpu
>
> I'll start addressing some of these in following patches.

> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..3bccd5d291 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -43,7 +43,9 @@ typedef struct MemTxAttrs {
>       * (see MEMTX_ACCESS_ERROR).
>       */
>      unsigned int memory:1;
> -    /* Requester ID (for MSI for example) */
> +    /* Requester is CPU (or as CPU, e.g. debug) */
> +    unsigned int requester_cpu:1;
> +    /* Requester ID (for MSI for example) or cpu_index */
>      unsigned int requester_id:16;

This defines effectively two uses for requester_id, with a
bool field differentiating between them, but the patch doesn't
change any of the places that are currently using requester_id
on the assumption that it's the MSI PCI ID to check that
it's not actually a CPU ID instead. (Generally you don't want
the guest CPU to be able to masquerade as a PCI device...)

Also, I think we should look at how this is usually done in
hardware. I'm pretty sure that in AXI, for instance, CPUs
are not special -- every device that can generate memory
transactions can specify an ID (and it's up to the SoC/system
config to assign them sensibly.)

-- PMM
