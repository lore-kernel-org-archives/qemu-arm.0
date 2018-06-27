Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5804186wrq;
        Tue, 26 Jun 2018 22:25:44 -0700 (PDT)
X-Received: by 2002:a65:5185:: with SMTP id h5-v6mr3966105pgq.0.1530077143876;
        Tue, 26 Jun 2018 22:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530077143; cv=none;
        d=google.com; s=arc-20160816;
        b=e07AlAyER43ltJw3l16LgGUXDDq75O49KCXNyU88wuiRKL17pX7x0FXj3nZEHEOlLe
         wiCSros1L7u983T/+3n4Y15ZrJFxAMqYq0G7cW8RT7nYZc7ZFcuh4VgTESydH1u8l7Q0
         Zq0woBaFVvJSvoHge/rI4u2lzWIYqTsvwzlKUtn/RspXGUj+y2aI/eIoU8BYyQjj/JM3
         th4yxXmmCpox++n8+0NZ9qyst/QxB23aXAMkIV7yewqSIPwBjNPEYsKpPnWqJ4Kj3uj2
         q8Y554xO8dbRm6ysINolseQZ3XVlSet4Y44PIO0LqFJLMVBQF6BU7BLkXn2cChAmOQfC
         j86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=mkP/kVT05HAWJwwvuZEw/r6HWwyfEkL3qlsVYAg9rWQ=;
        b=dTD86KOVMomdb7rhak3PYIAIo+fBFGe3lgNj6T5qdwhztluw2Y0vTHN77BpcnlBwME
         M29CkqVeWfgqVxolRlZ920RzbJP/yPEJvY100bcSLK5SVPdlu9ZpoTKGFJiUBZiWWmvT
         yU5uDWo7hYqNU9PSB5zQU1srZyE0FvpMch2swLAjgRIsGdLSHavtj8wyyLxbYocNXGLT
         bxyaj6bYikzCTVQOPMalJ8EWlrGQ7F1O8qxWL5DWgQpM4L35OGKKMwZRRg0/FgS4vGMQ
         XEOPliOM6mwwuNawe9qmsHhtTm+GgBk2h0U8wXUflgzl9ULolOCBEYWDih/rPWCcCO74
         XCvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QZi6zSlh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u1-v6sor982526pls.117.2018.06.26.22.25.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Jun 2018 22:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QZi6zSlh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mkP/kVT05HAWJwwvuZEw/r6HWwyfEkL3qlsVYAg9rWQ=;
        b=QZi6zSlhjtazOMPCUQ+d0SxCB703M5RYRMZ8Hjrpuv7mJM/tbn4KeacoZOGa6mKQbA
         2tu99lnqXxbdblmiVn5xR9zKezQzTudJQSf/SfydB8OpAnP4LUs3a1IwbE4NifbAVFax
         7CbFrVsY/eERYyvlo7RIwBg6pEoIA0MQheqjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mkP/kVT05HAWJwwvuZEw/r6HWwyfEkL3qlsVYAg9rWQ=;
        b=olIczxj/nE+Qvky6vG4O5Pc3WUQrbKmd4F2SWsQ5A9JIGtgQSEFLR+l/4jjtx+W1Z7
         pK6zoVzMpZ+hDSB7aDhXh+1Ogm07jnjsghtHwwsLnkTBygXKGxl9+gJXxtuadaTTE4gH
         gz4luWHokfZHwGq3XAt8np+wT/LenJmkaN66hCMAzCHgvEqscLY/hCyZhwUUtoKwDZNt
         OFk3GINPAM/ecXbds5FRYnv3m8/SqYNYLuNMYsF6lWXIFnNiIuTSFAQqioWAgmX/+wFo
         oEK6TQSapgs2T2jYC00SxQF4q1sYeoR327JKrN7/8L/SIDASJtNNmN1mwIkc1D+ccsMk
         lm7w==
X-Gm-Message-State: APt69E2fdMqIbCpanQ9oqOzBZsBRW0mBCaQqqnk5WLVUYwuMAajBaI/E
	GGddVOWULY+L1A6TuegU0E7vHDpK
X-Google-Smtp-Source: ADUXVKKX1B1OdOqDwhYCB/Zm+7JF6rh6YR8Cm71KU2sUYyXASwuvlQD9R/027bPFaQBWRwnndsfF/A==
X-Received: by 2002:a17:902:b589:: with SMTP id a9-v6mr4655083pls.140.1530077143261;
        Tue, 26 Jun 2018 22:25:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id f9-v6sm4086131pgt.79.2018.06.26.22.25.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jun 2018 22:25:42 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 2/5] target/arm: relax permission checks
 for HWCAP_CPUID registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180625160009.17437-1-alex.bennee@linaro.org>
 <20180625160009.17437-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <945dc7c9-98aa-0238-1db2-8b5c9bf2aa1c@linaro.org>
Date: Tue, 26 Jun 2018 22:25:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625160009.17437-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: wPhaZA5vI9My

On 06/25/2018 09:00 AM, Alex Bennée wrote:
> +#ifdef CONFIG_USER_ONLY
> +            /* Some AArch64 CPU ID/feature are exported to userspace
> +             * by the kernel (see HWCAP_CPUID) */
> +            if (r->opc0 == 3 && r->crn == 0 &&
> +                (r->crm == 0 ||
> +                 (r->crm >= 4 && r->crm <= 7))) {
> +                mask = PL0_R;
> +                break;
> +            }
> +#endif

Why not just set mask to PL0U_R | PL1_RW?
This mask doesn't affect the actual permissions, just the check.

Then of course merge with the next patch.


r~
