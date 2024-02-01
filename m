Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp312045ejb;
        Thu, 1 Feb 2024 07:32:40 -0800 (PST)
X-Received: by 2002:a2e:7211:0:b0:2d0:7f4b:b1a6 with SMTP id n17-20020a2e7211000000b002d07f4bb1a6mr382901ljc.9.1706801560049;
        Thu, 01 Feb 2024 07:32:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706801560; cv=none;
        d=google.com; s=arc-20160816;
        b=0Mgdx3X668MjOEnwavkgh9Q+ACJeSSJApr+qA3kFZi/Hwj2bu5L5Q2qmzAeQKIx0sI
         FtM6eYhm+ng/ZYnZMLjtOEcVGrnvFEW+z2hbHOApdkJVm/bT1ccZf1Mg2cN8sxm76Lap
         usUDUw8+VMk1nXT6ItPIiEDVFN8R3tBQQlwGz7vgUortqvHgTDFsl2ieevcxg2wx2ZFX
         WWRMiZTRqFmC7xB5ZojQuMxgK/4rsXoabxJU9XHbEnRguxtpMN5sy64FGSP+nXrhbY2Q
         +F08ApQ/qAE51pdNvJR3/2MoqLc9QYoRm/F2TGYsAWZ3gEiNZsldAAoQRtC7WAsYmaY1
         IKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WsoUwEALHq7B8gB9DU1dIA7qwIyGaTKdLCFV9qa/3xo=;
        fh=GQpVIEZKq2kEgnISj8QWhkzOg71hlwb9Tizf29BxPjQ=;
        b=re9B//6J+P7Mtpf8Fd/uyu2RCOJR36sZJHN7F9b2CLfX+7ihZ4EguHzWyf2SP7f28m
         IMLzKQMcPc3DadFaNQigrKHQgYwTzohYMoyPeSQ2BChzj1rP7AbFxBnkQFdbJqlj7dSz
         DTZCC8k+cPI6qS8wG3fWVqaVhVuhtDtyk7eCI/LyUfgawJC1/9Ya/K6SCkqKNFlbJ+Cn
         4rAd5gV8oSHyDpWYAdn6R+GoucX7VwwRxDnPPFb+6EKZAEzVT8m8Y/IMuSJQZYBChdgC
         BPgcVH2zrtNAMBf+Wle7t82IfCaRnOlddpf6TH4YwdwIolI5JAIxjvq2P5S54B4R6jir
         idvw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ItrEGL/v";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXQNtV6jYwqCYzFdYduBmyP1EzYrmyaxPnBcJ+I/CSdl5AIUsrz5TxKkH82IONIZ9AYGFc49nFo06yqpWC/b2stvtU0u5yN
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a9-20020a170906684900b00a3659e0a830sor1668117ejs.16.2024.02.01.07.32.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Feb 2024 07:32:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ItrEGL/v";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706801559; x=1707406359; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WsoUwEALHq7B8gB9DU1dIA7qwIyGaTKdLCFV9qa/3xo=;
        b=ItrEGL/vZ/IvgWxD1EIAH+RVFcRsRhHNB95BX+b5GyNFgecJweKZshdWccy9r/oS6V
         2uTPZWibyOPKmr4HWitkkOROcVcdTPozCdRedwLzsZZ43OyTZF2U5YFc9Wj9Cw7q/jzj
         Y73z5DfqpuUfUrhWJ228i8uNqHBVXRuyHwiBZoIqpbkS9Wn5s8dsUOw+78P9bbDFqPTD
         YYDgKU5xff/D5nxp4UHOFl2nK35E4OjhLwoMcxRdGdrhYwGMHXFyCuOkHufaYXp5/nBN
         tRKtSzsg46T8M22p5FSLDgSRafhZbYgbQ4HwUi3wvx3dQQeGg6XgwP9g1A9JdolKLoae
         iqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706801559; x=1707406359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsoUwEALHq7B8gB9DU1dIA7qwIyGaTKdLCFV9qa/3xo=;
        b=Kx8/oPnd5zUkq697Js+mS/9q3lSSvQcT41MSYn3weqs7qLzXKtFYgWjFiDWDZEIgkA
         jujD6TWv6v+BlfKoxo3l0AXZOZEK61vxo0lb0jWm/MIOxZdUy0bNFF/W093cuDSzCtR/
         no8Fv/pH5pmA8b9UzhooC95o8Rr4jnSojA9XmfWHp7Yjd+rG6/2qONS2FRqFtAeaTT8x
         jigiLvSrG3emlpkDkstklDKa/nQ4fq4i3nYAzAStX8tQ1a9PnjyWNP8rKws0nMm/kBf3
         adB58UOwmn0GRXInXQJw5PqfZYnGx++DM2Ujhg07FNXZrrSXt0Awm2k/RneosdtsgmRN
         a4mA==
X-Gm-Message-State: AOJu0YyEcRci59B5i4wD5G3+2TVyXPCCLjxIAe4w3bv7kk4QpK73T22k
	heSiVLHpzuJatcvgW5oLTT3SZPAO6o7GTPJXwG1LapWIB4E0zLI2qT7dv33s9gKchjTOehj0Umr
	ugX5LYnCSIzxPc8SYRUhr52qanhWut2lxTWgJG8cV
X-Google-Smtp-Source: AGHT+IHW7Le85kaxj4+EHVKpUped2iKIJlb43JDA0GFBgFolwqLB6DTDKUIIVgF0AQFtmSkdRdtFxr7vCyFKq/RFhQg=
X-Received: by 2002:a50:ee1a:0:b0:55f:d726:43e4 with SMTP id
 g26-20020a50ee1a000000b0055fd72643e4mr384148eds.8.1706801559636; Thu, 01 Feb
 2024 07:32:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
In-Reply-To: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 15:32:27 +0000
Message-ID: <CAFEAcA8E4UQ_DhcHPgx5zcWi6uhkoxR6_JDpvoeX9eyXvQ35fQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/{arm,xen} convert printfs to trace/reports
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: mDlOUyQsRAOy

On Mon, 29 Jan 2024 at 16:10, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> This series changes some printfs to use the trace event framework.
> Additionally, it converts some error/warning reporting fprintfs to
> error_report/warn_report.
>
> v2 -> v3
> <cover.1705670342.git.manos.pitsidianakis@linaro.org>:
>     - addressed Peter Maydells's review
>
> v1 -> v2
> <cover.1705662313.git.manos.pitsidianakis@linaro.org>:
>     - addressed Alex's review
>
>
> Manos Pitsidianakis (6):
>   hw/arm/strongarm.c: convert DPRINTF to trace events and guest errors
>   hw/arm/z2: convert DPRINTF to trace events and guest errors
>   hw/arm/xen_arm.c: convert DPRINTF to trace events and error/warn
>     reports
>   hw/xen/xen-mapcache.c: convert DPRINTF to tracepoints
>   hw/xen/xen-hvm-common.c: convert DPRINTF to tracepoints
>   hw/xen: convert stderr prints to error/warn reports


Applied to target-arm.next, thanks.

-- PMM
