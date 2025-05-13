Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp405197njb;
        Tue, 13 May 2025 03:04:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWl3uZcp5lmseXAa0L8D2FuvticqIkGABL4q0yVhupfH0+EKN/kISYRS8JkXB9d19ul4WXrzg+aLnPLLQ==@linaro.org
X-Received: by 2002:a05:600c:83ca:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-442d6d18302mr173906795e9.3.1747130639849;
        Tue, 13 May 2025 03:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130639; cv=none;
        d=google.com; s=arc-20240605;
        b=lJ0BtSjKB8QAWxbdqAmlHK3JTXp4JkAvQYz9o1m0CMT0ZKdl3uAtKs66LLZOCLABlv
         85dVvx8zRp8DgxNQLvcfNX2zfQZhFLtb1szjjsbgKitiYH5UieQFRyCEqN/mUMVh9kEu
         R6/FHMU/rJTVbnuul3PqDM5zPbP7vM19EkAUnnJEme2t/WmGkm9o+/OsHCRqjxd9/tn5
         DYF8qHwUfLwGolHNNghW0fPbAWG8YkSgUvsCiiinifz8/KTRjpdNq9/NoelYAlowHTvG
         7L8QUb9ATaITNE1mq/+/mmOdCGrHXNzJrigXcIegNyHOGnueW7cqrjrfj6XpjcdyvkhG
         Ur0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gHNllcDu2HQZYyj8yiOKeJzlIBkFOSv3kPJp7LTifm4=;
        fh=G1W/RVJI1k4+ZHXtqONOP0NoAyds2T1rEhVbwvEQGuQ=;
        b=Om/1bfHcWshXmf2oGm8YDHQ8t/sWwxoNMaurU1f6M/bzg6/1+gp2RWp96gHP1eTQ4x
         wFAqwtNUkeCvjyq3X+ExHmKzB727P2f3GwkEm7G5FjyEnJN3GMWoJ7ARiQjkHGeIZ+Nf
         LdbT29/PwAriXYte7Ni60GbKlTwmKTiQm8O5gUry3dplM21zk0BMrfnTZESWDdNvRRGs
         hyFZncpOUZMJVfc6l2ZyHnnU3eLkBQEdYWsia6CFl/0oqFIjqMLnl9oPl9Lc8F3CC2h1
         zpBf+OrzcEZlq0bXkRGFWkLk+J3JrIwtGNn1J2EfD1ZRz2NkayfrVQMMjq4pGBh1y3+W
         FhqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yw1SmIPe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d67e35a3sor29710455e9.4.2025.05.13.03.03.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:03:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yw1SmIPe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130638; x=1747735438; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gHNllcDu2HQZYyj8yiOKeJzlIBkFOSv3kPJp7LTifm4=;
        b=Yw1SmIPe+CPun0OccEplTRugumGpcYrzz0h6yVee3g+TcQ2qMgfz62ky/HgGMtySah
         1z/pS+y3CHbGQoVouz/xy7jXumw2EjSHTtnP3/KqGR8XkEQv5c7xgYTU8MfcZFgIjrYC
         TMsa54otwx4088z8auTB8KzRVE6l/jlwVlanuSjlnhgrdennMhVMo2HAGF7TXKEQy4iV
         tTV+YAJ7z/jBHHxit8UPfZvJ/ON6MLqMUj7uDZOVkQUTSYwdhFbm2eWIjtXWNYTUwtHv
         MJ8fb9tD79y56w/hPUlupIzoPwfUKZTB409p7botwBWgKXsCcykoNg+AfKXyU+Ss8Xnk
         V71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130638; x=1747735438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHNllcDu2HQZYyj8yiOKeJzlIBkFOSv3kPJp7LTifm4=;
        b=pBxJfDhJ+P+WKlaz071Qb8+EsmE6o9g79DgjGv1tUKLJVVZZmkcW3fyX2IgWIz+sWl
         mBv8xXjMee8RZ7IzWMwZPP1WTSnkef5b5yLLXwmg7Vjyqxr8yOTPsW8ADMKrMQyyHxBj
         wnkxNW/bZJLQHOvDW9pDW7DQfNzRXh0auy9XLbhVEEYyI9nbbDU4o97Qisl3ZNCU1kfa
         kc1C2hCnLi3948Vrup3Qq1qLayJnuI7VJDJSmFlb8d0mDhMt4ajFSRCo0zOQM3eK8fyl
         vMoE4a+Qb7ytTkaSgDbFdLLbx2Yc0r0XG9xXvS4p2IuNeqfrt8fAGJ+so49NfTpDgned
         MwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvHe+P3/YXd5IupRVyd8uaWuPlPlrBMFWwuYdQjQnMPxu2i8ibQrSuAdBpYInc8Z3q9409HgLXiYv6YA==@linaro.org
X-Gm-Message-State: AOJu0YxYwifatuCUISRpiOEu5Bl0+VnZv6tG6XKd5GVkx6lGSABk7aPA
	R+uU4O5Etv6Tv3Ea0jmEzzkm6TIFBcKRjVIUj1ff6pJQeHEDHwexTQXAF4ZwAhCnDg==
X-Gm-Gg: ASbGnctTKPlVDXUO6RhlvX8Dgs8vozV1OlES5SQvCLVdLbWKwtaxhrHqr+MiGFNvNXz
	Z2ipGnnyU2MSVxkLWXnxJA7b31kj8nvukcZsFHTWXCG4xVB/Fu6txL3mHIs5wc6UbpryL81+UI9
	xQS3UH4VA0pjp005KeM/DfLCQ0yATPIomNAfAKqSVK76bBoL5nxSv/5/CC/s7X6fw12ZeboZCos
	1HhsApvAF70ChfbC7Tr5Dtitse4Ydh7LtiiVNKi+zYNgi9GigW/5EZcPX68+1JxbfuI2uzuC0BT
	mkjGrcH6LDdERQAuuhnM1k3fJtIkR7saX4guhRJCrnvuZ9luQnhCXoRvqJi7Xpjdg9DVsj2HR7R
	wh22Wwq5BpypwIj5lzA==
X-Google-Smtp-Source: AGHT+IEhDYq/2I/yiB012F0CpLUUrDPMqhK0hGH6CL/pJsXqNbfYqCTrgN/8H+ya9oRU8wBIk7adBw==
X-Received: by 2002:a05:600c:a00a:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-442d6dc7cd1mr130023615e9.21.1747130638618;
        Tue, 13 May 2025 03:03:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebd6asm15839035f8f.35.2025.05.13.03.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:03:58 -0700 (PDT)
Message-ID: <6e69551d-bbef-4ce0-8eb3-d488105ca7a8@linaro.org>
Date: Tue, 13 May 2025 11:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/48] target/arm/helper: use vaddr instead of
 target_ulong for exception_pc_alignment
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-14-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-14-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FUwI4mlhHXBW

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.h            | 2 +-
>   target/arm/tcg/tlb_helper.c    | 2 +-
>   target/arm/tcg/translate-a64.c | 2 +-
>   target/arm/tcg/translate.c     | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
