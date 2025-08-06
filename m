Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A35C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed,  6 Aug 2025 11:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ujcCT-0008J9-W3; Wed, 06 Aug 2025 07:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujcCS-0008GH-4R
 for qemu-arm@nongnu.org; Wed, 06 Aug 2025 07:20:52 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujcCQ-0006ch-8Q
 for qemu-arm@nongnu.org; Wed, 06 Aug 2025 07:20:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso26484385e9.1
 for <qemu-arm@nongnu.org>; Wed, 06 Aug 2025 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754479248; x=1755084048; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OQ5A6PDZ0sWXY63LlHVzYqfHjfopaH/PZySN6Q/lWZk=;
 b=Sarc850xdWyB2olqDc0HkE96q8patiXkhZJnkxsi30G6MiHaheiHupTqWf60TW61XO
 QFMIEPJ2VPAgdGtVMOLVmKFCdwEfJ2s4uvH+9gP48ygdQ+QdXjLctqBQ4t8sSIU0Le6Y
 6p1HMGCJDPbgvHmJN5WeA6gX15umSHCbZsU/ky3sKlixx//5WwfDtp6l0hlnMH155rQ9
 z2uk2iedfaKE5eWR8TBY4yMDnUK2S6syPL3yYjCRk3mHbH4LFK0A8B2yOEzHa68atMV6
 L78F9E5qk0fH7UPD2V2GbGXLgD9FbjyHqBCskxAliLJcvzHvWUNzOHp84VJfR+gssZtG
 0nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754479248; x=1755084048;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OQ5A6PDZ0sWXY63LlHVzYqfHjfopaH/PZySN6Q/lWZk=;
 b=sY3cwzzIuNtqZKtoa9lBGIVhLhh3mGZtYaOYbgUtdlzxSgzIOwIWCjiap0DXQ0V+0G
 eLF1zEpcr7IWSV2BPl3nGcxxdmCG+bEHIfFyOFeJnHg6AQ/5O8FG8qu03wBxH3GfQxj7
 S53qz7vVtdP1aics9/9pQVN+fnP4rlhgxCe/4dxYtPIqgKL5DHjrcMIuMmuAlIchHZaM
 4m4WGPPPu3P8QuMEu82TSYudx1Q31ct94I5jUd7zV1Et7r4SMeN2kJHtfPI9hWHdqeUk
 7uPeQyrNmnPevDv60t94WFfw+w4FpqCnHMmCPSsyv83Qv4SEmNGgcXlIalO72WzPAVHm
 dl4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0IoxAznS75N9YSsPFC+PtPcBN0wjTgMH/9iLcmkkUJKuwSmL0lozx1d/68GtKJTr9jBTEl7khbA==@nongnu.org
X-Gm-Message-State: AOJu0YyWCcwlaI0IKlPQPXmVOxnG2wGKswcECK+bzdbn49iXjY4O7s1g
 ZhHIqOCzmjpx++vooxOQe5ndRDV8H46iObD+OeJNo+UAGAZgT1G4g6d0RhcezQr5BrA=
X-Gm-Gg: ASbGncvE0msW4SvME/UZybJ+Mo7IVO8p3wDurrx80Lh+Gx0L5Rhntu0Q192LoT3pTZ0
 Y1dxxC3Xoi0nRu1IxPnyxKnjGcUpDqqvxxU5L8WByU/kbW4FcHyTiGXKXwxZ3886S9m+ZC7KHAV
 MRYsDjvp/hHNFuV43a2QaRy3yOZ/+VIBmFiOOnqttGivdJdRpW7cIlavI7qNsp1pxTzTs/DQtAN
 x5DDSlEKjSDwLh06mZMOKwFOQ9tEvZmYl7CoxOtQTHFYb2Ei2q6L6MRmOzc6kmqQn+01pk/MPln
 bl7vsM98+4LoqjQTScpneBmzvXzFBBZRJ7IyDl5qYyZHtwUKce/NSWDit8DEzCPFUoHDcz12FfN
 A7sEPJuUv+HvbCB6jSFVx5M9Fh7Q60Y9mR9t/aZfASQzyS4K1RnwbO98Fj4+OyGRHwQ==
X-Google-Smtp-Source: AGHT+IGyZLkMtrsaqN9+Fsv8QXJSuQlhVe3TrWALu/HpwsmBgnYJ6E2FWrZKzurqwPeX1dvLAcGJkg==
X-Received: by 2002:a05:600c:4e02:b0:456:f00:4b5d with SMTP id
 5b1f17b1804b1-459e7ec7baemr18874935e9.22.1754479248134; 
 Wed, 06 Aug 2025 04:20:48 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e0cd2c90sm83189335e9.17.2025.08.06.04.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 04:20:47 -0700 (PDT)
Message-ID: <d2e93df6-bbb4-427b-828e-b6f5466ae2be@linaro.org>
Date: Wed, 6 Aug 2025 13:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/13] target/arm: hvf: pass through CNTHCTL_EL2 and
 MDCCINT_EL1
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Igor Mammedov
 <imammedo@redhat.com>, qemu-arm@nongnu.org, Alexander Graf
 <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cameron Esfahani <dirty@apple.com>
References: <20250728134114.77545-1-mohamed@unpredictable.fr>
 <20250728134114.77545-7-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250728134114.77545-7-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 28/7/25 15:41, Mohamed Mediouni wrote:
> HVF traps accesses to CNTHCTL_EL2. For nested guests, HVF traps accesses to MDCCINT_EL1.
> Pass through those accesses to the Hypervisor.framework library.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index f14a3a3cbd..eefae3069f 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -297,6 +297,10 @@ void hvf_arm_init_debug(void)
>   #define SYSREG_DBGWVR15_EL1   SYSREG(2, 0, 0, 15, 6)
>   #define SYSREG_DBGWCR15_EL1   SYSREG(2, 0, 0, 15, 7)
>   
> +/* EL2 registers */
> +#define SYSREG_CNTHCTL_EL2    SYSREG(3, 4, 14, 1, 0)
> +#define SYSREG_MDCCINT_EL1    SYSREG(2, 0, 0, 2, 0)
> +
>   #define WFX_IS_WFE (1 << 0)
>   
>   #define TMR_CTL_ENABLE  (1 << 0)
> @@ -1372,6 +1376,12 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
>       case SYSREG_OSDLR_EL1:
>           /* Dummy register */
>           return 0;
> +    case SYSREG_CNTHCTL_EL2:
> +        assert_hvf_ok(hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTHCTL_EL2, val));
> +        return 0;

We'd like to remove the assert_hvf_ok() calls, so adding more isn't
really helping. Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


