Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36667njj;
        Mon, 28 Oct 2024 23:10:48 -0700 (PDT)
X-Received: by 2002:a05:600c:470b:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-4319ab94b8fmr89668855e9.0.1730182248205;
        Mon, 28 Oct 2024 23:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182248; cv=none;
        d=google.com; s=arc-20240605;
        b=NY5SAzCYG7d4kkrtR0VCbOIUn3lS4+MV6lu1/GOb7DprNmqwWWR2tIYYauf2MPE+k3
         2OWNZPYs89gzWN2vaZNV1nKbOlhvITyiU4MwMQ0aDCQpe717ZwZVzTt5h+uhaIKrBtgd
         osWyFeo76NhS3cNAv08Z95G+b/lFBAvimD+T3RlJ3CzqFEeii6+6L0M+CngUbLidDPK3
         hZIqN5fG4edljYypmugjcI6C75biuBpzKj6gdBrPn8iC3qK0d9704E1mu+F8Da4XqPQ3
         ZY5TlwklMQkmIAxv4eUtU8nVGqzrPH85HLBP5sUcbaNxJ45llob18PuCmYbf8Mt+YUC8
         kOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dr5gG7alOxyt+rvgQ6PSLMiyYakYCBZKPAhsqjmYRJw=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=COmtFvBGFrIDBVqAt+n6oyWrPdMOSqcr/znX41kJ8KEfPFPfMrrdUPM3UAvc5D0yp4
         ZhhLndutDn8KjGrzisQhEbK+r9e+XI6FnM+Dhc7zeGoRX8xCopeq0mkUJ520hTr0G907
         NTcmJK4ejziEHgPJ/citqcIRvbnvo3Yo8VzyFUgW7upJH6OB3qsGB7VZYKMbjElHqTIj
         7rUp/ZUL+0FfgSjIOI3ifGlIjgGd/q2WXCn4gjHaggFRljiyDxHHwQhRRTcn3slyU56e
         pTE1Poo63MZt2+hmmy7/cMJHTqwwPZZyDiRua7nH4YgbeD3lasxlzOYFiowT8EQ0N5AJ
         5Gew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FfKxzBP5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319bafe632sor31168875e9.13.2024.10.28.23.10.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FfKxzBP5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182248; x=1730787048; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dr5gG7alOxyt+rvgQ6PSLMiyYakYCBZKPAhsqjmYRJw=;
        b=FfKxzBP5lcghIFdhgBVEQPl8yFB+8icx4EcKKVOwoUbQQLDdnC4ProiHyDKUHkuQST
         5OwIlGcywSpFU6kgvLbMS95P/9VHFHygHhuk39hcVCaq8Xf0iqaygStx2wgjn9mZNuAj
         jZC9FDlSN1X1+/lhFEYSXwyN3Q5vvJy7xshneNim5rUBZpuCDD2BMWPVWNKds+FjcSzu
         6f7O8FvuIPx588vKFnIraUUeEIRFvl8KBUebAk5Q6ssuKP9LIYhZ1MMx4l2MZL0JaiY/
         xbQdXTyj3whviW89uawIX43dUexv9d0m3gEEzH87XUa7LI4aPUi3yzAgpmWoWZ+Lm731
         OmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182248; x=1730787048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dr5gG7alOxyt+rvgQ6PSLMiyYakYCBZKPAhsqjmYRJw=;
        b=D2pahT4kv9QE6lLsFTncYN/MjM5IqGuLHdcfK3vtp5xAUUmJcsPdtuhhmkbWM6dK28
         LGp4QwAZlfMrR22BX83zoHBS0mHH7pfdUaWL6pzaKAkGmY151PYMiggUnra6qPuC40Wd
         2OmQhEgmrno5QIpaJ6oBnU575Y88FK72qydv15vLc6zCkiCs4xe3b3nflXJniZIMtI7h
         5wwT+zEMooRHKGGNT3PyKNf0zOO9IPbDOdbiMk9AhU3v5m+8iNsffrIQyd0nX5Pmo4gT
         l5isjnYD9r9rMBsIju70RYUm1G7oPj6qRdVkgtNarf0nk94NhNL5lEZdwTb0vX35czj8
         V+aQ==
X-Gm-Message-State: AOJu0YzoAjlRw1ru2eAKPq7uJSxEfwoXchedJqN5HOur4/IJGKggmZH6
	/0Pj4klntyzmWOH8xIEC6eGsZFIt+1Gw5djtJ1bq8zYxhJv1PWUpUPIW/SgNep3uaQ==
X-Google-Smtp-Source: AGHT+IHwLDhKto2V1uR7aBCIMFCzCnEasQGS77vOTh2r94LTg21rkudslORAWlwk78uBQtMQLmayIg==
X-Received: by 2002:a05:600c:1989:b0:42f:7ed4:4c26 with SMTP id 5b1f17b1804b1-4319aca5580mr82238635e9.12.1730182247613;
        Mon, 28 Oct 2024 23:10:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f5e1sm165298915e9.14.2024.10.28.23.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:47 -0700 (PDT)
Message-ID: <24aad2c1-68d3-489e-a3cf-f6cc9420728f@linaro.org>
Date: Mon, 28 Oct 2024 12:19:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/21] target/m68k: Initialize float_status fields in gdb
 set/get functions
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
 <20241025141254.2141506-11-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: VtPuSJ6cqGio

On 10/25/24 15:12, Peter Maydell wrote:
> In cf_fpu_gdb_get_reg() and cf_fpu_gdb_set_reg() we use a temporary
> float_status variable to pass to floatx80_to_float64() and
> float64_to_floatx80(), but we don't initialize it, meaning that those
> functions could access uninitialized data.  Zero-init the structs.
> 
> (We don't need to set a NaN-propagation rule here because we
> don't use these with a 2-argument fpu operation.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Spotted by code-inspection while I was doing the 2-NaN propagation
> patches.
> ---
>   target/m68k/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
