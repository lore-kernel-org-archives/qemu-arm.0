Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39B2C83F1A
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Jul 2025 19:51:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucUdd-00087c-Nu; Thu, 17 Jul 2025 15:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ucS2d-0005TV-K5
 for qemu-arm@nongnu.org; Thu, 17 Jul 2025 13:05:10 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ucS2b-0001q1-GP
 for qemu-arm@nongnu.org; Thu, 17 Jul 2025 13:05:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-748d982e97cso1146281b3a.1
 for <qemu-arm@nongnu.org>; Thu, 17 Jul 2025 10:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752771903; x=1753376703; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XMqEN3QsE6wJqklujGilDAGpGh9DttXjTTF21J4POrg=;
 b=PTqyl12VCXgYsSWLywx/fNbfmnVYFo2vo2BV71OSFqSudbDNR5w+b8L87QOq7iF0I4
 xydpOzb3/VcPfwYFtLuXqssYwuZ7VEQZhRmH4P6XZlSkhEsHNbKV1msnnm+d+xobY529
 1PVR2+haNDuM/HO/+M31x91iMBGglw/Zo+jN92U5c/jdHjexTiUQicv6zoPSG6eFkjpm
 GdENYroYeFyTbxTT5waGqsTXaVgZ8z9nQ9JDrnuwXRmCtyIG764jRCYRpfu9MBdUZM2l
 hwjkbuBy3GD7aUwdm6MlXbbwGiclpl3L0ABo6lmEx3op2HHzZ6fZBbn6obRioiEMDkrS
 3Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752771903; x=1753376703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XMqEN3QsE6wJqklujGilDAGpGh9DttXjTTF21J4POrg=;
 b=ljK2zlnllkP7F4eTOv6gEpWLzpDe+cDpUgumrTwI8wA0QPR3to710sBXej0BTuMeoY
 PFZgLKx9HliJ+L3VlVCg7M9c2tRKEXaY45OiS4Ee4IFYOmwlfTcQ/6P0/2tiJmV3JQJ9
 cUr+RZnWUio3fFcUyzpW8GwPV7jgEbl6De22KNtUu6RX3dCZXxmPxDOn/d80gfIiRggz
 YUjrLGxsWbtexTH9XEl2q67X3lU1p6O24yTTl6rd7cLXmPNE9MsnAEJrOq4C/AVIgpNr
 +7tec/CiTL9H1OlY875wa0S7VXvdeOY7y2Pwb2vjhYvqFsr7E7BYKnvlYuGAaqQobaEE
 sQIQ==
X-Gm-Message-State: AOJu0YzOvwJRpY35OFQvLH2Uaz9d9I20E0fWdUU3WwIfrfrpC0lGse7H
 XXD0dzprVU9SuPZO5n9gQb9O6EM1Cgx+LKlao7pNu2tA5D9wIsQksl59Kp+IpA3p458=
X-Gm-Gg: ASbGncv3V91lsSgP5KCLYrjJLzKfVJRc+Gp8q8Xn5Ce5xdJ77d9FWilYSwi69HLxksA
 9mlINMGJU7Cc9T76oHn9MP1xi5dkrBRNXvEEPgbABUXTkMBfFQX6ISRw65ZpIJblBI2ClDD0/Sj
 3B8nlSvg+/h5t/Q55B4UL1LBzhaKXCOiiq2hvmJuszR/JUvaPO2lZD/bfyrHTimxaKoilPNLRo/
 t2iQ+5k0Cvko1U+ZtaolUY9YGFs5QT7gshQgo2mBuEwGwRBFQ0CkwQBzYqiSbV4c/KrBfw017HI
 rAodGooTvLBtKUp0cY6E7boYAzJd+Kbfp3a2djofd+J2GnlK4Xwbwu6kZglvNzsumntvCoDBciV
 jpM+PPnUtjUanh6uzzt4LcU+oCvxkYCy5piM=
X-Google-Smtp-Source: AGHT+IF/qH0tAxtwrPSw5eViUD90I+vxFsBCBqhCn7MD+oqEztGNU4QkwIEtyGL8TXpKDWzberbZVg==
X-Received: by 2002:a05:6a00:3392:b0:740:9e87:9625 with SMTP id
 d2e1a72fcca58-7572267d1f8mr10444044b3a.4.1752771902960; 
 Thu, 17 Jul 2025 10:05:02 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe345f2esm15810423a12.0.2025.07.17.10.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 10:05:02 -0700 (PDT)
Message-ID: <3ca15207-c4af-4cf8-8502-b78bf95bd5f8@linaro.org>
Date: Thu, 17 Jul 2025 10:05:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Provide always-false kvm_arm_*_supported()
 stubs for usermode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250714135152.1896214-1-peter.maydell@linaro.org>
 <0b438773-01b9-42e1-8edf-2330e50387f8@linaro.org>
 <95b00393-bdd2-4db3-ac39-02a09f83b4d7@linaro.org>
 <CAFEAcA_Hbpg0wkQ9frt+MUj7x7uR+p7+8o4SLLx=GwhWvfCzaQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA_Hbpg0wkQ9frt+MUj7x7uR+p7+8o4SLLx=GwhWvfCzaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

On 7/17/25 9:56 AM, Peter Maydell wrote:
> On Mon, 14 Jul 2025 at 16:41, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>> As folding is not guaranteed by C standard, I'm not sure it's really
>> possible to file a bug. However, since we rely on this behaviour in
>> other parts, maybe it would be better to rewrite the condition on our side.
>>
>> By changing the code to this, the folding happens as expected.
>>
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 26cf7e6dfa2..af5788dafab 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -318,9 +318,11 @@ static void cpu_arm_set_sve(Object *obj, bool
>> value, Error **errp)
>>    {
>>        ARMCPU *cpu = ARM_CPU(obj);
>>
>> -    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
>> -        error_setg(errp, "'sve' feature not supported by KVM on this
>> host");
>> -        return;
>> +    if (value) {
>> +        if (kvm_enabled() && !kvm_arm_sve_supported()) {
>> +            error_setg(errp, "'sve' feature not supported by KVM on
>> this host");
>> +            return;
>> +        }
>>        }
>>
>>        FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, SVE, value);
>>
>> If you prefer keeping your patch, I'm ok, but fixing the condition looks
>> better to me (as we already rely on constant folding in other places).
> 
> I'm not really a fan of relying on the compiler to fold stuff
> away -- it's fragile and there's no guarantee the compiler
> will actually do it. In this example it would be really easy
> for somebody coming along to tidy this up later to put the
> nested if()s back into a single if() condition and reintroduce
> the problem, for instance.
>

There are various places where we already relied on that, including 
before the single-binary work ({accel}_allowed).

For the fragile aspect of it, that's why CI exists. Building all 
binaries with clang --enable-debug should ensure no regression can be 
introduced.

> I've applied this patch to target-arm.next; thanks for the review.
>

Thank you Peter.

> -- PMM

