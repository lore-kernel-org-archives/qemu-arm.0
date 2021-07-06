Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2217684lfk;
        Tue, 6 Jul 2021 07:28:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOXPDctgUg7y9EUNIxFnhm6RyM/hTdS6Xu6kJGm7oHkmKk6YGWvEUPC+So1FXZfmn6zw9N
X-Received: by 2002:aa7:cf91:: with SMTP id z17mr23501252edx.112.1625581704229;
        Tue, 06 Jul 2021 07:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625581704; cv=none;
        d=google.com; s=arc-20160816;
        b=aVkIJc6/f44Zn8KR/DygVF+fu83pomozJ3mhyoPGPcpvj0XM8IiF3WJ4KSWO6kGKQl
         XOIQns6EWa3GvyPE+59lEDiwheHmfLFXC4pD0oLS0CZyC4N6u9K0ekYe06Psl9vV/MeR
         MIL+GG8RWrOXhMImv9qSmkje6MbPTJT70p1iQtspSO5Ib1kfrjdkZJnHkvi8Lod5yxHf
         m3NiEhJwTWeeDVDMxzOi4gPQDoaOE5lDJMYVs7LQzmdSHNgiEjuTNAsjd5zo67Hjxg/M
         JWVMER1x/j2UfA6FG5P6Mk152anQ3mXLAJCsuPbPwAbuUDTdmvMwWec1ty4OzWKm+HYa
         CF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EFxHo0ksLSi4taalOBp0Wb/t79hCJFf7A0I8R/26LIc=;
        b=AGwc7TdO3oRxiBwdHAbqnTB1YC9j/S8E5CvnxuDMB4I/QCoWu8It0YIUiB54ul0qVI
         kqhsJcv+OuMg6O1UnP3vEAgSn0KbRovHsr5g9k/kKPU54kPJ0dysMnl42Jwi7ko31HDh
         +5qlU1+trWPvxPLaMWuS3e/AGXgrHi4tbMVT7eHJgJG1o3ZmqY4yjKBCx/ayU/aep9/I
         6QkPinCc8X83w92YrXtqUHFjGeDb+vFfftDt29ywYpLV9sIXJ9rmWZ4mKoAqhcgi5ztG
         0CC2N8Z4mAsQDBdIpYQdhNy0D8VOaTmmuvW/SXnFs1w7DzasEoSzAy7Xl2SERL5Ltrjo
         fZBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e8kE5bbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si4287946ejo.194.2021.07.06.07.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 07:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e8kE5bbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0m3j-0006Cl-1I
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 10:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0m3X-0006Af-KQ
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 10:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m0m3U-0008Ff-4Z
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 10:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625581684;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFxHo0ksLSi4taalOBp0Wb/t79hCJFf7A0I8R/26LIc=;
 b=e8kE5bbvDHalPt+hi84h1Av0TUikRssxN5HtnDTRyPL2VN/DcdJbNadSAGnDSRiZ1h5tOF
 gNfCXWuxt2/Gzs26NQt+uQE1EkPyMUjT4YcMm45Q9XsRplejavQav2cJKhLqiUaiuY+sDQ
 IafwddRh/1iWr2RnptBwc2OHUL2Z1fA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-ZGMU9KTGOyuIOTCF4FdcqQ-1; Tue, 06 Jul 2021 10:28:03 -0400
X-MC-Unique: ZGMU9KTGOyuIOTCF4FdcqQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l21-20020a0560000235b029013564642c78so1607468wrz.9
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 07:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=EFxHo0ksLSi4taalOBp0Wb/t79hCJFf7A0I8R/26LIc=;
 b=BLi1Q75Vr026/Tc6Y/rr+v4hs7C1tX9WzC8ad3eIltFYY7b9R9KBbYvOdgewYz/lvK
 BWa9kJ9IeS/7xaOjynNjniuEgN14+Ly0Fq2izUiSQs9GjndWoaD3x7jZL5z02slm07nF
 ZrZfI3AmTw4VpIy8yW2fct/YVtqiqqhHl6Q+EdT+HN+REsppk8mI8GOboLsp9WAX3wZF
 rquHdJJHaOefX85+7kYpjkPkv/5pSzzbg9quHhgdti1Ze7UMh47q5/YPEFV17Q1w5OQ/
 SpdpKj6kacwbR2m3I676bLVrpZgSo1YWknoDr0iQ7Vu/bmEM7WcD921o4bfFm7+PbvPN
 9v4g==
