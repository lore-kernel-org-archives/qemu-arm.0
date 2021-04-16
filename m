Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp521647lfr;
        Fri, 16 Apr 2021 09:07:59 -0700 (PDT)
X-Received: by 2002:a17:90a:4b8c:: with SMTP id i12mr10481744pjh.66.1618589279639;
        Fri, 16 Apr 2021 09:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618589279; cv=none;
        d=google.com; s=arc-20160816;
        b=EyFdcTW7P+z6BsWLbK6XZvU08dm+Pbo7eLevi1EwjAOHS0FpDdz4VfyKAWN09QG0eb
         mXiMROBEm4Hy43P1bYQqLz4KKTpTBuUMRGACFhENX7ipwUJc7uQHEuILQDULcbGUWZ19
         /JTt3ko07nBCdfxZik99Qa3D7t3lWPbQFpGQm3No2hbNlxuZgk39MzviQsoh9xbITP1L
         Vo7RbK3a09bw4PcGt1STaovwGsU1464u0JJIJgzo/QHbvpGmnR8TaSmmaqzwzjx5fdys
         S7g4h0zp7C2K41scPNbF2uAWc2cEjNtyuHCio8v2gY0N8Jsp9u3fLbMQPjPgh3ho3OOh
         N4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=WkFBCkkkicIKnBE9nNBDT9WuWGWcL0lUZBXFEw9pw8M=;
        b=KAfbmVsyukb+jxOzKMywOrj1l6qrGlIIyRTX3eQ7eOLYU/zYfd0tAjup/UKhqNmK4y
         4SYA69X+DXDA028HyIis53k6p3537Ht+CMlZ1x1gs7v28yIPQpbMWnyMIu3NpEKJ4eM/
         6WpK/7ZgTksmeeHatc5Gcc4XxPbFl4psB0Y0sSSvgo5DpeGh4KNFg6753joX6vVs9ybC
         qXKEGv/oifPXwOXA3XGn7XQf8JRBMX9YrI0alDaQFY+trVaB0RKD7RFJFTfWcPVIgZoo
         aIhuz/wlYzmDqX3xnK8zwaBaiENTDAtyE8CP7q5WOMlOxQ7TEjpn3bYPe8Fe7eE/tDM2
         /OuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFAcaHHj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y8sor3264151pfe.45.2021.04.16.09.07.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 09:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFAcaHHj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WkFBCkkkicIKnBE9nNBDT9WuWGWcL0lUZBXFEw9pw8M=;
        b=bFAcaHHjGxiVrow+BpJJW0h/YsGs0kVXjQxOqpEJbE55J+/JIWkMi7LKklFTjSrB/l
         OV4pBBS+186wIHUrLIq0hWKqpEyTPec6fJL2DJHvig161bpvAesinoED/gDIdyKq1/+1
         ieEkAHur9IJixv/ZNwPYiK3Fj77A/zJijbK/VkODSvVXvE4NNtf7CdTyOt/u9vrI5tkJ
         qCfclic8LGRdliJ9PVz1N/oMOwusvbpee2sr/A47NMH9ms3nOxqlwuDtxVGei0QUM1ac
         PZKa2du27CfSWTjWzdu6PtB3chV4T3GGH0CHaOz+PCpmGkxBj1BJwME/eLtzisIh8Bu2
         ljOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WkFBCkkkicIKnBE9nNBDT9WuWGWcL0lUZBXFEw9pw8M=;
        b=kgQAyq2Mmgej/TPoZgSIjUtJiTm5iTeeNuO1MNVdCML1ww/IQVoDbksAp/Ac4EOssT
         4dOybysTjL1gh4Hec+vJ0Lpt3M1SCzRSKiQzq7hfSqNPhSDtVfX6wfS+vSL627rfVYNt
         xxO2HHllL29t0MVu6RUdghYtb82XEZUBVMMByunioeBAeOCEBDWWVl+G/48FVk4Qd4e7
         /apa0H8HJmPkAr7iOgbGkRI63w3zWpIaQQkF3we9ZoI1n1bC+RNYgiuAXCTxPrOxfuZw
         2Xf65QNCG+Cb85vty+oQvEoJXxZrGJNIX1andsbqYmtvGJ6YZ1aTvPp99xevLdT/2hOG
         ruVw==
X-Gm-Message-State: AOAM531lr0gf/QxWgmovGD/So7cDUm+P39pjLC+7kH5shOp/T5VpCHlh
	9sn0OGw2lBEakgULhrFIAHYxT6Na
X-Google-Smtp-Source: ABdhPJz/NYNWyovFx2/O4+pJloC5xRhAvX9MkaPBjyAs7NCCsxEGTOooQMQMccga7SnSYlnH9vKSvw==
X-Received: by 2002:a62:6585:0:b029:241:cf5d:93b2 with SMTP id z127-20020a6265850000b0290241cf5d93b2mr8647186pfb.15.1618589279093;
        Fri, 16 Apr 2021 09:07:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id h16sm5158682pfo.191.2021.04.16.09.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 09:07:58 -0700 (PDT)
Subject: Re: [RFC PATCH] target/arm: drop CF_LAST_IO/dc->condjump check
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20210416154908.21673-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f27dc8f-c62c-fd8e-4f4e-3ad4b51122fa@linaro.org>
Date: Fri, 16 Apr 2021 09:07:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416154908.21673-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Ixi/GLRNhULZ

On 4/16/21 8:49 AM, Alex Bennée wrote:
> This is a left over erroneous check from the days front-ends handled
> io start/end themselves. Regardless just because IO could be performed
> on the last instruction doesn't obligate the front end to do so.
> 
> This fixes an abort faced by the aspeed execute-in-place support which
> will necessarily trigger this state (even before the one-shot
> CF_LAST_IO fix). The test still seems to hang once it attempts to boot
> the Linux kernel but I suspect this is an unrelated issue with icount
> and the timer handling code.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Cédric Le Goater<clg@kaod.org>
> ---
>   target/arm/translate.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
