Received: by 2002:a05:7022:1091:b0:7c:9548:a19d with SMTP id ep17csp1272105dlb;
        Tue, 30 Apr 2024 10:39:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx+B04tF61KuXMXO1SxsvCmak2givynyCm5BdJAak5bDbXmcnZaFv32D8Sb9wZJIL7Rt6wDiL1UOX1Cs474uFqinF4UcMP
X-Google-Smtp-Source: AGHT+IHeDFHd8GnyZbm9hCNYjRZhLKr1HrNiDLsdBfPiUiMELt1oL0aaZXubtarQQJnPJCEpVhCg
X-Received: by 2002:a05:620a:4acb:b0:790:8915:7402 with SMTP id sq11-20020a05620a4acb00b0079089157402mr14718481qkn.53.1714498743435;
        Tue, 30 Apr 2024 10:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714498743; cv=none;
        d=google.com; s=arc-20160816;
        b=R8f+FpVx4EhdMwCRIRBUTGUdpJaIah3oFw+WW3laqoyoUejk2VMCzXJnJ8oYkEHRWh
         HRwfgnUEPQbM6eu+f/tLme/IfHxHnku6Bj15QUom30hdHcs303/AftprH3BP2ykwJo05
         1Kjd1juCJY8T1aJ81jTsGJOwNrFvTCB2INGYOYDomxXRkzteXzwt02PiMStgvUEMSlYy
         smrlDNxbrwXTZqkyUI2q5Gq2fLjW4xWjhc88vjm/Lyx7xwkK+doyluFQYdH79yCxXLTC
         W52i5tE00GpPXUH3YoK0yuYAreOeXIPWlzGoVaSG1bUG9DTgRVpgJKShsydWQzrIiAc5
         YDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=uVyv5hRg6B037RfNy6Jiaqghy84UvaDe+kTUw/jD0qU=;
        fh=hn7MLDbF11O6iwNIWELfG4kksPf4IaBgINtYw8S7+zk=;
        b=fIE2qlcuku34BFTj73LCYL4IVYuFcQ/C8uUh7S0uZOCcvS9Cg9u5CqsVXAIZ3zbX0R
         xM4XBLQWNOah/oQzhinn+mUQD303O44EsDvieUx9iE4scUrOABIhmezzZMgzpFMp2zWJ
         XsXtZRlU1vvF1Xp36ogDzrfaIdX/Aaeg8FPw0NoUIClsMNvue1EehkKA1dtHXdv+z0St
         X1sWepYb/6dVuhDq1jFAuE9GPuwk0sKjZ0fGShVxIqLcoiwOKYjU8sMXZEhB5rDW6j5j
         LR3XgiqpLS/Y0pH7jEf2q542nmZEXqY0l3aaNGC0GRvXIr0De1ZCc2q74pzRs7iCzuI/
         bNNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJirJJ+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1-20020a05620a118100b00790ec935734si6120169qkk.474.2024.04.30.10.39.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 10:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AJirJJ+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1rRM-0006oc-K1; Tue, 30 Apr 2024 13:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s1rRL-0006oF-8g
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 13:38:51 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s1rRJ-0000ve-GW
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 13:38:51 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6f3e3d789cdso3881233b3a.1
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714498726; x=1715103526; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uVyv5hRg6B037RfNy6Jiaqghy84UvaDe+kTUw/jD0qU=;
 b=AJirJJ+NrIqwZ4Tv3vVabXnqBI98d7jW5889ZqBY9ck9WWxI2z2z4cpB/DuXLY0T3n
 zbZxYOmrAMN2QhP0Qjb9W6qDCEv/CHSmyDr761+IVwfuKxTlGtQGOci2M9a5ClANnIun
 vhh32eA8ZVZFZ7nEtQteyfUlZ9Z78qnF2GR+DEykbSS2sG5t5vnnfGHvVkFFVn5wjE/A
 3sRFOd7kqRqBYByM9oV9k+nt5nRU9P4tXq6zYpwbmozCTEeN3m5jUiapSep8V225YqIm
 jwXdgbyY0iaBaKMdQksvHTk5+X/FhN3GKgw6IAQtlE3J0Q+8a9KNsh5XZnoF6lqBRolF
 MEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714498726; x=1715103526;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uVyv5hRg6B037RfNy6Jiaqghy84UvaDe+kTUw/jD0qU=;
 b=w2KwHC6XLxDXJdY64synMBjJzsOtHZzbp4u/oBhFTiWWUOZZ1DXxDyPg5B1SBitW5K
 VDqWYykjHHf7T6MF1YV2Dcv3Q4OlcFaYW4SSLLE3jcbpNV8OKGXAi8gCZtTULBjXX4xp
 dEJoJKZAEsep/JOZQtTQL9P45u/YHijP3sZ3VpQ9+RCltfT9a4E5R26FXe4XWp8up0yW
 SUnSvoNpbuKVolNwBFEcDl3D4xT+uMalXJj2Ez5fOrzWDvRfVFh9eERTbdd1wmfoj3pL
 MDrb7VJVO5gdPV0i7iC4svbNR89dCcyjjJtL44NYPAMVkoJu0MzvCiQdCTO5RPIZ/X/7
 VBKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnl3M0M7l5otJEobTjvxmW1rJgoYNGZDOx3f5ILDPtFLf42bGBbTDRZD6hFDDlf5aqN2OO+yhXtXQvN9GOpafsOw0B
