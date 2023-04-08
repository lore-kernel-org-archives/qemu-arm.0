Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp676214ejb;
        Fri, 7 Apr 2023 21:18:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y8XHQnSn6k/CbzXRH1Nt5bBnII58pq3TR3vm5gDWlzzIri6IUcUI9pPi57Dr3+rrERlUD/
X-Received: by 2002:a05:6214:e4e:b0:5df:3a1b:447 with SMTP id o14-20020a0562140e4e00b005df3a1b0447mr2125588qvc.11.1680927480552;
        Fri, 07 Apr 2023 21:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680927480; cv=none;
        d=google.com; s=arc-20160816;
        b=soFX/7y4gwgNmPm4e+yBP2rI7VBBzkf9p/vrTm1mEs6RoxD1/wrpLunc1+n7Z6uU0U
         H9/5quXOixVreCSKwWOBcFUrfjUxjVBcJ/mS9IVraAWlOiNzu6HkduvfuU6q7AvAoeXn
         W58aOPcLm/5iMf8QLl7/HwSXic+2kPQgf6j2xMvlWh582DyuDUyFvDhLKj79GgLdXr5M
         b8FrauMYmi3wfVXajRTuV0R3ohvHTHNUC+3KqZ4ERZ38EhSA80EaO/FbrEEJQCpIIvnW
         rAunnatsu5iCt4g005J90ZA43G0/RkYO1IOkYyPPZswaKqtqFVLIvjircrh1Ykba6NxY
         nHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lVJTv/KYcj5s5h2/xecWpW4NQ7yGRWj+kwesUyQ0/6E=;
        b=Hcx3tU6kpqOiP7guKULT6Q88OA0wmdXc3bShKOHzecIjwBREVmqVkpGpjsb7Yz93jb
         Gu1ikBmXJYF+MqHCrC1NNH+7jY2HgeQJoU2XuFLa+9QvZwzfEhhAKrCoxfMKCnU808ti
         bmh3Lcfg4MMrw5KTW8m0IcsxozeDlOaJSizTIdyuA6ib+MdoRIyije+y1drRtvF7ofbI
         8qrowATHu/ZNCgbjCsGtdrdgi6ZAt+Umzm4Va5vmWYzzaGwopv4y6CbcCiE0Xpic4Dog
         NZ3fxc+KrbwzUzBLZSjuojx2QMUx0zZjhtKk6zsDmE6pAJ/iaBuy9mKQ+R1sGw4xsRfl
         bzuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lh+bRpyR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs35-20020a05620a472300b0074863cf37afsi3901323qkb.579.2023.04.07.21.18.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 21:18:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lh+bRpyR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pl01D-0004mU-25; Sat, 08 Apr 2023 00:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl01B-0004le-M9
 for qemu-arm@nongnu.org; Sat, 08 Apr 2023 00:17:37 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl01A-0003ly-4B
 for qemu-arm@nongnu.org; Sat, 08 Apr 2023 00:17:37 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63397c54c5aso16957b3a.3
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 21:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680927454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lVJTv/KYcj5s5h2/xecWpW4NQ7yGRWj+kwesUyQ0/6E=;
 b=lh+bRpyRPfWIYK6yDR5IjTMiYWJGB77utURwDzV6Bl/oIYOf7nCGv3aFA7zNzSFcb1
 cxWz5jy6CNko3Mf/dD+aUe0971/72MjGLXYXh44U1rZzefX6QnQMepdkWdk/FmzBDMGs
 9wTAS4lj63gS/o4jRcv3qj0RL8W+7jh7G7/ae4RhiqTOXPDnXyIq09WKMoF5ayue2uUb
 fBXhFbdpfFaV7tdHY1xQcNFmHyKtWoSsa1XtUnQFHkGjhP0pFzOYrLtmhZIWnOE+ZQCb
 gIBKcGqnKr5vMXDcc+nUBTDL/NStbfFuqcZMBZTJmlwlyoTmUXNAEuMHnpxl/Q1gWfoU
 Hy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680927454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lVJTv/KYcj5s5h2/xecWpW4NQ7yGRWj+kwesUyQ0/6E=;
 b=i55ZaWB6S+hLcQDzH5K2HqsunikTgkeGS7Ij8MW2JOuXxLmh+cbB5nzlCBSM5Ubf26
 N2CjzB7IVVU9OCb1dLhv9KZMxRrJZZBEBlSJLzecANWBZr2CC814/dKbgBiqqlm6LGgV
 RjYL4VGqYN7GxdRsc1xHaZXzKRbX/ayaKMqWd2J/ORiTtU2ptyemjSbBoS4xeLxJa9EV
 sa0PlDbqGe2QVLZc4M0caZnJcDeuM2/IA03fFgD8/KrUWeVBbVESeFDcuvFaUOgUSt+p
 kD4HO415k2qTV6SSnDRJMbQLVLc/iUZy+IiEsIlCs6qtUqbr3HynnPYUJJkwt5GB8LcF
 kN7Q==
X-Gm-Message-State: AAQBX9cbfe1njaICzDPC5h26VmKX/xvINasZmFgSrV2nFFvYMLm3lq4M
 hSC04sYi164oZrazw6ygiu7HjQ==
X-Received: by 2002:a62:1c58:0:b0:626:2984:8a76 with SMTP id
 c85-20020a621c58000000b0062629848a76mr772678pfc.34.1680927454081; 
 Fri, 07 Apr 2023 21:17:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a62e509000000b00580e3917af7sm3758893pff.117.2023.04.07.21.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:17:33 -0700 (PDT)
Message-ID: <c56f4f56-6cba-ceaa-9f89-228fafcbc2ac@linaro.org>
Date: Fri, 7 Apr 2023 21:17:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
Content-Language: en-US
To: pbartell@amazon.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230408000118.50854-1-pbartell@amazon.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230408000118.50854-1-pbartell@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: S8s87kPmQUl+

On 4/7/23 17:01, pbartell@amazon.com wrote:
> From: Paul Bartell <pbartell@amazon.com>
> 
> Revert changes to arm_cpu_get_phys_page_attrs_debug made in commit
> 4a35855682cebb89f9630b07aa9fd37c4e8c733b.
> 
> Commit 4a35855682 modifies the arm_cpu_get_phys_page_attrs_debug function
> so that it calls get_phys_addr_with_struct rather than get_phys_addr, which
> leads to a variety of memory access errors when debugging secure state
> code on qemu ARMv8M targets with gdb.
> 
> This commit fixes a variety of gdb memory access errors including:
> "error reading variable" and "Cannot access memory at address" when
> attempting to read any memory address via gdb.
> 
> Signed-off-by: Paul Bartell <pbartell@amazon.com>
> ---
>   target/arm/ptw.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index ec3f51782a..5a1339d38f 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2999,16 +2999,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
> -    S1Translate ptw = {
> -        .in_mmu_idx = arm_mmu_idx(env),
> -        .in_secure = arm_is_secure(env),
> -        .in_debug = true,

Nack.  This will now affect vcpu state by changing the contents of the softmmu tlb, as 
well as changing the contents of memory (!) via PTE access/dirty bit updates.

A more complete description of "a variety of ... errors", and the conditions under which 
they are produced, would be appreciated.

r~
