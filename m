Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2185359lfk;
        Tue, 6 Jul 2021 06:52:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIHDAlsfhkEM0ZkDdemXeteJ08DYaFxfYpv8dn3YTtd9GZcCk4BWCVgcMAt9NkXSUcil/k
X-Received: by 2002:a17:906:85c2:: with SMTP id i2mr6581663ejy.27.1625579549690;
        Tue, 06 Jul 2021 06:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625579549; cv=none;
        d=google.com; s=arc-20160816;
        b=G5dQkuJY5mUGMPngkLTYpeY1dCO9xN08096pbqNPNQktzKkJLAJHEu6WjFhbbRHOLE
         c0zz1ijaaZmgYFJ/FY5ccCIFboOFy0gg3ecvQMcBit6Dm2w9CIhH4jDwy2RAnblXOM7i
         /CfNLDl8BKKGTzi7jaj3M5Rp+Yw1ZNG61vVYbtqTqApespZhZ67tHsmXCZ14E2YTvP2U
         DCIC147xdDL3xYKdifHk0uKOiS3n9wOxPajEvyT/HA0jrXtIwxUxm/wX2LiY4uskSVSD
         BZyBGg6FTTwGqxqv0hxlEzSncFWAKXlIavSp8EF36x3nA5QsjOI8DcrAiW4lAt/tccSI
         Udog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LiMtYZ/w/8aBYQXsrdMwlIYaR3Py1xA+QpReXSwUG8w=;
        b=Anfi3VBDfWp8KAwJ2j+L6GUfaecryaDVqmFKEWNbzIInYmV2jFXtYcBCR390hzNYQ8
         G3nDKbmn04EslsxWcpnrn6a6G3BdzOTQu7DtY2WpnGE4gsqDuYCZ6gsrvMcRsH+bVD24
         Ln8jkrZACWMbzldp5yctoH1cBbLr1YXbTHqH+6ScV4l7kOwSSGUNDpIyc6qXA+tF4Mjw
         0kRcv6lO5xv3RU9bxbOn7ONh7ZMCpokjZElAetzF/MLkOJvjREa9Ag06qCwjl3mwR3dB
         wT3ZjGrU5zbhERCkvqlTeBbp3Sk2bHo0egnpynkf06n3Y8rDu9eC0pEUYDxQT/srWVtc
         JHNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MHcSFXCa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f27si17577322ejf.63.2021.07.06.06.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 06:52:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MHcSFXCa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0lUy-0003qs-Le
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 09:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0lUp-0003qF-Mt
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 09:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0lUm-0007de-HG
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 09:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625579534;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiMtYZ/w/8aBYQXsrdMwlIYaR3Py1xA+QpReXSwUG8w=;
 b=MHcSFXCaP075cJUBaiU1zW8pyf/p7fgkvkN4KIqLJKV1na2Xu5edtJA/xyhFMHLoAoBKhm
 AlKouMHm6zYDwBYKzwVKkfWSBqSMO9ZfDGvLLNOrHOpqkdufvOGKcSeXtxVzDzcNwN2B2o
 LvRAxdNpTDenzmWQgtGowHPWAIEkO6U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-i76rVWQ8P3SqTHtLB7OX9A-1; Tue, 06 Jul 2021 09:52:13 -0400
X-MC-Unique: i76rVWQ8P3SqTHtLB7OX9A-1
Received: by mail-wr1-f69.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so7202705wru.6
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 06:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=LiMtYZ/w/8aBYQXsrdMwlIYaR3Py1xA+QpReXSwUG8w=;
 b=lpFbbiWpZ8UPVdtRDvN8x8ES3BHX3QMsPE6OEH570yI6j2omw7ETtYtRd1yuWMjqM2
 y0jfrtDmwX9IRUg5PpMVkhc8RCBw7bcWf0lSRVmrVpPJW4DS3TYRzJP2vZjvYXjNZcnv
 OHfHMfl7fDfipJMfv1OXPhVeZyKLwfZiKzOpAExQK2ke2cVMhuNv+EXLGwAECGJFmCGf
 e2vKDE3vZ/WlZbkX/IkAGTV5no+yxs8t8/Mf7AbwD7jNCWp+ZXpcRgRYw5t9RuLjmfn5
 Drhj/CHyNVio3Bx17G4xKCe12vNvZ24DF422dm82MhA9zm1vhF1GRfDC4RA5e3luomw2
 gNkA==
X-Gm-Message-State: AOAM532EQ07oI9SJBDj6GJ4kX1kYwQ5K2TLCkoD0E+8rag1b+EO/s+R1
 t/umz+5VyB6bUDFlbMat1XjCg6laNzKVLFBS0PrGbZe7gZZz41OqPoB9p+Wjqrg3rx5tmJjrkNm
 e/oD/wsSbWCWW
X-Received: by 2002:a05:600c:214b:: with SMTP id
 v11mr866549wml.95.1625579530022; 
 Tue, 06 Jul 2021 06:52:10 -0700 (PDT)
X-Received: by 2002:a05:600c:214b:: with SMTP id
 v11mr866524wml.95.1625579529806; 
 Tue, 06 Jul 2021 06:52:09 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c16sm16791655wru.24.2021.07.06.06.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 06:52:09 -0700 (PDT)
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
 <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
 <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
 <5ccf2a18-0615-8f1c-47cb-163f80037feb@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <eb63f96e-59e8-55cb-d8ba-119f75ce032f@redhat.com>
Date: Tue, 6 Jul 2021 15:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5ccf2a18-0615-8f1c-47cb-163f80037feb@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: wanghaibin.wang@huawei.com, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 lushenming@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 39EMLOC612YB

Hi,

