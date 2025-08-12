Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6867C87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:03:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uli6Y-0001o5-Vl; Tue, 12 Aug 2025 02:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uli6W-0001lO-DC
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:03:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uli6U-0001oE-37
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:03:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b8de193b60so2871169f8f.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754978596; x=1755583396; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=M9B3gMOvx4Se5alAYaJcB7wUIjvXYmRszTA8lXpOl7M=;
 b=FjIh0GPnsVU/JwlcX/p2F5G2czS27ksyFIg5M/VXmFZLxT/goamvZZP5UTJpem82w4
 WnCr7rvASXs7KeBuWnRa8omHSS+kCeJNvw2rLqdm7PMH7wyOvx+DwvPA+bIPo3n0iZ0X
 2isiZIyXqEmkyXuJieOI4jotmnQHRCtCnqq2H0kEZK8EEIcr13gLczYYSP0yw8z9ZKaR
 ioXBjn/d34Fsv8F5Ku2N+gsFtLBTl/5QekyGuefbpvziAxQNaASu+sR+F7jNS++3/mFK
 WL7zlfz+q6F3ugp4AD393aiS+0MYHGWmuGz0IzvMaQgOYTNFH2iv1lR1vjzODwGWKh7G
 VZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754978596; x=1755583396;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9B3gMOvx4Se5alAYaJcB7wUIjvXYmRszTA8lXpOl7M=;
 b=LMkcQ1rhAzx6Sm3SR3fZuyou1dpmnpLIqnj0bYcXzmVnaxEcYVZznZTiQZQvJuYyYK
 v/gZbgpt1TZOGrAX9ebrH496puFrSJTV4rm6AZdhj6h+C54OyZbMSEuC7MQrs0AGsK93
 /1k87IN1FvxAx/pJl0oaQXYG3y1MsuT+xbl80YOOsFcvEMe6j+YLRQ16DbTjYLx0/msA
 GH7A4f2+kNHJFF/EVfGZeaE4ypWTQR1r+Cwa6dYw9dXdpWCbdhn7Vsq7ihHpK2IX0stI
 tGCIyFhBpCjsXHIcfhMBK5cWxRjMLZB87qLaX8ZZFrEVmJ66AMme7assMGNjVAhlIB48
 5w2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKkhGBYR94Q10u+v8cUV/w5VBjGpQMGIw/MXI6i9UA2phOy9dxp+ZRKyTyEzI9LfoC369GCQpO1w==@nongnu.org
X-Gm-Message-State: AOJu0YySuKX78+z/4ikLG2yQrXNrRZbScsE2iHWZymsZw8R8zYoNznIv
 4wnzGcjuAatPnuboMWJkVd/HocXLeBgxhQFoHkA72TW3g5HzG/SlAGpN4SjOIr4ueyg=
X-Gm-Gg: ASbGnctiLQ8LvRQScbDAtU4t4R3eHxFl9pGWtQ6caYBPH/8UXVkkXenEfxtTdQFtlU5
 hwX3eWUSYLc6J+Vme2W7x7U0u3Ujy4IE5H1uAOtCntbRENrzsz0ZoYiLUKOdh7MYzf0TSzxDk+W
 Kr4RlqZu5YxnaKlVAzbtBYiqfc7GLb9+4ySWPh2kQosSUv1EnRg6Pqw/OXe9jLVnHBuNt9IpMET
 kcvHrfQiUI7k5AogoPXScUqVr9ZPb/PQA8AENgJr6/8zrl3SVy9Sao5xnZlqOCdWpL1BFP0ZPGf
 Hx90HOy94uQRBptH0sDTEJ1eOUkkjl5BR92rSGNXn6ffind1GzRVumLqjiTkCuRvhMBEdKJQuc1
 ACLAFcTMrR6xgZq6ljtfihXBmh9z8yFcYrnsHssO5gBwQooddP4SNhrHV0ZXz6Vsm5g==
X-Google-Smtp-Source: AGHT+IEVieLKhtDwri7judKFhFVZcryIFRk2iDf07UNgJHvD05TsbYJkUUoxvLiicyCioZBqvBmcPA==
X-Received: by 2002:a05:6000:2511:b0:3b7:8dd1:d7a1 with SMTP id
 ffacd0b85a97d-3b910fe4134mr1504587f8f.19.1754978596484; 
 Mon, 11 Aug 2025 23:03:16 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459d712c386sm365208165e9.23.2025.08.11.23.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:03:15 -0700 (PDT)
Message-ID: <3d88ea9c-9cfe-4cd4-a282-2f467f2a502f@linaro.org>
Date: Tue, 12 Aug 2025 08:03:14 +0200
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
Content-Language: en-US
In-Reply-To: <14d7d948-e840-4ae7-ae93-122755d6a421@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 12/8/25 06:49, Philippe Mathieu-Daudé wrote:
> On 12/8/25 02:48, Richard Henderson wrote:
>> On 8/12/25 03:06, Philippe Mathieu-Daudé wrote:
>>> +++ b/target/arm/kvm.c
>>> @@ -288,7 +288,7 @@ static bool 
>>> kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>>                                1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
>>>       }
>>> -    if (kvm_arm_pmu_supported()) {
>>> +    if (host_cpu_feature_supported(ARM_FEATURE_PMU, false)) {
>>
>> Why is false correct here?  Alternately, in the next patch, why is it 
>> correct to pass true for the EL2 test?
> 
> I think I copied to KVM the HVF use, adapted on top of:
> https://lore.kernel.org/qemu-devel/20250808070137.48716-12- 
> mohamed@unpredictable.fr/
> 
>>
>> What is the purpose of the can_emulate parameter at all?
> 
> When using split-accel on pre-M3, we might emulate EL2:
> 
>         |   feat            |    can_emulate   |    retval
>         +   ----            +      -----       +     ----
 > M1/M2  |  ARM_FEATURE_EL2         false            false> M1/M2  |  
ARM_FEATURE_EL2         true             true
> M3/M4  |  ARM_FEATURE_EL2         any              true

For example in hvf.c:

static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
{
     ...
     if (host_cpu_feature_supported(ARM_FEATURE_EL2, true)) {
         ahcf->features |= 1ULL << ARM_FEATURE_EL2;
     }

and then only when split-accel is not enabled:

hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
{
     ...
     if (host_cpu_feature_supported(ARM_FEATURE_EL2, false)) {
         ret = hv_vm_config_set_el2_enabled(config, true);
         if (ret != HV_SUCCESS) {
             goto cleanup;
         }
     }


