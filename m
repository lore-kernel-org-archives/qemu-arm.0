Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp253777njf;
        Fri, 25 Oct 2024 21:38:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:be24:b0:1d9:2ba5:912b with SMTP id adf61e73a8af0-1d9a84d71ebmr1693069637.36.1729917492933;
        Fri, 25 Oct 2024 21:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917492; cv=none;
        d=google.com; s=arc-20240605;
        b=X7sdPeaizLaikzxO4f7e/BrFs/QUpou0B37+TPDA5hfFY0px9axuIWRy0IGxTSCouf
         jKEnlUrkreF5BXZQLGYw7+oeSw1QOigsyTZlPOW77NtbjDtWZeHHcrdyqnT7GJPR/ycB
         MoYTPZzpFS7LEUrRtawZABKiE+Lt9QTIUfjf8jRjQsuugdP/o4j+eBLYtLlt3LRW55NH
         dYt3F4c5e7m3gsbhpQRfC5TB6zIQO0AsfjTHcv1Q9KVrcrY0qi2Adb0QAbJCUHZ0OgQ7
         TkqH0Y24xM8xj4k/9eHvDGkMhQoowazyuHlbqb4Qft9nNF884HZmfc35quxcAhDWoJwe
         7GqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=znhjkPX5FWYjPyXShpOCq3fXxg1BafTOW0qy9nRGctA=;
        fh=57KB4fSpGukS9IUlPcDISciwmQ4lhGDq9IA5L5jXiis=;
        b=P7sW/KzuHzyeQV/vJniiH0lpDiT07fyX+B7THWBPZZh3OMoazhjD9KYaXILlq4Mham
         2dqbRHuvPLiCr3vDxGGhADcAMHUcLkG15tqmbcvLln/FX9OhIUnjAD5TpbKCHpuRhIl/
         Qk8mWkbOAVZwLmDCJX8yR2321s8zzcoJIjKK7Tr+PNgSjSoQoWeorBBgdpwu37/8enz7
         UITpjyBs8zoLZZJAsAGhUzGsQVIfwpSGymvEQdJbs+FV5ncEZNDlnA1dOt1rnKN1xuW4
         kkx5bicJAkJS2Wplh2w0iZJPFQJBoEDLHwar1hSz5STeHBGH6Wyo9gq2yZoql1boZzKd
         O4ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bj5n/9B3";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72057923dfesor1768927b3a.1.2024.10.25.21.38.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 21:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bj5n/9B3";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729917492; x=1730522292; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=znhjkPX5FWYjPyXShpOCq3fXxg1BafTOW0qy9nRGctA=;
        b=Bj5n/9B3OZBo1d4b+SX8COkYqapPOKgtkhOh2CmkjUSW32h8X9vGh4yJr7BCgO5ytI
         RpW3QKyzd0ZVwkM/d8UGxCp8e/mFdM/5CtP7yMqFGq1Eb9qgM+BygWGA+M/Z8UCKtxcS
         DzGREfnnnRVnBCyuz/dqkQLEBHLPGDg+w45jeus5StWwuH71Ikx3fY51Svv6XDGBc4Y+
         5p82zwqpDycitRWATb1uatowBxjsPWMAw1p49Xevy8RBFrdBXfuUYScTBC2k+n5UYJCw
         IF/Qy+nP5MDVnaXhTsBLiPGdenochkoPwTwdyHTAwTS5YIQJuhRJWx8rZkDAzOcv2kc+
         fANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729917492; x=1730522292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=znhjkPX5FWYjPyXShpOCq3fXxg1BafTOW0qy9nRGctA=;
        b=W9kFvVkIT8zxw02p8iajrRiD7/VidMNjWqQ+UUBD9AGs1jkHWT5zFdyKfy2PPmjCmd
         SDVAsjJt6fBg865djnzQAnCPSxyXG2w/T732MoCNLywWnmE+mbzP/lyq8Y7rnmcBwbs6
         y/MBXzgTf8ytlLRhjjpsSrU6IkolRYkRnz3yflHrDN321tp0zA7mOW04EqxVhQNvIUzo
         Rdgard99pbOTTDdofOtlQxPEuJ+Xae4BmuAgRVmi8STKoL20empXKe2nLR+d6s68cgPG
         vPkBMQAPknCMpBNVOzqtxvtp2V6ASpbq5mebA17RiIugo/rLGII+PW9QZEOrVRY806uh
         a37Q==
X-Gm-Message-State: AOJu0YwccAILJwY3JH2y6heuOocEuIwX1BLOEUusQV7Z7ZUInsM8WaJV
	sS198sPxQwid71XUejfKBr99WGqFPqJKPP4B4b3DS5/EZlvDCIBYcplnhBBv1qJ3tw==
X-Google-Smtp-Source: AGHT+IHiEi98Ua8+20vzdPeL4TOKM+SayNL0dFSF2uXzHbYoDfZQdc+xfNN5SBhAtq0mIkiE+KhsAQ==
X-Received: by 2002:a05:6a00:1392:b0:71e:1201:636a with SMTP id d2e1a72fcca58-72062f4e63emr2822643b3a.1.1729917492346;
        Fri, 25 Oct 2024 21:38:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.120.226] ([45.176.88.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8696bf2sm1945153a12.50.2024.10.25.21.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 21:38:11 -0700 (PDT)
Message-ID: <ddcef854-622f-4c74-8593-251d68dc4f61@linaro.org>
Date: Sat, 26 Oct 2024 01:38:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] target/xtensa: Explicitly set 2-NaN propagation
 rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-15-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241025141254.2141506-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jCKD5j6tSSlH

On 25/10/24 11:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly in xtensa_use_first_nan().
> 
> (When we convert the softfloat pickNaNMulAdd routine to also
> select a NaN propagation rule at runtime, we will be able to
> remove the use_first_nan flag because the propagation rules
> will handle everything.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/xtensa/fpu_helper.c     |  2 ++
>   fpu/softfloat-specialize.c.inc | 12 +-----------
>   2 files changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