On 7/6/21 10:18 AM, Kunkun Jiang wrote:
> Hi Eric,
>
> On 2021/6/30 17:16, Eric Auger wrote:
>>
>> On 6/30/21 3:38 AM, Kunkun Jiang wrote:
>>> On 2021/6/30 4:14, Eric Auger wrote:
>>>> Hi Kunkun,
>>>>
>>>> On 6/29/21 11:33 AM, Kunkun Jiang wrote:
>>>>> Hi all,
>>>>>
>>>>> Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
>>>>> our original intention is to flush the ITS tables into guest RAM at
>>>>> the point
>>>>> RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
>>>>> migration launch so let's simply flush the tables each time the VM
>>>>> gets
>>>>> stopped.
>>>>>
>>>>> But I encountered an error when I shut down the virtual machine.
>>>>>
>>>>>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr
>>>>>> 0x0000000000000001: Permission denied
>>>>> Shall we need to flush ITS tables into guest RAM when 'shutdown' the
>>>>> VM?
>>>>> Or do you think this error is normal?
>>>> yes we determined in the past this was the right moment do save the
>>>> tables
>>>>
>>>> "with a live migration the guest is still running after
>>>> the RAM has been first saved, and so the tables may still change
>>>> during the iterative RAM save. You would actually need to do this
>>>> at just the point we stop the VM before the final RAM save; that
>>>> *might*
>>>> be possible by using a notifier hook a vm run state change to
>>>> RUN_STATE_FINISH_MIGRATE
>>>> - if you can do the changes just as the migration flips into that mode
>>>> it *should* work. " said David.
>>>>
>>>> But sometimes as the commit msg says, the VM is stopped before the
>>>> migration launch - I do not remember the exact scenario tbh -.
>>> Well, I initially wanted to know more about this scenario to determine
>>> whether
>>> a normal shutdown would fall into it.😂
>> I think it was for save/restore use case. In that case you need to flush
>> the KVM cache in memory on VM shutdown.
> Sorry for late reply.
>
> Can we distinguish from the 'RunState'?
> When we stop the VM, the RunState will be set. There are many types of
> RunState, such as RUN_STATE_FINISH_MIGRATE/RUN_STATE_SAVE_VM/
> RUN_STATE_SHUTDOWN/RUN_STATE_GUEST_PANICKED, etc.
>
> Maybe RUN_STATE_SHUTDOWN doesn't belong to save/restore use case,
> right?

Adding Dave, Juan and Peter in the loop for migration expertise.

At the moment we save the ARM ITS MSI controller tables whenever the VM
gets stopped. Saving the tables from KVM caches into the guest RAM is
needed for migration and save/restore use cases.
However with GICv4 this fails at KVM level because some MSIs are
forwarded and saving their state is not supported with GICv4.

While GICv4 migration is not supported we would like the VM to work
properly, ie. being stoppable without taking care of table saving.

So could we be more precise and identifiy the save/restore and migration
use cases instead of saving the tables on each VM shutdown.

The tables are saved into guest RAM so when need the CPUs and devices to
be stopped but we need the guest RAM to be saved after the ITS save
operation.

Kunkun, by the way you currently just get an error from qemu, ie. qemu
does not exit? Couldn't we just ignore -EACCESS error?

Thanks

Eric




>>> In my opinion, when the virtual machine is normally shutdown, flushing
>>> the
>>> ITS tables is not necessary. If we can't tell the difference between
>>> 'normal shutdown'
>>> and the above scenario, then this 'error' is inevitable.
>>>> So each time the VM is stopped we flush the caches into guest RAM.
>>>>
>>>>
>>>>
>>>>> This error occurs in the following scenario:
>>>>> Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC
>>>>> to
>>>>> the VM.
>>>>>
>>>>> The flow is as follows:
>>>>>
>>>>> QEMU:
>>>>> vm_shutdown
>>>>>       do_vm_stop(RUN_STATE_SHUTDOWN)
>>>>>           vm_state_notify
>>>>>               ...
>>>>>               vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
>>>>>                   kvm_device_access
>>>>>
>>>>> Kernel:
>>>>>       vgic_its_save_tables_v0
>>>>>           vgic_its_save_device_tables
>>>>>               vgic_its_save_itt
>>>>>
>>>>> There is such a code in vgic_its_save_itt():
>>>>>> /*
>>>>>>    * If an LPI carries the HW bit, this means that this
>>>>>>    * interrupt is controlled by GICv4, and we do not
>>>>>>    * have direct access to that state without GICv4.1.
>>>>>>    * Let's simply fail the save operation...
>>>>>>    */
>>>>>> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>>>>>>             return -EACCES;
>> Maybe we miss a piece of code for 4.0 that unsets the forwarding. The
>> only way to handle this is to make sure  ite->irq->hw is not set on
>> shutdown, no?
> It's not going to return -EACCES here, if we unset the forwarding
> first. But
> this may cause problems in save/restore scenarios. The GICv4 architecture
> doesn't give any guarantee that the pending state is written into the
> pending table.
>
> Thanks,
> Kunkun Jiang
>> Thanks
>>
>> Eric
>>>> As far as I understand you need a v4.1 to migrate,
>>>> following Shenming's series
>>>> [PATCH v5 0/6] KVM: arm64: Add VLPI migration support on GICv4.1
>>>> Maybe sync with him?
>>> Yes, GICv4 does not support live migrate.
>>>
>>> Thanks,
>>> Kunkun Jiang
>>>> Thanks
>>>>
>>>> Eric
>>>>
>>>>
>>>>> Looking forward to your reply.
>>>>>
>>>>> Thanks,
>>>>> Kunkun Jiang
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>> .
>>>
>> .
>
>

