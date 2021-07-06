Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2211070lfk;
        Tue, 6 Jul 2021 07:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW3D01KV8VqhSt+0X4HDH5VfA8e/sL34Am+DBXHh3u1J4OVlo/WDFZIdNnDDL1WdgSSk30
X-Received: by 2002:a17:906:b296:: with SMTP id q22mr12464210ejz.313.1625581213787;
        Tue, 06 Jul 2021 07:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625581213; cv=none;
        d=google.com; s=arc-20160816;
        b=r+rpWtbjmVqV6ftfQd7ItJ0vn9g8oqNiJnmoyAZ6zd6XczROEowJ6L1nBL0B+yJ98f
         IlLGS+nIU/LBHri2UrB0d23aS+hBZD2D3JntRwh6vqnM5ot/zcslH4zYSfRpRxS/XksU
         5fykIigOfnlcR6ELVWNlfFUt6PBjDILGDp0PabhDjPWY12HGtLFIVNUGUPsGE3Uje9Q0
         7+fx+o3tzG5vnanmXUBZkO4OhvwxDTAThqg/m++XZtQEw/L/VVT8RkrHYduxN4oOIBF+
         Nn6Rls4UAjcbwt29Kyu/Zjej2fV+OTJBcQhh/nW0KQUF98jzvSHgZM3U2Vugj+NE6H7S
         2/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=EDsw6Af59VWDm4bxSb+bRzg7KECRSO6X8jEUclcFvd8=;
        b=hUDjUh1Gyayg8lFwvpllcOu1+wCnPQ6tEyON6CceFXjkvgteURNhKtFOulUyb6N3CX
         JuVg14Q/GdfufGy115bJz+RVxoiSgun5qR9iWnifhh1WmBZamxFsFw3hX1t7FLelw0aF
         ElFE478FgOiNqnLI/v8lEqoZoR6fNW/ABw+HXF5vuRLVT/7BgfpSBW1Uwpnni7TVYutD
         zi/F8ZSpyC+gOlEb855MR+8Wky8wqpwmk/n+zJRE/iGFj9AsuUVOAEnX5WUDO8rn7+EM
         cLxQtWAkFX3c0+vS6FDCvHh1ybRKgSPmM4vu4fwlJ+ufoWiqDcr0mhWFATbAH7TD7pJJ
         wHdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ExWAdS7o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nb31si6040735ejc.614.2021.07.06.07.20.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 07:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ExWAdS7o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0lvo-00070n-Dz
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 10:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0lux-0005FV-V1
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 10:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0luu-0004PE-0G
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 10:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625581154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDsw6Af59VWDm4bxSb+bRzg7KECRSO6X8jEUclcFvd8=;
 b=ExWAdS7o412kOeUR1gxpB6ho3C0k8vhzSWF/ByktKVjbUZfDfSJzwWNlGKWhCG+ReYSkge
 Anz4OFf88gKtZFrNNwprV801JTOWUgtxtHVrQ9zBTEK2ZBFw26nHDshtBk575z1H5+f5qj
 FqDVaJlNG7MhuRJJ4nromEC5szZ0kvY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-c6nOsyOZPamHomKAu9rz5Q-1; Tue, 06 Jul 2021 10:19:13 -0400
X-MC-Unique: c6nOsyOZPamHomKAu9rz5Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 e13-20020a5d530d0000b0290126d989c76eso7217919wrv.18
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 07:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EDsw6Af59VWDm4bxSb+bRzg7KECRSO6X8jEUclcFvd8=;
 b=Np92uKj9COWLEE7x9SCcQmpvoZ52ErhtQKSNc7gUP3o0qMScl9ArJjvL3aJVAxvtx4
 xCBEI1vApPkM1ilnOt+Gp2zmPIngbtzfQFnZbPaHo5qU6kTy4t1N4SVBZZP/PEimWogQ
 5Pzo9UmFe3N66cL9Faca6/lHV9f5qdukZFWZzjKiecMtPi32YoHp3lcjF2efExsDBTM1
 uSCiYUAVUY9wQVilaDhEEIeoh2R8i+iaZ22lTwNNY1jM9mSGbC3M8N7BfnBDw2X9MA3y
 peOc1j0ud9MhDMQSMY1cQDafp/bAFDsULFL3MSzdv7/8XZUsDv/0O0TYA8FQp3h1qjiP
 xxMQ==
