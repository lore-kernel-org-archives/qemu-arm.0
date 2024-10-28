Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36832njj;
        Mon, 28 Oct 2024 23:11:13 -0700 (PDT)
X-Received: by 2002:a05:6512:1384:b0:536:a4e1:5fa2 with SMTP id 2adb3069b0e04-53b348de8c1mr4452921e87.26.1730182273144;
        Mon, 28 Oct 2024 23:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182273; cv=none;
        d=google.com; s=arc-20240605;
        b=d1uqJX+o6DwwL2D84MZT4kEjDeZUJQMMgdgq1gj4pBx/pUGjiOqhuzUkKehQ81AFMN
         R3JPzA+KsGUrTaUOI4x+TqvmylDCkqrZ01AqzgVYmrowj2Amo4h9UOGHFtUxQk2ihF7l
         Owh0LAr4kUCIrqLYTO9l0/i4KoVsGJekZMNy3N2cd//0jM0BUuCKgfUJOTe6hlMeT9Vq
         4GYBzalmNIWqiugjL5cZAanQVa/i/CeyfX+d+PgOkETxPGpBzE89R6nzJk4yWk2UdGTT
         dbyUPxLv/BRk1odPkDe/hafWFyV/aAwTYUN1GLg3IchJ8fYpTUaX5nmKini1UvUgH6ot
         xbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8qkEf8dK2LoXTwdZkSIL0OsQBUwLoP6bNCbrHzs3LDk=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=gD8nkcEBuIYExD5ZgCssEbHf3kJnujdU4meW+2B2WL6QB1PjJ29XFG3aazriwY2bcJ
         EPdtObtjtQ3rLHZZsVhHy9TZ7Y18/P+vleSu3y1jFCM0SkxE0yu9kFvDCeW9fYk6iUsO
         A/EJhFYHqY3LvkMZTce+PZ1ZT9V0DB84/C616TPHmVSm1k8RfaiVfXXJvLbs9ID8HBpe
         ax/PWor360dd5sbQZ3bGx2SpsxhsE6QyCE+/0LdiJ+iGj0twlCKyQONh4tTfpOte3Mis
         Q7AbBnD2Mq+AKj6Rn++HVBYoaSr95at9L78qjB8qqpJLt/JLE5A9X9OqLBPaDh/1/+eX
         msyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W6mPf9RV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43193923b7dsor36560355e9.7.2024.10.28.23.11.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W6mPf9RV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182272; x=1730787072; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8qkEf8dK2LoXTwdZkSIL0OsQBUwLoP6bNCbrHzs3LDk=;
        b=W6mPf9RVycJB2KDqU+FJrMgqW/v0yWNLn3rLITSX80bW+qwSRtu9YFR7R8jIx0/ryj
         B45LxzEKNMdtALH+1sjFw+iOkdaQ6cCtkIuumIvN3OIHXAlDDKLjpEaZ2Vl96m/zd0fy
         n+Q+PCAJ1WDZ0c0LLabFM/b6RCbX+PZ4Jyi7Q7MKBhY93cteWP009w50w2s1G3b6zIeO
         /9UHjoP5WiOr0lltjhe7cglgFk2rTtYde3lQucb8GqiEoDB1Av75suYKPw7aARthIpYh
         Aciza8IMK76Ngd63mtczT+NgL/eurETL+x0flq2nOh7ZN/sJNAfGisv+Tni8FxbG3xW+
         rq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182272; x=1730787072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qkEf8dK2LoXTwdZkSIL0OsQBUwLoP6bNCbrHzs3LDk=;
        b=UsR0kqRuMWbMYRCBdJw5Npvtsf2By28MRCWvyOtAQV3p9bpw7Ru6/IcKugPPVR3gsq
         V/nNVsFXwmUBVKLXyCzAkwxR3AxFZa1/9+zo7EVQE1ovGtWPM/shqoa/kS4ejROjU8nw
         HlWziiSJeqg3Lt13RBe2hTT2u7/pSM7O7Zh62pQopDb0vm2MWiiY+5OT1HkKs1z2oQum
         Qr4iKLFkephjlx+48CxTdW8mDymsTqF+YhvN5CoPeLdBsdkHdSetTLKjR9e63/DuYTZD
         G7IEBHVAf/92C409OQ4xjp2jqnFrp+ZWJ4zrKNJR0NpkNkT3enWepe9CZvAcrVtm5JBz
         hsmg==
X-Gm-Message-State: AOJu0YwTQL7n5UvUvNxXnMTgGdssqiGzmsGD51EDnRyLpd2zl3d/3EmB
	6wAUVZn8BWLBz6nfrDtFAIJ8jOK8volpjkCwmOnp/sBe/xEgqwwB0jrKR4EIlQnskw==
X-Google-Smtp-Source: AGHT+IGvTrYcFzi96p3pvTexxwrCz3hoWtWdtSYsTJ8UmdEEHhKtobLyPS4rZuyJGa+pMaZeFxcfCA==
X-Received: by 2002:a05:600c:1390:b0:431:44fe:fd9f with SMTP id 5b1f17b1804b1-4319ad000d9mr73554575e9.23.1730182272544;
        Mon, 28 Oct 2024 23:11:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b566f11sm161756735e9.20.2024.10.28.23.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:11:12 -0700 (PDT)
Message-ID: <4bf6ee0e-5996-4075-8167-c17d4b285d9d@linaro.org>
Date: Mon, 28 Oct 2024 12:26:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] target/microblaze: Explicitly set 2-NaN propagation
 rule
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
 <20241025141254.2141506-19-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ZW2x01cTGB3P

On 10/25/24 15:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly for the float_status word
> used in the microblaze target.
> 
> This is probably not the architecturally correct behaviour,
> but since this is a no-behaviour-change patch, we leave a
> TODO note to that effect.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/microblaze/cpu.c        | 5 +++++
>   fpu/softfloat-specialize.c.inc | 3 ++-
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
