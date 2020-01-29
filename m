Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp86018lfp;
        Tue, 28 Jan 2020 19:46:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzhZBKI7xuZsK0R72Upy+Vmjqsooleb6JOA/4wslJcMwhQkzXw/JNEUdX+A6zGFZvvSx9co
X-Received: by 2002:aed:256f:: with SMTP id w44mr23273580qtc.331.1580269604155;
        Tue, 28 Jan 2020 19:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580269604; cv=none;
        d=google.com; s=arc-20160816;
        b=XdEfuO52wh0iRYNfCMNaIwMF4Ae0bX1joMcuAIIP0jgJaYSpbIfqeMwyZo1WMiYKlL
         u3Wp/E9ZMLGkLbok5I+U3M8Q7Qw0cxVuY5Fz+C65SBgwiLDTCuvJ16O5S9+tfH+FxSer
         OVy6xvRgx1T26O8GZD8XCTvjrZh0i9ZZCQpB3X7oUWjmb4iRm2UU/Y7yWLwLOFydy7nG
         h0U/zuKn0yGQ1nhplspbTJ/DE/KDfF3KRY9nzZfd0LBUY6S1qi3ZF/WxwTgdf4g7/YpQ
         BU5OWAGxS3e6KbRZqkHD5YdLeqDx8xC1W+kedzc7TtWY5Jj7OB2YjGLrGM3HRxr5yP4/
         RSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=VVEYLA3eH11a2NhUjoxAVqgHpDeMhZaKRO+b2JGtyEY=;
        b=kUdm+Bah3Z5rvFi/6lCJP7nxGxdNbNQ6HGAvQPAct3S4yx51/KAtGDMVO83RRYXdla
         5swWMmoYrvUPootoTGxLzy2/pKUPy8qMvxbZIQlAoiLurtmfEyZnjT4q6S3ZrWaPEY2Y
         9K2NC7s0vcePzIElXa7T+y9unoIYKPsyiodYWRFjJga7WpPZw/VA81GuMmNyTADOuOv4
         nP+y295iUl1kZWcB05Ame+xDnupR0gOZfSm3afqY4UDImJBTiXJcE/nHzmx74L+4K2Rd
         qCaPHaqJ4dl1lw2n/689kjCcel52jtPVzQriE5tRMct55ljj8EhPU80zGHe+nnUKdisM
         0QhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AJPqDcAw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si789256qkg.63.2020.01.28.19.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 19:46:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AJPqDcAw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iweJP-000395-Kc
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 22:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1iweJH-00038r-9c
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 22:46:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1iweJG-00022E-0o
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 22:46:35 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28343
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1iweJF-00021p-SV
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 22:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580269593;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVEYLA3eH11a2NhUjoxAVqgHpDeMhZaKRO+b2JGtyEY=;
 b=AJPqDcAwvGZWFLMrQyYp1eakU2Xs6MqgtOBeB8hyNDkOCP/Ol4LmeClZSo4yO4DOJthP89
 yOiZGxuB2EO6ap3zXMXG442+19I1Gk6Zjyni0NZPEPp6PtGNKz1rRCAxOivyZLT5wwHUoG
 PLzETbVQPMUBFu6KHOBJ4pZ7fv7xigs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-tisaoHk7OwGwMz25M-VUjQ-1; Tue, 28 Jan 2020 22:46:28 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93AF91882CC9;
 Wed, 29 Jan 2020 03:46:27 +0000 (UTC)
