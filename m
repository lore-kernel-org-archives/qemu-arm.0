Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp167031eja;
        Wed, 1 Nov 2023 22:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo/LzALlNC+8LO1HHnEucitXu2zf/TpoFX29mQiAmYMUwV4VyypzPQKIOSMuGOmzze4Pn4
X-Received: by 2002:a05:622a:138b:b0:41c:e206:349b with SMTP id o11-20020a05622a138b00b0041ce206349bmr19341323qtk.68.1698904337560;
        Wed, 01 Nov 2023 22:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698904337; cv=none;
        d=google.com; s=arc-20160816;
        b=lmUUWa8njAdcHnyv4obH4i06XCAz6eMGJhApDyWEG7cw99qvbWGryIgKGlXTP/ttLO
         6NhvzB4DsXcrQtDVgGIduUo0BvDOn9olFMu1pXVuzAtiHPfDJM33X6hVb1WM3c89zbnz
         NJOtkImmxCqft8HhFAhz+AAeqkEMtOH1Ob0b3elpia4KCr41/0eYaekeTvcrJORzGCbj
         wIdQOEXuhrs+FGm6+P04dEURJ/AJVIp+Emeeco5Itd7YgDC+iVjgQzqpZEfTk9bpFXfl
         NLAN+rJBzokGiv9bmDIlhJOopM6I3Lxt2ZGi3JWOaT6IeU58teTAsLaIettZv7c1MvvE
         gd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=UA80L3EvdA6td7rtccD3Cda1TSOodEs9cogg7rVe4ZM=;
        fh=DuEaqkrjC096WqKe5kAiiFohIK1bqLCXeTtEKvSjoDg=;
        b=yCSXt5bwv3vC7w7zpp8unRIxtRKswrX3bM4QsW+7OCchw+PF/rPoBYP3M2e0M6hW3U
         jPk5y8AeQRQ1eVQKb3Zw84YwO8LEstExQIzEWWMLUnQf9d1vRUYtQgOKrSCuovLucwmq
         iNN1lXaFvYeA34KDDgcN5MYib6DanoJIAaZMNYuuGmElwD5MezHlAaERClfU71N7lnXj
         WvtdWvbMvMStRyJRJIhTEbWSxzWi8iPZHi5CD8U0HvL4xTyH9cQN8xpn7auahHgBcGi1
         b/QG0j4tP0LUR2p+SHJ1LgRloPygzWNMwz+WqcJOtlGLSI/rxjYdM/ogx21mjxe209Is
         c7Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dAh2wFIi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a05622a04ca00b0041808244656si3720831qtx.313.2023.11.01.22.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 22:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dAh2wFIi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyQcc-0007Iy-4l; Thu, 02 Nov 2023 01:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyQcZ-0007Ig-Lm
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyQcX-0008F6-7s
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698904316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UA80L3EvdA6td7rtccD3Cda1TSOodEs9cogg7rVe4ZM=;
 b=dAh2wFIiq4+U9bMztpdJjAookqbbnOrg+mu5W/5ENnylwERm8dfiLhVdHwHJ5HNe8vSxOr
 bZYiwxBjMjrAnVaQZ7mO7ea0WYr1IzwO4KhnlBPXOaAfHEY7QmZJuOjYbK0XggngZcqB3W
 Uo2wsnuRvfmt62MCvT5Jaivwk8qXR7M=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-TbmarGMMNqyhb3Ug1kMY0Q-1; Thu, 02 Nov 2023 01:51:54 -0400
X-MC-Unique: TbmarGMMNqyhb3Ug1kMY0Q-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-28011e1cdcbso576551a91.3
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 22:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698904314; x=1699509114;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UA80L3EvdA6td7rtccD3Cda1TSOodEs9cogg7rVe4ZM=;
 b=juxf1Lb2o6XTgKgRDWO61F2vTK/+TdAI+lHu6ZguVZNrzBXEamJtP0dCQeB7g6/kB9
 4A1PhGvR8qKf5hXgX4Ku0UFvxs3LGGX2BP6doYGAFxG07n/xNlDRiL8Af+rwzIPHHBH1
 ABM0uZgVfUkto0bQgmYeA9HlPSte5UsNIVo7EfpB0Pv9FXqirIqqz6Rhmn/VN74AKJ8B
 h9U37QpBfyzKe1+NdmvqQaPNeSLNH5V4uAIqROPjmy7nEPf2Bb+i7HU6vTSJ0v2CotLI
 KmRIpX+Nd6WuCCdNkiyGMjOGM+Zh05dmH1kzF9FKK6izVE9hXb0NUiFloJIfOAOw3H4l
 BPZQ==
X-Gm-Message-State: AOJu0YzgQZGn7cHY1K/oMRUnUoXAq1cRAT5Rp098Iy6g2wOozfjyLlGI
 Mcz1HcemI7iNuWLjZgAe4HDPaJJoM3SnXfUl8eAa18/KCjpwks09vQF2YldsjHVDtSbg2VWh82O
 /LsRhOnfKSJNr
