Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2080003njk;
        Sun, 26 Jan 2025 12:38:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmZRlpdJFeTO1THlPdnsCwMKDVbfZDGY/lwZa401XTsR9ZNZzClO9NRcn2GvaZre18ZTK9fuKeYzgZhQ==@linaro.org
X-Received: by 2002:a17:903:2312:b0:216:69ca:770b with SMTP id d9443c01a7336-21c3550eaacmr638110355ad.12.1737923895368;
        Sun, 26 Jan 2025 12:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737923895; cv=none;
        d=google.com; s=arc-20240605;
        b=Vva/OffEcczWsNeKtkfyOO0Mapl0Squ3JIFETEMmg8jryWveAlsVFW+D8G3Z6uNWl+
         fFQJm2Awu1SwaVOIyWfX3VtZau1EwMw7hohyjCe7tgBOCRyXxqa7DGviOLBRN3vdK2iS
         o/JKwXB4IBOcBPye1tp0YuEaIbhAONm9jXdQYQgRCYqM1UuF2cE/amKrD0J6MJNoAUVu
         49Bd4eiZN6hwDbeAT9rZJA43jhdDJQ4/iIx7u2ijv3M4cghNQDah44+kmdFUZSQNZ5xx
         9WTxYK4sV7U/QgZIrRRJvtUNzQb2BLOzTrUQqE/woGoA52vacmNy/V6aJa3Ex8Gxb8m1
         q4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HVPb45ZdRMqIKUAi6GudayI0aNfKV1cv8oTD0Mxltf8=;
        fh=95jmS+poNjwmSDC7QoDvdBnUnCuajLXeKx5hnL/lDLU=;
        b=O4KcDibDB/V9j/tNXGaKdOgcIh+jPxGqfkD0nZpBPq6rc2MPt7b7APb0rN2bcIeLrK
         V2/+U5qPJFKq3M0zzp9bxkMB6vFz2u1ou4phOtTtrslPA3jU/4PdohGCBuVh45wNVGNo
         GPLHuP1trPcsVM0RAOVNOGztDLR95pFRwgL5SqV8Is/nw82AdDy1VMt6222u9DxBCFKs
         S6KiqpCMkUq3Aa5wdWbOHHYH0BJeVUsGRA0zeEOA9Ack19jEk0e0LSyf1naNdqpfxDfi
         Dj7kDeiIpxUgbsX1QY6a6UtA/4jRiSqWXjsbyAgK1vG54sBP27eti/sk3mW+cZWPwT4o
         aLGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCsZLQ7U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da411379esor49841735ad.14.2025.01.26.12.38.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:38:15 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCsZLQ7U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923895; x=1738528695; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HVPb45ZdRMqIKUAi6GudayI0aNfKV1cv8oTD0Mxltf8=;
        b=xCsZLQ7UYebZSYUVBmRtgWvbI5WtC5bcYmZxBRo8HhGuCSheGNBhGg3pJWk43XC0gJ
         f/Xasa7cjZ6jwoCudY1+ajYj6QuTLIpMmvMZTL6f1zk4TNI5k+eQOyGtRKK25Usd61NA
         h46EcNUGJrgzOdlN9RAmbApp6mrwb+p7nyBbsmjZWttib1BO3zPXCyHWlFcUQXX1h3KH
         ywxC8ffx5L3EzaMgogXWdzqvBiO0Q29S5UQ4kRp5c9J8YPzRVDE/079RDhNEILM3hFez
         zTmYohTNRYbu2NsVp9wbPoif+dN8xxVWtmMPc7sfJ0l3vXCx81Xl0kXkoVIx/KwmP9uB
         49iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923895; x=1738528695;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HVPb45ZdRMqIKUAi6GudayI0aNfKV1cv8oTD0Mxltf8=;
        b=sp7STsB2mWk0tGJcZZ0Bd400C1/2aTxj2dERVa6qNH4DoV/hPsPFjfF4O25YbcW8i6
         lq/c5CpPYhBgNxOiFGr0M/sIW8MIQKloK1B1BPq8hThsoiqI3oF7mz2zIQv4oJH5Lw+Q
         tqbj7heYBQhJ2WnJvMu3Iu9HSub51paXjD47cylikrNJd9xz4J2/8Jn/QYO7jM1lsvu8
         gQSly0Lz8aDy6iypF5K2pH1z3qC8C5aHKhMWLcHE/kFZStKWEab8+OxmsSM6Hyf+mcYC
         2pXV5GHVfVgdur4EnMDMVrz9TFSYMl/lq4qsZ3+gJOmc+tiHscHAlQykUkFT5TG5rqSk
         7DXg==
X-Forwarded-Encrypted: i=1; AJvYcCX0oj5rolP0wpVR+swSoxorU5ecIYlMW2bgmg91lY+me78pSfSRcGSg17Br6fY9954CD4BGYyYomWAHKw==@linaro.org
X-Gm-Message-State: AOJu0Yzj8eenWFCoqSMj5Gu4nAhcpQQvnXWjE3XebyJPbf6e5fOUF3ee
	ES+tSaSLrcCHzuPyLt42hQbU+GpWC0KynCQbJbrOz5KEABq3P+KROrBorY/96Uhsdg==
X-Gm-Gg: ASbGncvbBGTjHPYQvn7zL13QdKL/pkQpArW7GEfnixYCymIozGdJO2AQ/NS73amoEzy
	4+/J5XS7Sy5glSg4pogeUKaWxsugnEiwl6y13V1FuwEOmPCO4L01zpi1oBtCnNPzfUFGOz4GBdb
	GGyrXy6wWYkM+DnOrN1dMZUWzPNXr7y7wrGYdnNo70Q9WF/DcoUt3b83mO0Bz67gB0GhzCsWG1m
	cfrlLOGvh4hcXfMjPu061EXCE4sfeQdZCkeIsnUHjJaYxgxk/fN6HPyTKAou5s64FZkldVhu6ga
	2MRJzOBl2c7nYTEc443tX/R7oReaO5Xit4m2PyILr0Voo1Q=
