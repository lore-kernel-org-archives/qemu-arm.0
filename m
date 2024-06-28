Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp244751njm;
        Fri, 28 Jun 2024 10:20:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXy0sp0qOl/iG//7YrsE/GtUMcCbDD/puVnrVa70kMVxmYWJzQvGFioTw1s1vcfm8TKXmXtaDSh6GHPdqyQVQVnqdNdu0cg
X-Received: by 2002:a05:6808:1a0b:b0:3d5:2ab4:8dc2 with SMTP id 5614622812f47-3d5459de8dfmr21627582b6e.26.1719595232191;
        Fri, 28 Jun 2024 10:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719595232; cv=none;
        d=google.com; s=arc-20160816;
        b=vBIHgFZ/tGGcp2jb1dqoYwb5U4xTtWO0d3pTKJHqfn6tEH12pHljiSW0iGiTxhO3yw
         K2nXoj2NlGeEfXYPD74gNcCmrK4NmBQfv0NIF2lrMffPavjB77ClVacPUf27hIHCZ53P
         IqrCvR6EPSOBTJ0xDKCtpGklsccaYZ3iCttOSU1Saz6KGE7VIkGiuD4dBllBqESovrg8
         yogxz+zFudaYZr/mSlRIbmtLQsIX48t8zBK6PpKQE5WwpoAEaIG9qoSKCfA3kL9hOacW
         BDJ8p+HLJ8XJWMWLXTeqs9UW4uL694IaidoVr1lr/CcSzS7Tv12RyvJ0cGVmuYLcu5L5
         c0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VgdEKm7+1QNNWK1/ZXdA7xtdJBKvNqs1BAkxK9w6SZk=;
        fh=D2vt1DGUClwEVEhnsD5nqPfSibXH1gaZiPwguzoHMas=;
        b=hQRoADWbcR4Aoy6NqH1kjSpBFvjDl2R2TlXpusohVvA7cMcLN6EwpplcmeahFG4T0+
         hiUAeUDFVe/Q3GeVApe89kDjIAEoikvfG/iNA8989IgY7Ovp12yOHy8dk11osCV0A9ym
         EFHEr2m/dIBFbudxzqnUt+dKA4lseRSTykQncXH8M1mLCZGfbCeT76rThog+Wd/0ECWH
         TI+i1O5AEwvYEsNfb6Xh2NUuZrQamKaj5omC1TNqbFfH2MU9K9D0Stde0qtxvpZpErgz
         ovaY29uFbvDHa+2vKZfA7guO2WAtRU+wct7XM2j9g6PMpRdd0aLFtZav39l6tc68nEMU
         iaXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mRm+KZHP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-706b4a0267esor3438398b3a.9.2024.06.28.10.20.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Jun 2024 10:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mRm+KZHP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719595232; x=1720200032; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgdEKm7+1QNNWK1/ZXdA7xtdJBKvNqs1BAkxK9w6SZk=;
        b=mRm+KZHPZg3EgjRlLDwUOoxw3rHiEDp46QAXjWJjfwDAY7Kv85eXZu0vKhS33PPalN
         S7GOsa8H31g+juewTky4E9507gJWqWHXm6rv8xncJAR2Gm2vbRgJgwhWzRGkrJHU2WR5
         vjVnc+Uu7/uXFE/NlEGc7LSyg71WPAR8ERqsE700b7RwVR7DdXxYheuBzdy+8K7sw/6b
         GEGGrnxkN0boHXoW6BN7GUPcR4dRmYD+ubVOdMrGQ2+SN+80wsA+5f7K9aiiX3hauc+z
         qbWyXUnU3+qcDWK8WiXhq4RgjVA5bQd0qTCy0dtiAb5GrDfS1f6d0WaY0HjG0QVY7lU3
         xNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719595232; x=1720200032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgdEKm7+1QNNWK1/ZXdA7xtdJBKvNqs1BAkxK9w6SZk=;
        b=s0VUR7TzovSFd3cNVH20KNA04E+d7EgEOsAMAdtAVd57TACZJRmJtCFp5k69+l50b1
         XF4L45JU8u+xIxUfSN+7Abu2hN1PLW4FD42SbNJS/5hnFuXuJpozr+AOOOdMfOEf6Q+P
         WRazY05HfcXZjAespejP/lUQts9rIlGjG6TNBG+Q5NUS1P0kpZKZ2LSwm99D+y9jbLf+
         SvPQ1tFn1gD/zqd912UTr4w6y3uakETrs5EuXMhzyR8WCSi81LVk0GmKUFRfJHCn57Ud
         bYLp5T4l21/J8Z8u1LsWOHNKOX+TtG/v/Sowm7aFivRAh4r/dVCwoKgpt4hVLcT5HB8u
         M7OA==
X-Forwarded-Encrypted: i=1; AJvYcCXVDl5MM5caFpbcCZEGUUT0qtX7nc6dXi8oZ1E0olmx22RMLclxvBWw4ajXxY/Izvs6nTqPyXvpJEgTVjbxO7Itu3/6QA3W
X-Gm-Message-State: AOJu0Yy/QOQ6cBK95wRduz4I83RiXLhSxkirqDNdroq/MeQsutM5G9jF
	U8q8jUPF0EcRFVd4JsS79Lv3wR3t7ZXTVqXdOiALUjj85k91uneYRy4Io0pR2mZu6A==
X-Google-Smtp-Source: AGHT+IE631yBFAaMhq+LllV6RzOy1Z/TtFwJDzY3Y+I/Y73tXxFPjueEUu5zdYbrh4y1+drVhYmD8g==
X-Received: by 2002:a62:e905:0:b0:706:2bd4:a68a with SMTP id d2e1a72fcca58-706745bcc7bmr15708455b3a.10.1719595231550;
        Fri, 28 Jun 2024 10:20:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70802466aedsm1875140b3a.46.2024.06.28.10.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 10:20:31 -0700 (PDT)
Message-ID: <31d2954d-0749-434b-8eaa-cf85f7035a09@linaro.org>
Date: Fri, 28 Jun 2024 10:20:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] tests/tcg/aarch64: Do not use x constraint
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
 <20240627-tcg-v2-5-1690a813348e@daynix.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240627-tcg-v2-5-1690a813348e@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IURChBigMgE6

On 6/27/24 06:58, Akihiko Odaki wrote:
> clang version 18.1.6 does not support x constraint for AArch64.
> Use w instead.
> 
> Signed-off-by: Akihiko Odaki<akihiko.odaki@daynix.com>
> ---
>   tests/tcg/arm/fcvt.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Oops, this was an error from the beginning.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
