Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2189707wrd;
        Fri, 24 Aug 2018 03:50:09 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdaq6gpPDr4NR67Is5GoMYQiMbnLAU3IxZLzaQEfBA7tpbKgnLL2KnKwEgfRO697tuT4yEHY
X-Received: by 2002:a37:8941:: with SMTP id l62-v6mr1047198qkd.204.1535107809719;
        Fri, 24 Aug 2018 03:50:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535107809; cv=none;
        d=google.com; s=arc-20160816;
        b=SxhsR8lCRbZ7cr03jaG1BRjqQ1C8G7wqDJ/CXxJGjDpv+4PEb/IZqBe2apZlvNdtO6
         u73Y81EbMlxbPyoEGicxPy5dMvcV/huHQmkz5DTELEqG7F+UeSxfo6hEpZEtKN5tXxB7
         YDUzydZJKQ9sppJwmPp52qxRsUntZdqhDOeIWqbHCXqrgc1uqncDyGSEsJoKnGAm6/Kk
         OzntdDpEDJQPXXmfzq0j8FLhb3hpHfH7epgsp7r7856TBoD0ENwSSz8V/7uzwzuJ/mrY
         ASiO69+W4HhJfekf/xXCRHoDlIpTRodF9Mf+NT0p6lLeqEqVl92y7GU8eQQcKYcp/Cm/
         Y43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Cgzpw6jD1+4rv6PR3dd0/41zkxC72dA/NMthk3lxUXk=;
        b=reQhp/n9s31waJvaJpfLm66SOLFKiacEiJb0k+zwuS+bXjGqtyEkiEuUtb1fbcfYRn
         T6Ii65PrkAA4TYf9rUkiswqaAopWo6lEwih8OUtuMzreFEv4vFcvQvvhc9lH1nYOs1lZ
         Kt0Sds48vy4gqlH9zyTQBxVmNp2c1D+fXCMcu88ByTV8pxM+Imlmtj7pXD292GgNZsx4
         ZQ26R6ZnA23HV4hGmCpwjmJBFqFCMZO/Ajq+JqG3lg6GcbNpEr/m4Z1/UHbgKulo0vqp
         bmAF9pAYpAtkHQtq5QVTonwDRZq8CB2jJcrIqdIGNuA8/N2syvu6TK83eJUOytmId2Cy
         IXRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f8-v6si1771842qti.132.2018.08.24.03.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Aug 2018 03:50:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft9fN-0005K3-82
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 06:50:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ft9fC-0005AK-7f
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 06:49:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ft9f8-0003yD-PC
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 06:49:57 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2641 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1ft9f8-0003vi-BE; Fri, 24 Aug 2018 06:49:54 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 8FF3FA0774D64;
	Fri, 24 Aug 2018 18:49:47 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.399.0; Fri, 24 Aug 2018
	18:49:41 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1535039100-11248-1-git-send-email-gengdongjiu@huawei.com>
	<1535039100-11248-2-git-send-email-gengdongjiu@huawei.com>
	<CAFEAcA9DJ_GMkq1fGUjXJDu9GUM0cd6Pjm1HsXpm5rQ5n78Zew@mail.gmail.com>
	<26a33eec-3ed5-f05d-7c36-5b46eeba9612@huawei.com>
	<CAFEAcA8e77FvPCEKGb0eNoWf_NnQqoyMz3P_-=hJCC-PW3+2vg@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <5028e5a5-ad82-fd9b-476c-4bf21f807772@huawei.com>
Date: Fri, 24 Aug 2018 18:49:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8e77FvPCEKGb0eNoWf_NnQqoyMz3P_-=hJCC-PW3+2vg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [PATCH v6 2/2] target: arm: Add support for VCPU
 event states
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oEwPCqN5xSl9



On 2018/8/24 18:38, Peter Maydell wrote:
> On 24 August 2018 at 11:28, gengdongjiu <gengdongjiu@huawei.com> wrote:
>> On 2018/8/24 0:52, Peter Maydell wrote:
>>> On 23 August 2018 at 16:45, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>>>> +static int kvm_put_vcpu_events(ARMCPU *cpu)
>>>> +{
>>>> +    CPUARMState *env = &cpu->env;
>>>> +    struct kvm_vcpu_events events = {};
>>>> +
>>>> +    if (!kvm_has_vcpu_events()) {
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    memset(&events, 0, sizeof(events));
>>>> +    events.exception.serror_pending = env->serror.pending;
>>>> +
>>>> +    if (have_inject_serror_esr) {
>>>> +        events.exception.serror_has_esr = env->serror.has_esr;
>>>> +        events.exception.serror_esr = env->serror.esr;
>>>> +    }
>>>
>>> I realised that the effect of this condition is that
>>> if we migrate a VM from a machine which supports specifying the
>>> SError ESR to one which does not, and at the point of migration
>>> there is a pending SError with an ESR value, then we will
>>> silently drop the specified ESR value. The other alternative
>>> would be to fail the migration (by dropping the if() check,
>>> and letting the host kernel fail the ioctl if that meant that
>>> we asked it to set an SError ESR it couldn't manage.)
>>>
>>> I guess that's OK? It's all hypothetical currently since
>>> we don't support migration between different host CPU types.
>>
>> Peter,
>>    there are two status needed to migrate, one is serror_pending, another is SError ESR value.
>>
>> If A migrates to B, A can set an SError ESR, but B does not support to set.
>> when A is pending a SError and need to migrate to B, I think it should support to migrate the serror_pending status without the ESR value(the ESR value is 0).
>> That is to say,  if A is pending a SError, when migrate to B, B should also pend a SError.
>>
>> or do you think we should refused this migration?
> 
> I don't know, that's why I asked. If we have a pending
> SError with an ESR, and we end up on a destination machine
> where we can pend the SError but not the ESR, does that
> make sense (ie will the guest still be able to usefully
  I agree this suggestion that can pend the SError but without the ESR in the destination machine.

> continue), or have we thrown away information that the
> guest requires to be able to usefully use the SError ?
> Presumably the ESR is important, or we could just never
> bother to set it when pending SErrors.
> 
> thanks
> -- PMM
> 
> .
> 

