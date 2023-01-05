Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp60501ejb;
        Wed, 4 Jan 2023 21:09:13 -0800 (PST)
X-Received: by 2002:a05:6a20:492a:b0:af:6cc0:344d with SMTP id ft42-20020a056a20492a00b000af6cc0344dmr53569239pzb.18.1672895353336;
        Wed, 04 Jan 2023 21:09:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672895353; cv=none;
        d=google.com; s=arc-20160816;
        b=00QxPbxyJhNKCNTvgY0pfdvkDtceP1Mpwd3ItiqjjXQ9KhIhN5QVpmxhw+f3jCWrdM
         AougsTlftThXIhY7Mq56J1QeU8S4t+aOn2lIh8p/GZ6T5vilY7E2n8IuNugyYZUZpY0G
         YfUVk5ImRjXL3xSwe5SsSu7sP6UQs7JVXtw6nWNAcVMBtbyFOXEYU1Ma7Jks3M6tq9/8
         3B8E3HChd1l+iKmta5G+bukacsLpIFCehjMhDpB1JDwaq7xQ9HlIuyc8PYzDtwUvzrRM
         HQ1cQ9zGt2x77ju98SMlfORn9li93Y3kbddJm9urC2niMLAXkZgsgAY2SKgYKlgk4Sy0
         GxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wKGKXRXdbc3YxjI2XIEaKQmnwEMkgFcfN0dTPlBj504=;
        b=pxHMARe3ArWz1OVtZ9668NKkC/Amgob4WKG848ZnZey8WOtds3AvlO4GayQunXHnEa
         gL/B57XLw8Sgsrf9DG/7eT/qolSeAsoel3SbFSzVa11cTw8HERQxZv55nwpycGiAPVkb
         316x6I5ZXmPdJK6baud/D9Xm3hC1mOmcf174DUq9+Snf/EGDaL4TuW+m4bMgwMBolLQ4
         QObNjRAsBe1GCW6jbWArpbCV2qQ3qA/zKuW1h7bBT7rAhf2rvL/oBNGeHo7J779FVZAw
         SHlEU8mjGswzGU8R6NXMW9AEXLd1MlwM2f951y88hhEfa1RheiZYi6DibNjOHTR3vpvT
         XvRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ng42fTsD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u1-20020a626001000000b0057a9b1468d5sor14080111pfb.43.2023.01.04.21.09.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 21:09:13 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ng42fTsD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKGKXRXdbc3YxjI2XIEaKQmnwEMkgFcfN0dTPlBj504=;
        b=Ng42fTsDW33H6jB5vbGoprjG4FJji8a0E3/ep9I33hqNIpz79gh8Tnm4o7Nww7lCWA
         wUs2Ly2XIrQbiA3yt6NO1tRYl8h5D/L9GWgg31vZ1ugvAlzSZA1TpCqhl6Hi4k0mltXR
         EuVcPOlZ0shkjOFAcHkWy0+y9fywfXgpcjRRAnRqI0ZagOcEtmPDNtV/MlMUwWKK013x
         qDxb1/08mEQAmb58V47wP0rGIlEw25G4d2/MsYqcoJluvAj+mUC9FQkHisNawiaFdIcK
         C+BwOeQRAjd0PP12QQhzT5WLbB8GGwEyjZVqfGEKqf+b5wO3j0xgnTAFyCZlYKLC6+sd
         Tp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKGKXRXdbc3YxjI2XIEaKQmnwEMkgFcfN0dTPlBj504=;
        b=lZqqTw1g7nxw00ZJjUR6tY+euOsaf7hw7/ikzEqSSgPLRpn+/2HvpSowcMMHkUa3pG
         3F6V6dswZT4tBvR1Nz+3SW/Ys91sVu+Lxeikv9MjxFmZK1EisOW9BHJmq9QR0vWy/SHc
         3DTVvoFAZ6ORHjzFMoQQ2W7hXVmy3z0d6+xIGu1UpQutYTN7Dot+zBvWbjVZD1UVQviP
         59JDTOVnnlBzwpQjMbz+eo9P4+8QL9oP3qwVhvmjSN4AoJ8xqA5kGWjbABxMWtEV+rBx
         wFlsVDCSjrstESnw4wInZNM246ppzT1J6nSgjJWkvY1uF6N9qu13OOZiPNArkOFWBgVE
         +8nQ==
X-Gm-Message-State: AFqh2kpJCFqTpIcJXN7qztf2KklvvaVJj5Q6qBs7MqYgo+JBqAs0ktp5
	NeK/0Sb/YXmCLhC7NqSQttJCzzGJ
X-Google-Smtp-Source: AMrXdXuKfmVU/X200UICsEvwaj+nvARsnp25KvAHL/FFwR5PB7tHn8AY7CRU5+2gzb5XKRcKZXTiDQ==
X-Received: by 2002:aa7:9683:0:b0:581:a8dc:8f94 with SMTP id f3-20020aa79683000000b00581a8dc8f94mr26007941pfk.27.1672895352840;
        Wed, 04 Jan 2023 21:09:12 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id a6-20020aa795a6000000b005819313269csm14567279pfk.124.2023.01.04.21.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 21:09:12 -0800 (PST)
Message-ID: <8db4f96d-810f-bde5-d33b-12019434db47@linaro.org>
Date: Wed, 4 Jan 2023 21:09:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 22/27] target/arm: Move hflags code into the tcg
 directory
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-23-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-23-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: q1s6T6TbbnkH

On 1/4/23 13:58, Fabiano Rosas wrote:
> @@ -25,6 +25,7 @@
>   #include "qemu/config-file.h"
>   #include "qemu/option.h"
>   #include "qemu/units.h"
> +#include "sysemu/tcg.h"
>   
>   /* Kernel boot protocol is specified in the kernel docs
>    * Documentation/arm/Booting and Documentation/arm64/booting.txt
> @@ -827,7 +828,9 @@ static void do_cpu_reset(void *opaque)
>                   info->secondary_cpu_reset_hook(cpu, info);
>               }
>           }
> -        arm_rebuild_hflags(env);
> +        if (tcg_enabled()) {
> +            arm_rebuild_hflags(env);
> +        }

We certainly are adding lots of wrapping for this function.
Should we handle it just once in a header instead?

> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -241,7 +241,7 @@ int sme_exception_el(CPUARMState *env, int el)
>   }
>   
>   /* This corresponds to the ARM pseudocode function IsFullA64Enabled(). */
> -static bool sme_fa64(CPUARMState *env, int el)
> +bool sme_fa64(CPUARMState *env, int el)

This function should be moved as well, as it's only used by hflags.

> @@ -25,3 +26,12 @@ void arm_reset_sve_state(CPUARMState *env)
>   {
>       g_assert_not_reached();
>   }
> +
> +void arm_rebuild_hflags(CPUARMState *env)
> +{
> +    g_assert_not_reached();
> +}
> +
> +void assert_hflags_rebuild_correctly(CPUARMState *env)
> +{
> +}

Do we really need these?  I would expect the tcg_enabled() test to dead-code-eliminate the 
calls...



r~
