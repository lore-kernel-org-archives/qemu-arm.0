Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp31344ejc;
        Wed, 22 Feb 2023 12:35:04 -0800 (PST)
X-Received: by 2002:a17:903:18d:b0:19a:6c77:3eed with SMTP id z13-20020a170903018d00b0019a6c773eedmr13793783plg.25.1677098104647;
        Wed, 22 Feb 2023 12:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677098104; cv=none;
        d=google.com; s=arc-20160816;
        b=RDsMYS2OC/Dn3evSUOcDZ6JdztoBIJHPKMuFb4bcWXKBz8fl4mMxZ82wdqBsCOZwcw
         BHC2PrZ7p4t8KASkOi3k74YPTr/0+z/tDEM0aq09VwthGWgPV/IssUeNhGLQeOIO7rMq
         ITHgnzTkPMaCKuSb9pgXIah5NcU20rbLux2rHV3kxiGXliEdV+1pBoGt2cxaCzEpPvKg
         gAEDA4qRybhPhpCgu2KwT7nue1Jy3l4W1TYfxs+5pd7OCMikWUDp/l0hgddcOjXlHbub
         tyyk+yo+F1z7spZeM20Qko91mH3fYPvxQm5Gs8Hz6TjNj0xc5otKtYixLQo7qFdx5wek
         Mndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ytgFRrl7ujTpQT6iPXJ4l8eWZR8tUL4l+p2NMJaEEHs=;
        b=kBPIVAIeCEebw913PsU0ARzI80h2C8xBMwW9mtafJ8xQ4EF7dTRiGuflt+9+hjXL5U
         CXOQkBaE8SkHM8tMRAYxzVpuVyGF+4/MFejT6xMvybeZcEVByxq3wpd+C1wkesAAxsp/
         NWNFh77QxWcO+5M6XWatxw4knhVj7C3bZFY4sg+2kvLBq84O8p+z8ioU+8o7ZUy18Yj1
         duyyqEmDG+AjBrSaxwBHqIGwASscb/kW0vjmzo7iIuxDVtVlf4bwrrQ4EAcIuhwffqqM
         XkAkQxtGv5n38tevFtoj6FMAMfCgU7LNHW0nd0wADE1MmHBu++AGnFGHBiSYuoxVWvsZ
         TOaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JUTov27O;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z8-20020a1709027e8800b00198e0ec8e40sor4681984pla.122.2023.02.22.12.35.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 12:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JUTov27O;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytgFRrl7ujTpQT6iPXJ4l8eWZR8tUL4l+p2NMJaEEHs=;
        b=JUTov27OvRuYE2F19JWmbAyj1sH33A76qyMmECheJfSgdiJNvloGmp3XhJqL/+OD71
         wlfF0fO2dvPxpkHB4Wjhl/4ZQ03OnL9gT1vkn0TXdyNBDqlBDHieZrfFEH95MwcLAOL3
         QOC+aRGEYOSIYzH5GzAbDA7ghmlxRl+zPF+XYvpMZQvxw7Bq8VKuQt0jwyYo14skvFXJ
         tVUR3rUOZ622CywxqFSCwxmSIFa927HuX23RqLaMtw55fCfMU0VlCF2fjnBemDOvwNd7
         khVMMnjMz6oIiU4YISWi4bmHcSAdqKNdcdl2T6xcPWVOFpuFg54MFJucWsLtmr0fWYiG
         RYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytgFRrl7ujTpQT6iPXJ4l8eWZR8tUL4l+p2NMJaEEHs=;
        b=6tP+L5CrLrqhpHCVarJk5N8uzi4XlS6mWZrCcvSKyX+bVSlO683PYq4GQgHnt8L/cT
         IV3q6QZRqTn6GG/UPG4fsnaDSeRoLQUNUh8EdtnYif4BCeKcp4xEvNQAXBjrRcML72GT
         DZCrLh5Pj7+VOmqzYMK0faGw/rroJb1plKbiqz2OPqKMBfNzQ99IavcJL/roNpV2TT1u
         9/ltmxVWDPTKPcngfTlkuS8K1oAsVjgfE0mKrxzeX65G2yU/JHv8wB87daA+HncaBD2T
         J/fPbiSPiKRB/3NWYLN3IXAy2qQNR3VGQqtg00kDaAE3/k45OZQUZND/7x22RM3xnX1r
         RM8g==
X-Gm-Message-State: AO0yUKVZC7DN+oucc+nzw3buoSym/37lgg4A6//6grb+i36AZitYuBZn
	mP76dKJIfLVOKoiUbFJ1MYvrnht6
X-Google-Smtp-Source: AK7set87XzFHVRqJQBHua2964GxM0/ThSBIRysmURJ+fYF0e55mSBdLA7WY8dHh2J5wwMbQwPVs4Vg==
X-Received: by 2002:a17:903:11d0:b0:19c:b7da:fc44 with SMTP id q16-20020a17090311d000b0019cb7dafc44mr1164654plh.34.1677098104109;
        Wed, 22 Feb 2023 12:35:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902c10200b00189743ed3b6sm1794025pli.64.2023.02.22.12.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 12:35:03 -0800 (PST)
Message-ID: <24860a73-b1c9-3f3a-1c9f-44ba9803776a@linaro.org>
Date: Wed, 22 Feb 2023 10:35:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/7] target/arm: Implement v8.3 QARMA3 PAC cipher
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-3-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-3-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: c1MD9fSGjXUI

On 2/22/23 09:35, Aaron Lindsay wrote:
> -        workingval = pac_sub(workingval);
> +        if (isqarma3)
> +            workingval = pac_sub1(workingval);
> +        else
> +            workingval = pac_sub(workingval);

Braces required for all if+else.  Multiple instances.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
