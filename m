Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DA2CD4F5E
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 04:43:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPYhj-0002M8-Mr; Wed, 20 May 2026 00:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPYhd-0001on-Gx
 for qemu-arm@nongnu.org; Wed, 20 May 2026 00:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPYhT-0003xw-1T
 for qemu-arm@nongnu.org; Wed, 20 May 2026 00:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779251909;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xMby641YOdW9kytrOA6DwX49JRlCDWVNZo+mGZL9sU=;
 b=MQKr5nckQk1HfpdNWtbdavlZDBL/2lCgO2OBPpp0edsGzFN6yw14zSL4uLgRdSV5tlabB1
 MKcRQhdK6A6Wk6SrYvuTgWsDCNkEL6vGr4QdDIzXKAnlQLRsTPpP9zzt6q20ovZZEWjSoU
 XO7hi/zxYowiLERyZ8UfRl7srDB9Z2k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-Y8e57wQbNQi1Gm2EyWM_bg-1; Wed, 20 May 2026 00:38:28 -0400
X-MC-Unique: Y8e57wQbNQi1Gm2EyWM_bg-1
X-Mimecast-MFC-AGG-ID: Y8e57wQbNQi1Gm2EyWM_bg_1779251907
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-44f1b4d0fb0so2556373f8f.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 21:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779251907; x=1779856707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+xMby641YOdW9kytrOA6DwX49JRlCDWVNZo+mGZL9sU=;
 b=c+GiRLPVqkOSoDnig+cufmBt8uPkz5dSAmJYBwfwOlT3vBo9GPCkZ6dl+NM9bqm1sd
 cZOtDd47+dl0wmDZz5UX6bnCi4n7WyLGOKXy/PrXO4b+Vw1UQaIVbIqu1EamNGRLFYn6
 L1xsbU7Ec08YdVOX5n1jEXY8vW5v3rwOURoRC0OPkIPhv0Mz7j3jZYMydqS0ckARQmyL
 rOZTaP15vlTm8H2/yiBuG4lUcU5mwH1wDIbeXSAAdmlvdFNDnOHUQaxbfsR95prHOWoV
 h3roT1chVGdz6XLcrjnlYU1oP2v+QVouBLdqwYaUqKIOy07TBXae6ZGf3wRw1PEPFN4N
 3L6g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/qXT+bX24MVBYDg/3C8+6aVyWmvaCZsSDJwv304nVPP9SBpSlGbQx8JQEbL4EOvO8lXu+q/JkOaw==@nongnu.org
X-Gm-Message-State: AOJu0Yzp8j80brgyEO6K+Nk+0i7MB5w4+2iUuTh4VtflCcPt+b4NpBQJ
 Z3xl4K043m5RvBKzM/v9pbMZs5xtTvKpmIwoxqlQlVAninkwRvbh0LIWliQW4i2lTYabWgeES5y
 dw7r3UgQhk6I54YZ9empOtZ/FvjQKFfjteU6VAdY0UYSTiXg4u3BAk7P2ditzTw==
X-Gm-Gg: Acq92OHli8db8m+uDZeGMpSnav73QLvIdcOCuXgXIEbiWLCEF90jd5oILHZiKEA1/Ay
 dsk5WzkDHkk8AiM+7Zvs4ypFpjvdd89YsSj2b7Y7mXRxpFO36puzkvCudHgPI+dvPea/1afW8Bu
 wtUAd4I5LVIcAzaOcEvLPEXa5tN1R9oX7eIOczQOtytiQHZxfWw4/rwrJKKqQDIWsG3Vgh6luXv
 vKzI+OxkKokrnkSw7qujDz+vzqYb71KIAkIie2XDXGgNQtlAHU9L92fbyGynlxDSlE4a2fW2cGz
 SbMBg8Uma3RufO+Ew43syTk9GMfczMdZtCr8mjefueb9LvZ2Cob8u8oqSoCLFsiDcoyGVZx/KP7
 a29f4ZD8dT4+61FBR6TYXLHEZ3XgyD60kCUeADoMFlXqye9ZIMjKv9QdXEcAqj4LDVM5JKtrmG4
 B3dVpV
