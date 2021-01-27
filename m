Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp2176309lfd;
        Wed, 27 Jan 2021 03:20:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzH2C1B9UT7JTIeJWfCsD88N6x/MBYCks4U/EhE27DFQLqyALxP9K0O9sM2bJ7Z2Gmr/jYk
X-Received: by 2002:a25:8188:: with SMTP id p8mr15079837ybk.520.1611746452960;
        Wed, 27 Jan 2021 03:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611746452; cv=none;
        d=google.com; s=arc-20160816;
        b=j8c0Dp08u5Xz0+whRr7P4v5fNYmhStdRhPIr9O6FiQrvBV8Nd2Y0rLYe1A/Q4J80S7
         B+CK0SthxCuN1LXX/1tE/o9eb94hV1f8276acfIpdztBWTupci5hu54PjAnRAjGgxSu0
         06690Giip4QhiGEtKzNJram2fw/uYSN8h80p9r3uzzPCcshSzUNmadf/E9bIN23nOO+X
         RHYLGuJ+ArHdbtvvFhtwOwS9T9fLe9pDL1aT02u75uUr4RR4DhDu4vU1laQYXDLdQvOw
         OIfJmVTZFuBe+vTzye6/c3IRbatXzvIFDfet9a0a+7LIr/AvZIdL1DzRs2AFXwBVEhby
         qzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=FMlUGl7WLFPwsmOdIgFINZ3CWqCKDy69/lPPfIfOB6Q=;
        b=G3Me/cZ7H0ZJ/Sx8B8LjkHG1FTp+66vcUg3iPYJqTHhiRwB3NozU0esJf09m/Ed1YC
         xWyBc7xlwwL5QwrWTsvtntjbrYn62Gy//odwNJLemC5DWV3CNVtLt3mGHA94pM5iGEXy
         LyZ3l9WqiTyahWtafoIKAMcdanobAEHe0ZLlkeAsDm3qKxTX3j6ISfcsKZTKTPU5n5BY
         KbDozMehJMrk/lvnJXPs6D6my47PMoGDGb6dwDFKBwQ/Iu3rgKjZiZGeyZsJkexn/KJW
         +CZ2X/Sy2feHlhO0zonaSuGzulkZXx9b772YUVElqZe50HRe4d01lDWYSHLwem2ZUVc7
         7gDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f95si2221255ybi.236.2021.01.27.03.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 03:20:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4isW-0001g3-A5
	for alex.bennee@linaro.org; Wed, 27 Jan 2021 06:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1l4isL-0001dx-Pw; Wed, 27 Jan 2021 06:20:41 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1l4isI-00061Q-2s; Wed, 27 Jan 2021 06:20:41 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DQh2758xGz7bmk;
 Wed, 27 Jan 2021 19:19:11 +0800 (CST)
Received: from [10.174.186.182] (10.174.186.182) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 27 Jan 2021 19:20:17 +0800
Subject: Re: [RFC PATCH v2 2/3] vfio: Set the priority of the VFIO VM state
 change handler explicitly
To: Alex Williamson <alex.williamson@redhat.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-3-lushenming@huawei.com>
 <20210126143605.4f9d5b25@omen.home.shazbot.org>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <153c36e0-3c7d-cbce-3f37-9ba8c36ce1ca@huawei.com>
Date: Wed, 27 Jan 2021 19:20:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20210126143605.4f9d5b25@omen.home.shazbot.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.182]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=lushenming@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8rpMdT1VWyg0

On 2021/1/27 5:36, Alex Williamson wrote:
> On Wed, 9 Dec 2020 16:09:18 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
>> In the VFIO VM state change handler, VFIO devices are transitioned
>> in the _SAVING state, which should keep them from sending interrupts.
> 
> Is this comment accurate?  It's my expectation that _SAVING has no
> bearing on a device generating interrupts.  Interrupt generation must
> be allowed to continue so long as the device is _RUNNING.  Thanks,
> 

To be more accurate, the _RUNNING bit in device_state is cleared in the
VFIO VM state change handler when stopping the VM. And if the device continues
to send interrupts after this, how can we save the states of device interrupts
in the stop-and-copy phase?...

Thanks,
Shenming

> Alex
> 
>> Then we can save the pending states of all interrupts in the GIC VM
>> state change handler (on ARM).
>>
>> So we have to set the priority of the VFIO VM state change handler
>> explicitly (like virtio devices) to ensure it is called before the
>> GIC's in saving.
>>
>> Signed-off-by: Shenming Lu <lushenming@huawei.com>
>> Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
>> ---
>>  hw/vfio/migration.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 3b9de1353a..97ea82b100 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -862,7 +862,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>      register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
>>                           vbasedev);
>>  
>> -    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
>> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
>> +                                                           vfio_vmstate_change,
>>                                                             vbasedev);
>>      migration->migration_state.notify = vfio_migration_state_notifier;
>>      add_migration_state_change_notifier(&migration->migration_state);
> 
> .
> 
