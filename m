Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1630436njj;
        Sat, 3 May 2025 14:12:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3H2tkLv/afdYs/WovMZUP1MgeD0uky5nSr+eBk7uEYxBBdQ6awAq2OWJq7+IDnDLx8C3R2JDDFhRKmA==@linaro.org
X-Received: by 2002:a17:903:3c48:b0:223:5c33:56a8 with SMTP id d9443c01a7336-22e1ea7fe03mr35319385ad.35.1746306779374;
        Sat, 03 May 2025 14:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746306779; cv=none;
        d=google.com; s=arc-20240605;
        b=IxwveUlL6STV6C0NbUDy1shKa6WqBG8kO19qH4j+JqRAbXj64oYUd1Mm5HQSPCp4JI
         m4wGI9YHieKk6YFFl/a8W4oCexpouAzR3eT9oiR1jDLPKiK+xbkpgxZFZoleg8nov1rS
         /M08cmmYFBHorhvMXsVb6AYfeVTF8kLGTite+mJjuH4RT00dShHMn27OeWWbIoy4eFmK
         YYqspG8WLSgC59Wk/SYcI6Zqr3ov2O/ZvW73kbmWqF4DxB27JuonYbtrkjnIqWXCNWP0
         9YQygvZZ6xcarmZq3OiVPyHEKe4WjHCTuWuanm14alxOsggDBUBE8PGsQPgpZueoF95D
         yV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FxSfhsCEDNJtIfclTFmU04xWQhYR9A6GsTGzarhRRY0=;
        fh=/r11qNY2drq36n6bSqWDioe0HgnvY53xflA7ZcKmNkw=;
        b=OvTK0C/Mz5Uk8MHwftoTQrwQBkdcOF1dfLygZe3pcbOhQ1TXETkcLz47IWqwoqSBEh
         L7Cucl6hZOn3CvUSoz3Es6Eaod5ku4PqLSbrPdV2tpVJNrt3XX26nKhWIU8mtgt+NOaf
         U4QnC2OwsvCSMBn683GT2q4tCKsMwwqeeuQihnscQBY7NwnaznLjU4+OTSprcPR/HL0E
         P9eHgdQummXsIy6mcbey47atTtGW/ULQa99MY891bpZ2O12fuPq3uNUBj3pLI2bK8vxv
         5lZe+EkvMIVwd9Q9DQkqgzPLxXgDPPQNspjDyQvTiKoJcrgrUGzNwwzjWxNfqiEDGwuA
         yhOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2JLGVoR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be8121fsor50303785ad.16.2025.05.03.14.12.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 14:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i2JLGVoR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746306779; x=1746911579; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxSfhsCEDNJtIfclTFmU04xWQhYR9A6GsTGzarhRRY0=;
        b=i2JLGVoRDQcfwnfkQBJ7r+tvI2nsKuxSg/17jh2PpsHIpe17UtMaXRYwlVE9jXvkmH
         6W4iZvmv6EkRGD372uLz1l1qacjzjPNHK5xSuVuVLItE4qoIu66s4R2uYehmLnQnavlt
         uu0E0VqWzCbX9Uj6FKDZhe/3fybtr+UHPXQQg7O2YnZ+oU08KydYCZRXnpMHygSDENf9
         Du0UhQTZtQezjUnyTFtQdc70mS9KneQiXOM6M0Lr5f1G/UfVQsG37sWlrZtyMjsYHLW3
         dDywUwrFoSBo6DB7+3FTMKgveRrLTtelxEavz6OGu0wGK4jCla5/8vv5ZbcYq1eNKImi
         5AIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746306779; x=1746911579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxSfhsCEDNJtIfclTFmU04xWQhYR9A6GsTGzarhRRY0=;
        b=D5yqkIC73SWhCOjNArOzIahyDwfcEiKxWcyba/tPIdpdsY+aTHTiMnu6HuXxo/CUxx
         J7EbNIsdWka+f725A/IoKFnJociV7Vri8S02agoRYjg4Usgg98r0K7jFlaHiNG3pWBWZ
         Jd1mjkUjSIWYfbkL45O1BXL/UFmw90TJYTWECVUamDTQhDdl/9PUjuKd9+O9sahCIbYu
         WHT10YXvRP+lGmIYZyM/i4Cz3Nyxg1HewthmiTbryHbyyPZQsz+pi+/XFGzFoPmbAhkq
         E5l2RkospFc7CxFADYsr4U88wBZhrct7TdfAQ7hb9BodBqXKqu8v7LeIN4oD8xRTo9OB
         jAMw==
X-Forwarded-Encrypted: i=1; AJvYcCW/owOGudF4oohBNn/5ahzLh4zgm3/lq0MBZ5o8PrnVYhM3InrNlLpa6rAG8CAOKbv9IgUojCeerj4R+g==@linaro.org
X-Gm-Message-State: AOJu0YzXkdkJzK/P8ScUNcUhHKYoTefpYQpgS7vPap8DnlKOCvb52jSj
	0MIM/vYRRUjxWwndwLGQG1Tki5zV+79parUcBHbdebni/Ka6Tt0RR2N5zW2uqZuY8g==
X-Gm-Gg: ASbGncu9YYoMUzS52v4CyIRMK/2WBEpOEcXjZWjLJO5osdyCSnrFKSQRoZIjEg6BHkv
	YMHbaxneDQjaJheuNas53LzXeEoeWRjnQB6SniyOHPt13tAOGAL2HKSp/y1k/A6luEElYS0yf3W
	8TyW2BjtnGPi2Y3t/bnKp3uY6XN2jZTpyUvNonbl/nT6pcINOmtfnueDAFgLFVpJINDnuJJxZVD
	XKxeM0UDFt6e7lSpagQWD1ffcKC7XZA6/Irv9FfBryAhR/nsSCL3+qBwh+q+GlVU64F7+Le4LHh
	23jMedCBw3CW3nOuXZwi5OlyTCerJHTosXCWRIK7/keBBG+qHNbmVw==
X-Google-Smtp-Source: AGHT+IHHbxgpklJE0pRyZPQFcgtWhZTRnAvHKQ0lglf6LsP44nmUvYmM78Y0ePXBX3qPyZfyfd04cw==
X-Received: by 2002:a17:902:e5c7:b0:22c:36d1:7a49 with SMTP id d9443c01a7336-22e1eaeff29mr35613615ad.53.1746306778976;
        Sat, 03 May 2025 14:12:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a225sm3775538b3a.23.2025.05.03.14.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 14:12:58 -0700 (PDT)
Message-ID: <20fd4d83-4026-4cee-9d41-9f0ffb8ac75f@linaro.org>
Date: Sat, 3 May 2025 14:12:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/33] target/arm/cpu: move arm_cpu_kvm_set_irq to
 kvm.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-7-pierrick.bouvier@linaro.org>
 <e8976a2f-b050-415b-912d-3f2231f20fa8@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <e8976a2f-b050-415b-912d-3f2231f20fa8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TAahpYOy0XOM

On 5/1/25 12:04 PM, Philippe Mathieu-Daudé wrote:
> (why?)
> 

Allow to get rid of CONFIG_KVM in target/arm/cpu.c.

I'll update description with it.

> On 1/5/25 08:23, Pierrick Bouvier wrote:
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/kvm_arm.h  |  2 ++
>>    target/arm/cpu.c      | 31 -------------------------------
>>    target/arm/kvm-stub.c |  5 +++++
>>    target/arm/kvm.c      | 29 +++++++++++++++++++++++++++++
>>    4 files changed, 36 insertions(+), 31 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
