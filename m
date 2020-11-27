Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2258092lfb;
        Fri, 27 Nov 2020 02:59:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRligaFXxcWjhOZXQEeDwxH5ZqZLl8W6PhT/Vq/xR8wh1NLddzF5gjMahfEAfUDR/m8aXr
X-Received: by 2002:a25:5016:: with SMTP id e22mr8358417ybb.156.1606474744318;
        Fri, 27 Nov 2020 02:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606474744; cv=none;
        d=google.com; s=arc-20160816;
        b=gbfKsVuLOonYY4pIZcj+GJoEtU91nAYytyF1Ad17pzgbhUx5GAI7jmFbOcUSK0lsi+
         xACah2M4TLApEc2jXV5EDi4o1YKJzzujxNVCIvQQ8h4Fefwk/eG5Rn6rcGYNAkY08vhh
         d+CvO+3WekbRqEkTYDwm+aGG12x0Fp/Lscwa65nKHMkluTMhZJLrA+6ybNapEOiMO864
         xK8QfqE8V1X13FXyKiduWo2ugdVrLQjPfzulzkpmKQsO6CCTVLO0rC2aCvMzSsaXcyy2
         g8K6P5TeqNbQc/AqEBveStC6uYPO7nSMzk9TJSIdJ4+ZdJC3rhkwaTpcvl1ik+YqiBQf
         d5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=k01k6j/AlRML0EuGhGkCRBldg1dmNEMR0Ya6rMrtZG4=;
        b=eZc7bMSMLQTLPClfDpAZ/Be4haCDp1tax9BaA3kyN844eal8diNr0CvjThp0LfYcXo
         OTdtquvQceGjbYpJLjtRy9V3XKr8fGdG7lo8iV7SkubvXnxpeARzUUgSi82PInLpOita
         S+rpsmuTC9Yb2b5himQ4S6I6WyuPQD/wFKC8E7D3Fr+KSIR967B8tpQR2st9yEXS0p+L
         It2BV0/Jy91Mr4krAxr2/17TdmOJ+eUzeRDVkbJMk3ZeFJCcV7sl0lhpzb3tVSP1DCFy
         LixMjLZjSz755zQTdaW6eEm4idCwM2y7kIRxFJf8eu/Jl2wTkRYA0KN6enkHPQd+DMHa
         OJ1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si9695306ybo.243.2020.11.27.02.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 02:59:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kibSx-0003Pl-PG
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 05:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kibSm-0003PY-PQ; Fri, 27 Nov 2020 05:58:52 -0500
Received: from mail.csgraf.de ([188.138.100.120]:43198
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kibSh-0004pe-W1; Fri, 27 Nov 2020 05:58:52 -0500
Received: from freeip.amazon.com
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id A90403900279;
 Fri, 27 Nov 2020 11:58:44 +0100 (CET)
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
 <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
 <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
 <CAFEAcA9QUfBQpmH=8_A+xDm53GkkOgFEDnkTDXOX_1A-bFg0Ng@mail.gmail.com>
 <284d0cd2-268b-b937-3a6e-d074ce28baee@csgraf.de>
 <3594db71-c72f-2946-ffa5-47da737900c6@redhat.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <bfbf4660-5e34-5fda-e71d-b88670d6dad7@csgraf.de>
Date: Fri, 27 Nov 2020 11:58:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3594db71-c72f-2946-ffa5-47da737900c6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bX6Xp8dKTDXe


On 27.11.20 05:41, Paolo Bonzini wrote:
> On 27/11/20 00:32, Alexander Graf wrote:
>>
>> On 26.11.20 23:26, Peter Maydell wrote:
>>> On Thu, 26 Nov 2020 at 22:16, Alexander Graf <agraf@csgraf.de> wrote:
>>>> cpu_synchronize_state() sets the CPU registers into "dirty" state 
>>>> which
>>>> means that env now holds the current copy. On the next entry, we then
>>>> sync them back into HVF.
>>>>
>>>> Without the cpu_synchronize_state() call, HVF never knows that the CPU
>>>> state is actually dirty. I guess it could as well live in cpu_reset()
>>>> somewhere, but we have to get the state switched over to dirty one way
>>>> or another.
>>>>
>>>> One interesting thing to note here is that the CPU actually comes 
>>>> up in
>>>> "dirty" after init. But init is done on realization already. I'm not
>>>> sure why we lose the dirty state in between that and the reset.
>>> Yeah, it sounds like you need to figure out where the dirty
>>> to not-dirty transitions ought to be happening rather than
>>> just fudging things here...
>>
>>
>> When init is complete (system is ready to launch), the CPU state is 
>> pushed to HVF and dirty is set to false. So by design, a normal 
>> cpu_reset doesn't have vcpu_dirty set.
>>
>> How about this patch instead?
>>
>> Alex
>>
>>
>>
>> commit 8c61bc4d613b01e251b6b2f892d1a55a333c6e37
>> Author: Alexander Graf <agraf@csgraf.de>
>> Date:   Thu Nov 26 02:47:09 2020 +0100
>>
>>      hvf: arm: Mark CPU as dirty on reset
>>
>>      When clearing internal state of a CPU, we should also make sure 
>> that HVF
>>      knows about it and can push the new values down to vcpu state.
>>
>>      Make sure that with HVF enabled, we tell it that it should 
>> synchronize
>>      CPU state on next entry after a reset.
>>
>>      This fixes PSCI handling, because now newly pushed state such as 
>> X0 and
>>      PC on remote CPU enablement also get pushed into HVF.
>>
>>      Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>
>> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
>> index b75f813b40..a49a5b32e6 100644
>> --- a/target/arm/arm-powerctl.c
>> +++ b/target/arm/arm-powerctl.c
>> @@ -15,6 +15,7 @@
>>   #include "arm-powerctl.h"
>>   #include "qemu/log.h"
>>   #include "qemu/main-loop.h"
>> +#include "sysemu/hw_accel.h"
>>
>>   #ifndef DEBUG_ARM_POWERCTL
>>   #define DEBUG_ARM_POWERCTL 0
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index db6f7c34ed..9a501ea4bd 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -411,6 +411,8 @@ static void arm_cpu_reset(DeviceState *dev)
>>   #ifndef CONFIG_USER_ONLY
>>       if (kvm_enabled()) {
>>           kvm_arm_reset_vcpu(cpu);
>> +    } else if (hvf_enabled()) {
>> +        s->vcpu_dirty = true;
>>       }
>>   #endif
>>
>
> Why only for HVF and only for ARM?  For example hax_init_vcpu and 
> whpx_init_vcpu both set s->vcpu_dirty; should you just set it 
> unconditionally in cpu_common_reset?


Mostly because there is a lot of super fragile logic all over resets 
atm. Init setts dirty, post-init clears it. Then the arch reset handlers 
assume that state is not dirty and fiddle with KVM reset ioctls and KVM 
register modification ioctls directly. Mostly because KVM for the most 
part implements its own reset logic.

I'm fairy sure I'd break someone unintentionally if I just throw this 
into the common reset handler.

However, if we're happy to fix the fallout when it arises, I'm happy to 
do so.


Alex


