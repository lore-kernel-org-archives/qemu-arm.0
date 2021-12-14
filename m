Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4994185lfk;
        Mon, 13 Dec 2021 23:53:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyD8y2rs+hCKPQpLgmLVbID4wA9g7VL5obu8TFZWdxjMWY0iZLPb95KIvcivk5u+6TtFF1j
X-Received: by 2002:a05:622a:48e:: with SMTP id p14mr4158237qtx.553.1639468431168;
        Mon, 13 Dec 2021 23:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639468431; cv=none;
        d=google.com; s=arc-20160816;
        b=CQU9zslRCEKRTYS+Lf1PmEutwuh/1nPn3p2zJJT3qW0QDgotZAiJsfqIR6lqJVHsl3
         FtsmJ94rwzQwINxR3FK5nJAJ/Y5cG/OUfG5szWfmNBgb+JFzwiQukiOUJJfWEUMNnmIG
         T81dbEfs7Hzy9nxNGLJRcY6ceAO2U3oYIyAeBvD1wSHW1x511vPwvlPAifuQB77EX4r6
         864svGE6Nr0kKNBULDmRriasdgYP0jCVos8xVvIq5+sYRGj+z63GxfsI/n7HUhNBeIDB
         JgnLBTDhSOmMbq7/lupE03enOfRZXFD9nGI5pa5heKYy0WrEx9/DT8gxLz59MsU9qK9E
         AxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=DQnA16VkAqKaFSkz78q65wOFX1IYz3uTY5bc4vdx9+c=;
        b=XnF+HD1P9prxz+zxc3ZQDa1LbJ10Y3SEvZIZ0TpfvMbAcCruWqIazsn1jga3HscTGY
         DUO6/bD/dRYgx8N/XJ1hSjsWhwKadCVKCFLE9Tnnp6VKWsQysIHnku3VYLxv5xHmo+CP
         z3h7ux0esVomMCeUd2eGuDOFTCEs/oOUc90t6hAKnYy1y0KdRWABMtQtCvX2EjmqU+by
         afTzWwzRfrN9KEwg9pUPevlLa2ZoLdsxiBfebRmH94qD95P6S5NB85jU4LkEsYWSplqu
         rsShaN0hTTNnOgPqMD9wEzET5BPliO8fAXTkXZj1NdVa6GYO8LAc/6EnbAtBs4Tgwln1
         SOfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NOgsR70E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si13775052qvh.499.2021.12.13.23.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 23:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NOgsR70E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mx2dC-0001pb-IJ
	for alex.bennee@linaro.org; Tue, 14 Dec 2021 02:53:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mx2d2-0001pI-4j
 for qemu-arm@nongnu.org; Tue, 14 Dec 2021 02:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mx2cy-0007v6-MI
 for qemu-arm@nongnu.org; Tue, 14 Dec 2021 02:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639468415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQnA16VkAqKaFSkz78q65wOFX1IYz3uTY5bc4vdx9+c=;
 b=NOgsR70EI7Ursty0j3p1OnfXJzubU0/ISmADu8AChopjWfCD3abVpMxi3wh4SriGi2EJKb
 TF4DTgUFQrNmfhHRf+Q595R6ri/Taq5GRB6vpFRvzWVbijXWW6EJMsYPtbFGVU932lLBH0
 dW9ylOm6q1Jg0/Z/FRrxDEXT4uwECyQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-ZT0EI3tuMJqS8NYh2hviNQ-1; Tue, 14 Dec 2021 02:53:31 -0500
X-MC-Unique: ZT0EI3tuMJqS8NYh2hviNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so12802344wmd.9
 for <qemu-arm@nongnu.org>; Mon, 13 Dec 2021 23:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DQnA16VkAqKaFSkz78q65wOFX1IYz3uTY5bc4vdx9+c=;
 b=lcL6990YYMDGCtGpe0IxU9nSefw7msiSUNAlfOdulZs5cawocribeoRbrbEZtkejOZ
 JNvLukQTZq+poOgWi0vTzit1bn/ngXba6LwsKMVvFplyktOf2J17yY7dY+LKriBE/BsI
 5ca4Et0fdihoxxDsQIMs5RbgM/dc9h5eBb8+dAXuD/jc2e4WVZMQJDaSWfi6BAX+eUbo
 k+apzLPSYTedfXLKnC5xvsGg1E4BdfGIbZsCWd582Poh4gD7tsiHg7n+Jd1qshnTxpSL
 ZvFAKGXnWmjR8wchzIPM/c75vIclQuxUuOYUfdqVQlFrn/IzKn2CAOZS5D02nmPcqMRV
 zlhA==
X-Gm-Message-State: AOAM5321OOjPgdUlvUlblZNQoRxtwwIXfKFGI9LGxcWuSCOsfIPHI097
 RA9xdzxjBxJ7w7iaNqNH2BX3oCdmDlM0t6Nr80gU2lodx6FVW3WQRhIc+8owuZXBfBoQerGB8nJ
 vxcMR5bb1GW5e
X-Received: by 2002:a5d:6c63:: with SMTP id r3mr4274878wrz.213.1639468410042; 
 Mon, 13 Dec 2021 23:53:30 -0800 (PST)
