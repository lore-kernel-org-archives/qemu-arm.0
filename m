Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36791njj;
        Mon, 28 Oct 2024 23:11:08 -0700 (PDT)
X-Received: by 2002:a05:600c:511c:b0:42f:8229:a09e with SMTP id 5b1f17b1804b1-4319ad25c84mr122394125e9.29.1730182267784;
        Mon, 28 Oct 2024 23:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182267; cv=none;
        d=google.com; s=arc-20240605;
        b=GL5Muu+jfSrbXmQGxBjJ5XjHojaKM4wkV9GuhpiWutUm1HJiCIzEn3/H/RN1BhhkIH
         ofiEH9D1p7xZUTJt2zBdKalx+sCh5HAnYbLkkrh/yeNI0DqXSHRYfEHxBVgmzx3cD5Q+
         6Izao8jNNjEviukdAmioBo9BQZth0CL1LYrIQ9shr9ZrI8vANBw65RSZjlmVfnDvZR5y
         ls3L8PhylpKdT1ejMnt0zsmkk1jO0KPeJkR3Rj7d+5hocn9M5muI4iY4zEJAkNGffB82
         md4clfgE1g0DG/OVaCO/ja+5g03uTfuKVximysmk5J8KVCTwHFncMRPOQ1ukQo+uMGpN
         7T4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EPgvrwRXgs6YdX0wc7Q6CeG9N1eKPyqo915zRFEZ3GE=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=YnCA1TO4kd8yoTCcGbxAM3xw8PGT3F5t44PTuDwcDtZ6PSy+pZCnuHaJ9kG8/n5KDg
         Ay0gSS73cqKxr2cnXrwIl8hPRTFtuDAooH2ZjD7AbW8kmdloo2+E7T2tmfdHJg8Obcz/
         Nu0rGANnIF3LEcr0Lr5SYWDxdTZUuI9RRibhMS9RjC3/4J6MyOirOTiB/5sdQ8oUBBpZ
         heHEgvGU53tFgUgNaBF8VgWnGtvTFq8Hosgn+gH8pUWhDPNQ3CICPJyhbm1hDlFOFAyh
         T3uB0/uv2xqkjHjMGmYfOi2sCFDRyQqKs61PDG0+8Ncykgxolf87uJtQMlwY/N63U6IF
         SPmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frH82OW0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431938c4addsor46565535e9.3.2024.10.28.23.11.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frH82OW0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182267; x=1730787067; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPgvrwRXgs6YdX0wc7Q6CeG9N1eKPyqo915zRFEZ3GE=;
        b=frH82OW0sFZTBT0XDwMspnwC0DOSMGxWFeI+bPQLxFodOn2bLC+bHJ9oy/2DKJVpBj
         v9qhdBxzOcQstt5G3+r/hsPoPiXSzxivopqXOx3SXNn2RauMEeMM159Rjj2diP57BaIN
         +0TD7XFbXTQOIsQVhnhX/6+f9Mr08C+MhiezubIyt5vvcrWapKDS7Dj1EhXhCJ6aKOG8
         avApdkcREVvyhmW+wb6U9qHHzsfrNOu/+/a7CbBTB5ohyxzgQSAN7cxYvM93VBfmB0dx
         M0lVG2+DF2x8HPwhMtVMh4y5vexa4dkgYKcJ3Nec4WotZDCBs4GY7f2i30TCPxy6n2jP
         QvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182267; x=1730787067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPgvrwRXgs6YdX0wc7Q6CeG9N1eKPyqo915zRFEZ3GE=;
        b=KH/rKa77vZa6R/hvaId+4gUqOHvMuathKyiei7kffy1WUKFOV7DbORt8OY7UtpFNb3
         t+oXyoiAKeL3rsjlF4j8raK22YtWC/Iu2wzI108IaTXaAYMoCEZv989jD34f1ugUCKEf
         y1M8vTdJsfEk9tG8WKtJlHWn/osUlLkcQ8spVkuTrzxyiOPozP3VTwrPabyMOor0NgVT
         Hi/vPmfn+SbGXTHeZgeSYnPq28z6wDxBPYPQaS6hlpsxefpfTNQ5L0oWpWyoz9x3IQ2F
         tU9ZRDKD52hsZzXFUNUywjpQKrnQ0HM4eCOSJ4BVeq6ObCPCqodVsx7OC87wU/+bS8K2
         UgOw==
X-Gm-Message-State: AOJu0YwH2KjpBKpSIFLIzFIm4kKJz5TiaeImg+h36hSDJUXhqLIGKiKg
	o+m55qD4nGSTBdAP1PzSaH1uQHtOLQ2nyLwu2mhDKB8l3Y566RGmK//LiQ94O8D8eA==
X-Google-Smtp-Source: AGHT+IGfHNy5H0Hd0IC6l1qPeffkj1tdJUwywBIv8CIOw2z0yrIjr9ELO5TbkU3saiQoQujsHIRRWA==
X-Received: by 2002:a05:600c:4ecb:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-4319ab8cbfbmr113599395e9.0.1730182267250;
        Mon, 28 Oct 2024 23:11:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b45aa058sm12150405e9.1.2024.10.28.23.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:11:06 -0700 (PDT)
Message-ID: <1b1973d8-a04e-41f1-9b12-f265b523655a@linaro.org>
Date: Mon, 28 Oct 2024 12:25:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] target/alpha: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
 <20241025141254.2141506-17-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 34HRkF3q9jSi

On 10/25/24 15:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly for the float_status word
> used in this target.
> 
> This is a no-behaviour-change commit, so we retain the existing
> behaviour of x87-style pick-largest-significand NaN propagation.
> This is however not the architecturally correct handling, so we leave
> a TODO note to that effect.
> 
> We also leave a TODO note pointing out that all this code in the cpu
> initfn (including the existing setting up of env->flags and the FPCR)
> should be in a currently non-existent CPU reset function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/alpha/cpu.c             | 11 +++++++++++
>   fpu/softfloat-specialize.c.inc |  2 +-
>   2 files changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