X-Gm-Message-State: AOAM533vQ+XjZ2AB1OmlnjKJT46X41fgCOpLM2mkmpl/404aBOcHMIkA
 NBDdBtj1AgmzkDgCAIObKbqRjsDFrRevXFEu9LfJLSugtWxSO7dUMP8DgOmLfTGELL7BSoDxfG0
 13blwDdK0RS07
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr21008216wmc.53.1625581151134; 
 Tue, 06 Jul 2021 07:19:11 -0700 (PDT)
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr21008172wmc.53.1625581150811; 
 Tue, 06 Jul 2021 07:19:10 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id g1sm3168153wmh.30.2021.07.06.07.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:19:10 -0700 (PDT)
Date: Tue, 6 Jul 2021 15:19:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [question] Shall we flush ITS tables into guest RAM when
 shutdown the VM?
Message-ID: <YORmWw4MUBV+VTen@work-vm>
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
 <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
 <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
 <5ccf2a18-0615-8f1c-47cb-163f80037feb@huawei.com>
 <eb63f96e-59e8-55cb-d8ba-119f75ce032f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eb63f96e-59e8-55cb-d8ba-119f75ce032f@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, lushenming@huawei.com,
 "open list:ARM cores" <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HFHhUzdAiicy

* Eric Auger (eric.auger@redhat.com) wrote:
> Hi,
> 
> On 7/6/21 10:18 AM, Kunkun Jiang wrote:
> > Hi Eric,
> >
> > On 2021/6/30 17:16, Eric Auger wrote:
> >>
> >> On 6/30/21 3:38 AM, Kunkun Jiang wrote:
> >>> On 2021/6/30 4:14, Eric Auger wrote:
> >>>> Hi Kunkun,
> >>>>
> >>>> On 6/29/21 11:33 AM, Kunkun Jiang wrote:
> >>>>> Hi all,
> >>>>>
> >>>>> Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
> >>>>> our original intention is to flush the ITS tables into guest RAM at
> >>>>> the point
> >>>>> RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
> >>>>> migration launch so let's simply flush the tables each time the VM
> >>>>> gets
> >>>>> stopped.
> >>>>>
> >>>>> But I encountered an error when I shut down the virtual machine.
> >>>>>
> >>>>>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr
> >>>>>> 0x0000000000000001: Permission denied
> >>>>> Shall we need to flush ITS tables into guest RAM when 'shutdown' the
> >>>>> VM?
> >>>>> Or do you think this error is normal?
> >>>> yes we determined in the past this was the right moment do save the
> >>>> tables
> >>>>
> >>>> "with a live migration the guest is still running after
> >>>> the RAM has been first saved, and so the tables may still change
> >>>> during the iterative RAM save. You would actually need to do this
> >>>> at just the point we stop the VM before the final RAM save; that
> >>>> *might*
> >>>> be possible by using a notifier hook a vm run state change to
> >>>> RUN_STATE_FINISH_MIGRATE
> >>>> - if you can do the changes just as the migration flips into that mode
> >>>> it *should* work. " said David.
> >>>>
> >>>> But sometimes as the commit msg says, the VM is stopped before the
> >>>> migration launch - I do not remember the exact scenario tbh -.
> >>> Well, I initially wanted to know more about this scenario to determine
> >>> whether
> >>> a normal shutdown would fall into it.😂
> >> I think it was for save/restore use case. In that case you need to flush
> >> the KVM cache in memory on VM shutdown.
> > Sorry for late reply.
> >
> > Can we distinguish from the 'RunState'?
> > When we stop the VM, the RunState will be set. There are many types of
> > RunState, such as RUN_STATE_FINISH_MIGRATE/RUN_STATE_SAVE_VM/
> > RUN_STATE_SHUTDOWN/RUN_STATE_GUEST_PANICKED, etc.
> >
> > Maybe RUN_STATE_SHUTDOWN doesn't belong to save/restore use case,
> > right?
> 
> Adding Dave, Juan and Peter in the loop for migration expertise.
> 
> At the moment we save the ARM ITS MSI controller tables whenever the VM
> gets stopped. Saving the tables from KVM caches into the guest RAM is
> needed for migration and save/restore use cases.
> However with GICv4 this fails at KVM level because some MSIs are
> forwarded and saving their state is not supported with GICv4.
> 
> While GICv4 migration is not supported we would like the VM to work
> properly, ie. being stoppable without taking care of table saving.
> 
> So could we be more precise and identifiy the save/restore and migration
> use cases instead of saving the tables on each VM shutdown.

