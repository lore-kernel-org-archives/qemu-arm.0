Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp221139njc;
        Fri, 13 Jun 2025 05:34:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUU74gfJRFz2hdkjsBD33AY5P0eF3EkHxfq8AVLKB00SubTrWM///ugrnH5kPKjSl34QZIq3VVmNbk0lQ==@linaro.org
X-Received: by 2002:a05:690c:998f:b0:710:e80b:fa7e with SMTP id 00721157ae682-7116371f806mr44994247b3.20.1749818043885;
        Fri, 13 Jun 2025 05:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749818043; cv=none;
        d=google.com; s=arc-20240605;
        b=gYNPw1f1SynZn1vTCY5ZnUjJUGeCcOcN0Uwmfg2neIJ1XasY9g6uL1VPnxFn02sSf7
         kcOnbg4CeOXephbnzNLMVFkiCFQdj2lUvZ00fCpCoOxzAAJb9PjO4NN5GZiqVVfmXoVJ
         x391pZ04Bq5iXx4kmoFJxZiX5L1keOOHMZT4EFQkyBTj6C5XLAnV1+ylK6jppP8kBHKM
         N2aTZaTUwqGjMyGs1Mo0va7Danh5RLSQOgflBasskV/vszKjw1I8zJDfCcgZ/p+u1Cb9
         EmWWK/jF8WFw8VlvXGhW8w65XmPAHxNnmDJV8FZo449muTmS/msd3pWDMpSvhGyon0Qg
         GvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=71Ya53HdH2POf52rkfKFn+Nol6pKowztsbWwDe3T4og=;
        fh=Z0nQK26gjUpDV+ljGYvjxpiIXw7LxPLAFmHF83kPUTM=;
        b=XopD5QshKoDCPrsh68wBye4EisLvvbFjm462uZQ5hk3Gyzp+dp6q31Ml7TU16jQ+T6
         W7ZcIQ+v6d1Y2qxfoUEOCfHGMx0VmqZfrEiz1x/ELgth15zfPOhZZkImiUO8SL8u0Lk2
         7u4YrBj3as6oKSL+6QxE1LhjbKFVRBqzQnnECnUMS/5pVh6DuqZkcySjzfFwLA6aUFCk
         W6q6AstsGxasHHsv/WeLp2B8yb2/CQNYXq/Nrk8Q9UdfwLUYEi3CuuXUE0/wNaLrG1GG
         JRQchPpm0n1r2L+H92cOfjAps3tC6o7smctBbiaWusGsutNtQMDl0zHj1ARK8lqkmOPT
         ZMIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kYvxU2Bt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711513dd03csor24205497b3.0.2025.06.13.05.34.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jun 2025 05:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kYvxU2Bt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749818043; x=1750422843; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71Ya53HdH2POf52rkfKFn+Nol6pKowztsbWwDe3T4og=;
        b=kYvxU2BtP2H+kFKs+uiw2Z/cNcpXvsXld1P+oVX0vx9Lo8ggibPcU1HF58qyjCP7IM
         0DlmNBJ33/mrWNsaOVT5rnU+8kdyChpl/i3r8JO/K067346EXS3cEFhlh4K0QErJiOTH
         aarNnnukifC13Qyrw9y8KMYJNSHH6+Mtyc5y380UDQp+Jq+bk17s823/kD3u5X4DmZ8o
         jirlqnpMXh6782/KUwM2vvnNM27zUDly3GoB7gjRb0UDmIVKMoayIvySUuOV1OhpBAFW
         wXFSsiUGnHbB2Bc9JsHcZ5r6xA19JgnihubVw9f+B3N1/C7rm5mfIVW8mOjiXA4QGXJO
         T9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749818043; x=1750422843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71Ya53HdH2POf52rkfKFn+Nol6pKowztsbWwDe3T4og=;
        b=bttsccbvf7YPpGWxrU/hRbpWJUWoZ4MkMeGx8wB05MEg5SPrUnzo5YyC3De9Vccxip
         Cc4KOE0qq5bhuextgqCbhHdVB2wdVNthBLGJArtXIecSh9kt6V8esqDJ2Nivu0Tqgfg1
         3YJID0eY0vfKl+0JpEQTnSy5p8tcq0fopv4teYWPTxrwYA6HsvbA/uOjL6l/77Ivjxfk
         lRXDghQo4jHbHN2+EF+hEzpTNkFwz+A4VhbLbzClw5hc4Wznzj1kCQcFQKSoKWjtSJQY
         69zWzFuPxDZERxFx/+2Uu/YDNiy1s+vvl7iv++2Fpkf3S//EouZCf1vjWp1HXngX28RY
         RczQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcq+WYHf8EGOh8EIyY8chr+HrO9i3t1LpOp7rgdafDXAySyUJGjTBTT6oACee/LyODs9nQUReVuz68gw==@linaro.org
