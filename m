Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp404938lfb;
        Thu, 3 Dec 2020 06:13:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHI6HyA/Qmik6xdkdlDWgEQonESvzyxWrilBP2V5RiCNsdhQfeN/lEdGwzXyEPMlBOWCPU
X-Received: by 2002:a25:b9c4:: with SMTP id y4mr4683483ybj.357.1607004820810;
        Thu, 03 Dec 2020 06:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607004820; cv=none;
        d=google.com; s=arc-20160816;
        b=qYSHkK1UZkymZUtNXG09aD7lXcR6rWPU9d1rM3/+SLtqkqjOWRLKkpG11veS6085mJ
         5HQN5Uvk5kz6AmP/QJRV93u4q9inO18Y1iHIFnzc8QkRatw1BbLaw8vKp9fR0uuzkMaD
         YsKU5Dj8Gzi8qFyUnLybIK3cDrKB4q08t/xCzFAshnIrvlFDX7XMW6tNH0iw3Psqpbdt
         Sm1uvXACIrTsgZgJVockk2S4kNG6gtbzieg7FzF+zA3cVluTbxwD8uoV1CHeXTyuxRm4
         ACcyk8ThxnAD29LDwsbFWi7zi8DUDdEsbo0XcRwlCalohNddCxRJ7HorSMmthT1N2fxN
         9N+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=yyYzXP41xRePADEAo0OjfuIQxow/ujCxNLAnSeMO6Ck=;
        b=VJUCk4NZH3mDlVRtAC2FWAKwgazM2l7QC/1lBR2fP0B9bAUFlqKYmwCIQkOSeq77IB
         ys/S6jx767Nw72cJDrwCsFMBqXrKKx8RacW39l6RdPZaSz6L4jMlIuo/wYdclhaERXx+
         6wUQZ1ASoFHQsd1Zvy8ZdBW4dBtQiapjlPVjy6v0Q6DrXw8LWuvIrysWWKuIYbsG8h9B
         DP+lZ3Lr7FLgql+f2fjtLJ2imK1pwDbFzSbgsu7pEGWjCdH0VN2CXmdSni6vgsLmlupT
         i4KO3QNTJePc8RGmgZEI3wYG/Y+xu8oC6I0KrSyUu06PwJ/0+OX1kv8TSthOwJNssouG
         3gkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p70si359004uap.160.2020.12.03.06.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 06:13:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkpMa-00037f-3q
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 09:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkpM7-00035M-Eg; Thu, 03 Dec 2020 09:13:11 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57032
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkpM5-0001m2-9B; Thu, 03 Dec 2020 09:13:11 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id CE0B23900107;
 Thu,  3 Dec 2020 15:13:05 +0100 (CET)
Subject: Re: [PATCH v3 05/10] hvf: arm: Mark CPU as dirty on reset
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-6-agraf@csgraf.de>
 <20201203015218.GA82480@SPB-NB-133.local>
 <55e5dac5-6508-da7f-3f29-05ee225b13da@csgraf.de>
 <20201203130233.GA14685@SPB-NB-133.local>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <34a2334a-d1c9-68bd-7617-7319b2037d69@csgraf.de>
Date: Thu, 3 Dec 2020 15:13:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201203130233.GA14685@SPB-NB-133.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DYa9CfwdNNZG


On 03.12.20 14:02, Roman Bolshakov wrote:
> On Thu, Dec 03, 2020 at 11:55:17AM +0100, Alexander Graf wrote:
>> On 03.12.20 02:52, Roman Bolshakov wrote:
>>> On Wed, Dec 02, 2020 at 08:04:03PM +0100, Alexander Graf wrote:
>>>> When clearing internal state of a CPU, we should also make sure that HVF
>>>> knows about it and can push the new values down to vcpu state.
>>>>
>>> I'm sorry if I'm asking something dumb. But isn't
>>> cpu_synchronize_all_post_reset() is supposed to push QEMU state into HVF
>>> (or any other accel) after reset?
>>>
>>> For x86 it used to work:
>>>
>>>     static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
>>>                                                   run_on_cpu_data arg)
>>>     {
>>>         hvf_put_registers(cpu);
>>>         cpu->vcpu_dirty = false;
>>>     }
>>
>> Yes, it works because after the reset is done, there is no other register
>> modification happening. With the PSCI emulation code in QEMU, we still do
>> modify CPU state after reset though.
>>
> Maybe I miss something but that doesn't seem correct. Why PSCI reset is
> split from machine reset?

Because with PSCI, you can online/offline individual CPUs, not just the 
full system.


>
>> Different question though: Why do we need the post_reset() call at all here
>> to push state?
> My understanding that post_reset is akin to a commit of the CPU state
> after all reset actions have been done to QEMU CPU Arch env state. i.e.
> arch/machine reset modifies env state and then the env is pushed to
> accel. cpu->vcpu_dirty is cleared because env is in-sync with vcpu.


I think that's only half the truth. What it semantically means is 
"QEMU's env structure is what holds the current state." Which basically 
translates to cpu->vcpu_dirty = true.

So all of these callbacks could literally just be that, no?


Alex


