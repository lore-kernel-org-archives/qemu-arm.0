Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBA5CA1013
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 10:18:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuTWJ-0005L9-Fh; Fri, 05 Sep 2025 06:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTWH-0005K8-A7
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTWB-0006hc-77
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757067485;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRrA+QOsiR1PAdL+3JDnNQmGOjYHQX7Doou5f4c/W18=;
 b=eFHKNU47IXX9vYTp3+v8Pw44cIFHLoQu5kQLRl4t5U5Oli0qmkDOpv2/6RFJtVNimqWahT
 U171ZJmDl3/65FcfbGStAGW5xiF3afNgjG22OijCzPPojpHxbowt2cbNL+P1To6Uxv0T5h
 OdiLI/ct1AsqVRxKO+TM88USWR5ehsA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-VIi7_jTdNe-0E5P0ZNID0A-1; Fri, 05 Sep 2025 06:18:04 -0400
X-MC-Unique: VIi7_jTdNe-0E5P0ZNID0A-1
X-Mimecast-MFC-AGG-ID: VIi7_jTdNe-0E5P0ZNID0A_1757067483
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3da4c617a95so1976135f8f.0
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 03:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757067483; x=1757672283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xRrA+QOsiR1PAdL+3JDnNQmGOjYHQX7Doou5f4c/W18=;
 b=nIyqkRcOuJZLeUmTCaWxbUbY8iCmV9ML1p9WC/D5NOL3RZVVOi1EzOquQ0EbHHPlw9
 /QhDt8sXtaCY84xyMxsWPzagnLZbU7dmaujwbFUG29BvJ+gHk0faHpn8TDFwV6stqzaF
 hqcsIQVDanItr4kPdUwdJhJhIj/Bo9oEp/IA2YsLsN8YdL6eciiMNeL05OShhhkkHQyD
 FlF203QGN73+0Y4NzFdOmm/1pGRcPTl5Lze51KBrQ/zhOOsOEUKlyY5BZnHyoH2YuZmK
 vHED8fj4Oaxu5DzgqrHowGzaaRhHCJyusKsQhI9TQNUH2XjRPFXV7EcdNhibXAPUc9Fc
 86MQ==
X-Gm-Message-State: AOJu0YyzgU3sc3Otv+sOPZkPZDRY1citXt4syJI8qHImBFS1TjAckorD
 OY79RzvzrE2qPvm5wJ1gDobawcZNs0KMqS7XbwVq3OvQ9x2AmtMi55EYnMEhHZRcL7zxpRuEmyS
 mSpzR0jKYRIFJAqmG1kKJ4n3aub3dpZodtRuWfrnnzyhvSyZjOF2BKKrxWTqRwwBV
X-Gm-Gg: ASbGncukoLyPvk1TAdBQD5GyXQbqJRcpV8Pl1OhwZrSzymqWachg74JgemRJe2+ZC9O
 arbRNAPkke82L593eaPc1wqqK+MT5vtFCso7/rpJcc9oSJBGnyR5N3yIReN1NF4QDLxjeloWA+A
 SyGsWzMO4bGNLg+H31Y4GmUdvzF6PuBnJBYzhB55yvMc0JY6eYv1qAEdMppxGqVhjcc0xT1tRzr
 l1jWoU3qw9slznV5ERponkdPsK8BJg1P8XCiwcFj8uXeaoh3FtoL1g2ivnKcMw6Mr2xDnrJ4A9s
 IO3CLaX6V0yZoxLPYM4uxxRh4A6HJnytQWXWl06sEE5W9xxB9AD/amYXYGo6SzQvMakhd8hDdUM
 XTN1+e3Me3qM=
X-Received: by 2002:a05:6000:268a:b0:3da:bf6b:f2f1 with SMTP id
 ffacd0b85a97d-3dabf6bf39fmr10541435f8f.14.1757067482747; 
 Fri, 05 Sep 2025 03:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVm/1AEUdBFgvSchbkILgiTX47gyVgI/eRhvJb4sTT93GO2M0HX1aU4/aWkpc0r+3b8OlJeQ==
X-Received: by 2002:a05:6000:268a:b0:3da:bf6b:f2f1 with SMTP id
 ffacd0b85a97d-3dabf6bf39fmr10541396f8f.14.1757067482282; 
 Fri, 05 Sep 2025 03:18:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dda597641sm6868365e9.11.2025.09.05.03.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:18:01 -0700 (PDT)
