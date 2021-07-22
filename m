Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6673708lfc;
        Thu, 22 Jul 2021 06:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy1/44Y5rxs90xFi4OCvnKVDhlp6BGrSxW+1khu1qms9Wqfkf1vDauP1FvWRKRQQ24+r4v
X-Received: by 2002:a92:cc85:: with SMTP id x5mr26438063ilo.266.1626960092573;
        Thu, 22 Jul 2021 06:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626960092; cv=none;
        d=google.com; s=arc-20160816;
        b=I5dQWrROnxmSjjv2EB6qNF04KJGNf4M08WKwdozrXXysQbgJO6JfjGamqe6ThYE/Yj
         9bDwqDoLDFZ5EAaHDsrFVcM/Znocywkz8v1NbSOij+qZaN7g7wTku/1aFixnByi/tvsQ
         V+ZWxTl6gVDvl2UncGsaLV3GPLHEqh+LFt/d5roKFFBz2Cs5MYnnkMpC8bnhBIttvy8q
         8XkxR9Gsd4ad4r21K/8D4Jy8dBUvtnrDFIkafFQ9m/2BScWMCOmHlzEjsiVbCvO1pVR3
         lomYtQD0nmDLcCS7OJz7Zf+aNSQzNm5mzYb2AJvFd2/ui5nSsJ2KXCWNkUl5H5WvPS5p
         bU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=sjd9+lQfGjU9m3/YP9/pSPVCLqkKM9++D5VRN6UVdI4=;
        b=Iz0q8k4OiP9MPGhWzq0w+4OYaueweU6IMTAMVORDU+L2BIlwXGv8JwD1cHGvO3WEdu
         1mm6EGPKnQL8cL0xZ41csGupJevEGzFpe55wUeW90WHtzv4Kuf0AxTfokDUx3/bbtrKt
         kdAa+gFdNP8LA8R0xsy+9S5rYceLzgGFIouRAJS6L9VPne5Xi2szC29RH7/IyRbSlhuQ
         uFhzh7r47SVJRBVBx4numn8oKKLd4p9m6KzTdQh8xQKk5JEq2U8KW7cp+efAH1s+LMwm
         4XYSpiY8wKpTPOzelvx6oI9YTFiSzXqeHqkMKOpg6F4GwSryfSc7RWG/aWeEu1P9TEdc
         aOjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PYgoc/68";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si31689829ilu.146.2021.07.22.06.21.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 06:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PYgoc/68";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6Ydn-000135-Pm
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 09:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1m6YbX-0007bS-LU
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1m6YbV-0000qT-73
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626959948;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjd9+lQfGjU9m3/YP9/pSPVCLqkKM9++D5VRN6UVdI4=;
 b=PYgoc/68UYTZGXr2QQS+HBP8RpPa6bcdpRkXdDd5LXParQdViFJ187JMYFVsgsST2A20xY
 VK0aRUDTE9xSOCk3JKvUh3ZjlTI2Q7yDbUOqvwnHfsuw7iq6hkkzPuC1WFqFZcfpT++EaV
 pC3/vqX+G3bhl6F2L4ETwKy+En9bA9Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-6D86BBigMpSddb_i3pXNnQ-1; Thu, 22 Jul 2021 09:19:07 -0400
X-MC-Unique: 6D86BBigMpSddb_i3pXNnQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c14-20020a05600c0aceb0290248831d46e4so1460735wmr.6
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 06:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=In6QzfkbBx62Kj7DMA4X7BsYB4WfLx8O55NodTEHDSc=;
 b=EnCSAhFnK0E8fQuUsbrA3HTprwm8caSEU7UOFDXAoFYH/GOADBRFD6h64ID8ALgkGZ
 hhbfT8d+pGg47Xf4NaNYFYI4BIXVQCxC6ROEdgamidPWx2JY1ds4HNLsbQirr695eyD4
 FHZparpOx77S0T4x5xHgH57yl+f6CRQF/a/XYMTND2MFSgqWCc3m8u5xEyCD2vvDgMoZ
 Jd21cYrE+f4cdmU8FEpzrVolQk5HzIOZ1ZstC3X8CAWUxnNNdSG+mvwLhUkih7Le/sKG
 8UhWTJpYV8yEbJJhvWF8nCDGPt6y5WlNR5eOchI2XARpot4eJR85WaiujrrweKoMHu4o
 U9Ew==
X-Gm-Message-State: AOAM533z7bAQ/K0IhqE9xU3gc8ZAaFhCbrquF6F5kAswIvYBbwtZcaku
 752WHQdk7f9QDULVpg4QwqJEmW7DTPkh/ZDPYIDmyWSQt+VHF57DMQa1X0Yq7NWBzHqc2z7oVp7
 vcH27ZogY06MnZoc=
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr42926522wmk.51.1626959945642; 
 Thu, 22 Jul 2021 06:19:05 -0700 (PDT)
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr42926507wmk.51.1626959945432; 
 Thu, 22 Jul 2021 06:19:05 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id p7sm24957814wmq.5.2021.07.22.06.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 06:19:04 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [question] Shall we flush ITS tables into guest RAM when
 shutdown the VM?
