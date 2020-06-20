Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1070742lfm;
        Fri, 19 Jun 2020 17:23:06 -0700 (PDT)
X-Received: by 2002:a17:90a:9d82:: with SMTP id k2mr5972020pjp.224.1592612586645;
        Fri, 19 Jun 2020 17:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592612586; cv=none;
        d=google.com; s=arc-20160816;
        b=QLwhZb8V+Y+//u4De4FFfvQNIKafvCkpjDjNB8aEAHMh3nSWanmhQINafjfSOHikiW
         kRLs8ugZsbMszdh8YW/sbDlYsjkw1onKHOdrZRodBRPkRnFeYS3Hm7vs8wozguVEFg3m
         gC++3/JTZoxbx4odlfFH6c+g6Z85G5NCnz9An3XNgAx2CyFPkltyGG4QUdluGIJxDsHQ
         Bj0i0g9slcFYcdJUPAmpH4lvTnF8QVbgKCN1IBfMKfxpyZFumqmOMbuk8yeJ2cXy9DcX
         U++UA0Z9VY77JD9vPb2pNfVFFA5YVBy94aB26lrXCurPglAiZMokVX9ZciExeEz8EDxS
         o40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Yf0PnAnGLCLY9g+lvYg57egrjljX44v9bJe37LTyOpc=;
        b=s7F/OT4OPZBLoGq9TrD5WaS0xgbfPtoJ1XWCbH4hoebQzztkuII/vXV6vneFXTXxDk
         Yc7Z/ev/9W8Yhc+hor99N5+s9bTTIZFqfMf4QWblyzNHITy5ToiXImWTGa49RzLswNYr
         GjDmbR6SZLQ8hOFpF3FkBLtWHTN3uTIf+3Hu+Ksm9+ffNr99PZKEVie2igice+1UUktV
         /mIMC0dT2fGdTLnIXBRga3pOQRyqQg9uasH4X9MeZC4wtRZ7VjGBSiOveEUdktv1voXt
         PaXjA8C3i7LI8MT97LmH8nbDbBSgBnkJOdEJ7o3cAyq/nOTZHMWVxEtWrSKxZovpIeiJ
         dwIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gm8NdzWF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c7sor10540950plo.18.2020.06.19.17.23.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jun 2020 17:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gm8NdzWF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yf0PnAnGLCLY9g+lvYg57egrjljX44v9bJe37LTyOpc=;
        b=gm8NdzWF8uAgAT6qSQOHtErIy4CpfvRG7CTA69A3BVK9pWMFDflncmVLoziB+5XeGc
         xNx/bHQipo5cDuPcGTOgRUXSv3YVoUdGyYoFJzQmMom4CGEya5ikJ9c54FcieqQ5i1G+
         DEt/FyngjMbNSIk4/9uW0Z4k7dMqSOisyQ5OJBzvjvqBD4p+WRaw14sq0SkvVyYhULHL
         Lh/0K4VwdhOyKnCydd6mluwVarH/sBK6I6py9mAOZEJ7hRnZDvIPkRCdtaSl8QYmnTZL
         XJLKBXU5db9HHOCHUN0aQUaA/FcCLMpIPlest0r+qf8RIsIgu60jbouDxOB3djEHf1yX
         CSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yf0PnAnGLCLY9g+lvYg57egrjljX44v9bJe37LTyOpc=;
        b=UmyvdiGUTsD60Fw+MpsNcrjRC8rVt1++ik5OjLPZZtTfwZQSTRlRGoyZFYlr352sn/
         QucNrklJm1mkN22wUyHiOdzKzI8rc56zd3pGXRsl2tzxW6QCGv0/9FGhqF2/8tqQ2maJ
         arrD+V8TNRiKw/HcdLLkcnXvLu1pNo19uI74Pfaj+TSYeMx9FoXn+B9Bij3K6Jzw4E53
         Dwcz7wZ2wU0zEgrDR3etzlNATZTaemFtzdSYVVDP2dLzgMLXedHwKM74d1z6HslSoxoA
         aKsJjas/r88SUMjOI/pu5ltJBCP0iASN0kqdBebmiFWtFWDhiKgQw8HmzIP1W2m2rdmq
         N0fg==
X-Gm-Message-State: AOAM531Lcitlp/mv2iphE/STkZH8YTii6/Yn1PPTdHZRs4KEIKIXVIgR
	cxlGAA/kIeCI5FMVIHrp6VHwEVf8
X-Google-Smtp-Source: ABdhPJzWGr6/MT4H0R1a9fZAQ0IPCIco2RmhEir+wDHtARFBcgUuP3qijev1jf53TLmQSlaNRNt1vA==
X-Received: by 2002:a17:902:8d8d:: with SMTP id v13mr9467117plo.162.1592612586167;
        Fri, 19 Jun 2020 17:23:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id z1sm6157580pjz.10.2020.06.19.17.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 17:23:05 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Remove unnecessary gen_io_end() calls
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Pavel Dovgalyuk <dovgaluk@ispras.ru>
References: <20200619170324.12093-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1dbcfa7-84fa-b5ca-7603-e8251b693f91@linaro.org>
Date: Fri, 19 Jun 2020 17:23:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619170324.12093-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: I11sRgha1az9

On 6/19/20 10:03 AM, Peter Maydell wrote:
> Since commit ba3e7926691ed3 it has been unnecessary for target code
> to call gen_io_end() after an IO instruction in icount mode; it is
> sufficient to call gen_io_start() before it and to force the end of
> the TB.
> 
> Many now-unnecessary calls to gen_io_end() were removed in commit
> 9e9b10c6491153b, but some were missed or accidentally added later.
> Remove unneeded calls from the arm target:
> 
>  * the call in the handling of exception-return-via-LDM is
>    unnecessary, and the code is already forcing end-of-TB
>  * the call in the VFP access check code is more complicated:
>    we weren't ending the TB, so we need to add the code to
>    force that by setting DISAS_UPDATE
>  * the doc comment for ARM_CP_IO doesn't need to mention
>    gen_io_end() any more
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h               | 2 +-
>  target/arm/translate-vfp.inc.c | 7 +++----
>  target/arm/translate.c         | 3 ---
>  3 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
