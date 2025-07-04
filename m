Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp946617dyc;
        Thu, 3 Jul 2025 20:12:13 -0700 (PDT)
X-Received: by 2002:a05:6870:f156:b0:29e:43ce:a172 with SMTP id 586e51a60fabf-2f792010ca8mr966615fac.28.1751598733489;
        Thu, 03 Jul 2025 20:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751598733; cv=none;
        d=google.com; s=arc-20240605;
        b=bxcfrBko8WI3YrvBffiWxTJA46v4tJ/Q3uxQD3PE9EA+IHeqwfbdu7rCeBDGVnSvVd
         rQ1ZQ8KOMqN8sjV/IlTQxS7w447eCCRrJf4xlqMx3b1EqooqPerLaYYJI4g1KNrBON2l
         MsvtioGyIVT+rGyX7hinfk7zcxeKdIwtztRwjhIKRVw/FBYT2/eQCz8y8gnrn9r4HPZX
         A3Vks40mMr8PCf/hWPabZDpodzXAEvoO4Nh6njksYpn8+/OE30qUyY9ikPvbA8B0hERG
         A2VXy21MK03g5qxu56VhdNFWGQuioyNjJjwOorXmgEyJ3og7hpRyY3YlgmnjT9IYfWI1
         NlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0EioKaM8sJL4SY4I1DN+rMfzBhecT8dcNSRvDuxOOjc=;
        fh=Iy/d1LnDIl6G123s9bb1Hj/0+1L1JS8k/X8q7C3jK5M=;
        b=OhqsKD4RsIdNn/ZO8Vk79+5smL8k8hpkt/bkgFJXDSBjkyj0kItek7I16O8erbmzqD
         jROYx2MHzLzPfuvUW1+jkcQRJmIVnZSrZOVPXTPCyKkyfn+gSSTje6b1VGhBqQlhR/6h
         9EgmE7PPWZFA/rjC5eFNYpoI2tMamzwwoZ7VVVyhaDHE1p+Njw63n2Krw25dVPDoIJ04
         /h2CTcKxo9+ZKFO2D2h0zC6MGzH5zJUR00DNI4PZ7IhKrSghgf/TXJ0EGhtwiw6qNQlE
         NDNhzXgOIR1QJHNDfJkjPKgdiMpYil52zxHkFuIaPbU+EHfGrs1/M64JzuxxuvLrbEP2
         LrQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aCWJjHIY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-2f78fedc2ffsor135467fac.3.2025.07.03.20.12.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 20:12:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aCWJjHIY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751598733; x=1752203533; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0EioKaM8sJL4SY4I1DN+rMfzBhecT8dcNSRvDuxOOjc=;
        b=aCWJjHIYOvaePoX61xfQB2k+MnWFUU4oC3aPOjBWav+0DGp28gOd7zDQzpLUw1rLra
         dCI81OndAo9dr0NMyH5ojO41OzCnEKQ5VvCovrz1HmJmgHzE6YIPZaFyNqCdJGyR/4Gs
         K9/Fm+mdnXf/4+plG2W9KJrfAxDhea3koulo83FtPOCfr5JaWa7F8HMhs15cRsIsl4C1
         fkFymgHeVLUFstRx0dvAHaPqqL9/AavLP5WmtUedcP/OKFzlNaseKq9QaM/mJ0OeeToq
         aQU1c6MsEIlZM+6xhiZBFFNd/NDmAi9JY4D+DMpWC8MVF1NiktC34wc0yYkzyW2zsehE
         kfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751598733; x=1752203533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EioKaM8sJL4SY4I1DN+rMfzBhecT8dcNSRvDuxOOjc=;
        b=gwVXMim/2mwuUhoIZCPZmrvrEEN0/u6KphiUyJU6jz6NGNwoFO/MQ7UiJVyMaon7aa
         9m82/X2xfBkZxuFeghA8dHwGEIiTgLNWB5j6d6qAafmkQqIO/br94wLS6HrVqfJQzg7i
         4IAtM2AyYPCe91A6nigHjtlz08p2cihb+QDSR8eceYSXXJP4fny88NzQI9QqHaEh/jyF
         3cvtIM3F4iYPDGOSIXQzf4wreB4bkbjW2Fqv2Ithe9yAZM6MH9+Cr+4hdQ9SkfZNPZ4L
         Q0CRxaN8HHdKlKOMZZZx9ju3T419VZ5bdKN0/yhDR+yY1/MCr/klscw5ja3HH175+vBS
         IQ3w==
X-Gm-Message-State: AOJu0YyzSAVVSFzgQgQ5RAW/TFg921Bby+A2u1vahDIymbRfYTrW/5aa
	qKHVE37qRiF6plZO/mC6CrHPXvanF6cNVP6NeVRNJ4dFz7lsy+uHJJWSoAluH6XXDx9raJLmPH/
	EZ7g5Fh4SAA==
X-Gm-Gg: ASbGnctXKoro3qxQ/napElDtqHe/oDI/zw4LhpvVnC6AEChpRucwVdYGFGVclk/06lf
	oGPbFkLnx40VBAHoWKAlIYNu1BOgUfZkenRpU5z9WzOBMmCeJaDEcr/xyEpFVZIbr99GCYNwgFc
	CVfkvGyERYZ3Xloqp7LD/AvStkKUVnkpkrp+c8lu+1wVg0T2Igy+adRwIpNHD7deSW/XEYiK6xb
	EeVr0+uTczAk4wdNWhxFBr+rIzzd1KR9CaFwXi28te5/1Rb2TnjhMqlPNsziM6rY7N7sXgvt9e+
	q6UyJXE3BnQbdNo82GIQkM2BUfswd5qBRx5K3qVw7MiO4YUwhnPsPoKwc3m9m/QQq6KjgwaeXVy
	tDhszAQVEsj78S3zgLKDfQvT1S7ZRsrvruxvdR0A+
X-Google-Smtp-Source: AGHT+IHtVvHlzb9pe6AYizvK475AMNHbfWAishd8by4r4npn0YngM/EqsEfzMpZhbZsslSejEYLRJg==
X-Received: by 2002:a05:6870:c05:b0:2e8:7505:638e with SMTP id 586e51a60fabf-2f792168420mr987601fac.39.1751598732944;
        Thu, 03 Jul 2025 20:12:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net. [187.189.51.143])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2f78ff050a4sm281054fac.7.2025.07.03.20.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 20:12:12 -0700 (PDT)
Message-ID: <65fc2bca-eba1-4736-96c6-59009d298476@linaro.org>
Date: Thu, 3 Jul 2025 21:12:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 95/97] target/arm: Enable FEAT_SME2p1 on -cpu max
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-96-richard.henderson@linaro.org>
 <87plehb3d6.fsf@draig.linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87plehb3d6.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: y1SJi+LZoCt0

On 7/3/25 11:17, Alex Bennée wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/cpu64.c        | 10 ++++++++--
>>   docs/system/arm/emulation.rst |  6 ++++++
>>   2 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
>> index 5d8ed2794d..f73729926b 100644
>> --- a/target/arm/tcg/cpu64.c
>> +++ b/target/arm/tcg/cpu64.c
>> @@ -1194,7 +1194,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>>        */
>>       t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
>>       t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
>> -    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
>> +    t = FIELD_DP64(t, ID_AA64PFR1, SME, 2);       /* FEAT_SME2 */
> 
> With -cpu max moving to SME2 is there any way to test just plain SME
> now?

No.  What we'd want, I guess, is a real cpu model with just sme1.


r~
