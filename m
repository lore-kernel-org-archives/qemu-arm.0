Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2471685njc;
        Tue, 15 Apr 2025 00:09:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkfHc5nqKbyWuCE0cL/RlJtJuSXv9Z+uSQONlwKsByrXnxoRrfuB311dlR1/BPWxmWQknsCaQIalZcOg==@linaro.org
X-Received: by 2002:a05:600c:384b:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43f3a9b1564mr170974975e9.31.1744700953118;
        Tue, 15 Apr 2025 00:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744700953; cv=none;
        d=google.com; s=arc-20240605;
        b=Cy7xOYCt3KK8qAA4IymeExoV4lylmyojbaI6Gm99yxPlJwcc1M00ZdJsMLCGKRb4NF
         Ym3p03Oihx+oZJn272flganH4GhiftEH1AcejwDfYDZ3hH1O3ZKSSOLOFkUUFdVeer9N
         adInmZNMZpgXpjzjVSPScVX/PmtK8nXxaOMTEqdm8uLAwAnUyJ1CsGYepZTJnsWmRGQw
         HoeMZNKCtxVW5Lxg4Gsg1E14Ls1qodPHXsozPNucRwXMiSeLJSwPnryW0tdJWK38c/Lb
         2maSjMZpl/VdxHCsQXfujjuI4OhyZQSyPfiydA3e8rOWCE2r3c2BaaGFcicVT28l8Lqe
         AcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HQorS3qs/9wF+hxqJeIyqNgmDflvogIXAEEo0HyX7cg=;
        fh=R7T/p++LYe2ZW5XG1ATMo6ApFG6FzhKm3oEf7klmOJo=;
        b=hQKN2ZdzxPGsxd7U2qY9i33ryi4BhTGN+FXg3ozRhlCI7BhQxdRX6q5fU/KLR+7geH
         Hqiauzbvy54t1w8SNU6RXIIfDBJmThQpWFGwTQ/nysyrgMZ6B7kck6G9qzG0CDFNitSb
         7NEg3JKCar6Pmeifz92pTP0bIpksK+I7giPUBZ51Olpzsf0q1IBafWt4FN+WCKTKkDjM
         a+fQ+wWMGr1GLb1tsG1ZzxBVFX8QWvAlBshJ693W+USR52uZeFuC9pq8LDe6KBECvAfU
         e+yiwaGBl+uhZdFRGY4CIP5CbkmbhbEvYJRzmYbqbYPYbK+1YMFFFRoiYkg1mX5znBAb
         pZjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSeShalz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f2358fd72sor42380785e9.6.2025.04.15.00.09.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Apr 2025 00:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSeShalz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744700952; x=1745305752; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQorS3qs/9wF+hxqJeIyqNgmDflvogIXAEEo0HyX7cg=;
        b=NSeShalzMLNT8e1S3RYJyeOOBRbdfCzjek9AQ1OdMiZmI4ZxlgdmIvoIbyxIEPFqm5
         2hje1tZhnI82otMd84WyA3acxyj+AOGR701ZPlpUY1g1NJR05slvy7jegdJNycCSt35X
         RDghdZGvPWYWkjdQdxqUTVqsSRlUoehO81j3TyjSucH5lMMBV+gOQvzoc/osg1QZIAZl
         uXT8Lxpa+TJaz6YCZN73u3nBYvmthVuPV6fttjS+87sS51uBIxB0c/FepmRfnNR9G5BD
         BSSxJCDO+judMu6AZ/dPLdMmVWhoUmHdVWEo4TrwAc3OFpwEAlI9roZIBtdUKJZzd4Ik
         7cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700952; x=1745305752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQorS3qs/9wF+hxqJeIyqNgmDflvogIXAEEo0HyX7cg=;
        b=upSoDwFpJfopRK4D7FBadzCiWdTbH0T4tEZBqvc6KQdiBcYbKWPcoI1cyxGxvmlmc3
         v98Dp/i3tWuNVRGFwxFH24L3qn5x8MPUteNV5HRXWFqjBd6OS+RkaySVpyfylAF233jz
         F6h0qAxzpnREBqO024yjO0bg3Dk7bc0W8r09A6XfQ0/Rg6fmg8Q54EPiHQ+qVF9YFNwH
         nWYg7w2smFvHtJZLZYWvp5Z+QkAUYstxDUuy2Andl5mPZ2blvgzJpcDSuRwRgjVrlJxa
         UUym9CyQ8WsoWA1vlnwFl1uAO2+DHPpNR24R194M9AFn4c29hryvZKH6+Roop5vuaTth
         WDWw==
