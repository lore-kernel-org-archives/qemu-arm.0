Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2016213ejt;
        Tue, 28 Nov 2023 08:32:32 -0800 (PST)
X-Received: by 2002:a05:600c:35ca:b0:406:54e4:359c with SMTP id r10-20020a05600c35ca00b0040654e4359cmr11743293wmq.19.1701189152146;
        Tue, 28 Nov 2023 08:32:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701189152; cv=none;
        d=google.com; s=arc-20160816;
        b=ul3TQ1MNR15AJZ7wyDXbL97OPNabklTXqYybgMl7nJIgHKxrQk3yK696HbgpcKRfnX
         bg3JSzUmAmjm0xenOEP7E7UVVsUEf0aRC2paxk2/O2WQRWXgJI1LPmAt4TIGg/j1hxK4
         6sHwEQKRnEXcwcjGZB+ZrTW+9BLTD/kSBY73/UlWUCp4paVWD5LHnumxC+At2YwLhIcg
         RPBM8m8vZckVG1q7oHQNcXwav0A8tqhYwh5bomQzvllAFI8fxb0Ltta2t8T78T2pBvNI
         QkpD3R0KQevvBJQf7cgBnoQrl64sgyVs8LLqAadLhpJ5EyoUCncIOC0C9KHqUPjzGdcn
         TD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bNKRMYmINpsSlrXvXENhkC5ZeItWHoTEmmBes48qrjQ=;
        fh=0PiXrqXNrhndgO9P7fMsY/SPFyqx+rAyQ0oZtCVnfiQ=;
        b=O+iqwrYY0vaBzc9uKKAX5g7p/wJ6irRj/jiEeNp416ToOTr+xv+4qGOCeoRaScVwi8
         ZunyEACb9z8ZAsgWK4IBUVdtkx1EQthtrDhMFxhgI0zmxUa9LGGR9quAt8ZuaQAQidGA
         FIZspvsBQnKyC6a03PVNQimZEE5RtdFYY9KLrH0qBUzFj6CK4C3E7B+2OL6GgHlp378I
         ZMBR2SuhllD+/fTtNKTCf9PfY3Evzuc6Fccor0F9Fwe9NhSyLhjrN5SNmeGNmwQjU4CK
         Hui0sJHMtbK4CEQpJJUDXRI8ZJGnxfvHkvIZCDkcLZh8AzaMJ3c8yLd6guRp2qej/D7A
         IvwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YfpbfIvF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x17-20020a05600c2d1100b00407a3d45eb1sor3236450wmf.5.2023.11.28.08.32.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 08:32:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YfpbfIvF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701189152; x=1701793952; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNKRMYmINpsSlrXvXENhkC5ZeItWHoTEmmBes48qrjQ=;
        b=YfpbfIvF78BkVvQeNEZnCC0yL2DsqNPQAb0/SuyeX2CYo6srEbO8Bj6pB0mQ6OGKJx
         uNlDAri/POpy/frarRfr/S4NcUEIaZ07HFDc2rvyduEJ/KHw4p7T7aulC7Zx8og4ervx
         SeiiMujcnKfUEwn4sqWknwuKbXocz7hj8gYMJGrHIBSlcvDWy8OlBlm7cWWQjIQLANfm
         R8SUVbXIVgfEtezJA7tXh7OqBY/X+SYSoRjVsPSCsCugc+oVg4IB5mIeIQZ8fCadrO+3
         uUxT/Feru74gDl+udouHs0OXwcqEV1BnGybG3w2xYxzX+WZLJPW5qXMI0DYPmeTvzwEC
         6kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701189152; x=1701793952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNKRMYmINpsSlrXvXENhkC5ZeItWHoTEmmBes48qrjQ=;
        b=Fn/ffieaKpjgPhilcFl+O5i4N2+zn59fz0usZ5fIv496bVQ4c10d7D1iQScCKvHXBi
         XsOP07EysLxphnVYGy/H4PU/33+luEhosB828blNgAiLNRCDaIAWhGWoj6PU+L4kgokK
         d+8YSStqtcUguizcqcu+wpNxb2l8jCtIu9aAu5fZZbZnr2YSRSPTTdIn2q/aE40dSZ38
         6b05ytL5VF8h4meiMp93zdRUU8TWcxTNJ2dVB/mleqSnNMk1ScCJQuqzAM9mVc2OPlRL
         q4oKGCRNuJNYEEuz0btc+cGIwNRNDG/ByKsO+u2hMIniHVGDm0UyZZWeVsNVDq4OVvuS
         JrHg==
