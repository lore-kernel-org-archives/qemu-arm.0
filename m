Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp717592lff;
        Thu, 12 Dec 2019 06:36:42 -0800 (PST)
X-Received: by 2002:a17:902:6b4b:: with SMTP id g11mr9799454plt.196.1576161402254;
        Thu, 12 Dec 2019 06:36:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576161402; cv=none;
        d=google.com; s=arc-20160816;
        b=vrlKHHjwWZVBDaviiecaQhvEgbKEdg0300M5hPjL5fly9EUoAIJHfEgaPmaC0Suy/5
         d5zvDDx08rbb4H5W8WOK8TZ9rbjlpN88fJ69mmBN7MGrkSN6Nb1rb22vHIK7vfS8HUdO
         cdPh10xeFBv+NtsiZ70eL1qveUX57gHvakedetI7BmSbOjluULLKLg/+/zV+b3PZn2Oy
         X9A/wwgCZJHzfLlAWcT148LpPv03Uc8DFV7UUi0xBhxh+OlhBHxbyc9eRIzud0ALVolv
         g6CcInmsPY+A+Ilpi4CA0R664IjO76RcoM/bORi6/ndnAjLmRM8TXzScARR26bosihdC
         Es4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4I97tvfKMitrkdF5Fr4FiNCpy5zuXp19tZu9yklSAnE=;
        b=HsUsX38RUQZANBxZxcCYnbFQdWZPkCa4lsxm/2sZMeiPa+ek+iqRopindJs0qPvZNk
         v/sr9Gayq0RuDTYeovfIBoUaNCsc0AHgx7mHReyRpd3jVFUDGeC4iCynrxZXH4WFy/7x
         KghvaToiJgmFlhF7syTpKSqfXfKmE2siyksj+G46GthmWb3mMrSQN6BklW38/zCkezx9
         zuO57bzFDUDkNVT3ItY1G7xMlQ40fs29E1mAc/KI75pVH3zo/UWAuaIQ+TKtimKvH+rC
         7R0M4y8dfxnBmWpGWxMOdxPHBWthnNK//o9DMcRS2Qq1hhDWla/kN7hs0rAu0x0KxCmD
         iBgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RRSwl4xe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bg14sor6821030pjb.24.2019.12.12.06.36.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Dec 2019 06:36:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RRSwl4xe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4I97tvfKMitrkdF5Fr4FiNCpy5zuXp19tZu9yklSAnE=;
        b=RRSwl4xerrREgUaHPFRGjdEwLZkWmMs/7lhrhHm9aK3lT3xF97ub4nfb2uRMwGB6Ro
         IBUzG5MPZesDWl7qqgHkQGGifBxYUnGzJjSqQ9dsfmaPAVMN3F37hip/ZExT35+X0JND
         Y5GhaITJjSIAbEixIOgPTLh4KZ5fSOVucxLDX8P1OBB47kGBFUBpr0u4rpgkRa1pwKwP
         AcIiBhPbH9jM+A0VOs4X96j4vz55KJcmuWt5d8UDHZu4+QUs1HcnYHPE4KJ4SsdlSaUO
         RXeJo4kGi8VbbQeAgP2LCGO7nGlMcpkNEywDOLHcsNLWOQfJYUU2zx7b8MW78m+lVjd7
         UDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4I97tvfKMitrkdF5Fr4FiNCpy5zuXp19tZu9yklSAnE=;
        b=IwdQmWW+k89gjlSFF5116d4fBJggfUEfnQJtPkGZFUxGGopvDHodCWM0w78sO3uijA
         2nOiRE4lfuyVE+Sw4Ev34v+6XNeamR8g0hwV9oEvrBDbhewNra5jxouNh271J9bSOIjI
         1y7VfK3nnKLzHwwI4tX+qVDLItOCIxrdhuDb1YWCmD0fOZ7T/k0RB9f+dHk0cdcDjcle
         wi2lP4aavfD2Y5WTVBSo3+WOvhiYiCph1PmXbWR/ltGOLteZfB2MXME1udBVlMZbj5Kv
         izy0wRoD4xSGCrjnBYB8VNL2x+PD3NjXV1w2vqFMY9e8qggRuL1juVlR+8Rs+F4vM73F
         0OWA==
X-Gm-Message-State: APjAAAUY4xuuy1gL1VTCHfljR/Z4D0qVOdfBv8jBmyJDxg5OT4V3peYw
	Cw4hkdbLtrMfTdyOSMUCOiVTPcFbjiD3bg==
X-Google-Smtp-Source: APXvYqxxo1ASiEzsNJ9CH27e7rE/AOGr3L8o63vdY9YD+vKSoO5S2to2ES5hdun0/P2lgx5GjCpGeQ==
X-Received: by 2002:a17:90a:e4f:: with SMTP id p15mr10084854pja.90.1576161401735;
        Thu, 12 Dec 2019 06:36:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id k6sm7329224pfi.119.2019.12.12.06.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 06:36:41 -0800 (PST)
Subject: Re: [PATCH v2] target/arm: ensure we use current exception state
 after SCR update
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20191212114734.6962-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef020327-44a6-0267-2048-9feef99c1de8@linaro.org>
Date: Thu, 12 Dec 2019 06:36:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212114734.6962-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RqxSKbrqI8Qv

On 12/12/19 3:47 AM, Alex Bennée wrote:
> A write to the SCR can change the effective EL by droppping the system
> from secure to non-secure mode. However if we use a cached current_el
> from before the change we'll rebuild the flags incorrectly. To fix
> this we introduce the ARM_CP_NEWEL CP flag to indicate the new EL
> should be used when recomputing the flags.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20191209143723.6368-1-alex.bennee@linaro.org>
> 
> ---
> v2
>   - don't override a ARM_CP_SPECIAL, use a new flag
> ---
>  target/arm/cpu.h       |  8 ++++++--
>  target/arm/helper.h    |  1 +
>  target/arm/helper.c    | 14 +++++++++++++-
>  target/arm/translate.c |  6 +++++-
>  4 files changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


>              if (arm_dc_feature(s, ARM_FEATURE_M)) {
>                  gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
>              } else {
> -                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
> +                if (ri->type & ARM_CP_NEWEL) {
> +                    gen_helper_rebuild_hflags_a32_newel(cpu_env);
> +                } else {
> +                    gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
> +                }
>              }

If you tweak this again, an else if would be appropriate.


r~
