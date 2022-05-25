Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1117128lfh;
        Wed, 25 May 2022 11:46:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:1485:b0:518:e601:dffb with SMTP id v5-20020a056a00148500b00518e601dffbmr5822269pfu.38.1653504359800;
        Wed, 25 May 2022 11:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653504359; cv=none;
        d=google.com; s=arc-20160816;
        b=CW8xP04u1e4ez6/vHnDkPfWtvuqXu0dxpCiS3nTpMihNqn/A+fMQ4wkIRKM8laxkkr
         O2PmTAfhYi7bkRpxr7FufzjHCSvEdCm/5dBzpv6aLaAwfboIDh/EepSWYbc+yMTIGeBg
         qqU1PG0CJhKmxjLYnRUaYptaCg3VStPK36IRqIWo4Zp055xtWo5vpxv+FDK+UsD6taUI
         TO8aHPtelCfhTR4D1ONrauYDcnXOJRwJWhwkmNjO8txqX5MBi1ut3BUnSyTrgvGNYlOD
         9H0OCev24lUdze7Y6uBcmwzv9dIG1wlQ/fmOKbn1SYFCH4bp3FuHDDBrcRivDLjTvbuT
         tLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IcIqUraCI1NPmU+tCziApz/bOxvyZa4HP/5o4vY+DjQ=;
        b=Xnllmy2/85Z24sqplhs29jzAjfxkxTVaTJuZCMXZ5gsXP0EswgjBlcMKBklKSMyFmn
         fB3YomESNu3HSb6g5Z07anaC9o1tdYHeg8vrpW6sqkL6r84Mbo5y85r8r79Zrb3p+/og
         pqy3razDEIGNajLVnrZqWYpWaWyMg781eaDlHqXdmhEUaJ6zFSIe1hO9X/YC6XBJZI9y
         L5MQwrPTok7aQfNCo5GHPnZn9NxwMh0UhuyBR1ceM+DyPoZ3MQzbEQWfxcXBPhu0l0kR
         aL6g8ztZ9rblWlSapyXtzDrJOTm8WlJGII3xdgOiq3CwGKnncDDmHjdVSTk62IV2eQ0D
         7ssA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ONbP/RSA";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e2-20020aa79802000000b00518948e7dc1sor5853744pfl.41.2022.05.25.11.45.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 May 2022 11:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ONbP/RSA";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IcIqUraCI1NPmU+tCziApz/bOxvyZa4HP/5o4vY+DjQ=;
        b=ONbP/RSA5dx+INjpInxpmNzjsjyvxuOpGxB7ztZW3I5SRUrhKfmWehAxSipIlOFPI5
         AuN/MEFZKoMpD/l2FcgFM2AXxJ1qh9q2pHNlfzifmHYvizdtTonaFopTtAplz/CQWRQQ
         i2J0oOLJM3NHNg6IpZeM3V9xP1qWj2cLyQW+JJlVSifhDXVLIiLF7e9QjfqeEfs+6+jI
         K9Sg6eQGVy+SCQaRA9OZQUnxUAzfnWZgIZPoMcPzMeeEmdCVcPA+aknUIADAy2bor/7G
         mODvVa97hYD11GdYoPN03DPXF2/WHuXEPs7/vfNFi3q7oFKj0Mxc1NG4BsInFYT6hPo/
         pUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IcIqUraCI1NPmU+tCziApz/bOxvyZa4HP/5o4vY+DjQ=;
        b=L+Su8bFMq1D8ejzAeRfTs/4jUsSfjcsresEHdjpz6gFhLCFQ6ep+a1EBamSaXFBLZR
         igtE5ajiu4MZCZivVsaTUOE1RtWxXlYhfNTeuQ+vDYMEhbdZ0eHo2CTCf3j+9nIosC1G
         VFmRUT8uxA7Fy5dUdP6pps8IuqdKgt1Ll2fwfveRmWmC90k4YkvzViQJ6aLge5AtsWCD
         CVxlaFMCxU709AIBgBN8OCRgYvo6J8QN+/8Pq6UErM0biLvMffwhwO1RfkQLhKmk2GQF
         lx9rnmhnMXa4vMyZE1seXZL+V272MUIRj+f4SurpQ5sf+tuJ9M2i5Ho1f/CE0n5+K8zW
         bxdg==
X-Gm-Message-State: AOAM533LTKby7n64Xka5e40ooS3LRY2UxUXLjwW84iqgGGYEX4cOEEf8
	NfwDhxfDnLANDFiXQNkRNnCbP2lp
X-Google-Smtp-Source: ABdhPJzF5Ix/JnoKuwWyGwyVFMjkRVqJV+nW8A1XYpi2TAYlfNs9iyhztWi3ttTO63kYHufOBmq5Dg==
X-Received: by 2002:a05:6a00:138e:b0:518:86b6:5214 with SMTP id t14-20020a056a00138e00b0051886b65214mr22229740pfg.38.1653504359338;
        Wed, 25 May 2022 11:45:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.6] ([71.212.142.129])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902e5cc00b00161a40b2135sm9758862plf.104.2022.05.25.11.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 11:45:58 -0700 (PDT)
Message-ID: <b864b8b9-e88f-788b-6011-abd2b750b949@linaro.org>
Date: Wed, 25 May 2022 11:45:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm/hvf: Include missing "cpregs.h"
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@fungible.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Duncan Bayne <duncan@bayne.id.au>
References: <20220525161926.34233-1-philmd@fungible.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525161926.34233-1-philmd@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EaZL2xEGb3TI

On 5/25/22 09:19, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Fix when building HVF on macOS Aarch64:
> 
>    target/arm/hvf/hvf.c:586:15: error: unknown type name 'ARMCPRegInfo'; did you mean 'ARMCPUInfo'?
>            const ARMCPRegInfo *ri;
>                  ^~~~~~~~~~~~
>                  ARMCPUInfo
>    target/arm/cpu-qom.h:38:3: note: 'ARMCPUInfo' declared here
>    } ARMCPUInfo;
>      ^
>    target/arm/hvf/hvf.c:589:14: error: implicit declaration of function 'get_arm_cp_reginfo' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
>                 ^
>    target/arm/hvf/hvf.c:589:12: warning: incompatible integer to pointer conversion assigning to 'const ARMCPUInfo *' (aka 'const struct ARMCPUInfo *') from 'int' [-Wint-conversion]
>            ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
>               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    target/arm/hvf/hvf.c:591:26: error: no member named 'type' in 'struct ARMCPUInfo'
>                assert(!(ri->type & ARM_CP_NO_RAW));
>                         ~~  ^
>    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/assert.h:99:25: note: expanded from macro 'assert'
>        (__builtin_expect(!(e), 0) ? __assert_rtn(__func__, __ASSERT_FILE_NAME, __LINE__, #e) : (void)0)
>                            ^
>    target/arm/hvf/hvf.c:591:33: error: use of undeclared identifier 'ARM_CP_NO_RAW'
>                assert(!(ri->type & ARM_CP_NO_RAW));
>                                    ^
>    1 warning and 4 errors generated.
> 
> Fixes: cf7c6d1004 ("target/arm: Split out cpregs.h")
> Reported-by: Duncan Bayne <duncan@bayne.id.au>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1029
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Oops, sorry about that.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
