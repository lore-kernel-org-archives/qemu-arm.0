Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3364197lfk;
        Sun, 12 Dec 2021 09:37:29 -0800 (PST)
X-Received: by 2002:a17:902:b411:b0:143:6fe8:c60e with SMTP id x17-20020a170902b41100b001436fe8c60emr90356903plr.41.1639330649712;
        Sun, 12 Dec 2021 09:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639330649; cv=none;
        d=google.com; s=arc-20160816;
        b=QjGLWTS/bWKlX0eYCb/aoSSLQLNqr7NBDy4pkM+LC1IM1cRPFoO0ERgZX3XnglWhIE
         jy1ZuEeudCSrFKZZcghhZxkEKLry3dkpbaWaTxRozC+GazJUV58oKmBJihuPX8vHx/H0
         Ak3nX3lQvrCPLG+vPf6JySOyTlUsS/ApLyHUg57i6BO/mgMLotOUHmna/Shw3zW0LAOg
         DphGd47296DSeD8fPdSa1gTYOrimMT4dWYrhK5w954Pqx5+IRAlsTf0WM5fa1Y4yHEpM
         YJAUSA3HJmzo8Ti6QGS4oFCGbIc1g57uZGWt0qIEV1fgjQYsMlKDc+vAAcT1HJ7gmRgp
         Sg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Gh0RHGql8dCapvjE2Ze2aJuQbF/9FTfF0A3mHoTFCYg=;
        b=vAqLS5D0YihnF4B+LRLFCkraImHu7NxsoyjEUSlTLsQrwWghN5rQyWBEdKa5gR04RK
         iZooMvefZkQ3EOXEUVGS0WTajkGKu5fap++elsNJkkWVPhDbtpXKU0gq+0BOJlC51Va9
         Rhw/YL7nDPhDjlscLH9nFS6XxMhqyZl+si8VnlNI2Ny5N4OrTUDLzzE7u//Q+h5w9QKV
         YJrMMWoc3UT34yIsldGx3N6aS7zR85YijMtfsRnhOG5fps0M+A58Jh6DjVhc2FplnJVp
         LU9T1H3wJkDbVx/oZHjWW/OWxWgO67xnBeU5wGZrtBjbts6Tiuohuv9D9C0x7uBekNIS
         5Tdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJf16rkV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f12sor4970209pfv.71.2021.12.12.09.37.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 09:37:29 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJf16rkV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gh0RHGql8dCapvjE2Ze2aJuQbF/9FTfF0A3mHoTFCYg=;
        b=qJf16rkVMbZX+XDRsix8IZaJkWVc96u40JooV6Dpp60D+mVda1ZhqMXGU7j8UbwpsN
         5wLUtd+18e6rTjFHluhMmKPlZIb9KHWOtJ+/4dSnKSuhHXCrjj7TAmzoKnq7hQVaTV2U
         qi2x6h6tS0KnSoX87w2M1/L4xRRYx9GWVJ6M+68TSSu/XIf33bZBdLGz79skBCipjFoj
         p0Pk+/QolDYHhMuJmUWLSLxsTTEMuiG5e18dWqUZ6jU+GsgF06xp6bY6iXziGQzZPsSa
         C6+wVUFnZwmudWws9ZcM0V6H9HkhP6pikaGUd9Jjitx7CPPBXOuU7rGVBB9qLSbXRNjV
         ZJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gh0RHGql8dCapvjE2Ze2aJuQbF/9FTfF0A3mHoTFCYg=;
        b=iPolgRqydTrioEUN4460TJqrgqoOAbWISxP6LMvlFQWDLsAGvsF7dUBlJJvDUSuvpo
         AW6dYNNao4L2TLwmwEw4MDm4BHaaEasDOBFCwrhFvUGjG4U7HC0ySTTA/ZleoyOvuXso
         /N0nt/dhFHhwcQDWPjxk0yXL/5hM120ghvDh9V1dAf6Ve6Tm5pgC7jc6heY+irSmcnbU
         vQzq4/8gJuhmUCaOeJATCxkX7f4JN8a0oYc8sK0cKtI5DSNQaCBQVi2JmqAx76Nmanr7
         je2GFNb8GE2O10OLzmzT77iVdKFlHmro9BkR9F1qRBa6Ek+7J8LAHMpGDq1NsxEFr2is
         5l6w==
X-Gm-Message-State: AOAM530hSMJfJhB4MU/UGU/P3kVFcV48WlvM8vqtefpdTNwccaCChkfJ
	rrDM/OrHIMx2Tu7I+C6S7xzFCbxtdr09oxIQ
X-Google-Smtp-Source: ABdhPJwUE7rndxdr6B6ViIl70hkc4DLLqlmISa4LNF0pLAnUEtkiILTzuLM0NSxC5zjLbZBG5xIhQw==
X-Received: by 2002:a05:6a00:884:b0:49f:f5b4:5d17 with SMTP id q4-20020a056a00088400b0049ff5b45d17mr28248591pfj.55.1639330649215;
        Sun, 12 Dec 2021 09:37:29 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id g13sm4492169pjc.39.2021.12.12.09.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 09:37:28 -0800 (PST)
Subject: Re: [PATCH 04/26] hw/intc/arm_gicv3_its: Remove maxids union from
 TableDesc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f11d97fc-18cb-dd23-e071-fb0bd1f41b8d@linaro.org>
Date: Sun, 12 Dec 2021 09:37:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: kO23fOEcLuOU

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The TableDesc struct defines properties of the in-guest-memory tables
> which the guest tells us about by writing to the GITS_BASER<n>
> registers.  This struct currently has a union 'maxids', but all the
> fields of the union have the same type (uint32_t) and do the same
> thing (record one-greater-than the maximum ID value that can be used
> as an index into the table).
> 
> We're about to add another table type (the GICv4 vPE table); rather
> than adding another specifically-named union field for that table
> type with the same type as the other union fields, remove the union
> entirely and just have a 'uint32_t max_ids' struct field.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/intc/arm_gicv3_its_common.h |  5 +----
>   hw/intc/arm_gicv3_its.c                | 20 ++++++++++----------
>   2 files changed, 11 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
