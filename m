Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1800710lfb;
        Thu, 26 Nov 2020 14:16:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMcFKUmYcD/1xC2n6UsMcHEPT3/f97flzzhD1/oC32IW/Ps68DM8ASj79DkwE+jXmCtMXL
X-Received: by 2002:a25:6ec3:: with SMTP id j186mr6899611ybc.165.1606429015821;
        Thu, 26 Nov 2020 14:16:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606429015; cv=none;
        d=google.com; s=arc-20160816;
        b=KYuTwcB4Agrte3YTLc0K3x98apZtpt/ZLQgXiW3hboLzwRA/+lZ6dwdKE05zY75YmE
         us5GAaPknXiymjsPivK5/eRViMGh8RRB6bgAG3IKL4xz3bq0NoxRoG2g17Wx24i1n8nh
         WpsroxpNHeBp/MECW1q6ONcHe9PYLzVi0bvJaDahn8DANDtpEhc1jU1JYgyUJWZQOV8z
         G7QBkGYzDfc1Zy7Gn1MSPW+04MF/KGk+vcWZ9xa1B0Lilquhg2wH0ahwdYCZPfjNAr9v
         M3Sm4wBicqROCyDEuCBt9+ztTq8PH/mQat4x+zLSyNHWwARj3fLtSIS+HW6G7n1Umj1v
         JGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=6nRP+0XUAtINd1bfCW1PTPlI0BzdnuqYMWh3YS8fSk0=;
        b=E7goRUeDMVnI5Y2yeUzZnSlxrhjT+dtL1VuqvEXPg4TGvhBWcC/3QaPYgqLBiEqgza
         773BFUCUwA776nIJM34P4tMkwQQCLcHw6DBd7AVKqZ+r03yTmlNS7OEQS9D1oVuIcHPa
         fDzEz09w8kPhPHV+bxL9u4uXRFac0yRyG1o0jzWbwBs/1cT+w1y/IEyroIWTIHm2/UKb
         e5+esNG88wNeJn4dE0EOn1K21w67No7qI2Ga0doelqhNgum+u0DLTovmi/wpcXopIf5h
         hh5T98hS9/AM9K5OPhvDCVgU50zLO5Eqw3As1KOiy+ADh87ziaYAAkGx0+YViO/J1VDz
         5Qig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si5792444ybr.109.2020.11.26.14.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 14:16:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPZP-0000OE-6y
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 17:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiPZ5-0000MH-Rs; Thu, 26 Nov 2020 17:16:39 -0500
Received: from mail.csgraf.de ([188.138.100.120]:33746
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiPZ0-0006Ew-2p; Thu, 26 Nov 2020 17:16:35 -0500
Received: from Alexanders-Air.alex.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id EB068390015A;
 Thu, 26 Nov 2020 23:16:23 +0100 (CET)
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
 <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
Date: Thu, 26 Nov 2020 23:16:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6XJSOKR9Yo4M


On 26.11.20 22:47, Peter Maydell wrote:
> On Thu, 26 Nov 2020 at 21:36, Alexander Graf <agraf@csgraf.de> wrote:
>> We are going to reuse the TCG PSCI code for HVF. This however means that we
>> need to ensure that CPU register state is synchronized properly between the
>> two worlds.
>>
>> So let's make sure that at least on the PSCI on call, the secondary core gets
>> to sync its registers after reset, so that changes also propagate.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> ---
>>   target/arm/arm-powerctl.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
>> index b75f813b40..256f7cfdcd 100644
>> --- a/target/arm/arm-powerctl.c
>> +++ b/target/arm/arm-powerctl.c
>> @@ -15,6 +15,7 @@
>>   #include "arm-powerctl.h"
>>   #include "qemu/log.h"
>>   #include "qemu/main-loop.h"
>> +#include "sysemu/hw_accel.h"
>>
>>   #ifndef DEBUG_ARM_POWERCTL
>>   #define DEBUG_ARM_POWERCTL 0
>> @@ -66,6 +67,8 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
>>       cpu_reset(target_cpu_state);
>>       target_cpu_state->halted = 0;
>>
>> +    cpu_synchronize_state(target_cpu_state);
>> +
>>       if (info->target_aa64) {
>>           if ((info->target_el < 3) && arm_feature(&target_cpu->env,
>>                                                    ARM_FEATURE_EL3))
> This looks weird. The CPU was off, so not running anything.
> Why doesn't the state we set up here get synchronized to
> HVF as part of the normal enter-guest-code process that we
> do when we do whatever HVF's equivalent of KVM_RUN is ?
>
> Also, we change more bits of CPU state later in this function,
> so if we do need to manually sychronize in this function this
> doesn't seem like the right place...


cpu_synchronize_state() sets the CPU registers into "dirty" state which 
means that env now holds the current copy. On the next entry, we then 
sync them back into HVF.

Without the cpu_synchronize_state() call, HVF never knows that the CPU 
state is actually dirty. I guess it could as well live in cpu_reset() 
somewhere, but we have to get the state switched over to dirty one way 
or another.

One interesting thing to note here is that the CPU actually comes up in 
"dirty" after init. But init is done on realization already. I'm not 
sure why we lose the dirty state in between that and the reset.


Alex


