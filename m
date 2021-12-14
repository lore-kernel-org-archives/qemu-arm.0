Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4997346lfk;
        Mon, 13 Dec 2021 23:58:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQ4SJa8OVX5Umm61qjY/8/Tmhev4dEOIfQ30U4qs47Iqrc1Jm3Te8jEO+oL4yIIGwml+H0
X-Received: by 2002:a05:620a:66e:: with SMTP id a14mr2794982qkh.496.1639468718586;
        Mon, 13 Dec 2021 23:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639468718; cv=none;
        d=google.com; s=arc-20160816;
        b=WuJW9DBfLQFWnjTLVjFaJfB4g0Q2bcKiEjz4Iwa+t9WAZ2VokSPt+U88roWbkpHxS0
         zOQo/GLMdKVrtTxmJU+XanI5mYFnvKS7CYbg8gdAG5DNGkCrdFUsQgPGgSCyWmOSjJhB
         wHa/25m59R9iU+y3n3O6eUFJGqHFFTnyp3n1kN/fIQKI8spYe+4QJKXrpt14Ys7lnmR6
         LLpyQOzx7jA5ihux7zaARjTZ3a/DZzlXlCLRrKhbtffOIYvS0+bD51zMJOsWUQGqlKLV
         AvQD0uRhWUb0BwxR3sHtShvOwr8rGYJE2PXgIycMRpPynmUB5pfoBXvEUW1TjAh928o6
         61Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=tkEptgESprKMD9zOqtebbAr6XmQkSHwUeHWVtJ98Yr0=;
        b=WAHt2Qrus2slIizpb8LoXMDnwCtjOiYvW6SN1QXO0H+oVfTiNW2VT3xOzIEmB/8MqU
         OUVYzN3dwVT53x2EXmrmHAAfDb7KxhBRluELtsXDhzW4NMKixGhqucWv9FRWnuuHJfKQ
         7JJs3Jj4aIN0grx2MokY9GG6qO1v2GLq8oXOT26/O+2eKFLHbe63OGfWII6fGUsxH8q4
         xvBvbMobwkYjDwOVwU6ergpHWHM1IqCkZORmKKAgq7R7jAy5DS4KSPAggxLMOu9246j/
         wdbmAxnxc9dVloHEcvUJzGlPKfKW1M2fAmp5C1VIVjBOxeYCwLQoUe+lVnE5cCccC9JQ
         ZWrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VyUQa/XL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si13693950qtk.531.2021.12.13.23.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 23:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VyUQa/XL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mx2hq-0004Vn-0s
	for alex.bennee@linaro.org; Tue, 14 Dec 2021 02:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mx2ha-0004Ss-Ja
 for qemu-arm@nongnu.org; Tue, 14 Dec 2021 02:58:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mx2hZ-0008N0-32
 for qemu-arm@nongnu.org; Tue, 14 Dec 2021 02:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639468700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkEptgESprKMD9zOqtebbAr6XmQkSHwUeHWVtJ98Yr0=;
 b=VyUQa/XL47nkT8vhNDsFNvzFwXzyAuY7Ep/mS7W0zbEDjqKhLJNpsJpcvy+HJW3D9nAl08
 4qVP1DWDkbJRY96Pp9Mo+RAsXyUtRNy6JJoB8Wz/PMDdFKmPKFLprZmKKnK/6P8NaNuUOj
 NGRXAWVnckxFKP7fQWzxfffHUHUo75Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-SGI8QAUOOSKh3J0vVN16jQ-1; Tue, 14 Dec 2021 02:58:19 -0500
X-MC-Unique: SGI8QAUOOSKh3J0vVN16jQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so7573221wmq.9
 for <qemu-arm@nongnu.org>; Mon, 13 Dec 2021 23:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tkEptgESprKMD9zOqtebbAr6XmQkSHwUeHWVtJ98Yr0=;
 b=k2kQaCAkpT2qbiBhs+pdBaRJsuZ5yU2dV22u7H+X7AdBfSZjZP2jRlOozOHMVE4alu
 esQHA1BhZvdgKSyYKcAlFkTqV0DCr/CPvPE+d/8XHYwdRCMUoKvkfVeg+twByQ6kPmfc
 /Zd5Fzmcu6rkdIYGHUg4i7L5afi6tqNdUMBkvRdIDza7xz7LibWEx1z+ZeySxnjuFLVa
 ezshcAx9BKRMp21BMS6Qhlwd5Cq32E8dItAGbT9di9K5tt82ukbkHYSZj4UtJlZEiIYv
 UI0z85UWOl4qZRqiU21L8qU5vCv9ADYzHzHYQe12SI1Go4X6ssn7u1zXIrlGtqARUQxa
 ktoA==
