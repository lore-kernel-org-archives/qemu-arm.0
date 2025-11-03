Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9BECCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 17:17:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFyAz-0003Kc-Dj; Mon, 03 Nov 2025 12:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFyAx-0003J4-JP
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 12:17:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFyAo-0002RQ-9K
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 12:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762190208;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRbf3LoVcfrVOSx1WXqimBeXS/kyXWpNjM1dEr33kmM=;
 b=JyzEkdBFG+iRwymftT1YhBmwobzCLE7aR+3V00Gmje83CCgajQviJWm7psN1P89BLUJXlH
 1VbVPxujNtmR9viI3QIKTxWuSBvTR5FqTyw88ROuIeM1K3yGqYwyo9vpVa/7t7wdEQDRJ4
 6qqAou00Cdxxb0kvGLNfUGMLs5WV9ps=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-XjOuGcAWOUOwi5C7BkqAWA-1; Mon, 03 Nov 2025 12:16:46 -0500
X-MC-Unique: XjOuGcAWOUOwi5C7BkqAWA-1
X-Mimecast-MFC-AGG-ID: XjOuGcAWOUOwi5C7BkqAWA_1762190205
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-475da25c4c4so39384585e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 09:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762190205; x=1762795005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DRbf3LoVcfrVOSx1WXqimBeXS/kyXWpNjM1dEr33kmM=;
 b=AzMCk/6R8Rmi8RIe3m5SEmGZvfvsFylH9n2xEO0+GjgmD2UsAVp6sLZtGiPSlrQ5uz
 TYLTMpYF+0gH23tgE1FLQpKms6ves06OJ1tP/BnhyIK3hoz98/k83WYVT5pD6qEqTkAU
 I+SQjNf4emBZ082ObEkHydkM3mMT5gcenhdF7U7fs7jizsKeKLGQjqnEreE7yofblQQe
 yLCdBKa+f+ovs2EPPrnHA7MKGSn7RLs9AtH8akNr8beogC/Hr70UKUGFCDGZJ2fZLEUu
 usEeBi6doW6FePtuG7cw8DyV4pcnkjdGnL3fse3G7PR1FRdXmOTyuwQXZ4kp83FdTTNs
 xxfw==
X-Gm-Message-State: AOJu0Yzi7euyq6GTDUZQriyOh4Z9r7keSkvA9GP88Y8wQAgrtGiTX3UH
 pbrCvh6DkSx2aBs55esi2nEGHhiPxnI1QRZZpazFjFnr7O/IkmShsvMXGGv1/dly3SMUyAY6V5X
 0R4DWvz5XpRMsb5ukgVCKBp6XxhD2oLAl9dZbs9X/nHRlD4slFezLSP0t2Cuqlw==
X-Gm-Gg: ASbGncsA1e1KE9hc7Z+rVu+XXWu1qiiHK5rZ6skaf4rAJTxuBtLkoJjYJpCn33e/2jb
 HkcBDQIjbL08eR6EI8wg6/2ibrkvWECusn+HN1zJPKSbb8Lkt9TE8LRemN+mzMO2j7dXuSBrJ5i
 lQuZoRjHCb+cjPeBV4m76Ww5V2oiFqJ4Z1ln1dgtcRV+vR4O+pMyNIad9qd4oMPWWEs71DUcp1y
 b2otu7hZDeXkdDYiEj5XRfe1Y7RNdfh2e70RE/itwL/ho0k7H+J2k+JxGD49ctL+jj1JRJPm0YZ
 py8jQR+Y8aX4Byeo470SpcwtIisEipT/aqyB6fG/s5GYdt/UTTYw+Nw31tCUHuPPKHkTxo0oZ3M
 KPwEo3+2MAfCbuJozGEa5SHyIdr3Fpit4vPdWEPZgBk6ZJg==
X-Received: by 2002:a05:600c:524f:b0:471:c72:c7f8 with SMTP id
 5b1f17b1804b1-477308b6117mr130054775e9.21.1762190204994; 
 Mon, 03 Nov 2025 09:16:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeYQoGzAIioi2mvmOveqL+906lm784oVf6qho3/xtwhEyvhdEOKfQHofaM8Eg9TcUfcRfYug==
