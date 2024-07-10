Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp147818njb;
        Tue, 9 Jul 2024 22:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVA7jun3idcxgxTmtNttG7jfb91tp1jqFfEscqbWeU8aRGqsbmyyXSZLkbN2OMyQC67Xh7qQqzoOTJ7pg4I5w5pyIUJxA0R
X-Google-Smtp-Source: AGHT+IEtDQUeGFC2Ak60rc4SbUQCH/KqeBDq5pQDVumk+COIphdYQ3TgoUGiGn2cu9pXF89m4xI3
X-Received: by 2002:a05:620a:137a:b0:795:60ba:76dd with SMTP id af79cd13be357-79f19a50848mr517297485a.34.1720588488359;
        Tue, 09 Jul 2024 22:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720588488; cv=none;
        d=google.com; s=arc-20160816;
        b=cQwnqZI4xpfdV3r26dRFlKbaq+O8wzX0vbCSB8Ht0prLpsE0LG/FzsvjXhHqw/3IFj
         8DiznKnaD1vfScB2IbjERJfJieS+bN7uXk2/QdWA3TTY9hl0jkEsk3HiOemxlOB+QFlK
         6rk0H8Tnk0+8SFJopN4KVxZxrF0EUPlBWimIeUnBLF89C/JGzrcl0sIs3Fg2eaSYH2ab
         b6pyHRMk0k6yMKg9/GN0pIeQ8EL2cZmjgEKx6ccA4ncDRb2fRTxGyNgWYrdrU0ekakc+
         E8DaXcUiJeCZv2G6y1b2MG+AP/VPgpoxDi5r1fHGhHuQceMW7bwYK6TBTeQg2O4iU5sz
         BoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=WGKYzY/sompY+EVOjeeyB0Uh5dEbqMNkFGWhl8+rybk=;
        fh=HlXKqdq9sqnOWWh2/i73W+zGek5bU6u+s7aPTOQGenY=;
        b=ze+tPrHAAeHsXEq3JCgOV5mFp+bSrHEXe1sp1U07k1xaiMlzx22Y/JTaiv8N8IMWUZ
         egltMNMXQYHk3uIipm/Qql7IBEWq+HuL+XXYvpS9b5YasukAsp17z3RYQKt4R+79ic9x
         g0sUKoHTT0X6u5l6ve5yqxHHNLBR2FF7jFnvW/Xd+iRe4VmkED5Kj8YswiNeZJjD0lDK
         slralivrVkg896hDuCrNzqcsKjlexXnwZ46dCMXuKXLjAQDCDAYKCqmt6Hn2U5nIzAWz
         77/6ziuD0r2EhM2ppQi519waAM4iQDkmujmGA/GjmAk8W8GHVLhwkF4+XxrjmcavpoFI
         4G7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190a1aa9si382280185a.311.2024.07.09.22.14.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 22:14:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRPf2-0003Up-Vh; Wed, 10 Jul 2024 01:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VgH8=OK=kaod.org=clg@ozlabs.org>)
 id 1sRPf0-0003Sg-PP; Wed, 10 Jul 2024 01:14:34 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VgH8=OK=kaod.org=clg@ozlabs.org>)
 id 1sRPey-0005DL-5t; Wed, 10 Jul 2024 01:14:34 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WJmHk6jLZz4x0n;
 Wed, 10 Jul 2024 15:14:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJmHg0qy9z4w2R;
 Wed, 10 Jul 2024 15:14:22 +1000 (AEST)
Message-ID: <ad8c95dd-f33c-4cff-a4d9-698b65c50028@kaod.org>
Date: Wed, 10 Jul 2024 07:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] aspeed: Set eMMC 'boot-config' property to reflect HW
 strapping
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-6-clg@redhat.com>
 <f50579b99ef8883dac5fcfc1606a45abfb8bf85f.camel@codeconstruct.com.au>
 <e6ca185f-3f9a-40e1-9ed2-eccfbbdf1444@redhat.com>
 <8e770030-29ab-4e30-861f-3e735b25e37b@linaro.org>
 <b606cd09-3846-4c99-b902-b0b260d91788@linaro.org>
 <6099fc9c-c7ab-46c8-86e7-bf1e37c2cd83@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <6099fc9c-c7ab-46c8-86e7-bf1e37c2cd83@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=VgH8=OK=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: o40B72qm+fyE

On 7/9/24 11:32 PM, Philippe Mathieu-Daudé wrote:
> On 5/7/24 17:52, Philippe Mathieu-Daudé wrote:
>> On 5/7/24 15:28, Philippe Mathieu-Daudé wrote:
>>> On 5/7/24 07:38, Cédric Le Goater wrote:
>>>> On 7/5/24 5:41 AM, Andrew Jeffery wrote:
>>>>> On Thu, 2024-07-04 at 07:36 +0200, Cédric Le Goater wrote:
>>>>>> From: Cédric Le Goater <clg@kaod.org>
>>>>>>
>>>>>> When the boot-from-eMMC HW strapping bit is set, use the 'boot-config'
>>>>>> property to set the boot config register to boot from the first boot
>>>>>> area partition of the eMMC device.
>>>>>>
>>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>>> ---
>>>>>>   hw/arm/aspeed.c | 15 +++++++++++----
>>>>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>>>>> index 756deb91efd1..135f4eb72215 100644
>>>>>> --- a/hw/arm/aspeed.c
>>>>>> +++ b/hw/arm/aspeed.c
>>>>>> @@ -327,7 +327,8 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>>>>>>       }
>>>>>>   }
>>>>>> -static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc)
>>>>>> +static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
>>>>>> +                               bool boot_emmc)
>>>>>>   {
>>>>>>           DeviceState *card;
>>>>>> @@ -335,6 +336,9 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc)
>>>>>>               return;
>>>>>>           }
>>>>>>           card = qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
>>>>>> +        if (emmc) {
>>>>>> +            qdev_prop_set_uint8(card, "boot-config", boot_emmc ? 0x48 : 0x0);
>>>>>
>>>>> 0x48 feels a little bit magic. I poked around a bit and there are some
>>>>> boot-config macros, but not the ones you need and they're all in an
>>>>> "internal" header anyway. I guess this is fine for now?
>>>>
>>>> You are right and we should be using these :
>>>>
>>>> hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG             179 /* R/W */
>>>
>>> This field is R/W and expected to be configured by the guest.
>>>
>>> Why the guest (u-boot) doesn't detect partitioning support?
>>>
>>> See eMMC v4.5 section 7.4.60 PARTITIONING_SUPPORT [160] and earlier
>>>
>>>    For e•MMC 4.5 Devices, Bit 2-0 in PARTITIONING_SUPPORT
>>>    shall be set to 1.
>>>
>>> We don't set it so far.
>>
>> Sorry, I wasn't grepping in the correct branch, we do set it:
>>
>>       sd->ext_csd[EXT_CSD_PARTITION_SUPPORT] = 0x3;
>>
>> I'll investigate.
> 
> Correct behavior implemented (I hope) here:
> https://lore.kernel.org/qemu-devel/20240709152556.52896-16-philmd@linaro.org/
> 
> Using it also simplifies this patch, we can squash:

I think we need both "boot-size" and "boot-config" properties to set
the associated registers, BOOT_CONFIG and BOOT_SIZE_MULT. BOOT_CONFIG
defines which devices are enabled for boot (partition 1, 2 or user area)
and BOOT_SIZE_MULT defines the size.
   
There is also a BOOT_INFO reg to define support for the alternate boot
method but I don't think we care much today.

Thanks,

C.


