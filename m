Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7535850lff;
        Wed, 15 Jan 2020 14:30:20 -0800 (PST)
X-Received: by 2002:a17:902:61:: with SMTP id 88mr28322689pla.17.1579127420361;
        Wed, 15 Jan 2020 14:30:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579127420; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4qsVN6ONtPAlTt7HuqELVA7wkWuAOrsG7Du3klPVLWQJoc2dtt8LirZ56HOsyZCCa
         wS8guM95Wt8U95k1YB5FXHiWNJvXt+rf2NeSuXdAhFxaDc3uMm9H/YzrAmwJaLabw3bZ
         2eBLeJBmv1DfMBOx4eMIcjhpfKhrTiMnpGC6hoaoSF1zFEB9ksjPy3qkTx27O5rmZImt
         +I74my5JpetLXoIvBFfb+IS9F1XdZIb6CZ9yuHyZap+yqixS9a6oVzsr4KtgKI7Svzit
         kWKMDvDb9uZICHqRLeDs4/iGKE2MdsIdFclFTK5bH8kNJEXTI6NXynnJq3ZG6mjD8U1B
         iIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=F2YM0coMho0zfyacZVauDRrmmDVgAwf1jpXRKiD3Q0s=;
        b=e3kS8LL/NujRjtA15UrWflMjwicJIfOI0pwxhWLIbzL9XCzoSil+KSn9+xiqwFCXhX
         BZx8dRh8AIs4SEMhfrn+2J1aZkw9rR+mXWBvjxs84BkWWK762ZU4lXwOhjLbOYN8lc3G
         xumAvpQYIJMjdEpY772IVVkhQB7zqwHj2evgaTNU4vUemPRbo64iHTwqjn+hfvWYhJyd
         GKq4RyJoFJX4UG38ObQMea2kcCCd6Vo7De2fWSgU13TRf4tVs69K35C01CpS2piP3zDz
         NWOhl6WvcZtp+IbFlORfw8JFWRzNKtrw0Q0ziWfeFD+4t4PC2m60qr0flDl9+AiX6Fqm
         W4XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBDH8Zhh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u64sor22505077pfu.42.2020.01.15.14.30.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:30:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBDH8Zhh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F2YM0coMho0zfyacZVauDRrmmDVgAwf1jpXRKiD3Q0s=;
        b=WBDH8ZhhRhPwfZXWeN4r5ehaFjmF5O/LRya0wmV0RYui2nkS6kkGlabM6V2S2PTLjm
         /2nHF4GfLYOtEc8i1nw9AJ632brjGN7Gk99z024ai9aIOjI3jyoBMhxBUaK95/IBhBhg
         2VQo3imWwz8Nlq/+S4sm4nT1CjUq25GjWmVSVHBgx/cMxA/PYd///z5qNQEVeB3NJGMs
         kgUF3uIQ7Zj5TUiFR0gvoxPBc+q/cSMViSctFiA4YI3IA3W/R5SfCu0b/9g7L4+JZA8V
         uJ/STblN79HkhNzEjAv0ZDpbEposFQQrNDIRIk+qieY41MgVT9AAauaQfyMEsQRRkgIH
         XH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F2YM0coMho0zfyacZVauDRrmmDVgAwf1jpXRKiD3Q0s=;
        b=ABDZeDcnLQJETvIZNQ89va085JKQnFv7WzCwxlPznw4L39ijGSufUsyCM4ubE90QEE
         I4vSilFXn3/wVRzz8SaMj3GKqYZxx9I/eqL8ZUYcaHzknP0rWPAtJba6ZVjw1Mkc4A3E
         lKCPFwsJ1Nz3ia+2wn6RVAbcgv2eOH+90nRPB1sOa6ytQjbBb1lOkEZfBfOmV7D/9yrM
         3miUmnjqsP2IRiaXZIUzqdUJT/m7IXFxst7G8XI23zVP0eOB3i5fJwrO9eIoABQIprwc
         +Txpjc+IIOmDsKDngruCs+1cE3iFRqMKIGb6pjiaTEj97eZ2gvyjZo+GyZaJl+Mr4Kjz
         epgA==
X-Gm-Message-State: APjAAAWnLKyPFZIYtPXQiV/kZEEU8rwFoJFkdVNwRwDGZ8HXID2ZqiCa
	3JU7iOJo5Vq2t3xCgzjLT5FOnRVh
X-Google-Smtp-Source: APXvYqx8k2Azsxe2t0C1unLgYeII6ednCZV2fg6hJ3gdK/DconTDmpGuS4kL+5GaImYPyAcgztGiaw==
X-Received: by 2002:a62:19d1:: with SMTP id 200mr32504405pfz.26.1579127419973;
        Wed, 15 Jan 2020 14:30:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id z4sm22548739pfn.42.2020.01.15.14.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:30:19 -0800 (PST)
Subject: Re: [PATCH v5 15/22] tests/tcg/aarch64: userspace system register
 test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0cc21da-aa30-bc6e-34f9-c922ba5d8cba@linaro.org>
Date: Wed, 15 Jan 2020 12:30:14 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0YJpMPKd37eF

On 1/14/20 5:09 AM, Alex Bennée wrote:
> This tests a bunch of registers that the kernel allows userspace to
> read including the CPUID registers. We need a SVE aware compiler as we
> are testing the id_aa64zfr0_el1 register in the set.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20190205190224.2198-7-alex.bennee@linaro.org>
> 
> ---
> vgdbstub
>   - don't build unless using docker or CROSS_CC_HAS_SVE
> ---
>  tests/tcg/aarch64/sysregs.c       | 172 ++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |   6 ++
>  2 files changed, 178 insertions(+)
>  create mode 100644 tests/tcg/aarch64/sysregs.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
