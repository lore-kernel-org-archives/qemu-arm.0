Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4904492wrs;
        Tue, 27 Aug 2019 00:49:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyAk+mnuma8m+2sPObRDxzCJ4DGSmZBuDw2RahQenVFYz7ayFMuLRMPd0jk+/0Bo/u8uIId
X-Received: by 2002:a17:902:848c:: with SMTP id c12mr7515488plo.47.1566892189449;
        Tue, 27 Aug 2019 00:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566892189; cv=none;
        d=google.com; s=arc-20160816;
        b=yAwr33cymIBbV8k7vD63t8oAgLlKlU2CoMGXWPnDpeCXYRBvnUxh0E4nqwschaes9m
         rHSZf0IQN/a5XxYOpmEU6Hl1BfSFwNR8J69+LOt8RcQ3CAaOfDsf9Mk4Jrinxt4fURQb
         MszI+0km/b78bgJyRHQL98wi1AHoQFUNYXqIOwKEvhH44WBm7Mwu9ArlTCsUZ1TTCY35
         NzN3HWtWag48Di3V4ZoWMXN59J53Jw2p3L1m5ZYRTgBpXby0IJl/JdKzloWEPiiZzEWa
         yGNvch4STOa14OOa9stgwaAhQMyCm4W5GbxwU6VwHCFCFLPnNYqfZWVjmOC91KSqzWfD
         Yq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=o0tvdN1T75AoATwy8pexYBwGsO/vcvfius3jfDGpA+8=;
        b=ujje9iKrmZMmgpvschV98oP1+JfnwNP8ArYStNqFEWymJOzyKkFSZefkeM8aeUc4bm
         ep3TVLFJkZvRaaAmg53S1bj3owkeFiMSGQGBPOmUkQbsseDIJdeaESoRUmIi3NAGMadE
         Pg/2MgwZGt1u6kD/vQlXTq5918DG86Mu5Ca1E9zLkA1XvQM3tdKZWxG0N2CzJpYMB322
         D+dqIaOSYiVoKTrsTVniB3XDMW8zYq+g8MtOOtdWi/URHz/y0wGB3f1XaDaY6jSzv3pZ
         Z1ZRizqg/Ron4RoUY2ikgdZapKZDSu4Y4dlGjqd2/tbqRK8wJaK61c5bwBR3+Jyi88vJ
         UwTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t10si1771308pjr.62.2019.08.27.00.49.48;
        Tue, 27 Aug 2019 00:49:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbfH0Hts (ORCPT <rfc822;mike.holmes@linaro.org>
        + 28 others); Tue, 27 Aug 2019 03:49:48 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41954 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725985AbfH0Htr (ORCPT <rfc822;linux-kernel@vger.kernel.org>);
        Tue, 27 Aug 2019 03:49:47 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 54B5E417F00AEC2B86DC;
        Tue, 27 Aug 2019 15:49:44 +0800 (CST)
Received: from [127.0.0.1] (10.184.12.158) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 27 Aug 2019
 15:49:38 +0800
Subject: Re: [PATCH] KVM: arm/arm64: vgic: Use a single IO device per
 redistributor
To:     Auger Eric <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
        <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
        <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>
CC:     <zhang.zhanghailiang@huawei.com>, <wanghaibin.wang@huawei.com>,
        <james.morse@arm.com>, <qemu-arm@nongnu.org>,
        <julien.thierry.kdev@gmail.com>, <suzuki.poulose@arm.com>,
        <peter.maydell@linaro.org>, <andre.przywara@arm.com>
References: <20190823173330.23342-1-eric.auger@redhat.com>
 <f5b47614-de48-f3cb-0e6f-8a667cb951c0@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <5cdcfe9e-98d8-454e-48e7-992fe3ee5eae@huawei.com>
Date:   Tue, 27 Aug 2019 15:49:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101
 Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <f5b47614-de48-f3cb-0e6f-8a667cb951c0@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.12.158]
X-CFilter-Loop: Reflected
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: +oF/MFyH+JkI

Hi Eric,

Thanks for this patch!

On 2019/8/24 1:52, Auger Eric wrote:
> Hi Zenghui, Marc,
> 
> On 8/23/19 7:33 PM, Eric Auger wrote:
>> At the moment we use 2 IO devices per GICv3 redistributor: one
                                                              ^^^
>> one for the RD_base frame and one for the SGI_base frame.
   ^^^
>>
>> Instead we can use a single IO device per redistributor (the 2
>> frames are contiguous). This saves slots on the KVM_MMIO_BUS
>> which is currently limited to NR_IOBUS_DEVS (1000).
>>
>> This change allows to instantiate up to 512 redistributors and may
>> speed the guest boot with a large number of VCPUs.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> I tested this patch with below kernel and QEMU branches:
> kernel: https://github.com/eauger/linux/tree/256fix-v1
> (Marc's patch + this patch)
> https://github.com/eauger/qemu/tree/v4.1.0-256fix-rfc1-rc0
> (header update + kvm_arm_gic_set_irq modification)

I also tested these three changes on HiSi D05 (with 64 pcpus), and yes,
I can get a 512U guest to boot properly now.

Tested-by: Zenghui Yu <yuzenghui@huawei.com>

> On a machine with 224 pcpus, I was able to boot a 512 vcpu guest.
> 
> As expected, qemu outputs warnings:
> 
> qemu-system-aarch64: warning: Number of SMP cpus requested (512) exceeds
> the recommended cpus supported by KVM (224)
> qemu-system-aarch64: warning: Number of hotpluggable cpus requested
> (512) exceeds the recommended cpus supported by KVM (224)
> 
> on the guest: getconf _NPROCESSORS_ONLN returns 512
> 
> Then I have no clue about what can be expected of such overcommit config
> and I have not further exercised the guest at the moment. But at least
> it seems to boot properly. I also tested without overcommit and it seems
> to behave as before (boot, migration).
> 
> I still need to look at the migration of > 256vcpu guest at qemu level.

Let us know if further tests are needed.


Thanks,
zenghui
