Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp485244njc;
        Thu, 14 Nov 2024 11:00:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUSKSiUA7xOPGoSKOp67SAQ8E1R4A9zdnxDAzGPf0t3CXKZenptaHAFwsuAbn77pBVrbwzD1rXS3lJBBw==@linaro.org
X-Received: by 2002:a17:90b:5443:b0:2e1:ce67:5d29 with SMTP id 98e67ed59e1d1-2ea0632f493mr3318400a91.21.1731610847447;
        Thu, 14 Nov 2024 11:00:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731610847; cv=none;
        d=google.com; s=arc-20240605;
        b=IhWJG8xv/ugIhNhxguYb6Y7JxqlasoJFUvvFHPKyj191JyRr82zdMk63hMDMF1AEFF
         MdS+EV1p7vA/uncXqdd+XxtIHhOX9EJGe6NbNTl6AqZfBuPsUYmOGuD+dazx0UQBABGO
         TcTpdZUSqSmaXCdsp4hvxVndJit1jd6tU7VpGqsSt8+FlAQAwrUSP6iE/LCjaSgP42SY
         2rTZ6QY//ulFgjDJKTgaBSDuvbM5qJl5vdwMQd8HQnrTRZEBbWGhVYldglESPhd1lJn0
         sLHL/hl72VAsndV4dEk/T77IC8WojJvbjb3lW2h9s9EUAgjsB0FjEuu4Liu+vDKdBrjl
         jPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WCF10UJl5PG27w8WAO2jHWY7UVY497UxuwsdECCW7mU=;
        fh=pf3ip46R2tt/ISRcSeEZxp+8Z50Xb8BJSuZFTstCfDM=;
        b=W8grABLrsa0Kdls4VslrVloic+W3c90H+3FBKLDqJKoMcFpdRO3YDFkpAWvQe5XV9Y
         4SicQvMQERk6MC83gAs1vl3gq7Dl/By0K3pVD5szCnLt4gI52v115FMdH0u7zcclOTI1
         gogiJkmTiq3oE5guzLc+Y7+pRId5EL1hF6drCw193jiaksEZkS2A88qGh2Gsz5G7ORsh
         PPxUFDn8Oan55HPNXkH4GZoKzp/TNiDnShliNpxdmwtHLWHirNid6In6rO0/u/S5ckZu
         wekfaPhDI3zs+4bwSMFgIo+kdc7aRxwt2pc9Dj+iaoCEpBhn+KvfNBxkNF96qUaz0BUq
         0Xiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xau0J19f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7d1db71sor13333565ad.18.2024.11.14.11.00.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:00:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xau0J19f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731610847; x=1732215647; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCF10UJl5PG27w8WAO2jHWY7UVY497UxuwsdECCW7mU=;
        b=Xau0J19fPxTZbHfjfMbvX/KpUwQ5M2oU6sozIhcy0+K2Q4mhhjuvAeD2haKz62Baqh
         7159rpZEREP0LAx0F1FWSTbWYtBepESAOQRZutK+e5CK6IUu/hixB/dr5zxbh4XteuIL
         GGI0kOcLB62ToBqr4njpPEQmifcB0zdPEkxPvXYYwf82G0J46DhJz2leMZafiJdsg+5A
         9+9/9yv1js8QzQ4RGQ1ps7+h9qbCvaCpyCmBltJUWAZjsw3PGkzJvddLKBinCdtPzvVz
         J3GyappUp7mw3HPaQQ3lebWoAy0T0oT5WCSQhLmxHa3A76YPZAML0Ee/MowBdhaqDAnl
         5BvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731610847; x=1732215647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCF10UJl5PG27w8WAO2jHWY7UVY497UxuwsdECCW7mU=;
        b=f9FwqrH4VG3ws7PTLwPHKGKPiivCxt4DmAiRIubqR+WtFf2nmyBCH/5UcHlIKZpE4r
         WOITkdPpShOyTkLtkjeVVvKsGIbiehGNwjwd9hsFpWdt1qcIZask+7wyJtCY3Vx3wE+r
         OWodaSXQdykgpWA4Z7SlsmpMl1k6LFZFg6MjxBy+C0NaatPtbF1smM8WaDN4hvf+OWBb
         eWvZ4Pd40uAIo7NH3bSQ3q0kN/2XqXvbNZwHFEIQ2aqZkDO4/xkaiqu7P5NH5KNtDwM9
         jcnCEUStLjuOd435JZAliSS+lZcv06oZfPL9roCmB+0kfv+jH+cVWZC39mz5Bz8598xc
         yEnw==
X-Forwarded-Encrypted: i=1; AJvYcCWQG+HQTH7/ogf16U7ZrkrWr6So1ppCvQnK6Tin5JcpMhAMQ5TtGeO9c4K4pICYSH2zmtvtAQj6hKR5OQ==@linaro.org
X-Gm-Message-State: AOJu0YxHAz16R54W2Dj3tDBaCSaP/gEnltFqjCwAifYvALc8IbccXye9
	By5Zi0mfHRq/axO4dgowC8TPY2CKt9FexXrb65+Xm5uF1YwkAp3X7tNohwe8pmFapA==
X-Google-Smtp-Source: AGHT+IGnHzzYqk+q7/Yv5JN7lqD83FpYqSx/4shcVG1QfnTZYGSwgaOyl2SBchN7ed/snrWOVkfC9A==
X-Received: by 2002:a17:902:ce90:b0:20c:a175:1942 with SMTP id d9443c01a7336-211c5011492mr45572645ad.24.1731610846935;
        Thu, 14 Nov 2024 11:00:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d05dcfsm13642015ad.201.2024.11.14.11.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:00:46 -0800 (PST)
Message-ID: <6db9d01c-4d1b-4102-b5e9-d8b613234bff@linaro.org>
Date: Thu, 14 Nov 2024 11:00:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/24] target/arm/mte: Restrict 'exec/ram_addr.h' to
 system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IKOvO/JIMuxJ

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> "exec/ram_addr.h" contains system specific declarations.
> Restrict its inclusion to sysemu to avoid build errors
> when refactoring.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/mte_helper.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
