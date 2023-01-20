Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp925976ejc;
        Fri, 20 Jan 2023 00:40:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsu27kZy0BcwgWQJ9I2v5R6OPIhDm595IevPCrAWwTX1RUuXvcM+hBVQ+gzsQnTGELrLUzX
X-Received: by 2002:a0c:bed2:0:b0:534:26eb:a25d with SMTP id f18-20020a0cbed2000000b0053426eba25dmr19501345qvj.40.1674204042579;
        Fri, 20 Jan 2023 00:40:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674204042; cv=none;
        d=google.com; s=arc-20160816;
        b=y8EvIQmrboC0+MG1t6D51VdE/ssDzZdV+e3b7E2g5iLUGjwk+VAXQrfNF2WXvKe1Bc
         CFm8d9YfZk5QGIR7rWfOe+3EVfsgyUnUG0klSkujmjEqWtCxE5OFqwVsH+g+50qqvo10
         EhLlDNecr4AOUWyZBcgt8Oqsn/an31ZbOlswPVtpZyOt2vqVWRwe//USwynWJ+KY6P96
         AGO93X/U0hlGKbNp8F4iLUmPwOYH7UKQcnNoHCXTqlcSlH2vi/TWB5jlOORZxWtiqgml
         RXoUbPdayXBWO9CpYiKylURf5acDuroZ+7qUuC5RMqClX0Ki4M5/nKJx9H63uw0C/hIQ
         7xPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Dl0OGmQpZfo8QPgnH+lShdn5lTCI05GyHgYPpMx32ag=;
        b=r9iuI+MN1UJwwhoBS8ZDOLgsLLCd4T1qgx2FA5NkRjyQcfsihTMmpsucKDSkWqS547
         2ceUPQ0wABgGLIFU8kDVjx9BsS1Q0kVmmMqqlw6m23dcd2OjoTOJNlmktoBQ2ECE43gw
         HJYSKOy7F6Kd0Ls7bPSCGGySuBgLriZqcZUpkZ9djIEXkmn3fWQOxbuOS2X8rOiMZh1m
         rI4olK5AuIde2e5XwBSBhQwleK8QOFSae3lWg3QFUoSqd/RvOpPps9iofck/aPlRQR74
         ByDo4JsWN+47uTSmEAFZ6ou1HuXpSDalagin9rVkWupnWb/YRePSVUJEpPmDzL/gpQo8
         CtxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mp9-20020a056214340900b00535650099eesi641914qvb.297.2023.01.20.00.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:40:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pImwk-0005OE-J8; Fri, 20 Jan 2023 03:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pImwc-0005Jp-KW
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:40:18 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pImwa-000070-KC
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:40:18 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4655023970;
 Fri, 20 Jan 2023 08:40:12 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 20 Jan
 2023 09:40:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00193c5573e-73e0-4114-88ca-ef660acd1ced,
 B144956C13BBC382596DA5742790BEAB579A3E91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3820fe22-3c10-acee-b5fc-4aec11be7303@kaod.org>
Date: Fri, 20 Jan 2023 09:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 15/25] target/arm: Allow users to set the number of VFP
 registers
Content-Language: en-US
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-16-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230119123449.531826-16-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d051e416-cbef-48d3-bc88-72f0aa31ef73
X-Ovh-Tracer-Id: 6010898131391843296
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
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
X-TUID: EDfwoanHVdgc

On 1/19/23 13:34, Cédric Le Goater wrote:
> Cortex A7 CPUs with an FPU implementing VFPv4 without NEON support
> have 16 64-bit FPU registers and not 32 registers. Let users set the
> number of VFP registers with a CPU property.
> 
> The primary use case of this property is for the Cortex A7 of the
> Aspeed AST2600 SoC.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   target/arm/cpu.h        |  2 ++
>   hw/arm/aspeed_ast2600.c |  2 ++
>   target/arm/cpu.c        | 31 +++++++++++++++++++++++++++++++
>   3 files changed, 35 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index bf2bce046d..5f2fefef4e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -901,6 +901,8 @@ struct ArchCPU {
>       bool has_pmu;
>       /* CPU has VFP */
>       bool has_vfp;
> +    /* CPU has 32 VFP registers */
> +    bool has_vfp_d32;
>       /* CPU has Neon */
>       bool has_neon;
>       /* CPU has M-profile DSP extension */
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index cd75465c2b..37f43b4165 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -309,6 +309,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>                                   &error_abort);
>           object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
>                                   &error_abort);
> +        object_property_set_bool(OBJECT(&s->cpu[i]), "vfp-d32", false,
> +                                &error_abort);
>           object_property_set_link(OBJECT(&s->cpu[i]), "memory",
>                                    OBJECT(s->memory), &error_abort);
>   
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5f63316dbf..ad90de75fb 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1269,6 +1269,9 @@ static Property arm_cpu_cfgend_property =
>   static Property arm_cpu_has_vfp_property =
>               DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
>   
> +static Property arm_cpu_has_vfp_d32_property =
> +            DEFINE_PROP_BOOL("vfp-d32", ARMCPU, has_vfp_d32, true);
> +
>   static Property arm_cpu_has_neon_property =
>               DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
>   
> @@ -1400,6 +1403,14 @@ void arm_cpu_post_init(Object *obj)
>           }
>       }
>   
> +    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
> +        cpu->has_vfp_d32 = true;
> +        if (!kvm_enabled()) {
> +            qdev_property_add_static(DEVICE(obj),
> +                                     &arm_cpu_has_vfp_d32_property);
> +        }
> +    }
> +
>       if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
>           cpu->has_neon = true;
>           if (!kvm_enabled()) {
> @@ -1661,6 +1672,26 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    if (!cpu->has_vfp_d32 &&
> +        arm_feature(env, ARM_FEATURE_V8) &&
> +        !arm_feature(env, ARM_FEATURE_M)) {
> +        error_setg(errp, "ARMv8A CPUs must have VFP32");
> +        return;
> +    }

The specs say that the permitted values of the SIMDReg bits [3:0]
in Armv8-A are 0b0000 and 0b0010. In Armv8-M, the possible values
of the field are b0001. All other values are reserved.

This should be better :
	
	if (arm_feature(env, ARM_FEATURE_V8)) {
	    if (arm_feature(env, ARM_FEATURE_M)) {
		if (cpu->has_vfp_d32) {
		    error_setg(errp, "ARMv8-M CPUs do not support VFP-D32");
		    return;
		}
	    } else if (!cpu->has_vfp_d32) {
	        error_setg(errp, "ARMv8-A CPUs must have VFP-D32");
		return;
	    }
	}

?

Thanks,

C.

> +    if (cpu->has_vfp_d32 != cpu->has_neon) {
> +        error_setg(errp, "ARM CPUs must have both VFP32 and Neon or neither");
> +        return;
> +    }
> +
> +   if (!cpu->has_vfp_d32) {
> +        uint32_t u;
> +
> +        u = cpu->isar.mvfr0;
> +        u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
> +        cpu->isar.mvfr0 = u;
> +    }
> +
>       if (!cpu->has_vfp) {
>           uint64_t t;
>           uint32_t u;

