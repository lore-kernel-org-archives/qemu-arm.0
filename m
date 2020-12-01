Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5933993lfb;
        Mon, 30 Nov 2020 22:39:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaOuCMUbEBO6YGAJbLGXA7Nz8j+ciCiCWHX0U3Eh7ax8UyY0ygsz7OEdPCE7mhAdnRZY9y
X-Received: by 2002:a25:1143:: with SMTP id 64mr1610138ybr.391.1606804759455;
        Mon, 30 Nov 2020 22:39:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606804759; cv=none;
        d=google.com; s=arc-20160816;
        b=O6mWhhOhUWojz2FfwNU4kFteB9PtL/FgjEYiddVY4Ml9miez393XsyjNV4N37xh97I
         YNPLTkRacOhAl1pEcrvglI8P0MpjfalG3xiT0hFokbO9RJJzizXm8bt2ftP7mae/jvsZ
         FkmKjVR9V3L2t2zaW5yZTeIo14RHCuD7ISIODO9ljgdR7erUr2zQtEyMaAx2Z3cT4Z46
         2HvKr/rHDGb/r+9JysCAmeEPYn2tOMX8O3BjW3RyRiotY3Mw9rkWJNIk/YpgIq4Mspmo
         u7AOD+hI2qOR9ePXnSgQW+rdrBgMIElYS1sZDkqHwMKpW0qoMlR9Ar0MaBnr6Eqddijn
         HWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ag1xbblScYe6qtzcyAki99qo1WEFiIvmLBGDgYCCEw8=;
        b=qwYKk1kknOkYksi1dagekuwkdbJPoOhzVegDdgNyB6jlSwMSF1pN+dd3qJso/ILhto
         7ghvW7T+QbKqP8Bgd9GmX5VfzGdxZEkTAWl85XYrYwWPmKRPhjS3uWFkVi2pDugC6I30
         Ck5rMMY8uz443J6X6Jhey3sRazqiRiCEWAUd7JgK/uDUPidEvGwLXpLccfw2JbmmXoTX
         39WtkkBixCRPhkg+4szq+BKwDDmfw2aDnwtXyTpeCT/4TDZoYzsVVvhEOkDttzQtTuW5
         VwyIgdl0pUlEl1vmzhRoEnQeIjIUyLxPC1Z2n2K6zK39LLa1oAiuX5aSzee1DZqa0Pmj
         9T+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192si938563ybn.452.2020.11.30.22.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 22:39:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjzJm-0005pH-Qh
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 01:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kjzJ2-0005nL-PN; Tue, 01 Dec 2020 01:38:38 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kjzIr-0005j3-J2; Tue, 01 Dec 2020 01:38:27 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ClXTX5t1kz15VHT;
 Tue,  1 Dec 2020 14:37:36 +0800 (CST)
Received: from [10.174.184.209] (10.174.184.209) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 14:37:53 +0800
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
To: Alex Williamson <alex.williamson@redhat.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
 <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
 <20201123193336.GA32690@nvidia.com> <20201123144622.75a18812@w520.home>
 <ed6c0920-8a26-fafe-01a6-3021c5a92adb@huawei.com>
 <20201130100337.4afe8eb4@w520.home>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <44d9da84-a5ae-9637-d497-e92c446d04e3@huawei.com>
Date: Tue, 1 Dec 2020 14:37:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201130100337.4afe8eb4@w520.home>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.209]
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
Cc: Neo Jia <cjia@nvidia.com>, Marc
 Zyngier <maz@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cz5L4F4kjmSk

On 2020/12/1 1:03, Alex Williamson wrote:
> On Thu, 26 Nov 2020 14:56:17 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
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
> How does "ask the vendor driver" actually work?

Maybe via a ioctl?
Oh, it seems that we have to ask the dst vendor driver (in vfio_load_setup)
and send the config data (before) along with the device migration data
every time?...

> 
>> 		|
>> 	In vfio_save_iterate() (pre-copy):
>> 	If *needed*, save the config space which would be setup on the dst
>> 	before the migration data, but send with a subflag to instruct not
>> 	to (such as) enable interrupts.
> 
> If not for triggering things like MSI/X configuration, isn't config
> space almost entirely virtual?  What visibility does the vendor driver
> have to the VM machine dependencies regarding device interrupt versus
> interrupt controller migration?

My thought is that the vendor driver only decides the order of the config
space setup and the receiving of the migration data, but leaves the VM
machine dependencies to QEMU.

> 
>> 		|
>> 	In vfio_save_complete_precopy() (stop-and-copy, iterable process):
>> 	The same as that in vfio_save_iterate().
>> 		|
>> 	In .save_state (stop-and-copy, non-iterable process):
>> 	If *needed*, only send a subflag to instruct to enable interrupts.
>> 	If *not needed*, save the config space and setup everything on the dst.
> 
> Again, how does the vendor driver have visibility to know when the VM
> machine can enable interrupts?

It seems troubling if the vendor driver needs the interrupts to be enabled
first...

> 
>>
>> Besides the above idea, we might be able to choose to let the vendor driver do
>> more: qemu just sends and writes the config data (before) along with the device
>> migration data every time, and it's up to the vendor driver to filter out/buffer
>> the received data or reorder the settings...
> 
> There is no vendor driver in QEMU though, so are you suggesting that
> QEMU follows a standard protocol and the vendor driver chooses when to
> enable specific features?  For instance, QEMU would call SET_IRQS and
> the driver would return success, but defer that setup if necessary?
> That seems quite troubling as we then have ioctls that behave
> differently depending on the device state and we have no error path to
> userspace should that setup fail later.  The vendor driver does have
> its own data stream for migration, so the vendor driver could tell the
> destination version of itself what type of interrupt to use, which
> might be sufficient if we were to ignore the latency if QEMU were to
> defer interrupt setup until stop-and-copy.

Did you mean that we could only enable MSI-X during the iterable phase, but
leave the setup of these unmasked vectors to the non-iterable phase?
It looks good to me.

> 
> Is the question of when to setup device interrupts versus the interrupt
> controller state largely a machine issue within QEMU?  If so, shouldn't
> it be at QEMU's determination when to act on the config space
> information on the target?

I think it would be simpler if ensuring the proper calling order in QEMU...

> IOW, if a vendor driver has a dependency on
> interrupt configuration, they need to include it in their own pre-copy
> data stream and decouple that dependency from userspace interrupt
> configuration via the SET_IRQS ioctl.  Is that possible?  Thanks,
> 

I don't understand what the decoupling that dependency from userspace
interrupt configuration means...

Thanks,
Shenming

> Alex
> 
> .
> 
