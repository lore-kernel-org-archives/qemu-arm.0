Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4907208wrs;
        Tue, 27 Aug 2019 00:53:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmk+FF9W+QaEMRwiBsygcG/8nboEqWuwaM/V/18lZJ0Kf4kNna+Y5hwVLL7xqcDk3HrSlk
X-Received: by 2002:a65:5c02:: with SMTP id u2mr20162304pgr.367.1566892413751;
        Tue, 27 Aug 2019 00:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566892413; cv=none;
        d=google.com; s=arc-20160816;
        b=N/aFUVHkqq2RzB4YBlukWBC00lYkgwETkuzlpotWalRyvEJOM4A0aQSrRLcQqS8937
         18PvhQ1GDqPXemtG2nF+w/hM0m/OPDA/28cVV2QSIaGPBHOLrqMWOYrko1mXvu9ttRCN
         uh9uwMAbKqaZHU1MmVmA4+FlLM9xq+ZvpoJraN1FNL4PiToEw1rFN7RJiKxO8jia7Agg
         svaRtJq0/+sLbV87Ysz8M9/jWMjoeYAvLbISZLJffJ3rYKpYAQVZnNzqmsgQNJZHMP8M
         XumSJpjmoFWnFEdtfeEiYbU+EPqh6CGa5Luyp952xDjYou8Lb76QBKY7ZA7dyGTcGfp0
         CIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=sTHobf/6ahlAhmj5leuyMx5wBgQBsVwIO0o3iQEMWrA=;
        b=sBzJycbBsUq71n4Sy2ZDipDYeY0AkzXo2xA1cQKmMh2ya7BLpSsc0o4cGQeonaVp8c
         lszcvvmhy0wlY2J/b1VrhkynBplCSB70Z5DuxDQ3wY2tbeeV4+ziejn0G0HjMZRWCoY7
         iUjrTJe1Il+fG5v+IawdmL/QK8JYtGPjq+xndn2JTxjmrb860Npb0CpIQd5uzaot0oLx
         VCvVDnCuRdly21WnScpodiu5S7Jiqk3P/edGVahcvgOt87AAebkZz46CJJ3bCm3d1/v4
         V3MTpvYMaRsP2K7oUYOE7fCYKTg08yDG48cwdCfL4IWwQB5dmvnlVC4+nbryKSMQjHEY
         27Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t18si1822230pjr.102.2019.08.27.00.53.33;
        Tue, 27 Aug 2019 00:53:33 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbfH0Hxc (ORCPT <rfc822;mike.holmes@linaro.org>
        + 28 others); Tue, 27 Aug 2019 03:53:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49970 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729149AbfH0Hx3 (ORCPT <rfc822;linux-kernel@vger.kernel.org>);
        Tue, 27 Aug 2019 03:53:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5B6E43082E25;
        Tue, 27 Aug 2019 07:53:29 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B010C600D1;
        Tue, 27 Aug 2019 07:53:25 +0000 (UTC)
Subject: Re: [PATCH] KVM: arm/arm64: vgic: Use a single IO device per
 redistributor
To:     Zenghui Yu <yuzenghui@huawei.com>, eric.auger.pro@gmail.com,
        maz@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu
Cc:     zhang.zhanghailiang@huawei.com, wanghaibin.wang@huawei.com,
        james.morse@arm.com, qemu-arm@nongnu.org,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        peter.maydell@linaro.org, andre.przywara@arm.com
References: <20190823173330.23342-1-eric.auger@redhat.com>
 <f5b47614-de48-f3cb-0e6f-8a667cb951c0@redhat.com>
 <5cdcfe9e-98d8-454e-48e7-992fe3ee5eae@huawei.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <ccb49856-f958-8bea-4b27-9a808415c43d@redhat.com>
Date:   Tue, 27 Aug 2019 09:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5cdcfe9e-98d8-454e-48e7-992fe3ee5eae@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 27 Aug 2019 07:53:29 +0000 (UTC)
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: CDEASe1Tq5MZ

Hi Zenghui,
On 8/27/19 9:49 AM, Zenghui Yu wrote:
> Hi Eric,
> 
> Thanks for this patch!
> 
> On 2019/8/24 1:52, Auger Eric wrote:
>> Hi Zenghui, Marc,
>>
>> On 8/23/19 7:33 PM, Eric Auger wrote:
>>> At the moment we use 2 IO devices per GICv3 redistributor: one
>                                                              ^^^
>>> one for the RD_base frame and one for the SGI_base frame.
>   ^^^
>>>
>>> Instead we can use a single IO device per redistributor (the 2
>>> frames are contiguous). This saves slots on the KVM_MMIO_BUS
>>> which is currently limited to NR_IOBUS_DEVS (1000).
>>>
>>> This change allows to instantiate up to 512 redistributors and may
>>> speed the guest boot with a large number of VCPUs.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> I tested this patch with below kernel and QEMU branches:
>> kernel: https://github.com/eauger/linux/tree/256fix-v1
>> (Marc's patch + this patch)
>> https://github.com/eauger/qemu/tree/v4.1.0-256fix-rfc1-rc0
>> (header update + kvm_arm_gic_set_irq modification)
> 
> I also tested these three changes on HiSi D05 (with 64 pcpus), and yes,
> I can get a 512U guest to boot properly now.

Many thanks for the testing (and the bug report). I will formally post
the QEMU changes asap.

Thanks

Eric
> 
> Tested-by: Zenghui Yu <yuzenghui@huawei.com>
> 
>> On a machine with 224 pcpus, I was able to boot a 512 vcpu guest.
>>
>> As expected, qemu outputs warnings:
>>
>> qemu-system-aarch64: warning: Number of SMP cpus requested (512) exceeds
>> the recommended cpus supported by KVM (224)
>> qemu-system-aarch64: warning: Number of hotpluggable cpus requested
>> (512) exceeds the recommended cpus supported by KVM (224)
>>
>> on the guest: getconf _NPROCESSORS_ONLN returns 512
>>
>> Then I have no clue about what can be expected of such overcommit config
>> and I have not further exercised the guest at the moment. But at least
>> it seems to boot properly. I also tested without overcommit and it seems
>> to behave as before (boot, migration).
>>
>> I still need to look at the migration of > 256vcpu guest at qemu level.
> 
> Let us know if further tests are needed.
> 
> 
> Thanks,
> zenghui
> 
