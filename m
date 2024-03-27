Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp255711ejv;
        Tue, 26 Mar 2024 22:57:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQsMmdynrpge8ZG8e0dxkBsRNM+vv8lClyL2lddxs7qZ+gYrXub8KY6LC6MwM7rSUdnSybs2xBL1Xeg3luZjc6xwq/Qe/a
X-Received: by 2002:a17:903:11c5:b0:1e0:e2c2:578c with SMTP id q5-20020a17090311c500b001e0e2c2578cmr2008816plh.11.1711519051045;
        Tue, 26 Mar 2024 22:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711519051; cv=none;
        d=google.com; s=arc-20160816;
        b=kbj2udQKrgUJ2wT7kF/nx2psCvncGBgLlwN3A32hyalIXF7MYNdEqFiJ1syE0U/42F
         XXNLLsSp/jPlxyiahgw4RD5DJg38/7QoW+6i29DtOefK+DhQ4Zh+GL6/omBsAL3Icl0u
         u/dnAAkEbmFac6xuc3ZUKidL9K7NCnhGvOfuCir5J+MgzOkYOwdO5sf1JdZboON7UuXf
         V7Nl5LLxy9AfSpX43+YwZnFIHIdP3ALukmivalTaihW95QdUe9COlLGBQGXiZiVl80rh
         Fp2GYXHLC1OfRfqiUTrVX1sTf+hXZIXGUY3DY+4knoZs4OOVp6vWiBQ9Bb8ezL38kn3X
         98Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=n7dpWrKUH9p/K5Rr3Mdq33XMyuTN0qXo6lLHkmOWCDo=;
        fh=avzVE5sRCiuFQknaohYB6wHQFwwu0LNEaIohwbHS3TE=;
        b=hL7QmndG1gw6kMrS4WQGuUG68ENLKGy7TgYnRm+gG6mcMjjsPz4mBq7CS3dwr6Sh1N
         Yk3pLof4QwfzGUPxryLCwxjyi8nyX9/Lk2PZZ5cuzHzxqfk59ehqse6PWRb0I2Olttla
         7H5Ydv+fFCtobjvILQM1Qu4SkQYBJUOJn1bahBeyR5r2CciWaibn2SBsoR4MT+Od2o5q
         1SlkpPLVgsniP3fyQ1FFzFQc+drrI5nSM8JEPc9xoI4a0CoJ0RLF2RvA23ifQvqTjVEr
         3IwavJk26msgCx83EFLgOwlidTFV+Aynrft/mpQc98N0qdWNMw7KkULIYw1/dPCm1EoW
         RBLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x0FyTDiK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q24-20020a170902789800b001ddd9d8bc9csor4009610pll.14.2024.03.26.22.57.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Mar 2024 22:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x0FyTDiK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711519050; x=1712123850; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7dpWrKUH9p/K5Rr3Mdq33XMyuTN0qXo6lLHkmOWCDo=;
        b=x0FyTDiKim4p2s6rHjpTEjNq0d+FnW5l5UUG2fs19uxSGanzo6k6eGLGZdbciX+I8L
         mnZPR0MKpG9es/+UXUqWXw+RjiZ3nH86GZswOCgWIuItj166g0bDTA5XgmMUCkV11oyZ
         WMnt6IU+bKM8qN1A1MgRcJ/hc5ty8aHX/rVkG0bkOgHDS7WMRnFPMj07pBuTEHKDGXsv
         Hv6SX+8ard4pDtKBXvN+crtYZ8VNImiPZ0NnDCHBDtl8IjlEPooeMM2SUP1WCTOwrEOH
         bxFWx7tuq0VxNpLO/F3W8urkaDPDeZywouwzEOcDvcWDkzk5IVfC6DOHxv6bZ8q737xb
         fXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711519050; x=1712123850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7dpWrKUH9p/K5Rr3Mdq33XMyuTN0qXo6lLHkmOWCDo=;
        b=VaNuEPmCvw6FbIx1sbodiILD70MksIuLxU8AKR2tAum5ggSA8BbBYrPR9glesNsFqv
         hW0KkurC2WbiO9aqS1cuYRgo0cpJwHhA8rLo5HqPQWYH485z8R8evk+AKxSOjQ4YEN6H
         4cTZAADGS/UW9d8wLCUckw5gYQ5oQMwFZ3Fww8GLLI7QRxW1zACpPueF21AZLYSLeJ4E
         8i0c7lvK3qny0qWI7qz4f+V6BwsxJzi4Ww/5PVFS9oLgmR9MqbL3F3C7k2plN1QvxjEh
         2iM1p5EPTA9cMXAZIXXPtTnZU4KTFITqzLfzxM/XmVdw9qX3UQqm+ogMjtK2Op8GmSUY
         Fr+A==
X-Forwarded-Encrypted: i=1; AJvYcCXNuzRSd0cocjerMPJEDEilAGKD9RAilGqaYSbfDVl6R5+QhM0G4unNAS2jkOARirzapfqLKt7FxF9lc9D6yS8hs09naHP+
X-Gm-Message-State: AOJu0Yy09dS7q+yXIFEJm8BLPeGBDRxQekrxm3P9OLniFhlMNwinJyOc
	8H1Dd3PQI0goaW4LCekmrqh+P8T8b+nxckxn5xQZYnpiKD+P7gohyKW7n//kz57MsA==
X-Google-Smtp-Source: AGHT+IEDtXFsqXkqwDnhSFfCpPzhD7inr6qiWFdkmv0jbhbOBgj45O9JPfw4i8XQ0XAzE7qPSRaAyg==
X-Received: by 2002:a17:903:1112:b0:1e0:ab21:4e92 with SMTP id n18-20020a170903111200b001e0ab214e92mr1949512plh.44.1711519050509;
        Tue, 26 Mar 2024 22:57:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com. [173.197.98.125])
        by smtp.gmail.com with ESMTPSA id g19-20020a170902869300b001defd1c0ca7sm7972170plo.229.2024.03.26.22.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 22:57:30 -0700 (PDT)
Message-ID: <dededdca-ea80-421a-aca5-2169d9b43d23@linaro.org>
Date: Tue, 26 Mar 2024 19:57:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 v2 1/3] gdbstub: Simplify #ifdef'ry in helpers.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240322161439.6448-1-philmd@linaro.org>
 <20240322161439.6448-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240322161439.6448-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZKrKehi+5dLK

On 3/22/24 06:14, Philippe Mathieu-Daudé wrote:
> Slightly simplify by checking NEED_CPU_H definition in header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/gdbstub/helpers.h | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
