Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC9CCA0FED
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 13:39:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvyYl-0003HT-SY; Tue, 09 Sep 2025 09:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uvyYk-0003Gv-Px
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 09:38:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uvyYi-0002cC-1X
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 09:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757425134;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCfFLhNPO7redaCex/Poy1qp3EAmrV+JGBSUg5AZt9U=;
 b=dt6m16EWeAAvSjdNubeWOQyLXfvyUKx18AUcQOfRTUi5qHCNSkdSCS0K16zAJ82rEBd095
 Cuya1+0nemRQzgP2m82N02oHqVRVeRzY9bj3kEqIDRUPUqs+pxMFTl1d/mjYWU55drOcet
 t4/CkP6nv1DR4WUi+g5Cm/rjhrgTpUQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-F5n5G3J5P9qIb3sbY2WwjA-1; Tue, 09 Sep 2025 09:38:50 -0400
X-MC-Unique: F5n5G3J5P9qIb3sbY2WwjA-1
X-Mimecast-MFC-AGG-ID: F5n5G3J5P9qIb3sbY2WwjA_1757425130
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3e26b5e3f41so2382573f8f.1
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 06:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757425129; x=1758029929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qCfFLhNPO7redaCex/Poy1qp3EAmrV+JGBSUg5AZt9U=;
 b=ilOgC46Iy2R0DfvS8UdFXs/RBkjjYe8FwvteZaHae9MBYHLUaT6fAZdLlXPJGUCYOs
 akJRA2zGNReJeJjmLjjlO8vNgwVFhvqSWrYByjgRnYe10cBXXaWfieh0t9XWueUXRSdS
 UCEUEeYTTCQbW/liK7nF+ycOjcAbRkzWBhSgk5/DheToUjrjrGj89DzZK3BIHWMOp/mK
 phIkX7HRElR9TtUOdIgeIb2PQqSAe6S4pZ5D+ZoqmSepC9zPTYxQRK2jktecKR7K4U09
 DGRrl6NjG6jg685anRKKy7A5tys7KjEnEXpmW9wDdRDQYjT0Q72W2t0pm6dp/ZjPvYZN
 zpZQ==
X-Gm-Message-State: AOJu0YyyjTPmdmH+dIuowvPe++Qw0SChYzh05N2hMxi0GCk3jOOEp+JY
 pbU/nUOGoOKM3ASMRajrKTJPcx8qQD7djGQ5MBRfe98WTK+s+ZI/nMrdECMEIJ7Iiv9Chi0lU+y
 fkiQ/zUhbLF6hCWhJI6WCKVWIxHzf0NWAtT6z8a9WHPNNnrAtSi7dKA==
X-Gm-Gg: ASbGncvZX0KFNRVCeGarN3FweIiWQW2h00uTxoRnXTngunOXoM9JWbOnqY6Y6zXvr2q
 lBIql6UPFgYObQyGK6oFpsmhOkO36BQUAeFHZQrummLwUqAlxqlSFCDt7I+D+5dwhqrXi+l4U8W
 bXKv6D7oEvaafOxLJgC2iHCLrrEJaMC2kmzewhs70b6ZbQDrqh1cHXDhnqtmVeBzqAWm1GSfTJI
 DdVpgVL0DSnU6FRLAQ6YApMU/6MxGE08Yf9ecPvqflUY+Wjphwqo4IXhFM3T8IoBHEmMJ14OnMy
 t2FybpwaekS4BMxRsHfqx+SeHjTtZDewcjnXKRVrOv80WOs=
X-Received: by 2002:a05:6000:1846:b0:3e7:441e:ca19 with SMTP id
 ffacd0b85a97d-3e7441ecdcemr7827666f8f.43.1757425129405; 
 Tue, 09 Sep 2025 06:38:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9dkXXVFhwORZBk4w2ioSlT+qJmbfVOuVgo5b0R2fDVnvrNqBsNSBy6VzRxKiokh9is+dUYA==
X-Received: by 2002:a05:6000:1846:b0:3e7:441e:ca19 with SMTP id
 ffacd0b85a97d-3e7441ecdcemr7827641f8f.43.1757425128943; 
 Tue, 09 Sep 2025 06:38:48 -0700 (PDT)