X-Received: by 2002:a05:600c:524f:b0:471:c72:c7f8 with SMTP id
 5b1f17b1804b1-477308b6117mr130054455e9.21.1762190204532; 
 Mon, 03 Nov 2025 09:16:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c1142e7dsm21585579f8f.17.2025.11.03.09.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 09:16:43 -0800 (PST)
Message-ID: <fd884771-f6ab-4524-92e7-76932469b816@redhat.com>
Date: Mon, 3 Nov 2025 18:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/32] hw/arm/smmuv3-accel: Get host SMMUv3 hw info and
 validate
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-20-skolothumtho@nvidia.com>
 <CABQgh9ENUvSJ5UiPGDbdQ_VPm5PtdFVmEM_27Z9QEb4O29cKwQ@mail.gmail.com>
 <CH3PR12MB7548CA41C51C4B6C01CDBA73ABC7A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548CA41C51C4B6C01CDBA73ABC7A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9hZpjRgejktBAnGNcHok3TX_Tc3TcXAXBupRJlc_rAQ_1762190205
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 11/3/25 4:42 PM, Shameer Kolothum wrote:
>
>> -----Original Message-----
>> From: Zhangfei Gao <zhangfei.gao@linaro.org>
>> Sent: 01 November 2025 14:20
>> To: Shameer Kolothum <skolothumtho@nvidia.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> eric.auger@redhat.com; peter.maydell@linaro.org; Jason Gunthorpe
>> <jgg@nvidia.com>; Nicolin Chen <nicolinc@nvidia.com>;
>> ddutile@redhat.com; berrange@redhat.com; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhenzhong.duan@intel.com; yi.l.liu@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>
>> Subject: Re: [PATCH v5 19/32] hw/arm/smmuv3-accel: Get host SMMUv3 hw
>> info and validate
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi, Shameer
>>
>> On Fri, 31 Oct 2025 at 18:54, Shameer Kolothum
>> <skolothumtho@nvidia.com> wrote:
>>> Just before the device gets attached to the SMMUv3, make sure QEMU
>>> SMMUv3 features are compatible with the host SMMUv3.
>>>
>>> Not all fields in the host SMMUv3 IDR registers are meaningful for
>> userspace.
>>> Only the following fields can be used:
>>>
>>>   - IDR0: ST_LEVEL, TERM_MODEL, STALL_MODEL, TTENDIAN, CD2L, ASID16,
>> TTF
>>>   - IDR1: SIDSIZE, SSIDSIZE
>>>   - IDR3: BBML, RIL
>>>   - IDR5: VAX, GRAN64K, GRAN16K, GRAN4K
>>>
>>> For now, the check is to make sure the features are in sync to enable
>>> basic accelerated SMMUv3 support.
>>>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/smmuv3-accel.c | 100
>>> ++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 100 insertions(+)
>>>
>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c index
>>> a2deda3c32..8b9f88dd8e 100644
>>> --- a/hw/arm/smmuv3-accel.c
>>> +++ b/hw/arm/smmuv3-accel.c
>>> @@ -28,6 +28,98 @@ MemoryRegion root;
>>>  MemoryRegion sysmem;
>>>  static AddressSpace *shared_as_sysmem;
>>>
>>> +static bool
>>> +smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>>> +                                 struct iommu_hw_info_arm_smmuv3 *info,
>>> +                                 Error **errp) {
>>> +    /* QEMU SMMUv3 supports architecture version 3.1 */
>>> +    if (info->aidr < s->aidr) {
>>> +        error_setg(errp, "Host SMMUv3 architecture version not compatible");
>>> +        return false;
>>> +    }
>> Why has this requirement?
> Right. That was added based on a comment from Eric here,
> https://lore.kernel.org/all/b6105534-4a17-4700-bb0b-e961babd10bb@redhat.com/
>
>> We have SMMUv3 version 3.0 and info->aidr = 0.
>> and qemu fails to boot here.
> Hmm.. It is true that there are hardware out there which implements a cross
> section of features from architecture revisions.
>
> Since we are checking the ID registers that matters here individually anyway,
> I am not sure whether we should restrict those with AIDR mismatch or just
> warn the user.
OK. Just maybe document its is irrelevant to check AIDR in the commit
msg for that reason.

With that commit msg update + removal of AIDR code feel free to take my
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric
>
> Thanks,
> Shameer
>
>
>


