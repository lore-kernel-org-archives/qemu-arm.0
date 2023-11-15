Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3060607ejc;
        Wed, 15 Nov 2023 13:12:33 -0800 (PST)
X-Received: by 2002:a17:902:d486:b0:1cc:5674:9184 with SMTP id c6-20020a170902d48600b001cc56749184mr7898310plg.31.1700082752781;
        Wed, 15 Nov 2023 13:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700082752; cv=none;
        d=google.com; s=arc-20160816;
        b=0ErOZD4lAO+KHUeaZ4xesv5jZNfLvVxvUs0CdHjNfhBdpZW7UdH1da/KqVQTQRxaGU
         q8fWvLJiZOyFxcJaro1yl286zvh3otvyYMYIByshsAsa0GiIi6EGBv6TUVfRH7rnwTOb
         SqTL7Q78nDQNchZOsI26Kcd097EFTKh9kw9J0cJGo7MkyqAAthwyk70rr4zKJMGrmPAv
         AoGm/5RFJwmsVIfoUfXG0rhY6N6g2w+u5DK6ax5F+TpHnGAlzs7V/X3JxBkVsh6ju8Xd
         JEKh7ifX3Lb93xDcsNb7NMRcldR1EEf8wJB62YdV0jdSCUOD8A9ZtImi51B0+SNpW8hx
         wiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0YPwjox2gjaH0OMtWcWU7ho3rwuwGTFEd3fc65Zzi9M=;
        fh=EuHjJUGyhemwCGdsWJBeBKo0HjA9pHZEOVmU1boAqIA=;
        b=RJeCp73JkLqoGCw5m1n0dogAgqY/NA1zBcAhLQGcslEJwPtp7iBYneDwJbF/h62bL8
         vzyP0LjH6+naAI3Mo4amSzj4CdOZZsG2GwN9rBbxz7gMHX5ysPZanwKRXrkR9SdoVLGx
         qhKCKbox6WEvazEsBiF1cb+6aIY/QWvh0rkYgXydqKqFu0wzySc81hxSI89Z9vfq9wZJ
         CbfymtJOI/iO3miu89dVOmbXXte/vJY0+ZGAsOsLIykReJVKv+Up51f5cn+BMG+VciE5
         az9V+D8tn0WSnQZYnKMc6oFtVbsXqo5Ak51L5QEplypN1HT6X6S4mQRjjREeaUw1Yax4
         iSeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vq2MwDbF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ja21-20020a170902efd500b001cab282c41dsor3568278plb.13.2023.11.15.13.12.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Nov 2023 13:12:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vq2MwDbF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700082752; x=1700687552; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0YPwjox2gjaH0OMtWcWU7ho3rwuwGTFEd3fc65Zzi9M=;
        b=vq2MwDbF2yCn7jggyf27IsxfO85Q5boA8LSvSs/Ox4pzjeraWoV6nUtdvkVWlKbGq1
         51VZSJ8rPSzxfevOxHZ0bNiU6h/SWOJ+RB8vJf7zjrkfuj/lUyk/emRtKBlWAwBbLGOO
         oRZ80qSJazUjINImnDWZosC87LFaISDTzBtl9PB27IGlgL/2OwXg1Ne9mMkP4EjenhsU
         MOMaEZNECIyOke+kBh65XkLQt44/tQ9M5RDks4kwHhGhAcYG/Ap4k2u2QUrYCxqcGYTi
         54AGiXkYSOYRKKJBWSiFd0PrDrcUqb2PI+LVaAbUedoAVEEX16GZB69HmB0jJys3VzJ0
         Qr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700082752; x=1700687552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0YPwjox2gjaH0OMtWcWU7ho3rwuwGTFEd3fc65Zzi9M=;
        b=AdU8ReYr//PMXcWx1pP+/lbMo9Zigornwe5iDOZfEaAxvtD+vAcED3BkUxD97eG9L4
         sJqcvCFlFm+Qz2/cyScvEKcbY2s9Lid81B17DOTLgYMwqjn05rAuhDe8b91plpw6l0co
         A692t9wpJi84aVvrKmm4t3k8zXzqbQox6iPGxAksmVaunNa+U4EPMd13a4VFR5xxU5Uv
         YiUNxA2gR11WuI02rDrDD35GKAyT+/+1pNplkwnWXpLeKVT7220DCA5WPhOyFH/k5hPo
         KOXsxbxw0mEX0eLeEMxVo2lcsYBE8Vr7A0JOLBOijV1s+K3m48wMoOMgNQmputjf3Zv6
         ZaAw==
