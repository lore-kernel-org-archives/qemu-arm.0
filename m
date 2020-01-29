Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp274975lfp;
        Tue, 28 Jan 2020 23:58:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqzaophAYND6+iqEeHuPrCy+FciEx5//GaxuRdWHVXbG8w3zGcEoHQ+TJhPVHikKI7dtCxMi
X-Received: by 2002:a37:4f51:: with SMTP id d78mr20189633qkb.28.1580284686364;
        Tue, 28 Jan 2020 23:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580284686; cv=none;
        d=google.com; s=arc-20160816;
        b=SXE8JkfxMPI13ZYVZgRzK+PewLq9DnAx6Kl+OgmfD0tSHLaPht40r1HSkYLDRbRdHN
         5WITFUnO9+hvAXHyax56W+hJii13Zr6xrHNFVPkbDxg0K6SuPtnpb+974+hvCYqofKLK
         BcQbUW466IJIatrGHBM3f0TkI/R7lIoNFHswWEbCsbysly3Wp6yBsdehZmyHBCh7JItE
         Y/lX1hv3qwcpaguCxdHcsdpAkSip9ewJktYImip+N9Zm0o62MRUj9apfpSVqfp8e8CnM
         CUqG5ckL4Rvpwpt3W3hMroOoX5Z6Zk2Sa4qTJE4Uzg6/zfSsfNQVVJiWCUsrUZFQ8kYI
         +aNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DDoJVR0XnRjpcsHf7NylsdLMfZxrhpQZJENHRcXvtJQ=;
        b=p9Snm87Vbgg/5aNBwyInYsViDKvnKLXYzpm7+KZGSCXY25UPOBNFviDsqlnvMCCj1j
         oZ996IUsiiNqOajZ3xZAjenjQpt66j8hdPI9XP8RxboKOClqlPcsFLvy1GdLa8jNsycw
         ehtrGvVvYvVzJytx07dboHLOw76JwBqUk4BnprmUiQp34yyFGj59dCzNjA96VyWZpsUo
         y2sielSS/B1qvwMd+9mQDN9xFYiI8jlnFAPBoXjkaW5Jff8EfyjMw+GXapU7Y9EHH51G
         UmgMk57P/ZpRuj6Q5FPMtEp21FChaP1H0Arg1HfDp684IphKO9Sf/BtaQVkqgm7xuhhh
         RfMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ilERTMku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k29si708325qtu.321.2020.01.28.23.58.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 23:58:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ilERTMku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwiEf-0003Dn-QE
	for alex.bennee@linaro.org; Wed, 29 Jan 2020 02:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44419)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jthierry@redhat.com>) id 1iwiEQ-0003BN-Fe
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 02:57:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jthierry@redhat.com>) id 1iwiEP-0007zS-5t
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 02:57:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59402
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jthierry@redhat.com>) id 1iwiEP-0007yc-2d
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 02:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580284668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDoJVR0XnRjpcsHf7NylsdLMfZxrhpQZJENHRcXvtJQ=;
 b=ilERTMku+IBdXuIeIMB+vr6lUHa9EkdmbzfjnCT9NAZmVrQYHN9h5DVH5zs6oMdGOskD2T
 BfLVC3TaCd0w1d9Qi4RMh4aObkx3LFys9E/zfG/0pSUstD0+cUtvBTwN9uOEb57qSUFCB1
 EoY5GuBVUsGsAlKySO3nwxylX7wkVBo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-qtIaAy8sOtOvnl3HESwL1w-1; Wed, 29 Jan 2020 02:57:44 -0500
Received: by mail-wm1-f72.google.com with SMTP id f25so2052376wmb.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2020 23:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DDoJVR0XnRjpcsHf7NylsdLMfZxrhpQZJENHRcXvtJQ=;
 b=cIXP5MqLUKpVWnef1KcfGpsF9kiZr9Jjtfm4Gu84kLI/CYCwEAd6GLD9Ch+AaRb1k3
 gFdW6LSo2g2p7YpThqWVp8vzDEv29nZNNahdgFYKJq7mXlc4jSnN0YmB11lL+4ZkRP83
 AL8kW1uF5J6FBCHwYH+4akwX9KCWTADoY+lCJJRqdAOQ2QcCF1Z2EpkUyl52wDHs1aiO
 bGrG21ckfBQ2Fj2QfgIbJWBAnkhYqRb5luKrYS3K7Q1vgWd/LHk1pE2frHtZraH2ssNf
 Rsw/2YSm6HuY0ZnP0q9gypNEA+LfaIKqTHuPF5RZ0MZXVzJ08/B4Pzdo7IJuHU173AJd
 8yXA==
