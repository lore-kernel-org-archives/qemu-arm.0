Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4401560lfb;
        Tue, 24 Nov 2020 03:02:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyWU/6gS6BxUPQCrOoJsVvjVTsoghy8MIZ6/5GsZthdPvdmvAIq1vnueP2MSAZjA0pQMnZ
X-Received: by 2002:a25:9009:: with SMTP id s9mr5299126ybl.364.1606215723722;
        Tue, 24 Nov 2020 03:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606215723; cv=none;
        d=google.com; s=arc-20160816;
        b=ULuXO8dJEpNNA0AezMMStOSOO0wkRMtPYQLMOhF5FkEIFV8S5KiPwft/526k3qulzJ
         klZapvAX4vRKhjvh0auMt+rOzsvRWYIO9eAxk0bRZXpwrw7ppP+XhTQR73NEHpPLdyKE
         D+/++D/PgjKEO1kIWC6VjPd5GXwOIfOF7RIgjBwCyMdHShbMsugoTn1sV8fY5nQ+ALG/
         uhqFqusTzukkdcttapkGnwJs3MG1coBwzU9OzO83/VbMBaMUN+b1k78NapHSlZdypDPP
         I5oRADVtnVDnsv0TzXsA42KZmPOWl+5rDpyasyh6jvww/wi4FxVLp73MM2JKVSMXV2Vf
         wATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=rT2G7/5a3S1B3YaI1zrJXTwU7d7q4yY8s3tsVgYzBeY=;
        b=eXAIlTwuWhqC+EfZMZ0HyjBSxcGyihlABCFQe6ViRZdfDFK7SiS47ma0xxXfsamxDw
         RqKP8grLUjFNwa1gybUyCo6ok3yejgVB1cxmv+a8xDK4pTvXeHQ4YLfprjdxhNmabRh1
         9m2v87mki+aF4iPYmH22fJbNqeHQ0P2/RDEgZvLwnyYB1x33pCTxdKK8frSmkP+5onzT
         9eEWXd4+UyIDClvXelLts65bxkDoboioUVQxjJd334mOhRqz8Z882qi2OrFYQXaEhhL/
         gJlcJ/you0pVDvRswhFwNiSyi7DapmcCkYjQYZbAYLHPgsQwfKgUdj1zsttinWTHXlQv
         rpbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s138si15895072ybc.348.2020.11.24.03.02.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 03:02:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khW5D-0003JA-35
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 06:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1khW50-0003J1-Ol; Tue, 24 Nov 2020 06:01:50 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1khW4x-0006xj-3x; Tue, 24 Nov 2020 06:01:50 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CgLfy4MRlz15QsH;
 Tue, 24 Nov 2020 19:01:14 +0800 (CST)
Received: from [10.174.187.74] (10.174.187.74) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 24 Nov 2020 19:01:24 +0800
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
To: Neo Jia <cjia@nvidia.com>, Alex Williamson <alex.williamson@redhat.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
 <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
 <20201123193336.GA32690@nvidia.com>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <52dbcbc0-6f3f-d618-675c-05e0accb3bac@huawei.com>
Date: Tue, 24 Nov 2020 19:01:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201123193336.GA32690@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.74]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
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
Cc: Marc Zyngier <maz@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, dgilbert@redhat.com, Eric Auger <eric.auger@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hy0eXbhXA+DY