X-Google-Smtp-Source: AGHT+IFHGSYkE2gK8J+M4s6UHrhYt2yFRPQZ8hFQm3oPTcuYK/Fs6x7qFNLpzA/inMpx9KuBn36otA==
X-Received: by 2002:a17:903:41c3:b0:216:61d2:46b8 with SMTP id d9443c01a7336-21c3555eb72mr575490595ad.23.1737923894867;
        Sun, 26 Jan 2025 12:38:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9b8e0sm50214325ad.40.2025.01.26.12.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:38:14 -0800 (PST)
Message-ID: <36f6337f-f076-44df-bbb0-29290a010b1a@linaro.org>
Date: Sun, 26 Jan 2025 12:38:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] accel/tcg: Rename 'hw/core/tcg-cpu-ops.h' ->
 'accel/tcg/cpu-ops.h'
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-11-philmd@linaro.org>
 <d81542e9-bebf-4f5f-a911-8ab7b6180d4e@linaro.org>
Content-Language: en-US
In-Reply-To: <d81542e9-bebf-4f5f-a911-8ab7b6180d4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vVnn+vSN9p/h

On 1/26/25 12:36, Richard Henderson wrote:
> On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
>> TCGCPUOps structure makes more sense in the accelerator context
>> rather than hardware emulation. Move it under the accel/tcg/ scope.
>>
>> Mechanical change doing:
>>
>>   $  sed -i -e 's,hw/core/tcg-cpu-ops.h,accel/tcg/cpu-ops.h,g' \
>>     $(git grep -l hw/core/tcg-cpu-ops.h)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   MAINTAINERS                                            | 2 +-
>>   include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} | 0
>>   accel/tcg/cpu-exec.c                                   | 4 ++--
>>   accel/tcg/cputlb.c                                     | 2 +-
>>   accel/tcg/translate-all.c                              | 2 +-
>>   accel/tcg/user-exec.c                                  | 2 +-
>>   accel/tcg/watchpoint.c                                 | 2 +-
>>   bsd-user/signal.c                                      | 2 +-
>>   hw/mips/jazz.c                                         | 2 +-
>>   linux-user/signal.c                                    | 2 +-
>>   system/physmem.c                                       | 2 +-
>>   target/alpha/cpu.c                                     | 2 +-
>>   target/arm/cpu.c                                       | 2 +-
>>   target/arm/tcg/cpu-v7m.c                               | 2 +-
>>   target/arm/tcg/cpu32.c                                 | 2 +-
>>   target/arm/tcg/mte_helper.c                            | 2 +-
>>   target/arm/tcg/sve_helper.c                            | 2 +-
>>   target/avr/cpu.c                                       | 2 +-
>>   target/avr/helper.c                                    | 2 +-
>>   target/hexagon/cpu.c                                   | 2 +-
>>   target/hppa/cpu.c                                      | 2 +-
>>   target/i386/tcg/tcg-cpu.c                              | 2 +-
>>   target/loongarch/cpu.c                                 | 2 +-
>>   target/m68k/cpu.c                                      | 2 +-
>>   target/microblaze/cpu.c                                | 2 +-
>>   target/mips/cpu.c                                      | 2 +-
>>   target/openrisc/cpu.c                                  | 2 +-
>>   target/ppc/cpu_init.c                                  | 2 +-
>>   target/riscv/tcg/tcg-cpu.c                             | 2 +-
>>   target/rx/cpu.c                                        | 2 +-
>>   target/s390x/cpu.c                                     | 2 +-
>>   target/s390x/tcg/mem_helper.c                          | 2 +-
>>   target/sh4/cpu.c                                       | 2 +-
>>   target/sparc/cpu.c                                     | 2 +-
>>   target/tricore/cpu.c                                   | 2 +-
>>   target/xtensa/cpu.c                                    | 2 +-
>>   36 files changed, 36 insertions(+), 36 deletions(-)
>>   rename include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} (100%)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7be3d8f431a..fa46d077d30 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -175,7 +175,7 @@ F: include/exec/helper-info.c.inc
>>   F: include/exec/page-protection.h
>>   F: include/system/cpus.h
>>   F: include/system/tcg.h
>> -F: include/hw/core/tcg-cpu-ops.h
>> +F: include/accel/tcg/cpu-ops.h
>>   F: host/include/*/host/cpuinfo.h
>>   F: util/cpuinfo-*.c
>>   F: include/tcg/
>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/accel/tcg/cpu-ops.h
>> similarity index 100%
>> rename from include/hw/core/tcg-cpu-ops.h
>> rename to include/accel/tcg/cpu-ops.h
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index be2ba199d3d..8ee76e14b0d 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -22,7 +22,7 @@
>>   #include "qapi/error.h"
>>   #include "qapi/type-helpers.h"
>>   #include "hw/core/cpu.h"
>> -#include "hw/core/tcg-cpu-ops.h"
>> +#include "accel/tcg/cpu-ops.h"
>>   #include "trace.h"
>>   #include "disas/disas.h"
>>   #include "exec/cpu-common.h"
>> @@ -39,7 +39,7 @@
>>   #include "exec/replay-core.h"
>>   #include "system/tcg.h"
>>   #include "exec/helper-proto-common.h"
>> -#include "tb-jmp-cache.h"
>> +//#include "tb-jmp-cache.h"
> 
> What's this?

Aside from this,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
