Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8215265lfc;
        Thu, 18 Feb 2021 06:46:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbzk29X4BjHrisawgWFt0pCz4l2maIrezwf4tpnVrAMLHg7H3eOgjmlrk/O2Yxw8o4lgG8
X-Received: by 2002:a25:d80a:: with SMTP id p10mr6849243ybg.473.1613659573427;
        Thu, 18 Feb 2021 06:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613659573; cv=none;
        d=google.com; s=arc-20160816;
        b=I7N485Ne6ws/n4YmNWRiOy87HxKiZF1vtVEdfyMD3ZTc/FVOt8M2SQ8nYAsE4DHP2p
         8bTwQB/HZ+G/JrRSLLiaA7nU2amkqZ+Ho5lBYqqTCWUwc45eoSK0zS1ZF391X+df1hE8
         qV4C+D1/UGF4J41h3ctQbzQT8MIVXbbtK05KXyrJ/BqFo4s16j0c92SycBEl3KC0tcN4
         w5bnyoI1A1g6J0y6WGzRj/8zXqMsm7TWvFZEFWh49kh+KFERYNlfXt4zkkvAxe+ZLhg5
         BNSkSbqwDiUmPzbna18/X82/X0sVJ+ZIZWh3TSmmlW/KDwmsscVq2yBAiNb6TxlZ8YGA
         NOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:dkim-signature
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=YSC4LsIExGbFwM/0D6UsPB/g0+vd0rjYm6CLTNuUcho=;
        b=sGS9DN/7Ct7+O0cdf/bOwH84wOGesCsSvngTNAnsOUUR+tEemE3cdg5N7+/er++coQ
         hTrjR3m+QKFbPBcvaxe1Gr18ktTdeCVj+YPLyLTEUCRbrM2aw0rxDCRwQumPZrPA5L9W
         kVhnKS/pmSbaTyFr6nRnWP4TmmWOP2zHvMwRCe5XgwWRm13jlOQC3L1fYb06zxRsU6Ub
         xUrEjtXveOAzlgT+m7XVH53COqDYDrdDFT4gmmKrrW0VclFQaH+KiZnTAJdPa42h+RgY
         t1RJBJHpoa5DSdJzDJiRXVOiFvK6c052/qC1PhJWIHRBUJcyUEUgflhyYgnVh/V/8EXr
         pOWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=N0OmWFnC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si5049777ybd.312.2021.02.18.06.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Feb 2021 06:46:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=N0OmWFnC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lCkZI-0002lx-Mm
	for alex.bennee@linaro.org; Thu, 18 Feb 2021 09:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lCkYX-0002kT-Dw; Thu, 18 Feb 2021 09:45:25 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lCkYV-0002vZ-H9; Thu, 18 Feb 2021 09:45:25 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602e7d810005>; Thu, 18 Feb 2021 06:45:21 -0800
Received: from [10.40.100.105] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Feb
 2021 14:45:10 +0000
Subject: Re: [RFC PATCH v2 1/3] vfio: Move the saving of the config space to
 the right place in VFIO migration
To: Alex Williamson <alex.williamson@redhat.com>, Shenming Lu
 <lushenming@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-2-lushenming@huawei.com>
 <20201209132947.3177f130.cohuck@redhat.com>
 <20201209113431.5b252e93@omen.home>
 <3f7db9e7-3c98-5022-e907-e6214815fae9@huawei.com>
 <20210126143602.0dac239f@omen.home.shazbot.org>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <06f4c249-5c98-34c8-e465-8aa61591e575@nvidia.com>
Date: Thu, 18 Feb 2021 20:15:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210126143602.0dac239f@omen.home.shazbot.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1613659521; bh=YSC4LsIExGbFwM/0D6UsPB/g0+vd0rjYm6CLTNuUcho=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=N0OmWFnCYigbKqh4Ed38Nnj6t6AtR/BIV8Vl6IaNjogQWHXblrBHzkHkk7e0Y4tfl
 hfYN5SRHc5sdpm/gzVNlxg8Pk6TbmHNXEoRpHPGze1rqyKRj5XTY0I+e/hp9SDO8HY
 4DQ4iqq/EPiMrNTZ6pTCkLv+I9qM1+EzQqOw4CpbXWisz6h5InJCtdbg/A5vtlv4Sr
 PZPtD/kLu+o6UdzTSUqpSgReBtnIb0AkNEpKdcdJj/+pljGkPT1nsyHe0jbynlXooZ
 m0KL9Z3PoaSgr4YSR8wWJLdQeWeFjiPeSnlIiilwcw170TKW9m8QERKvz8Ebs7fh1Z
 L8QSmdUCPBeOw==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ipKRE3lXRwXU



On 1/27/2021 3:06 AM, Alex Williamson wrote:
> On Thu, 10 Dec 2020 10:21:21 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
>> On 2020/12/10 2:34, Alex Williamson wrote:
>>> On Wed, 9 Dec 2020 13:29:47 +0100
>>> Cornelia Huck <cohuck@redhat.com> wrote:
>>>    
>>>> On Wed, 9 Dec 2020 16:09:17 +0800
>>>> Shenming Lu <lushenming@huawei.com> wrote:
>>>>   
>>>>> On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
>>>>> setup, if the restoring of the VFIO PCI device config space is
>>>>> before the VGIC, an error might occur in the kernel.
>>>>>
>>>>> So we move the saving of the config space to the non-iterable
>>>>> process, so that it will be called after the VGIC according to
>>>>> their priorities.
>>>>>
>>>>> As for the possible dependence of the device specific migration
>>>>> data on it's config space, we can let the vendor driver to
>>>>> include any config info it needs in its own data stream.
>>>>> (Should we note this in the header file linux-headers/linux/vfio.h?)
>>>>
>>>> Given that the header is our primary source about how this interface
>>>> should act, we need to properly document expectations about what will
>>>> be saved/restored when there (well, in the source file in the kernel.)
>>>> That goes in both directions: what a userspace must implement, and what
>>>> a vendor driver can rely on.
>>
>> Yeah, in order to make the vendor driver and QEMU cooperate better, we might
>> need to document some expectations about the data section in the migration
>> region...
>>>>
>>>> [Related, but not a todo for you: I think we're still missing proper
>>>> documentation of the whole migration feature.]
>>>
>>> Yes, we never saw anything past v1 of the documentation patch.  Thanks,
>>>

I'll get back on this and send next version soon.

>>
>> By the way, is there anything unproper with this patch? Wish your suggestion. :-)
> 
> I'm really hoping for some feedback from Kirti, I understand the NVIDIA
> vGPU driver to have some dependency on this.  Thanks,

NVIDIA driver doesn't use device config space value/information during 
device data restoration, so we are good with this change.

Thanks,
Kirti


> 
> Alex
> 
>>>>> Signed-off-by: Shenming Lu <lushenming@huawei.com>
>>>>> ---
>>>>>   hw/vfio/migration.c | 25 +++++++++++++++----------
>>>>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>>
>>> .
>>>    
>>
> 