Received: from [192.168.43.95] ([37.167.152.186])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7521c99b9sm2890024f8f.15.2025.09.09.06.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 06:38:48 -0700 (PDT)
Message-ID: <6390b3d8-0eec-4761-8317-57337105dbb7@redhat.com>
Date: Tue, 9 Sep 2025 15:38:44 +0200
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
 <e2761aa2-1edf-42e9-97f6-e6bcedafd828@redhat.com>
 <CH3PR12MB7548BB9816DABCED39BEB667AB0CA@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548BB9816DABCED39BEB667AB0CA@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mI1DDErpEU3S0rFahZRHzufFrvOvM9xN05Jq0pYy5B0_1757425130
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 9/8/25 11:15 AM, Shameer Kolothum wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 05 September 2025 11:18
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; Nicolin Chen
>> <nicolinc@nvidia.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>;
>> ddutile@redhat.com; berrange@redhat.com; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; linuxarm@huawei.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com;
>> shameerkolothum@gmail.com; Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: Re: [RFC PATCH v3 05/15] hw/arm/smmuv3-accel: Introduce
>> smmuv3 accel device
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 9/5/25 10:22 AM, Shameer Kolothum wrote:
>>>> -----Original Message-----
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Sent: 04 September 2025 15:33
>>>> To: Nicolin Chen <nicolinc@nvidia.com>; Shameer Kolothum
>>>> <skolothumtho@nvidia.com>
>>>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>>>> peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>;
>>>> ddutile@redhat.com; berrange@redhat.com; Nathan Chen
>>>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>>>> smostafa@google.com; linuxarm@huawei.com;
>> wangzhou1@hisilicon.com;
>>>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>>>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com;
>>>> shameerkolothum@gmail.com
>>>> Subject: Re: [RFC PATCH v3 05/15] hw/arm/smmuv3-accel: Introduce
>>>> smmuv3 accel device
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 7/14/25 7:23 PM, Nicolin Chen wrote:
>>>>> On Mon, Jul 14, 2025 at 04:59:31PM +0100, Shameer Kolothum wrote:
>>>>>> Also setup specific PCIIOMMUOps for accel SMMUv3 as accel
>>>>>> SMMUv3 will have different handling for those ops callbacks in
>>>>>> subsequent patches.
>>>>>>
>>>>>> The "accel" property is not yet added, so users cannot set it at
>>>>>> this point. It will be introduced in a subsequent patch once the
>>>>>> necessary support is in place.
>>>>>>
>>>>>> Signed-off-by: Shameer Kolothum
>>>>>> <shameerali.kolothum.thodi@huawei.com>
>>>>> Overall the patch looks good to me,
>>>>> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
>>>>>
>>>>> with some nits:
>>>>>
>>>>>> @@ -61,7 +61,8 @@ arm_common_ss.add(when: 'CONFIG_ARMSSE',
>>>> if_true:
>>>>>> files('armsse.c'))
>>>>>>  arm_common_ss.add(when: 'CONFIG_FSL_IMX7', if_true:
>>>>>> files('fsl-imx7.c', 'mcimx7d-sabre.c'))
>>>>>>  arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true:
>>>>>> files('fsl-imx8mp.c'))
>>>>>>  arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true:
>>>>>> files('imx8mp-evk.c'))
>>>>>> -arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true:
>>>>>> files('smmuv3.c'))
>>>>>> +arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true:
>> files('smmuv3.c'))
>>>>>> +arm_ss.add(when: ['CONFIG_ARM_SMMUV3', 'CONFIG_IOMMUFD'],
>>>> if_true:
>>>>>> +files('smmuv3-accel.c'))
>>>>> Wondering why "arm_common_ss" is changed to "arm_ss"?
>>>> Indeed why did you need to change that?
>>> Thanks for going through the series. I will go through all the
>>> comments and rework the series soon, but a quick one on the above
>> question.
>>> I was getting this compile error as now we use #include CONFIG_DEVICES
>>> to check CONFIG_IOMMUFD
>>>
>>> .d -o libsystem_arm.a.p/hw_arm_smmuv3.c.o -c ../hw/arm/smmuv3.c In
>>> file included from ../hw/arm/smmuv3.c:35:
>>> ../hw/arm/smmuv3-accel.h:17:10: error: #include expects "FILENAME" or
>> <FILENAME>
>>>    17 | #include CONFIG_DEVICES
>>>       |          ^~~~~~~~~~~~~~
>>> ../hw/arm/smmuv3-accel.h:55:13: error: attempt to use poisoned
>> "CONFIG_ARM_SMMUV3"
>>>    55 | #if defined(CONFIG_ARM_SMMUV3) &&
>> defined(CONFIG_IOMMUFD)
>>>       |             ^
>>> ../hw/arm/smmuv3-accel.h:55:43: error: attempt to use poisoned
>> "CONFIG_IOMMUFD"
>>>    55 | #if defined(CONFIG_ARM_SMMUV3) &&
>> defined(CONFIG_IOMMUFD)
>>>       |                                           ^
>>> ninja: build stopped: subcommand failed.
>>> make[1]: *** [Makefile:168: run-ninja] Error 1
>>> make[1]: Leaving directory '/root/qemu-hisi/build'
>>>
>>> And with arm_common_ss.add, it looks like the compiler is missing
>>> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"'.
>> I guess this is because devices are arch specific so it cannot be "common"
>> anymore. Looks sensible to me. Adding Philippe in the loop.
>>
>> Unrelated to that, do you have a way to opt-out SMMUv3 HW acceleration.
>> Some people might not be interested in that feature.
> You mean a config option like ARM_SMMUV3_ACCEL to opt out during compile?
Yes that's what I meant

Eric
> Can do.
>
> Thanks,
> Shameer
>
>


