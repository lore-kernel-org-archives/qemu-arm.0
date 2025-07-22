Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACDEC83F1A
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 05:53:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ue5w8-0003YL-BU; Tue, 22 Jul 2025 01:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ue5vy-0003RY-FR
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 01:53:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ue5vu-0007Ws-D4
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 01:53:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so2286377f8f.3
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 22:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753163575; x=1753768375; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4alBfDXtH0Yd3e2TM3R3sXaqbkUqWpnXF3Fc/WNWPUk=;
 b=KWHOfOSKOk59y/LDnGJCT/qcSZk0JmruwKDZ+MysTD2o/60UA6A4/rB6RELTrHFYe6
 ISQgvnCvkMgqSqMBOTLZcZc7RPHUCEEZcn0X6L+q9ENf/ztj84RcHaoV1F8FiwCIlYgV
 6KPD8YyWbrOBXMKZFaCnGTHsMf5iAgfmTDyZRYcK1iSd9xVCcV71vXV3syEyeIA7y+xR
 mTFZngZZJ2Sc+kjtDC6qiZO2/GIyMSDRpw6PdcStxVn0L4a8TQDZKNoTTUjegcy5LkW5
 EAHTDZ2C+HUUlIbJWIdtNmtFxYIcTWRbPxChnq3KofvgjuOEBGvpEZ8LxX4OxBPnQsnv
 URBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753163575; x=1753768375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4alBfDXtH0Yd3e2TM3R3sXaqbkUqWpnXF3Fc/WNWPUk=;
 b=Yu5U5N91O8ywCz/wOX6KE1NBYMTtzIxNwJ0R3oaJUcokMEUPTayohzzigUi8ENg4nM
 znc6QkNCJ/+/mSxjvqpVyZ1cz37vh1XJX22OnqcTQhPrOk4TjnhoM/HspTTudC+xD015
 y8G3MPW4KOnX7TXTGIW1MvL66Iuk9HZW4Juqf/BMkFYoiGgw2fvp+7pcgGfjeK2dR9os
 6VsSTArRQJdzPJOfadgpVyZude5D4t4ITleTVK4+bzq8NMC+eaQC5xIkrUVn1cA/kTqS
 WkUXuAqX/HaYNFYspBQsPVBjKYfhIfRhw25JgqNaBeANQmULtlWAcEt/Nx/SYhZNdI//
 lSHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbs7U/bllN4p3PL5+qTU9isEc0/6LDsWc4JxlQ0++X828pfAH+fCwmXBDwhOvqxoPadqdmz76YyA==@nongnu.org
X-Gm-Message-State: AOJu0YzKjdUQcsBQqBxbTmHzQ/ka42JZ2etyfS3ikv7WReYIITRNvFBq
 5hvSV/Zd8SpI6OmIwaz0lcJyiOIgUjKCSpyGxg1uEhEVgtxUOFLkLfz4mxrY4rHEVOM=
X-Gm-Gg: ASbGncvApzhtz03beqWofTwpo5fO5wPqjq/9UkUtaIhMa0eALALldPNgfqhvUS7HWZB
 EnegXyRjUuFahtkkukQxol2LsAc3wMiXYLEP/rxDGQCHsOrzqcC4fVudl1cHiTlkbJB8CxJJ4u3
 oQMptYF+3GPjLoiitfXYV3wb0lolvp3EIzsfdEd6oxu+nUIlGs5d3KBBcr7T/h1v3J861F8uFqE
 F/jssN2tA/54Gb8s0v6DF1ItsWJa681CuAeyQPH/9j87Y5c6r5/zPKyz9+tFqJ4Depul7wayuLt
 z6dVbi/pCQYOT7R1Zb0JlaC1Qy2md4HtTI3wgannIJ+x/AhiL2DIz990/ewyemPABt2L08xFeeU
 HUFAjjOEuXJ3dI0+gdwFrBLUXeHnIomPWToX07CIiJ91hgi5m1GktCnJJOTqRN4sE1Qv8qt4=
X-Google-Smtp-Source: AGHT+IFMTmv9F8j0Gb0Yk5kQzB78XXeRj7VoRJ6RtUW4u5puHppiYvQ0kBLMOm8eInDzyBo1gOWH/g==
X-Received: by 2002:a05:6000:40de:b0:3b6:1e6:c9fb with SMTP id
 ffacd0b85a97d-3b60e4c510dmr21008799f8f.11.1753163575242; 
 Mon, 21 Jul 2025 22:52:55 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca5c9e2sm12651343f8f.89.2025.07.21.22.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 22:52:54 -0700 (PDT)
Message-ID: <6b86402d-6a3d-45cd-b680-a83fe5818945@linaro.org>
Date: Tue, 22 Jul 2025 07:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: hvf: add timer frequency note
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250721152902.38671-1-mohamed@unpredictable.fr>
 <20250721152902.38671-2-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250721152902.38671-2-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Hi Mohamed,

On 21/7/25 17:29, Mohamed Mediouni wrote:
> On Apple M3 and later, the timer frequency within apps and VM guests are different from each other.

Also M1/M2, so all Apple Silicon chipsets IMO.

This might be the issue I fixed here:
https://lore.kernel.org/qemu-devel/20250620130709.31073-18-philmd@linaro.org/

> 
> Note that app binaries compiled with older SDKs continue to retain a non-1 GHz timer frequency on Apple M3/M4.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index c9cfcdc08b..4331a3386a 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1018,6 +1018,13 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>       int i;
>   
>       env->aarch64 = true;
> +    /*
> +     * TODO: This does not correspond to the exposed generic
> +     * timer frequency to the guest on Apple M3/M4.
> +     * This is due to a scaled 1GHz counter being exposed
> +     * to applications built with newer SDKs when running
> +     * on that silicon, while VMs get an unscaled counter.
> +     */
>       asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));


