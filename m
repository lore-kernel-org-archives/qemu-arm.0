Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp667781ejf;
        Thu, 11 Aug 2022 10:53:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4zfSUxwQdEd8v5+VzOX4TTwrEe2eebmdESJWOYxrCOqath9tUf9qsCnQadwuiEGo7IpDoo
X-Received: by 2002:a05:620a:bd4:b0:6b9:fdf:1bb5 with SMTP id s20-20020a05620a0bd400b006b90fdf1bb5mr75222qki.447.1660240393491;
        Thu, 11 Aug 2022 10:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660240393; cv=none;
        d=google.com; s=arc-20160816;
        b=DASuYezpdkEnSRoP/menTOk00l81aQHq+l2zrc43K8PZNvUG85oNZMXgCUXkVo5BEV
         /tzDCJmDE/zO7+1xziafqdrUZ8aPb4ErFeD9cA7481EcyS8DhfcvKpdo3XPnW07m807F
         W60Adr6BPArgmyLzRjMTw91jfuQFa/LFWwgABxaExiOifwbap3EVuL3S8FjSEOJqw6H+
         kXeOEJPEWu41DTUOs89MvNqwA/xJs/cHRw5ECbqm4XoOyJfp1EYo+1fr+tHPDLZmq7q+
         QgfURfkdNPUqpIJ1kK7Ofc+ooKzigwITCP6ZkrkvXEcDy3MNkp6toDbnPHssDUoHswT2
         /EYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IH3iAXOWi7XpjwddJhaUE6hrPW5BB6SruKgK5JwOxnU=;
        b=B7grzeBVM/zXiAuzpStfAQ+ph3JI21mFGJ8Nif0ksdcP4aJCyMmzYMgD0ItwzmUBjd
         f2YD3gldCeONyiIV1Utrd7rerAUra6w+D2q0j3jJEK4/6UZ13qB/UDg10obBx8D6WXEs
         rVL6u/Ke1JsqAQKvOoMuMS7ps4mHeomHjCjlWjEfLQng24H/4j/E/uClyWEwGLfhKHcU
         v6zYLPfnhDKxJtiUqg5Tu8Rrnos7q8+PFy03tT+BKoXVzxFgckbo/7ger1AoNtzMGhWB
         HK/PaBz+Z/uQaeGMQglidtwTX5MpKXk7P9FAigw1eH3IvXGVJg4uR6wkTDJO+dz+DSjk
         BTqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MAw8u/5O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020ac84894000000b0031f05173ed5si34201qtq.560.2022.08.11.10.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MAw8u/5O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMCMn-0001Jd-5k
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCEa-0000V2-Jl
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:44:41 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCEZ-00054Z-61
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:44:40 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 130so17044507pfv.13
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=IH3iAXOWi7XpjwddJhaUE6hrPW5BB6SruKgK5JwOxnU=;
 b=MAw8u/5OqXJ3aEUf+x5DyB79S4Dkf7s/udVjeJdjEUrIhMiKuzANZXlzVpG8A/wsv3
 eeU6bnz6V8e8+PJvGSbGUB+5WsOkFk1P3NFPJRbAkKHnW0Z9jYS+Sm/WhUbfN05C+1za
 5xACitiMDZMbOqxPk212zQEvXU37BnRp8klIX5UWpj9PycZ0TKkHl5LvyLngfU3/X95a
 AYWm73Sn8mu3fwZtk62/ogSHfjF00DmJQaigACCh3d1FSRkzV5BmYiD5RcuZTZnayUaG
 isvN8M0gvq3zXzx5x10n+83frtyMWzmrJDUpQNagLi5meR1mMm05trKJHEEo8NBgiyx5
 M3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=IH3iAXOWi7XpjwddJhaUE6hrPW5BB6SruKgK5JwOxnU=;
 b=wQkgPe8O+J29bLxOcx5gAT926P+Y2sX2uU/6IxaEUHxpZRB3IZQzXiueXxWaTpsyP2
 w7JQYDBngE7aEHW676CUwaDQ4tr+roZUnzpzYOcx8XcZTBIFqCsTEYcldvj6SKsFHECP
 7W9iyhM1SLGCutWPqKJJCeDHVEdKi2J6FAOxcwW9L4DYBxj14wFZeqoDnvjK+noz5NTy
 gBM5rcKtHuI8SjH99XflshzwH+8WqcLMbAeCYoy+NZ9LN31fyXkR+meOjYMtrWXiZ4wi
 UfIC5L+twFHnHi1meE8lNyWUn5/OVU4R58kgWp6jACtVv/Va6PeBgP0K+hPc4y7vc5Sk
 RVGA==
X-Gm-Message-State: ACgBeo2KGQk90cFn67XtcTljSY8l3zcr1zZStWpTkjUHke8ilKdAik7B
 sH3pXyUXyQEbpJ6EOquBSzEOvg==
X-Received: by 2002:a63:4d0e:0:b0:412:1877:9820 with SMTP id
 a14-20020a634d0e000000b0041218779820mr138056pgb.177.1660239877345; 
 Thu, 11 Aug 2022 10:44:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a17090a0c8100b001f3244768d4sm3934200pja.13.2022.08.11.10.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:44:36 -0700 (PDT)
Message-ID: <f5826249-1d8a-1910-002f-dbac5cd7b6ba@linaro.org>
Date: Thu, 11 Aug 2022 10:44:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/10] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: AqHdqPCOs+mV

On 8/11/22 10:16, Peter Maydell wrote:
> +static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                           uint64_t value)
> +{
> +    /*
> +     * Some MDCR_EL3 bits affect whether PMU counters are running:

Typo el3.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> +     * if we are trying to change any of those then we must
> +     * bracket this update with PMU start/finish calls.
> +     */
> +    bool pmu_op = (env->cp15.mdcr_el2 ^ value) & MDCR_EL2_PMU_ENABLE_BITS;
> +
> +    if (pmu_op) {
> +        pmu_op_start(env);
> +    }
> +    env->cp15.mdcr_el2 = value;
> +    if (pmu_op) {
> +        pmu_op_finish(env);
> +    }
>   }
>   
>   static const ARMCPRegInfo v8_cp_reginfo[] = {
> @@ -7669,6 +7713,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>           ARMCPRegInfo mdcr_el2 = {
>               .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
>               .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
> +            .writefn = mdcr_el2_write,
>               .access = PL2_RW, .resetvalue = pmu_num_counters(env),
>               .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
>           };

