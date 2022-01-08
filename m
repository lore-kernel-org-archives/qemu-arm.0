Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp963000lfb;
        Sat, 8 Jan 2022 10:39:25 -0800 (PST)
X-Received: by 2002:a17:90b:3c0c:: with SMTP id pb12mr16786181pjb.45.1641667165011;
        Sat, 08 Jan 2022 10:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641667165; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVLXNgW0gslu0zwv1ErnK8/QeFQpczFgai/TXTmnEcbnP0EPrQKJSB56xEmRoO1+ym
         UlvDtNjk37BEHQQkx/su9CHQYoK2WiNVCFZtTb4t+cQwZPRocZTOBeVB+5ig+rILNmtY
         TZHkqzoPoVwBOKOrgJN3iHioMaEqD9eoucRXWmuhmFcHZ9vK1lDX5FsxFnjcp4ujeVjn
         pXeVAzHorNRH6zAaCwzPqU7o9xgx9tzWj3LqA1+GaKTGi6JjSC81BCIJkiXjWJH5iBK1
         J+nugsy4WvPA+NEwbp8LopXJ5fyuScSpLgse+tFdSC4mOgGUCgZ7RTMNKo1ve4XTyIW3
         PQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=qB/NZ1C1Y+NFG1J3bxjVFbXXmP/TbmzDAOLXYfqEkwY=;
        b=iUUXklkLlC7EGhcF70EWEa8f2+R4dycbXfzVJu1eWD8hkdZFVuNcOpkY5JY7/hR32c
         eYH9J9qkfnWOUbfWcIlg8Wo/aD653kddv3oD1T59cyKIZ88wDPgEh7IEfreKqOPeBnky
         vzeF8V96KpoexXLMzsYqWvHB1ut3XbsPVJ2yHvrKH14T3A378HvqIoCeYUwcbpqSDLzq
         G/Codd/yNVvzEGi0/sMHMFF5Z0GjmdQn/q98RuOZw/AhiTmUmGDTAif81II/m4n/tJlu
         g9Zveh1ZAL1f1jXTLaVlf7ifir4WF9hmjjJwczrAH+yIS3eOA59Igu4eWFRdBwB30auN
         s9iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p5uNfowF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g16sor744181plo.168.2022.01.08.10.39.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 08 Jan 2022 10:39:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p5uNfowF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qB/NZ1C1Y+NFG1J3bxjVFbXXmP/TbmzDAOLXYfqEkwY=;
        b=p5uNfowFjvbcU7QSPaXerO4+TBev57HpGGShd+cLagkMefxUlJHpoLt8sl/h8EA6N6
         6n5IT/ei/68CMWpodRpDFnfM64N8xsM0/xGXQUdGvUDQKWs1NcH7fshcZDvmy3BmwnQs
         FNydGFLpsCm0YKH2Zw2M063jRA/KWeUz6lEtsH41iIIDiIXdpSCgWmJHUmLWUyZhWOIU
         sv/84vL8wr71/6e1IyYj6hEunbXgVSPDtLQK2U4KIMcg98lprAO2iAFiu0fQOx/6R8KL
         Rs1GRxi3+6/Dqx37eTAWlXgM2A+145TMjKIIl6elGW2JKXGAzA2FuGjsgAlptFzbnwyQ
         lgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qB/NZ1C1Y+NFG1J3bxjVFbXXmP/TbmzDAOLXYfqEkwY=;
        b=iAkedsrABMfEVuDujzcrVET1daRkG8kxpanNfCqih4shLYkZ3aEzK7Xi3ahJe69/C7
         FrIFKnPHLQAsEpCHOuT4x46GCXXN56Jr0Zr30FxxuX+hPnn1tyhKKIZdcqSt8UT6adEs
         YweB09a3oGt+MRmkNE6azH9lbjBVAQF0ArlfBzAdFz9F55YomgJqShQsGLkB6L8z+4qu
         1cbf7w9k0G1tGhOAkRvI0hNWvXjn8fbTv/HjjTmxplhk8HddRoEfQ/9aMe9fgx51Q4AM
         OHJC2l2fWBxNuLky0GDVFFNaDf8cAQNTV/EUC6oRvXVCv+KkZEVaazQq6QiYiYX85RIz
         Q1Og==
X-Gm-Message-State: AOAM5307vL4J6pE83Kf0yB8oHX5hyu2K3pNMGngmGcxp3G6am4Kxsy7g
	cPlepaYJbqeUU+XAIizwTpjqvDpYcLxrUERU
X-Google-Smtp-Source: ABdhPJxY7botuxnhf+jcGYMwB2shbyGFUqus04na8RhuCKeWW50MVoiB6dF1Hfymj+3BySmmW2eQ/w==
X-Received: by 2002:a17:902:8b89:b0:149:9c7d:2fb6 with SMTP id ay9-20020a1709028b8900b001499c7d2fb6mr45834040plb.68.1641667164484;
        Sat, 08 Jan 2022 10:39:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id np1sm2719425pjb.42.2022.01.08.10.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 10:39:24 -0800 (PST)
Subject: Re: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alex Bennee <alex.bennee@linaro.org>
References: <20220108150952.1483911-1-ardb@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ff1fd702-957b-5ba1-9e31-3e58819d8774@linaro.org>
Date: Sat, 8 Jan 2022 10:39:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220108150952.1483911-1-ardb@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: xxo3O1CJCphx

On 1/8/22 7:09 AM, Ard Biesheuvel wrote:
> When running under KVM, we may decide to run the CPU in 32-bit mode, by
> setting the 'aarch64=off' CPU option. In this case, we need to switch to
> the 32-bit version of the GDB stub too, so that GDB has the correct view
> of the CPU state. Without this, GDB debugging does not work at all, and
> errors out upon connecting to the target with a mysterious 'g' packet
> length error.
> 
> Cc: Richard Henderson<richard.henderson@linaro.org>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> Cc: Alex Bennee<alex.bennee@linaro.org>
> Signed-off-by: Ard Biesheuvel<ardb@kernel.org>
> ---
> v2: refactor existing CPUClass::gdb_... member assignments for the
>      32-bit code so we can reuse it for the 64-bit code
> 
>   target/arm/cpu.c   | 16 +++++++++++-----
>   target/arm/cpu.h   |  2 ++
>   target/arm/cpu64.c |  3 +++
>   3 files changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
