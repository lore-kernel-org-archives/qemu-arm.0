Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp2100368qvb;
        Mon, 12 Apr 2021 06:48:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxctnzha1CYzgnBM5PF990ifwQEUFmcSoafBk8KcHv9gBsr07n9tJZv+FuSLx/w/xlf/KkP
X-Received: by 2002:a05:6830:802:: with SMTP id r2mr23064144ots.110.1618235327538;
        Mon, 12 Apr 2021 06:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618235327; cv=none;
        d=google.com; s=arc-20160816;
        b=uRXBe19prcpnDJ2ghdPkKxNd59h+P1anxhVF+zJOmHoosIE470jbLyzAj5rpEKhStf
         PJeNNxfOI0qfc5d8a5B5Pem/d4JYhWecj6GtClR6ApGnyIgONCm6KJJM1/BIWCm0+cu2
         wgoDqc5RE8xu/xR/YIP8iEq+LooLCKtBWDQxfWMuqUhTmzEJK68xo2sjJ+t4RG+g3Kyy
         qiyzwJEgOEe6i9phNeSOtttIzQWl+HMh9RkE+PRbTyqS/ZrSENP1efQImUsKoOVLz2iE
         AOQMeLevLQDdUXX6qPCjvsw/kfEJkhpHlHm1mZmuTh4JrWQ2s1kJcT5xna+UdBKp7Rle
         4eyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Gi1Knl3vTRRaWndPDnqJl4YlBGT/LYz50EhpWI2pNpw=;
        b=Rd8NHpZNynssqp2kOn7MKvWfTZwcLG1mX1BJDx6JGsA3bkP6R7LPHWegkec0Mln0pr
         hqApKEwOT36+e8mbsS0xApYXG2c3i9cWw/VZokNpo/KXtdOo80Xpe/LD6+1i/f5yB3H2
         oqEKXymJ4Oyf8Q5U7AZXVwCaKUIavV2FZp7nK9DCczTAbbZGgX7ejGELPzrhiFlQaQXX
         PRk+o6pDQ5FoRnq6WeoCFqPdNL/6PfeOAZUr/fTwfOybk4OOe3tFCDmB4TzVUO1bPxGJ
         2tVAsigatzLjdEiu6P7QDN9sOokA8sjxC4xs+mA4exK3BlSlI1HX61LnPiglKxvAyXqu
         wn2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si13889510otk.298.2021.04.12.06.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 06:48:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVwvm-0001cw-Tx
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 09:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lVwu4-0008TM-Rw; Mon, 12 Apr 2021 09:47:02 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lVwu1-0005M0-0j; Mon, 12 Apr 2021 09:47:00 -0400
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FJqgm0VZ2z14HB9;
 Mon, 12 Apr 2021 21:43:16 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 12 Apr 2021 21:46:51 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 12 Apr 2021 21:46:51 +0800
Subject: Re: [RFC PATCH 0/3] Add migration support for VFIO PCI devices in
 SMMUv3 nested stage mode
To: Auger Eric <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
 <16fd91d3-2bbf-b870-ad36-2cfef54be265@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <819bfb94-ab19-1fe0-3362-353d8be443a6@huawei.com>
Date: Mon, 12 Apr 2021 21:46:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <16fd91d3-2bbf-b870-ad36-2cfef54be265@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com, Keqian
 Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FH4vJ1hCE8C7

Hi Eric,

On 2021/4/12 16:40, Auger Eric wrote:
> Hi Kunkun,
>
> On 2/19/21 10:42 AM, Kunkun Jiang wrote:
>> Hi all,
>>
>> Since the SMMUv3's nested translation stages[1] has been introduced by Eric, we
>> need to pay attention to the migration of VFIO PCI devices in SMMUv3 nested stage
>> mode. At present, it is not yet supported in QEMU. There are two problems in the
>> existing framework.
>>
>> First, the current way to get dirty pages is not applicable to nested stage mode.
>> Because of the "Caching Mode", VTD can map the RAM through the host single stage
>> (giova->hpa). "vfio_listener_log_sync" gets dirty pages by transferring "giova"
>> to the kernel for the RAM block section of mapped MMIO region. In nested stage
>> mode, we setup the stage 2 (gpa->hpa) and the stage 1(giova->gpa) separately. So
>> it is inapplicable to get dirty pages by the current way in nested stage mode.
>>
>> Second, it also need to pass stage 1 configurations to the destination host after
>> the migration. In Eric's patch, it passes the stage 1 configuration to the host on
>> each STE update for the devices set the PASID PciOps. The configuration will be
>> applied at physical level. But the data of physical level will not be sent to the
>> destination host. So we have to pass stage 1 configurations to the destination
>> host after the migration.
>>
>> This Patch set includes patches as below:
>> Patch 1-2:
>> - Refactor the vfio_listener_log_sync and added a new function to get dirty pages
>> in nested stage mode.
>>
>> Patch 3:
>> - Added the post_load function to vmstate_smmuv3 for passing stage 1 configuration
>> to the destination host after the migration.
>>
>> @Eric, Could you please add this Patch set to your future version of
>> "vSMMUv3/pSMMUv3 2 stage VFIO integration", if you think this Patch set makes sense? :)
> First of all, thank you for working on this. As you may have noticed I
> sent a new RFC version yesterday (without including this). When time
> allows, you may have a look at the comments I posted on your series. I
> don't think I can test it at the moment so I may prefer to keep it
> separate. Also be aware that the QEMU integration of nested has not
> received much comments yet and is likely to evolve. The priority is to
> get some R-b's on the kernel pieces, especially the SMMU part. With this
> dependency resolved, things can't move forward I am afraid.
>
> Thanks
>
> Eric
Yes, I saw your latest version and comments. Thanks again for your review.

I will try my best to test your patches and come up with some useful ideas.
In the future, this series will be updated with your series of nested.
If conditions permit, I hope you can test it and give me some comments.

Best regards,
Kunkun Jiang
>> Best Regards
>> Kunkun Jiang
>>
>> [1] [RFC,v7,00/26] vSMMUv3/pSMMUv3 2 stage VFIO integration
>> http://patchwork.ozlabs.org/project/qemu-devel/cover/20201116181349.11908-1-eric.auger@redhat.com/
>>
>> Kunkun Jiang (3):
>>    vfio: Introduce helpers to mark dirty pages of a RAM section
>>    vfio: Add vfio_prereg_listener_log_sync in nested stage
>>    hw/arm/smmuv3: Post-load stage 1 configurations to the host
>>
>>   hw/arm/smmuv3.c     | 60 +++++++++++++++++++++++++++++++++++++++++++++
>>   hw/arm/trace-events |  1 +
>>   hw/vfio/common.c    | 47 +++++++++++++++++++++++++++++------
>>   3 files changed, 100 insertions(+), 8 deletions(-)
>>
> .


