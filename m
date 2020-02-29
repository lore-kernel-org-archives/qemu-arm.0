Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1330104lfg;
        Fri, 28 Feb 2020 17:46:15 -0800 (PST)
X-Received: by 2002:a62:768d:: with SMTP id r135mr6862778pfc.108.1582940774960;
        Fri, 28 Feb 2020 17:46:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582940774; cv=none;
        d=google.com; s=arc-20160816;
        b=t78Qc/iXIeBNV8AamOHZQcb8Xu6cngIuTLXx/Ps0b46iiK2BilBWWiWtwgxO+VAYyv
         UH3TLrYHvd2jEx8A9b6MXPvgXUtOtdXxKHBzeVgo09voNfVq7eJa5D3eLuF+bp/JdbUB
         DxQDX38mzmDr3SEgVnoIsJPVzYeL4W83Aao/cgEUAYRoHgDfJr3nIs6r/r7YfvVgPJj3
         khS/qQOsWdhnMls3txamov+yCuFzkAP0B5xy/3TdIsQhNfbhvlSSEJLW2SXGxCxZ6ETq
         y9vce07dw8PqPp3RA6181SKNnBlIHTBkZDVagyBC3uWyBYQiKGEjRQQQxiXdwp9qjNft
         cudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=x6sDG0IIcZ7Zp+I9XshOaZdugtDBlhBVQlWxzodIvJY=;
        b=GsjNKyenF0DyLU+dxI+VAgqMJewQVOu6UvbMyKlCTtCRzjffavPDa5grLUjak2CxcI
         +3HNw+KSwLPCyI7XngOSVynVJG/LOS+DVph7iAC/R85OReu6Y0UgJc5Y+PcuqhHSueR/
         PggvJRv/2G7HbDnr5ZCFXW2gSjgwWs9yaRCXJhusBQW2hWHwFHIy84AUSwidhwj7nPD3
         wnELlBU6In94c55uZfiTeVf2P3J57Q/rtK35cs0kkVaspIiQRvcGYFRtMTLL8mviRHbD
         PPhak/j2yBYBOmvPd1lgoXmNrRKb6TbLn0MnuFnrPNLTSbDsfkp2ey2TCohl8GHBvpUH
         GkUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYvFY6tU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id ay12sor5245175plb.60.2020.02.28.17.46.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Feb 2020 17:46:14 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYvFY6tU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x6sDG0IIcZ7Zp+I9XshOaZdugtDBlhBVQlWxzodIvJY=;
        b=JYvFY6tUbRo1mduhB+HaeIsC6aqV/p+Py3QzITkob39jl1IgHAKiYM6rZe1XN6s7yE
         tspfHitO/ZOuWI1o3aOL6KSz8r6lmjBkZ4/vVGTbpavfQGoqwvY/aoYuAwsp3CF44VzN
         py9sExty9Re3T6SwoH4VyHG5C9e8MdocayWDAUFxRb+DIYZzRQG5f+zV26VjZU5+QI0l
         he40IJaVwRu4UOZBDeVYvwFAXn7v4d4pp8gpP6aLYsjxVX35yai4XNXRybMkqVxrC9nk
         HqXUoKc2mUGJeycvldpeNn465ABxytM8LB2dVhheRPzIX8wAg3Q1iZNtyDKzSFIKrhcy
         4tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x6sDG0IIcZ7Zp+I9XshOaZdugtDBlhBVQlWxzodIvJY=;
        b=Van++OlXlXkf+oYJ5iEPktlLhcpkd4X0JmddBKqgEjWxqKd76+p5NUnGdOapWqThaQ
         Y9pRIGNNy18A++vdcfUJZMh3JMZ4QIr3tCDvLmXJ7GqyOFcJDoalusNwhCpBKgtlUt0E
         ly163Eq93PmyKfwzv7ZbD5OTtsFnE382H2oDT9Ugfo9L2JON+X+Tc6U8SbGClEGGQHdn
         4QXlgTgseFfUs1q3CUPPIMTlFNGGsy/a5pflZBOz/yaZvmybjiIQet1ha9zk7RO02vLc
         vw7FurmBqqGBAzpCeDMHb8dArB0UhoVRUYhdBSUOZsQFT571veJIfr7wl2oQNeHvFueO
         K4UA==
X-Gm-Message-State: APjAAAWLZijiMjTG1dRkLWbfJ4PWcpHdY7dJpSbgORWGsRcggjrZCTAR
	dWxH6qY8GD6jBc31mdbveWsshLEEIV1+3A==
X-Google-Smtp-Source: APXvYqxghoUbsegNcobl5kP/3Mnlm2cEGTLCU8IAjtUK2G0TTzd1j5vj/13IqXhnWHwW4VCSahp9Aw==
X-Received: by 2002:a17:902:343:: with SMTP id 61mr6821238pld.332.1582940774421;
        Fri, 28 Feb 2020 17:46:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id 3sm12481617pfi.13.2020.02.28.17.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 17:46:13 -0800 (PST)
Subject: Re: [PATCH v2 0/4] Clean-up codegen cache size
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20200228192415.19867-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b8a3ffb-4ae1-b842-7eb2-e60defa2dd53@linaro.org>
Date: Fri, 28 Feb 2020 17:46:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228192415.19867-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: IJAqIbkyk7Wk

On 2/28/20 11:24 AM, Alex Bennée wrote:
> Hi,
> 
> A few tweaks to the final commit so we are a little less greedy for
> translation buffer, especially for the CONFIG_USER case. Otherwise
> I've applied the review tags.
> 
> Alex Bennée (4):
>   accel/tcg: use units.h for defining code gen buffer sizes
>   accel/tcg: remove link between guest ram and TCG cache size
>   accel/tcg: only USE_STATIC_CODE_GEN_BUFFER on 32 bit hosts
>   accel/tcg: increase default code gen buffer size for 64 bit
> 
>  accel/tcg/translate-all.c | 61 +++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 25 deletions(-)

Applied to tcg-next.


r~
