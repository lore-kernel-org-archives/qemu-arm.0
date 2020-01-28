Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp483766lfp;
        Tue, 28 Jan 2020 05:41:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqyx5MvLm4knktAU9DzWik0bzpGfuINDH8EHY2/O0UeDbP3VnHtuWMUBbHBK0pgvdpPG3I6V
X-Received: by 2002:a0c:ac4e:: with SMTP id m14mr21593462qvb.37.1580218884321;
        Tue, 28 Jan 2020 05:41:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580218884; cv=none;
        d=google.com; s=arc-20160816;
        b=lmoWF4zlJEDD5a1XKx7Qfev2DFtV0SyapZVlSIUEFf8cdNYVLu4eD2mZm3/A+0FXX0
         jcMiVrW7a7jKdOdfarXa4dImERBGlS+V51yVWEdDJ226oTwCZJQilCQ7RPyCIGKlh3bb
         +jDk8BG7+JSuytSD43+hyUapemO9U0dqgYNlpCVgOp8NV6Ijs0nhtGB4He9j3bHux0hG
         k5i4o82zaJIIIs7j1pyI0Qe4Ktm8dOtktX+UHeoO3XG7BF90Ev7CT9F2a3k/SRbr8ark
         ZWrjpo3GyuRmy8W5ibh70w0WFFrRjj+jVazFad1As5f+baWCiE2k1bzp9BgQAnRM4+w1
         QjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GHAyMmWlzwPmFdNp7MpoXNUEMypa1e6NgWm+wmveGA0=;
        b=M6RaIheywLQTMBYJBsGCOpv6AS4BOb+KiAqMyJ/vkb1eUMRxLTHLM9MIiCvYyk2Re3
         hKsE6u0I25K3u3UHIxHrltuAMUQScJrBv0plyt0sPf+UwCCFDpRbmR7EHmCd8RIlkNna
         ywJc5v7krWSdUYFgiEXPjOBBuXfhYWkB+evi28kMEr1wJ46gGvJzth3NRtpdiKuAj2ky
         InLUA0dthTX3N0x1H71h4d1IEc/3nVTkE4lRVbUwLlROOw3VuLoHcKi7DbIvswEUA1+L
         NtKCyVWqayLgBap8WWVTOQPSCl7WsjPgksE4wpIM7epZhZNnPQ9WyEEdKFUiw+JcMXAb
         Vzxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MVY1pw36;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20si2516163qvk.15.2020.01.28.05.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 05:41:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MVY1pw36;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwR7L-0006Bl-Mr
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 08:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jthierry@redhat.com>) id 1iwMGO-0001rz-UJ
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 03:30:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jthierry@redhat.com>) id 1iwMGM-0003PE-UI
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 03:30:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37205
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jthierry@redhat.com>) id 1iwMGM-0003O4-MQ
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 03:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580200222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GHAyMmWlzwPmFdNp7MpoXNUEMypa1e6NgWm+wmveGA0=;
 b=MVY1pw36FKhf48nFMkHDeWg5ieV+dbiD9YSaHOz0kTSXiN+rHUZzLaedWBWr9qZS+QJ0i2
 32cZNIiPjNVHSxcz6cnG3Gs+y6tIDWxQDAIK1quXCDd0ceXwJUWrvSHT+AxPlmbR9Vpjbe
 UAaqMzBkktg4x5rY7lKQl4B8/kmCaZI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-a46tof4PNSmzXxq8JdyIow-1; Tue, 28 Jan 2020 03:29:12 -0500
Received: by mail-wr1-f71.google.com with SMTP id d8so7625357wrq.12
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2020 00:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GHAyMmWlzwPmFdNp7MpoXNUEMypa1e6NgWm+wmveGA0=;
 b=X40eXsOV8S63Ih5RqkEEKIP4H/MxF0HA+caUAn9fgr3TGLtGQcZC0wZ0/T2a0wAiER
 Hv0XqtPsv3EkUUs2H5igOg7SfsI9F7bY9YXKCCUe9rOq5hLAAHKCx9bm5k1RchbHRaD+
 Wxp4ibsAX4vG9//oBqe63nG32FWPMHBCJFbzACVfdyUcGHglkOgFRn6UsXAMhVAIfTa8
 GH/xcopMNX6KZ/RLWF5XIFnjynekKcOs02bqMURy48ckNmoBKrbjJxzFgA9+zU9oh+g9
 io/Nvqe4aXA7jFvB6UCWKJtLz0Rx5Fzmiq7zEPcm8FgX1e/D2F1XKysTlhsgcJ0iUON/
 cNyw==
X-Gm-Message-State: APjAAAVeNVsY4cZDqgIXO4Asv2+yf8n2stI/y0Th8faukjhxD2DKoxHb
 VaKH9/M5seYCGXfD21+0c19W6EJj+gNQ31lD+ZLP9ybM/S32Hkih7HIfNzjudoevrljvPk3mHgB
 UEQX2HE90M/ik
X-Received: by 2002:a1c:9a56:: with SMTP id c83mr3578055wme.79.1580200151460; 
 Tue, 28 Jan 2020 00:29:11 -0800 (PST)
