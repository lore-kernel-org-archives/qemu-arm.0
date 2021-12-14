Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4695134lfk;
        Mon, 13 Dec 2021 16:42:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFXEcWerr+CYovVM9HsagE/tzwHkaymyXW0e9ywtFLlGTWk0JW25ASeEVp8sYJI/lknK1p
X-Received: by 2002:ab0:598a:: with SMTP id g10mr2589448uad.12.1639442522756;
        Mon, 13 Dec 2021 16:42:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639442522; cv=none;
        d=google.com; s=arc-20160816;
        b=PWRZFugRGmiFLjuMOog29DFR46DPs4Z9Z1qWSgAkPtSUU9QYteVkzSonl8m644dnHH
         MG+0rYY8dku8nF9+07Hu5T0PFunGI2V+mOEUsD4lTDcH+lyLhgkJUbkHKK5OSazO6iuj
         kJomURW+7J2IqO0CHnam1Ned/RJg/4dPWAHHyNdG7TxHLpNuxSETeR/4lNEEVmZIDG11
         6BpNsIt5vJnoA69MW9Bect0WCGPujNcdUGOW+n7At3X10oHgwn/mZJ5IYPNLQEsheqSt
         eom8rQiZ/JBqg8AMh0XPHMGzLmxMLTOY11sV9TFgAt0yMK0l/eykedpxsJ21NoOZaqkK
         cN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:subject:from:references:to:content-language:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3MjiwjWe/RngTERnTlEZkPxN+sCLagLyIowXWFUxh1w=;
        b=EUVavcz6xyRrXmPl1Aw+6whDF7zLYVsRM5FEokjbWCS3NOmmOSVYI0CnoV4KCNZ77j
         9oEu05OCN8o3pi9ohxaFL39W4CCksGoRf3+3BVwgZsy/g5FRFDu0H+wseJLdKmJWQY3F
         bel6RS+btCTDdF/y91Wsz0o4uKCvkzCEazveXiL3kRd+FWPQV0XnRSHrWNpXW9tBDlyE
         tSxcquuFLeKNfv0D2mhghp+Egge1L/C8MgsqszX7l5voT1Pj7hLfJNswI5cQNFLA1c72
         8Jv0+xbT5SWe9CZw2WUlkVnhPvNRRWWkqy4cdcNRKJBKGCJMXmAG1A7fod/NuGLLPNL7
         Lu9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=JHk7uROM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10si10873488vsu.521.2021.12.13.16.42.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 16:42:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=JHk7uROM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwvtJ-0005yJ-Q2
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 19:42:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mwvse-0005wR-CO; Mon, 13 Dec 2021 19:41:20 -0500
Received: from mout.gmx.net ([212.227.15.15]:60305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quwenruo.btrfs@gmx.com>)
 id 1mwvsW-0007Ao-W4; Mon, 13 Dec 2021 19:41:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639442466;
 bh=x+fZrRYuNqWTm7ySO5o7puV6MUl6MtNpHN4+gRjZwwg=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=JHk7uROMK+QfYN+B9+1p18Dqgv00hZZOWmHtTTdd2AbAE9+3kzj/X4/V6FU33oChp
 kJmShjvVAHquIoMVE0rbhpAoOd32yFhFER5HVTpdxV5+ov7KMIMJe2dJOlo+A11nsG
 2tjbmT+vrSdHV/MBg6PfNlLLBCj+w1+evdURZ7ZA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MHGCo-1mjiSY03wO-00DEJM; Tue, 14
 Dec 2021 01:41:06 +0100
Message-ID: <aa407ba2-e9c4-882e-a085-91e7dd724f78@gmx.com>
Date: Tue, 14 Dec 2021 08:41:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, Peter Maydell <peter.maydell@linaro.org>
References: <70a2f7d6-5ac1-72df-4a88-b1a662d07070@gmx.com>
 <32bb61a9-0938-d254-0453-18a108bc4b63@redhat.com>
 <1dc0403b-c61b-b04b-e7fd-f2d66276ba7b@gmx.com>
 <CAFEAcA-URrpy3w3AtDb8zVfq8fWxvQ8_jtSqEkaeb=3KE99oAQ@mail.gmail.com>
 <87lf0ojvq2.wl-maz@kernel.org>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Re: Libvirt on little.BIG ARM systems unable to start guest if no
 cpuset is provided
