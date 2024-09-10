Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1245176dlb;
        Tue, 10 Sep 2024 07:34:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1pt1G9EXvm60mKSKX+bFq3TFasRQ/j928PG4Go6warqr4dZnixdtkRjjtjaz+2OtOy4y2XJq/dRbjRg==@linaro.org
X-Received: by 2002:a05:6512:4028:b0:52c:d905:9645 with SMTP id 2adb3069b0e04-536587aaf0cmr8911320e87.13.1725978840197;
        Tue, 10 Sep 2024 07:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725978840; cv=none;
        d=google.com; s=arc-20160816;
        b=Ru7nQae/1h66w+xMFWi0MGWA8Su96BtP/jTtVzXhsWqPWLN6J5EU+0Oe2HAzCxJfuV
         cpFJ/gbkLQ+Cv2JKAKs6YetWXFCGNUBt043nsBJ8l68spbz3RCfJ/HrJn3aFM56b1sit
         KEcgR4G648FZjKNE+eLQHHonqL1HIowmt69PrNc+3IH/wEewbFSowhMPWqA+mt/XsUIg
         MLC/dtEoB4Wg7NkhnV2h9uGI1OCd12IkLDovbSA0k3d0Y1BT1dXp9SRak0JGqjSYQH9S
         nS/oRzImCiAifTYkc0FbQL5sYLcW7UrHbeAuCy7zFK/nllg7kxbRwwk7h8bRQAqNdYwO
         EuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LuQOXsZmhBvhlFdXkQhwG9jubmnqYTr/GtKVU1B7PsQ=;
        fh=TiqnTJ6gH0bo+zAA+iKftR+qualuiOfcukShTU5Lz18=;
        b=K0SQ06CLjX03tOOR5pKRZmZmH9llKxRwCZY6FVl4JHNsDLzCGiWbLoWsJSXCayGklh
         3ehs7h5OjtQcur9zE7pOId2gOOKsfeH5KeFs3xdy/81t7U/Ua2nHxeN3hcCxu+65+WGt
         5jdCtbBirWWWMQBxFelXBM+TrRBy+56LCIlm5aIzvsL4k7SqgM+4tuf1ZAAhqSUQmGcR
         asSpuGFnib+ZKqbRz4doPNGbp2B4Dm09x2uhqdHDLvhwcg9Vz0q9oy4RV8lIzhk7oz3a
         2UbLX06CXrJb+N9sA4wf2BZ9ZXCRvXNGp8EatubsIPLBQ3xxZDbJJSfQuhm6IEU6+b5R
         5ydA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+yoEmrt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d258f2d61sor242251666b.5.2024.09.10.07.33.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 07:33:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+yoEmrt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725978839; x=1726583639; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LuQOXsZmhBvhlFdXkQhwG9jubmnqYTr/GtKVU1B7PsQ=;
        b=S+yoEmrtWgB/NKGL2slFZVBoVlGWmN0DDBlPOmZlhC7ZJg1ypuj6Rk+L+bS+4dOYbG
         KZTFdiZ91gY0GXgZtZAib69d41ynrc1GFQR85f3MID5R3YqBVZTIynP3tCPd/zsFtOms
         Kob8pLk2EN084KdinMZAH2UUXSqo4hslNfydiR0dFL+ag4M19V5jpfhlbddQ+lvES8it
         NdTVSFm9C1DCBNMTZRM16NIZsMtQu6gVXki7fRgDGOYuV9nVEe6vi9nu8zpLKhrkOlsi
         z+4p11jg+Q9CkevX6Ok5hqpWlYXrEx/hyAdH6NC6cRTVdTjuXWmOaM6+j8UyRQwuM7UP
         XDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725978839; x=1726583639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuQOXsZmhBvhlFdXkQhwG9jubmnqYTr/GtKVU1B7PsQ=;
        b=mJU6uMW94tV7ztby1ToH7HC6o5QGmlARy8GnOXr6/503BhkdiqlpqVn2vbdJPtO5Za
         AZZFxPepCXi+llpAhGYjueEvkkKvdwt0aH5Fg/zp3Dtk5uUbroTe74znp9YH25dgXsQ+
         cnsB9AeFCwWOAiscFtTUcewEUeRTbdyjy+XwJAKxxXOnYJZOQ9sgoBXyHtP0HjIsDQzD
         NqkRIbKBwMb3iS1xHpflu6EujG3UnMOIffP6SUJOdz97NdfVS+dgWEkyzuVQGOQlT2N2
         xwwvkThC5EHAVUyf52PbEuer1M2ziSDDMPzzt3FHnVoJMHV+48OWpAHDdisNTKhQR/R8
         dpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsGhN6/4bOSsTldLXBvq5JGm/xFOFyx/8OZRl4UMFxU9egGLnYM4Hczgca0yl29e1uEcDm9TLK5JypxA==@linaro.org
X-Gm-Message-State: AOJu0YzlmyVg0xwzd/m/aKjn4KEsSw8JncnCuXIBh8leD5iT+D1tyjXP
	n1MbFZxIs134k39iLZAcdjOmXajnmFkOEN5gILAGGUv//O9mnMBBYlA8wXAA55AguA==
X-Google-Smtp-Source: AGHT+IHBXyYofeLN0dABoGVXGBAABn/FFxzf9QVFO9ZDv+bxiXNtgmjH1D0BT36yjfmtpzYjmOHGcA==
X-Received: by 2002:a17:907:869f:b0:a86:78fd:1df0 with SMTP id a640c23a62f3a-a8ffab8353amr86117466b.34.1725978838480;
        Tue, 10 Sep 2024 07:33:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.217.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ceaf86sm487678966b.155.2024.09.10.07.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:33:57 -0700 (PDT)
Message-ID: <0a00b59d-fdd7-47de-b3bd-62aed07d295e@linaro.org>
Date: Tue, 10 Sep 2024 16:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] hw/pci-host/designware: Declare CPU QOM types using
 DEFINE_TYPES() macro
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-2-philmd@linaro.org>
 <2f3df725-0d99-97d0-af7b-7054036e4228@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2f3df725-0d99-97d0-af7b-7054036e4228@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GuoeMHgagifr

On 19/8/24 06:21, Gustavo Romero wrote:
> Hi Phil,
> 
> On 10/12/23 9:18 AM, Philippe Mathieu-Daudé wrote:
>> When multiple QOM types are registered in the same file,
>> it is simpler to use the the DEFINE_TYPES() macro. In
>> particular because type array declared with such macro
>> are easier to review.
>>
>> Remove a pointless structure declaration in "designware.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   include/hw/pci-host/designware.h |  2 --
>>   hw/pci-host/designware.c         | 39 ++++++++++++++------------------
>>   2 files changed, 17 insertions(+), 24 deletions(-)


> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> 
> This patch can get merged independently of this series.

OK, thank you!
