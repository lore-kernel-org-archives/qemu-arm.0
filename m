Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp484387njc;
        Thu, 14 Nov 2024 10:59:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzHSQVcWPQKNaAfiZliDh+b6duULB+w3A432Peb1DBCI2KIlZzkfwct7Xptap6DwyxeGk4lh5Nac33lQ==@linaro.org
X-Received: by 2002:a05:6a20:9188:b0:1db:ee36:8fb4 with SMTP id adf61e73a8af0-1dc228961dcmr38928085637.3.1731610762891;
        Thu, 14 Nov 2024 10:59:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731610762; cv=none;
        d=google.com; s=arc-20240605;
        b=WvAN33KKc9fPTT5UxF+WwohGIBpOsoA/helXO0HG/DVf6BbIaBPRNSsFxl8Afj1VTg
         gB4v6VSnryyWI6rU7RoTS4y1feKgKjqiGQnDACdfsT1awbZIgwE2MI+G2cfFqsk6/xlB
         kLyVin/CTloblLmvfBtyQx5LydcVn30JHLSgD7qa2ez8MWMxb97rIrb/4/ifTG51pkXh
         zE4VGwKJd2S6b+NMXhCtiMNMAe2uJCY6Li8cduMEqs7j8GYdsyyBR+r5nMT0F+WHP8E1
         yqRDnVEEThAZi5niQYl9zOrQchDKGBGk3N/aYNtKsaBEoOQG/erHvl2HCfKS1CPshtgi
         Rq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=URIf27BMDWz/zZ/r2hCSZpn4yj54Db/MC3Z3NDMOMzo=;
        fh=6zkXp/hcTu+4WrBJ0i4LJwR0/RmvI+a56OkJ2WDernc=;
        b=gP3wgEtqsVN9QH+vcAMJ4K6B999B78wXuVEdcV0RRLdYFnyELmGQkA/AOnhBbuotLa
         UzYRS4Y7jujG7Kx92PNLaBS10fVbYGG6eWQr5ziWBFZ+OPuWXCpbAWMKpghy4v1wp68p
         0lMwzam7UEWj/6pobDac60ZoaoziTapYpnHZ+r5i9ckXlNnfNP9Jry3bb1JVMHN6FQ/j
         KVyk/TH9+ze6sYqT46OabAoeayMY+1NWHsRSG7RU7rUTfntmIhdVmZvPd96u0TJkIe90
         paWa4VXDI2p+Y7UPcZ3j+wsL3bujmxbq1AJaPepmse1506GnSRAk/FF8sYFuG1a4eXKP
         bbgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IRNMi0+S;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7f8b3a336bbsor968707a12.6.2024.11.14.10.59.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 10:59:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IRNMi0+S;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731610762; x=1732215562; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URIf27BMDWz/zZ/r2hCSZpn4yj54Db/MC3Z3NDMOMzo=;
        b=IRNMi0+SxfB0ZijdwhaL11RtJGONYHSDJMdRj1oN5smsGr4PJz9W4Kh/wlwlepUHd6
         YSu1igEH6aAtuHrLqGs6SdH0VA5sw6FeoCqvxzSFqzWfUklsV09JhvPgcr5Zhir4idNQ
         za3zMU/lTpu8vrSyirQ0q9p0NYQin7us1Ug3b8tASo0WGULSAPs2vvc0B15BysXQkFWl
         XYuaWZXJIiVcy+cy9wtaXVNitXPJTB9QA9Cd/yjUfuRgcHQz3faz9PYcdh3UaJOcQ3Qp
         D6+4Yi7t1yYGklj4jtZX1CNISTbtxUYUOhaS4ujUB4DjiD8Nx8qwZGdAUErz6MokLHWN
         NwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731610762; x=1732215562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URIf27BMDWz/zZ/r2hCSZpn4yj54Db/MC3Z3NDMOMzo=;
        b=DDoEFIWryF/zZqBA4PSR5k7EKSnj3ECVxGD1OYLSClFT3RvVnNlvavSp1T1MCE4zBN
         HD4ovsA7NTmgHALHL+sGQqWadN+CGsBp1RoxExUxqXx5nIDLKNuCXqISiOn8AICB4eaT
         Uss0dNLfVkIJ04I/xH+s+ZliohsidzgV/CWuQTDwY4BPMDhuUINSAlxCfi/zpYLd4XrL
         z97HPK1lnMe/JnLHVGJUZRSxUn7I1iKd0gMwUKYxcOQ1kqSDlN39i53eDOAtz9dFGnBU
         2taw9xWya9RlRvQsc5xaQUAMX6mPJNvjGjofGCW7VBvSRcYvjFCSCxEiclNjP1tDdDaT
         sBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJfnWFGGmDsX2jeNguZ6pkqo0F7QELe82HOuf70nmurZBeAS4XmCZ6Xw2h6/7jyOGCrSaUQna5sXmFJg==@linaro.org
X-Gm-Message-State: AOJu0Yywnsbo2Rlo71FQkwPpc/G38jfAfXa2tvKbJnB8r/qJqe7CXujH
	lJ9Cnn+67/UGzK+7gJbACnvVPX8Fi8idRWeHMmNh7H+WZS6+vXJ5Aylur1MKyizafA==
X-Google-Smtp-Source: AGHT+IGw4aiMg4SBCO50N4PjhLOiaZtixPRJtiTqAdcZnNeXjDwiLkCbsQ6JXSp4cgZfdwGsfMO1Cg==
X-Received: by 2002:a05:6a20:8421:b0:1d9:c6e8:60fc with SMTP id adf61e73a8af0-1dc228931b2mr36495412637.6.1731610762399;
        Thu, 14 Nov 2024 10:59:22 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b37f8640sm1423538a12.49.2024.11.14.10.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 10:59:22 -0800 (PST)
Message-ID: <3de882ce-a6cf-476b-94e4-210b2dd6173c@linaro.org>
Date: Thu, 14 Nov 2024 10:59:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] linux-user/aarch64/mte: Include missing
 'user/abitypes.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IFVKpdNPKpZF

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> abi_long type is defined in "user/abitypes.h".
> Include it in order to avoid when refactoring:
> 
>    linux-user/aarch64/mte_user_helper.h:30:42: error: unknown type name ‘abi_long’; did you mean ‘u_long’?
>       30 | void arm_set_mte_tcf0(CPUArchState *env, abi_long value);
>          |                                          ^~~~~~~~
>          |                                          u_long
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/aarch64/mte_user_helper.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/aarch64/mte_user_helper.h b/linux-user/aarch64/mte_user_helper.h
> index 8685e5175a..0c53abda22 100644
> --- a/linux-user/aarch64/mte_user_helper.h
> +++ b/linux-user/aarch64/mte_user_helper.h
> @@ -9,6 +9,8 @@
>   #ifndef AARCH64_MTE_USER_HELPER_H
>   #define AARCH64_MTE USER_HELPER_H
>   
> +#include "user/abitypes.h"
> +
>   #ifndef PR_MTE_TCF_SHIFT
>   # define PR_MTE_TCF_SHIFT       1
>   # define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)

Or maybe just switch to uint64_t.
This is aarch64, so it's always going to be 64 bits.
This is private between the prctl syscall and gdbstub.

r~
