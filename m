Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp322446lfp;
        Tue, 28 Jan 2020 02:57:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwEJaLwEAdDi5ItLre8MEFAZrbdh7516SfPeQCySj2c4HTZl3QGrBpADcV1mFur/KppMj3a
X-Received: by 2002:a37:e505:: with SMTP id e5mr19389823qkg.324.1580209024835;
        Tue, 28 Jan 2020 02:57:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580209024; cv=none;
        d=google.com; s=arc-20160816;
        b=utwQGMwx+fecfrQkMTT+vwemkKdn6iT5eXathCig9/Ve5m5DxCEf3VR3GD+DQYeckJ
         OfC+8pwTUrPkWhx/gcYZgJJAFffc3isd1Tn4a6Du02op56gJXpzUM0KPDE3CZG1ONXmg
         zvzHRINtBbb2UuJRHCYuEo6Ebb/hH1CD2x0OrjIpRmgMo6XhGInFz7E22amP2j1nC2Zc
         MkznjGCQpCtaf7ZVG8+FKxwhdSxcCSUDb/yXqzRS0vOuSa0zHsaiue0sRhIir92polPd
         Wlo/w1POpgmxJCMHYMd3/tDzf9WJ1Pmj5CVd1M1acK8KLU2a4oSV7yknOnj/ot2zJL3Z
         AbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Z5jK0A7x5c7aYCZz0uGyY1d3eb/SjK28XgKdCurftkM=;
        b=o5X3DDqjQDaQLAQlyR0Fxsf+gAo6QfBCRjQOayHrPQYDiXGfdPNQ5dsUGneXxml4oq
         gStB4CyQ9iXOQFCk0iMHhfIS2eXXvlHR0hJ8rmvSNhou8zTZwP7qR9DKv9gespqi4R+N
         LeL1oiAadM9vLkuUwfJuxNHNCmlL1HrlKH8PSobBpU7jgByfoS7/ma0n0BoDihx3M4QB
         4eQd/Mj2pI3heyvV2AESk4B8BsjNNEkmSEopRniqOAKZSSuwi93yFLddbhTHx3yELmUB
         DfSHZVPLoL0bVcAZMQw4V/zq5LWRyWail0OzYti8mb9tUQvEF2xuHpkguo6AkxahXCX0
         vVuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IWWbvjzb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si5945480qtv.83.2020.01.28.02.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 02:57:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IWWbvjzb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwOYK-00039w-AO
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 05:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53441)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iwOYD-00039K-C5
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:56:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iwOYB-0007Nz-Nq
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:56:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54735
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iwOYB-0007Ni-CH
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580209014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5jK0A7x5c7aYCZz0uGyY1d3eb/SjK28XgKdCurftkM=;
 b=IWWbvjzbT551qdJQlLbIMIn8Hy9U4rB78utzfPM9JVezGKXWpX1cQ2TIx2EBzXAKrBqlQT
 4K38RlMSDvin2E5m8z89a+XD0KGu0ldeae/h4gQWLmRFvD1z4DFhb4cJCnAqKsRZ0DeCpv
 7WMmekH/QEPhuUndkjIk4lXjc0cG978=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-nvTkwhPPMO-uKv8R6dwkBQ-1; Tue, 28 Jan 2020 05:56:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 899798010D0;
 Tue, 28 Jan 2020 10:56:51 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 345F88E612;
 Tue, 28 Jan 2020 10:56:46 +0000 (UTC)
Subject: Re: [RFC PATCH] hw/arm/virt: Support NMI injection
To: Marc Zyngier <maz@kernel.org>
References: <20191219040612.28431-1-gshan@redhat.com>
 <d972631d-7db7-b6d5-61b8-244ae2c85882@redhat.com>
 <1b718429-c74e-fbac-84b8-379f3291db40@redhat.com>
 <ff78ed012e7b8fbd656e7e4b477ee0a4@kernel.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3ae0557c-c289-8a23-d62f-3dc2a12c0623@redhat.com>
Date: Tue, 28 Jan 2020 11:56:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <ff78ed012e7b8fbd656e7e4b477ee0a4@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: nvTkwhPPMO-uKv8R6dwkBQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, Gavin Shan <gshan@redhat.com>,
 jthierry@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W0nfgthoYoxO

