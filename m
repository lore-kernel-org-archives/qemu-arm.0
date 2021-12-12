Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3467752lfk;
        Sun, 12 Dec 2021 12:23:59 -0800 (PST)
X-Received: by 2002:a17:90b:3b48:: with SMTP id ot8mr40474300pjb.78.1639340639505;
        Sun, 12 Dec 2021 12:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639340639; cv=none;
        d=google.com; s=arc-20160816;
        b=KGMoI2yScyd1Z3mnwadxDa+N6xmFyxt8bScf1eZWYljrhNFT5fo53GwLZSMK8mmcnF
         dXsmsXLlhnVHDeP1J7ZUUVSpUf/YCOq+FvzsB79iUjGltUwn70nJsF4f8yCt5OCu9K0c
         a9OBet7AKKouj9z9D4+qrozrfWTnGy6nv5kxgOfIzj0kv3ceuwKkXJcQiAuTDaJkkNPV
         YolFwNa3dlnFhk+cL7HNVS4GXuprA8yOtEj+kRmD4wTD5tqGCU7jiK2+78dc5s+o9JCv
         8DlIjkoSAo9cS2zdT9l8fCfnpkTctjo38/q4HrcbkDMkTEVrNzxmM4joEr42u2f6GgtZ
         aS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ee5jSlGRSqmHpuaJpMCxUbnMgNxQBog5FJw1qkW5xIg=;
        b=PG/6bIVaeT5TCvxq2P/bvPin7z6RhCKplDHJeXVj2Of0EyGDjL1Mb4FtmPNIdCOTHC
         pTM2AvnIKXadCzKgz7tR7DTFyvjOODp0aWUy/GZbkv/iC3fpgJzjCMMzk7zEtnxkeI1I
         jGTyOxsnDzCsVwIeOfcRv6hpwXK8zIbQyCMGBrNrHGnm8trXRImpBmDr0MuL6dk1dcdG
         D+tFob4NHyV3f/auOvADJQoMXSjJ8DUToTSmdNDdqTwMavzfmKsoZ2VmOakSdtedUy+Q
         gU9/Hw/1IeulIpk/yUOZncj2e9z3hZSHYqW/qKEUBPmwXPQNf/JEaWd0qhjMq5Sgoy8m
         V3Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CO4RkmRJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6sor5512915plo.73.2021.12.12.12.23.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 12:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CO4RkmRJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ee5jSlGRSqmHpuaJpMCxUbnMgNxQBog5FJw1qkW5xIg=;
        b=CO4RkmRJnG+qmaQM3lOUPYlNft4zp/FnGkrSiQJdaNetJNCK2CWov3JMTE9/ssROFW
         Ll8HUx1s+tg953V9wG5/XQhWT8K2P8ClxxUEiqdsM6gYFqLlRSraPr+79wbcjSDztPaa
         tnAeaxemBrh3vAcU52jD9gnn0Mp/UK75jtem8/m9NrVKw2HE26Tz3y1XZZTbUfBhBzDH
         FFaLvlcX78JDaPqS2Qr/uVsKNDBUnyG/wts5hEHoYaoXTR3arbpS+3v/1rZwAAqjTTI4
         F0ks+NOZ1p0ILxM8z+yjNoKN4O6MxHqaYrII+PsEK80GedCJKz8iA6EZ0CUTgL7vLZua
         5DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ee5jSlGRSqmHpuaJpMCxUbnMgNxQBog5FJw1qkW5xIg=;
        b=CHhrAeuAXhO0oAQB/EYrDAaAIwfiTWhLPWSbA8AH+1uNbuZKhAPAMbYGb3CBmT4NVr
         0X4RAOCPInsiJPNe4fGWBqj4QchmXU3Z/Ms4x1Q/I4RNpjXStZrTZvoiLBPXjKpU/lze
         /Olpj2ZQPDgdo8+byiXwU1ZLaDLRYK4F+Uv23LOkYNEyiYz9rmee3Xs5SCEOZcFMDZmA
         yE8FtCgYyEK2ubWXnZT6iDShQzecuk9IaAY1UHRI7rx+3gmlb46yMAT3BJp9IqGhVlWm
         o2nmyahRjaKC30aal98eDikhg2klSWpl2FvNf/OULvdRhJgRbSwA2u+t9nk62eHRiFqZ
         jUZA==
X-Gm-Message-State: AOAM5330bPAxdla2xC7oMtqDxQYzORdhQYwIKheRTZbYXJ1FckvadF0Z
	/5qNwjajYtZNwv3qpf/y5yXEUB1UqSLVLRTn
X-Google-Smtp-Source: ABdhPJzzUDifcCRnK73xVqKspgLlEVCtYBh1Kor5TDsDsBvEd6hpMfa5xYxROjFUu458Hyj57mC9ew==
X-Received: by 2002:a17:902:e0d4:b0:142:8897:94e2 with SMTP id e20-20020a170902e0d400b00142889794e2mr90942417pla.58.1639340638869;
        Sun, 12 Dec 2021 12:23:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id h186sm9880365pfg.64.2021.12.12.12.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 12:23:58 -0800 (PST)
Subject: Re: [PATCH 10/26] hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0bc61ca-d818-1e2d-625d-0a742b6b5d01@linaro.org>
Date: Sun, 12 Dec 2021 12:23:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: dqYFPbgfypiu

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Currently the ITS code that reads and writes DTEs uses open-coded
> shift-and-mask to assemble the various fields into the 64-bit DTE
> word.  The names of the macros used for mask and shift values are
> also somewhat inconsistent, and don't follow our usual convention
> that a MASK macro should specify the bits in their place in the word.
> Replace all these with use of the FIELD macro.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h |  7 ++++---
>   hw/intc/arm_gicv3_its.c  | 20 +++++++++-----------
>   2 files changed, 13 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
