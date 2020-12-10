Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5519488lfb;
        Wed, 9 Dec 2020 19:12:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwax/oF5TF8RGigGOH0KWz0u6sNJv7bsQPoFUfhJbwyRRKYCNSMkpLY1NrMabzytWbnKs+c
X-Received: by 2002:a25:6003:: with SMTP id u3mr7500947ybb.126.1607569942155;
        Wed, 09 Dec 2020 19:12:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607569942; cv=none;
        d=google.com; s=arc-20160816;
        b=NrPeOLKD0WX1zRkAIcYjRlMq62GC/084Vafn/JlMcQofdpg6sSqfbm4GAiryvh01t/
         Xtp0UWS6KFnxCAP6vmkj4T3pTJw4OpEl97oFWU1XvPB9zbplt+0ascyox8vtpF6BjbSi
         U7zX5yoJA59cOidkPVV9aF/2GgkggRGJ5Wgj15SDOpl56g301wChVptuP145zEsKFFo7
         PlTi2w8QhrYkQrMsT7Jrs8GCgK6NLJxaiV+UL+akHAr4lq5lNXyzs2WA/Pn2qcWlO3YS
         H0gxIS78p+PJXTQQZkrl2u37FNfeblZiTiBwd3yGuZRXldCu8ulOw+2R6pY6hD62h+Y9
         p80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=kiTb7nAWg0LSDPDOPtO9hnXPW0Yfdyw8Rj0vxxhKu28=;
        b=x7cTg0e+2P8jHnloEm/on4aQD5IBBKERmGklYmGkTqBl+JXZ0OAg5E0oPQXLewbHvb
         j7BWP1o+XBFMNLOehlC8RRmc2+GIcN7zBRNDX6aX/r9WZLBR1hD9NSe4I27UHvjROBxP
         2819u1LKtKbafvgary6m8hhgTD34/I0XOVDtcxTc1JTxQqaVuuITGTNvMKY8bzbtDpen
         EllHHujElacOb3VyfgsHY4qjHfyq4U/pDJ+s32tn4cIKkdz4we1poy3/QDBRbfb8qoNP
         EGDz369IYpb0K3wpnExoi6p9fn1DVClRz26QJdiXt8AKgCUITF0TQKihHmstfFJyPlzE
         Y6Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1si2564535ybi.98.2020.12.09.19.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 19:12:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knCNR-0000CQ-JY
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 22:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1knCMn-0000C5-PM; Wed, 09 Dec 2020 22:11:41 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1knCMi-0000RI-VM; Wed, 09 Dec 2020 22:11:41 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrzSg42TvzM0Cm;
 Thu, 10 Dec 2020 11:10:43 +0800 (CST)
Received: from [10.174.187.219] (10.174.187.219) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 11:11:18 +0800
Subject: Re: [RFC PATCH v2 2/3] vfio: Set the priority of the VFIO VM state
 change handler explicitly
To: Cornelia Huck <cohuck@redhat.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-3-lushenming@huawei.com>
 <20201209134537.5c7ab401.cohuck@redhat.com>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <817ace0f-ddcf-db7f-8f92-f94cc450fb90@huawei.com>
Date: Thu, 10 Dec 2020 11:11:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201209134537.5c7ab401.cohuck@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.219]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lushenming@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, qemu-devel@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eCs49rLukcUs

On 2020/12/9 20:45, Cornelia Huck wrote:
> On Wed, 9 Dec 2020 16:09:18 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
>> In the VFIO VM state change handler, VFIO devices are transitioned
>> in the _SAVING state, which should keep them from sending interrupts.
>> Then we can save the pending states of all interrupts in the GIC VM
>> state change handler (on ARM).
>>
>> So we have to set the priority of the VFIO VM state change handler
>> explicitly (like virtio devices) to ensure it is called before the
>> GIC's in saving.
> 
> What this patch does is to make the priority of the vfio migration
> state change handler depending on the position in the qdev tree. As all
> state change handlers with no explicit priority are added at priority
> 0, this will make sure that this handler runs before (save) resp. after
> (restore) nearly all other handlers, which will address your issue here
> (and possibly similar ones).
> 
> So, this patch seems fine for now, but I'm wondering whether we need to
> think more about priorities for handlers in general, and if there are
> more hidden dependencies lurking in there.

As far as I know, as for the migration of interrupt, on x86 the sync from
the PIR field to the Virtual-APIC page for posted interrupts (in
KVM_GET_LAPIC ioctl) is after the pause of VFIO devices, which is fine.
Not sure about others...

Thanks,
Shenming

> 
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