X-Gm-Message-State: AOJu0YwNZtykuyCYLyMNBXiaqaDBRGVFRVQlFAgZvE8ouLWdIEVy7MoW
	cBnoMIv0Jo5oZCF4Z9hQCuEtjs966GzCtMv2z3bg/Q==
X-Google-Smtp-Source: AGHT+IHcgl2/QV864SykR+c7iokcTzc7fsIqsOUXNXmWZYppcPAo0lXmLs+HWeYJbKBNoOImbT7v9A==
X-Received: by 2002:a17:902:9a8a:b0:1ca:3c63:d5d3 with SMTP id w10-20020a1709029a8a00b001ca3c63d5d3mr6864723plp.2.1700082752229;
        Wed, 15 Nov 2023 13:12:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902e88600b001cc3fae06a6sm7805990plg.159.2023.11.15.13.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 13:12:31 -0800 (PST)
Message-ID: <d750b276-3693-444d-8a11-893024ecad43@linaro.org>
Date: Wed, 15 Nov 2023 13:12:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] testing: move arm system tests into their own
 folder
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20231115205542.3092038-1-alex.bennee@linaro.org>
 <20231115205542.3092038-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231115205542.3092038-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: T5KTd1ODLiru

On 11/15/23 12:55, Alex Bennée wrote:
> Prepare for expanding the arm system tests by cleaning up the test
> directory.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/arm/Makefile.softmmu-target           | 5 ++---
>   tests/tcg/arm/{ => system}/test-armv6m-undef.S  | 0
>   tests/tcg/arm/{ => system}/test-armv6m-undef.ld | 0
>   3 files changed, 2 insertions(+), 3 deletions(-)
>   rename tests/tcg/arm/{ => system}/test-armv6m-undef.S (100%)
>   rename tests/tcg/arm/{ => system}/test-armv6m-undef.ld (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
> 
> diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
> index 8b546e2aa3..7857ab9324 100644
> --- a/tests/tcg/arm/Makefile.softmmu-target
> +++ b/tests/tcg/arm/Makefile.softmmu-target
> @@ -3,7 +3,7 @@
>   # ARM SoftMMU tests - included from tests/tcg/Makefile
>   #
>   
> -ARM_SRC=$(SRC_PATH)/tests/tcg/arm
> +ARM_SRC=$(SRC_PATH)/tests/tcg/arm/system
>   
>   # Set search path for all sources
>   VPATH 		+= $(ARM_SRC)
> @@ -12,7 +12,6 @@ ARM_TESTS=test-armv6m-undef
>   
>   TESTS += $(ARM_TESTS)
>   
> -CFLAGS+=-Wl,--build-id=none -x assembler-with-cpp
>   LDFLAGS+=-nostdlib -N -static
>   
>   %: %.S %.ld
> @@ -20,7 +19,7 @@ LDFLAGS+=-nostdlib -N -static
>   
>   # Specific Test Rules
>   
> -test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft
> +test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft -Wl,--build-id=none -x assembler-with-cpp
>   
>   run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
>   
> diff --git a/tests/tcg/arm/test-armv6m-undef.S b/tests/tcg/arm/system/test-armv6m-undef.S
> similarity index 100%
> rename from tests/tcg/arm/test-armv6m-undef.S
> rename to tests/tcg/arm/system/test-armv6m-undef.S
> diff --git a/tests/tcg/arm/test-armv6m-undef.ld b/tests/tcg/arm/system/test-armv6m-undef.ld
> similarity index 100%
> rename from tests/tcg/arm/test-armv6m-undef.ld
> rename to tests/tcg/arm/system/test-armv6m-undef.ld