In-Reply-To: <fc630856-cc51-4830-9f85-4cf89e632819@redhat.com> (Eric Auger's
 message of "Tue, 6 Jul 2021 16:27:57 +0200")
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
 <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
 <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
 <5ccf2a18-0615-8f1c-47cb-163f80037feb@huawei.com>
 <eb63f96e-59e8-55cb-d8ba-119f75ce032f@redhat.com>
 <YORmWw4MUBV+VTen@work-vm>
 <fc630856-cc51-4830-9f85-4cf89e632819@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 22 Jul 2021 15:19:03 +0200
Message-ID: <87fsw6ebaw.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kunkun Jiang <jiangkunkun@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 "open list:All patches CC
 here" <qemu-devel@nongnu.org>, lushenming@huawei.com,
 "open list:ARM cores" <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lZX0qJo5kBLo

Eric Auger <eric.auger@redhat.com> wrote:
> Hi Dave,
>
> On 7/6/21 4:19 PM, Dr. David Alan Gilbert wrote:
>> * Eric Auger (eric.auger@redhat.com) wrote:

...

>>>>>> Well, I initially wanted to know more about this scenario to determi=
ne
>>>>>> whether
>>>>>> a normal shutdown would fall into it.=F0=9F=98=82
>>>>> I think it was for save/restore use case. In that case you need to fl=
ush
>>>>> the KVM cache in memory on VM shutdown.
>>>> Sorry for late reply.
>>>>
>>>> Can we distinguish from the 'RunState'?
>>>> When we stop the VM, the RunState will be set. There are many types of
>>>> RunState, such as RUN_STATE_FINISH_MIGRATE/RUN_STATE_SAVE_VM/
>>>> RUN_STATE_SHUTDOWN/RUN_STATE_GUEST_PANICKED, etc.
>>>>
>>>> Maybe RUN_STATE_SHUTDOWN doesn't belong to save/restore use case,
>>>> right?
>>> Adding Dave, Juan and Peter in the loop for migration expertise.
>>>
>>> At the moment we save the ARM ITS MSI controller tables whenever the VM
>>> gets stopped. Saving the tables from KVM caches into the guest RAM is
>>> needed for migration and save/restore use cases.
>>> However with GICv4 this fails at KVM level because some MSIs are
>>> forwarded and saving their state is not supported with GICv4.
>>>
>>> While GICv4 migration is not supported we would like the VM to work
>>> properly, ie. being stoppable without taking care of table saving.
>>>
>>> So could we be more precise and identifiy the save/restore and migratio=
n
>>> use cases instead of saving the tables on each VM shutdown.
>> During the precopy migration (not sure about others), we do:
>>
>> static void migration_completion(MigrationState *s)
>> {
>> ....
>>             ret =3D vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
>> ...
>>                 ret =3D qemu_savevm_state_complete_precopy(s->to_dst_fil=
e, false,
>>                                                          inactivate);
>>
>> so I think we do have that state there to hook off.
>
> That's consistent with what you suggested in the past ans what is logged
> in the commit message of
>
> cddafd8f353d2d251b1a5c6c948a577a85838582 ("hw/intc/arm_gicv3_its:
> Implement state save/restore").

Hi

Ouch, it is really a mess.  Why do we need to save it to RAM instead of
saving it to anywhere else?

I guess that the answer is that we don't want to know what the state is,
so we are mgrating a opaque blob.

> However does the save/restore enters that state. If I remember
> correctly that's why I decided to do the save on each VM stop instead.

>>> The tables are saved into guest RAM so when need the CPUs and devices t=
o
>>> be stopped but we need the guest RAM to be saved after the ITS save
>>> operation.

Saving this data into RAM dirties the bitmaps, right?


>> Yeh so what should happen is that you:
>>    a) Iterate RAM a lot
>>    b) You stop everything
>>      -> Flushes remaining changes into RAM
>>    c) Transmit device state and last bits of RAM changes.
>>
>> so that flush should happen at (b).
> That's correct.

/* does a state transition even if the VM is already stopped,
   current state is forgotten forever */
int vm_stop_force_state(RunState state)
{
    if (runstate_is_running()) {
        return vm_stop(state);
    } else {
        int ret;
        runstate_set(state);

        bdrv_drain_all();
        /* Make sure to return an error if the flush in a previous vm_stop(=
)
         * failed. */
        ret =3D bdrv_flush_all();
        trace_vm_stop_flush_all(ret);
        return ret;
    }
}

You really want to hook here, like the block layer.
But as far as I can see, there is no generic way to put a hook there.

And the path is different if the machine is running or not.

Thinking about how to put a hook there.
Welcome if you have a good name for the hook.

Later, Juan.