On 2020/11/24 3:33, Neo Jia wrote:
> On Mon, Nov 23, 2020 at 11:14:38AM +0800, Shenming Lu wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 2020/11/21 6:01, Alex Williamson wrote:
>>> On Fri, 20 Nov 2020 22:05:49 +0800
>>> Shenming Lu <lushenming@huawei.com> wrote:
>>>
>>>> On 2020/11/20 1:41, Alex Williamson wrote:
>>>>> On Thu, 19 Nov 2020 14:13:24 +0530
>>>>> Kirti Wankhede <kwankhede@nvidia.com> wrote:
>>>>>
>>>>>> On 11/14/2020 2:47 PM, Shenming Lu wrote:
>>>>>>> When running VFIO migration, I found that the restoring of VFIO PCI device’s
>>>>>>> config space is before VGIC on ARM64 target. But generally, interrupt controllers
>>>>>>> need to be restored before PCI devices.
>>>>>>
>>>>>> Is there any other way by which VGIC can be restored before PCI device?
>>>>
>>>> As far as I know, it seems to have to depend on priorities in the non-iterable process.
>>>>
>>>>>>
>>>>>>> Besides, if a VFIO PCI device is
>>>>>>> configured to have directly-injected MSIs (VLPIs), the restoring of its config
>>>>>>> space will trigger the configuring of these VLPIs (in kernel), where it would
>>>>>>> return an error as I saw due to the dependency on kvm’s vgic.
>>>>>>>
>>>>>>
>>>>>> Can this be fixed in kernel to re-initialize the kernel state?
>>>>
>>>> Did you mean to reconfigure these VLPIs when restoring kvm's vgic?
>>>> But the fact is that this error is not caused by kernel, it is due to the incorrect
>>>> calling order of qemu...
>>>>
>>>>>>
>>>>>>> To avoid this, we can move the saving of the config space from the iterable
>>>>>>> process to the non-iterable process, so that it will be called after VGIC
>>>>>>> according to their priorities.
>>>>>>>
>>>>>>
>>>>>> With this change, at resume side, pre-copy phase data would reach
>>>>>> destination without restored config space. VFIO device on destination
>>>>>> might need it's config space setup and validated before it can accept
>>>>>> further VFIO device specific migration state.
>>>>>>
>>>>>> This also changes bit-stream, so it would break migration with original
>>>>>> migration patch-set.
>>>>>
>>>>> Config space can continue to change while in pre-copy, if we're only
>>>>> sending config space at the initiation of pre-copy, how are any changes
>>>>> that might occur before the VM is stopped conveyed to the target?  For
>>>>> example the guest might reboot and a device returned to INTx mode from
>>>>> MSI during pre-copy.  Thanks,
>>>>
>>>> What I see is that the config space is only saved once in save_live_complete_precopy
>>>> currently...
>>>> As you said, a VFIO device might need it's config space setup first, and
>>>> the config space can continue to change while in pre-copy, Did you mean we
>>>> have to migrate the config space in save_live_iterate?
>>>> However, I still have a little doubt about the restoring dependence between
>>>> the qemu emulated config space and the device data...
>>>>
>>>> Besides, if we surely can't move the saving of the config space back, can we
>>>> just move some actions which are triggered by the restoring of the config space
>>>> back (such as vfio_msix_enable())?
>>>
>>> It seems that the significant benefit to enabling interrupts during
>>> pre-copy would be to reduce the latency and failure potential during
>>> the final phase of migration.  Do we have any data for how much it adds
>>> to the device contributed downtime to configure interrupts only at the
>>> final stage?  My guess is that it's a measurable delay on its own.  At
>>> the same time, we can't ignore the differences in machine specific
>>> dependencies and if we don't even sync the config space once the VM is
>>> stopped... this all seems not ready to call supported, especially if we
>>> have concerns already about migration bit-stream compatibility.
>>>
>>
>> I have another question for this, if we restore the config space while in pre-copy
>> (include enabling interrupts), does it affect the _RESUMING state (paused) of the
>> device on the dst host (cause it to send interrupts? which should not be allowed
>> in this stage). Does the restore sequence need to be further discussed and reach
>> a consensus(spec) (taking into account other devices and the corresponding actions
>> of the vendor driver)?
>>
>>> Given our timing relative to QEMU 5.2, the only path I feel comfortable
>>> with is to move forward with downgrading vfio migration support to be
>>> enabled via an experimental option.  Objections?  Thanks,
>>
>> Alright, but this issue is related to our ARM GICv4.1 migration scheme, could you
>> give a rough idea about this (where to enable interrupts, we hope it to be after
>> the restoring of VGIC)?
> 
> I disagree. If this is only specific to Huawei ARM GIC implementation, why do we want to
> make the entire VFIO based migration an experimental feature?

It is not specific to Huawei ARM GIC implementation, the error was encountered in general
ARM GIC implementation...

Thanks,
Shenming
