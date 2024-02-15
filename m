Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp804754ejb;
        Thu, 15 Feb 2024 12:07:13 -0800 (PST)
X-Received: by 2002:aa7:d594:0:b0:562:117d:22a4 with SMTP id r20-20020aa7d594000000b00562117d22a4mr2565769edq.15.1708027632934;
        Thu, 15 Feb 2024 12:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708027632; cv=none;
        d=google.com; s=arc-20160816;
        b=EQCqlPF8R/KUSFJbN06h4ZdElrnghyoVBsCX3TytR6dED68P2IYiY6npoEQrbjidiA
         Lbryw4YLsYc9QIAfBVrmyDCfqh66bMOsguc8dHePa0cOF29SObCPm9/Uh0bj59UtLZDa
         kZBKL0dcI7hlfhljafcVUq5fI6VW6gaB70FxQVi45BhEVrEjGyRPepxhbnAQDYiae+ad
         AGffUuNHL3bbGDdsxTVQ7ofswYqFFtwgtP/1i9XM5SEAL+dyllJB9soso2ejwAG6r57W
         nV/v6LCQeYcPNWw8rqE5L3n+I4L5Hur9b8L5yNKgZZp/LdS+k5N+BQt8j0X3VAdgdwv4
         PLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZmI/qXqvBC4G+5ykIK4JRiBXGGdwJnEinXFvnol2i/M=;
        fh=2coBUMWCOO+2Fih+HM7j6yu8Hs2KDiK6BrEVm8MuOdI=;
        b=vl9r0uQ6LadxcYhKbh9oKyU2sIr7DyBEVWD+Dt0UBfUlVS6hF6xdZlHt3pqQjRcTWf
         S2hnMk3OpZBZnzcyAgthz/6Rbu53o4w/kSv9Y9Tont7rx32BCo02Ys3BgGgYJhlO0Z+m
         WdKPzVj37k+X+tvFddib06ny4Sqf8p8CZhZ0qilONUFH2kvvDYOZRKsjW0QRfgiTtlIt
         VIxBDk9IM2wawZLNd90ISJQAKNJ7sfEpPtzbFKfIkuRoQIfTBynQjZV2upn/f7jKKN3D
         67z2KtE9GpoIvYZtvAlquBdYrym7R5Ff2OCMCrncfTGhiaktZIGPtEWw1QDEb8i9CND3
         RjSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DerZh85/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a19-20020a509b53000000b00563dbd3c524sor276113edj.6.2024.02.15.12.07.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Feb 2024 12:07:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DerZh85/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708027632; x=1708632432; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmI/qXqvBC4G+5ykIK4JRiBXGGdwJnEinXFvnol2i/M=;
        b=DerZh85/Snk4lipTdYfBvUDyiwkXF6x94jVCDge1tuEAYThRF+13Wa2xt4boXdduZU
         Jg1q8qbEI1ZkwA2Nh5kks9VAEBJwilQe34jXk+fcIugq21h55+0xqQY6j19a3rAZxbbB
         Nuz0egu9FVrzutDBUJC/ygHlZLwSq3Ee1uC1JEiNFsdNx3K4TzMag+YEcrRiGmYTqGnu
         OHqY1HzYuttP3rdrTXyZeA31c90+C+C+jwijYJFEXE0LigmJnYmesE58/8pt2p5SdqFZ
         3fmR6Mu2CsvKmOanSw6oGc99Km2j/LX2XcYFqyES3DYglTn/av2ZE6s5rjFRGa38oHzA
         ktIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708027632; x=1708632432;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmI/qXqvBC4G+5ykIK4JRiBXGGdwJnEinXFvnol2i/M=;
        b=OQz7aj3NNTz0Od3jYy4P4PQsnU4AsgXH9RLpnlIaHQS1TcIxWrdLaUBUBIfK/RzX6x
         E41kR3tR3byDGkRXVPVklSkQBQzHrBJu830VBLnl81sawOrSGFwAmjfYqiHnXwhQtjWV
         L7Q4nyO7BZH4qZC2VW6c/haThGoQP/+nY0tHfAKwCreJm/LYCByIfHIPXvamyimjrMUV
         8UkcwE/KngskYuV16iLkhErQVaa1jlyFeaBj/6Po7qWkBPYNk3NNUtQJmNBeXhrlyptD
         xYV7EzGJBf7zkINXmqgglyH4Un/Hdan1FN0q1777Ns0ZoYxllBc8/GAufajPwNkRVU9b
         N8yQ==
X-Gm-Message-State: AOJu0Yx7McQbB0LronPyrQV2xnDPGbkKksUKwv4hqtCPtEe6ooKnIjr8
	FKd8AqIntCKluUXNcI5aT4xN2sjjfeKDCS7RA1aadN+VBSWN5N65mSjnD8D5bR6r6uPbA2tf5Hs
	2sCZGNg==
X-Google-Smtp-Source: AGHT+IEavLD2jtewehmuf2W4DDIOilRaPboL+020362tIU3AfHzgmWYC5Iu8gk8XRBYnRS7N7cndkA==
X-Received: by 2002:a05:6402:24a1:b0:561:3b53:d0af with SMTP id q33-20020a05640224a100b005613b53d0afmr5748283eda.12.1708027632203;
        Thu, 15 Feb 2024 12:07:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.193.50])
        by smtp.gmail.com with ESMTPSA id x6-20020a056402414600b00563c179b993sm557345eda.11.2024.02.15.12.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 12:07:11 -0800 (PST)
Message-ID: <98a45842-0ce4-4271-b503-f96ef7f0777b@linaro.org>
Date: Thu, 15 Feb 2024 21:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] tests/tcg: update licenses to GPLv2 as intended
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20240215184036.214065-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240215184036.214065-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6RKxB50aiCoL

On 15/2/24 19:40, Alex Bennée wrote:
> My default header template is GPLv3 but for QEMU code we really should
> stick to GPLv2-or-later (allowing others to up-license it if they
> wish). While this is test code we should still be consistent on the
> source distribution.
> 
> I wrote all of this code so its not a problem. However there remains
> one GPLv3 file left which is the crt0-tc2x.S for TriCore.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/aarch64/semicall.h                      | 4 ++--
>   tests/tcg/arm/semicall.h                          | 4 ++--
>   tests/tcg/multiarch/float_helpers.h               | 4 ++--
>   tests/tcg/riscv64/semicall.h                      | 4 ++--
>   tests/tcg/multiarch/arm-compat-semi/semiconsole.c | 4 ++--
>   tests/tcg/multiarch/arm-compat-semi/semihosting.c | 4 ++--
>   tests/tcg/multiarch/float_convd.c                 | 4 ++--
>   tests/tcg/multiarch/float_convs.c                 | 4 ++--
>   tests/tcg/multiarch/float_madds.c                 | 4 ++--
>   tests/tcg/multiarch/libs/float_helpers.c          | 4 ++--
>   tests/tcg/i386/system/boot.S                      | 6 +++---
>   tests/tcg/x86_64/system/boot.S                    | 6 +++---
>   12 files changed, 26 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