Message-ID: <e2761aa2-1edf-42e9-97f6-e6bcedafd828@redhat.com>
Date: Fri, 5 Sep 2025 12:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 05/15] hw/arm/smmuv3-accel: Introduce smmuv3 accel
 device
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "shameerkolothum@gmail.com" <shameerkolothum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-6-shameerali.kolothum.thodi@huawei.com>
 <aHU9INgBsFgvtec+@Asurada-Nvidia>
 <f0473156-2e59-4467-90cc-d8315cf9063e@redhat.com>
 <CH3PR12MB754884A2F1673D1424EE8378AB03A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754884A2F1673D1424EE8378AB03A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UKcoow_pLM_VM31qwPQNFLPnnZ67DPVic9PJX9I-Cgk_1757067483
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 9/5/25 10:22 AM, Shameer Kolothum wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 04 September 2025 15:33
>> To: Nicolin Chen <nicolinc@nvidia.com>; Shameer Kolothum
>> <skolothumtho@nvidia.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>;
>> ddutile@redhat.com; berrange@redhat.com; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; linuxarm@huawei.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com;
>> shameerkolothum@gmail.com
>> Subject: Re: [RFC PATCH v3 05/15] hw/arm/smmuv3-accel: Introduce smmuv3
>> accel device
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 7/14/25 7:23 PM, Nicolin Chen wrote:
>>> On Mon, Jul 14, 2025 at 04:59:31PM +0100, Shameer Kolothum wrote:
>>>> Also setup specific PCIIOMMUOps for accel SMMUv3 as accel
>>>> SMMUv3 will have different handling for those ops callbacks in
>>>> subsequent patches.
>>>>
>>>> The "accel" property is not yet added, so users cannot set it at this
>>>> point. It will be introduced in a subsequent patch once the necessary
>>>> support is in place.
>>>>
>>>> Signed-off-by: Shameer Kolothum
>>>> <shameerali.kolothum.thodi@huawei.com>
>>> Overall the patch looks good to me,
>>> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
>>>
>>> with some nits:
>>>
>>>> @@ -61,7 +61,8 @@ arm_common_ss.add(when: 'CONFIG_ARMSSE',
>> if_true:
>>>> files('armsse.c'))
>>>>  arm_common_ss.add(when: 'CONFIG_FSL_IMX7', if_true:
>>>> files('fsl-imx7.c', 'mcimx7d-sabre.c'))
>>>>  arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true:
>>>> files('fsl-imx8mp.c'))
>>>>  arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true:
>>>> files('imx8mp-evk.c'))
>>>> -arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true:
>>>> files('smmuv3.c'))
>>>> +arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>>>> +arm_ss.add(when: ['CONFIG_ARM_SMMUV3', 'CONFIG_IOMMUFD'],
>> if_true:
>>>> +files('smmuv3-accel.c'))
>>> Wondering why "arm_common_ss" is changed to "arm_ss"?
>> Indeed why did you need to change that?
> Thanks for going through the series. I will go through all the comments and
> rework the series soon, but a quick one on the above question.
>
> I was getting this compile error as now we use #include CONFIG_DEVICES to check
> CONFIG_IOMMUFD 
>
> .d -o libsystem_arm.a.p/hw_arm_smmuv3.c.o -c ../hw/arm/smmuv3.c
> In file included from ../hw/arm/smmuv3.c:35:
> ../hw/arm/smmuv3-accel.h:17:10: error: #include expects "FILENAME" or <FILENAME>
>    17 | #include CONFIG_DEVICES
>       |          ^~~~~~~~~~~~~~
> ../hw/arm/smmuv3-accel.h:55:13: error: attempt to use poisoned "CONFIG_ARM_SMMUV3"
>    55 | #if defined(CONFIG_ARM_SMMUV3) && defined(CONFIG_IOMMUFD)
>       |             ^
> ../hw/arm/smmuv3-accel.h:55:43: error: attempt to use poisoned "CONFIG_IOMMUFD"
>    55 | #if defined(CONFIG_ARM_SMMUV3) && defined(CONFIG_IOMMUFD)
>       |                                           ^
> ninja: build stopped: subcommand failed.
> make[1]: *** [Makefile:168: run-ninja] Error 1
> make[1]: Leaving directory '/root/qemu-hisi/build'
>
> And with arm_common_ss.add, it looks like the compiler is missing
> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"'.
I guess this is because devices are arch specific so it cannot be
"common" anymore. Looks sensible to me. Adding Philippe in the loop.

Unrelated to that, do you have a way to opt-out SMMUv3 HW acceleration.
Some people might not be interested in that feature.

Eric
>
> Not sure how to fix this with arm_common_ss.add. Please let me know
> If there is a way to address this.
>
> Thanks,
> Shameer
>
>
>


