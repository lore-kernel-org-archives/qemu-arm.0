Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp501042njc;
        Fri, 21 Mar 2025 11:09:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWORebh3icuNeD3eqCzeZOnY3OkViiLwk4W8C6YzCk81K7e00A7RyrVKXpMyoH9GoGfTAp3dq87uKq1WQ==@linaro.org
X-Received: by 2002:a17:903:46d0:b0:220:fe50:5b44 with SMTP id d9443c01a7336-22780da4559mr66971385ad.31.1742580569609;
        Fri, 21 Mar 2025 11:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742580569; cv=none;
        d=google.com; s=arc-20240605;
        b=jJrQTUP+TVbpH+EXsgVEZlBTWCN1dqelN7pCqMkS6tgY8lubkvQnbJN3lCALTUC1Vo
         kdx2sEpv/DgmyCO0ljDF0K1pOqHEQ2AcnX0DQ7hS1z/3TVlPfdU26NB/Aufi/+kW4BoX
         oiPIel+NGKXByQHzHKYngcGwVxyTZXROL+NeaYXN1aJT9WOcFm6WOo6BlBFh+9P4k/FA
         oibKImRWL8KIyHrgkzinucIQo9/zCuhthnobjpd85xm+axv68FCQqMXh83fYWkMkFNkE
         UXOXvu7n1YBeP495zmhGOiuZXhxlPAZ1j6QoUoXVaUGl8BV5pKWGUcDXWtSzUBfYZYhX
         MchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iYahRmDjo3AoM4y6+k6usMjWi0lqC7TSobI4jZQHYNo=;
        fh=cwKULQhT7ypFElwgNBWI6qKouiFYcWzwwBBL8tEmESw=;
        b=afUczOrNO5VFLWY5gbmHBoKl5dlGk3SuFob8I8LOnr4PyVthGD43SV91HGVLb509gJ
         /DXnNU0Bbh0LvrXRycnz5QmiDbW00vHap3MvCcAG9AQKFKWAaV+uW/hX+eqIqzsM2K7A
         wBFKRyNKiTOQkMrETOqNaeaI9OuvnS365Otw21wzHB0Ecv0lhDNRrpDV0Dv96pW+PC6r
         ZUR58EIfe0XlF3vYcUwVjshCp11Fi2Iv6iKBuJxTCHury/nTOX1hq92d+yJP8An9SbZB
         e1OMrm74Nrm6RZ5eiK2mVcfLvECdNu+ayXkU2qPPaiaTb9Ds6k7/1BhdmA17HIbLJ4Vf
         i70w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWh4U0Dw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905f989b1sor1530126b3a.2.2025.03.21.11.09.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 11:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWh4U0Dw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742580569; x=1743185369; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYahRmDjo3AoM4y6+k6usMjWi0lqC7TSobI4jZQHYNo=;
        b=uWh4U0DwMWkfwrXOVTAegcGaWeGUkH7+R+4/v9UT4sJ/cYgYxnLg8Pkuivt4H3uXjX
         cuGVnkSA068/pcGiABbysnZXiP84OGrSNJmihrsUP/DYmQ+aV4QXT8Q9ox6Y8eJXUISs
         G7bunYZmXz3Ums2c0aMQ1Zhmp0nOw1wExKwCIsu8l7iIK6rnh+VZ863+j9q/Ju0f4poY
         KjRw07QwjNH0TncLOqTbsbmpUC0ILlI8zeKmHESJOEjlZuufKMdwqWCx+SkMlT/6fAzw
         KGsGZ90O8oa2FVcoXOH0Oxdkhltb48izPMdE7wuDq6zepEjmDah957pUAkwARXe541ZL
         YQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580569; x=1743185369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYahRmDjo3AoM4y6+k6usMjWi0lqC7TSobI4jZQHYNo=;
        b=GaauHRzQRMIIVzBletLAv6xBmJrce6XnSm6jBpT3GzK/ZPIDswX/Em9h3JUzKdb//K
         KwJF2SD5CA3YOkOr9FDfzCl526wwQUSypuZx8c+BWqOO+/FwQxCLHhdeZmKcDLYlgPSu
         7EmEn/FVgtGCwPFFdSctd/Smcqyy3WAxGti5lyTKV08h2Dt2FzL/Zy3hZxsCOWJQ3F6s
         gRY2QOqX1WQpdlYIrGH/wuzKeW9mgeMYzKI+JftcvecvmjALQFAg6ueg+W2v7vI0uWQw
         9ZHR4JKmZAuoco65xH9pMNR7ksY4eaaB9UorEvKWS8rNsJv/rF7rYSOzezRiw9jwnHr9
         OQYA==
