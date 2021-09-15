Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp19609lfp;
        Wed, 15 Sep 2021 03:58:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3R1IWuEfdDamFmJYTxHDUQg547TK2rGgm8fEAt7+WuNSHaWLQNLAWVUbcn6wthHSwok5G
X-Received: by 2002:a05:6902:1204:: with SMTP id s4mr5021615ybu.92.1631703533230;
        Wed, 15 Sep 2021 03:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631703533; cv=none;
        d=google.com; s=arc-20160816;
        b=IN3EwYDK7+QOZcSfqD0qX9cnOlRSfwLDem2Btdg2gh/s9JnhuCQhanXH5r+CfIXtn/
         E4/8w+3d2POFR/V3lUVVoHiq3NlfH7aplQgZ+xOjjn6yEb4bLRbTCd2pwgeTF2gL90C8
         dCKWpFJw9gZ7vErr+zhM6cA/i+/WuBq9xfHVEzlzY8m5L6u6END9y5GCcuLzpPXqpaGb
         kZzN42PYGVwebBklC0KSlA2zTQQnEJv2tt9Y7Isy40r9r5VGrTEYQCdoA45amNtk4rlq
         cA0fzcRmvQk/7rBCDU95ikOyKAydhQgA1T4ANeY7FyEKPBudv7CWj3qL6K9SbnSl7oi0
         Qu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=sKjXU67NU7MRlmvu2fV0Hp83DTb8BFcVyNviNWkWbjk=;
        b=FxlXz8OMItMXltDmQGseGLk8hPd7620yNlTb2AZX74FO4hMDl9dM+ktOYxu/5maPOX
         9zX599L2QPLKGAYy48j2ZbJWVAWUNal9CRoSeLFkuX9Pcgbwg+wQpZ4edyOxSAeJsP3u
         OwkF8DnBfg0j3+XXLLsdOr7ACLyzMaw+7k1YqbA08+6eKJ0HJCJF0C6btS2gEIxUIwJ5
         GS7QDK9AXe9qPxejMCEMcnKqobScbevS0mBQb4U+xk4VxiNz8LKtpzbMqCX+AkPmc7TY
         vALnxhh22iWmyUC1ogF/mRc5rcfCcHipgn9SjjKJXytpe6UkUKr0ZQLwAPL/qDId63r6
         PVvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13si16237023yba.211.2021.09.15.03.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 03:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQScu-0005kZ-LA
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 06:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQScn-0005kF-FX; Wed, 15 Sep 2021 06:58:45 -0400
Received: from mail.csgraf.de ([85.25.223.15]:50418 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQSci-0000Ii-Vl; Wed, 15 Sep 2021 06:58:45 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-117-089-091.95.117.pool.telefonica.de [95.117.89.91])
 by csgraf.de (Postfix) with ESMTPSA id 3C4D460803DB;
 Wed, 15 Sep 2021 12:58:30 +0200 (CEST)
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
To: Marc Zyngier <maz@kernel.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
 <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
 <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
 <CAFEAcA_OBK1hbqC1Nc7J+VEwkO54WvqBrNa=bR5T3tZW+nfEkQ@mail.gmail.com>
 <3132e2f5-41a6-6011-808b-7ea12abec1c0@csgraf.de>
 <CAFEAcA9k0-przZxAXpdwZKju9GW4gFpTcqAxTD4z_QoueHg=NQ@mail.gmail.com>
 <87wnnib291.wl-maz@kernel.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <4ce23412-7484-f77a-6378-4369b0b2397c@csgraf.de>
Date: Wed, 15 Sep 2021 12:58:29 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87wnnib291.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PX4So+JnJqou


On 15.09.21 11:46, Marc Zyngier wrote:
> On Mon, 13 Sep 2021 13:30:57 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Mon, 13 Sept 2021 at 13:02, Alexander Graf <agraf@csgraf.de> wrote:
>>>
>>> On 13.09.21 13:44, Peter Maydell wrote:
>>>> On Mon, 13 Sept 2021 at 12:07, Alexander Graf <agraf@csgraf.de> wrote:
>>>>> To keep your train of thought though, what would you do if we encounter
>>>>> a conduit that is different from the chosen one? Today, I am aware of 2
>>>>> different implementations: TCG injects #UD [1] while KVM sets x0 to -1 [2].
>>>> If the SMC or HVC insn isn't being used for PSCI then it should
>>>> have its standard architectural behaviour.
>>> Why?
>> QEMU's assumption here is that there are basically two scenarios
>> for these instructions:
>>  (1) we're providing an emulation of firmware that uses this
>>      instruction (and only this insn, not the other one) to
>>      provide PSCI services
>>  (2) we're not emulating any firmware at all, we're running it
>>      in the guest, and that guest firmware is providing PSCI
>>
>> In case (1) we provide a PSCI ABI on the end of the insn.
>> In case (2) we provide the architectural behaviour for the insn
>> so that the guest firmware can use it.
>>
>> We don't currently have
>>  (3) we're providing an emulation of firmware that does something
>>      other than providing PSCI services on this instruction
>>
>> which is what I think you're asking for. (Alternatively, you might
>> be after "provide PSCI via SMC, not HVC", ie use a different conduit.
>> If hvf documents that SMC is guaranteed to trap that would be
>> possible, I guess.)
>>
>>> Also, why does KVM behave differently?
>> Looks like Marc made KVM set x0 to -1 for SMC calls in kernel commit
>> c0938c72f8070aa; conveniently he's on the cc list here so we can
>> ask him :-)
> If we got a SMC trap into KVM, that's because the HW knows about it,
> so injecting an UNDEF is rather counter productive (we don't hide the
> fact that EL3 actually exists).


This is the part where you and Peter disagree :). What would you suggest
to do to create consistency between KVM and TCG based EL0/1 only VMs?


> However, we don't implement anything on the back of this instruction,
> so we just return NOT_IMPLEMENTED (-1). With NV, we actually use it as
> a guest hypervisor can use it for PSCI and SMC is guaranteed to trap
> even if EL3 doesn't exist in the HW.
>
> For the brain-damaged case where there is no EL3, SMC traps and the
> hypervisor doesn't actually advertises EL3, that's likely a guest
> bug. Tough luck.
>
> Side note: Not sure where HVF does, but on the M1 running Linux, SMC
> appears to trap to EL2 with EC=0x3f, which is a reserved exception
> class. This of course results in an UNDEF being injected because as
> far as KVM is concerned, this should never happen.


Could that be yet another magical implementation specific MSR bit that
needs to be set? Hvf returns 0x17 (EC_AA64_SMC) for SMC calls.


Alex

