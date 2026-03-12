Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF42AFED2F9
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 09:30:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0cMU-0002f9-Fe; Thu, 12 Mar 2026 05:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0cMT-0002dh-82
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 05:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0cMR-0003qr-Rd
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 05:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773307781;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qpdfgt3hdiomCm9mvelVhDEkWVBXugr6tX8/EJTTHeQ=;
 b=EHxMq89BUJGq6xtu/5vs+m2vxEqCU9eF3w8MZDhiOtQU/do7jGhfELnZhC9jDXtdMW9bGB
 K1lVUeASNYZbl5Vt8GnBLO+aJPQbAbidL84EQX4w/6MvjALtgyAQxegXnrfd2xkJ3puuht
 90bgaq5cDxJ9o45Ssx9CjUkrx4lYH04=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-MxF0zUAKPUigYwKWROYtQQ-1; Thu, 12 Mar 2026 05:29:40 -0400
X-MC-Unique: MxF0zUAKPUigYwKWROYtQQ-1
X-Mimecast-MFC-AGG-ID: MxF0zUAKPUigYwKWROYtQQ_1773307777
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4853040372fso8144835e9.1
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 02:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773307775; x=1773912575;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qpdfgt3hdiomCm9mvelVhDEkWVBXugr6tX8/EJTTHeQ=;
 b=S86XXN1vH5JgwQ6wPiuxWennn0QNOgHBiiMHs1+/BCf3y1U/ofKETq5KQMDQKVS9XQ
 de7unI23tmY9vcS6hNukykk0SdAYfchUVD1VLWjxmEgErn+sWjPQaQYjrlrFu9c6fHVE
 2BPZdn5G4Jge7aPsSZcRmY+BdUxfUxwyfhz8rAWjEDHeJqoVQy1V6XHHIXrSkfkoSfn2
 U4GDaizeY1e0AU0w4S+LTlObCKSCs7O26MWkKH1q8X5mEidP5WzRJjMK+l/2BZIjTP9F
 KIMIttfPqrAK4VcxCiPrKihYJHhi2b7+zYV+0Bzfc6/wpIBhqcCA9k3JIWrO1CbORNl9
 bnUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtvdD1Q1F7njrx17gnu9SfdYoQFifUfv7kYeyAVZxyNCRM+ToX65su5ySwBT2LLpD+ESpiywm2Uw==@nongnu.org
X-Gm-Message-State: AOJu0YxbtZtTuaVZ7Z9zF5fRD8YIYPwHlvmtUo3W9H+sEgzClXnqoZf/
 OQ92B1ryx1GPwBt3mgWwdh/IUm1xtAgzz4jTyfbHRnnnvPUNTayIPDHv1X0/SXwYJejLVaMbyhm
 IzJzCoICjW9ud1pB6P/bEEe7nTpE3WB9EqZ5B8Ws9+mJF1un8nhQIoA==
X-Gm-Gg: ATEYQzwIW1DDfI2R+KIHokZiNwxpa1l4lc+ZjCuqOBvQXpFFrPZMorCr67kq/9ocyj9
 GxX1KLGK640d8PmTxcZZ4pLJFzfu994MigNpd3p0ArKB9DmX+V2UhdhJBbPzlthFmiQ2qFgT3Ve
 u8o2x4EMIfGqqNrTufOxKROotApEwh+vz1a1jtGTdbwM/l+/nIrsOq50ssp3mmqry9QN4U70zNU
 9HYoZrWnFh6mHjlAe23YZdg6OC40YyzdjT5TNroZo1kxHDFYA4MHp7l+C3Fo9SnRdfaIIcBBV05
 WRyzYeECB4cQtaYkNefWfWqXlBwNaFCj/mjrUKVUXz7UN5zyM/bqLXw5oaA+ri8rob4IT5F2hHB
 cX+PSY0lLB1nQsGsYVzg8v9RQQ82xNUPahGDMZe6ajq8dnwIT6Pi84BvE2jnFutTkY7xrrQ==
X-Received: by 2002:a05:600c:1f0e:b0:485:35ba:1d81 with SMTP id
 5b1f17b1804b1-4854b12cee4mr93627555e9.21.1773307775457; 
 Thu, 12 Mar 2026 02:29:35 -0700 (PDT)
X-Received: by 2002:a05:600c:1f0e:b0:485:35ba:1d81 with SMTP id
 5b1f17b1804b1-4854b12cee4mr93627125e9.21.1773307774954; 
 Thu, 12 Mar 2026 02:29:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b0febd2sm40646665e9.32.2026.03.12.02.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 02:29:34 -0700 (PDT)
