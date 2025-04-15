Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2476174njc;
        Tue, 15 Apr 2025 00:20:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdTUI/39NGnn77yO9sA2LS5MHvhdP7xgqLcU5nyy2i6tOsDZzkIIsMmvPTTsd5Y97oWX77kZNneiA9RA==@linaro.org
X-Received: by 2002:a05:6000:4285:b0:39c:16a0:feef with SMTP id ffacd0b85a97d-39eaaec76bemr10911873f8f.38.1744701657703;
        Tue, 15 Apr 2025 00:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744701657; cv=none;
        d=google.com; s=arc-20240605;
        b=JEr95VVIjRWDeN8EBmUN8eeLAUpb+xsDnG4P9CY8/dUtt7y4OLpyK63PLTSAZBIYA0
         Ae2Q3z8ZwuNLu/C1wcwSWXGjMHbJJY3/q42aPGsGKAJ0oWMYSeiIbk0aoL/UVNv2eYCC
         dnlijps00b3WZckXO9p4FJxHqTGmiVFok0jRiMGkytCiDszWvumeh/jbKVf4iH1PQNN3
         /1+AHluXTjX+TVfhvqmEsiPMx7FYs+3Tn8f3nC4brbVvWMteZhF3BHPLseJr7QP9tLJ8
         eh5OY23tNVGzfauiuKsx23+W903C3bZRzib4RjczpDYMfOYbvlCC4yVMlhtpx1jURJxB
         Fkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hH8+sIlY1RoZcJVObMFX4ZA0+K3VlclfSxJRg4vxEo4=;
        fh=jbAN6jvg2DeDqZMabpjlTX1ym4ml9mKtjNT9stBBRXQ=;
        b=Bvwn78TGkxWb5/ilWOWtTG0Mdea0A01Lj++GyioxtiqGb1u9CfZAHycWzht80euqgB
         6HExamsb0Y+4GHSYk1Wqx/vfDsX8o+PGsi6QgTtDUtOi0DmfocJ++hEvPF3LrUR/Qbap
         YuHWwzjZfxceb4/Gbdd7F1bW9+evtogtl9fX/2kveNd+rfEz4PM936EWjckpf1aYJ4hu
         88ZYMVP1oXm6iAQ5eygMffT1fPrLRU5F0JD0yY+rUMblb4FndZHHqIuwwHzc20IqtO19
         h0lqDEGh8Q7cMz63VnsZL49yFR/1l87inBfIbiNJP5Yrz8St0VjlVhSa90ReRywXXjyZ
         3/yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cG1nEC/f";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f23380fcbsor67501965e9.2.2025.04.15.00.20.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Apr 2025 00:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cG1nEC/f";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701657; x=1745306457; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hH8+sIlY1RoZcJVObMFX4ZA0+K3VlclfSxJRg4vxEo4=;
        b=cG1nEC/fMvjgs0obs3J1wygt0BpqT2ik6xwxMrWC/8fofc1aSpRM+rC+Q8vAX59x7N
         hQQDQOCSTbUCgwIcBpGrK9TWvDJCXaKUXGw63JLMD7OGAt5XKPV43ii/YeFCOISh4agS
         OhGW5bEKA2uvVu5erlMvdddKTn0PPoJfRV8JIea/BwbDsiSEztjqHgDIFNrVwjBRdOSN
         Zgls3m66NkPEJ9/8HU2RTturZIvJgzVUNPiTdEogFNUM/wg85Vc+TUtadp7SYOkejf+R
         qK5Q9BCT6zJ6IBHyfWqpDcN8y33SWnM6kJ8sSaeDxK+rRxbUamMDCGq0S66aLHH0Ml43
         SOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701657; x=1745306457;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hH8+sIlY1RoZcJVObMFX4ZA0+K3VlclfSxJRg4vxEo4=;
        b=qaAQHTOPIUkmXfziZjojKRfEqZDvc9V0M8dMXyzFpTBxz2uNBbTnYTyqT3Y5Mm/sBx
         L+9QUDN0u4kIQ0FHMNCwKHzmB6AiLEelEwCtA26fB5z/lcFTe7r5urQ1unlK3lRfiLxH
         M+RfL8eObIcvVg2lpbbkfWZ9G3BLXjW2F+yUnVpgPnb6r0HN4/G7779oUGoNIOgstFSF
         UC0vBA6fWQ8LD2+rZEYMKzNKmU5jk2j6eSnKB7u1qnXweYUL0tKXNSlqiJ+KY4jPROlH
         HctTD7tf6IiChaKq+sbxaBfrhIyw6e9muW2Nb8pgBWgdU8IHi663dZ/Ztq0VVc206PMO
         Ih7A==
