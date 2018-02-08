Received: by 10.28.71.27 with SMTP id u27csp2527612wma;
        Thu, 8 Feb 2018 12:46:39 -0800 (PST)
X-Received: by 10.107.88.9 with SMTP id m9mr463470iob.12.1518122799048;
        Thu, 08 Feb 2018 12:46:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518122799; cv=none;
        d=google.com; s=arc-20160816;
        b=k6sS2C8rzkVac3xVsfYmVOiPELKt1PdPv0PYxOPECaNigpm86KabaJfA3/IeqZQwOM
         /f58fonTEZpINyUrBQ2qjMkIkNa28uYOQQ6TIEDRlMUfCsd764JdXTinffRpr5MngQbz
         WKK7QqQTXvTgSKR+5UJ5QpLYY1TC/PlouWYwJIYwV9aq6Gh7pj2Mu40WZeOOLoZd1vEs
         guH5Nv1oSR3PfAVk6OxIBKvR3RfVJJV+SIg0SFEVeYMOykgCY+mtNlN1TZ4Yn1y7b653
         7cH4ZCSBiLowL4HlBmH2pPYFzVxh9pfgG+TNI0KOEKomd9s7vsVWuyeWzNr71w58jliz
         r93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=0vjUb/qtxdOWZ7xFgiE+UrTII6mCSxVU8MgXSp436go=;
        b=jSyZvfzCD0Xq64AWpN6nO/SDotWVRDLladi7orF1m5xJKNJI3YIIWFZD46akP+MU5r
         53H/4oMt/YP6n+0mAUuHeICCHzgh5FZrC6XSio52aOG+lLLi6zMWnXZoKvpHm6M2JWrq
         QQGbBxgkzoe7Qnjzg2SmjEY05ZWTrby8XLYRZLbd8D9sAgBt0mjxHB7gqcX93h2xay+Y
         Kj4KyDR/ujrVnNrDnUNJChEuiOA2uae31fDRLkYNx+bTkoEOKI2msSFvtlSYctZF4MCd
         Ea06E5616UPed8yqx7BaCc0NQeNoDoWQfRKA67aHhBf5Le2Z7zYX3haZ3HHIdRpZy07X
         t7xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VpSVCNrr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l64sor512575ite.142.2018.02.08.12.46.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:46:39 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VpSVCNrr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0vjUb/qtxdOWZ7xFgiE+UrTII6mCSxVU8MgXSp436go=;
        b=VpSVCNrrwT1TxuZ64qrjUe4CdLRucxg/ofvh6C7hoFbh0lUQWzjZZZH7+dM7K2zd/d
         z9yr/vci2FexuNXFlccXIhW3s7U5XXvI06hLKr2h/ynscznnPNLdoXGQovE4/2RwcFp0
         Sc3/P5qK2e6ZDVVbdAX3sENoLkk35wXTeP9v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0vjUb/qtxdOWZ7xFgiE+UrTII6mCSxVU8MgXSp436go=;
        b=ZvRt/hwcM2wJB73Z3g4AQ3lpY2ygbj+0Ng0ki1gCNgs536J212A1n9NwJq4odbYuSG
         kEo0u3EJZdJjYzm9ZEZbHftl+DiuXzCsuKYUfBbS7BNcHuSHDoiNZi1NgFZV0Ukj9Im7
         gupOIEyNdJ/EePXZMhmC6KVtxAJj/h21EnoyjDVnAQJXk5ZkgZ8QkkXGOxrwBJiBX5TT
         Z8tZy/zYSl9lj8NDIaQfYAbsoXCKWunC/DRlJglFB980CHLotey8R82M1Ph/8HG1Ov8R
         hWenonjAH1/VBcaFtj6ZzRsnjNPJV1bJwTGN/By+ukCX3TpoGFJFubxBmQBpeLqeUEPU
         9iUg==
X-Gm-Message-State: APf1xPDh4hQjNzu4TTTP6nVHME/lTHK+hkU+/HWX3F7vPKevCp5+2bVa
	V+qXJlWk63p9tYE0lq2bT31vEiji
X-Google-Smtp-Source: AH8x226BSrpHEazTEZ1u5yvuMgqRLEjpk3O1qPVPrFZNQgGAgqy16KKjP8929VIQDpgZ5uAK+c0pAw==
X-Received: by 10.36.254.4 with SMTP id w4mr657087ith.80.1518122798694;
        Thu, 08 Feb 2018 12:46:38 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id 64sm579944iox.0.2018.02.08.12.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:46:37 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 08/32] arm/translate-a64: handle_3same_64
 comment fix
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <554baeda-6081-8324-9d33-d00d3219c667@linaro.org>
Date: Thu, 8 Feb 2018 12:46:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: vEmswl68wGex

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> We do implement all the opcodes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/translate-a64.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
