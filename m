Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBAFC83F17
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 16:19:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uecAu-0004yY-Ut; Wed, 23 Jul 2025 12:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uecAl-0004km-9x
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:18:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uecAi-0005tZ-Tm
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:18:27 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so39752705e9.2
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 09:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753287503; x=1753892303; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PgMZti/53Goy6TgiBoJAWym2zeQbCAgT/SnCcoSAQ44=;
 b=kjFMXDCAzZeO4IC2nHh9kvYivw4bkuCI1o9e2oJIGDcSL2U6LY6Sm9DlFO/0Z5obWw
 G/rNQyZ0F4dt6xjcwdzTLOKtO+ladvF77YVjUqNZ/1BvoW0CPXucX//U+7h2tikPcDKy
 V3OutIq3jFbnHZUPq7nWryjBztV1FjSx4i3ulgHNHIFK8juvP7BOJa2PmiNMjQ4mplmK
 H/CG3S75uIjb9kdk7kqhUAVBbkFxl+KZMJ7DechmIka5pj/YQDhuLfrXRTdWtlyP7V9B
 9lAtMzfKLyUJvK+CzDe6vxQF2YOwqY7/xKVI3baT2H9poYRKxkZVfPnbgxhzqqRwvaBX
 P44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753287503; x=1753892303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PgMZti/53Goy6TgiBoJAWym2zeQbCAgT/SnCcoSAQ44=;
 b=QZyvPWB7HcidDXRdSRoiBdPcJH9NA7GaxriJH9s4/E/si8xN+tggre5tfcm3LgQzM0
 Kgua84ttUfWa6kI4wkq5XqhWfuZCJy2Rnv7G7h8H5uFUNxpShPd/JmNKSfvRjV3kcR/s
 u+56B/njrre1Cx6GSGi2U4ac7FJNCX/BIgK0LR2PDD+RVahVLTx1+lXX+5aEJxGroba2
 HHKFYVFI8ZSimR/QjtaXz3DZ+2IYzX7VQD9zJSXXToBt9YuL02qun5ObeBiIS6lhMh0G
 TMle2hgr2uoax0xLLSco5wgzSjhxCbOdWk6OKxuNyqBMzr3Tz0a6/AjQgBMEd1TL/7iu
 noPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXblUdHW3TPPpJo2Or/oLtWFqi9//LwEuJx1+22YCXkUOe9YgYmfg7kfrFWPYaPsLrpODnrwPKC1g==@nongnu.org
X-Gm-Message-State: AOJu0Yzd/KoT+OoK+Z1ESQ5NKZdiCGvPpSOJJ3PV6+EaqHSRTxTBa++c
 oOv0CbXR6oTWpN4mZJNzlUcgGUhgegxOfjCdyH3uVgumT51GSEgHpR08hIMymy0xsVE=
X-Gm-Gg: ASbGncuB7BX4namGvwsAp3WqR6IJqooHK5b6pzyFqNNnmteS+uJShI+Ec5sXoz3g4/J
 0Wi7N5ZAA5SyCDigMjqzJrUxDocftuJ+cvoCUgnd9oYVV3e47FeHja1tg82OLnQmDsJ+rkKKrgP
 bXBf/DLbgBrXjrl6i2/YBkqfqenCcT1h2RcsA2nIfHY1FYGj6ZjEEJTrKPhcODLQnZK/XPTxB4z
 1QDr6tu6kE9pGvsIUQ03V9VLr/jNNdZLcVCN6acsQbdyi6ioM4h7IyqZiFuqH5cUErkDcCLcRu6
 eAa0doxs7WaCuKjJo6pnC+8OZYatwjQSdyA3fSugIQ3HbDIoBYKxU/X8SDxgHJn6vq1lbv8TcPF
 c7d7No+8S/a6WUqfjaWciNj9LlEZc7juOByoCVX1pLSjW+X3gQ1F/WTIAMcpbIBp0gg==
X-Google-Smtp-Source: AGHT+IGfaOIkPRvhm3A/mYHIebDUBN1xrQgbRrVr1VV0m/JQH7ejrfqw+c43QeV8vWNa0d/hhAVQxQ==
X-Received: by 2002:a05:6000:4029:b0:3a5:1cc5:aa6f with SMTP id
 ffacd0b85a97d-3b768f1627cmr3243706f8f.34.1753287502922; 
 Wed, 23 Jul 2025 09:18:22 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76773a2c2sm3728122f8f.0.2025.07.23.09.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 09:18:22 -0700 (PDT)
Message-ID: <fc09711d-7b1b-43fc-be0f-01663593ddf3@linaro.org>
Date: Wed, 23 Jul 2025 18:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v4 1/4] accel: Introduce
 AccelOpsClass::cpu_target_realize() hook
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250723135156.85426-1-philmd@linaro.org>
 <20250723135156.85426-2-philmd@linaro.org>
 <CAFEAcA-HH3pyWv4sF6ujLFdMAhtYV8H0TxjJ1Z6myHu5hbWusQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-HH3pyWv4sF6ujLFdMAhtYV8H0TxjJ1Z6myHu5hbWusQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 23/7/25 17:49, Peter Maydell wrote:
> On Wed, 23 Jul 2025 at 14:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Allow accelerators to set vCPU properties before its realization.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/accel/accel-cpu-ops.h | 1 +
>>   accel/accel-common.c          | 5 +++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
>> index 0674764914f..9c07a903ea0 100644
>> --- a/include/accel/accel-cpu-ops.h
>> +++ b/include/accel/accel-cpu-ops.h
>> @@ -34,6 +34,7 @@ struct AccelOpsClass {
>>       /* initialization function called when accel is chosen */
>>       void (*ops_init)(AccelClass *ac);
>>
>> +    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
>>       bool (*cpus_are_resettable)(void);
>>       void (*cpu_reset_hold)(CPUState *cpu);
>>
>> diff --git a/accel/accel-common.c b/accel/accel-common.c
>> index 850c5ab4b8e..eecb2a292af 100644
>> --- a/accel/accel-common.c
>> +++ b/accel/accel-common.c
>> @@ -106,6 +106,11 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
>>       if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
>>           return false;
>>       }
>> +    if (acc->ops
>> +        && acc->ops->cpu_target_realize
>> +        && !acc->ops->cpu_target_realize(cpu, errp)) {
>> +        return false;
>> +    }
> 
> You don't need to check if acc->ops is NULL here: per the
> comment in accel_init_ops_interfaces(), all accelerators
> need to define ops, and we would have already crashed if
> it was NULL.

Only system-mode registers @ops, so unfortunately we need this check
for user-mode emulation... Richard and myself are aware of this and
plan to work on exposing AccelOpsClass to user code (after v10.1).