X-Received: by 2002:a05:600c:8715:b0:490:b07:5f27 with SMTP id
 5b1f17b1804b1-4900b07600fmr225077015e9.24.1779251906769; 
 Tue, 19 May 2026 21:38:26 -0700 (PDT)
X-Received: by 2002:a05:600c:8715:b0:490:b07:5f27 with SMTP id
 5b1f17b1804b1-4900b07600fmr225076805e9.24.1779251906400; 
 Tue, 19 May 2026 21:38:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c834besm399042185e9.3.2026.05.19.21.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 21:38:25 -0700 (PDT)
Message-ID: <f1141630-6f3f-4983-8f8d-9e4f08a15b68@redhat.com>
Date: Wed, 20 May 2026 06:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] qemu-options.hx: Support "auto" for accel SMMUv3
 properties
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
References: <20260512193520.3109172-1-nathanc@nvidia.com>
 <20260512193520.3109172-8-nathanc@nvidia.com>
 <0e747538-5e87-40ba-ac44-bc7bbe89bc7f@redhat.com>
 <33370934-a239-4215-87d9-2cc64648a258@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <33370934-a239-4215-87d9-2cc64648a258@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d9Mi2qYZBDOy9OmhVt9Y2wBpSuJb0GfC2QPG4tpzqU0_1779251907
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 5/19/26 10:53 PM, Nathan Chen wrote:
> Hi Eric,
>
> On 5/19/2026 9:03 AM, Eric Auger wrote:
>> Hi Nathan,
>>
>> On 5/12/26 9:35 PM, Nathan Chen wrote:
>>> From: Nathan Chen<nathanc@nvidia.com>
>>>
>>> Update documentation now that "auto" is supported for accelerated
>>> SMMUv3
>>> properties.
>>>
>>> Signed-off-by: Nathan Chen<nathanc@nvidia.com>
>>> ---
>>>   qemu-options.hx | 25 +++++++++++++++++++------
>>>   1 file changed, 19 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 96ae41f787..46b02a1bb3 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -1291,30 +1291,43 @@ SRST
>>>           Enabling accel configures the host SMMUv3 in nested mode
>>> to support
>>>           vfio-pci passthrough.
>>>   -     The following options are available when accel=on.
>>> -     Note: 'auto' mode is not currently supported.
>>> +     The following options will be set to auto by default if not
>>> manually
>>> +     set. When accel=on and these properties are set to auto, the
>>> value is
>>> +     derived from the host SMMUv3 capabilities via
>>> IOMMU_GET_HW_INFO. With
>>> +     accel=on, this requires at least one cold-plugged vfio-pci
>>> device; if
>>> +     none is present at machine init, QEMU will abort.
>>>   -    ``ril=on|off`` (default: on)
>>> +     If accel=off, auto values resolve to the non-accel defaults
>>> given below.
>> [*]
>>> +
>>> +    ``ril=on|off|auto`` (default: auto)
>>>           Support for Range Invalidation, which allows the SMMUv3
>>> driver to
>>>           invalidate TLB entries for a range of IOVAs at once
>>> instead of issuing
>>>           separate commands to invalidate each page. Must match with
>>> host SMMUv3
>>>           Range Invalidation support.
>>> +        - With accel=on, auto means the value is automatically
>>> derived from the host SMMU.
>> instead of repeating that sentence for all props you mean put it in [*]
> I would like to omit this for all props since it is already mentioned
> above "When accel=on and these properties are set to auto, the value
> is derived from the host SMMUv3 capabilities via IOMMU_GET_HW_INFO".
> Would that be OK? 

Yes then it sounds enough to me

Eric
>
> Thanks,
> Nathan
>