Message-ID: <96fe828c-bd2f-4f84-a9db-71dfcc5d1756@redhat.com>
Date: Thu, 12 Mar 2026 10:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] qdev: Add an OasMode property
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20260309192119.870186-1-nathanc@nvidia.com>
 <20260309192119.870186-8-nathanc@nvidia.com>
 <793c6796-177a-4e31-bda7-60bf2b9e1574@redhat.com>
 <480e5ab4-1574-4ef7-bfca-982bb0700423@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <480e5ab4-1574-4ef7-bfca-982bb0700423@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zbH4OJoT6v17nhq4Yd77nE_reJOdc-HK-aiDTHamp7c_1773307777
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/11/26 7:24 PM, Nathan Chen wrote:
> Hi Eric,
>
> On 3/11/2026 11:20 AM, Eric Auger wrote:
>> Hi Nathan,
>>
>> On 3/9/26 8:21 PM, Nathan Chen wrote:
>>> From: Nathan Chen<nathanc@nvidia.com>
>>>
>>> Introduce a new enum type property allowing to set an Output Address
>>> Size. Values are auto, 44, and 48, where a value of N specifies an
>>> N-bit OAS.
>>>
>>> Signed-off-by: Nathan Chen<nathanc@nvidia.com>
>>> ---
>>>   hw/core/qdev-properties-system.c         | 13 +++++++++++++
>>>   include/hw/core/qdev-properties-system.h |  3 +++
>>>   qapi/misc-arm.json                       | 16 ++++++++++++++++
>>>   3 files changed, 32 insertions(+)
>>>
>>> diff --git a/hw/core/qdev-properties-system.c
>>> b/hw/core/qdev-properties-system.c
>>> index 4aca1d4326..a805ee2e1f 100644
>>> --- a/hw/core/qdev-properties-system.c
>>> +++ b/hw/core/qdev-properties-system.c
>>> @@ -737,6 +737,19 @@ const PropertyInfo qdev_prop_ssidsize_mode = {
>>>       .set_default_value = qdev_propinfo_set_default_value_enum,
>>>   };
>>>   +/* --- OasMode --- */
>>> +
>>> +QEMU_BUILD_BUG_ON(sizeof(OasMode) != sizeof(int));
>>> +
>>> +const PropertyInfo qdev_prop_oas_mode = {
>>> +    .type = "OasMode",
>>> +    .description = "oas mode: auto, 32, 36, 40, 42, 44, 48, 52, 56",
>>> +    .enum_table = &OasMode_lookup,
>>> +    .get = qdev_propinfo_get_enum,
>>> +    .set = qdev_propinfo_set_enum,
>>> +    .set_default_value = qdev_propinfo_set_default_value_enum,
>>> +};
>>> +
>>>   /* --- Reserved Region --- */
>>>     /*
>>> diff --git a/include/hw/core/qdev-properties-system.h
>>> b/include/hw/core/qdev-properties-system.h
>>> index 4708885164..2cbea16d61 100644
>>> --- a/include/hw/core/qdev-properties-system.h
>>> +++ b/include/hw/core/qdev-properties-system.h
>>> @@ -15,6 +15,7 @@ extern const PropertyInfo qdev_prop_mig_mode;
>>>   extern const PropertyInfo qdev_prop_granule_mode;
>>>   extern const PropertyInfo qdev_prop_zero_page_detection;
>>>   extern const PropertyInfo qdev_prop_ssidsize_mode;
>>> +extern const PropertyInfo qdev_prop_oas_mode;
>>>   extern const PropertyInfo qdev_prop_losttickpolicy;
>>>   extern const PropertyInfo qdev_prop_blockdev_on_error;
>>>   extern const PropertyInfo qdev_prop_bios_chs_trans;
>>> @@ -64,6 +65,8 @@ extern const PropertyInfo
>>> qdev_prop_virtio_gpu_output_list;
>>>                          ZeroPageDetection)
>>>   #define DEFINE_PROP_SSIDSIZE_MODE(_n, _s, _f, _d) \
>>>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_ssidsize_mode,
>>> SsidSizeMode)
>>> +#define DEFINE_PROP_OAS_MODE(_n, _s, _f, _d) \
>>> +    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_oas_mode, OasMode)
>>>   #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
>>>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
>>>                           LostTickPolicy)
>>> diff --git a/qapi/misc-arm.json b/qapi/misc-arm.json
>>> index b372a3661b..76b6965502 100644
>>> --- a/qapi/misc-arm.json
>>> +++ b/qapi/misc-arm.json
>>> @@ -60,3 +60,19 @@
>>>   { 'enum': 'SsidSizeMode',
>>>     'data': [ 'auto', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
>>>               '10', '11', '12', '13', '14', '15', '16', '17', '18',
>>> '19', '20' ] }
>>> +
>>> +##
>>> +# @OasMode:
>>> +#
>>> +# SMMUv3 Output Address Size configuration mode.
>>> +#
>>> +# @auto: derive from host IOMMU capabilities
>>> +#
>>> +# @44: 44-bit output address size
>>> +#
>>> +# @48: 48-bit output address size
>>> +#
>>> +# Since: 11.0
>>> +##
>>> +{ 'enum': 'OasMode',
>>> +  'data': [ 'auto', '44', '48' ] }
>> you also miss other enum values
>
> I left out the other possible OAS values because only 44 and 48 are
> supported per the previous accel SMMUv3 series. Should we still
> include the other possible OAS values according to the SMMUv3 spec? If
> we do, we would end up hitting that check for 44 or 48 bit OAS when a
> different value is specified. 
I think we want to want to provision for all values supported by the
SMMUv3 spec

Eric
>
> Thanks,
> Nathan
>