X-Received: by 2002:a17:90a:7e88:b0:280:c97:5968 with SMTP id
 j8-20020a17090a7e8800b002800c975968mr15998986pjl.5.1698904313905; 
 Wed, 01 Nov 2023 22:51:53 -0700 (PDT)
X-Received: by 2002:a17:90a:7e88:b0:280:c97:5968 with SMTP id
 j8-20020a17090a7e8800b002800c975968mr15998977pjl.5.1698904313551; 
 Wed, 01 Nov 2023 22:51:53 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 11-20020a17090a19cb00b002808c9e3095sm1845129pjj.26.2023.11.01.22.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 22:51:53 -0700 (PDT)
Message-ID: <708d6ac4-09fa-4015-ad80-833d90f1f559@redhat.com>
Date: Thu, 2 Nov 2023 15:51:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/33] cpu: Call object_class_dynamic_cast() once in
 cpu_class_by_name()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-4-gshan@redhat.com>
 <1c2e53fb-4133-498c-8d96-b0cdc21b51cd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <1c2e53fb-4133-498c-8d96-b0cdc21b51cd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xrXGxn0FR3zH

On 11/2/23 13:52, Richard Henderson wrote:
> On 11/1/23 17:24, Gavin Shan wrote:
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> For all targets, the CPU class returned from CPUClass::class_by_name()
>> and object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE) need to be
>> compatible. Lets apply the check in cpu_class_by_name() for once,
>> instead of having the check in CPUClass::class_by_name() for individual
>> target. In order to make CPU_RESOLVING_TYPE visible to cpu_class_by_name(),
>> the helper has to be moved to cpu-target.c
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   cpu-target.c           | 15 +++++++++++++++
>>   hw/core/cpu-common.c   | 14 --------------
>>   target/arm/cpu.c       |  4 +---
>>   target/avr/cpu.c       |  8 +-------
>>   target/cris/cpu.c      |  4 +---
>>   target/hexagon/cpu.c   |  4 +---
>>   target/loongarch/cpu.c |  8 +-------
>>   target/m68k/cpu.c      |  4 +---
>>   target/openrisc/cpu.c  |  4 +---
>>   target/riscv/cpu.c     |  4 +---
>>   target/tricore/cpu.c   |  4 +---
>>   target/xtensa/cpu.c    |  4 +---
>>   12 files changed, 25 insertions(+), 52 deletions(-)
>>
>> diff --git a/cpu-target.c b/cpu-target.c
>> index 79363ae370..876b498233 100644
>> --- a/cpu-target.c
>> +++ b/cpu-target.c
>> @@ -250,6 +250,21 @@ void cpu_exec_initfn(CPUState *cpu)
>>   #endif
>>   }
>> +ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
>> +{
>> +    CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
>> +    ObjectClass *oc;
>> +
>> +    assert(cpu_model && cc->class_by_name);
>> +    oc = cc->class_by_name(cpu_model);
>> +    if (oc && !object_class_is_abstract(oc) &&
>> +        object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE)) {
>> +        return oc;
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>>   const char *parse_cpu_option(const char *cpu_option)
>>   {
>>       ObjectClass *oc;
>> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
>> index bca0323e9f..1024de53bb 100644
>> --- a/hw/core/cpu-common.c
>> +++ b/hw/core/cpu-common.c
>> @@ -147,20 +147,6 @@ static bool cpu_common_has_work(CPUState *cs)
>>       return false;
>>   }
>> -ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
>> -{
>> -    CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
>> -    ObjectClass *oc;
>> -
>> -    assert(cpu_model && cc->class_by_name);
>> -    oc = cc->class_by_name(cpu_model);
>> -    if (oc && !object_class_is_abstract(oc)) {
>> -        return oc;
>> -    }
>> -
>> -    return NULL;
>> -}
> 
> This move is unnecessary: typename == CPU_RESOLVING_TYPE.
> 
> Indeed, since you've grabbed class_by_name from CPUClass, it is completely logical that that's the base class against which we should verify.
> 

Good point. I just realized typename == CPU_RESOLVING_TYPE, so the movement
isn't needed at all.

[gshan@gshan q]$ git grep \ cpu_class_by_name\(
cpu-target.c:    oc = cpu_class_by_name(CPU_RESOLVING_TYPE, model_pieces[0]);
target/arm/arm-qmp-cmds.c:    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
target/s390x/cpu_models_sysemu.c:    oc = cpu_class_by_name(TYPE_S390_CPU, info->name);

[gshan@gshan q]$ git grep 'define CPU_RESOLVING_TYPE' target/arm/*
target/arm/cpu.h:#define CPU_RESOLVING_TYPE TYPE_ARM_CPU
[gshan@gshan q]$ git grep 'define CPU_RESOLVING_TYPE' target/s390x/*
target/s390x/cpu.h:#define CPU_RESOLVING_TYPE TYPE_S390_CPU


Thanks,
Gavin