X-Received: by 2002:a5d:6c63:: with SMTP id r3mr4274855wrz.213.1639468409828; 
 Mon, 13 Dec 2021 23:53:29 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z15sm12634056wrr.65.2021.12.13.23.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 23:53:29 -0800 (PST)
Message-ID: <29409a18-5156-6b3a-6a44-eecd83a20a78@redhat.com>
Date: Tue, 14 Dec 2021 08:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Libvirt on little.BIG ARM systems unable to start guest if no
 cpuset is provided
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, Marc Zyngier <maz@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <70a2f7d6-5ac1-72df-4a88-b1a662d07070@gmx.com>
 <32bb61a9-0938-d254-0453-18a108bc4b63@redhat.com>
 <1dc0403b-c61b-b04b-e7fd-f2d66276ba7b@gmx.com>
 <CAFEAcA-URrpy3w3AtDb8zVfq8fWxvQ8_jtSqEkaeb=3KE99oAQ@mail.gmail.com>
 <87lf0ojvq2.wl-maz@kernel.org> <aa407ba2-e9c4-882e-a085-91e7dd724f78@gmx.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <aa407ba2-e9c4-882e-a085-91e7dd724f78@gmx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvirt-users@redhat.com, qemu-arm@nongnu.org,
 kvmarm <kvmarm@lists.cs.columbia.edu>, qemu-discuss@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YrqQbN440sFf

On 12/14/21 01:41, Qu Wenruo wrote:
> 
> 
> On 2021/12/14 00:49, Marc Zyngier wrote:
>> On Mon, 13 Dec 2021 16:06:14 +0000,
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> KVM on big.little setups is a kernel-level question really; I've
>>> cc'd the kvmarm list.
>>
>> Thanks Peter for throwing us under the big-little bus! ;-)
>>
>>>
>>> On Mon, 13 Dec 2021 at 15:02, Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2021/12/13 21:17, Michal Prívozník wrote:
>>>>> On 12/11/21 02:58, Qu Wenruo wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Recently I got my libvirt setup on both RK3399 (RockPro64) and RPI
>>>>>> CM4,
>>>>>> with upstream kernels.
>>>>>>
>>>>>> For RPI CM4 its mostly smooth sail, but on RK3399 due to its
>>>>>> little.BIG
>>>>>> setup (core 0-3 are 4x A55 cores, and core 4-5 are 2x A72 cores), it
>>>>>> brings quite some troubles for VMs.
>>>>>>
>>>>>> In short, without proper cpuset to bind the VM to either all A72
>>>>>> cores
>>>>>> or all A55 cores, the VM will mostly fail to boot.
>>
>> s/A55/A53/. There were thankfully no A72+A55 ever produced (just the
>> though of it makes me sick).
>>
>>>>>>
>>>>>> Currently the working xml is:
>>>>>>
>>>>>>     <vcpu placement='static' cpuset='4-5'>2</vcpu>
>>>>>>     <cpu mode='host-passthrough' check='none'/>
>>>>>>
>>>>>> But even with vcpupin, pinning each vcpu to each physical core, VM
>>>>>> will
>>>>>> mostly fail to start up due to vcpu initialization failed with
>>>>>> -EINVAL.
>>
>> Disclaimer: I know nothing about libvirt (and no, I don't want to
>> know! ;-).
>>
>> However, for things to be reliable, you need to taskset the whole QEMU
>> process to the CPU type you intend to use.
> 
> Yep, that's what I'm doing.
> 
>> That's because, AFAICT,
>> QEMU will snapshot the system registers outside of the vcpu threads,
>> and attempt to use the result to configure the actual vcpu threads. If
>> they happen to run on different CPU types, the sysregs will differ in
>> incompatible ways and an error will be returned. This may or may not
>> be a bug, I don't know (I see it as a feature).
> 
> Then this brings another question.
> 
> If we can pin each vCPU to each physical core (both little and big),
> then as long as the registers are per-vCPU based, it should be able to
> pass both big and little cores to the VM.
> 
> Yeah, I totally understand this screw up the scheduling, but that's at
> least what (some insane) users want (just like me).
> 
>>
>> If you are annoyed with this behaviour, you can always use a different
>> VMM that won't care about such difference (crosvm or kvmtool, to name
>> a few).
> 
> Sounds pretty interesting, a new world but without libvirt...
> 
>> However, the guest will be able to observe the migration from
>> one cpu type to another. This may or may not affect your guest's
>> behaviour.
> 
> Not sure if it's possible to pin each vCPU thread to each core, but let
> me try.
> 

Sure it is, for instance:

<cputune>
    <vcpupin vcpu="0" cpuset="1-4,^2"/>
    <vcpupin vcpu="1" cpuset="0,1"/>
    <vcpupin vcpu="2" cpuset="2,3"/>
    <vcpupin vcpu="3" cpuset="0,4"/>
    <emulatorpin cpuset="1-3"/>
    <iothreadpin iothread="1" cpuset="5,6"/>
    <iothreadpin iothread="2" cpuset="7,8"/>
</cputune>

pins vCPU#0 onto host CPUs 1-4, excluding 2; vCPU#1 onto host CPUs 0-1
and so on. You can also pin emulator (QEMU) and its iothreads. It's
documented here:

https://libvirt.org/formatdomain.html#cpu-tuning

Michal

