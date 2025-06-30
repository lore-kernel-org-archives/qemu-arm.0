Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2482715dye;
        Mon, 30 Jun 2025 06:49:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJ5q6dSi03Gi1Gk823cSPromEssOo2aCrGZA9Kkpj+xRXbb6zATKZY04g3PlNNqKzZDu3HeO11xN+63A==@linaro.org
X-Received: by 2002:a05:6808:ec4:b0:3f4:1c2:874a with SMTP id 5614622812f47-40b33e0ec93mr9598578b6e.24.1751291381741;
        Mon, 30 Jun 2025 06:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751291381; cv=none;
        d=google.com; s=arc-20240605;
        b=R9Dbeb9TPWYI70/Khk48tzo7oHgNVW0My2phEcbEqlzYSbA6lZOSIcVQ3cCRpjr24b
         f/hYbP4JmvhUrCPwQ7yoLaULMnojWloazxDq4sI/Xx8F+gV1oSAinuFdzwPgVfQhFMaa
         x9L370HhTRbloVZ0De30NA4oDcnyD5kIaSEjmmppACzZ8D9W99SbU2Q4GhsR8wpsMe4m
         J8k+CwE8vkq2wBW/SJFuMDUUsOch0UFwpA+NqmH967JHr/aHmBMf8Bv9uftm2kwP4Rwv
         sg2sRfBKvfH6o9A8ktcSI5ZgDqVNWK+TzEVYVBvVtf7ABUa2Pvip2Elcy0FdMFPdIaDi
         y7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Lao5GrRMCI24tnalPT3OkJ/97mVyN1IN1gEERzn3koM=;
        fh=d4kUwqRRXOqv3Qigt7Skrz1BVwtCip3kt3aYfctZW3w=;
        b=Al+EGred9h1ap26xT33eKxZJCCmJro1DUAA7YfWpBxehcOl560Or/Li355LjHAHxGH
         Je0zCu0KFdbMcsTEHrPkGeE/e/6Fpndng+2Eev9DdWfq+99iOI0Qv4cpswUi9okEhFk0
         K5OlbDCBEeuswDCFz1ygYQTxhxBGbhvsVWicWsaiwKARX4T+3Qvqk8Gjk//fxYOhJ+fi
         NCrrZlQe3bTyAUG4ZPF0RkGhZ5CqJRWqDS5XpuEOrO+iFK620Y84LBH4LNu8erPJRIr8
         lhMmajorrswsaea3c90DpCsTPnEe7N2nEocKdE5PZvNqxsJMbD3ZPSFmgrUrvXWJ3qev
         5hug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B4r8B0HE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-40b32466de3sor726938b6e.12.2025.06.30.06.49.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 06:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B4r8B0HE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751291381; x=1751896181; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lao5GrRMCI24tnalPT3OkJ/97mVyN1IN1gEERzn3koM=;
        b=B4r8B0HEeYl8foU6mp1mOCj7IKdZ23QXMP4olPr700+dnTZ25YAgPiFT4Ke3Qpoiwu
         NRVxW7l/zuyY508Mz+LVmGkeHKRX1f4sNg/wVzz/F8sAqiUIRNz6QH9q2mFgC4wghOy7
         ln5JtfNxSNsevfvyXOg7+NsOnsZSVpywyZtTi1ZlOpZVS3yXRH//2QZl25ynScH6GyXX
         W6h9xgowentQN22u/07l3Xj+mOykK/zFrdTCg7LMnnAYUbwtR6S2RVAdkzmMgaeltWP4
         RDlHy7nWhMLY8J4akbVQzmN0oOCQYkqwXq2LgUHi7P8qWau5DcDnLy/7nzZSC9doa7oS
         PVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291381; x=1751896181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lao5GrRMCI24tnalPT3OkJ/97mVyN1IN1gEERzn3koM=;
        b=A5CRdIYM843Axy6lhQrJYLlAlyLxkpMSDLKRre/11nLpwYCGcf36M4yB6nePMs8RrS
         3uep7RbGSCmBrz6amSpIXQEO/lBRlRqiFZCncRe1/qMwgNlCG0N5T1GOyqyZ+rT/c3dN
         oF24AZTfKLpYpJ4KH79xBIIhfqr60fIkaH3Y5pC4UapYAqcvVQw9DLH1dlA433qlIeEC
         U/1DGFOrzTyYd01vqZ8mIkuzqk27IUPxvlfO47bowkcNg07mrx/I6FsMEhZtnlrLNfsc
         gBtf3HvgQaf5q/l5us8GUl/0qnnOJQyf46qQM0/vYCzK16qRtGygQn5YCdRMdlBWNNH4
         K1lg==
X-Forwarded-Encrypted: i=1; AJvYcCXwk0Zs4KoUQFDKAGCAfvkWHj6UPA4E0K6C/yHVlQRYf7P/+poNw1kJ1T5a0ETvBTaXSvH/zGf5ZgyIwg==@linaro.org
X-Gm-Message-State: AOJu0YyGDJemLmRVueb/CtChvZD1OZO8HiaTOzYsOy3r692rFdUtCpIR
	kzRCf81htznHDxqTy+SrN2nzgdYlLtt3SLMMqY5xBIoStJ0+GjCXjcrczXZVaiiXITF5rQ==
X-Gm-Gg: ASbGncsmGZeq4h1mLMpbuRQliAjQHjnDpIiB5iFUwReNOpTMsaVjRFL4qo7gR0NZG0T
	mcekR/uZwZpVZwktcxq+QCzUGCZIufurJp35hAbQU4iFtDqsyI0OeFUUdYRI8YcOVFfWPBf4N26
	jsUjZ0xiIQC9nxV4CXScwZousx8/199ds2oweXDTb2suNEQ37A9H1m2Pb/VmXlFCbR7sDWdZRY9
	U3GYXN2nPplArrChwU8wquT/vSnP+OLXznm2sxNaYTXL1wCOx0Eh8lzhEypa8p0oKvgNhcnrNeO
	i+yQ50t2HFLvZco9YgqCMh5vcM5TvfXj8xF6/+R190MJWbTIxmEbYDTdfdEVnVqyIyjCHfodAxE
	I
X-Google-Smtp-Source: AGHT+IE1UN9UfEb4LqBuvuMUmlUlGstzbBZ4IANwiUjl02TX+lNyuAG7BGfpi5mDLqLUwzKVqBvFaw==
X-Received: by 2002:a05:6808:ec4:b0:3f4:1c2:874a with SMTP id 5614622812f47-40b33e0ec93mr9598557b6e.24.1751291381159;
        Mon, 30 Jun 2025 06:49:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.25.7.25] ([187.210.107.185])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32420a6bsm1688687b6e.40.2025.06.30.06.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:49:40 -0700 (PDT)
Message-ID: <2b2f57fe-5c49-423e-bc2f-647a81bc40b0@linaro.org>
Date: Mon, 30 Jun 2025 07:49:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] target/arm: Only set CPU_INTERRUPT_EXITTB for TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250630130937.3487-1-philmd@linaro.org>
 <20250630130937.3487-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250630130937.3487-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OK6XrpGaHbSu

On 6/30/25 07:09, Philippe Mathieu-Daudé wrote:
> Commit 34c45d53026 ("target-arm: kvm - re-inject guest debug
> exceptions") removed CPU_INTERRUPT_EXITTB from KVM, but it
> also appears on HVF. Better to restrict it to TCG.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
