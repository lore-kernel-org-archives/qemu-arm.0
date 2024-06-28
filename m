Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp244464njm;
        Fri, 28 Jun 2024 10:19:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUh3Vn2UtFAkt4iuU0vRSof+hIe7lGifE5PRfGYfcDg/uZ66onPYJRFPAV89P3ZNdxtUd9o/lyAf5ymmmEatWPruWA9A7Ua
X-Received: by 2002:a05:6a20:3d84:b0:1bc:e9ad:e736 with SMTP id adf61e73a8af0-1bee48fe645mr3786998637.3.1719595190489;
        Fri, 28 Jun 2024 10:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719595190; cv=none;
        d=google.com; s=arc-20160816;
        b=TH8qPlt7kQzf5CWah93VFyRmMSzRCI6rtOvHq3BPPDcwRnpQy/cgJl/lB66m5WDUXH
         aSZG1UgHs7dtONUaGGL105jNRECESKEpMGAZDa9rTu801sm39y1cVlhfEN5/M8dc3o20
         xQ8eVvPVxJaExkGUcDmh8jyzopopnw7u0+aUd5QQOGcbFnqFbDLo1d+asDOY3loxPL8T
         byyZajRnlaCIK/ZUCCC+WqPzohOQI79jZ737IVlUaXW3dyn64w/HDwfXrSOjxVXbipjW
         wC/ZehqTU0C2bn+FJPBakQVg3jDd/CAowoCY5ewkjuWj4BKMil0MRC27mHT52gA8Xb39
         Zk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ow+PDn7mkRF4AdRK1scat+5Q9cS9ze13R92X6OIjh24=;
        fh=N2lL/Ft5h47U37QRgunzsk+hU2CYJDiNYSf40gbR+ZY=;
        b=TeErNZttUSnblDhTqW1O+k4MtS/IFpzJp1x9l7jiVzNiraZPnrIOq70/+2mzUyzLzf
         UlurUU8VWPSneJMIXuoKVHmmTipvpUbJzNehPGJb/Il09GgGwkqLHSZircuIfT/ZmQkT
         FMdz8xv8evb7qblQUkEJWE1BAeE9UuADdHUjMC/h22KQhekPgVosjJHMj4OxSLuWcdvQ
         b47nJu1TSst1YuIvMeXU6NWZWE8s2UD33/snH8a/Buf/QAXQCJtLhdC17GOHKwAT7ANA
         90F78Y92dY2Z7ltU1bLttAwjASZXIC30UYU6n1EFHZRPoJgiTnHOEmw+Zr+q3WOBtfvt
         1HHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzHL+R6k;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-706b45d641fsor2276158b3a.3.2024.06.28.10.19.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Jun 2024 10:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzHL+R6k;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719595190; x=1720199990; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ow+PDn7mkRF4AdRK1scat+5Q9cS9ze13R92X6OIjh24=;
        b=RzHL+R6kWereopEDeCf+JjoM9llNPg73dQm34ydLS09tb8TvHF1/lcDKs+tXpeDvdU
         8YO/8+vjOJ4XON/qDJm3B/O7cjrPBsXg2x0PyhaC2+jIXcqNGxKUEmE/Ya7hyPurtDjF
         OTCFryaHJGSum6K6rc7DbwDjkwHUBKzICShX7/Z7LVUYQvtdpdmtTK8gKIzxs3/JbJ0S
         gnSww6/I+KSKLi8EUJspJQrecaKR4Va2vsqMVa0TP8Zna2O2ArxW4oixSVuB3VY3o4CA
         KBWYKIHufberjLV3GmUxy1POqQnIJBEQEIAssxQesOh4ZQkzg0AZcimPYffLcKa7raDw
         Sneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719595190; x=1720199990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ow+PDn7mkRF4AdRK1scat+5Q9cS9ze13R92X6OIjh24=;
        b=t33+7vipj3vmmBMGIDBpqLrXNOo+X8R6YH6P74dfG6YNMpBN1az9dko17zzL1NiIIj
         3vx7CC5NYt4k8xEJk570O2vBQf35J4C/3eZ0UgHwZcZc6Wsk4/OmWToqIc3oJRawNQol
         jB2CGcwfnKkkbZv/tFnCM6+EaNyCigHKIT6nB+N2nVlMMlmaQnVaemOqbrISdiM4SqhI
         qpKQi2OlW3R8grI46uI0t6Mlvz97UfGLX7TfiYQNJxPmFf5FIQQF5Lmow7KqjNWldRTh
         28oLaNaVrSKtAY/0tJz8dilrOaXIvuqcSwJ7V06mxiJ7ezFz1JRpiYPQ3YlEFZel30hv
         T1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWFJOHyyL9rrIbgVEmVnD2GXUWtsal8engUzZIlQe3ywogs8rwcB01pHCNifcuYRKAIajphwKWgTPI0Oit3iFhkxhcniYFN
X-Gm-Message-State: AOJu0YzmESY5CMaOIx0z53e3HV9h1PU+J7uT9KICAdcA9oZCFx5pRyfF
	Rqd41VwrTvaLAZEiyYmky2mdzjT+k9zK+jvKgmoGQzAbw8PXfEgayKuI9DgqxTJKLQ==
X-Google-Smtp-Source: AGHT+IHDQwkjOReF/ty3GORa9FQyGfcCMWql7IqhJtChdNj9/HKTtRHyNfbt04TUB3hEBSMjrQEFqw==
X-Received: by 2002:a05:6a00:1706:b0:6f6:76c8:122c with SMTP id d2e1a72fcca58-70852e0d7f8mr3719972b3a.16.1719595189851;
        Fri, 28 Jun 2024 10:19:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804893d4csm1867794b3a.185.2024.06.28.10.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 10:19:49 -0700 (PDT)
Message-ID: <b7a23f47-e363-46a1-a542-2e796c99309e@linaro.org>
Date: Fri, 28 Jun 2024 10:19:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] tests/tcg/aarch64: Fix irg operand type
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240627-tcg-v2-0-1690a813348e@daynix.com>
 <20240627-tcg-v2-4-1690a813348e@daynix.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240627-tcg-v2-4-1690a813348e@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 2JCig0C7uHu4

On 6/27/24 06:58, Akihiko Odaki wrote:
> irg expects 64-bit integers. Passing a 32-bit integer results in
> compilation failure with clang version 18.1.6.
> 
> Signed-off-by: Akihiko Odaki<akihiko.odaki@daynix.com>
> ---
>   tests/tcg/aarch64/mte-1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
