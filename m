Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i1sm1609356wjs.45.2016.02.05.08.08.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 08:08:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 035B33E02CA;
	Fri,  5 Feb 2016 16:08:46 +0000 (GMT)
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org> <1454506721-11843-8-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 7/7] target-arm: Enable EL3 for Cortex-A53 and Cortex-A57
In-reply-to: <1454506721-11843-8-git-send-email-peter.maydell@linaro.org>
Date: Fri, 05 Feb 2016 16:08:45 +0000
Message-ID: <87fux7nnqq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: XvtVdVMrC2Ig


Peter Maydell <peter.maydell@linaro.org> writes:

> Enable EL3 support for our Cortex-A53 and Cortex-A57 CPU models.
> We have enough implemented now to be able to run real world code
> at least to some extent (I can boot ARM Trusted Firmware to the
> point where it pulls in OP-TEE and then falls over because it
> doesn't have a UEFI image it can chain to).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target-arm/cpu64.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
> index cc177bb..073677b5 100644
> --- a/target-arm/cpu64.c
> +++ b/target-arm/cpu64.c
> @@ -109,6 +109,7 @@ static void aarch64_a57_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
>      cpu->midr = 0x411fd070;
>      cpu->revidr = 0x00000000;
> @@ -161,6 +162,7 @@ static void aarch64_a53_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
>      cpu->midr = 0x410fd034;
>      cpu->revidr = 0x00000000;


--
Alex Bennée
