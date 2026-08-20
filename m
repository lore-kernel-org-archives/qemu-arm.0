Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80ADC5DF85
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 15:22:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx4Zz-0006lI-GH; Thu, 20 Aug 2026 11:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wx4Zx-0006jl-9U
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 11:21:17 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wx4Zu-0002cc-IM
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 11:21:17 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-383cb94f742so2598540a91.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787239273; x=1787844073; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JBiklarrCZGlNuTGlfjF66tiZXZ/iOMyq4iHSICM5cc=;
 b=RM0YQ7zj9vNJ54qF0TPbhzeRzS32C4bekijOaOS6twd3AI+pfaruq+l9THl46cdiUp
 DsL+8Ms8yb9WXCtMcDce6KmvqF+f5cx+Y3+uPKpZeYt4z+NG2L87BjZPqWe9fmE3XRGr
 rGP+WfSN1HpWn9ojSwvL8mA1Tj/OLuzVLpKKMxxgAuSGK/pPbGls3rCiL0R3WRtYDzxQ
 dYaxXe0Z0OPSALS4T/4HHZG7/36lieaU7JmvkXHBdTFQpuBJbFMDw1l3/0KWQnusc9Q4
 B69taZEGxlXPGNOp+FxW1vWefo6fZzrEuptml9ffXPn9cAaRr6iNiLeA/lTzwTKzLtLS
 YhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787239273; x=1787844073;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JBiklarrCZGlNuTGlfjF66tiZXZ/iOMyq4iHSICM5cc=;
 b=B5YnTp0a7zYHJLiBHhxGhRIXoX9OHjP9tjiXdfy0Dn7ud90oih9L6ZVChERZ8eEPr9
 BM7JhXkYKMR7b0FB2/OHzxvYp0/SufZAchV9IwYUoOZXMq1blD+vsFN6/ok529uHXhLv
 o+SMaxMxHnd2jzovBGxcifDWfbDbJ8eOWC5+8qrQAnE+p8qOD0I7Pkl6SjwprtjnAysU
 hRSS9cbGiBrhAgo1d/UArj6oejoPfa+z2Uj4whoXVxkhqSwFWMoFm3Jy5YzLQoZNHwx7
 U/nvgc84cNGCrqOlLT38wp6BEhVpoHj5TlKGTWrgt4obRGefYKl13VZmaz7yXTI+eXbz
 6yng==
X-Forwarded-Encrypted: i=1;
 AHgh+RqzHw7O71OK/6WTI50abL+ubL5Vnkc5LJ3N6bLul9Gw0ucgGL1H1GJnrr15tB1mGnxK6xWsPyXRag==@nongnu.org
X-Gm-Message-State: AFuF++knWVW/6xV8AkTy5JHTJjS5VhuBL0En+NE86uP+2lwugYP9yYGl
 Gtb2TJkgRK0eDxY5j5idIK0OCFg9O3aq2VV8s7dHCDyURNbDkHFn5WAjD4GaYvxq1hs=
X-Gm-Gg: AR+sD11cNoo4oSoj6J0BNAj6ZBcdVIpjC7ZnI1EgAWjjvJbymJAUhZKtwkMcJbeRGMO
 N3OUW47F/4rxIwQTRSdJ10I/Ud0u9IWPToISkzPV9XihD9i2KjIoOx5Ve76+kA6CuMsKgk2tdLr
 LePAYXqclKGKr/YRGTNi7xk3yaLQrbtgpmP3m8+GtcGhEO2cX48LU1SoZ7eq694hpKm7DT23pQo
 fzkbH6g2Ru3x3Ap5qpDJ5PH/Z/OQ7tJ435QoxzGOsNfK4JRZ27kzGUbUawEEDEZmX7+yE09aiQz
 PbIQXLb1jSm7WnKiB6exDa81hetqmqMS2nCngwSx3t7Lz4LKmQq105Kcwiq5EQvcrOLoR3jchCx
 JMa/5zLdAmQQ6ObK2mtFt7oGapPXFtmNKRUntC1vStaXv03cRRh3vT/UmBsn9OyjMth3pupM/TA
 cL/Gab6Dfpv2GW0vaOnZ2nsZDZVduXnYU8iEjAZF1U/fxSIdvLW8Mtv5pu4XSp2MqGDGrFCnigk
 Ej09Zg=
X-Received: by 2002:a17:90b:390c:b0:381:cef1:11ac with SMTP id
 98e67ed59e1d1-3958110c03emr21321281a91.10.1787239272449; 
 Thu, 20 Aug 2026 08:21:12 -0700 (PDT)
Received: from ?IPV6:2607:fb90:331d:db6f:e6eb:39ca:2251:a26f?
 ([2607:fb90:331d:db6f:e6eb:39ca:2251:a26f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957fb17f48sm7805182a91.2.2026.08.20.08.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 08:21:11 -0700 (PDT)
Message-ID: <0b70e3cc-e14f-4737-b265-c7d12898169a@linaro.org>
Date: Thu, 20 Aug 2026 08:21:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/13] cpus: Add const-qualified CPU environment
 accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-10-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260820104730.25462-10-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/20/26 03:47, Philippe Mathieu-Daudé wrote:
> Introduce const-qualified variants of cpu_env() and
> env_archcpu(), to safely access CPU architecture
> state when it should not be modified.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   include/exec/cpu-common.h | 11 +++++++++++
>   include/hw/core/cpu.h     |  6 ++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6594f7fa1be..f3a3799f451 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -79,6 +79,17 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
>   }
>   #endif /* CONFIG_TCG */
>   
> +/**
> + * env_archcpu_const(env)
> + * @env: The architecture environment (const).
> + *
> + * Return the const ArchCPU associated with the environment.
> + */
> +static inline const ArchCPU *env_archcpu_const(const CPUArchState *env)
> +{
> +    return (const void *)env - sizeof(CPUState);
> +}
> +
>   /**
>    * env_archcpu(env)
>    * @env: The architecture environment
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 81af7b9ee1a..59f777f3f15 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -594,6 +594,12 @@ struct CPUState {
>   QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
>                     sizeof(CPUState) - sizeof(CPUNegativeOffsetState));
>   
> +static inline const CPUArchState *cpu_env_const(const CPUState *cpu)
> +{
> +    /* We validate that CPUArchState follows CPUState in cpu-target.c */
> +    return (const CPUArchState *)(cpu + 1);
> +}
> +
>   static inline CPUArchState *cpu_env(CPUState *cpu)
>   {
>       /* We validate that CPUArchState follows CPUState in cpu-target.c */

I wonder if we can use _Generic to make this automatic, rather than have to choose between 
two different function names.


r~