Received: from 192-168-1-108.tpgi.com.au (vpn2-54-26.bne.redhat.com
 [10.64.54.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 906A28E9F2;
 Wed, 29 Jan 2020 03:46:21 +0000 (UTC)
Subject: Re: [RFC PATCH] hw/arm/virt: Support NMI injection
To: Julien Thierry <jthierry@redhat.com>, qemu-arm@nongnu.org
References: <20191219040612.28431-1-gshan@redhat.com>
 <d972631d-7db7-b6d5-61b8-244ae2c85882@redhat.com>
 <f4699b81-26ac-fcd4-d3fc-f6e055beeb65@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <9f82206e-0852-ae17-8c77-01d2a5cea97d@redhat.com>
Date: Wed, 29 Jan 2020 14:46:18 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <f4699b81-26ac-fcd4-d3fc-f6e055beeb65@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: tisaoHk7OwGwMz25M-VUjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, aik@ozlabs.ru, maz@kernel.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EBVY3P22u/u0

On 1/28/20 7:29 PM, Julien Thierry wrote:
> Hi Gavin,
> 
> On 1/28/20 6:48 AM, Gavin Shan wrote:
>> [including more folks into the discussion]
>>
>>> On Fri, 17 Jan 2020 at 14:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> On Thu, 19 Dec 2019 at 04:06, Gavin Shan <gshan@redhat.com> wrote:
>>>>> This supports NMI injection for virtual machine and currently it's only
>>>>> supported on GICv3 controller, which is emulated by qemu or host kernel.
>>>>> The design is highlighted as below:
>>>>>
>>>>> * The NMI is identified by its priority (0x20). In the guest (linux)
>>>>> kernel, the GICC_PMR is set to 0x80, to block all interrupts except
>>>>> the NMIs when the external interrupt is disabled. It means the FIQ
>>>>> and IRQ bit in PSTATE isn't touched when the functionality (NMI) is
>>>>> functional.
>>>>> * LPIs aren't considered as NMIs because of their nature. It means NMI
>>>>> is either SPI or PPI. Besides, the NMIs are injected in round-robin
>>>>> fashion is there are multiple NMIs existing.
>>>>> * When the GICv3 controller is emulated by qemu, the interrupt states
>>>>> (e.g. enabled, priority) is fetched from the corresponding data struct
>>>>> directly. However, we have to pause all CPUs to fetch the interrupt
>>>>> states from host in advance if the GICv3 controller is emulated by
>>>>> host.
>>>>>
>>>>> The testing scenario is to tweak guest (linux) kernel where the pl011 SPI
>>>>> can be enabled as NMI by request_nmi(). Check "/proc/interrupts" after injecting
>>>>> several NMIs, to see if the interrupt count is increased or not. The result
>>>>> is just as expected.
>>>>>
>>>
>>> So, QEMU is trying to emulate actual hardware. None of this
>>> looks to me like what GICv3 hardware does... If you want to
>>> have the virt board send an interrupt, do it the usual way
>>> by wiring up a qemu_irq from some device to the GIC, please.
>>> (More generally, there is no concept of an "NMI" in the GIC;
>>> there are just interrupts at varying possible guest-programmable
>>> priority levels.)
>>>
>>
>> Peter, I missed to read your reply in time and apologies for late response.
>>
>> Yes, there is no concept of "NMI" in the GIC from hardware perspective.
>> However, NMI has been supported from the software by kernel commit
>> bc3c03ccb4641 ("arm64: Enable the support of pseudo-NMIs"). The NMIs
>> have higher priority than normal ones. NMIs are deliverable after
>> local_irq_disable() because the SYS_ICC_PMR_EL1 is tweaked so that
>> normal interrupts are masked only.
>>
>> It's unclear about the purpose of "nmi" QMP/HMP command. It's why I
>> put a RFC tag. The command has been supported by multiple architects
>> including x86/ppc. However, they are having different behaviors. The
>> system will be restarted on ppc with this command, but a NMI is injected
>> through LAPIC on x86. So I'm not sure what architect (system reset on
>> ppc or injecting NMI on x86) aarch64 should follow.
>>
> 
> As Peter stated, there is no NMI concept on aarch64 hardware. The pseudo-NMI in the Linux port is purely a software concept. The OS itself decides which interrupts should have the "NMI" properties and sets them up accordingly.
> 
> For QEMU to inject a pseudo-NMI into the guest would require it not only to know that the guest supports that feature. But also how such an interrupt has to be set up (currently there is no guaranty that the priority used for the NMI and the mask should stay the same across Linux version as it is purely internal to GICv3/arm64, no generic kAPI nor uAPI have access to it). And also, you would probably need to know what is handling the NMI you are injecting.
> 
> QEMU shouldn't try to guess "that might be dealt as an NMI, lets raise it".
> 
> I'm not familiar with the QMP/HMP nor the inner workings of QEMU, but if for some reason QEMU requires to trigger an NMI-like mechanic on aarch64, a proper way might be through para-virt. Having some "qemu-nmi-driver" in linux which calls "request_nmi()" and does the proper handling expected by QEMU.
> 
> Cheers,
> 

Julien, thanks for the explanation. The question we're not sure if NMI should
be injected on receiving HMP/QMP "nmi" command. It means it's not clear what
behavior we should have for this command on ARM. However, I have one more
unrelated question: "pseudo" NMI on ARM64 should be PPI? I mean SPI can't
be "pseudo" NMI.

Thanks,
Gavin

