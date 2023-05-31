Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp110936ejb;
        Wed, 31 May 2023 10:13:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a4:b0:64b:7c1d:518e with SMTP id x36-20020a056a0018a400b0064b7c1d518emr8763224pfh.31.1685553188864;
        Wed, 31 May 2023 10:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685553188; cv=none;
        d=google.com; s=arc-20160816;
        b=iOM/jfeS1rHNS2aeE2rlbNvu3Z6H6TS++7SHlSMlyDpiS8HsO+R/KfHYApru3+AZiI
         rutcEYiUmv6MugD5U7hmYxmISoCIaRzCqwYeKy4RPcfkHZTQiZD1Bb4mgDiX8GK8fP5c
         W9o36zFOI97Qa7AjrflhWdlqfpt9kcefw+pVdM/s1OD3h9Fl1Nmug9+ok1KZuzaT+RJ3
         c/1lhk0ir4lY1X/7uszgiQm5jIQFQQuLWjjPYcArkbEGr8vk6J40qicBsWrP5HqZD0kT
         xnyQJCwdeq2ritdSZqdvN/VecVTvwREXNzQkNO88p/98vdZsK3nHx8IyTOGz/AuxaQrk
         dCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UbGZWoyBpqZ1b2Xq4238aMV8PCe970ho30HBemnWEc4=;
        b=DcAfa91jgSllel2JQU6i8IxevFEjY43tBHlVKp5VsJ/J6KoVt7C8xX56TomFjB4Bee
         gK+mnuP8YVZTCVLlF6E42nEfBNYqGtFGwyEx6SAGHuGu1OMO0W9HBb4AuAovhyWwxmg9
         nbLMx0VPpN4j6Xqx8JDRsVXUhtvgtxLbb95AQDy+ymEnjmCPVFj9OJU+/rmwsuJ+GX7K
         e9JFB7pDEJ6vDQTC/XBXG2PgwIFfDpTrmK3n0ii8bpYJPwaZOZx1O8CIpetKXIqUPHRP
         vqnRYsZa2oQVFF7nx95Yd80YcLjTe9u786h7JUk+gdtWA0wHThIQlT6ZVpNCOVNUfrEZ
         diSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxemYN5s;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i2-20020a626d02000000b0064d2d0f489fsor3752315pfc.6.2023.05.31.10.13.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 May 2023 10:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxemYN5s;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685553188; x=1688145188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UbGZWoyBpqZ1b2Xq4238aMV8PCe970ho30HBemnWEc4=;
        b=AxemYN5s8SgVf0OLrmXTGTP8+BlKkYfo+KJFh0yILLz1NXttV623vdBLQIiNMsJE9b
         zbXVfvHreL22f3kmydHmlslauqo/JO5I5NdazBzRMvJxF0uPjC7x4WXM6kuMwMKEk7xd
         HoIUKLn4pxRTTkqLzbQZVzF226b084wKUVPetkCX8lUbMmKxRDMUaMvB3oKkNF0bOKs9
         MoHwXT19UfhMx6sLVGFzJsHHKLeeXSadl/h6EKgLsyB8KMV1VlgYZdW9hQrPrNXc4eCL
         Q0ZY/OnJUPQwqcsow9GDbsHz62uYwavgqNtfFzlqpMY/ozIGa4PuTwtqsYGCOY0ZHiuP
         BJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685553188; x=1688145188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbGZWoyBpqZ1b2Xq4238aMV8PCe970ho30HBemnWEc4=;
        b=g2gMKH4XZ34eAVgwsQM5FkaMo6I7KSm1Mt4ZEaeyQxYxFg91k3xI8jmP2APGi5yATc
         lD+BLcj4F2Dn8oszmyXISVPCNFSySF1us5jQYhJap1J1lf6y/1fblFW4tcErB2Rw0Qng
         e9B1LmSkscRJJuGeNRTOGgKJDCw848R+Y6M3WVBN8T8Lez6ofXkSEec8qCeLmibzmDp/
         cfby2Vqab9SRDLbKaD1TwTnIw4DvVfinlSb30fKu5fWkHH2D25qzKRCYANYskhjt2kKs
         n1uxwakuWSY5IvKbN0TQMGnUK+CfhGH4tKx9mHuuMqq/6iq0COSNqaxbQA8agWDWcws+
         vBTw==
X-Gm-Message-State: AC+VfDxpc6sS6IHPLIKR4h+X/RONjnxzTYGux3jgYqySJYiIGTSN9V6k
	5xhKtMa4Ae5Ng/vvesrfO9H+lP6ccVJknSRheLmChQ==
X-Google-Smtp-Source: ACHHUZ4JrsnRKtKXi3pKGMa6jfC83GV/vntrPM6mp22vXOP2/vjuiUKzGJGf9YsGJTtovAd8C7SQ4A==
X-Received: by 2002:a05:6a20:d90b:b0:10c:89cc:bc5f with SMTP id jd11-20020a056a20d90b00b0010c89ccbc5fmr6357822pzb.20.1685553188351;
        Wed, 31 May 2023 10:13:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:3019:d9fa:8bb1:50d7? ([2602:ae:1598:4c01:3019:d9fa:8bb1:50d7])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b0064fff9f540csm2780991pfi.164.2023.05.31.10.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 10:13:07 -0700 (PDT)
Message-ID: <5c5c64f4-7b69-5513-0ee4-6e23678e8177@linaro.org>
Date: Wed, 31 May 2023 10:13:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] target/i386: Implement AES instructions using
 AArch64 counterparts
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230531112239.3164777-1-ardb@kernel.org>
 <20230531112239.3164777-3-ardb@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230531112239.3164777-3-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: FDfSqxeUQl+b

On 5/31/23 04:22, Ard Biesheuvel wrote:
> +++ b/util/cpuinfo-aarch64.c
> @@ -56,6 +56,7 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
>       unsigned long hwcap = qemu_getauxval(AT_HWCAP);
>       info |= (hwcap & HWCAP_ATOMICS ? CPUINFO_LSE : 0);
>       info |= (hwcap & HWCAP_USCAT ? CPUINFO_LSE2 : 0);
> +    info |= (hwcap & HWCAP_AES ? CPUINFO_AES : 0);
>   #endif
>   #ifdef CONFIG_DARWIN
>       info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE") * CPUINFO_LSE;

FYI, "hw.optional.arm.FEAT_AES" exists for darwin, and is set for Apple M1.
I'll incorporate that when adding the probing.


r~
