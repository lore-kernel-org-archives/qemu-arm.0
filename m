Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2202297njb;
        Mon, 7 Oct 2024 14:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUK8RoYyIoiJselU8352mu2SdNRBU8we2OTuLHnj2TDURmhbdfpixWp/LWZE3Dyw+SWrvKfFZ6v+7H6eQ==@linaro.org
X-Received: by 2002:a05:6a20:c890:b0:1c8:de01:e7e5 with SMTP id adf61e73a8af0-1d707405c15mr1522031637.15.1728336332141;
        Mon, 07 Oct 2024 14:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336332; cv=none;
        d=google.com; s=arc-20240605;
        b=QegSXYZznxhi4zxvYBwlJn9TMDOycUqI/BMw4I0Gwg7Nd0aZRyM478cpONpBEDYzu/
         2SFX/S+U+oSWysmZxvc2dio0rlUlM/qmUdg2E+sMD7AR5jZkXeH1mFAEcXX/GvjA9wK6
         ewbEeVhdKTcwNpYSTMbEhpYALH43dv+RvNYskck+DQuNDAxyEKDSRMaFlG0TCTMlzIEP
         M8zVbY6a3MR185q+p6eo6uPYS3tyPXHG1VsepMcdxfhZqFKTqETwIWXVQ4/WG1e803hS
         qYwCjxNBXwRDFPNahUDQR3BLTvhyHHy8N/2aKv0KV7wD6KCJRUre3lmte59lLDBWjoqW
         nsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bvhNWuTmiXbiPL4r4jbXllO3aWtcbM0XDS1GCHGzoYA=;
        fh=ZbYw5pQe3+dp6G9oGVjII9fZ4AqUUzh1vBO0h5t+74k=;
        b=Cx2ugjzBEVErEIvfyKZG/LPRiCK5Zdmn0qIyIzJKwnuoGigVOdPO67AErneLfmLOsw
         azjm4VwwpYWRg9fDasYM2NcjOgBPah9FQw5jZETmeXtAV6ckaEhKJIjuwFP7ezyLJt4Q
         M2AqHAk/wq6fG7abKueQqXg+a20AyBviwvtMu//Kd3P9LU/Ioz8fZUYHDlknl79v+GKn
         ZFI2fJtJHQrFwkfGqlLBk910lDHY+qWRwoCqu9OH8fW7BGwpi57wv+J663LMMTpuDhZ8
         /aaJvZXrDui2zbTYrflgcY960MlN8eLBDJ/TdD5xJRLLvRTrRnDtoLNzgPLEDRKOEFAi
         6F6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujCZlnA8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71e0fedf2f2sor422094b3a.1.2024.10.07.14.25.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2024 14:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujCZlnA8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728336332; x=1728941132; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvhNWuTmiXbiPL4r4jbXllO3aWtcbM0XDS1GCHGzoYA=;
        b=ujCZlnA8003AZZu24Ppy8waKLzBerB8+6x4FP5rBhi/FooizLI+CAvKVJo+GSAtaxZ
         elRFsEFXg0zIP/499Zg2FFVLqYhhGYTD9B2XkXU+iV3TOsvWvSiCY9puRga7MVQlSl6M
         mGLbnmVhsJiOVvgX5x6pLe3s0iMWCdmzaE+UIRQg+bXFLAlGJyOMRZxuekpN3i3UwkNZ
         0OTL3Uu+118k0djNp8QKhOaV5VZ/JXfZXdm6TYn5TVVhVHFj8MyxK3SOw8c3Qf6OKPkT
         tpvwb6v4zCF2lijJnm/YITI5g7dlJkWDR5sl2rfK7nHstUXvsEV6TgVH41pUwPvb9e8x
         LUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336332; x=1728941132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvhNWuTmiXbiPL4r4jbXllO3aWtcbM0XDS1GCHGzoYA=;
        b=XhVczF7IWqygSpi41rKAzgQeWQQet4apSqNqvZeSwnVwyxoqFXOQSF2dxJRq+0v2zS
         ch0zWERMEnX3+WbzlZ/4lP3eaNs9CmfocE5lFE5meL9XR5gRG8B4Gz2Uwcj9tJOVl7LD
         eNmTY22Wdg+mxzjU7r0MPvTUEWqrxIw6jqYiZ5Z5iLps8SNzGraxQldZJ9FZkI5zstFD
         u6sSh4fm7vmkJ2SUibbGK12GcBYhMD++7p0bmUzUIsDl6fKZtWkRm5+UwgLCvhnZwMy0
         RTzrXsD0g0L3FMGVOXMzTo3CC1iym0uyNuOec73j6S37rRslY7v+Ea6pMJq4yGqI9mgd
         eouA==
X-Forwarded-Encrypted: i=1; AJvYcCWUP1V6bbbb5A0DPbwdjydN9w5q8iBvkbHN8J9oe9xBqa5XHpbfMITSjAk3UjuZw8nRowbH4caAsU6MaQ==@linaro.org
X-Gm-Message-State: AOJu0Yxagrx7teg2AHxPSC8ZAk7y4P+nxWZGatgwxjaSA1SQlsf2rDeS
	dW/xfrSPzJwDa+ue38E7+ex4aHzPrGAvQLsmsV/mIjgqxrRhPV1MKQrmZbPcqaMqoQ==
X-Google-Smtp-Source: AGHT+IHXPDbu9GiUdYV8Znqu/vftPYbbTENCnUoX5/c+cqoS+dsr+OnFvCnpTsrCSioOJE4B3/ulTw==
X-Received: by 2002:a05:6a00:9289:b0:71e:fd5:4efe with SMTP id d2e1a72fcca58-71e104cc6cfmr1595660b3a.6.1728336331634;
        Mon, 07 Oct 2024 14:25:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.88.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cbbac6sm4842201b3a.39.2024.10.07.14.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:25:31 -0700 (PDT)
Message-ID: <96f27a23-fe87-4f83-ab6e-9e314addaf4c@linaro.org>
Date: Mon, 7 Oct 2024 18:25:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] target/hppa: Fix priority of T, D, and B page
 faults
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005152551.307923-1-richard.henderson@linaro.org>
 <20241005152551.307923-11-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241005152551.307923-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: XyF9ywwKse83

On 5/10/24 12:25, Richard Henderson wrote:
> Drop the 'else' so that ret is overridden with the
> highest priority fault.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/mem_helper.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Fixes: d8bc1381250 ("target/hppa: Implement PSW_X")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