Hi Marc,
On 1/28/20 10:25 AM, Marc Zyngier wrote:
> Gavin, Eric,
>=20
> On 2020-01-28 08:05, Auger Eric wrote:
>> Hi,
>>
>> On 1/28/20 7:48 AM, Gavin Shan wrote:
>>> [including more folks into the discussion]
>>>
>>>> On Fri, 17 Jan 2020 at 14:00, Peter Maydell <peter.maydell@linaro.org>
>>>> wrote:
>>>>> On Thu, 19 Dec 2019 at 04:06, Gavin Shan <gshan@redhat.com> wrote:
>>>>>> This supports NMI injection for virtual machine and currently it's
>>>>>> only
>>>>>> supported on GICv3 controller, which is emulated by qemu or host
>>>>>> kernel.
>>>>>> The design is highlighted as below:
>>>>>>
>>>>>> * The NMI is identified by its priority (0x20). In the guest (linux)
>>>>>> kernel, the GICC_PMR is set to 0x80, to block all interrupts except
>>>>>> the NMIs when the external interrupt is disabled. It means the FIQ
>>>>>> and IRQ bit in PSTATE isn't touched when the functionality (NMI) is
>>>>>> functional.
>>>>>> * LPIs aren't considered as NMIs because of their nature. It means
>>>>>> NMI
>>>>>> is either SPI or PPI. Besides, the NMIs are injected in round-robin
>>>>>> fashion is there are multiple NMIs existing.
>>>>>> * When the GICv3 controller is emulated by qemu, the interrupt state=
s
>>>>>> (e.g. enabled, priority) is fetched from the corresponding data
>>>>>> struct
>>>>>> directly. However, we have to pause all CPUs to fetch the interrupt
>>>>>> states from host in advance if the GICv3 controller is emulated by
>>>>>> host.
>>>>>>
>>>>>> The testing scenario is to tweak guest (linux) kernel where the
>>>>>> pl011 SPI
>>>>>> can be enabled as NMI by request_nmi(). Check "/proc/interrupts"
>>>>>> after injecting
>>>>>> several NMIs, to see if the interrupt count is increased or not. The
>>>>>> result
>>>>>> is just as expected.
>>>>>>
>>>>
>>>> So, QEMU is trying to emulate actual hardware. None of this
>>>> looks to me like what GICv3 hardware does... If you want to
>>>> have the virt board send an interrupt, do it the usual way
>>>> by wiring up a qemu_irq from some device to the GIC, please.
>>>> (More generally, there is no concept of an "NMI" in the GIC;
>>>> there are just interrupts at varying possible guest-programmable
>>>> priority levels.)
>>>>
>>>
>>> Peter, I missed to read your reply in time and apologies for late
>>> response.
>>>
>>> Yes, there is no concept of "NMI" in the GIC from hardware perspective.
>>> However, NMI has been supported from the software by kernel commit
>>> bc3c03ccb4641 ("arm64: Enable the support of pseudo-NMIs"). The NMIs
>>> have higher priority than normal ones. NMIs are deliverable after
>>> local_irq_disable() because the SYS_ICC_PMR_EL1 is tweaked so that
>>> normal interrupts are masked only.
>=20
> And none of that is an NMI. This is a completely SW-defined mechanism,
> and you can't rely on this to inject something that would behave as
> a NMI in in a guest. I thought the "pseudo" prefix would give it away :-(=
.
>=20
>>>
>>> It's unclear about the purpose of "nmi" QMP/HMP command. It's why I
>>> put a RFC tag. The command has been supported by multiple architects
>>> including x86/ppc. However, they are having different behaviors. The
>>> system will be restarted on ppc with this command, but a NMI is injecte=
d
>>> through LAPIC on x86. So I'm not sure what architect (system reset on
>>> ppc or injecting NMI on x86) aarch64 should follow.
>=20
> The x86 NMI has no equivalent on ARM, full stop. And the only thing that
> the ARM implementation should follow is the letter of the architecture,
> without added concepts.
>=20
>> arm_pmu driver was reworked to use pseudo-NMIs. I don't know the exact
>> status of this work though
>> (https://patchwork.kernel.org/cover/11047407/). So we cannot use any
>> random NMI for guest injection.
>>
>> I wonder whether we should implement the KVM_NMI vcpu ioctl once we have
>> agreed on which behavior is expected upon NMI injection. However the
>> kernel doc says this ioctl only is well defined if "KVM_CREATE_IRQCHIP
>> has not been called" (?).
>=20
> But what architectural concept would you map your KVM_NMI to? The number
> of things you can do is pretty limited:
>=20
> - Reset: we already have this
> - Interrupt: you don't get to decide the priority or the group
> - SError: Pretty much fatal in all cases
>=20
> You *could* try something like SDEI [1], but that's a pretty terrible
> interface too.

Thank you for the pointer.

So Gavin, not sure the QEMU QMP/HMP NMI command is relevant on ARM (at
least at this point)?

Thanks

Eric


>=20
> =A0=A0=A0=A0=A0=A0=A0 M.
>=20
> [1]
> https://static.docs.arm.com/den0054/a/ARM_DEN0054A_Software_Delegated_Exc=
eption_Interface.pdf
>=20

