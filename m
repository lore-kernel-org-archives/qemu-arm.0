Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3689263njd;
        Wed, 2 Apr 2025 13:06:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdSTg5nGt/0Az3a2pHiVbTMb2XiRIlL9YIET0uOh5IiA+91Cuw3SrmjvXfvWZxC2hAmsBoaRJLH5mzdQ==@linaro.org
X-Received: by 2002:a17:90a:d646:b0:2ff:4bac:6fbf with SMTP id 98e67ed59e1d1-3057cb0172dmr93122a91.7.1743624399147;
        Wed, 02 Apr 2025 13:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743624399; cv=none;
        d=google.com; s=arc-20240605;
        b=ehBwp/GyDDxom+mlmUSq+NAPTN7nK7j7AA0Pq4Ak2pbavEoI1r7Ws47JE98+dXsWcd
         ip1JM8bPk2D/tDhCR1dnvv1X/Op7wCiq9RQXtnWVqfotCYaXThwxKAkTdRSY46E2kuzj
         i6nT1gPv8ymmXl4AOnAzSc4DvE8kSwNjD7+hEpGGA6+DEeQi9K2CvSsWfYGlMfiQ31WL
         VnE70Fg3Gmrw7tUVjfemVgOzvg5i/DvFRQns0PHPutpK8Onfkck4ApKWSz3qfJI6wLF2
         w0GEk8Rc1a6S6kpUDPga/q2CeVsBdDz/QaXgBG65/vENTXEF7/AKOALyPQEZD2aAU5Ft
         tkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gGER60jBODfpJu8rmDeG0AWBSpyUDqOOLEMl7orT4bc=;
        fh=f5OvwbbgH6yqpUrK1wBRMDdpLcjxAM8MgtqbrNpZ3fc=;
        b=D5eYqnJBzWbobXZRlLShniWM89lRNCW4clrlxFigBePw4V7fnY8tfjwuD9VMXurhB0
         hNzVCsXh3x3FSe5+E0O/uTlqdVWkBlLKlcknRZX0MbU7EJxdOijBQOd7+VAynwdp7DxH
         B4FnkVeNUY4wv9GHyxa8BbosmQ9sSeDHDhNI90DEd3L6ZphKrle/smZC0EmV+x9fiOt3
         cEME3pQ4WQPC/ElmfDtlS3NTgThXc5CN+6WHrSOEMeVNUqSjgo4jPz8eirr337xFt5kS
         c5Rg18DWZ1s1oS5wc4lRsBc5VpvpShsDzqb05nD5cpzr5GMFA/e2n4um7hzQqN9Mp7fY
         uS0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ro1X5RAM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3056809f613sor2841985a91.0.2025.04.02.13.06.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Apr 2025 13:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ro1X5RAM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743624398; x=1744229198; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gGER60jBODfpJu8rmDeG0AWBSpyUDqOOLEMl7orT4bc=;
        b=Ro1X5RAMeRiBLFicxOaBrT3d+djMJq682uvyTs2NMFG57Z+axJttYkYMaNGD4Wc/Td
         teuFtuXuyxVrQmRGZbPmvWnb2KWXdE4c+pyR3CHKRqGWrH4m7rml5guu0ZuQKsn7xBVZ
         bfHGxmCTyFULPy8SKFjabJX0LvR26uZ8BeipR9gEnZVv5Gnz4M2Mv3Z4fomt2wa7N9Vi
         q+oW6OYhmmiHS5zUxeQKi4Wvcm82J1HsC3+zWPK/5m7fJS4YNtpMAVjr57/h6DzpSM+N
         6MXRax0u/2Z/RkV80G+fFYXxAhGH4M1huXIdBwK8iNJDbHQjX9XkLOPhUSxlzhsudjn5
         VevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743624398; x=1744229198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGER60jBODfpJu8rmDeG0AWBSpyUDqOOLEMl7orT4bc=;
        b=H5HbEojW5MDgA7Q9xmW5iuAsQF3YKXSCl80m9ubKbOSaoDVtRCEiMCxmY1H0nxlGpx
         wUuaI4jTtlV+PR4IEKDmM16eHcBDWI68O7eS9OXzkXU8MR7eLLTTAOSg6quvlz5ewmb8
         3oOPaZHIAJkvIHR12CijQZYqfBHdeF6h22T6Gn3bR7YvE7zf9f4rMgnKH4kG06ts/qTh
         nuwzC/sbmb1o5Nux5zQmUc5+PvaPMcLvw9ZhwQc/z88qK0ioyyrBL3pQGKBP0zmtck7a
         IEC4nnj/snq2Jj01wJJQVdQaxi3f9Tgh6JlkZptftsZ2JRYqS76CALR5fCDw/PBZcV4s
         AOQw==
