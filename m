Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp668141ejf;
        Thu, 11 Aug 2022 10:54:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5PxKkmKT/o1e7m9icHwIDebcMZ6yzGokvXfb0JHVpQXg/DlulpTaUYkOXyYJvOc1sLKwjo
X-Received: by 2002:a0c:ab17:0:b0:474:8a27:ed53 with SMTP id h23-20020a0cab17000000b004748a27ed53mr67761qvb.56.1660240453277;
        Thu, 11 Aug 2022 10:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660240453; cv=none;
        d=google.com; s=arc-20160816;
        b=wCFtBOzKSE9+88sARjSGOMhKWCb/WqJvoBjabjC/Z3U3gLvU92OWWHA57IIlrp23Kv
         X8J7pOfkhelHbtZ/Ny40U1Qfk4Km/6XM9sq1hhEQHK5C/PyyO+0OVzY1edgpZQHlRsjn
         F/LnW7zZmePTmkF2iv2rVUnIteE9KSHw/dr3WlTBk4xA3kSo4yX8D/SOCkI1qDzCFrgG
         xG0OBnOUqocdWSxDWfUmEUswJ58vEFEro/YNse8mCyBhSoVCvfV6hbEM6iz317dZt2uB
         oxGhScu4MtYp+Sqil7FLBkLSekxECRZnKkiJW1dE+YESzDsm+/yWLZo/oTJR7fi0uLXA
         jo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=HQKmk+LBZ6fW0+fCh+uLp63LKlIoBqsDkchkHUREuYU=;
        b=u1ryiOl5KAJM0mm30BLuzOCLYzZN7Jur9xo1m3ulQZc20D5dzpA+rpWLNr02iMHVPe
         ZWIwBr/I/qXC2hcEyXmWyd/m5+QAneEz5YF+aE9vADAxcear96GXMda88B48EduTEp2s
         akWjb+1QNoqJhAYIyhtjTd3UTwRL5JR3n4mgJOFlZ8Z+bwT0fOKoxpkXrEu4mv/isGoH
         /qnEWE5T99S7qplN3l73bxDcDguspNrDCEmBSB3ZQddB/kcYQ7aWGsESlyq1gyHJ8A22
         LF/zS+kUO3CvlKsU9gjX+VqlsfirPf5Tz0LztFyFEUZZiLVO579ZuJ+xY+T0Nc/XEvJd
         idgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmUXLTZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19-20020a05620a127300b006b99a451d5esi1702839qkl.308.2022.08.11.10.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:54:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmUXLTZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMCNo-00047g-Ox
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCLC-0007VN-Ma
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:51:31 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:38446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCLA-00069H-TM
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:51:30 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o3so17541729ple.5
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=HQKmk+LBZ6fW0+fCh+uLp63LKlIoBqsDkchkHUREuYU=;
 b=gmUXLTZgVIbH+6uGRhXoSAeyXyyiFw3LVebSIr2hzmV8kfcSx0WWcdJvfVupd3Uda9
 HjQiQxxqGiCEUeVT3N+FFc61NbkbtJgT2bOmKuoD+sAhmtgXDmB1Qx4NR5biMY/hidJl
 on6sXRQleYGtCITxuCXIzZhW9055xUCDYnRLpOfCwxVbMV5bk+2erYIUaT7QRGo4TQsp
 zxdDP0Acoa6NaQTvUYz9PSC9dHW7uDh1QZwXnmDAJJtOoLCQhx21wUt52jJcBQmIYD5i
 rcjnUcjMAuSwOjJrn4zmDEbU15g33i/Hny0RcJhLBBZHA9ROpaneQOwfsFNSsceAevho
 Fc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=HQKmk+LBZ6fW0+fCh+uLp63LKlIoBqsDkchkHUREuYU=;
 b=6zTq6ZDMU3iH/JBCTtTgwurJCI+y8iY1myzsIXjaUxilZnCw1nNJkiZu6MeLcfPuZc
 6YKG06+2ig2FVD70noZ/cYQYWKL1vT6wMWNQ5NqqWp4or8gSlmnn2hnqpmy7FMVeKobo
 b15CUpZMr4T+hsOdl0kXwcbhkLklYpTosfBVKDF1FGFOX0/02zaWvqbJt4AsaY0DFeXQ
 ei5GNnlok6Ivs8968XpTeZH6yuNJ9IXaAiSKMsiXCjFB39M3madcxRnocNk40xMEAs7u
 kmfcw271QI3uCsuMuFtf0LQntzGZ8TDyGXTb0KkRKcl50VI6n1YDHEn/Lk7YXCvblyjx
 dyDQ==
X-Gm-Message-State: ACgBeo1KePPUhu9lq/3z+NZ3P3nVn03u1POiOldJzH2ezli/Fi4oW1wV
 nh7BykACipHxFu8eGQlJqCPBMQ==
X-Received: by 2002:a17:90b:4b52:b0:1f7:2e06:575f with SMTP id
 mi18-20020a17090b4b5200b001f72e06575fmr9797843pjb.120.1660240287221; 
 Thu, 11 Aug 2022 10:51:27 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a1b4300b001f7a4ea4fd5sm3914352pjq.39.2022.08.11.10.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:51:26 -0700 (PDT)
Message-ID: <8c475566-41d0-1408-2c80-ee84e03cf2b9@linaro.org>
Date: Thu, 11 Aug 2022 10:51:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/10] target/arm: Detect overflow when calculating next
 PMU interrupt
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xbK14BoosXDm

On 8/11/22 10:16, Peter Maydell wrote:
> In pmccntr_op_finish() and pmevcntr_op_finish() we calculate the next
> point at which we will get an overflow and need to fire the PMU
> interrupt or set the overflow flag.  We do this by calculating the
> number of nanoseconds to the overflow event and then adding it to
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL).  However, we don't check
> whether that signed addition overflows, which can happen if the next
> PMU interrupt would happen massively far in the future (250 years or
> more).
> 
> Since QEMU assumes that "when the QEMU_CLOCK_VIRTUAL rolls over" is
> "never", the sensible behaviour in this situation is simply to not
> try to set the timer if it would be beyond that point.  Detect the
> overflow, and skip setting the timer in that case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 434885d024a..b7a420981f8 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1227,10 +1227,13 @@ static void pmccntr_op_finish(CPUARMState *env)
>           int64_t overflow_in = cycles_ns_per(remaining_cycles);
>   
>           if (overflow_in > 0) {
> -            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                overflow_in;
> -            ARMCPU *cpu = env_archcpu(env);
> -            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
> +            int64_t overflow_at;
> +
> +            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                                overflow_in, &overflow_at)) {

Maybe my mailer, but it looks like alignment is off on the continuation line here...

> +            int64_t overflow_at;
> +
> +            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                                 overflow_in, &overflow_at)) {

but not here.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
