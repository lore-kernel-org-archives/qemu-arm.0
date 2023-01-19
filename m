Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp598863ejc;
        Thu, 19 Jan 2023 12:20:02 -0800 (PST)
X-Received: by 2002:a17:90a:ce81:b0:228:c8aa:b111 with SMTP id g1-20020a17090ace8100b00228c8aab111mr13052418pju.25.1674159602714;
        Thu, 19 Jan 2023 12:20:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674159602; cv=none;
        d=google.com; s=arc-20160816;
        b=s7EWzIGPKhJ9+/9Q1TB+G5uzJvkta9SihH9P4HxRBMc11Vys7tiydqCdjfaue8/7gN
         JlfGDNG+JpOI4IWzUBAsfTbRxkkkryaZfrMUw1UnVCDCSGxJgtYHQfuchb/poYW8v2g9
         G5In43eQ+LLOl5T/k5MrwDSJqVSXX7/2j3JofS8LcQJuq5hv/01CRxdhmhrOQZh3pLI5
         J9x2w2RMWk61+MWfunEB2E7IyKXwBuLahuN9+9RRBkIyqaaEyjFp43QDGPe3IxfzvI+7
         YHndiBqpMYncGkShe2eEt3eFdHS9Az40WZE+wmhTgcbMu592UgWOQECYGicHr6a2pXPX
         DIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qDEPZ9c1isVtSzeWj/rSxR8HgWG3faQQ5ZvSq8wlgd0=;
        b=CzyVvErtSIESE153o47hKnBr6Wzvp1iQJgIwfYoy7ONRR3oG/sFVL5WiNy/6wkGMaY
         8VogrBLpahWsYq1rMm0n2Y+r7lGoTyMENwkSlpXZZwkp1H67qTEBRTttDMpzVbKPWuIT
         IJ5YZD5KfqJc5lh2UBqBXvjlYbPU3LJ06CRHogSwD6kz1L+/Kl91d1cMiZPmZ+/qQOHG
         xVHjjms5QROAsT5RJ71ncydrKU62xsaZPU5GAqzbufYMYZS8DRaCyLESZNMyt9rCCapV
         qiQ4sATBwg6DdugRAunEHxmHj/I1c6UIVg+gbIpTA8pQzRHuden1zryo+tbMU1ntdm+A
         97Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=auF4XVSj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m5-20020a17090a3f8500b002292a1c786asor59458pjc.17.2023.01.19.12.20.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 12:20:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=auF4XVSj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDEPZ9c1isVtSzeWj/rSxR8HgWG3faQQ5ZvSq8wlgd0=;
        b=auF4XVSjI5lwvXUVrNoC5q6KGvWjvRTI9peqmGPG1btlYt3ty3+W5nNRplRvv+I1Lq
         etgeKEl6gu8OzOWFNO+AomF0SF1ZW8jnrkJmxjFeDaX9zbvCIz5aHSnprhTb5T4VDyux
         vREX0K+1UnV66GnB+VW9/rmATKU+3S6Y1kbEz1tQcCqnnLR4xQjvqWLH6ZQdbE2f+BRb
         2+sPvBmdwP+EVwUqZtq58z9yCBILJFt8SbccJxWBw1REKZPhloE6iuOjjIK5dO3a1ygS
         1A8+0L9TvjZNRdf35xB8kyOnObXGizcqIxuQPB3S+suFiNDVraZ31P3337mAjYaYtQZl
         SIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDEPZ9c1isVtSzeWj/rSxR8HgWG3faQQ5ZvSq8wlgd0=;
        b=fc3FQKr838M5gn8NzckM7eJJopMtoA7ylYfF8Strct6NvGeqFQmDtNYcthoV44kdBL
         jNReEk2gUYIh2tzujxrKXstcFaapwa62zlMx2USJ8A18TPcYzQ+ixaJ7vesJbeY4q61h
         6Vbt/B6TIfVhCqsWT2poOauqb7Vz+w2NWLG94w44LkoxuxMAnh42jFM59GxoXsZf/MyS
         0+EuGA/OAP7VX/P2FF/z9AwocB5wmAWKi3GfvqQb26ZlPlvpYRbZVbCz67qjZltZNffI
         UHLGiEtd48RGSLciZbQ7q2UYWabwwP0jDBz9aFo6Nw5sR6kSaVWqMcidus89ICESocCH
         88XQ==
X-Gm-Message-State: AFqh2koRe5tHUx3sFIfzjZRnCdYwCK5i+RwbwtF/UTzHpyfIGPbazJEt
	lOydLPzLoXw69uyRMXf9mQNcN5e7
X-Google-Smtp-Source: AMrXdXt7Qb0TyPCF4N0ejCqNvWD95lZndAQD0kgBOEeMQNBIxB27x4Hb2HsxzwDBMXEOHAok3mdbvQ==
X-Received: by 2002:a17:90a:fd06:b0:229:9ffe:fa7c with SMTP id cv6-20020a17090afd0600b002299ffefa7cmr12619603pjb.12.1674159602288;
        Thu, 19 Jan 2023 12:20:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a2c0400b00229ff1fd7e0sm56403pjd.14.2023.01.19.12.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 12:20:01 -0800 (PST)
Message-ID: <235622c8-5f08-33fe-c1fd-a39b4ca96175@linaro.org>
Date: Thu, 19 Jan 2023 10:19:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 03/15] target/arm: Remove default cpu for KVM-only
 builds
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: x8GT8ABhnLZm

On 1/19/23 03:54, Fabiano Rosas wrote:
> We'd prefer if the user always had to specify the machine and cpu
> options in the command line instead of relying on defaults.
> 
> Since the KVM build already doesn't work with the current default of
> cortex-a15, remove the default altogether for KVM builds.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   hw/arm/virt.c                  |  9 +++++++++
>   tests/qtest/arm-cpu-features.c | 12 +++++++++---
>   2 files changed, 18 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