X-Forwarded-Encrypted: i=1; AJvYcCXcMJCP8PZ0HuFRwdkslCylyXOrPL6HTcA3Irt6L/NxxbCOeIyfbRp0MisD+TXK29+Sa+uGug+g7fUvXA==@linaro.org
X-Gm-Message-State: AOJu0Yx6RSGKQSzSybKmPjsxqg47Zq1H5xxN08iz4Ity6jPoEq6ArbVn
	bywdryrjxV3WCn3nZ3Rl6ad0LFM22aZznXdG2Y7LtqJygqNbJgjjQYldEa7OhWO0sQ==
X-Gm-Gg: ASbGncvxO30+0JDTAPGs6amZB4u0CVt0ebJpOUlScYWdEw3a/5ZwHhcXQH6+b1KsoXr
	wHNLNIVmMIdIRPYcUKvZTiCs/35IKRQZHr40RjvbLfXrnVaGbT7OUVZJLfTqRGQaI+dGkKWHc9r
	/T+hMHca6xSBffT3iLtLOt2T35/GYCeCSq/17J8tVVkYkYeUIdqueGfr/Ecedh94BR/D5XHXlWY
	/R7Hz9iNysLEyg0Qj0ajPX9t06WadxKaO1oR2kEPuT8P+oMLIqi5cV+LSHB072emdJ3foWaFvQt
	yJMEqo7mCJ0g6uwahLs57j30c2C2MknQtDcZi21EcleFMBmUltpa/mFtOLisphlH9QIxCrsI8ZM
	l0ghWH0W3p3HuKBsLXZE=
X-Google-Smtp-Source: AGHT+IHByQEo/y3ttEUvI7Q1rqoMQM1inJLb136EkfcouhY9Hr4tBoK94ajqs1xm9pdBIzhEGiscGA==
X-Received: by 2002:a17:90b:2748:b0:2f9:cf97:56ac with SMTP id 98e67ed59e1d1-3057c9e87cfmr186289a91.0.1743624398689;
        Wed, 02 Apr 2025 13:06:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057c85eb3fsm67390a91.0.2025.04.02.13.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 13:06:38 -0700 (PDT)
Message-ID: <1d13c66a-e932-48c4-801c-9b14890679c5@linaro.org>
Date: Wed, 2 Apr 2025 13:06:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/29] include/exec/cpu-all: move compile time check
 for CPUArchState to cpu-target.c
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
 <20250325045915.994760-4-pierrick.bouvier@linaro.org>
 <e11f5f2e-0838-4f28-88c1-a7241504d28a@linaro.org>
 <319fd6a2-93c1-42ec-866b-86e4d01b4b39@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <319fd6a2-93c1-42ec-866b-86e4d01b4b39@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H3qsfbomBh/9

On 4/2/25 08:25, Pierrick Bouvier wrote:
> On 4/1/25 20:31, Philippe Mathieu-Daudé wrote:
>> With "cpu.h" include:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
> 
> I can't reproduce this error.
> With this series, cpu.h is pulled transitively from "accel/accel-cpu-target.h". Ideally, 
> it would be better to add it explicitely yes.
> 
> @Richard, could you please amend this commit on tcg-next and add a direct include to cpu.h?

Done.


r~