In-Reply-To: <87lf0ojvq2.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kqpzAu/eG4OLGRpccTu9TNviy8yVkd7k6n1KoUfdw6cxWIe70oe
 ohHL2eq3dkNH+nuxeJgViXKfa3NuFi6LdPpBHynjXHcbopIiFBJp9BS+qZduERWuTI4IodA
 nrmyAUsqHfq+8HTmEUbZd6ZIkEKDLTDcYUu3HeeUC7SGlKdiKz/DtYtxaNyR8DAf/Q/xizq
 OHLpGloQPCja7txstEltA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fIvSpY6mXno=:t4ZjrlsqtZsPPu1e9jVNA7
 Ba67gsxn01qKyzy6uMd/EO+MVYiDm6QfTH4ZLxjI0LFxdBuIbFL0Jo6TdsmCdEN+GPyoeNCBk
 F0w+K3JSV4xy7n+CLuJt7LRSBnWDi3q5PJj72liNHzdVVrcohfNL9L9uqakYVXK6oIiNB30p0
 HT9BaNDaki2R6jB+SHxS8R+g4YhB3GCs/LzOOg7zkP1yVMItN8B4RBnQbJaaFESXB+guVqHVE
 OcsZ2/tZ3/SUtS0hdn0dFQh6aOv/P1ksnfQRT7zUBnBTIQMuMaBMgNP3uD44iLiSo9vxoYUXJ
 XPVhU7ijen+eLBFcJFpQpA6a+devcthD8cSHjwNvFmHsUaUpkozeBW/P67WYln9q5hlDVpG73
 T4nxA8dDBxsX0hpD7BTo5we6Mrn45uklNP7SBccTn0MERqwlAi9q48au80Ip7CKugK2EnLcSr
 0VGr6GwPXcvhC8Cfc9EMxnc7jGPg3KEiWZZMUYP+z07A4mD5/D/P34V6DdFyFJaFc4toWTKCQ
 t+Y4IcI9WPVMtLJJB9VR+64UDYB++lqqeTbJAqeE8MQFoN/RlLjaphEO26tX31R5ZR/FTGhKs
 LprFCgHqvKz45l8XwCopAoLsAtztXRfH6fp777IPpb1oei6VRM6y4wNS5D1IfFhHDtyu96tRu
 K7rlq+p3PdcSYSLnQFMj7s5EnCanQqppUKigqPc9G0mboWP6XtN4rI1Gt7sx9DOqa3RYWZ5Rv
 1yG+IaRTtdCJBTzRtqo/LY18JrIAv8cURh9b0VMKmLM9mWzIO31hgTzUEl8GoaH0lZgc0OB89
 UVeW7YqeVOza+znsb+yZACvwv15yeHWsDeAM+0TGO1UyZ5xqUHXFmW5nWvuPG+HVT056mQHkG
 wjuoa/EsUnp8RFhMNMJ6d3dNDaTUcYM0eqgKaHMKWcQx6QWa8JU/DB1HdszZSboY8evqyNiXq
 e7AK5ArMqAjj4+IeDxD0+7iirl0PZT/GZf8mGCsgpl0u0A7wN1Xs5yLAO8y2FdYf0Sb5OONx9
 +BjQ6n69QYpTnpX8X7hMtOcv6NdJaLFg6UKHRsbkDzsVO1YoGjaA5C6E4ScB5TJyIQbypslil
 uEK5d0l8Gik7no=
Received-SPF: pass client-ip=212.227.15.15;
 envelope-from=quwenruo.btrfs@gmx.com; helo=mout.gmx.net
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: libvirt-users@redhat.com,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-arm@nongnu.org, kvmarm <kvmarm@lists.cs.columbia.edu>,
 qemu-discuss@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: anWW5X+D+w3O



