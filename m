Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp267142njj;
        Thu, 1 May 2025 08:07:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvYdfJeSrGdDvVNTGVV3jzUog+128/veWgY3I7VEWXjEYRqm3kzFlsDETuEhohezbdQ3/Bd42ahIttdg==@linaro.org
X-Received: by 2002:a05:6a21:1788:b0:1f5:730b:e09a with SMTP id adf61e73a8af0-20ba73fbe81mr4687141637.20.1746112044516;
        Thu, 01 May 2025 08:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112044; cv=none;
        d=google.com; s=arc-20240605;
        b=UC50gIOLLRfln6UT20pzqVpN9SGrmzLIuf/eP7Fejjx9Fe0ejdX0+v5tUN9FqFXvvC
         yrdK6r+8VROTnFOAjouw706gYGqU26v4BEaxemw3HgBxEF6L8OTgGfuS9LhOsrfhq2jS
         6vA+3YigidCFqKNdkwO+ICFmnw599EeZgT/Pr4J0C7CvavX3121KBNQV9npmGB3kRD1/
         1NgvIcpR6Cb8Z2uB6myobb6splTdyF1cX/78ZOMnlTloQQR7tdQpLw1pLXgmCjRN7tXp
         7OCIGhBquArYZO6FCeQ74Xia3r9MbuyW0rp9j3QOPIBuiysfYlmm9dbHUllY+lMutaQM
         ho2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XClG0j609Ch/oadVNHfG3f0UoE0M/4F3xd1IWkCnl1s=;
        fh=xITsnjQfEMwEJ13ePwWveOAF2tgMh/i/4kKt3cTiNt8=;
        b=SfoFq8tbqAKfOVJ0SNkmM0SX0a+otww/I4IKAGQCynLq4tA9zU3sh6UgfhyIfdqoVr
         wYj0Qb0zTfm+hmPbKXyiyyZHZMAvLm9wTSeBPHWygWaCK1PFWx3vqfX+yfbfyZo9r7Tu
         yu8ynioizaYfB2od5pGth0QkvYyNFyuV/xxDktWK2a1VwN42lJxEMDsU9HEef/hhL09P
         WbTzxgLHFTBKtuxzVd2Um3I/RaFH0ZOE6GsrjMu2zxi5rMLdx89QNVIRgWMSP93pSvi6
         Q7PgF2P9Z6xEzFa3xA4p/dkPZtM2yZ/SCW2pkQ/lnyEX87+d6Ijj/sstX5cpHP025qiq
         3EXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYBuPfsh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef0d81dsor932823b3a.3.2025.05.01.08.07.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYBuPfsh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112044; x=1746716844; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XClG0j609Ch/oadVNHfG3f0UoE0M/4F3xd1IWkCnl1s=;
        b=KYBuPfshYQpKFy95VIH8/Gq64OEXMC1RFXl7p5TzSRqbRw1oCgE3bT4IsNBqxEKJgM
         nP26BE/WwqKf1LukwiE7evJMINUnA7tzhDsJEKqA3s+Z8QJy9mNTidseqZFqvzyzITgz
         MkqBBqB/cTjPjcy3uqQd8tjQsapoM4+aUHcbZ+wX5g74vnrMYvbnjDn4inI2Xc8B3jWw
         O0yBWrvNdnZU3NQah1UUth5fvIdRXcJDeHi5cwNxZu/XnwEmJ1wx7GeNtB/EDCiLdQqX
         thNaR8W/+/6iDMfvnTYjPqt7antGiD7sBmqSEjyqH8x5MPP4h2SqybnJJWf7W2mhGxid
         JIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112044; x=1746716844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XClG0j609Ch/oadVNHfG3f0UoE0M/4F3xd1IWkCnl1s=;
        b=BfTJvPmqUkGXTB+ZWMvvigAaGn+9vS14+oa9PyOv2OFb0O9z6ulfemkaOypeoNBmrd
         SrA02N3V1T8v/zib+uEQY6WmYOTtkSOE9xy9U3E5qiASNLf4+uPynHrs6FlDJB0DD8S1
         gy+IubzTS2lIyqX4CqVgA0ZWDFMuLtmqoQBj1ylK080Py5tJ+obBsfATMk3qIa+VkE6j
         DAOdayHG39LGFNEeaXo7nwKjrtAy45W8pAExSYV60f6CSB0X1Q/0VGk7LvxczXTjmV4b
         WX4GMrOePLCWlsjyW0pGGFInhormB0zA8rhn1TvNX6hoShtLKQONKjkgNYk9A766Iw7D
         4t9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYZ76j0eDyfM2qgTFdD5YLcH9REa+vNfcEUUDweFAivkA/BCKjHca1iAREroZztfzct17QXjlU9eEjZw==@linaro.org
X-Gm-Message-State: AOJu0Yzo3FxxMfQOStSCr69AOZyxGO5LKonSBunG17k09GbBhg4ifq/j
	MdzEFN0IJSR91iaolxR4O2HEuuM5Acfp+gpqkZEKGY42l7p2jkCVFOI5ganIiG7raA==
X-Gm-Gg: ASbGncu2lYPuGFbC+qpT/DcsFJidipt9FuXeNsVRchSfRyuqa4e/AYdiDvYxwpF9yw3
	fhVqNGJaSkJMNmNj0fCwusOPCMXyB+EjkWTAASWDL4Xmz7a2FPfJbyHCQBV7QrumL8+KbWm7Ju2
	0XiC2uOCKXxuodzlGmCufnWxmRob23DUzeOY93vr4YV/DYIZw7JnY9dkyvUAsZSyFlHGGIs5631
	8KwPpTF2u5zX/EZ2+BX2XIpEN6CzePO3Iv9vvKG5sZc2vqJ+YDhUAYfKF5Uz1GTxABa1L+otNVT
	W5kJpENOucRArsuMRxuys9Bnc9njjr+hxtVpQJYdmWova37lNQhadTELlUgiYqnAokoqhOqSPSM
	7Kc1mNYyaxGa7S23/WA==
X-Google-Smtp-Source: AGHT+IEhCJO2/YFE9tld0EaF8WnZ+0c1QN8mVDJtPzIdzFiUIxr07ToxwDiFnRR3//WFYEWpPhHmuw==
X-Received: by 2002:a05:6a00:3a09:b0:736:3e50:bfec with SMTP id d2e1a72fcca58-7404777ecd5mr5240803b3a.8.1746112044099;
        Thu, 01 May 2025 08:07:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404e5a6fa2sm929983b3a.0.2025.05.01.08.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:07:23 -0700 (PDT)
Message-ID: <3fd9ef2a-c6eb-4d08-93a2-4eed78cacaa4@linaro.org>
Date: Thu, 1 May 2025 08:07:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/33] target/arm/helper: extract common helpers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-16-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-16-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: PATclpkNT6tZ

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.h     | 1152 +-------------------------------------
>   target/arm/tcg/helper.h | 1153 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 1155 insertions(+), 1150 deletions(-)
>   create mode 100644 target/arm/tcg/helper.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
