Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp758818njc;
        Thu, 20 Mar 2025 00:30:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzpt24S3a9l0G2xeGc7rQAYJjjYxN4LyIH5j5vVJ69lxKED9mFJQznoCHEMvAcpZQmma7UnL8G5iTU/A==@linaro.org
X-Received: by 2002:a05:600c:ccd:b0:43c:fcbc:9686 with SMTP id 5b1f17b1804b1-43d437802b1mr47235855e9.1.1742455856962;
        Thu, 20 Mar 2025 00:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742455856; cv=none;
        d=google.com; s=arc-20240605;
        b=AfQoeB3ipupRB6ojuYeWMHGCso/8cWMo5USDfQ4tW246waEbiQNPDbsQ2A7b0XjjHM
         aqg7qTTPT6Hb053+L0KYRCzYvlha9LexvFWg+lejH4lsYR2NVI/Z+safociub4OCkWfa
         b7r1hAIY0ZRRwADtSMUcziWOaLH8vh3e+69GVOg+XU1fsUGeJZ0123XnllZm8EohivPv
         Qoestt+EMbVOzfkDkFpVf+E69Sj/8MzDqRNO45d17v/x4SFnGywAzw/kBPYwGemWQnEq
         /QeiLIcLLcCBXczc/Y7JKsGK+UNNTwLBCRGfTyrbN/KH+T/1zHcnNKhX+m4xdMfrlI+L
         WCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9Q3cy8jYCn9xr9CHTDFTQ86895kEPqzjD05yFJjZ0rw=;
        fh=hIXiofhfqpavH6Tsd1hvZCFRY7wLrR/+K7am+dbLznQ=;
        b=SkcwdblU3pQBzKKWtaBzkSgPCi/bcDlukNXnLRrqB5Ehem6JXWh+AZguVvjVWzmV2a
         WZpzpfDyHNb6jSXxHT4V32RtBwGn0oskWk9DdX84tkpmOSLEkS1twSIRqJF8h+GU7yku
         6U8oe4YRi9yO25uciE+MZwVaBbZ8mqNS8RB7tOtskLpZtKAt2NiRLyS8O5U1Zy4pdId8
         B1G4O5b6lQtocBDWNv2NgFNO1X18SZGIAAnft8E6VuWHgBAwEQbe0yo71nOCd4kYoqoh
         kBLhWsOf9siVyxDDCyN6sX0Y8+bOZUIRhu3dk2hRpzCgkXon/1dRMOI5rHyNnWGc4k+S
         6Jmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G8G0D3CL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d1ff84815sor43649895e9.5.2025.03.20.00.30.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 00:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G8G0D3CL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742455856; x=1743060656; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Q3cy8jYCn9xr9CHTDFTQ86895kEPqzjD05yFJjZ0rw=;
        b=G8G0D3CLcnfQcvX4VRxutd9RXZ4xf5k0PWZ5HzHQjjddELNEK0gn6K52yM7EfqUpLt
         kBaAdmwOY0lUpIfywM0jyjq4YnUhfVZ4YE6DQT12ELDNo8RvkBmAgkFXdXaJQJH7/qnI
         hZp0R6Wcok1WQvH6+fdVy6AVc8S3z4qa/mbhRjSJ1M8265Mn42ToWEUBhsbjIiiPVsZ1
         q+uhJHn+iRcIGCM777dXZwqMGq4a+lUBuTAUflLVSl9HwYrFB71C4mRsx/VQd/1x2crB
         iC5eIWQ8H6fCKejmqWFPrwg3XttDeugScd9cfO1Q4UG7pXKfRrSF7lGSO7mGhtJZ6r3B
         pCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742455856; x=1743060656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Q3cy8jYCn9xr9CHTDFTQ86895kEPqzjD05yFJjZ0rw=;
        b=hNrJP5oR3gtgmiXJ1CmrkYXEVQ8mDYSmJZFKsEhd2bDIS+qYVvAww+LJsoyNRFF6YB
         NtlcKce8gR7B4cx1LiOL3ZnS24TIEakcz88t17EmQKlK3O+atjlroOHiT26S8lPFGGEM
         hw98EpiOQqDSR6Dh3w/cDSCd0Mv+ZfnmqMmk5QH17YNan4F2MVj3B5BP4RhEhT5ioNLg
         kL8iBhWQuwmExMt/rr45zXC2hySEewqvf+VOg04iSby7N2mj0L5yuCJBMdSRiJdgLH0/
         9ILfLBLGySB5ZfiVECz9hMKzVKc8XFcJAYU+jdFhWurhjuiIgjHJsZMKBVGwelJT9Obc
         TdHw==
