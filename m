Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3103104ejc;
        Wed, 15 Nov 2023 14:41:54 -0800 (PST)
X-Received: by 2002:a17:906:3458:b0:9bf:b8f7:1fcd with SMTP id d24-20020a170906345800b009bfb8f71fcdmr9697910ejb.14.1700088113976;
        Wed, 15 Nov 2023 14:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700088113; cv=none;
        d=google.com; s=arc-20160816;
        b=0LfzmSrTc2Tnu7A/L2vrubojYnifKDnNpDTstsqZa+J5ksaA4k3PH9tKQmRCZhY8AM
         li7s5f3RijdlxokOxXXki7SeSibBy5JYSAJwU+V/me7+RXwEeiCELb6x3q23cb9hIxJy
         Ve1TsabUsbHmJn9ufQsVULOe/O7PY+t1L/WE0/OaGgT/wtpTLvjNOHeH//rvMzK4PlKq
         iu4a3DPv7A8gcVO0shbDJ3Q2PEXIBYaGF8Dlx0hUfrx6GMblWv4mOorzjbgi1LJosSGX
         Sze+p4WMySd4sRR61vs3zrpRsd1FhuUDNjxsE4DyD5cIdYBEkAQ520CtPGnu1D+mGu1T
         IN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=b+UnXhKnws6ugFoCSiNu4WShyOgi+X5yc/tmfC/jB1o=;
        fh=h+iKxUU2n9apZdHM9PquWMwmSAAlgKvrIxVYLY/WCMQ=;
        b=ip1Qc1GEJXpmyzesZO6i1PQVIrnoOC18u7mVXdISHOo/xV+iA1m4kR5ZC6YCldlCD/
         UnfJTVURVbNKKhiGA1k6lMGSqDkfWvujyjWBmwCCqJ0kiU9oaoAmh0BcOSKS1l6YjNu3
         0iyITR7tSOl5BglLgln61Wjl17nA1I7AUH24RzALQqdS5BKOYuXQF4Ac+cNzTyrZ2NLD
         KkMz2q3adRanz9nq35S251BmJ+UlP0Ea5lI9daYbdGpBGieRnZwe+djCg7+OZ8VoXX7t
         OS8o+gAxCIoO/69zW3t29/6lHxUcWHkK18Ve+KQeHYydcl9HqVhUcFY5l3loOoKmvgxh
         XWtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vob7nFcd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v17-20020a17090651d100b009b2b42978adsor2957328ejk.7.2023.11.15.14.41.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Nov 2023 14:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vob7nFcd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700088113; x=1700692913; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b+UnXhKnws6ugFoCSiNu4WShyOgi+X5yc/tmfC/jB1o=;
        b=vob7nFcdIS/xXdrRQbgEa65BXyto82dDtl/uRVIVZDIsQPwsqz47lxGBZ6KaYxUQ32
         lqBMr8QsYTjjxNcYJ+nSWmyW/tExf0trILE8oV5D9/CUkbiIPM6+2fD8xhal5ys+cAjM
         PwNVAXi3AX/ATNOdki+IWlc113GxQHPqJlSBYjeBPz5D+V9OVIPjMbinS6lnKcGvY4WY
         9hp11XwN/eiOeoJnICjGnS6z0ZARlrSG7fIQZcOXRNQ7CRgCywfyadQEAtj47EmvrRdr
         DM05q6hNzkVPvTI12YoYvj0l8YGVOZZ1EGWZkGEL/r0J+IeXpBzvEK2L+EX7ul/2LIaS
         CxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700088113; x=1700692913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+UnXhKnws6ugFoCSiNu4WShyOgi+X5yc/tmfC/jB1o=;
        b=HHGtx3VsfD+ewNNruexx9hzVAeIvMiClK2PLV0GJFpKG3WD7WhmJJ3nzv6upj71zJr
         Ut2gcv8w/2FZPOnn0juBvrue972WI8/2ZxxraKQI1CX5z2Cw+IikKpW7CHqjf58aelsS
         ZKa8d0urvHGoNgC7S7nL+tScNVr5ECEXnI9FSGCqRartZ8aDNecaKBBZfg5IZKT6kcH4
         NgP134VCAke0i641NIz9Bovxkv6SFLseqHXabWb8t/i0jKoDvHOxOGZw1QZAA8SFz72i
         Jbs15a/pJVHOPJPDtyfw5THWUoJY5fVlFntUmEFyPG8/F6lGLrg5BoC3ig4GbCoTC4lk
         5G+g==
X-Gm-Message-State: AOJu0Yw/QVBhTs7BsK87Dq7Pd4qxoVaK/CVYneegskx946W5wuwyuy9l
	rJSCT6GDhlJ2xE/LqcUUcZFskOJlAXMgNj+AgkEhFQ==
X-Google-Smtp-Source: AGHT+IF3/AuK46/Cbi9ClzQfr2z0OX8xHHE0oWAuIM5xT4oaa7sBvmgzSIch5GRY6cEyqXjc1Gv7+w==
X-Received: by 2002:a17:906:5385:b0:9b2:765b:273b with SMTP id g5-20020a170906538500b009b2765b273bmr10375391ejo.70.1700088113246;
        Wed, 15 Nov 2023 14:41:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.130.62])
        by smtp.gmail.com with ESMTPSA id dx9-20020a170906a84900b009c3828fec06sm7550338ejb.81.2023.11.15.14.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 14:41:52 -0800 (PST)
Message-ID: <1292144c-49a7-42e2-be73-a655485a620c@linaro.org>
Date: Wed, 15 Nov 2023 23:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] hw/core: skip loading debug on all failures
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20231115205542.3092038-1-alex.bennee@linaro.org>
 <20231115205542.3092038-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231115205542.3092038-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qXsLCJFiGR9L

On 15/11/23 21:55, Alex Bennée wrote:
> ELF_LOAD_FAILED is one of many negative return codes we can have. Lets
> treat any positive size_t as a success for loading.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/core/loader.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
