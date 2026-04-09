Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90613EA3C55
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 12:33:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAoZA-0006jb-My; Thu, 09 Apr 2026 08:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAoZ9-0006is-79
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 08:32:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAoZ7-0008K3-94
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 08:32:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43cfb723698so572271f8f.3
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 05:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775737976; x=1776342776; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zhyjyvZo97/wACnOtIz4IKnd+/Vk3UWpfK3J8T9DqFU=;
 b=tm4smbZTMJ1uea8vq0XhRvBkp3ugKwu8OYNOiCCkDRwAZg2Icf4kYmd0YqgGcOEJsb
 4QuIqKWFhQUv2tzLJWMUhjgKshuG2H2kcXnhrfroW1jryrLv8KvGWSpWIJVLFcoZ/63p
 +BG7F/nFzfMu9ockRS+31jOsv3sCaPfhVjtPYnGz8loaQaJQ1HQIKnEqBAvZl3vJoRGJ
 1+Ug2ygWfZod6JgkYAlpkubwPYO0Jp6g37WCEBsPkt8zkfX1pD+k8jj7ulaLby3XkJY8
 ID51ikAJsnVhONBW4Pfbvp3KUWDmJNss2mOpS40ats2s6rKpb992YRDGhZTgir3r3LFU
 oR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775737976; x=1776342776;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zhyjyvZo97/wACnOtIz4IKnd+/Vk3UWpfK3J8T9DqFU=;
 b=AYUU+UYLNc4z21yL5x75/+4yrqPWQC3Laxi2c5zfM+Lw7XT6G25V3MBJziD1OWlsCq
 oUtRuKmDRp5udU31Mwe0v/6Shbt+N548tA6lYQRM8HFPCGoObbN2bQBqYX/6Fi0nVgmI
 lBhrFNP3Q7rbImz0GpGnW1DNFOv/OtpO6fp73f/gRXzxNQWTfV7vMDPEENDSSLDN8u7D
 +xaxToD22Q2JeZByZgLOkRgVJxSFNLFQlGcNkCBwFVI0sU6+rGvgnwibV8tYqOkxkD/2
 EzURBm6lm31t7NfeD56gYEhQtEXYPHQeZrOh1EpNoWphqlljb5393DRHbtR7FYgduLlm
 gJ+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1xI0CzwMogwtXUxprv1KZXDgQ+fMdiwAVXxB5mjXMtG2XWps0KnNrx4Q+HZ3CzT6TQUDanQ3DoQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw6zTx1vYz979oKFx55IqHxvF0UkZIAh/Yv/P2AAw6xYk5A3K+S
 CP/lqOBSoDWAg3dvey3kS3m22PONatSLgWIVydDhsWqVh+89HOs/P5rE3wPSj6M9Tbk=
X-Gm-Gg: AeBDietDBwyaGxMWCrcayELNbpz/2QKxzZqPmCdpmtPvHEhVgklcg1jB6NVdmntnbyo
 iZmyazWY2gq8X53R7F0jo+z8L7i0SiDQJNBKZZ8nvZWcpQpf6ZjIFwsL+6DYbNHVehaEbVMtMJn
 KC4Fkkk8/6nMCzsMg39BgFn4m+Y+BLQJmV4f4nlM/YvwritRN5SPOrRb6NxHCrVfon8yq+wkO2W
 lmwAY5vi30Jldt1oTpi2BBcU9ImXCKor3lfZDvfZJT+tj7bRXdi1P4bEigG60ylNdhds3MKvAFg
 Z7I8jUloaqQEOSXXzwi8HvXRwJWJN0bHSddGEDRAojYfY/XpujcLPXqa+Fu7fkjLGRONN+BHZ4K
 BVOw8So1+h0+f2xh8xaUhqd9fGWFgDZ5nb+vgYh0AkM6DlNkfbOmOIQtYI/rJhri9CbJ0OQMI12
 h1bryqx4s4aUJ8zMec9OnRIEXt+6nyTtAOm6AvqcnpiHMy0j3lRjDldKBMomkjpitkew==
X-Received: by 2002:a05:6000:1869:b0:43c:f95c:3e70 with SMTP id
 ffacd0b85a97d-43d292c76e3mr38673198f8f.25.1775737975433; 
 Thu, 09 Apr 2026 05:32:55 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c5419sm78444836f8f.11.2026.04.09.05.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 05:32:54 -0700 (PDT)
Message-ID: <dd5faa57-0dac-4da4-b191-fe444caeac9e@linaro.org>
Date: Thu, 9 Apr 2026 14:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/arm/smmuv3: Avoid including CONFIG_DEVICES in hw/
 header
Content-Language: en-US
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20260225031658.32095-1-philmd@linaro.org>
 <20260225031658.32095-2-philmd@linaro.org>
 <IA0PR12MB7555FC2C448B36354AF4FD6BAB75A@IA0PR12MB7555.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <IA0PR12MB7555FC2C448B36354AF4FD6BAB75A@IA0PR12MB7555.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 25/2/26 10:20, Shameer Kolothum Thodi wrote:
> 
> 
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Sent: 25 February 2026 03:17
>> To: qemu-devel@nongnu.org
>> Cc: Paolo Bonzini <pbonzini@redhat.com>; Thomas Huth
>> <thuth@redhat.com>; qemu-s390x@nongnu.org; Pierrick Bouvier
>> <pierrick.bouvier@linaro.org>; Shameer Kolothum Thodi
>> <skolothumtho@nvidia.com>; qemu-arm@nongnu.org; Philippe Mathieu-
>> Daudé <philmd@linaro.org>; Peter Maydell <peter.maydell@linaro.org>; Eric
>> Auger <eric.auger@redhat.com>
>> Subject: [PATCH 1/3] hw/arm/smmuv3: Avoid including CONFIG_DEVICES in
>> hw/ header
>>
>> External email: Use caution opening links or attachments
>>
>>
>> By inlinining the stubs we can avoid the use of target-specific
>> CONFIG_DEVICES include in a hw/ header, allowing to build the
>> source files including it as common objects.
> 
> Thanks.
> 
> However, smmuv3.c currently has a:
> #ifndef CONFIG_ARM_SMMUV3_ACCEL
> in smmu_validate_property().
> 
> which leads to the build failure below:
> 
> [30/195] Compiling C object libsystem_arm.a.p/hw_arm_smmuv3.c.o
> FAILED: libsystem_arm.a.p/hw_arm_smmuv3.c.o
> ...
> 
> ../hw/arm/smmuv3.c: In function ‘smmu_validate_property’:
> ../hw/arm/smmuv3.c:1939:9: error: attempt to use poisoned "CONFIG_ARM_SMMUV3_ACCEL"
>   1939 | #ifndef CONFIG_ARM_SMMUV3_ACCEL
>        |         ^
> 
> One way to fix this is to remove the CONFIG_ check from smmuv3.c
> and rely on the stub implementation for smmuv3_accel_init () instead:
> 
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 7e48d1555d..a224017c6c 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -39,7 +39,7 @@ typedef struct SMMUv3AccelDevice {
>       SMMUv3AccelState *s_accel;
>   } SMMUv3AccelDevice;
> 
> -void smmuv3_accel_init(SMMUv3State *s);
> +bool smmuv3_accel_init(SMMUv3State *s, Error **errp);
>   bool smmuv3_accel_install_ste(SMMUv3State *s, SMMUDevice *sdev, int sid,
>                                 Error **errp);
>   bool smmuv3_accel_install_ste_range(SMMUv3State *s, SMMUSIDRange *range,
> diff --git a/hw/arm/smmuv3-accel-stubs.c b/hw/arm/smmuv3-accel-stubs.c
> index b64f1e4d93..c08caa6fa4 100644
> --- a/hw/arm/smmuv3-accel-stubs.c
> +++ b/hw/arm/smmuv3-accel-stubs.c
> @@ -8,8 +8,10 @@
>   #include "hw/arm/smmuv3.h"
>   #include "hw/arm/smmuv3-accel.h"
> 
> -void smmuv3_accel_init(SMMUv3State *s)
> +bool smmuv3_accel_init(SMMUv3State *s, Error **errp)
>   {
> +    error_setg(errp, "accel=on support not compiled in");
> +    return false;
>   }
> 
>   bool smmuv3_accel_install_ste(SMMUv3State *s, SMMUDevice *sdev, int sid,
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index f5cd4df336..ed647c45b8 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -758,11 +758,12 @@ static void smmuv3_accel_as_init(SMMUv3State *s)
>       address_space_init(shared_as_sysmem, &root, "smmuv3-accel-as-sysmem");
>   }
> 
> -void smmuv3_accel_init(SMMUv3State *s)
> +bool smmuv3_accel_init(SMMUv3State *s, Error **errp)
>   {
>       SMMUState *bs = ARM_SMMU(s);
> 
>       s->s_accel = g_new0(SMMUv3AccelState, 1);
>       bs->iommu_ops = &smmuv3_accel_ops;
>       smmuv3_accel_as_init(s);
> +    return true;
>   }
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index c08d58c579..8c51554c39 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1936,13 +1936,6 @@ static void smmu_reset_exit(Object *obj, ResetType type)
> 
>   static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>   {
> -#ifndef CONFIG_ARM_SMMUV3_ACCEL
> -    if (s->accel) {
> -        error_setg(errp, "accel=on support not compiled in");
> -        return false;
> -    }
> -#endif
> -
>       if (!s->accel) {
>           if (!s->ril) {
>               error_setg(errp, "ril can only be disabled if accel=on");
> @@ -1996,7 +1989,9 @@ static void smmu_realize(DeviceState *d, Error **errp)
>       }
> 
>       if (s->accel) {
> -        smmuv3_accel_init(s);
> +        if (!smmuv3_accel_init(s, errp)) {
> +            return;
> +        }
>           error_setg(&s->migration_blocker, "Migration not supported with SMMUv3 "
>                      "accelerator mode enabled");
>           if (migrate_add_blocker(&s->migration_blocker, errp) < 0) {

Great, thanks Shameer! I'll respin including that.

