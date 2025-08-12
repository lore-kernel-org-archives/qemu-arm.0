Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3F0C87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 07:33:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uljVY-0006sA-O3; Tue, 12 Aug 2025 03:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uljVW-0006rK-66
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 03:33:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uljVT-0001iW-LN
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 03:33:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so32660105e9.1
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754983992; x=1755588792; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U46tZm3WdCz9s6+s67rjcVFpZgOy6vILPUGATvBzyns=;
 b=e5HVMp37XQymM6wOUuhjfg611WecI3nOVYItTEUisMnuIuCTrV3MHJcv6U3BtGZ3Kl
 lhduFwdCFZrcb8SHsnjvENAK9tV7PJs1lhhdrVoAR62cC8zBCveVTUC+zjKlwR7lVYpp
 MZuSxjYNr9yQ2NBntrNWT/7MSZ/k/MX8hQTLg04cpDEftEdj6bwpTuJUhiOpSoT6X5qQ
 7yr621/xWH1jVoAqAGqA+LaeZGB8aA5I5KHAhnwDL7P3eRt71eizTrVxjvNCZsVy17YR
 qMstJOJ76zhTmvHebixL9E5zRFzIJ4gzN/GqKHTD2o4y/+eUrHuIjVsDd1pwh1LUaL0W
 R7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754983992; x=1755588792;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U46tZm3WdCz9s6+s67rjcVFpZgOy6vILPUGATvBzyns=;
 b=klxhos2vS7M/dXjZ1LtQWAJLBtlPoaO2Y+U89MoG87CLLvMeMrjLpiTXZR6Y2ewOca
 P6joMCdsoulG2T/k3ZNCgICBhUpQyJhHGjkiFED0jurEgLu+h51NKuI0FlknOAeCCg+K
 FnhbwmgYpGvI/s64Tnmlxh8uOkBM1YBYgkRDsKF/cFOUUDQt959U7geqVeVsCY51C2aN
 TZyWewzNncC1e8Ve+1lc8F0PkT5IlXHBsETyoBtb3afXyTmEf+979oLeFIwiJiJZ8o/Z
 qaVxjUF/qdOlkD+wOD8FnBA20N+n4dpnfuHQx3IB8DIXnojmHluOyRzj81or8RDnFwoI
 9tWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+mlv6DpPUIIj1wYoACkurgQTxg3RocFlYv+dMG8O7z36yYSgeTBfEVBfcZEkaPl0K5YFc0FM6PQ==@nongnu.org
X-Gm-Message-State: AOJu0YyV1s8XNBPAqGHf0qDeGcZgO1C1aWhYol5zT7UEINvOiiMljPoK
 9NAhKwV0MlPqmjPNU38a129QW7FiLeGf6q5SVnD3fGZVjP76mSOd5gYeL3XRFxMFb/0=
X-Gm-Gg: ASbGncuU2R7AXbDWCIZU0hSq6jgB+0Gx5nfaKw8WAaHIHqBIsTnYQnWER+cf+X+Yxld
 slo7U9uSiNMaSCCTKp4yK7vLlj2PflXKQ/nqw0ImAyjc2sFcssvUPvSwvDsejDauTnffer9DfLe
 NhOmUjjOtFVkXBzR82cy5EZ+RaKzM8rQ4MU2/h5zHzS5DN8fjhwBItghdcxOxbVjcVviSSmmbDm
 4bZntcH7d3vRiPxS5MZPzPiPKzDI9azoYuja/6/6tkOLK5XC3SgEAnEgnt3wNu2EvY9V61cy36z
 VmsRhSqvMEnVLD3w3IvFVcMjkNtuM4U45vIvHGDWXBU+s+jyUU7CH7fr4YCYEZH4HuBGpa7vDE9
 rV/fkoBMinAEtt9ewciVeGuZk9nzl/w298M0TA5nFAENnpwcbi0akwLhR/WLuPozqhcnbqO4=