X-Forwarded-Encrypted: i=1; AJvYcCXMbpiaA1eg/hFltHgjwem9rtfgaBvKoLb5Ly7nIcewrcMNJ8yuaRL7ZakV3qzL0z8Pc3CVYsUvqYxzoA==@linaro.org
X-Gm-Message-State: AOJu0YwASzqaAl6/YgPOqjLSD+oAPm9uR8mQAa20fjNrDTSjxwPax68a
	6sKESpHaG7n5YkxDu5yUN2NxVwnc6xqnhT3ZHm+3+6SsLI3GzLBkg5PJ3lbI8K+t5A==
X-Gm-Gg: ASbGncsHzOAbTU5K2EOakBOPoylOIhBsEnr7RhHbF50GPAwpfowNpVAPBroxSsISFSn
	7Q7C8jTq+5HGRiDMvCq4mKhW0A9Lg9UMXWc1sY70EhIXedTbzIKz4SiETpT7CQlvjU5r/ZuO6Vv
	gg8YEYXbKQ9M9O9o1zUcRSp+C0M+yi4QpTJKzYE4h3sXl3gfatSEfjaZnM0cEIYxIVMVaO8KjR/
	TQfIuv0gRqgyyHaf+rjRMDhAj1id50xby7p6rFX3+S+n0Pv89BjT9c2VxwhnEOLPcjGrKS1RY82
	l6sT53g6iMDj8a7F/x4/ea/u720l9dRIwheTYNAOTWMflTQX7vJJK6bKBu7w4DmXlzos0bfiVyL
	t4it1x1cgCqaH
X-Google-Smtp-Source: AGHT+IEEU0dq3TPYHgyykoRWUKZC23YFtuaNL8zhpMLcXVGLieVgHtXNvExrNGc44SfaN/TffgArRA==
X-Received: by 2002:a05:6000:401e:b0:391:454:5eb8 with SMTP id ffacd0b85a97d-39973b3207fmr5800696f8f.48.1742455856248;
        Thu, 20 Mar 2025 00:30:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39972df9b9esm4431024f8f.18.2025.03.20.00.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:30:55 -0700 (PDT)
Message-ID: <05412bd7-a389-4e9b-a344-1a65396409ac@linaro.org>
Date: Thu, 20 Mar 2025 08:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] include/exec: fix assert in size_memop
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@trasno.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-10-alex.bennee@linaro.org>
 <d3688ce0-e2f3-4bee-863f-dac7a394c789@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <d3688ce0-e2f3-4bee-863f-dac7a394c789@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7TKpi574HSm0

On 20/3/25 07:29, Akihiko Odaki wrote:
> Updating the email address of Juan Quintela according to .mailmap.
> 
> On 2025/03/20 3:22, Alex Bennée wrote:
>> We can handle larger sized memops now, expand the range of the assert.
>>
>> Fixes: 4b473e0c60 (tcg: Expand MO_SIZE to 3 bits)
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   include/exec/memop.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/exec/memop.h b/include/exec/memop.h
>> index 407a47d82c..faed3ff902 100644
>> --- a/include/exec/memop.h
>> +++ b/include/exec/memop.h
>> @@ -162,8 +162,8 @@ static inline unsigned memop_size(MemOp op)
>>   static inline MemOp size_memop(unsigned size)
>>   {
>>   #ifdef CONFIG_DEBUG_TCG
>> -    /* Power of 2 up to 8.  */
>> -    assert((size & (size - 1)) == 0 && size >= 1 && size <= 8);
>> +    /* Power of 2 up to 128.  */
>> +    assert((size & (size - 1)) == 0 && size >= 1 && size <= 128);
> 
> This is the minimal change to fix, but perhaps it may be also nice to 
> change it to use MO_SIZE.

I concur.

       ... && size >= 1 && size <= (1 << MO_SIZE));

> Regards,
> Akihiko Odaki
> 
>>   #endif
>>       return (MemOp)ctz32(size);
>>   }
> 
