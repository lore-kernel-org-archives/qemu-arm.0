Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2227544ejb;
        Fri, 8 Dec 2023 02:37:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5UfvdKD6huX01seNdICr20SQzO8+PYymIgwJ0+g2BbdzyJuja4xKFKHamWXcojb+/Jk0p
X-Received: by 2002:a05:620a:2d91:b0:77f:370b:6011 with SMTP id tr17-20020a05620a2d9100b0077f370b6011mr2177962qkn.129.1702031825960;
        Fri, 08 Dec 2023 02:37:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702031825; cv=none;
        d=google.com; s=arc-20160816;
        b=Z1Jm42GDkn2gM1BpJjwmAMJ9Vq3EAZQktprhWqAgRI6yVgrbc8KhsVeD6tBa8Tbg10
         ZN06CNMPoZmjYnR58kRa7iXAfKt9GQf+7UK+PnDv9V3AoovM9ZxzW07BbF5PqgzyVTdR
         GrcGJsSxhXua5yxqpI+mNJzxLutBrZxrVBwaFuhijwC7uGaA73ecBTTMvKPAcH67Czja
         fGeta/Fa3F7K25O+lD2K+E54nwPnb4lNZfo6zNGhEpLHqxsotlKzlR7HDSuUhCWt78v2
         mfFCgwLBJKVIBxsmdMwGmP2AWfdXH8FVWS2cb8NyyhNsufLNnSymjBUsutVuSfE8fq7Q
         E0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=F3mSKFF9tA29R4ffI67DQveh1811FkFatia/cRa4Umc=;
        fh=TglVjbdv4KthQ7XZVB89zr9VQFRw0u+3ZdS9fQJGaFk=;
        b=Rffi8wkGruj/F2Ed300uctdeNLww+CQ/Wq1f23SBkF/hTO9omubJLu8qHyQz/wCgmI
         hcTRxnzrJ4ZA+aSDV9ZskblN4/J4ec2DSxYZkYNR/ey+B7CBp+bnL3czMZ6PxdljvyQP
         KfWsg0GmhykzE6qpN5mLzvbK0Q8XFxPo/ir4FcBRv6gm00hg2rAGD+JHSZRyaf/B92yP
         rfJuOc6Krzr4PSvqX0iz7YvxvT9nRcIyY8WJAXamtPzsO5mqFzSl9LgV9k96llw5AJhw
         eD2cyI9+24fxgDBZSdylLpvBcIZoqNv78Fchgy+3wR7NQ4DekPg48MDy4B6oAc4v/7nk
         co/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EDVsiVxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020a05620a410200b0077f0d2ac498si1932060qko.623.2023.12.08.02.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 02:37:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EDVsiVxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBYDK-0006Cu-UZ; Fri, 08 Dec 2023 05:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBYDK-0006CQ-2i
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 05:36:10 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBYDG-00022u-2g
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 05:36:09 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bf7bc38c0so2120471e87.2
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 02:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702031764; x=1702636564; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F3mSKFF9tA29R4ffI67DQveh1811FkFatia/cRa4Umc=;
 b=EDVsiVxvxNGkrVxtPxpqy4FsSggzVhgET8TchznNHqq0+E6envCrVDsGTgYx1YDa7Z
 iJdDLgs8Kp3tqaJLyCXbGScIS+NvinfWECgGMzJGzQAjvngHcohRzuKUmitec+NTZ2wr
 zwoPHgtBOjBIXNFbEOv3Ck1dXW06MJYeN2dW3p7NdJDgVY+7ehXX3D2rH67JtWKS728Y
 EBpICnXHFXm6Cx/ZYbanJj/KqobpFgi0rxpEQIkjDXl+pHdC87N9E0mU7GzkPMw7Q0Pu
 Q1+XsNdoJg2FlXhMDbo9oM+406TNOxSJK0AzKlCNu3O0r5s1wWWfNOZ6Stiw1voIT0c+
 eEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702031764; x=1702636564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F3mSKFF9tA29R4ffI67DQveh1811FkFatia/cRa4Umc=;
 b=ClepHeizz56Z1yxkqj5x/prG1MiUNszqT2dUPbrXoP+NxkdUulyp7gJ3gekg4jvg4Y
 sl4+YaADZ6wewPTSTSJcTjf2ONSpBBlbXJoscJCfoDf2C4F7wuVjVkTI2bJqFn6dTaMH
 b65URaMlD2genK7mm8HyYYHIytXfkkAJjWzlcnKiEt9BxD1pghTd0tHwqNrLVPqipcMK
 jw5X1kmKUfOy6rvQwV481U+TUm6QoMu8tojcaW/Wvv86k/tQVdPlELlz9efiG2mgnHyg
 o/KxzXe57m4YdR9uXUDH4wPBTgQbljzSaijbcY64ESq2WU/2URG6L9EnjssWE2KhcEiO
 tSQQ==
X-Gm-Message-State: AOJu0YwDRxe5W1iORGPHOgPvIQMr9uucAN0yH6epBhlbcDx+Cpbme1Gt
 dyULpPAt0PqV0+/FZAHxSDzWGA==
X-Received: by 2002:a05:6512:158e:b0:50c:6b:f180 with SMTP id
 bp14-20020a056512158e00b0050c006bf180mr2113994lfb.56.1702031763978; 
 Fri, 08 Dec 2023 02:36:03 -0800 (PST)
Received: from [192.168.69.100] ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 cy13-20020a0564021c8d00b0054c52a78f56sm678084edb.56.2023.12.08.02.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 02:36:03 -0800 (PST)
Message-ID: <323be810-5f4e-4218-812a-7c0ebc858599@linaro.org>
Date: Fri, 8 Dec 2023 11:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] target/arm: Ensure icount is enabled when
 emulating INST_RETIRED
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20231207154550.65087-1-philmd@linaro.org>
 <20231207154550.65087-3-philmd@linaro.org>
 <9508bf5e-a554-468f-ba94-4d6f1a5be7bf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9508bf5e-a554-468f-ba94-4d6f1a5be7bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qs62W4MCtw2l

On 7/12/23 23:12, Richard Henderson wrote:
> On 12/7/23 07:45, Philippe Mathieu-Daudé wrote:
>> pmu_init() register its event checking the pm_event::supported()
>> handler. For INST_RETIRED, the event is only registered and the
>> bit enabled in the PMU Common Event Identification register when
>> icount is enabled as ICOUNT_PRECISE.
>>
>> Assert the pm_event::get_count() and pm_event::ns_per_count()
>> handler will only be called under this icount mode.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/helper.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index adb0960bba..333fd5f4bf 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -940,11 +940,13 @@ static bool instructions_supported(CPUARMState 
>> *env)
>>   static uint64_t instructions_get_count(CPUARMState *env)
>>   {
>> +    assert(icount_enabled() == ICOUNT_PRECISE);
>>       return (uint64_t)icount_get_raw();
>>   }
>>   static int64_t instructions_ns_per(uint64_t icount)
>>   {
>> +    assert(icount_enabled() == ICOUNT_PRECISE);
>>       return icount_to_ns((int64_t)icount);
>>   }
>>   #endif
> 
> I don't think an assert is required -- that's exactly what the 
> .supported field is for. If you think this needs additional 
> clarification, a comment is sufficient.

Without this I'm getting this link failure with TCG disabled:

ld: Undefined symbols:
   _icount_to_ns, referenced from:
       _instructions_ns_per in target_arm_helper.c.o
clang: error: linker command failed with exit code 1 (use -v to see 
invocation)

