Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp651855ejq;
        Tue, 16 May 2023 13:15:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:4312:b0:fd:e806:9c95 with SMTP id h18-20020a056a20431200b000fde8069c95mr46271452pzk.13.1684268125205;
        Tue, 16 May 2023 13:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684268125; cv=none;
        d=google.com; s=arc-20160816;
        b=j/xcxbJ3IRu9Whv7mhRrU304ywlk+esJ0QkIrYePxwgXb9m9D2HmLZnEsRMaHxuFB1
         T/02YL5Rp8byTWMov4phMZXBumMnTCLiHTEzhumvdVawUyx6fNGfVQd0j0T/tNlZDizU
         Sd72EKxxe/6U1Lau29jou+gyu2e6Rq+noApXyNktBxsEguz0WC9BVXkm1ddgMobUWPxj
         P3o5gz6ZuLw+Th+HodLNoQYrjTyemUD6pXSpRV3LyFaJ9l3EFS6Dif0hShqOr4oLZ8nR
         0mmMIw4fwlcRI1BTN5zmeZeqFifgZu1XDsy4w4BU6BVdOP6Qo2OMc1hybIAqbHRRqxok
         WlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6ALXpJK+7DvrwDIzFYeRW/niyeZZakhY3E0cVXl3WYM=;
        b=w8noiwPx9NE+5S5FrZj9N5JfZjyN+dJVxKE0XE7N/RZRB9ob782tTEuPTqxbzmu7qW
         JhUkuPsRGGYujN07ly843MsETfMTLTz118FRzXLuoJYEPVByo4IfQJzdsJ6q7PM5eBay
         bKJI1GTXtmdyH4dNV/533y7kultLhjF3CmjzxdblZ67mY2HvsQ4zh6sSSvgdqqBXuYZ1
         IbuA4S+gcaxMl0KuVh0ckdwhV/Fqlum3MUKte2qGhLq1CXkJ/EPvLcO81/11XnT5gONN
         UoLRLFKpDTTanFcJsIc+MK+FOEiHfutRG79WZKSfIoJ/KyT1pyPtX/bVrTtJsOvk5ZDb
         gmTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TwFDu7rt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u29-20020a056a00099d00b006410a665f89sor15032402pfg.5.2023.05.16.13.15.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 May 2023 13:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TwFDu7rt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684268125; x=1686860125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ALXpJK+7DvrwDIzFYeRW/niyeZZakhY3E0cVXl3WYM=;
        b=TwFDu7rtTa6LjGV++Bmgn0r85y2wxsc/aPLH/Zpw7De2yW5hH+Lg/QO/5yERz2kUY4
         ebJvrPOFPO9yz8+fcNr8S9q3e6fCXrac1l6ohI7dA7QSg816wFMeypJ6C4MidAcnCtsT
         zZ248FZwHW6lY7ePbckCNCv835K8u3Cmvt0w2BEV7Z06OB0LDAMt0PchxgOFaQLEzBbg
         /4lzU5rLBWwoHKY0YmirOMPdiRMw7GSph1os+jWA5YXrDv+l/ywAzD+N+UR2bvA8oulL
         j4t3kbpu3WDXsoPxIlll0MkOiutVZZ4SHsccRNacd5ACaP0oyVRE+ILNYtTZ8i5K/gR4
         630Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684268125; x=1686860125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ALXpJK+7DvrwDIzFYeRW/niyeZZakhY3E0cVXl3WYM=;
        b=e12naM2oVK4nxUbEqEwlrfShE7NpHTfV7C2E3vd4/rdjrWWhSaJXTLgjBLpRHV3MNS
         iPj7i/pbltzjDXk7CLMHoW6+TVQS6rG95nAeZHQzECoXPUu3nnom5bsauSW88v664kbl
         SYclGL3oBBs2QAwfJDbLr3G+75GDQeSPvFy99k/PtY90Ps7Wyr9q7Ms6kQbIjj02KwtV
         p25QD7qANrkeU8+2I06EMgP34USw/47jsXd8haZ91Pgi97N+9Vq6/udJFqVP0inqsUCf
         t52H4AwxEgmtA/ajxhrYFtJ1ARjTGtMEJD53ZCvWh6+euPfqJNpjaZ5WjQbVtr0ZZjBt
         jOnQ==
X-Gm-Message-State: AC+VfDxb4dOiwk95CWTaQ+2vqzVVRHUAVd8g8ZgyzPQffKVpXWQhqQck
	lCmhsVo2dMcEGOu7oXI+ELrkh9u10piS2YbhpHRD1w==
X-Google-Smtp-Source: ACHHUZ4Ve8SjrPj1cbkCmbn54jgjwpggfpu5pCqPbikKnjRUM2L9WXbSWXX9SP/P5C9hviilOsMZkg==
X-Received: by 2002:a05:6a00:2408:b0:63f:18ae:1d5f with SMTP id z8-20020a056a00240800b0063f18ae1d5fmr49249310pfh.29.1684268124728;
        Tue, 16 May 2023 13:15:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:ec81:440e:33a4:40b9? ([2602:ae:1598:4c01:ec81:440e:33a4:40b9])
        by smtp.gmail.com with ESMTPSA id x20-20020aa793b4000000b0063d2bb0d107sm13886101pff.64.2023.05.16.13.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 13:15:24 -0700 (PDT)
Message-ID: <91729126-1e70-2d80-88f4-c636199dba6a@linaro.org>
Date: Tue, 16 May 2023 13:15:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] target/arm: add RAZ/WI handling for DBGDTR[TX|RX]
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anders Roxell <anders.roxell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230516104420.407912-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230516104420.407912-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gmJQfvEvIvHN

On 5/16/23 03:44, Alex Bennée wrote:
> The commit b3aa2f2128 (target/arm: provide stubs for more external
> debug registers) was added to handle HyperV's unconditional usage of
> Debug Communications Channel. It turns out that Linux will similarly
> break if you enable CONFIG_HVC_DCC "ARM JTAG DCC console".
> 
> Extend the registers we RAZ/WI set to avoid this.
> 
> Cc: Anders Roxell<anders.roxell@linaro.org>
> Cc: Evgeny Iakovlev<eiakovlev@linux.microsoft.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/debug_helper.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