During the precopy migration (not sure about others), we do:

static void migration_completion(MigrationState *s)
{
....
            ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
...
                ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
                                                         inactivate);

so I think we do have that state there to hook off.

> The tables are saved into guest RAM so when need the CPUs and devices to
> be stopped but we need the guest RAM to be saved after the ITS save
> operation.

Yeh so what should happen is that you:
   a) Iterate RAM a lot
   b) You stop everything
     -> Flushes remaining changes into RAM
   c) Transmit device state and last bits of RAM changes.

so that flush should happen at (b).

Dave

> Kunkun, by the way you currently just get an error from qemu, ie. qemu
> does not exit? Couldn't we just ignore -EACCESS error?
> 
> Thanks
> 
> Eric
> 
> 
> 
> 
> >>> In my opinion, when the virtual machine is normally shutdown, flushing
> >>> the
> >>> ITS tables is not necessary. If we can't tell the difference between
> >>> 'normal shutdown'
> >>> and the above scenario, then this 'error' is inevitable.
> >>>> So each time the VM is stopped we flush the caches into guest RAM.
> >>>>
> >>>>
> >>>>
> >>>>> This error occurs in the following scenario:
> >>>>> Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC
> >>>>> to
> >>>>> the VM.
> >>>>>
> >>>>> The flow is as follows:
> >>>>>
> >>>>> QEMU:
> >>>>> vm_shutdown
> >>>>>       do_vm_stop(RUN_STATE_SHUTDOWN)
> >>>>>           vm_state_notify
> >>>>>               ...
> >>>>>               vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
> >>>>>                   kvm_device_access
> >>>>>
> >>>>> Kernel:
> >>>>>       vgic_its_save_tables_v0
> >>>>>           vgic_its_save_device_tables
> >>>>>               vgic_its_save_itt
> >>>>>
> >>>>> There is such a code in vgic_its_save_itt():
> >>>>>> /*
> >>>>>>    * If an LPI carries the HW bit, this means that this
> >>>>>>    * interrupt is controlled by GICv4, and we do not
> >>>>>>    * have direct access to that state without GICv4.1.
> >>>>>>    * Let's simply fail the save operation...
> >>>>>>    */
> >>>>>> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
> >>>>>>             return -EACCES;
> >> Maybe we miss a piece of code for 4.0 that unsets the forwarding. The
> >> only way to handle this is to make sure  ite->irq->hw is not set on
> >> shutdown, no?
> > It's not going to return -EACCES here, if we unset the forwarding
> > first. But
> > this may cause problems in save/restore scenarios. The GICv4 architecture
> > doesn't give any guarantee that the pending state is written into the
> > pending table.
> >
> > Thanks,
> > Kunkun Jiang
> >> Thanks
> >>
> >> Eric
> >>>> As far as I understand you need a v4.1 to migrate,
> >>>> following Shenming's series
> >>>> [PATCH v5 0/6] KVM: arm64: Add VLPI migration support on GICv4.1
> >>>> Maybe sync with him?
> >>> Yes, GICv4 does not support live migrate.
> >>>
> >>> Thanks,
> >>> Kunkun Jiang
> >>>> Thanks
> >>>>
> >>>> Eric
> >>>>
> >>>>
> >>>>> Looking forward to your reply.
> >>>>>
> >>>>> Thanks,
> >>>>> Kunkun Jiang
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>> .
> >>>
> >> .
> >
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

