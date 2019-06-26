Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp358571wru;
        Wed, 26 Jun 2019 11:29:07 -0700 (PDT)
X-Received: by 2002:a7b:cc04:: with SMTP id f4mr240014wmh.125.1561573747027;
        Wed, 26 Jun 2019 11:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561573747; cv=none;
        d=google.com; s=arc-20160816;
        b=atToYouBTYkrZOJeabvFwfuGqS41D1WAnSbPwA4Ibpz1tN58eC1NYszcjUmR3nPrt3
         EfRDaK+dV6VYzTbL/qgM+wbdaRqpJnEwS9beDnR8xCLclNZW9s+g2FqRKgIEvez2d85h
         Hc54QhULAYUX6IC+TGVdq7sWuRE/O3TqSzgSTN9uYT6LI2Xa5+R9Sl87eiNk2pQDonNx
         mnCb7siSH3Y1xryJ290PESGEM5n7rd7tn09kCrjVHEgFomoiEGA1RH7WmWAHZpWFfdxU
         ryKbezxZIGoj6P1ooObIc5dkScaPrnFmFoicQkDXGyzc9LnF9yr/7+VgyEAmOHVh/uyi
         Y0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=n3YkOEVUPRaKEULHS1Gzl/S5jvMt2zT4d79BA6WQFVk=;
        b=Wz5xn02+zAJy4N3j1EgsVXx6wucntxn73EqhMKB79CjSK8Q1eldlE+8QqUqmObiQEl
         nLY88a0Hap3A3Vf4gUBh34AlUZjWyUqnClTYxr8o7I3dJ24FCUlxcHPX5Z098yY0Wam3
         H7hT/UIGPvZFaaOQk4rJLR5oSbYMvvEKP+gqJuvXxCDjS0TgcZc+Mgfw/9F6xINRvbWU
         dDBIVC5uNmgw1apJVgaW45mgaycHP7xhjV/Lq8V+zIxAPQxDb0gq2C2UUwbR6aV+Ov+2
         H+Oe9rZ/b2s5APZw6Lafqy/sr86ZW0N9aa+rhDnTXgfwxgi4sBdekaIEOzFsR6W1zyNs
         L40A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nUPUfff/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d6sor12563452wrq.39.2019.06.26.11.29.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Jun 2019 11:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nUPUfff/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n3YkOEVUPRaKEULHS1Gzl/S5jvMt2zT4d79BA6WQFVk=;
        b=nUPUfff/KnbTyMMuxIhQQZv7OGI3M+SeT9dQXn/6E59qCbH5KWRRDfFleZEXeuqtfn
         go7qU8c2sx+PzsfGPl3MQWA7qfvQbSzVZCW2yTdEBD7tCvBiwhLRWIVnnNwgVGedJNWA
         3pcedqAYfocS27RInRRAEVI3moAyexRQ1Y8nkgdxBeNfYNQVX8y3rKWwqFN8EgXcv1eb
         2/2Frav3uj7Rx6tJyVnR6RR1xxOtQm6nARK9R87dYXS7FAxvRnM0+C4g/cyIHqlKvQFl
         nie/KXCssGCCN6KZIa59dXNiW95g+KpPz3Ijn95r1klLHeI8RZmevvtelZj9r9esdd0a
         Lc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n3YkOEVUPRaKEULHS1Gzl/S5jvMt2zT4d79BA6WQFVk=;
        b=ZLx58QKVeAHTvSEebPUCP+Ok3shskB9UZBv+jV1kUqngPFwPnA2oiqfasuzpI74AXj
         DTZPqxFztwOjRGxaIigaPQJWqrIr+7F7fbVolhK6xy245EYesIzxMEfF/ym58FzW5e6H
         DYNJrN8YrRgFoZnTBHPTKkwt2TE6SB+j+7yY3p9JmffaCHBiU7WfR2m1bdBAkqevm/Qa
         uujPenSirM5iopuufx4rhpv8ky/YwCeZ+mxzdC5ZGd+QY3FA2NkreB6M+EjXiSqW3lmX
         MtIV6rSh8jBBApMUngyPcEdrY4BtDurIiV67/qJW9tZNBgTHGmSEIijMSHOssw2rgFIn
         +a4w==
X-Gm-Message-State: APjAAAXi4PbcYFmFU8kAAtWe/Sa79u0AnfoHY/x29zQLSbg9wbLVRJ1v
	8bQTlW91F39LCUYs7jeNplBTFCT6
X-Google-Smtp-Source: APXvYqxybi8namo91aFfecG4kz0eAl6/gCup4PhnmwiRIaFVK9V/ovRxWhW4fDPaWrjOdQlVXstdsg==
X-Received: by 2002:adf:e705:: with SMTP id c5mr4864776wrm.270.1561573746682;
        Wed, 26 Jun 2019 11:29:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id v65sm3260625wme.31.2019.06.26.11.29.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 11:29:05 -0700 (PDT)
Subject: Re: [PATCH v2 08/14] target/arm/kvm64: Fix error returns
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-9-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cb58767c-be9a-b1dc-2969-2a90e3a2f528@linaro.org>
Date: Wed, 26 Jun 2019 12:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-9-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: R/ImNxAmNVlK

On 6/21/19 6:34 PM, Andrew Jones wrote:
> A couple return -EINVAL's forgot their '-'s.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/kvm64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