X-Gm-Message-State: AOJu0YwEPaSN7qVO8Kfoud/wGlm416q20YXpyixd6iHX5+4f+EXHwxKs
	hr6ZDH2u6hiQlVQTTjFwb5Z+s5nj
X-Google-Smtp-Source: AGHT+IH8D04lQywwrCC2NBcXK59xPLsh+brirZkYcvwGzWujioOkIG3NIdhKRYLvK56uNi4GSMdcuw==
X-Received: by 2002:a05:6000:401f:b0:332:eee9:6e7f with SMTP id cp31-20020a056000401f00b00332eee96e7fmr8793270wrb.56.1701189151745;
        Tue, 28 Nov 2023 08:32:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr. [176.184.13.61])
        by smtp.gmail.com with ESMTPSA id df2-20020a5d5b82000000b003317796e0e3sm15189715wrb.65.2023.11.28.08.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 08:32:31 -0800 (PST)
Message-ID: <45d6b8c5-9499-418b-873b-bc408c796d70@linaro.org>
Date: Tue, 28 Nov 2023 17:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 05/11] target/arm: Move GTIMER definitions to
 'cpu-defs.h'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-6-philmd@linaro.org>
 <74fee177-71d9-4303-9692-b4a496047a03@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <74fee177-71d9-4303-9692-b4a496047a03@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pc7BFE0ZKjTh

On 28/11/23 15:02, Richard Henderson wrote:
> On 11/22/23 12:30, Philippe Mathieu-Daudé wrote:
>> To allow GTIMER_* definitions to be used by non-ARM specific
>> hardware models, move them to a new target agnostic "cpu-defs.h"
>> header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/cpu-defs.h | 19 +++++++++++++++++++
>>   target/arm/cpu.h      |  8 +-------
>>   hw/arm/bcm2836.c      |  1 +
>>   3 files changed, 21 insertions(+), 7 deletions(-)
>>   create mode 100644 target/arm/cpu-defs.h
>>
>> diff --git a/target/arm/cpu-defs.h b/target/arm/cpu-defs.h
>> new file mode 100644
>> index 0000000000..1ad76aff14
>> --- /dev/null
>> +++ b/target/arm/cpu-defs.h
>> @@ -0,0 +1,19 @@
>> +/*
>> + * ARM "target agnostic" CPU definitions
>> + *
>> + *  Copyright (c) 2003 Fabrice Bellard
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-or-later
>> + */
>> +
>> +#ifndef ARM_CPU_DEFS_H
>> +#define ARM_CPU_DEFS_H
>> +
>> +#define GTIMER_PHYS     0
>> +#define GTIMER_VIRT     1
>> +#define GTIMER_HYP      2
>> +#define GTIMER_SEC      3
>> +#define GTIMER_HYPVIRT  4
>> +#define NUM_GTIMERS     5
>> +
>> +#endif
> 
> Hmm.  cpu-defs.h is pretty generic.
> Without looking forward in the patch series, perhaps better as gtimer.h?

- target specific parameters used by accel/ (stay) in "cpu-param.h"
   (Ideally the single header included by accel/)

- target accelerator implementation details (stay) in "cpu.h"
   Shouldn't be used outside of target/

- architecture definitions in "arch-defs.h"
   (used by target/ and hw/)

- QEMU specific implementation details in "cpu-qom.h"
   (mostly used by hw/)

> 
> Is hw/arm/bcm2836.c really "non-arm-specific"?  Or did you mean 
> "non-ARMCPU-specific"?

I'd like to eventually have it instantiate a CPU which is not ARM based.