X-Forwarded-Encrypted: i=1; AJvYcCUnheoevk8mxC/CSF5Guaq51nLd3DKcVFhEiZ26ytcsUxoVMoq1jE044w9QKae3SwFkqWEvwXmWMjYutA==@linaro.org
X-Gm-Message-State: AOJu0YxIg+UhGtGSY8Gn0x5RE2reLLhQK6+XZqRe66w3i8ylRZByrPj0
	aj2G6kYDq88tog1/Pty2OIOaDSck1TnS1nakh9hgHpCakMo12lFZH5/g3031eiaUyw==
X-Gm-Gg: ASbGncs15nDN7NkATHzjW2Rdv7qWEvWCjo2gPJa/3LrX/2W/MLOy/qIX6mQhyLt24vU
	ZHLEpIHrdA22g2Y2KazJX8nAGX7QTp+4zE8YD6zxrhrdXs+Iw3nsP1y0cbJMyu3Q973pDQCoBLc
	vUjtnRxksznNwXWdrSykOzIQ0rbIY5pa7IUtRRqfYwrqirUiSrBevRpGf4E8VcNVVtvRtEDd8Am
	/w229g4px461G1hhvHt2E4E/N2sp2RRZAf4Hz5ZDCdJkBsPE1YUcox0u0hoMFWTQnpioIvHLZIQ
	n8ijjD+QJ9COT9TVBFVCZn5nxZlZgxef/9NMPFfgQWNms0GLrO3OdEkNcBMWA9Sir8ayzu/Nvhf
	fQumtEV1r
X-Google-Smtp-Source: AGHT+IEBCb9hNiit5aB+Gor1TQBCisecLYyLH9/Q7InmyAKhQNWL89req9MQk6VcoCy7HxiIPVKtng==
X-Received: by 2002:a05:600c:3acd:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-43f3a7d827emr146771465e9.0.1744700952548;
        Tue, 15 Apr 2025 00:09:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecc73sm201303415e9.8.2025.04.15.00.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 00:09:12 -0700 (PDT)
Message-ID: <0fb4cd74-bcbf-4063-bc3b-0e8359d04117@linaro.org>
Date: Tue, 15 Apr 2025 09:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] arm/cpu: Add sysreg properties generation
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
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250414163849.321857-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: OjHFh/7JQzOm

On 14/4/25 18:38, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
> 
> Introduce a script that automates the generation of system register
> properties definitions from a given linux source tree
> arch/arm64/tools/sysreg.
> 
> Invocation of
> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
> in scripts directory additionally generates
> target/arm/cpu-sysreg-properties.c containing definitions for
> feature ID registers.
> 
> update-aarch64-sysreg-code.sh additionally calls
> gen-cpu-sysreg-properties.awk which is inherited from kernel
> arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
> the original author of this script.
> 
> [CH: split off from original patch adding both sysreg definitions
>   and properties]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++++++++++++++++
>   scripts/update-aarch64-sysreg-code.sh |   5 +-
>   2 files changed, 329 insertions(+), 1 deletion(-)
>   create mode 100755 scripts/gen-cpu-sysreg-properties.awk
> 
> diff --git a/scripts/gen-cpu-sysreg-properties.awk b/scripts/gen-cpu-sysreg-properties.awk
> new file mode 100755
> index 000000000000..76c37938b168
> --- /dev/null
> +++ b/scripts/gen-cpu-sysreg-properties.awk
> @@ -0,0 +1,325 @@
> +#!/bin/awk -f
> +# SPDX-License-Identifier: GPL-2.0
> +# gen-cpu-sysreg-properties.awk: arm64 sysreg header generator
> +#
> +# Usage: awk -f gen-cpu-sysreg-properties.awk $LINUX_PATH/arch/arm64/tools/sysreg


> +BEGIN {

         print "/* AUTOMATICALLY GENERATED, DO NOT MODIFY */\n"

Should we keep copyright?

> +	print "#include \"cpu-custom.h\""
> +	print ""
> +	print "ARM64SysReg arm64_id_regs[NUM_ID_IDX];"
> +	print ""
> +	print "void initialize_cpu_sysreg_properties(void)"
> +	print "{"
> +        print "    memset(arm64_id_regs, 0, sizeof(ARM64SysReg) * NUM_ID_IDX);"
> +        print ""
> +
> +	__current_block_depth = 0
> +	__current_block[__current_block_depth] = "Root"
> +}