X-Gm-Message-State: AOAM533+NLHEkTu6HuhI5pqYMxTFH1OXHqUpS0KjJTi84qhtZD8JU3l9
 tQY0gU4/sM5Mcvgap3AVhubt6ghMK+fxz3bTNEILfZ1Bhip2b+7qY7t4X8wR8ZqmMfEpqiKdS80
 MrJbvZTE5WJd8
X-Received: by 2002:a05:600c:3b0b:: with SMTP id
 m11mr1100428wms.25.1625581679771; 
 Tue, 06 Jul 2021 07:27:59 -0700 (PDT)
X-Received: by 2002:a05:600c:3b0b:: with SMTP id
 m11mr1100409wms.25.1625581679596; 
 Tue, 06 Jul 2021 07:27:59 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id s3sm17863761wro.30.2021.07.06.07.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 07:27:59 -0700 (PDT)
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
 <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
 <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
 <5ccf2a18-0615-8f1c-47cb-163f80037feb@huawei.com>
 <eb63f96e-59e8-55cb-d8ba-119f75ce032f@redhat.com> <YORmWw4MUBV+VTen@work-vm>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <fc630856-cc51-4830-9f85-4cf89e632819@redhat.com>
Date: Tue, 6 Jul 2021 16:27:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YORmWw4MUBV+VTen@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, lushenming@huawei.com,
 "open list:ARM cores" <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7sLAphTWmTgK

Hi Dave,

On 7/6/21 4:19 PM, Dr. David Alan Gilbert wrote:
> * Eric Auger (eric.auger@redhat.com) wrote:
>> Hi,
>>
>> On 7/6/21 10:18 AM, Kunkun Jiang wrote:
>>> Hi Eric,
>>>
>>> On 2021/6/30 17:16, Eric Auger wrote:
>>>> On 6/30/21 3:38 AM, Kunkun Jiang wrote:
>>>>> On 2021/6/30 4:14, Eric Auger wrote:
>>>>>> Hi Kunkun,
>>>>>>
>>>>>> On 6/29/21 11:33 AM, Kunkun Jiang wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
>>>>>>> our original intention is to flush the ITS tables into guest RAM at
>>>>>>> the point
>>>>>>> RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
>>>>>>> migration launch so let's simply flush the tables each time the VM
>>>>>>> gets
>>>>>>> stopped.
>>>>>>>
>>>>>>> But I encountered an error when I shut down the virtual machine.
>>>>>>>
>>>>>>>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr
>>>>>>>> 0x0000000000000001: Permission denied
>>>>>>> Shall we need to flush ITS tables into guest RAM when 'shutdown' the
>>>>>>> VM?
>>>>>>> Or do you think this error is normal?
>>>>>> yes we determined in the past this was the right moment do save the
>>>>>> tables
>>>>>>
>>>>>> "with a live migration the guest is still running after
>>>>>> the RAM has been first saved, and so the tables may still change
>>>>>> during the iterative RAM save. You would actually need to do this
>>>>>> at just the point we stop the VM before the final RAM save; that
>>>>>> *might*
>>>>>> be possible by using a notifier hook a vm run state change to
>>>>>> RUN_STATE_FINISH_MIGRATE
>>>>>> - if you can do the changes just as the migration flips into that mode
>>>>>> it *should* work. " said David.
>>>>>>
>>>>>> But sometimes as the commit msg says, the VM is stopped before the
>>>>>> migration launch - I do not remember the exact scenario tbh -.
>>>>> Well, I initially wanted to know more about this scenario to determine
>>>>> whether
>>>>> a normal shutdown would fall into it.😂
>>>> I think it was for save/restore use case. In that case you need to flush
>>>> the KVM cache in memory on VM shutdown.
>>> Sorry for late reply.
>>>
>>> Can we distinguish from the 'RunState'?
>>> When we stop the VM, the RunState will be set. There are many types of
>>> RunState, such as RUN_STATE_FINISH_MIGRATE/RUN_STATE_SAVE_VM/
>>> RUN_STATE_SHUTDOWN/RUN_STATE_GUEST_PANICKED, etc.
>>>
>>> Maybe RUN_STATE_SHUTDOWN doesn't belong to save/restore use case,
>>> right?
>> Adding Dave, Juan and Peter in the loop for migration expertise.
>>
>> At the moment we save the ARM ITS MSI controller tables whenever the VM
>> gets stopped. Saving the tables from KVM caches into the guest RAM is
>> needed for migration and save/restore use cases.
>> However with GICv4 this fails at KVM level because some MSIs are
>> forwarded and saving their state is not supported with GICv4.
>>
>> While GICv4 migration is not supported we would like the VM to work
>> properly, ie. being stoppable without taking care of table saving.
>>
>> So could we be more precise and identifiy the save/restore and migration
>> use cases instead of saving the tables on each VM shutdown.
> During the precopy migration (not sure about others), we do:
>
> static void migration_completion(MigrationState *s)
> {
> ....
>             ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
> ...
>                 ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>                                                          inactivate);
>
> so I think we do have that state there to hook off.