X-Gm-Message-State: APjAAAWkzDSiX5i0kHA0ktthgZwmAACRInVYUIBEn34rBUBpJrvt1pO5
 tEQJWDuiFvPombvqP/0cNLJ3cfCd6Q8xPwqpJVjzUUVJ7Cje3ReQ0nOH/rEJylpEtIpubdGvBN5
 6wW1/7SUmHyTO
X-Received: by 2002:a05:600c:2c41:: with SMTP id
 r1mr8553721wmg.57.1580284663692; 
 Tue, 28 Jan 2020 23:57:43 -0800 (PST)
X-Received: by 2002:a05:600c:2c41:: with SMTP id
 r1mr8553686wmg.57.1580284663386; 
 Tue, 28 Jan 2020 23:57:43 -0800 (PST)
Received: from [192.168.1.81]
 (host81-132-222-100.range81-132.btcentralplus.com. [81.132.222.100])
 by smtp.gmail.com with ESMTPSA id f18sm1773611wrt.75.2020.01.28.23.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 23:57:42 -0800 (PST)
Subject: Re: [RFC PATCH] hw/arm/virt: Support NMI injection
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20191219040612.28431-1-gshan@redhat.com>
 <d972631d-7db7-b6d5-61b8-244ae2c85882@redhat.com>
 <f4699b81-26ac-fcd4-d3fc-f6e055beeb65@redhat.com>
 <9f82206e-0852-ae17-8c77-01d2a5cea97d@redhat.com>
From: Julien Thierry <jthierry@redhat.com>
Message-ID: <51a83889-f2ef-5403-6661-710cfa1ffe01@redhat.com>
Date: Wed, 29 Jan 2020 07:57:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <9f82206e-0852-ae17-8c77-01d2a5cea97d@redhat.com>
Content-Language: en-US
X-MC-Unique: qtIaAy8sOtOvnl3HESwL1w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-TUID: Bt+IdxYRlf5B



On 1/29/20 3:46 AM, Gavin Shan wrote:
> On 1/28/20 7:29 PM, Julien Thierry wrote:
>> Hi Gavin,
>>
>> On 1/28/20 6:48 AM, Gavin Shan wrote:
>>> [including more folks into the discussion]
>>>
>>>> On Fri, 17 Jan 2020 at 14:00, Peter Maydell 
>>>> <peter.maydell@linaro.org> wrote:
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
>>>>>> * When the GICv3 controller is emulated by qemu, the interrupt states
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
>>>>>> several NMIs, to see if the interrupt count is increased or not. 
>>>>>> The result
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
>>>
>>> It's unclear about the purpose of "nmi" QMP/HMP command. It's why I
>>> put a RFC tag. The command has been supported by multiple architects
>>> including x86/ppc. However, they are having different behaviors. The
>>> system will be restarted on ppc with this command, but a NMI is injected
>>> through LAPIC on x86. So I'm not sure what architect (system reset on
>>> ppc or injecting NMI on x86) aarch64 should follow.
>>>
>>
>> As Peter stated, there is no NMI concept on aarch64 hardware. The 
>> pseudo-NMI in the Linux port is purely a software concept. The OS 
>> itself decides which interrupts should have the "NMI" properties and 
>> sets them up accordingly.
>>
>> For QEMU to inject a pseudo-NMI into the guest would require it not 
>> only to know that the guest supports that feature. But also how such 
>> an interrupt has to be set up (currently there is no guaranty that the 
>> priority used for the NMI and the mask should stay the same across 
>> Linux version as it is purely internal to GICv3/arm64, no generic kAPI 
>> nor uAPI have access to it). And also, you would probably need to know 
>> what is handling the NMI you are injecting.
>>
>> QEMU shouldn't try to guess "that might be dealt as an NMI, lets raise 
>> it".
>>
>> I'm not familiar with the QMP/HMP nor the inner workings of QEMU, but 
>> if for some reason QEMU requires to trigger an NMI-like mechanic on 
>> aarch64, a proper way might be through para-virt. Having some 
>> "qemu-nmi-driver" in linux which calls "request_nmi()" and does the 
>> proper handling expected by QEMU.
>>
>> Cheers,
>>
> 
> Julien, thanks for the explanation. The question we're not sure if NMI 
> should
> be injected on receiving HMP/QMP "nmi" command. It means it's not clear 
> what
> behavior we should have for this command on ARM. However, I have one more
> unrelated question: "pseudo" NMI on ARM64 should be PPI? I mean SPI can't
> be "pseudo" NMI.
> 

I'm not sure I understand why you say "SPI can't be "pseudo" NMI". 
Currently both PPI and SPI are supported in the "pseudo" NMI scheme. Do 
you think that should not be the case? If so, can you elaborate?

Thanks,

-- 
Julien Thierry

