Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp504890lfb;
        Fri, 4 Dec 2020 02:48:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNZTdJmVjDn7P+zmRIR+WtsmPg/di9qJTq58+u8Fgu7SstYE1sg33i7p9G20LrV6K0KvuP
X-Received: by 2002:a25:d57:: with SMTP id 84mr4992157ybn.248.1607078886676;
        Fri, 04 Dec 2020 02:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607078886; cv=none;
        d=google.com; s=arc-20160816;
        b=0n3r5+81NW8EE8v1VQCiHI/pMn3R9RjJ72PQ7xXSwNl+vrHMW0YEl+nfzOr3d7x8y2
         lyf51BDUqck11dykjKZpWKgSka+wZKcVRUDOXi85pP5xgjyLC8r3nCLaXDmeVmVHtrqx
         J1saoSCQ/dudcUkWjUVzVd7hKIrGch55oOUdjKZb+o22FmdhrEzmLGgK/xnEg6Bwx3D7
         0f4MjUmY6kqvzcSpDA31GMm+6gWe8yrZc6EBkvmRZztAgHWEkkMzftQsIVXqBM1m3Ix+
         qjaj7nYSZFcYvyS8G0ekPip2/hl3+CN/Q6asC2xzeB9SHl+ndvpB8U41GKBD4inFL8JV
         q69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=6TTqW7mkp5Li+n3dS2ZLTebTM9AUputYqwEgjNtIH04=;
        b=gumaBvh3frNHYMh6T748qdnx7XuXg5dqTK7r881yVSwBlxmHcNSMPeEwu6x8Zg9G4Z
         p3WJ4WbU7gnGksMH+6In5UnR+VOFENHjjnyoYHguzi92ejLXwWXN0AbFZGIHxnnYbLQI
         UIcjUZrUOxGlja9i6eCwTTgy1Qnvzj5a18mug5F/unRXWHTZQxBYJ+o0J0geM25T27qf
         RQfhNy81OjO6l+VOU2MljKbIKE2iWF6g9YfPi7kgd+4TUg2/LpbINX8hs+/jj2XMeRjT
         ZvrAmIUeFMI3nB1zn560LsoEK2K4vttO9rx5tsoA3Lt1sB531YgX8Gy2KrV49H011x5H
         ksmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si1378849ybe.230.2020.12.04.02.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 02:48:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kl8d9-0000Dh-2N
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 05:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kl8cl-0000Bz-3A; Fri, 04 Dec 2020 05:47:39 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kl8ci-0003e0-09; Fri, 04 Dec 2020 05:47:38 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnTsf47PCzkklb;
 Fri,  4 Dec 2020 18:46:46 +0800 (CST)
Received: from [10.174.184.205] (10.174.184.205) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Dec 2020 18:45:11 +0800
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
 <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
 <20201123193336.GA32690@nvidia.com> <20201123144622.75a18812@w520.home>
 <ed6c0920-8a26-fafe-01a6-3021c5a92adb@huawei.com>
 <20201202105502.GB3226@work-vm>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <8ecb83bd-c15c-69aa-0f65-4e3c5074a2a9@huawei.com>
Date: Fri, 4 Dec 2020 18:45:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201202105502.GB3226@work-vm>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.205]
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/jSMWaAPaKR



On 2020/12/2 18:55, Dr. David Alan Gilbert wrote:
> * Shenming Lu (lushenming@huawei.com) wrote:
>> Hi,
>>
>> After reading everyone's opinions, we have a rough idea for this issue.
>>
>> One key point is whether it is necessary to setup the config space before
>> the device can accept further migration data. I think it is decided by
>> the vendor driver, so we can simply ask the vendor driver about it in
>> .save_setup, which could avoid a lot of unnecessary copies and settings.
>> Once we have known the need, we can iterate the config space (before)
>> along with the device migration data in .save_live_iterate and
>> .save_live_complete_precopy, and if not needed, we can only migrate the
>> config space in .save_state.
>>
>> Another key point is that the interrupt enabling should be after the
>> restoring of the interrupt controller (might not only interrupts).
>> My solution is to add a subflag at the beginning of the config data
>> (right after VFIO_MIG_FLAG_DEV_CONFIG_STATE) to indicate the triggered
>> actions on the dst (such as whether to enable interrupts).
>>
>> Below is it's workflow.
>>
>> On the save path:
>> 	In vfio_save_setup():
>> 	Ask the vendor driver if it needs the config space setup before it
>> 	can accept further migration data.
> 
> You could argue that you could always send an initial copy of the config
> data at the start; and then send new versions at the end anyway.
> But is this just about interrupts?

In the current implementation, the effect of the config space is mainly about
interrupts (SET_IRQS ioctl).

> Is the dst going to interpret the
> received migration data differently depending on the config data?

I also have a little doubt about the dependency... But not sure.

> That
> would seem dangerous if the config data was to change during the
> migration.
> 
> Dave
> 
>> 		|
>> 	In vfio_save_iterate() (pre-copy):
>> 	If *needed*, save the config space which would be setup on the dst
>> 	before the migration data, but send with a subflag to instruct not
>> 	to (such as) enable interrupts.
>> 		|
>> 	In vfio_save_complete_precopy() (stop-and-copy, iterable process):
>> 	The same as that in vfio_save_iterate().
>> 		|
>> 	In .save_state (stop-and-copy, non-iterable process):
>> 	If *needed*, only send a subflag to instruct to enable interrupts.
>> 	If *not needed*, save the config space and setup everything on the dst.
>>
>> Besides the above idea, we might be able to choose to let the vendor driver do
>> more: qemu just sends and writes the config data (before) along with the device
>> migration data every time, and it's up to the vendor driver to filter out/buffer
>> the received data or reorder the settings...
>>
>> Thanks,
>> Shenming
>>
