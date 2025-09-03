Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7182CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:40:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmmt-00082b-JN; Wed, 03 Sep 2025 08:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmmr-00081t-W5
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:40:30 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmmq-00065V-AG
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:40:29 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aff0775410eso71581966b.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756903226; x=1757508026; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=92pQNbhDYD6JTspyvViEeknOzi/ZkGvtt6B+3bP0b5Y=;
 b=yZxjpZ9BryvngiV0v2SyDrpPplOJVdRHMI5aW2C1muW8YHnMdSQLE/wgAJSFSHs0pc
 dmhKQ71AE2i0Cf19maXUmAji96EpFRBpISLvo07sMMczTvmyNc2rZNFGj5cf269WlZx6
 7xhL5VIxmmQEoBB/vOFiQTzKWuR6w3hlh2m5uq4LF7rVfOzSUzVHb3Io6g1utLJ2s6xI
 ybKn3mEOSUKH+EHQggfXX5ON6i8ZoHC1egl7iKpzUC79kya9/8MBjRf8sR3DzbZQ1aS5
 /UQNNkHgYWI3GSj7gLJE7xDsExUPPefitCou8Gmbif3j10gY2JK4rttUTXcqPzI50gmr
 wvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756903226; x=1757508026;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=92pQNbhDYD6JTspyvViEeknOzi/ZkGvtt6B+3bP0b5Y=;
 b=TqsN+6n9OJMEHAVQTi0g+UE2pYOAGZtiL6Kng7nXROhFZgQHHC2ecr1CtTNE33nqvj
 r03XoeOaARfb69I1pvd8NyE0HzLloLeCwRcaAyhg3SiP5fzrxIjgYI/y1IWC1wWbAHjX
 G6l2dBJAAUBhSq5ghfR/RW0/mxGmC//eQCj8iYFTze4z3vDTFkBobFu9cSAeUOiJlJP/
 Pdaddt6/j6KFVzv72zal154//YiGc7T1+C3H5E+o6HMjTiJ6k+3i65JJaRMbKKMvbRCL
 kXKNcSlYg3sXHH/teVXm7lhbW+yCGgx6mj14MPk8t/ZTv//BUo0woJk/VDaKDDHquTKl
 jJqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF7LWWDoMo+cTl5nNSN7YnTj6Hjk7ECFFeUes03yu9HI+Rgph48+j1Qn3ViYQAnrNacqxrvH96SQ==@nongnu.org
X-Gm-Message-State: AOJu0YzntbAjJ9TAv6eiufWohwZYaMdWEuMdP5dS+Q29I1MkNQBak00+
 AReORmUWe21kWMxjrl0AbJrYTc0uPzRM5YMCCccplrtCwb/bsj8fuHIvOXhNtQZjy70=
X-Gm-Gg: ASbGncvVZZ5Ppr7iVVEBqKwfF+i7BXdwvC8YfGPt72opZiK/D8+NP+QAQrLEUwhLj0E
 WRRUAJu6vjOd7wNQizGTaVAUuwbNZAhgO7elcQOMkI7Crtm7KW22IWCetSuLiiIbJoPIjlkg2sT
 Y/bCSBCtdRkBlhlg3wUlBGmHz2Jhk/I14dpMoTfRkM2xq+/S3BW/LqbiDK0BceULd80I50fnRdI
 9YIioHs69nV9hgoQaSNFaq0dA+YQmmZHAKv1Fpt1jnn2OgeM0WaJy0PdVh+FMbAh2nYA3tDmv2+
 IZ93yQp6oR/l8QFZ5AdyPAoKL8pyc5gv/ab6frfiV1oDUFl5J2NK3Pe02UQbYUR/HPAmW1ULVRV
 CHjqB7xr0AUkuheTnJdf0lAbHacxL1Cny2T1O+IUw7nDgTpm7/BzMOuuOUQTCNXhvfzLiDT8=
X-Google-Smtp-Source: AGHT+IFn5QyYU2aoHLwt7Ai7cekoXZHTgzO58dtLAZYo3suo4OSLB48OKXC2C27INbRPUtq3tUUzbw==
X-Received: by 2002:a17:906:730f:b0:b04:6157:43b with SMTP id
 a640c23a62f3a-b046157053bmr366844066b.25.1756903226375; 
 Wed, 03 Sep 2025 05:40:26 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0416842ffasm905026566b.38.2025.09.03.05.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:40:26 -0700 (PDT)
Message-ID: <b0890e8d-011b-4501-b500-44ec9772f825@linaro.org>
Date: Wed, 3 Sep 2025 14:40:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] target/arm: Call aarch64_add_pauth_properties()
 once in host_initfn()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-22-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903100702.16726-22-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu64.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 26cf7e6dfa2..f81cfd0113c 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -762,20 +762,20 @@ static void aarch64_a53_initfn(Object *obj)
>   
>   static void aarch64_host_initfn(Object *obj)
>   {
> -#if defined(CONFIG_KVM)
>       ARMCPU *cpu = ARM_CPU(obj);
> +#if defined(CONFIG_KVM)
>       kvm_arm_set_cpu_features_from_host(cpu);
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>           aarch64_add_sve_properties(obj);
> -        aarch64_add_pauth_properties(obj);
>       }
>   #elif defined(CONFIG_HVF)
> -    ARMCPU *cpu = ARM_CPU(obj);
>       hvf_arm_set_cpu_features_from_host(cpu);
> -    aarch64_add_pauth_properties(obj);
>   #else
>       g_assert_not_reached();
>   #endif
> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +        aarch64_add_pauth_properties(obj);
> +    }
>   }
>   
>   static void aarch64_max_initfn(Object *obj)


