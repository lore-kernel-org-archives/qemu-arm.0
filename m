Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp411402ejb;
        Fri, 17 Feb 2023 20:06:22 -0800 (PST)
X-Received: by 2002:a17:902:fa10:b0:198:fc83:9139 with SMTP id la16-20020a170902fa1000b00198fc839139mr1576899plb.55.1676693181916;
        Fri, 17 Feb 2023 20:06:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676693181; cv=none;
        d=google.com; s=arc-20160816;
        b=nG1eeMzLyq9nxpzp3Db2NvyKOFCbqL2MtRTRrj9PkcaK+hbokPtNgXv4+ehES5jqq8
         /P3ODYycMpNhUcwyG5bym4NgGQjvAW53N5RJvsRuz+QXN2YpP5FC4bQhUMakd1Zww0LY
         JrF4Ju5hYIS5VzfS+rzXC1bP4wzZJpYw29B0qvw/AGFs+nwk+EBhGVkuPmWQbUQSvlyX
         mTrgOT2fUCKOKAjoaYDsGDffTYT2hOZQpKIO3DJLIcXIrmKbpLPgHhIpqwhVfbLqWXLg
         GTYMoKpw3t10LRXTSHUPelurw3sSyr40DC3dr8mtfUrHrBDeugb8SFv/mYn3bc6lGCvO
         HC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sMDE//UU3GUzbWwdbUFu3wTvWpuScNkiJjr6FYi3mj4=;
        b=NPI/URzPPrRdbBvIvP5xytbf9zndmLnq1WC++n+jAsTub058ZBTLHQehZ8pbgrYBOV
         9ZYK7wrDqKBvRfrI37eNINPlJPuYnyOp3eqf8XXxtvdHryZ1vvjMRVaHibX3ors5iufS
         zMNxOTsMJXdXSHBTX+z747BcBH4RCQj+Cf2fgb3eCyn8vc7a2gzDzfPIKR0XuEGMw6Q1
         b0vsghnQCowf31NQQUuYDmbcEBNt6gUEe5XovnPtCGnEie5wKkfudBPfPlg0kRoRF8Kq
         pzgM6eX7B6n6RX8GNQVP7d6c2oiGz3WBiotHvBR8hhFprB9oeEJOM6uLpHLJAR6ouM9t
         cXKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+mQCgBS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b16-20020a170902b61000b0019ac76a59b9sor2964688pls.169.2023.02.17.20.06.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Feb 2023 20:06:21 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+mQCgBS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMDE//UU3GUzbWwdbUFu3wTvWpuScNkiJjr6FYi3mj4=;
        b=G+mQCgBS8uX9FDEOS45fhqMBid7PwLAXllFrlx+RhWWZ2eNf6P8iq0eBA60slk8pEu
         rLkwiQfHBX0mz+YRwhpCIVQp1ubK4O9+n3t7FdYBN4fijaxbnZpBrE2XqlHB2EZOA3G3
         jSqxKjG0wJirGKJSqJYiPoTGfr+MAQfC2DpEbfWQ/R8Xf10Qf5jZv2pg0G7ZhLsCDC/D
         AKXDhIdmPdHgY+ggx/eCl97TczSTENrf9f+k+dR6O0vBr8lfyInNbtil+yrzbiiPGrzR
         vetLqsSwii5TzEDolvF1xmITG+EFhFKgGcIuqE+pqyYxZQKjsyp1i6+gh2xqNHfW24J3
         f8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMDE//UU3GUzbWwdbUFu3wTvWpuScNkiJjr6FYi3mj4=;
        b=G6dwCNh7xClIp8bcs03Obh5B7OpZmx34cZWG/33/AiLBMZKCpNyijSwTBh4ii83wDm
         ExIbfL5BhL1S8xUl6vRAu5TnsN5O33hybEDjImPTZ59dhku1KlfpH96ypau2qYITZfSw
         EeK/zzo7iTT96ucU47yrL5LRD7e1HAAjJfohHDzXmoaTK4C/c6B5XOHG28Ya+g0mcn/i
         aQHRkBvtMitkhQZq07gUdNq1StG9TzaMBw4raRqwQ216JRX5/ORIO4M/YouYA3gNXaX8
         V+/nlDUsp2e0GaCEr3KDUVM5fKn6XwmLr/HnKHwUbU6JbJqwS6BsarB+shtBF38jxOcs
         spog==
X-Gm-Message-State: AO0yUKWLCbnTP1VYFIQgkB31XkrmR2vLb+CmRtkykqotuV5GzBPqVzgR
	hgbThgWhLcIFN8valQ0AXGuwYrI7
X-Google-Smtp-Source: AK7set/4qFkXywfm5vXzeee39z6n5SuYYjEm2278nm70gPueyy/1RgEosvF5m/5aBGBradECABHCmA==
X-Received: by 2002:a17:90b:388a:b0:234:116a:e172 with SMTP id mu10-20020a17090b388a00b00234116ae172mr2883414pjb.27.1676693181395;
        Fri, 17 Feb 2023 20:06:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id fh4-20020a17090b034400b0023440af7aafsm3600893pjb.9.2023.02.17.20.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 20:06:20 -0800 (PST)
Message-ID: <cacbd830-a6e7-627c-f31c-6d4b13f64b25@linaro.org>
Date: Fri, 17 Feb 2023 18:06:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 06/29] target/arm: Wrap breakpoint/watchpoint updates
 with tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <20230217201150.22032-7-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217201150.22032-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6lv6tbtPLAFG

On 2/17/23 10:11, Fabiano Rosas wrote:
> This is in preparation for restricting compilation of some parts of
> debug_helper.c to TCG only.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Dropped r-bs because I added a few more ifs in debug_helper.c
> ---
>   target/arm/cpu.c          |  6 ++++--
>   target/arm/debug_helper.c | 16 ++++++++++++----
>   target/arm/machine.c      |  7 +++++--
>   3 files changed, 21 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
