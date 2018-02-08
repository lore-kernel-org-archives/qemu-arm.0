Received: by 10.28.71.27 with SMTP id u27csp2525254wma;
        Thu, 8 Feb 2018 12:43:46 -0800 (PST)
X-Received: by 10.98.131.139 with SMTP id h133mr295510pfe.155.1518122626769;
        Thu, 08 Feb 2018 12:43:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122626; cv=none;
        d=google.com; s=arc-20160816;
        b=mKR86dpZhaoPU3VMMW9AILlWyinFYf4BJRFYnaXZy8NnbygdEQwjeSkyxRFbhXlerV
         +3dEjwZh9cRuHBsH/6xPVc8kdCrQtetbndd1fhRbDskYq1oLM4SX5JEAogN80HxUB8jl
         qKSDRLJlt0mJM3zTkHQM65sJ/srZWInOXdTfxppWKje3pNt1ypZMp47Bx8gI/gmOpTUR
         QXyAAHmKP+XUULtnUlNLHVQ4dVK92eh21q6OBRbJrX7vGqRIWFjT0hlgZuPeDWIscGsl
         nmVCRbo6ksbP1YZg2Jq0/0LxB5bc3/MWf/Ic7WpyXUbaA85Df9/R+MmqsfYI+/T+6sKv
         Sgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=g5U00pa6VxfjiDNfJbZ7vk+9+3eYvXnyPuvePuDpmFI=;
        b=lBflAn5BkqgWA5L7rnvX4qHyH1Q3CYhwT+w7/+sa9fPkLmtIG5D6uyNX9A/o/k3a+R
         oUqg9iyye6DqgY7x6Sw9gbWPIbyUmKlO1CIhxQ9irqv2xrJOWNdOaCKoBeO+Wft6fcJI
         8FCIf//nFh3DtrcwQ99tZMqvwjQvFGf+eaqkvKu0wYAKb7qEPJaqHajyIahYF9f5MnEs
         AY3aW20gTo0XUDm5Ifa2R3e61DFWJkkzhfgMkZSRzVrzRo79QhYkzQnIHBgYwwaV/+Sm
         6By11IrsEZHpM05/VpGdWuQq1Gjm+P9hKqiQuvPsoSJOE/NepPQGV+ud8vu343AlmkgY
         qMCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jpty56O2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b30sor191434pgn.257.2018.02.08.12.43.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:43:46 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jpty56O2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g5U00pa6VxfjiDNfJbZ7vk+9+3eYvXnyPuvePuDpmFI=;
        b=Jpty56O2AiFkCHNFfxXEdIuzcYtdst2y2ySe3/hvuJgaM8duJJUVLv4hD5wZlTToLu
         KdbjJdnfKI8wC4tgK3taQzByLuS6XUQn9cWT93UZ2Wo8HBYAfJGempiiDDIj+Q2CssAK
         EMuKNdlwvN3CXFJJ/KcqT3IkgEBZpDj7v1jNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g5U00pa6VxfjiDNfJbZ7vk+9+3eYvXnyPuvePuDpmFI=;
        b=WCqlvKdKILnJ8rjO8TcBZ5bWDmQEwSTnF8xRh1gTu9aZA35UcwBVOXGAGLhsIf9F+6
         8qS8uv0FzZzFphbLul8vt/zw4lRrO6NUNVDJiMZyThH755CQudIYuKoZadjbqA/lLhqI
         mco9oTwEnnex/V/0TVl8ZRgOxN+m6HFvJalG5EGaXwVIZW74TiGvai5PPuAfj6FStfKt
         mKaw2Z4mowKdphzrAne1WtdiT/JPSJfYm+poZ8l+Wz0on0a32b4s98Cgvrq90ic3DaG/
         JYId2zcewDrRTFbaYwJinnyxPcBkTj4mbRccyDX3ZTzQEnahsPCZ8dv+bAB7PXWonnS+
         GBCA==
X-Gm-Message-State: APf1xPA9nli+9E4XIEuvlwNmZHaJpd/PqeCz38MfFHua6RJKFGDPH+DL
	1RJM8dWgrIvFSpPLoRLEJX+cWYFK
X-Google-Smtp-Source: AH8x225d8RQAAJ8dx2U5VaxzHlmvnQ+1wZpHfPWVQmXcq1gRHPsjzYzuAoBCRALUvPae0eluLIwiyA==
X-Received: by 10.101.80.69 with SMTP id k5mr327920pgo.443.1518122625764;
        Thu, 08 Feb 2018 12:43:45 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id r29sm2942336pfb.40.2018.02.08.12.43.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:43:44 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 06/32] target/arm/helper: pass explicit
 fpst to set_rmode
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c93821ab-5437-ef3f-949e-e8831d272687@linaro.org>
Date: Thu, 8 Feb 2018 12:43:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: omHYFMzotjLp

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> As the rounding mode is now split between FP16 and the rest of
> floating point we need to be explicit when tweaking it. Instead of
> passing the CPU env we now pass the appropriate fpst pointer directly.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c        |  4 ++--
>  target/arm/helper.h        |  2 +-
>  target/arm/translate-a64.c | 26 +++++++++++++-------------
>  target/arm/translate.c     | 12 ++++++------
>  4 files changed, 22 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