X-Forwarded-Encrypted: i=1; AJvYcCWPTOkNBfkntVy9+KFwprN9ILpsVWPkJxSakRvMr09tDeuZK1Q5UgCuyzv0epXuuZJUSthlN1XWTbvL8Q==@linaro.org
X-Gm-Message-State: AOJu0YyEJOYq8fk6Dn6YB8NGBmVEZ4LpbjzGqZFbKezHbYJN12QiWmMx
	LghdnUzDKqexLqBWG3/7PSSb2hbzEZuxSpcLfgRdhbBHE9W32aV0KUWFplHF+X8HzA==
X-Gm-Gg: ASbGncuuf2saC7AYnGxOyymo75Mtxh4TcAZDrCPvfB3bDMQcs+PMPuWe0L/eDLuxiHl
	5ScKQul1HiEIacvQ7ZVv6OwwlUvD8PKawxDXnfw8nt30J/BDfRAL91kesVsAn6KUfIeZ+dSYiXO
	4GnwB5nOBZJc6yY5EplNuyf1WGGswQEbVnrgZQAlvmwQ2awBcCpNFosSjA7u0uNoC189nnyCf5N
	3lxk8j29hXjeYykWKVRPpYhLHvtU0kgdznbJEiGvODg1WJA2gPZkTMNaxjuiq3pzW6cyYatxmv7
	eh0PXdPo6WzP0igt+y5K7K24Xhf5252KH47M1vSF+2aLwKx9v+V4fWCFNlQ=
X-Google-Smtp-Source: AGHT+IGEzpLgBssNtlnSo2d+4BPwRhsuDuNJMP3F9IXe0w77xd/Vh1TYYLKAw8Fk+vnKaucfwGRFpg==
X-Received: by 2002:a05:6a00:2ea5:b0:736:a7ec:a366 with SMTP id d2e1a72fcca58-73905999885mr5137245b3a.9.1742580568898;
        Fri, 21 Mar 2025 11:09:28 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [172.16.224.217] ([209.53.90.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd7a3fsm2373139b3a.67.2025.03.21.11.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:09:28 -0700 (PDT)
Message-ID: <e738b8b8-e06f-48d0-845e-f263adb3dee5@linaro.org>
Date: Fri, 21 Mar 2025 11:09:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/30] exec/target_page: runtime defintion for
 TARGET_PAGE_BITS_MIN
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
 <2e667bb0-7357-4caf-ab60-4e57aabdceeb@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <2e667bb0-7357-4caf-ab60-4e57aabdceeb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: rAPJdHx6TCOB

On 3/21/25 11:05, Richard Henderson wrote:
> On 3/20/25 15:29, Pierrick Bouvier wrote:
>> We introduce later a mechanism to skip cpu definitions inclusion, so we
>> can detect it here, and call the correct runtime function instead.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    include/exec/target_page.h | 3 +++
>>    1 file changed, 3 insertions(+)
>>
>> diff --git a/include/exec/target_page.h b/include/exec/target_page.h
>> index 8e89e5cbe6f..aeddb25c743 100644
>> --- a/include/exec/target_page.h
>> +++ b/include/exec/target_page.h
>> @@ -40,6 +40,9 @@ extern const TargetPageBits target_page;
>>    #  define TARGET_PAGE_MASK   ((TARGET_PAGE_TYPE)target_page.mask)
>>    # endif
>>    # define TARGET_PAGE_SIZE    (-(int)TARGET_PAGE_MASK)
>> +# ifndef TARGET_PAGE_BITS_MIN
>> +#  define TARGET_PAGE_BITS_MIN qemu_target_page_bits_min()
>> +# endif
>>    #else
>>    # define TARGET_PAGE_BITS_MIN TARGET_PAGE_BITS
>>    # define TARGET_PAGE_SIZE    (1 << TARGET_PAGE_BITS)
> 
> Mmm, ok I guess.  Yesterday I would have suggested merging this with page-vary.h, but
> today I'm actively working on making TARGET_PAGE_BITS_MIN a global constant.
> 

When you mention this, do you mean "constant accross all architectures", 
or a global (const) variable vs having a function call?

> 
> r~