X-Forwarded-Encrypted: i=1; AJvYcCXCcHmHs6LDp3bqwD74mRj61ld+P7h7zhE6HEx5VXqdgteEtPK0IiyhYe++R9XuQSRpROrvtwQ3FmekuA==@linaro.org
X-Gm-Message-State: AOJu0Yyoy7Zy1nDrWwt+pdIxmwdXflfsvisHZ+5HXevTolbt6lz9UCIT
	yOcO0dIGq4ItX+670Ss+j2egWis8foxNaPEyx1tVUQstQaKsE8Q2rKoG4e2NcDMqUQ==
X-Gm-Gg: ASbGnctcTvWgBh7herpB9KGD0tqKyvXy2ZNpzB5jNR6RG/JYFBpyH2rNTXKtfO0EcAK
	f9WHsi2/SEgXJxb24AMznW/F+d/gAvW1YHTybWj7iqRxA7EwhBqEqpmnRoTHJGdMdN0LCdguZ4S
	4nZxPtghm8CpmRZwxA6LX45wzr64QtWYelVsrfRCE/Ifox4zl52IIIadiz3yDUH5oULddLJDnH+
	DJWdCicIRzuz0zeB1Sxmd6W+J29FZOLZIiDKofGM+7sU8jsKmlcMvdWZpWY/KnGlv4LrCc40MDt
	LLml3GMADTpPEAYFaKYCwkMjEdn05h6h5Pvi8a4S/e5XoGvF64wTauTBbe/Vb5Dhe4En2yMBbhq
	dxyzMT6bz
X-Google-Smtp-Source: AGHT+IGMKQVqURwl9R+Cxj7iwnbtFUMFNP8OTb/dvkhY2+jVXZZuTDzVjeEZnPKZQibjq2fpiV5KdA==
X-Received: by 2002:a05:600c:1d83:b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-43f3a9afdeamr152724645e9.31.1744701657130;
        Tue, 15 Apr 2025 00:20:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecb20sm201470335e9.3.2025.04.15.00.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 00:20:55 -0700 (PDT)
Message-ID: <823616d0-77d4-41b8-b8b4-a7830cb8d112@linaro.org>
Date: Tue, 15 Apr 2025 09:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] arm/cpu: Add sysreg properties generation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-3-cohuck@redhat.com>
 <0fb4cd74-bcbf-4063-bc3b-0e8359d04117@linaro.org>
Content-Language: en-US
In-Reply-To: <0fb4cd74-bcbf-4063-bc3b-0e8359d04117@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0NIb/w/OGIGr

On 15/4/25 09:09, Philippe Mathieu-Daudé wrote:
> On 14/4/25 18:38, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Introduce a script that automates the generation of system register
>> properties definitions from a given linux source tree
>> arch/arm64/tools/sysreg.
>>
>> Invocation of
>> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
>> in scripts directory additionally generates
>> target/arm/cpu-sysreg-properties.c containing definitions for
>> feature ID registers.
>>
>> update-aarch64-sysreg-code.sh additionally calls
>> gen-cpu-sysreg-properties.awk which is inherited from kernel
>> arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
>> the original author of this script.
>>
>> [CH: split off from original patch adding both sysreg definitions
>>   and properties]
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>   scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++++++++++++++++
>>   scripts/update-aarch64-sysreg-code.sh |   5 +-
>>   2 files changed, 329 insertions(+), 1 deletion(-)
>>   create mode 100755 scripts/gen-cpu-sysreg-properties.awk
>>
>> diff --git a/scripts/gen-cpu-sysreg-properties.awk b/scripts/gen-cpu- 
>> sysreg-properties.awk
>> new file mode 100755
>> index 000000000000..76c37938b168
>> --- /dev/null
>> +++ b/scripts/gen-cpu-sysreg-properties.awk
>> @@ -0,0 +1,325 @@
>> +#!/bin/awk -f
>> +# SPDX-License-Identifier: GPL-2.0
>> +# gen-cpu-sysreg-properties.awk: arm64 sysreg header generator
>> +#
>> +# Usage: awk -f gen-cpu-sysreg-properties.awk $LINUX_PATH/arch/arm64/ 
>> tools/sysreg
> 
> 
>> +BEGIN {
> 
>          print "/* AUTOMATICALLY GENERATED, DO NOT MODIFY */\n"
> 
> Should we keep copyright?

(if so, preferably as SPDX tag)

> 
>> +    print "#include \"cpu-custom.h\""
>> +    print ""
>> +    print "ARM64SysReg arm64_id_regs[NUM_ID_IDX];"
>> +    print ""
>> +    print "void initialize_cpu_sysreg_properties(void)"
>> +    print "{"
>> +        print "    memset(arm64_id_regs, 0, sizeof(ARM64SysReg) * 
>> NUM_ID_IDX);"
>> +        print ""
>> +
>> +    __current_block_depth = 0
>> +    __current_block[__current_block_depth] = "Root"
>> +}
