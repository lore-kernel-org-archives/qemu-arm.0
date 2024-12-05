Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp461548njb;
        Thu, 5 Dec 2024 14:21:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXEVAZoRV6LvoG94sr1YdFRVA8EHY+9nTInIQmWYZMRM4dOVvtbx4D+wamXlPEH7v3gslhywxumnrO6HA==@linaro.org
X-Received: by 2002:a05:600c:3c9c:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-434ddeb49bcmr7923935e9.9.1733437282273;
        Thu, 05 Dec 2024 14:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733437282; cv=none;
        d=google.com; s=arc-20240605;
        b=QGU6l7juYaatMnbBGbrH10mvhhzQsV28xjJoXbdECTMsCJnfhCNjQ9yN1POMPGmybR
         f1HfKybdjoK9n9l+PAgJPjgUEplqwlNj6qahoexUDZDhVna1oPAqcQq4MGq0sGlP/fK+
         hnXKui2wtkb4Obwl9MYquNHWTMnK4GLFL5BYS/c9ZA8xegBuCDPXaQqWKs1LcYyREHAJ
         Xiyd3YIwRbOchdBha9eJJfcE6nmKl2LEnxCJI+0ka7+fTh+aYa6RT9aLU1qi5ft0cGiT
         kIZP6c+tDo9eQJblLBteOZafM3XxdHBcOgkX8GWMOnheymtOF4IklASwFwRVFafk2DwP
         Fyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qjd8XZhXH/oSft8UPc2Cp81YMGeK2cTivrQQIoMMjiQ=;
        fh=vZvQ1lFSNurVYq/cuMVO9g43Jr7rowtd59LrecH/emI=;
        b=KYMX8GHQEurc9UUvjQu1CmHJzlpGTtUtxvjYPe7DRYbRV1/EJFMfB7D5JGpg44BGLA
         UhGmCi9ILsSgabfjEJdsAhUYocFg4ayAsjqrmdlgRWuD8YazH9okWbSmL+sJ8+JZh+rF
         Fs0uRJ8QEI5uvVUQvEMJtTGnFYfQvwmN/zPfqvs2/RDgZ4b5PoNwq4O8nmzUQBkvcXh8
         eU3pI8UMT3lL+OAH0EfUFNahlt2qo1C9XSm4tfV0CGWo9co8T4MlEU2JHOi1G1nVGmqV
         Nbhj2qsM9t5pSRhfjRuINx4FJTIM5/xjMvoQiRVRpe7erQP69Ts7HpohMVYaICHGYeS4
         znuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNKNSZHB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434d9fb7232sor9214245e9.12.2024.12.05.14.21.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:21:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNKNSZHB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733437282; x=1734042082; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjd8XZhXH/oSft8UPc2Cp81YMGeK2cTivrQQIoMMjiQ=;
        b=cNKNSZHBUHE4zP9KDv0K0Yq1UbEzD5CE/HMUlD2jj0KC52xNptDxEoG1/R8xLqP2um
         /6+qfbk5WgojPFoIzsx2C2eh42uGd8XVR1JZhm2Tg9bP4Uh980CfORYxOezw5rv+b1kD
         cNSKBM+78RJ/YQhy+Ke4Utg2uaF/TOpkyz0zP7+8r1duX+399r7/2BoNHCUsZw3UyA6J
         Gh9bQ4EgDXXSUhZMBh64kvlC7ScKeCdZH6H+63x/d19STq0GCWMV4d8obHtzndg3seRB
         mOCFIWAVfIMWSzRBMs5sx/VVWW02qzuGv3UXa1wPINkMau4C19cV4g3yglSK2BbLSJaI
         DM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437282; x=1734042082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjd8XZhXH/oSft8UPc2Cp81YMGeK2cTivrQQIoMMjiQ=;
        b=iANNgxWCW4Oit/gI8t2EVn3JbEaQUEShCaPmqCWW/MAkLjybX2xhxShoJdudY7WbBW
         PaAv9em72p8OnMyosQonc4kgIQt7qLMUTmY6nQiRFw41XfZn5v7bYgmGZP8dcSIGXLx9
         1LxERVE94Qj+U5HbruYMHRRDtkAbqppV63vNVXrTI82jT2oFiBHU4BqEYtDhJWQMhcOO
         w4FCN7RSsHpRhyb90i5GWoafCMTrik88ByFPVWj8oyfMcF7txV05fp92bnwCqEyywDan
         pxooSxflQjYeR5NxpG9pAZuyMV+WUKEsBDQSiRkrMu/xGlJdigXzFukgeY+PWknhhPAP
         10Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWUJXgC6JKkg3hfi717f2bK8nbQ/3Pee6X8GOx9a9xDELHGnl8Q3YJa3Z6tWKQF09p2ytO8njXHdwSQTw==@linaro.org
X-Gm-Message-State: AOJu0Ywf2/88kufdm/MPT5qUWkpEuZF9ZzqwXukDi130Ca4M/6rE10ST
	HqOEbIOvefLQLNlYwT8gBfrH/c4Xh3U9xjSUFw2JNlz6GQ7XYk5rDLIJkLS4qy012A==
X-Gm-Gg: ASbGncsi+21G05avkJcZN27xtuwzkng6s7pd1NZR8TSSNK+c1jzSGqQ2hME2UIYcFyu
	GnmfxHM44YaNRCynTakBX979qsBiu98UT0h+qJBZAVw90fJoHXzOy4el5kh4DdsTe0XX6Hebnd5
	aKw2oMdy1vhBSTPIy35xQs3LMgX2FEyXf4Bv+MCQbIzpQML51mD534Y5KxJFpdB7UsRKMFhZ8dW
	RzsRLjZIRAlv60mCxRKI3NstcTkk5CMFQh2TmA+2oN4oJT0edp1a2ClFduaCqaWCn9oksVusY45
	gD+QEgXU5VnmA/4vZw==
X-Google-Smtp-Source: AGHT+IFIeZkaM1Mzi+J2zwcoJ7G1xSCENfq2HICboEOHeyOK4eC3SyqmcQbjkdQV/BY1mh6pZmTgwA==
X-Received: by 2002:a05:600c:4f87:b0:431:40ca:ce5d with SMTP id 5b1f17b1804b1-434dded699cmr6663405e9.23.1733437281770;
        Thu, 05 Dec 2024 14:21:21 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861fd465dcsm2984623f8f.51.2024.12.05.14.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 14:21:20 -0800 (PST)
Message-ID: <ba650cb5-488c-4127-a307-ea16c9e44b5d@linaro.org>
Date: Thu, 5 Dec 2024 23:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 24/26] hw/core/loader: Add fields to
 RomLoaderNotify
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-26-jean-philippe@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241125195626.856992-26-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: rHnuANRTWEMp

On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> In order to write an event log, the ROM load notification handler needs
> two more fields.

IMHO it makes more sense to squash that in the "hw/core/loader:
Add ROM loader notifier" patch introducing that API.

> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2->v3: New
> ---
>   include/hw/loader.h | 2 ++
>   hw/core/loader.c    | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 0cd9905f97..73f317966d 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -355,6 +355,8 @@ ssize_t rom_add_option(const char *file, int32_t bootindex);
>   
>   typedef struct RomLoaderNotify {
>       /* Parameters passed to rom_add_blob() */
> +    const char *name;

Description of the loaded ROM.

> +    uint8_t *data;

Or 'blob', blob_ptr. Maybe declare as 'const void *'?

>       hwaddr addr;

Now easier to document, where 'data' is addressed in guest memory.

>       size_t len;

Size of 'data'.

>       size_t max_len;

Still unused. Drop?
