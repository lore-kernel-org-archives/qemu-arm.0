Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2200739njb;
        Mon, 7 Oct 2024 14:21:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlVfYghY+OggZoS3RQ5kivP0y+V3y0OtWEh3asBtPZZakjZ6sayG/V7vWXuX6P0tVuqlSW6bdDu5RZEQ==@linaro.org
X-Received: by 2002:a17:902:f707:b0:20b:707c:d688 with SMTP id d9443c01a7336-20bfdfb84c6mr204174165ad.18.1728336072931;
        Mon, 07 Oct 2024 14:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336072; cv=none;
        d=google.com; s=arc-20240605;
        b=kg3GJ6RXs09P3tKp6e6tq8h7xv2zYBH4PNm3aUMdWcliJgf8998wfyjkkhfUxfcdkS
         /IcAbSN+q1zcVrvYqlQ0GHs+XarMLYxE1bgrT1Ny/Am04aTu50xutyH5T4buAlwAHQNh
         NVtj1Kptk67wEPoAKtQVcVLiOn1XlAL0cLlY6Jabcyy1TWEUssDEzn6XxxJWuzp5/WkM
         bPaC8gLCDpf23btUNgn9YIbmzLn2PDXpkYMRdwb41GJzvsbUXupl4IzAzid5myNkgKZL
         niDStaGf/WWIC7OARkiHBfW0eUcRAnciRRSpO/BB+EZtSwj+QAKTbLGueD+MCVW6b3Xp
         FNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nbs7g7pKN0azl4wjF7esQMSxCGT5yGYvgL2s/yoMCts=;
        fh=8F6D6ZO30flAvkgFDfanM75lsdmskduRaDGvqtWJqOY=;
        b=FOOjG3NFjNQaDdeNlQGSNYcN9jgqcDreHL+UhJOjxpW/nInJ1IDTTgn7/VWqcCe2c7
         wNI4YVr1OuLo5Khz6VvBRxNTbOYLkWVzKnwSAFWifekfZdDREpP6/JqKvy0LndKOdOIS
         PK8Ldr5vpr4vc+T2jzgWzgy6hls2MpqBeeyX5MojC4fJ/25MSg+W7USWiYpcWj/Qsib0
         xobgnE9nRl4wvv0Zj9nHLR5kLvNW55OUOAME39GwZ4oN5Ols0XacVKREyu+lpBMEIyln
         1LmiCpL9koMVAjzo+h74VZ2Y2lsB/Bw9lGcsM5Wf6z/MD0djjfQPqbt+b9wXNBO6hOxv
         IafQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DASjZtfp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138d0608sor48084415ad.5.2024.10.07.14.21.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DASjZtfp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336072; x=1728940872; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbs7g7pKN0azl4wjF7esQMSxCGT5yGYvgL2s/yoMCts=;
        b=DASjZtfpvU8Aa5UEY9jMAEFBDjfoc5+CKpVnZaD47N360m/EE4sUzlPHo636SVk1JV
         cJXqWjGt4CBONoVFqsua5TPrOn2IkkJs0ERi1IF1jmH2s/IXzlVcPo5j1cP0KOl8Vz0m
         036dn/0V4JggEMKKIHV5mNYVvwo9KqSgTPkaUMJTlmmyEl87Zi5shgDUkgVJYFnwEdTy
         +1LT+XFuw+FI1eOWCOePy8PecJc90Z3tQcWPFhjoV6+PS7Sp4Ul04niAgsyrOAJxNfIG
         qceEIWYiW++XocIxHJ0WkJ/lwC8667zAknih8TDoB+4tq60tKtPLgTHtRDZ6E0tgrAUq
         9TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336072; x=1728940872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbs7g7pKN0azl4wjF7esQMSxCGT5yGYvgL2s/yoMCts=;
        b=YEe9QSk0zLBuWhiTjRfFH8GZZ3AnjPUmtRxrTcjjmEKELQJ6sEWMVTMSdBAe9xDhm4
         wx6WMFrjD3ESXmStMHgLs8hfaZS8a6tiz2DEGyRjxQrhn1wLcAZaAOVhJKj7cJlVLqkn
         Xl97Y29wy9kucpkKxwlUTVji/tP4xVEyRu+Wl9qu5QwPBYGH7/WfmwNlYhcXE8skUGD+
         AAvRKr2ysOn6nlq3DB1ZVrTNnk+CUQ4YdYMlrqKLw335GpSFMLo4/vvauVzYCFEDpu8S
         WAwCZ5l8VADtMOGWQ+ihZzrdzmsmT8wUTw7mQaarZ+3AXaCB6oPxITtAM9shfVc9A/oq
         /bXA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9ATfCOZjcHmfpNdWD7lruUTcdWyJAPK/jxlrykx38uSqzFDCgAoPuLuWtFh9BLtzZzQ3NERgVKpuHw==@linaro.org
X-Gm-Message-State: AOJu0Yx7HYxZtuByjIpSNyJkX21yo15IMsK5+Fe9hcd0+4MJwiyDbT/g
	6qZvWVs1G/1AmJfrd0y78OVksZyq/+PeKAp4mm3GKO3qBSYSPZXFSHw/2qSKS9nJ9w==
X-Google-Smtp-Source: AGHT+IF4M96uWhBFmpYxzsV8/xioZOTo4p5LmH83ChcNBWKxusaQtdWL+kwvVRtzM6Fzm3Kql/qg3g==
X-Received: by 2002:a17:902:c941:b0:20b:937e:ca34 with SMTP id d9443c01a7336-20bfe05d555mr136152035ad.34.1728336072552;
        Mon, 07 Oct 2024 14:21:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cec9dsm43790165ad.103.2024.10.07.14.21.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:21:12 -0700 (PDT)
Message-ID: <19da4a11-1d0f-4c9e-932d-2dd150e33d7e@linaro.org>
Date: Mon, 7 Oct 2024 18:21:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] target/arm: Pass MemOp to get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-14-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: F5WpPvNbPFba

On 5/10/24 12:25, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h      | 3 ++-
>   target/arm/ptw.c            | 2 +-
>   target/arm/tcg/m_helper.c   | 8 ++++----
>   target/arm/tcg/tlb_helper.c | 2 +-
>   4 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
