Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1929072lfk;
        Tue, 6 Jul 2021 01:19:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ486D6feLj7Elt+l7jIrx33A2YNE7gZL/1fn9ivbNmnpCZq2SYkKm+W4zvS4CsnDmf0Pb
X-Received: by 2002:a05:6102:2850:: with SMTP id az16mr10879533vsb.17.1625559556866;
        Tue, 06 Jul 2021 01:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625559556; cv=none;
        d=google.com; s=arc-20160816;
        b=kRT7trHYdFMo5MmZ8zCQ/z1VI5zl83iga7ppQKW6EvfiQmxQxJVrz4DAgnCWaS+V+N
         kR0oox4kjCFF3sC3+CF2ptvyttKjBEN4HTHXSxSWQN1zMEwRqE5cyuIHoK37fn/uNHDm
         am8aZY5gwjifx+WGd7Ca546eMy1QkxP+Pzsslrbx7YVdyQcRz5gnwwhGCs1lP0g+8K0/
         8wnHiyZAq7LpBvJmv5cUC2Ie7gY3/yYntIZIsR8mMIIcbKnTegJmM7/0PFhyfgPaF5dL
         4Zfm9d5FXaETK2uJAmK04OVv8B3D7jnW+nap4vANFSdn84JfT10Llo7yn8rUYsIAePVt
         tV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=KxUHs+1GnmhU/25HGlFxfbqy+umdSQqA8PVjdJQKA6Y=;
        b=ueENcjiih2LKL/Mv8tpeDPvTavV5VbbnLoUIvSK+JcwfuBrZ3nIMn2YpaJ28HM/QFA
         qnLkKl9D78sJEK4cNHuYM9bd5Fi1iFMhDFlX0fTqO77Q5kMZC600GM+njo6sk9saN6kV
         e0dt/R3K46Dgrlaj89HRZzRaTuwxtsPnzMbtoD2Qs1asjpP+HcX2DiMiy16tWR19BTu1
         QIYdTb2ENlfAwmgBVdy1Jb77/MeNfQEC5jCQSpnAxIFZ0rCaLp3/KCaJBO1cRCfdlZyu
         S7K+nwewbNvPHOwjVBj8n7wxtdrdiUYBqDbfvgZ+PPzs0iDisYPslYbCRQzqrQRChWXx
         l1+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si11146832vsh.15.2021.07.06.01.19.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 01:19:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0gIW-0005qf-3G
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 04:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m0gII-0005ln-Qw; Tue, 06 Jul 2021 04:19:02 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m0gIE-0003t9-GI; Tue, 06 Jul 2021 04:19:02 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GJwMF0XqWz762y;
 Tue,  6 Jul 2021 16:14:33 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 6 Jul 2021 16:18:53 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 6 Jul 2021 16:18:52 +0800
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "open
 list:ARM cores" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
 <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
 <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <5ccf2a18-0615-8f1c-47cb-163f80037feb@huawei.com>
Date: Tue, 6 Jul 2021 16:18:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangkunkun@huawei.com; helo=szxga03-in.huawei.com
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
Cc: wanghaibin.wang@huawei.com, lushenming@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LYHxqqvbnOME

Hi Eric,

On 2021/6/30 17:16, Eric Auger wrote:
>
> On 6/30/21 3:38 AM, Kunkun Jiang wrote:
>> On 2021/6/30 4:14, Eric Auger wrote:
>>> Hi Kunkun,
>>>
>>> On 6/29/21 11:33 AM, Kunkun Jiang wrote:
>>>> Hi all,
>>>>
>>>> Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
>>>> our original intention is to flush the ITS tables into guest RAM at
>>>> the point
>>>> RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
>>>> migration launch so let's simply flush the tables each time the VM gets
>>>> stopped.
>>>>
>>>> But I encountered an error when I shut down the virtual machine.
>>>>
>>>>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr
>>>>> 0x0000000000000001: Permission denied
>>>> Shall we need to flush ITS tables into guest RAM when 'shutdown' the
>>>> VM?
>>>> Or do you think this error is normal?
>>> yes we determined in the past this was the right moment do save the
>>> tables
>>>
>>> "with a live migration the guest is still running after
>>> the RAM has been first saved, and so the tables may still change
>>> during the iterative RAM save. You would actually need to do this
>>> at just the point we stop the VM before the final RAM save; that *might*
>>> be possible by using a notifier hook a vm run state change to
>>> RUN_STATE_FINISH_MIGRATE
>>> - if you can do the changes just as the migration flips into that mode
>>> it *should* work. " said David.
>>>
>>> But sometimes as the commit msg says, the VM is stopped before the
>>> migration launch - I do not remember the exact scenario tbh -.
>> Well, I initially wanted to know more about this scenario to determine
>> whether
>> a normal shutdown would fall into it.😂
> I think it was for save/restore use case. In that case you need to flush
> the KVM cache in memory on VM shutdown.
Sorry for late reply.

Can we distinguish from the 'RunState'?
When we stop the VM, the RunState will be set. There are many types of
RunState, such as RUN_STATE_FINISH_MIGRATE/RUN_STATE_SAVE_VM/
RUN_STATE_SHUTDOWN/RUN_STATE_GUEST_PANICKED, etc.

Maybe RUN_STATE_SHUTDOWN doesn't belong to save/restore use case,
right?
>> In my opinion, when the virtual machine is normally shutdown, flushing
>> the
>> ITS tables is not necessary. If we can't tell the difference between
>> 'normal shutdown'
>> and the above scenario, then this 'error' is inevitable.
>>> So each time the VM is stopped we flush the caches into guest RAM.
>>>
>>>
>>>
>>>> This error occurs in the following scenario:
>>>> Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC to
>>>> the VM.
>>>>
>>>> The flow is as follows:
>>>>
>>>> QEMU:
>>>> vm_shutdown
>>>>       do_vm_stop(RUN_STATE_SHUTDOWN)
>>>>           vm_state_notify
>>>>               ...
>>>>               vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
>>>>                   kvm_device_access
>>>>
>>>> Kernel:
>>>>       vgic_its_save_tables_v0
>>>>           vgic_its_save_device_tables
>>>>               vgic_its_save_itt
>>>>
>>>> There is such a code in vgic_its_save_itt():
>>>>> /*
>>>>>    * If an LPI carries the HW bit, this means that this
>>>>>    * interrupt is controlled by GICv4, and we do not
>>>>>    * have direct access to that state without GICv4.1.
>>>>>    * Let's simply fail the save operation...
>>>>>    */
>>>>> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>>>>>             return -EACCES;
> Maybe we miss a piece of code for 4.0 that unsets the forwarding. The
> only way to handle this is to make sure  ite->irq->hw is not set on
> shutdown, no?
It's not going to return -EACCES here, if we unset the forwarding first. But
this may cause problems in save/restore scenarios. The GICv4 architecture
doesn't give any guarantee that the pending state is written into the
pending table.

Thanks,
Kunkun Jiang
> Thanks
>
> Eric
>>> As far as I understand you need a v4.1 to migrate,
>>> following Shenming's series
>>> [PATCH v5 0/6] KVM: arm64: Add VLPI migration support on GICv4.1
>>> Maybe sync with him?
>> Yes, GICv4 does not support live migrate.
>>
>> Thanks,
>> Kunkun Jiang
>>> Thanks
>>>
>>> Eric
>>>
>>>
>>>> Looking forward to your reply.
>>>>
>>>> Thanks,
>>>> Kunkun Jiang
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>> .
>>
> .


