Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93900C83F17
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 15:20:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZt3X-0003JV-9l; Thu, 10 Jul 2025 11:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZt35-0003FN-PH
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 11:19:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZt34-0000zb-17
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 11:18:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4538bc1cffdso9528585e9.0
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 08:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752160734; x=1752765534; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MfZyp+BAuA2g9PjhPJtLMHhk3jnprAKK1n7JOk5VyB0=;
 b=sWbAhtRjB11dTCnFTi/KfBy2gYiaZUrCGSp8f+dmJE9SN9uo4dNkanPRCG0HZpyvF5
 xYdap6vKVyk6dKd9ZRxOTcBg4lVgvo59enNEar4iS+M7T2e6gPnvySgy0p9het/JixKt
 8XH4ZQzWa9T/ejB+l98fMfjZey9/2dcN0RCCZLSCwrlqADH75Ay49SUz3z3goy+oPzj1
 88552hvQgBfhomZlnhxBz41yfMn4wNSZgdndfqkpu2xl2rC426OdUVhrlnL+dA+QlJJD
 +PD1YFZwcSrladY+O+OrQmMkMg0xRJwoCg7pjBeDP1pqABiRVmMx9NhwoK+uuwMFXeN7
 SD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752160734; x=1752765534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MfZyp+BAuA2g9PjhPJtLMHhk3jnprAKK1n7JOk5VyB0=;
 b=UJ2scvU4ojIJ7XergtQnAtDK5EISpvEMDtl4oOspfu5eghstODR28V/gou0t4CV7Nj
 SLAhWr5hyj5dNqLNhgQJ0tSaH4ZVa50SqfCYCTnWv8sB93NW1bK5gtI5w8DGgT16t5hF
 nxRPqz/MPcXWxYV1N89xl3eyhTfSREwkBMBkqVP8mX7o0rroASKX0buw1PWtjXROr1iL
 29rG3XJ3YIWr31yOmvDzuBdrrlSO0PILsM8WmBCaEDEW5nFkxdfJfX+C6Sptu4TmwNee
 YxCkJ68O/aj2gdZg2oYHf57HDt4SbVzh6C6EOu7AVOuWLB+CaSBd4xmmfaQFXMVxfH3o
 JUAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa0eUKr83XiO5t/RsNQk9qIoAgslkw8f0WhiGaX9/+V6ZVCIbWcgdz3yxr5QffJzl0v770/xNr0A==@nongnu.org
X-Gm-Message-State: AOJu0Yw3bV3Z4RrfyJVnfmu4EtImkCx1ZrLOLeCvzgUjk8d7vrhov8uz
 h+U94NbdNHTZYBshxHsjbt0KGPj8l9i/jqVAz19+Hzf7YbkKj0VTWxFDWo4EzIUlIII=
X-Gm-Gg: ASbGncv/FOnV3aNNv8xgWfCoieV/f9FtQ721y4w4lmCJZ8K12/eu+UfMV+y4bCFhn24
 zGXLN/ehPnLf7CDFfQzQZYEOQ/qDehWGdJfk3xLNPoubHX8qajzQolvDMZx1byjJI+yp4EuE7Df
 TxmAedI+BnnCeNAeXBzRV8mhScNjLrm2/2jUSqBiOoYQx0tksfke1UnFwFap6coxcQSdYxXYa1A
 TXA6tNAji7qsycfW06f/axiOcON4RnpO2jijKfANCXIyzGx1A2Z7e0y5oQvn2DMID1ZCYMTCohK
 1663Nb4YPPux+5liUKZltN8Id4Kk3khnInabfJqN3UsbRhIDqppDS6imKrPTPgy97QAOrQWymuG
 6iE7brfqLEIdCaU3mvuSxZ6VWERJqSyNdHwQnhLdOXM8tgxpseyWVA+guoxM=
X-Google-Smtp-Source: AGHT+IE1oZjhzQk0HmsfNxjc+2TH48TEZkrMxRycjdwmoHSN9WIEppocXlx0JxXlZZYHEo6Tvx1UdA==
X-Received: by 2002:a05:600c:1da8:b0:43d:47b7:b32d with SMTP id
 5b1f17b1804b1-454dd2ef513mr28837375e9.25.1752160733973; 
 Thu, 10 Jul 2025 08:18:53 -0700 (PDT)
Received: from [192.168.1.117] (lfbn-mon-1-970-120.w86-227.abo.wanadoo.fr.
 [86.227.5.120]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc201asm2114977f8f.22.2025.07.10.08.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 08:18:53 -0700 (PDT)
Message-ID: <dcaa2309-7c6d-4064-94ed-43d4c3ff2430@linaro.org>
Date: Thu, 10 Jul 2025 17:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] hw/arm/arm_gicv3_kvm: Add a migration blocker with
 kvm nested virt
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, gkulkarni@amperecomputing.com,
 gankulkarni@os.amperecomputing.com
Cc: hi@alyssa.is
References: <20250707164129.1167837-1-eric.auger@redhat.com>
 <20250707164129.1167837-5-eric.auger@redhat.com>
 <48fca85b-096a-4d1c-97dd-380669cb6604@linaro.org>
 <322a9301-a1ee-4cd9-b423-fbef2fc0593d@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <322a9301-a1ee-4cd9-b423-fbef2fc0593d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 10/7/25 16:10, Eric Auger wrote:
> 
> 
> On 7/10/25 4:04 PM, Philippe Mathieu-Daudé wrote:
>> On 7/7/25 18:40, Eric Auger wrote:
>>> We may be miss some NV related GIC register save/restore. Until
>>> we complete the study, let's add a migration blocker when the
>>> maintenance IRQ is set.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    hw/intc/arm_gicv3_kvm.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>>> index b30aac7aee..fccb3886bf 100644
>>> --- a/hw/intc/arm_gicv3_kvm.c
>>> +++ b/hw/intc/arm_gicv3_kvm.c
>>> @@ -827,8 +827,16 @@ static void kvm_arm_gicv3_realize(DeviceState
>>> *dev, Error **errp)
>>>        }
>>>          if (s->maint_irq) {
>>> +        Error *kvm_nv_migration_blocker = NULL;
>>>            int ret;
>>>    +        error_setg(&kvm_nv_migration_blocker,
>>> +                       "Live migration disabled due to KVM nested
>>> virt enabled");
>>
>> (mis-indentation)
> Did not notice as checkpatch does not complain.

No worry, it is a simple nudge to Peter for possible maintainer fixup.