X-Received: by 2002:a1c:9a56:: with SMTP id c83mr3578009wme.79.1580200151074; 
 Tue, 28 Jan 2020 00:29:11 -0800 (PST)
Received: from [192.168.1.81]
 (host81-132-222-100.range81-132.btcentralplus.com. [81.132.222.100])
 by smtp.gmail.com with ESMTPSA id d16sm28021384wrg.27.2020.01.28.00.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 00:29:10 -0800 (PST)
Subject: Re: [RFC PATCH] hw/arm/virt: Support NMI injection
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20191219040612.28431-1-gshan@redhat.com>
 <d972631d-7db7-b6d5-61b8-244ae2c85882@redhat.com>
From: Julien Thierry <jthierry@redhat.com>
Message-ID: <f4699b81-26ac-fcd4-d3fc-f6e055beeb65@redhat.com>
Date: Tue, 28 Jan 2020 08:29:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <d972631d-7db7-b6d5-61b8-244ae2c85882@redhat.com>
Content-Language: en-US
X-MC-Unique: a46tof4PNSmzXxq8JdyIow-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:41:15 -0500
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, aik@ozlabs.ru, maz@kernel.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C0Q/uYvmsP+e

Hi Gavin,

On 1/28/20 6:48 AM, Gavin Shan wrote:
> [including more folks into the discussion]
> 
>> On Fri, 17 Jan 2020 at 14:00, Peter Maydell <peter.maydell@linaro.org> 
>> wrote:
>>> On Thu, 19 Dec 2019 at 04:06, Gavin Shan <gshan@redhat.com> wrote:
>>>> This supports NMI injection for virtual machine and currently it's only
>>>> supported on GICv3 controller, which is emulated by qemu or host 
>>>> kernel.
>>>> The design is highlighted as below:
>>>>
>>>> * The NMI is identified by its priority (0x20). In the guest (linux)
>>>> kernel, the GICC_PMR is set to 0x80, to block all interrupts except
>>>> the NMIs when the external interrupt is disabled. It means the FIQ
>>>> and IRQ bit in PSTATE isn't touched when the functionality (NMI) is
>>>> functional.
>>>> * LPIs aren't considered as NMIs because of their nature. It means NMI
>>>> is either SPI or PPI. Besides, the NMIs are injected in round-robin
>>>> fashion is there are multiple NMIs existing.
>>>> * When the GICv3 controller is emulated by qemu, the interrupt states
>>>> (e.g. enabled, priority) is fetched from the corresponding data struct
>>>> directly. However, we have to pause all CPUs to fetch the interrupt
>>>> states from host in advance if the GICv3 controller is emulated by
>>>> host.
>>>>
>>>> The testing scenario is to tweak guest (linux) kernel where the 
>>>> pl011 SPI
>>>> can be enabled as NMI by request_nmi(). Check "/proc/interrupts" 
>>>> after injecting
>>>> several NMIs, to see if the interrupt count is increased or not. The 
>>>> result
>>>> is just as expected.
>>>>
>>
>> So, QEMU is trying to emulate actual hardware. None of this
>> looks to me like what GICv3 hardware does... If you want to
>> have the virt board send an interrupt, do it the usual way
>> by wiring up a qemu_irq from some device to the GIC, please.
>> (More generally, there is no concept of an "NMI" in the GIC;
>> there are just interrupts at varying possible guest-programmable
>> priority levels.)
>>
> 
> Peter, I missed to read your reply in time and apologies for late response.
> 
> Yes, there is no concept of "NMI" in the GIC from hardware perspective.
> However, NMI has been supported from the software by kernel commit
> bc3c03ccb4641 ("arm64: Enable the support of pseudo-NMIs"). The NMIs
> have higher priority than normal ones. NMIs are deliverable after
> local_irq_disable() because the SYS_ICC_PMR_EL1 is tweaked so that
> normal interrupts are masked only.
> 
> It's unclear about the purpose of "nmi" QMP/HMP command. It's why I
> put a RFC tag. The command has been supported by multiple architects
> including x86/ppc. However, they are having different behaviors. The
> system will be restarted on ppc with this command, but a NMI is injected
> through LAPIC on x86. So I'm not sure what architect (system reset on
> ppc or injecting NMI on x86) aarch64 should follow.
> 

As Peter stated, there is no NMI concept on aarch64 hardware. The 
pseudo-NMI in the Linux port is purely a software concept. The OS itself 
decides which interrupts should have the "NMI" properties and sets them 
up accordingly.

For QEMU to inject a pseudo-NMI into the guest would require it not only 
to know that the guest supports that feature. But also how such an 
interrupt has to be set up (currently there is no guaranty that the 
priority used for the NMI and the mask should stay the same across Linux 
version as it is purely internal to GICv3/arm64, no generic kAPI nor 
uAPI have access to it). And also, you would probably need to know what 
is handling the NMI you are injecting.

QEMU shouldn't try to guess "that might be dealt as an NMI, lets raise it".

I'm not familiar with the QMP/HMP nor the inner workings of QEMU, but if 
for some reason QEMU requires to trigger an NMI-like mechanic on 
aarch64, a proper way might be through para-virt. Having some 
"qemu-nmi-driver" in linux which calls "request_nmi()" and does the 
proper handling expected by QEMU.

Cheers,

-- 
Julien Thierry