X-Google-Smtp-Source: AGHT+IFenbOYBYYL8rtdP5NhvlPx6gH97dvDDxCUDEfprak8jMg7i9COL3O/U+STX2Nwjj//F6/Vtw==
X-Received: by 2002:a05:600c:4e46:b0:456:173c:8a53 with SMTP id
 5b1f17b1804b1-45a10e135b6mr21112745e9.2.1754983992162; 
 Tue, 12 Aug 2025 00:33:12 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953eb7acsm525015225e9.28.2025.08.12.00.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 00:33:11 -0700 (PDT)
Message-ID: <cb6e02cc-1959-419a-bafa-5bb43818c159@linaro.org>
Date: Tue, 12 Aug 2025 09:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] target/arm: Replace kvm_arm_pmu_supported by
 host_cpu_feature_supported
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Miguel Luis <miguel.luis@oracle.com>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Haibo Xu <haibo.xu@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Mark Burton <mburton@qti.qualcomm.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>
References: <20250811170611.37482-1-philmd@linaro.org>
 <20250811170611.37482-8-philmd@linaro.org>
 <8efcc809-f548-4383-b742-e435d622da73@linaro.org>
 <14d7d948-e840-4ae7-ae93-122755d6a421@linaro.org>
 <3d88ea9c-9cfe-4cd4-a282-2f467f2a502f@linaro.org>
Content-Language: en-US
In-Reply-To: <3d88ea9c-9cfe-4cd4-a282-2f467f2a502f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 12/8/25 08:03, Philippe Mathieu-Daudé wrote:
> On 12/8/25 06:49, Philippe Mathieu-Daudé wrote:
>> On 12/8/25 02:48, Richard Henderson wrote:
>>> On 8/12/25 03:06, Philippe Mathieu-Daudé wrote:
>>>> +++ b/target/arm/kvm.c
>>>> @@ -288,7 +288,7 @@ static bool 
>>>> kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>>>                                1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
>>>>       }
>>>> -    if (kvm_arm_pmu_supported()) {
>>>> +    if (host_cpu_feature_supported(ARM_FEATURE_PMU, false)) {
>>>
>>> Why is false correct here?  Alternately, in the next patch, why is it 
>>> correct to pass true for the EL2 test?
>>
>> I think I copied to KVM the HVF use, adapted on top of:
>> https://lore.kernel.org/qemu-devel/20250808070137.48716-12- 
>> mohamed@unpredictable.fr/
>>
>>>
>>> What is the purpose of the can_emulate parameter at all?
>>
>> When using split-accel on pre-M3, we might emulate EL2:
>>
>>         |   feat            |    can_emulate   |    retval
>>         +   ----            +      -----       +     ----
>  > M1/M2  |  ARM_FEATURE_EL2         false            false> M1/M2  | 
> ARM_FEATURE_EL2         true             true
>> M3/M4  |  ARM_FEATURE_EL2         any              true
> 
> For example in hvf.c:
> 
> static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> {
>      ...
>      if (host_cpu_feature_supported(ARM_FEATURE_EL2, true)) {
>          ahcf->features |= 1ULL << ARM_FEATURE_EL2;
>      }
> 
> and then only when split-accel is not enabled:
> 
> hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
> {
>      ...
>      if (host_cpu_feature_supported(ARM_FEATURE_EL2, false)) {
>          ret = hv_vm_config_set_el2_enabled(config, true);
>          if (ret != HV_SUCCESS) {
>              goto cleanup;
>          }
>      }
> 

What I'm looking for:

- Is this feature supported BY HW?

   -> hw_init_feature

- Is this feature supported BY SW?

   -> sw_init_feature

- Is this feature supported BY ANY?

   -> do smth with feature

With split-accel, this isn't specific to HVF/ARM.

I can use a tri-state enum { ANY, HW, SW }.