X-Gm-Message-State: AOJu0YwFjzg398hpoGQp6o8pWul5QCVuSUKm79GAzDQf+nZsj9LFYnZe
	IhtcbpLBDTVblkOco+bGT4uQ2rTWvwice4X/5J+4Ce8FEIsWqqn8GALgRwYjSTbjoIU03JmYPuW
	IRhBTIvXnD9ycebMQj9u1N+qSSbSfyFRfJq01GzISwdZm
X-Gm-Gg: ASbGnctot5AANZ9vE63L9bd7gL4/kfs5EImaq7mHsQpJFq/HSue9Q/19zAo5rNcHNgP
	R5E88JwUaUrtDoISDS+FZvDoULyv5NnUSyaLvp+I9htDQlBsYaYzFUaViuB+47koMqljw698sBX
	i7L2dTppZF7E1Td9gjk5iEsVUEgNi6xVRuHjD8E1QKReMw4Y1sXIAof/g=
X-Google-Smtp-Source: AGHT+IEPb3qsJDLQBTC8O9rNw2LMABjdnqOth3sas+F6r3fDBdPhv+i9c4Uol0fLbXfZFpDJZmkdztNRwKzE2noXcvo=
X-Received: by 2002:a05:690c:6f08:b0:70e:7663:8bb4 with SMTP id
 00721157ae682-7116374f3b7mr43623757b3.25.1749818043502; Fri, 13 Jun 2025
 05:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com> <20250612134338.1871023-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20250612134338.1871023-3-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 13:33:51 +0100
X-Gm-Features: AX0GCFvpyAy_J3mza-WH8ODBb8J0cb17KuCFxq0_mXVNO-YpQTCeuWxKD6udl4Q
Message-ID: <CAFEAcA8eC9TpGyrMARRUWs4q1o7LACD03zLAwPnTRU+m98LrWQ@mail.gmail.com>
Subject: Re: [PATCH v15 2/4] hw/cxl: Make the CXL fixed memory windows devices.
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>, mst@redhat.com, 
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>, linuxarm@huawei.com, 
	linux-cxl@vger.kernel.org, qemu-arm@nongnu.org, 
	Yuquan Wang <wangyuquan1236@phytium.com.cn>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alireza Sanaee <alireza.sanaee@huawei.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ZGjr2tPKV6VW

On Thu, 12 Jun 2025 at 14:44, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Previously these somewhat device like structures were tracked using a list
> in the CXLState in each machine. This is proving restrictive in a few
> cases where we need to iterate through these without being aware of the
> machine type. Just make them sysbus devices.


> +static void cxl_fmw_realize(DeviceState *dev, Error **errp)
> +{
> +    CXLFixedWindow *fw = CXL_FMW(dev);
> +
> +    memory_region_init_io(&fw->mr, OBJECT(dev), &cfmws_ops, fw,
> +                          "cxl-fixed-memory-region", fw->size);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &fw->mr);
> +}
> +
> +static void cxl_fmw_class_init(ObjectClass *klass, const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "CXL Fixed Memory Window";
> +    dc->realize = cxl_fmw_realize;
> +    /* Reason - created by machines as tightly coupled to machine memory map */
> +    dc->user_creatable = false;
> +}

Do these things have any state that needs migrating or resetting?
If they do, they need a reset function and a vmstate. If not,
it's helpful to have a comment explaining that the device
has no state to be reset or migrated, so future readers of
the code know this wasn't just accidentally forgotten.

thanks
-- PMM
