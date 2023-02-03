Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1438802ejb;
        Fri, 3 Feb 2023 06:26:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/A0tvdc6kVHqCJByB3iypaFH35RK4HiwM7ejY54b7w7dO+O2+zSDrX3eeOTkSGZrEF6fhX
X-Received: by 2002:a05:622a:44c:b0:3b8:26a7:d608 with SMTP id o12-20020a05622a044c00b003b826a7d608mr19995803qtx.19.1675434400221;
        Fri, 03 Feb 2023 06:26:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675434400; cv=none;
        d=google.com; s=arc-20160816;
        b=oDDu1kYPQvSFO5BI9FOUeY1HTH07d7AUueBgMCw6vz5H+hvw8tOeaCzVcPFvbYW+J4
         RIeG2PafMGfrH7SpStjLTuni50SVn0PHJPDBpWm6u0M5MHK2QFUPITbNnwVvGV0ENzP7
         9ChYTBumpek21W/dEDyjjQw9EnvSewD9yTVhSc9OtQTSmTPqfrjT83obE3c68QRksket
         KLaegZKfVLOjft+AKPiCs6Y1QNIUMluJE3kMG76k0fUp94PgvCj7+PZvz/1rAaFBVYn/
         S2eZurdLZBeSdTpwYL6DE3k7QS1/0MeluwmWzhqM4ykgcoR4bf7ogqVK1WMympAHuzlq
         5srw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=kcwyeNtWC1SqeF/ugbPYQJWzstJ6Ue2rr77izTPOCbY=;
        b=wThqKFcvASov6o3GGCtYd/ux5XGmWkw/nLLSpUmwjpqiI6WAIJ+HABkl4w7Fr0mRmf
         16wS3zBmDAbPEhd/HHxUlZpFUqPqi9DbEn2ZWa4T8Z1gYXv3QmHqA19+lsFCIKFONmTz
         f/OBg7ujW+8M32XXlR0kwtOL8RP/P/XO4EYOLItYyCs60VZcPWfDDZIgmtgvU2YnxEaX
         Vkrlz0whiKDcJWbpAVRoI9XhXk+frqi/CcA4RWaj8fErVnNknh8BfgsjYYjvD8atOMd/
         jSZCcGAjiXaGV/KvZwdEAdQvDEWAKwZyBgIzeJU27Z8WNVoXA7f6uJ89rUTyVedeMzxe
         /a5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p74-20020a37424d000000b006e3fcaa9da4si1882564qka.41.2023.02.03.06.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:26:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNx15-0004sw-4z; Fri, 03 Feb 2023 09:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1pNx13-0004sC-Vv; Fri, 03 Feb 2023 09:26:14 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1pNx10-0004g5-H6; Fri, 03 Feb 2023 09:26:13 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 422976080930;
 Fri,  3 Feb 2023 15:26:03 +0100 (CET)
Message-ID: <eaefd5ff-4591-27b4-f853-c05b3bdefdf4@csgraf.de>
Date: Fri, 3 Feb 2023 15:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] hvf: arm: Add support for GICv3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, osy <osy@turing.llc>
References: <20230128224459.70676-1-agraf@csgraf.de>
 <CAFEAcA_u2=QJiuCWfZ5ZQZ_mevqCR0iZO51ktnqzTaY7xWfUQw@mail.gmail.com>
 <CAFEAcA-TdE1YHo6hJ0xvN2qZ8NSafqqUSFQwovJcTmWm=k2NvA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA-TdE1YHo6hJ0xvN2qZ8NSafqqUSFQwovJcTmWm=k2NvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WitHfNM9c542

Hey Peter,

On 03.02.23 11:57, Peter Maydell wrote:
> On Thu, 2 Feb 2023 at 17:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Sat, 28 Jan 2023 at 22:45, Alexander Graf <agraf@csgraf.de> wrote:
>>> We currently only support GICv2 emulation. To also support GICv3, we will
>>> need to pass a few system registers into their respective handler functions.
>>>
>>> This patch adds support for HVF to call into the TCG callbacks for GICv3
>>> system register handlers. This is safe because the GICv3 TCG code is generic
>>> as long as we limit ourselves to EL0 and EL1 - which are the only modes
>>> supported by HVF.
>>>
>>> To make sure nobody trips over that, we also annotate callbacks that don't
>>> work in HVF mode, such as EL state change hooks.
>>>
>>> With GICv3 support in place, we can run with more than 8 vCPUs.
>>>
>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>
>>> ---
>>
>>
>> Applied to target-arm.next, thanks.
> This one *also* fails 'make check'. Please can you test your
> patches before sending them?
>
> The fix is not difficult (another missing qtest_enabled() check),
> so I've squashed it in.


Sorry for the mess :(. I usually do test TCG and HVF when submitting 
these patches with various VMs, but keep forgetting about "make check". 
I'll try hard to remember next time.


Thanks,

Alex