On 2021/12/14 00:49, Marc Zyngier wrote:
> On Mon, 13 Dec 2021 16:06:14 +0000,
> Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> KVM on big.little setups is a kernel-level question really; I've
>> cc'd the kvmarm list.
>
> Thanks Peter for throwing us under the big-little bus! ;-)
>
>>
>> On Mon, 13 Dec 2021 at 15:02, Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>>>
>>>
>>>
>>> On 2021/12/13 21:17, Michal Pr=C3=ADvozn=C3=ADk wrote:
>>>> On 12/11/21 02:58, Qu Wenruo wrote:
>>>>> Hi,
>>>>>
>>>>> Recently I got my libvirt setup on both RK3399 (RockPro64) and RPI C=
M4,
>>>>> with upstream kernels.
>>>>>
>>>>> For RPI CM4 its mostly smooth sail, but on RK3399 due to its little.=
BIG
>>>>> setup (core 0-3 are 4x A55 cores, and core 4-5 are 2x A72 cores), it
>>>>> brings quite some troubles for VMs.
>>>>>
>>>>> In short, without proper cpuset to bind the VM to either all A72 cor=
es
>>>>> or all A55 cores, the VM will mostly fail to boot.
>
> s/A55/A53/. There were thankfully no A72+A55 ever produced (just the
> though of it makes me sick).
>
>>>>>
>>>>> Currently the working xml is:
>>>>>
>>>>>     <vcpu placement=3D'static' cpuset=3D'4-5'>2</vcpu>
>>>>>     <cpu mode=3D'host-passthrough' check=3D'none'/>
>>>>>
>>>>> But even with vcpupin, pinning each vcpu to each physical core, VM w=
ill
>>>>> mostly fail to start up due to vcpu initialization failed with -EINV=
AL.
>
> Disclaimer: I know nothing about libvirt (and no, I don't want to
> know! ;-).
>
> However, for things to be reliable, you need to taskset the whole QEMU
> process to the CPU type you intend to use.

Yep, that's what I'm doing.

> That's because, AFAICT,
> QEMU will snapshot the system registers outside of the vcpu threads,
> and attempt to use the result to configure the actual vcpu threads. If
> they happen to run on different CPU types, the sysregs will differ in
> incompatible ways and an error will be returned. This may or may not
> be a bug, I don't know (I see it as a feature).

Then this brings another question.

If we can pin each vCPU to each physical core (both little and big),
then as long as the registers are per-vCPU based, it should be able to
pass both big and little cores to the VM.

Yeah, I totally understand this screw up the scheduling, but that's at
least what (some insane) users want (just like me).

>
> If you are annoyed with this behaviour, you can always use a different
> VMM that won't care about such difference (crosvm or kvmtool, to name
> a few).

Sounds pretty interesting, a new world but without libvirt...

> However, the guest will be able to observe the migration from
> one cpu type to another. This may or may not affect your guest's
> behaviour.

Not sure if it's possible to pin each vCPU thread to each core, but let
me try.

>
> I personally find the QEMU behaviour reasonable. KVM/arm64 make little
> effort to support BL virtualisation as design choice (I value my
> sanity), and userspace is still in control of the placement.
>
>>>>> This brings a problem, in theory RK3399 SoC should out-perform BCM27=
11
>>>>> in multi-core performance, but if a VM can only be bind to either A7=
2 or
>>>>> A55 cores, then the performance is no longer competitive against
>>>>> BCM2711, wasting the PCIE 2.0 x4 capacity.
>
> Vote with your money. If you too think that BL systems are utter crap,
> do not buy them! Or treat them as 'two systems in one', which is what
> I do. From that angle, this is of great value! ;-)

I guess I'm setting my expectation too high for rk3399, just seeing its
multi-thread perf beating RPI4 and has better IO doesn't mean it's a
perfect fit for VM.

Hopes rk3588 could change it.

For now I guess overclocking the big core to 2.2G is what I can do to
grab more performance from the board.

Thanks for your detailed reason and new advices!
Qu

>
>>>>> I guess with projects like Asahi Linux making progress, there will b=
e
>>>>> more and more such problems.
>
> Well, not more than any other big-little system. They suffer from
> similar issues, plus those resulting from not fully implementing the
> ARM architecture. They are however more consistent in their feature
> set than the ARM implementations ever were.
>
>>>>>
>>>>> Any clue on how to properly pass all physical CPU cores to VM for
>>>>> little.BIG setup?
>>>>>
>>>>
>>>> I have never met big.LITTLE but my understanding was that those big
>>>> cores are compatible with little ones and the only difference is that
>>>> the big ones are shut off if there's no demand (to save energy) leavi=
ng
>>>> only the little ones running.
>
> No. They are all notionally running. It is the scheduler that places
> tasks (such as a vcpu) on a 'convenient' core, where 'convenient'
> depends on the scheduling policy.
>
> HTH,
>
> 	M.
>