X-Gm-Message-State: AOAM5302owdCFKxnwR7s2ger3OmeXlSauu37YQc8AEoXYtJnrG3FdbGn
 8kXubx5EaBwd/5w7eTCfnJaZi9OBU8MgAfQZh9yvxqA0cUHlFNcewJZxOunPyMp4wot5FMFLSln
 Xx5xwymi2qHeP
X-Received: by 2002:a05:600c:1d91:: with SMTP id
 p17mr5149491wms.193.1639468697959; 
 Mon, 13 Dec 2021 23:58:17 -0800 (PST)
X-Received: by 2002:a05:600c:1d91:: with SMTP id
 p17mr5149468wms.193.1639468697807; 
 Mon, 13 Dec 2021 23:58:17 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id k1sm1355118wms.26.2021.12.13.23.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 23:58:17 -0800 (PST)
Message-ID: <f7b2dcdc-505c-e713-14f0-8c85e6014e8b@redhat.com>
Date: Tue, 14 Dec 2021 08:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Libvirt on little.BIG ARM systems unable to start guest if no
 cpuset is provided
To: Marc Zyngier <maz@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>
References: <70a2f7d6-5ac1-72df-4a88-b1a662d07070@gmx.com>
 <32bb61a9-0938-d254-0453-18a108bc4b63@redhat.com>
 <1dc0403b-c61b-b04b-e7fd-f2d66276ba7b@gmx.com>
 <CAFEAcA-URrpy3w3AtDb8zVfq8fWxvQ8_jtSqEkaeb=3KE99oAQ@mail.gmail.com>
 <87lf0ojvq2.wl-maz@kernel.org>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <87lf0ojvq2.wl-maz@kernel.org>
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
X-TUID: hBzQOtHOICYy

On 12/13/21 17:49, Marc Zyngier wrote:
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
>>> On 2021/12/13 21:17, Michal Prívozník wrote:
>>>> On 12/11/21 02:58, Qu Wenruo wrote:
>>>>> Hi,
>>>>>
>>>>> Recently I got my libvirt setup on both RK3399 (RockPro64) and RPI CM4,
>>>>> with upstream kernels.
>>>>>
>>>>> For RPI CM4 its mostly smooth sail, but on RK3399 due to its little.BIG
>>>>> setup (core 0-3 are 4x A55 cores, and core 4-5 are 2x A72 cores), it
>>>>> brings quite some troubles for VMs.
>>>>>
>>>>> In short, without proper cpuset to bind the VM to either all A72 cores
>>>>> or all A55 cores, the VM will mostly fail to boot.
> 
> s/A55/A53/. There were thankfully no A72+A55 ever produced (just the
> though of it makes me sick).
> 
>>>>>
>>>>> Currently the working xml is:
>>>>>
>>>>>    <vcpu placement='static' cpuset='4-5'>2</vcpu>
>>>>>    <cpu mode='host-passthrough' check='none'/>
>>>>>
>>>>> But even with vcpupin, pinning each vcpu to each physical core, VM will
>>>>> mostly fail to start up due to vcpu initialization failed with -EINVAL.
> 
> Disclaimer: I know nothing about libvirt (and no, I don't want to
> know! ;-).
> 
> However, for things to be reliable, you need to taskset the whole QEMU
> process to the CPU type you intend to use. That's because, AFAICT,
> QEMU will snapshot the system registers outside of the vcpu threads,
> and attempt to use the result to configure the actual vcpu threads. If
> they happen to run on different CPU types, the sysregs will differ in
> incompatible ways and an error will be returned. This may or may not
> be a bug, I don't know (I see it as a feature).
> 

Oh, I had no idea that QEMU does this. Anyway, QEMU spawns a thread for
each vCPU which is perfect, because then libvirt can use CGroups to
restrict each vCPU individually onto a subset of physical CPU(s). And in
fact, libvirt has this feature for many years. I always viewed it as a
performance tuning, but TIL.

Michal