That's consistent with what you suggested in the past ans what is logged
in the commit message of

cddafd8f353d2d251b1a5c6c948a577a85838582 ("hw/intc/arm_gicv3_its: Implement state save/restore").

However does the save/restore enters that state. If I remember correctly that's why I decided to do the save on each VM stop instead.



>
>> The tables are saved into guest RAM so when need the CPUs and devices to
>> be stopped but we need the guest RAM to be saved after the ITS save
>> operation.
> Yeh so what should happen is that you:
>    a) Iterate RAM a lot
>    b) You stop everything
>      -> Flushes remaining changes into RAM
>    c) Transmit device state and last bits of RAM changes.
>
> so that flush should happen at (b).
That's correct.

Thanks

Eric
>
> Dave
>
>> Kunkun, by the way you currently just get an error from qemu, ie. qemu
>> does not exit? Couldn't we just ignore -EACCESS error?
>>
>> Thanks
>>
>> Eric
>>
>>
>>
>>
>>>>> In my opinion, when the virtual machine is normally shutdown, flushing
>>>>> the
>>>>> ITS tables is not necessary. If we can't tell the difference between
>>>>> 'normal shutdown'
>>>>> and the above scenario, then this 'error' is inevitable.
>>>>>> So each time the VM is stopped we flush the caches into guest RAM.
>>>>>>
>>>>>>
>>>>>>
>>>>>>> This error occurs in the following scenario:
>>>>>>> Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC
>>>>>>> to
>>>>>>> the VM.
>>>>>>>
>>>>>>> The flow is as follows:
>>>>>>>
>>>>>>> QEMU:
>>>>>>> vm_shutdown
>>>>>>>       do_vm_stop(RUN_STATE_SHUTDOWN)
>>>>>>>           vm_state_notify
>>>>>>>               ...
>>>>>>>               vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
>>>>>>>                   kvm_device_access
>>>>>>>
>>>>>>> Kernel:
>>>>>>>       vgic_its_save_tables_v0
>>>>>>>           vgic_its_save_device_tables
>>>>>>>               vgic_its_save_itt
>>>>>>>
>>>>>>> There is such a code in vgic_its_save_itt():
>>>>>>>> /*
>>>>>>>>    * If an LPI carries the HW bit, this means that this
>>>>>>>>    * interrupt is controlled by GICv4, and we do not
>>>>>>>>    * have direct access to that state without GICv4.1.
>>>>>>>>    * Let's simply fail the save operation...
>>>>>>>>    */
>>>>>>>> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>>>>>>>>             return -EACCES;
>>>> Maybe we miss a piece of code for 4.0 that unsets the forwarding. The
>>>> only way to handle this is to make sure  ite->irq->hw is not set on
>>>> shutdown, no?
>>> It's not going to return -EACCES here, if we unset the forwarding
>>> first. But
>>> this may cause problems in save/restore scenarios. The GICv4 architecture
>>> doesn't give any guarantee that the pending state is written into the
>>> pending table.
>>>
>>> Thanks,
>>> Kunkun Jiang
>>>> Thanks
>>>>
>>>> Eric
>>>>>> As far as I understand you need a v4.1 to migrate,
>>>>>> following Shenming's series
>>>>>> [PATCH v5 0/6] KVM: arm64: Add VLPI migration support on GICv4.1
>>>>>> Maybe sync with him?
>>>>> Yes, GICv4 does not support live migrate.
>>>>>
>>>>> Thanks,
>>>>> Kunkun Jiang
>>>>>> Thanks
>>>>>>
>>>>>> Eric
>>>>>>
>>>>>>
>>>>>>> Looking forward to your reply.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Kunkun Jiang
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>> .
>>>> .
>>>

