Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp901745lfm;
        Wed, 1 Jul 2020 15:16:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdTokHizC2vA++C+5tCpGaLAEXIb07NQMk5M4ggaWdAq1oWZtK7Ls1aD8w4WIe66y9IubV
X-Received: by 2002:a05:600c:d5:: with SMTP id u21mr27904561wmm.156.1593641795589;
        Wed, 01 Jul 2020 15:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593641795; cv=none;
        d=google.com; s=arc-20160816;
        b=CL0LWOt+rDrpKu6padhz8QZhw1KswFsYIZ4uO3LY3wFK/ZDZ9u6GUjlp4WukSkQwbv
         qjsakT/SPPIcV1NGQLgwG1YoyDc1lY0GyiFOjA5c+G4J7qdkb0z74g8G7+cqK6q7yjAx
         tBEpLUIzeID7/V2OH5N1Pp1gjz3MYeJhxynRZRJ1e4xP3LrqIgZ/nhuXyyMwurK1sQho
         EgZoK8s58hbPIGtUlZJn2eweWA2zICLjhaTPeGeN4JP6WkZqMyx4pqanB6YKCBH/k+T+
         tUCb9x2grX6Ji7tmnPT0chJiFDXCBI5jxZ5ZhsYrm3jiXeVnE/oSpDdNM8p19iRUnVCC
         RSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=/TIsrcA8K+yCtOUQbwEl6NhwS9CEaGPtwlIFOpPKt/Y=;
        b=AXExVv23kjvX1bWhdpQyk8CjiTuFyJZ+Uc5+l3WzlsqC1e1IKfo29akRnj+VnRwzdC
         09h5Neq+QSd4y4EWcLadyC+JHOpQ8/HLvrLomjY/0kASE56OExSEaNcztH83hiiOZHCu
         g1EIovbB24YAKx1UKtM/5fIzLr1R9Af3n+m2+DtOhUtWIRNbk9Hmm9q18PabhC36H9Ky
         PLfgrYyFgBiQyVkRe+Az7ub3LciWQiRbPfTCfkmGrtCRe/VXoEPLvTErl9WdoUcXnUYc
         T0kitm4pyGUTh8vPVkJDDfOFj7FifUA1BxksV75JQ4xvXz+L/GKaWV5CPsCOwA/GCRCs
         8tfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 188.138.100.120 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [188.138.100.120])
        by mx.google.com with ESMTP id i6si6458175wmb.167.2020.07.01.15.16.35;
        Wed, 01 Jul 2020 15:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 188.138.100.120 as permitted sender) client-ip=188.138.100.120;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 188.138.100.120 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from macbook.alex.local (x4d024519.dyn.telefonica.de [77.2.69.25])
	by csgraf.de (Postfix) with ESMTPSA id 3CE65390039A;
	Thu,  2 Jul 2020 00:16:34 +0200 (CEST)
Subject: Re: [PATCH] target/arm: Treat unknown SMC calls as NOP
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200701200848.26746-1-agraf@csgraf.de>
 <CAFEAcA9S5v0LHMNc4fu9JGUzecbg8DsogZuCEv_aGNqVxRAcDQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <60440cb5-bd18-2928-afcf-974766222dd7@csgraf.de>
Date: Thu, 2 Jul 2020 00:16:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9S5v0LHMNc4fu9JGUzecbg8DsogZuCEv_aGNqVxRAcDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TUID: AWtZM/9mNSRi


On 01.07.20 22:47, Peter Maydell wrote:
> On Wed, 1 Jul 2020 at 21:08, Alexander Graf <agraf@csgraf.de> wrote:
>> We currently treat unknown SMC calls as UNDEF. This behavior is different
>> from KVM, which treats them as NOP.
>>
>> Unfortunately, the UNDEF exception breaks running Windows for ARM in QEMU,
>> as that probes an OEM SMCCC call on boot, but does not expect to receive
>> an UNDEF exception as response.
>>
>> So instead, let's follow the KVM path and ignore SMC calls that we don't
>> handle. This fixes booting the Windows 10 for ARM preview in TCG for me.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> +    if (cs->exception_index == EXCP_SMC &&
>> +        !arm_feature(env, ARM_FEATURE_EL3) &&
>> +        cpu->psci_conduit != QEMU_PSCI_CONDUIT_SMC) {
> This condition says: "we got an SMC, and this CPU doesn't
> have EL3, and we're not imitating real EL3 firmware".


I like to think of it as "This CPU exposes an environment that looks
like KVM, so it implements HVC calls (EL2) and is responsible for
handling SMC calls as well.

The main difference between the two semantics is that in yours, you
don't have EL3. In mine, there is an EL3, but it's virtualized by the
same layer that implements EL2.


> The architecturally correct behaviour here (since we don't
> implement nested-virt yet, which might allow it to trap
> to guest EL2) is to UNDEF, as far as I can see from a quick
> look at the AArch64.CheckForSMCUndefOrTrap().
>
> I'm not sure why KVM makes these NOP; if I'm right about the
> architectural behaviour then making them NOP would be a KVM bug.
>
> If Windows makes an SMC call on boot that seems like a guest
> bug: it would crash on a real CPU without EL2/EL3 as well.


I don't think there can be a real SBBR compatible CPU without EL2/EL3,
because PSCI is a base requirement. That means either SMC calls succeed
(Windows running in EL2) or SMC calls are trapped into EL2 and it's up
to the hypervisor to decide what to do with them.


>
>       *  Conduit SMC, valid call  Trap to EL2         PSCI Call
>       *  Conduit SMC, inval call  Trap to EL2         Undef insn
> -     *  Conduit not SMC          Undef insn          Undef insn
> +     *  Conduit not SMC          nop                 nop
>
> The line in this table that your commit message says you're
> fixing is "Conduit SMC, inval call"; the line your code
> change affects is "Conduit not SMC", which is not the same
> thing. (I'd have to look at the PSCI spec to see what it
> requires for SMCs that aren't valid PSCI calls.)


The patch fixes the default environment, which is "Conduit HVC, PSCI
over HVC implemented by QEMU". If the patch description wasn't clear,
I'm happy to reword it :).


Alex