X-Gm-Message-State: AOJu0YzafWmq/WntF92W7UvGJtEGcyuvncFBciJsNROynQ0EJ6zFXujV
 Hamt2sOYiNF75aUWjL9qbrNkCmCjYetUcQTaufHSXD+5kXVqKK3N09rfX1oiE74=
X-Received: by 2002:a05:6a21:9204:b0:1aa:282e:8dac with SMTP id
 tl4-20020a056a21920400b001aa282e8dacmr779203pzb.0.1714498726640; 
 Tue, 30 Apr 2024 10:38:46 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 n66-20020a632745000000b0060fc94219b0sm6304555pgn.45.2024.04.30.10.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 10:38:46 -0700 (PDT)
Message-ID: <38c57237-665d-4016-a6c6-ba8ceb04b24d@linaro.org>
Date: Tue, 30 Apr 2024 10:38:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/tcg: Make TCGCPUOps::cpu_exec_halt return bool
 for whether to halt
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
 <20240430140035.3889879-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240430140035.3889879-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TvHY8aCwdbwq

On 4/30/24 07:00, Peter Maydell wrote:
> The TCGCPUOps::cpu_exec_halt method is called from cpu_handle_halt()
> when the CPU is halted, so that a target CPU emulation can do
> anything target-specific it needs to do.  (At the moment we only use
> this on i386.)
> 
> The current specification of the method doesn't allow the target
> specific code to do something different if the CPU is about to come
> out of the halt state, because cpu_handle_halt() only determines this
> after the method has returned.  (If the method called cpu_has_work()
> itself this would introduce a potential race if an interrupt arrived
> between the target's method implementation checking and
> cpu_handle_halt() repeating the check.)
> 
> Change the definition of the method so that it returns a bool to
> tell cpu_handle_halt() whether to stay in halt or not.
> 
> We will want this for the Arm target, where FEAT_WFxT wants to do
> some work only for the case where the CPU is in halt but about to
> leave it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/core/tcg-cpu-ops.h       | 11 +++++++++--
>   target/i386/tcg/helper-tcg.h        |  2 +-
>   accel/tcg/cpu-exec.c                |  7 +++++--
>   target/i386/tcg/sysemu/seg_helper.c |  3 ++-
>   4 files changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I like Alex's suggested rename.

> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -669,11 +669,14 @@ static inline bool cpu_handle_halt(CPUState *cpu)
>   #ifndef CONFIG_USER_ONLY
>       if (cpu->halted) {
>           const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
> +        bool leave_halt;
>   
>           if (tcg_ops->cpu_exec_halt) {
> -            tcg_ops->cpu_exec_halt(cpu);
> +            leave_halt = tcg_ops->cpu_exec_halt(cpu);
> +        } else {
> +            leave_halt = cpu_has_work(cpu);
>           }
> -        if (!cpu_has_work(cpu)) {
> +        if (!leave_halt) {
>               return true;
>           }

As a followup, I would also suggest making implementation of the hook mandatory.
We already require the has_work hook to be set; it would simply be a matter of copying the 
function pointer to the second slot.

Also, the assert in cpu_has_work could be moved to startup, as Phil has started to do with 
some of the other hooks.


r~

